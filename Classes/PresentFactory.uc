Class PresentFactory Extends UTPowerupPickupFactory;

var() array<PrimitiveComponent> PresentStyles;

// Destroy when picked up and notify kismet.
Function PickedUpBy( Pawn P )
{
	TriggerEventClass(class'SeqEvent_PickupStatusChange', P, 1);

	if (P.Controller != None && P.Controller.MoveTarget == self)
	{
		P.SetAnchor(self);
		P.Controller.MoveTimer = -1.0;
	}

	Destroy();
}

// Set the mesh to an random present box and give it a relative 3DSize.
Simulated Function SetPickupMesh()
{
	local int Style;
	local vector NewScale;

	Style = Rand( PresentStyles.Length );
	PickupMesh = PresentStyles[Style];
	AttachComponent( PickupMesh );

	SetFRandScale( NewScale.X );
	SetFRandScale( NewScale.Y );
	SetFRandScale( NewScale.Z );
	PickupMesh.SetScale3D( NewScale );
}

Simulated Function SetFRandScale( out float f )
{
//	f = (0.5 + FRand()) % 1.5;

	f = RandRange( 0.25, 0.75 );

}

DefaultProperties
{
	InventoryType=Class'Present'

	bStatic=False
	bNoDelete=False

	Begin Object Class=StaticMeshComponent Name=MeshComponentA ObjName=MeshComponentA Archetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
		StaticMesh=StaticMesh'XMasPresents.Meshes.XMasSack_sm'
		CullDistance=8000.000000
		CachedCullDistance=8000.000000
		bUseAsOccluder=False
		bForceDirectLightMap=True
		bCastDynamicShadow=False
		CollideActors=False
		BlockRigidBody=False
		Translation=(X=0.000000,Y=0.000000,Z=5.000000)
	End Object

	Begin Object Class=StaticMeshComponent Name=MeshComponentB ObjName=MeshComponentB Archetype=StaticMeshComponent'Engine.Default__StaticMeshComponent'
		StaticMesh=StaticMesh'XMasPresents.Meshes.XMasBox_sm'
		CullDistance=8000.000000
		CachedCullDistance=8000.000000
		bUseAsOccluder=False
		bForceDirectLightMap=True
		bCastDynamicShadow=False
		CollideActors=False
		BlockRigidBody=False
		Translation=(X=0.000000,Y=0.000000,Z=5.000000)
	End Object

	PresentStyles(0)=MeshComponentA
	PresentStyles(1)=MeshComponentB

	Components(3)=None
	Components(4)=None
}
