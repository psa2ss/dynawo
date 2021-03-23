within Dynawo.Electrical.Controls.Converters.BaseControls;

model IECWP4ALinearCommunicationWPM
  import Modelica;
  import Dynawo.Types;
  import Dynawo;

  /*Nominal Parameters*/
  parameter Types.ApparentPowerModule SNom "Nominal converter apparent power in MVA";

  /*Linear Communication Parameters*/
  parameter Types.PerUnit Tlead "Communication lead time constant";
  parameter Types.PerUnit Tlag "Communication lag time constant";
  /*Operational Parameters*/
  parameter Types.VoltageModulePu U0Pu "Start value of voltage amplitude at plant terminal (PCC) in pu (base UNom)";
  parameter Types.ActivePowerPu P0Pu "Start value of active power at PCC in pu (base SnRef) (receptor convention)";
  parameter Types.ActivePowerPu Q0Pu "Start value of reactive power at PCC in pu (base SnRef) (receptor convention)";

  Modelica.Blocks.Interfaces.RealInput pWPfiltPu(start = -P0Pu * SystemBase.SnRef / SNom) "Filtered WP reference active power" annotation(
    Placement(visible = true, transformation(origin = {-220, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-210, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput qWPfiltPu(start = -Q0Pu * SystemBase.SnRef / SNom) "Filtered WTT reactive power measurement communicated to WP (Sbase)" annotation(
    Placement(visible = true, transformation(origin = {-220, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-210, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput uWPfiltfPu(start = U0Pu) "Filtered WP voltage phasor in power system coordinates (Ubase)" annotation(
    Placement(visible = true, transformation(origin = {-220, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-210, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput omegaRefFiltPu(start = SystemBase.omegaRef0Pu) "Filtered global power system grid frequency applied for frequency measurements because angles are calculated in the corresponding stationary reference frame" annotation(
    Placement(visible = true, transformation(origin = {-220, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-210, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealOutput pWPfiltComPu(start = -P0Pu * SystemBase.SnRef / SNom) "Filtered WP reference active power transmitted to WP" annotation(
    Placement(visible = true, transformation(origin = {220, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {210, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qWPfiltComPu(start = -Q0Pu * SystemBase.SnRef / SNom) "Filtered WP reference reactive power transmitted to WP" annotation(
    Placement(visible = true, transformation(origin = {220, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {210, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput uWPfiltComPu(start = U0Pu) "Filtered WP voltage phasor in power system coordinates (Ubase) transmitted to WP" annotation(
    Placement(visible = true, transformation(origin = {220, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {210, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omegaRefFiltComPu(start = SystemBase.omegaRef0Pu) "Filtered global power system grid frequency transmitted to WP" annotation(
    Placement(visible = true, transformation(origin = {220, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {210, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Dynawo.NonElectrical.Blocks.Continuous.LeadLag leadLag(t1 = Tlead, t2 = Tlag, Y0 = -P0Pu * SystemBase.SnRef / SNom) annotation(
    Placement(visible = true, transformation(origin = {0, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.LeadLag leadLag1(t1 = Tlead, t2 = Tlag, Y0 = -Q0Pu * SystemBase.SnRef / SNom) annotation(
    Placement(visible = true, transformation(origin = {-1.9984e-15, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.LeadLag leadLag2(t1 = Tlead, t2 = Tlag, Y0 = U0Pu) annotation(
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.LeadLag leadLag3(t1 = Tlead, t2 = Tlag, Y0 = SystemBase.omegaRef0Pu) annotation(
    Placement(visible = true, transformation(origin = {-1.9984e-15, -90}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(pWPfiltPu, leadLag.u) annotation(
    Line(points = {{-220, 90}, {-24, 90}}, color = {0, 0, 127}));
  connect(leadLag.y, pWPfiltComPu) annotation(
    Line(points = {{22, 90}, {202, 90}, {202, 88}, {220, 88}}, color = {0, 0, 127}));
  connect(qWPfiltPu, leadLag1.u) annotation(
    Line(points = {{-220, 30}, {-24, 30}}, color = {0, 0, 127}));
  connect(leadLag1.y, qWPfiltComPu) annotation(
    Line(points = {{22, 30}, {220, 30}}, color = {0, 0, 127}));
  connect(uWPfiltfPu, leadLag2.u) annotation(
    Line(points = {{-220, -30}, {-24, -30}}, color = {0, 0, 127}));
  connect(leadLag2.y, uWPfiltComPu) annotation(
    Line(points = {{22, -30}, {220, -30}}, color = {0, 0, 127}));
  connect(omegaRefFiltPu, leadLag3.u) annotation(
    Line(points = {{-220, -90}, {-24, -90}}, color = {0, 0, 127}));
  connect(leadLag3.y, omegaRefFiltComPu) annotation(
    Line(points = {{22, -90}, {220, -90}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-200, 120}, {200, -120}}), Text(origin = {-36, 72}, extent = {{-112, 184}, {184, -184}}, textString = "Communication"), Text(origin = {104, -176}, extent = {{-174, 306}, {-32, 46}}, textString = "module"), Text(origin = {-126, -2}, extent = {{-66, 144}, {316, -274}}, textString = "(for WP measurements)")}, coordinateSystem(extent = {{-200, -120}, {200, 120}}, initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}})));
end IECWP4ALinearCommunicationWPM;
