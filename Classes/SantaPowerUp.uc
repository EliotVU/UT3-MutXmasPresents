Class SantaPowerUp Extends Present;

reliable Client Function ClientGivenTo( Pawn NewOwner, bool bDoNotActivate )
{
	Super.ClientGivenTo(NewOwner,bDoNotActivate);
	if( bDoNotActivate )
		return;

	NewOwner.GroundSpeed += 220;
	NewOwner.WaterSpeed += 220;
	NewOwner.AirSpeed += 220;
	NewOwner.LadderSpeed += 220;
	NewOwner.WalkingPct *= 1.25;
	NewOwner.CrouchedPct *= 1.25;
	NewOwner.JumpZ += 120;
	UTPawn(NewOwner).MaxMultiJump += 1;
	UTPawn(NewOwner).MultiJumpRemaining += 1;
	UTPawn(NewOwner).DodgeSpeed += 220;
	UTPawn(NewOwner).DodgeSpeedZ += 120;
}

reliable client function ClientLostItem()
{
	Super.ClientLostItem();
	if( Instigator != None )
	{
		Instigator.GroundSpeed -= 220;
		Instigator.WaterSpeed -= 220;
		Instigator.AirSpeed -= 220;
		Instigator.LadderSpeed -= 220;
		Instigator.JumpZ -= 120;
		Instigator.WalkingPct *= -1.25;
		Instigator.CrouchedPct *= -1.25;
		UTPawn(Instigator).MaxMultiJump -= 1;
		UTPawn(Instigator).MultiJumpRemaining -= 1;
		UTPawn(Instigator).DodgeSpeed -= 220;
		UTPawn(Instigator).DodgeSpeedZ -= 120;
	}
}

DefaultProperties
{
}
