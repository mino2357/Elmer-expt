SUBROUTINE GrayScottSolver( Model,Solver,dt,TransientSimulation )
!DEC$ATTRIBUTES DLLEXPORT :: GrayScottSolver
!------------------------------------------------------------------------------
!******************************************************************************
!
!  Solve the GrayScott equation!
!
!  ARGUMENTS:
!
!  TYPE(Model_t) :: Model,  
!     INPUT: All model information (mesh, materials, BCs, etc...)
!
!  TYPE(Solver_t) :: Solver
!     INPUT: Linear & nonlinear equation solver options
!
!  REAL(KIND=dp) :: dt,
!     INPUT: Timestep size for time dependent simulations
!
!  LOGICAL :: TransientSimulation
!     INPUT: Steady state or transient simulation
!
!******************************************************************************
  USE DefUtils

  IMPLICIT NONE
!------------------------------------------------------------------------------
  TYPE(Solver_t) :: Solver
  TYPE(Model_t) :: Model

  REAL(KIND=dp) :: dt
  LOGICAL :: TransientSimulation
!------------------------------------------------------------------------------
! Local variables
!------------------------------------------------------------------------------
  LOGICAL :: AllocationsDone = .FALSE., Found
  TYPE(Element_t),POINTER :: Element

  REAL(KIND=dp) :: Norm
  INTEGER :: n, nb, nd, t, istat

  TYPE(ValueList_t), POINTER :: BodyForce, Material
  REAL(KIND=dp), ALLOCATABLE :: STIFF(:,:), LOAD(:), FORCE(:), MASS(:,:)

  REAL(KIND=dp), ALLOCATABLE :: CoeffF(:), CoeffK(:), &
           DiffU(:), DiffV(:), Solution(:,:)

  SAVE MASS, STIFF, LOAD, FORCE, AllocationsDone, CoeffF, CoeffK, &
    DiffU, DiffV, Solution
!------------------------------------------------------------------------------

  !Allocate some permanent storage, this is done first time only:
  !--------------------------------------------------------------
  IF ( .NOT. AllocationsDone ) THEN
     N = 2*Solver % Mesh % MaxElementDOFs  ! just big enough for elemental arrays
     ALLOCATE( FORCE(N), LOAD(N), STIFF(N,N), MASS(N,N), STAT=istat )

     ALLOCATE( CoeffF(N),  stat=istat )
     ALLOCATE( CoeffK(N),  stat=istat )
     ALLOCATE( DiffU(N),   stat=istat )
     ALLOCATE( DiffV(N),   stat=istat )
     ALLOCATE( Solution(2,1:N), stat=istat )

     IF ( istat /= 0 ) THEN
        CALL Fatal( 'GrayScottSolve', 'Memory allocation error.' )
     END IF
     AllocationsDone = .TRUE.
  END IF

   !System assembly:
   !----------------
   CALL DefaultInitialize()
   DO t=1,Solver % NumberOfActiveElements
     Element => GetActiveElement(t)
     n  = GetElementNOFNodes()
     nd = GetElementNOFDOFs()

     CALL GetVectorLocalSolution( Solution )

     Material => GetMaterial()
     CoeffF(1:nd)   = GetReal( Material, 'F' )
     CoeffK(1:nd)   = GetReal( Material, 'K' )
     DiffU(1:nd)    = GetReal( Material, 'du' )
     DiffV(1:nd)    = GetReal( Material, 'dv' )

     ! Get element local matrix and rhs vector:
     ! ----------------------------------------
     CALL LocalMatrix(  MASS, STIFF, FORCE, LOAD, Element, n, nd )

     IF ( TransientSimulation ) CALL Default1stOrderTime( MASS, STIFF, FORCE )
     CALL DefaultUpdateEquations( STIFF, FORCE )
   END DO
   CALL DefaultFinishAssembly()
   CALL DefaultDirichletBCs()


   ! And finally, solve:
   !--------------------
   Norm = DefaultSolve()

CONTAINS

!------------------------------------------------------------------------------
  SUBROUTINE LocalMatrix(  MASS, STIFF, FORCE, LOAD, Element, n, nd )
!------------------------------------------------------------------------------
    REAL(KIND=dp), TARGET :: MASS(:,:), STIFF(:,:), FORCE(:), LOAD(:)
    INTEGER :: n, nd
    TYPE(Element_t), POINTER :: Element
!------------------------------------------------------------------------------
    REAL(KIND=dp) :: Basis(nd),dBasisdx(nd,3),DetJ,LoadAtIP
    LOGICAL :: Stat
    INTEGER :: i,j,t,p,q,dim
    REAL(KIND=dp), POINTER :: M(:,:), A(:,:), F(:)
    TYPE(GaussIntegrationPoints_t) :: IP

    REAL(KIND=dp) :: du,dv,uprev,vprev,FF,KK, s, Base, Grad

    TYPE(Nodes_t) :: Nodes
    SAVE Nodes
!------------------------------------------------------------------------------
    dim = CoordinateSystemDimension()

    CALL GetElementNodes( Nodes )
    MASS  = 0.0d0
    STIFF = 0.0d0
    FORCE = 0.0d0

    ! Numerical integration:
    ! ----------------------
    IP = GaussPoints( Element )
    DO t=1,IP % n
      ! Basis function values & derivatives at the integration point:
      !--------------------------------------------------------------
      stat = ElementInfo( Element, Nodes, IP % U(t), IP % V(t), &
            IP % W(t), detJ, Basis, dBasisdx )

      s = IP % s(t) * DetJ

      du = SUM( Basis(1:nd) * DiffU(1:nd) )
      dv = SUM( Basis(1:nd) * DiffV(1:nd) )
      FF = SUM( Basis(1:nd) * CoeffF(1:nd) )
      KK = SUM( Basis(1:nd) * CoeffK(1:nd) )

      uprev = SUM( Basis(1:nd) * Solution( 1,1:nd ) )
      vprev = SUM( Basis(1:nd) * Solution( 2,1:nd ) )

      ! Finally, the elemental matrix & vector:
      !----------------------------------------
     DO p=1,nd
       DO q=1,nd
         i = 2*(p-1)+1
         j = 2*(q-1)+1
         M =>  MASS(i:i+1, j:j+1)
         A => STIFF(i:i+1, j:j+1)

         Base = s * Basis(q) * Basis(p)
         Grad = s * SUM( dBasisdx(q,:) * dBasisdx(p,:) )

         M(1,1) = M(1,1) + Base
         M(2,2) = M(2,2) + Base
         A(1,1) = A(1,1) + du * Grad  - (uprev * vprev * vprev) * Base + FF * (1.0 - uprev) * Base
         A(1,2) = A(1,2)
         A(2,1) = A(2,1)
         A(2,2) = A(2,2) + dv * Grad  + (uprev * vprev * vprev) * Base - vprev * (FF + KK) * Base
       END DO
       i = 2*(p-1)+1
       F => FORCE(i:i+1)
       F(1) = F(1) ! - s * (uprev * vprev * vprev - FF * (1.0 - uprev)) * Basis(p)
       F(2) = F(2) ! + s * (uprev * vprev * vprev - vprev * (FF + KK)) * Basis(p)
     END DO
    END DO
!------------------------------------------------------------------------------
  END SUBROUTINE LocalMatrix
!------------------------------------------------------------------------------

!------------------------------------------------------------------------------
END SUBROUTINE GrayScottSolver
!------------------------------------------------------------------------------
