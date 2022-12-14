Class MiniMe Extends Present;

var float OldScale, NewScale;

reliable Client Function ClientGivenTo( Pawn NewOwner, bool bDoNotActivate )
{
	Super.ClientGivenTo(NewOwner,bDoNotActivate);
	if( bDoNotActivate )
		return;
	OldScale = NewOwner.DrawScale;
	NewOwner.SetDrawScale( NewOwner.DrawScale*NewScale );
	NewOwner.SetCollisionSize( NewOwner.CylinderComponent.CollisionRadius*NewScale, NewOwner.CylinderComponent.CollisionHeight*NewScale );
	NewOwner.BaseEyeHeight *= NewScale;
	NewOwner.EyeHeight *= NewScale;
	NewOwner.bCanCrouch = False;
//	NewOwner.CrouchHeight *= NewScale;
//	NewOwner.CrouchRadius *= NewScale;
}

reliable client function ClientLostItem()
{
	Super.ClientLostItem();
	if( Instigator != None )
	{
		Instigator.SetDrawScale( Instigator.DrawScale*OldScale );
		Instigator.SetCollisionSize( Instigator.CylinderComponent.CollisionRadius*OldScale, Instigator.CylinderComponent.CollisionHeight*OldScale );
		Instigator.BaseEyeHeight *= OldScale;
		Instigator.EyeHeight *= OldScale;
		Instigator.bCanCrouch = True;
//		Instigator.CrouchHeight *= OldScale;
//		Instigator.CrouchRadius *= OldScale;
	}
}

DefaultProperties
{
	NewScale=0.25
}

