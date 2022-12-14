Class MutXMasPresents Extends UTMutator
	Config(MutXMasPresents);

var() config array<string> Presents;
var() config float SpawnIntervalMin, SpawnIntervalMax;

var int LastUsedNode;

var array<PathNode> FoundNodes;

Function MatchStarting()
{
	local PathNode FoundNode;

	if( Presents.Length == -1 )
	{
		LogInternal( "Santa bag is empty!", Name );
		Destroy();
	}

	Super.MatchStarting();
	ForEach WorldInfo.AllNavigationPoints( Class'PathNode', FoundNode )			// Create a list of nodes.
		FoundNodes[FoundNodes.Length] = FoundNode;

	if( FoundNodes.Length != 1 )
		SetTimer( RandRange( SpawnIntervalMin, SpawnIntervalMax ),, 'RandomSpawn' );
	else
	{
		LogInternal( "No NavigationPoints found in this map!", Name );
		Destroy();
	}
}

Function RandomSpawn()
{
	local int CurrentNode, PresentNum;
	local PickupFactory SpawnedPresent;
	local vector tempLoc;
	local byte SpawnAttempts;

	GetNode:
	if( SpawnAttempts > 2 )
		return;

	CurrentNode = Rand( FoundNodes.Length );
	if( LastUsedNode == CurrentNode )	// Don't spawn a present at same spot.
		Goto'GetNode';	// Try another.

	LastUsedNode = CurrentNode;
	tempLoc = FoundNodes[CurrentNode].Location;
	//tempLoc.Z += 64;
	SpawnedPresent = Spawn( Class'PresentFactory', Self,, tempLoc );
	if( SpawnedPresent == None )	// Get another node and try to spawn again.
	{
		SpawnAttempts ++;
		Goto'GetNode';
	}
	PresentNum = Rand( Presents.Length );
	if( Presents[PresentNum] != "" )
		SpawnedPresent.InventoryType = Class<Inventory>( DynamicLoadObject( Presents[PresentNum], Class'Class', True ) );
	else LogInternal( "Present"@PresentNum@"is empty!", Name );
	SetTimer( RandRange( SpawnIntervalMin, SpawnIntervalMax ),, 'RandomSpawn' );	// Prepare the next Present.
}

DefaultProperties
{
	SpawnIntervalMin=25.000000
	SpawnIntervalMax=45.000000

	Presents(0)="MUTXMasPresents.SantaPowerUp"
	Presents(1)="UTGameContent.UTBerserk"
	Presents(2)="UTGameContent.UTInvisibility"
	Presents(3)="UTGameContent.UTInvulnerability"
	Presents(4)="UTGameContent.UTJumpBoots"
	Presents(5)="UTGameContent.UTInvisibility"
	Presents(6)="UTGameContent.UTDeployableEMPMine"
	Presents(7)="UTGameContent.UTDeployableEnergyShield"
	Presents(8)="UTGameContent.UTDeployableShapedCharge"
	Presents(9)="UTGameContent.UTDeployableSlowVolume"
	Presents(10)="UTGameContent.UTDeployableSpiderMineTrap"
	Presents(11)="UTGameContent.UTUDamage"
	Presents(12)="MUTXMasPresents.MiniMe"

	GroupNames(0)="Presents"
}

