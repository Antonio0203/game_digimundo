class DigimonModel {
  final String name;
  final String portraitAsset;
  final String baseRunAsset;
  final String baseAttackAsset;
  final String evoName;
  final String evoRunAsset;
  final String evoAttackAsset;

  DigimonModel({
    required this.name,
    required this.portraitAsset,
    required this.baseRunAsset,
    required this.baseAttackAsset,
    required this.evoName,
    required this.evoRunAsset,
    required this.evoAttackAsset,
  });

  static List<DigimonModel> get list => [
        DigimonModel(
          name: 'Guilmon',
          portraitAsset: 'assets/images/guilmon_portrait.png',
          baseRunAsset: 'assets/images/guilmon_run.png',
          baseAttackAsset: 'assets/images/guilmon_attack.png',
          evoName: 'Growmon',
          evoRunAsset: 'assets/images/growmon_run.png',
          evoAttackAsset: 'assets/images/growmon_attack.png',
        ),
        DigimonModel(
          name: 'Renamon',
          portraitAsset: 'assets/images/renamon_portrait.png',
          baseRunAsset: 'assets/images/renamon_run.png',
          baseAttackAsset: 'assets/images/renamon_attack.png',
          evoName: 'Kyubimon',
          evoRunAsset: 'assets/images/kyubimon_run.png',
          evoAttackAsset: 'assets/images/kyubimon_attack.png',
        ),
        DigimonModel(
          name: 'Terriermon',
          portraitAsset: 'assets/images/terriermon_portrait.png',
          baseRunAsset: 'assets/images/terriermon_run.png',
          baseAttackAsset: 'assets/images/terriermon_attack.png',
          evoName: 'Gargomon',
          evoRunAsset: 'assets/images/gargomon_run.png',
          evoAttackAsset: 'assets/images/gargomon_attack.png',
        ),
      ];
}