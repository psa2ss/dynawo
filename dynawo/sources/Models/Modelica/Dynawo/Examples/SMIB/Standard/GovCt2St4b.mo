within Dynawo.Examples.SMIB.Standard;

/*
* Copyright (c) 2024, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source suite
* of simulation tools for power systems.
*/

model GovCt2St4b "Active power variation on the load with governor GovCT2"
  extends Icons.Example;

  // Generator and regulations
  Dynawo.Examples.BaseClasses.GeneratorSynchronousInterfaces generatorSynchronous(
    DPu = 0,
    ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad,
    H = 4,
    LDPPu = 0.2,
    LQ1PPu = 0.444231,
    LQ2PPu = 0.2625,
    LdPPu = 0.15,
    LfPPu = 0.224242,
    LqPPu = 0.15,
    MdPPu = 1.85,
    MdPPuEfd = 1,
    MqPPu = 1.65,
    MrcPPu = 0,
    MsalPu = 0.2,
    P0Pu = -3.8,
    PNomAlt = 475,
    PNomTurb = 475,
    Q0Pu = 0,
    RDPPu = 0.0303152,
    RQ1PPu = 0.00308618,
    RQ2PPu = 0.0234897,
    RTfPu = 0,
    RaPPu = 0,
    RfPPu = 0.00128379,
    SNom = 500,
    SnTfo = 500,
    U0Pu = 1,
    UBaseHV = 400,
    UBaseLV = 21,
    UNom = 21,
    UNomHV = 400,
    UNomLV = 21,
    UPhase0 = 0,
    XTfPu = 0,
    md = 0,
    mq = 0,
    nd = 0,
    nq = 0) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Dynawo.Electrical.Controls.Machines.Governors.Standard.Generic.GovCt2 governor(
    DeltaOmegaDbPu = 0,
    DeltaOmegaMaxPu = 1,
    DeltaOmegaMinPu = -1,
    DeltaT = 1,
    Dm = 0,
    KA = 10,
    KDGov = 0,
    KIGov = 0.45,
    KILoad = 1,
    KIMw = 0,
    KPGov = 4,
    KPLoad = 1,
    KTurb = 1.9168,
    PBaseMw = generatorSynchronous.PNomTurb,
    PGen0Pu = generatorSynchronous.PGen0Pu,
    PGenBaseMw = SystemBase.SnRef,
    PLdRefPu = 1,
    PLim10Pu = 0.8325,
    PLim1Pu = 0.8325,
    PLim2Pu = 0.8325,
    PLim3Pu = 0.8325,
    PLim4Pu = 0.8325,
    PLim5Pu = 0.8325,
    PLim6Pu = 0.8325,
    PLim7Pu = 0.8325,
    PLim8Pu = 0.8325,
    PLim9Pu = 0.8325,
    PRatePu = 0.017,
    Pm0Pu = generatorSynchronous.Pm0Pu,
    RClosePu = -99,
    RDownPu = -99,
    RDroop = 0.05,
    ROpenPu = 99,
    RSelectInt = 1,
    RUpPu = 99,
    ValveMaxPu = 1,
    ValveMinPu = 0.175,
    WFSpdBool = false,
    WFnlPu = 0.187,
    aSetPu = 10,
    fLim10Hz = 0,
    fLim1Hz = 49,
    fLim2Hz = 8,
    fLim3Hz = 7,
    fLim4Hz = 6,
    fLim5Hz = 5,
    fLim6Hz = 4,
    fLim7Hz = 3,
    fLim8Hz = 2,
    fLim9Hz = 1,
    tA = 1,
    tActuator = 0.4,
    tB = 0.1,
    tC = 0,
    tDGov = 1,
    tDRatelim = 0.001,
    tEngine = 0,
    tFLoad = 3,
    tLastValue = 1e-9,
    tPElec = 2.5,
    tSA = 1e-6,
    tSB = 50) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.St4b avr(
    Efd0Pu = generatorSynchronous.Efd0Pu,
    Ir0Pu = generatorSynchronous.IRotor0Pu,
    Kc = 0.113,
    Kg = 0,
    Ki = 0,
    Kim = 0,
    Kir = 10.75,
    Kp = 9.3,
    Kpm = 1,
    Kpr = 10.75,
    Thetap = 0,
    UOel0Pu = 10,
    Us0Pu = generatorSynchronous.UStator0Pu,
    UUel0Pu = 0,
    VaMaxPu = 1,
    VaMinPu = -0.87,
    Vb0Pu = 10.162168,
    VbMaxPu = 11.63,
    VmMaxPu = 99,
    VmMinPu = -99,
    VrMaxPu = 1,
    VrMinPu = -0.87,
    XlPu = 0.124,
    it0Pu = generatorSynchronous.i0Pu,
    tA = 0.02,
    tR = 0.02,
    ut0Pu = generatorSynchronous.u0Pu) annotation(
    Placement(visible = true, transformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant UPssPu(k = 0) annotation(
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant UsRefPu(k = generatorSynchronous.UStator0Pu) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(origin = {156, 80}, extent = {{4, -4}, {-4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = avr.UOel0Pu) annotation(
    Placement(visible = true, transformation(origin = {84, 66}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant OmegaRef(k = Dynawo.Electrical.SystemBase.omegaRef0Pu) annotation(
    Placement(visible = true, transformation(origin = {66, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant PGovernorRefPu(k = governor.PRef0Pu) annotation(
    Placement(visible = true, transformation(origin = {66, -40}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant constant1(k = governor.PGen0Pu * governor.PGenBaseMw / governor.PBaseMw) annotation(
    Placement(visible = true, transformation(origin = {66, -60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));

  // Load
  Dynawo.Electrical.Loads.LoadAlphaBeta load(alpha = 2, beta = 2, i0Pu(re(fixed = false), im(fixed = false)), s0Pu(re(fixed = false), im(fixed = false)), u0Pu(re(fixed = false), im(fixed = false))) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant QRefPu(k = 0) annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step PRefPu(height = 0.05 * generatorSynchronous.PNomAlt / 100, offset = 3.8, startTime = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  // Initialization
  Dynawo.Electrical.Loads.Load_INIT load_INIT(P0Pu = PRefPu.offset, Q0Pu = QRefPu.k, U0Pu = generatorSynchronous.U0Pu, UPhase0 = generatorSynchronous.UPhase0) annotation(
    Placement(transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}})));

initial algorithm
  load.i0Pu.re := load_INIT.i0Pu.re;
  load.i0Pu.im := load_INIT.i0Pu.im;
  load.s0Pu.re := load_INIT.s0Pu.re;
  load.s0Pu.im := load_INIT.s0Pu.im;
  load.u0Pu.re := load_INIT.u0Pu.re;
  load.u0Pu.im := load_INIT.u0Pu.im;

initial equation
  generatorSynchronous.omegaPu = SystemBase.omega0Pu;

equation
  generatorSynchronous.switchOffSignal1.value = false;
  generatorSynchronous.switchOffSignal2.value = false;
  generatorSynchronous.switchOffSignal3.value = false;
  load.switchOffSignal1.value = false;
  load.switchOffSignal2.value = false;
  load.deltaP = 0;
  load.deltaQ = 0;

  connect(generatorSynchronous.omegaPu, generatorSynchronous.omegaRefPu);
  connect(const.y, avr.UUelPu) annotation(
    Line(points = {{152, 80}, {110, 80}, {110, 54}, {118, 54}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(UPssPu.y, avr.UPssPu) annotation(
    Line(points = {{119, 0}, {110, 0}, {110, 50}, {118, 50}}, color = {0, 0, 127}));
  connect(UsRefPu.y, avr.UsRefPu) annotation(
    Line(points = {{61, 50}, {94, 50}, {94, 62}, {118, 62}}, color = {0, 0, 127}));
  connect(generatorSynchronous.UsPu_out, avr.UsPu) annotation(
    Line(points = {{38, 18}, {100, 18}, {100, 58}, {118, 58}}, color = {0, 0, 127}));
  connect(generatorSynchronous.uPu_out, avr.utPu) annotation(
    Line(points = {{4, 18}, {4, 30}, {152, 30}, {152, 53}, {142, 53}, {142, 52}}, color = {85, 170, 255}));
  connect(generatorSynchronous.iStatorPu_out, avr.itPu) annotation(
    Line(points = {{12, 18}, {12, 26}, {156, 26}, {156, 56}, {142, 56}}, color = {85, 170, 255}));
  connect(generatorSynchronous.IRotorPu_out, avr.IrPu) annotation(
    Line(points = {{28, 18}, {28, 80}, {100, 80}, {100, 70}, {118, 70}}, color = {0, 0, 127}));
  connect(const1.y, avr.UOelPu) annotation(
    Line(points = {{88, 66}, {118, 66}}, color = {0, 0, 127}));
  connect(avr.EfdPu, generatorSynchronous.efdPu_in) annotation(
    Line(points = {{141, 60}, {160, 60}, {160, -100}, {8, -100}, {8, -16}}, color = {0, 0, 127}));
  connect(load.terminal, generatorSynchronous.terminal) annotation(
    Line(points = {{-40, -20}, {-40, 0}, {20, 0}}, color = {0, 0, 255}));
  connect(QRefPu.y, load.QRefPu) annotation(
    Line(points = {{-20, -50}, {-34, -50}, {-34, -28}}, color = {0, 0, 127}));
  connect(PRefPu.y, load.PRefPu) annotation(
    Line(points = {{-58, -50}, {-46, -50}, {-46, -28}}, color = {0, 0, 127}));
  connect(governor.omegaRefPu, OmegaRef.y) annotation(
    Line(points = {{99, -24}, {80, -24}, {80, -20}, {73, -20}}, color = {0, 0, 127}));
  connect(generatorSynchronous.omegaPu_out, governor.omegaPu) annotation(
    Line(points = {{38, -6}, {90, -6}, {90, -32}, {99, -32}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(PGovernorRefPu.y, governor.PRefPu) annotation(
    Line(points = {{73, -40}, {99, -40}}, color = {0, 0, 127}));
  connect(constant1.y, governor.PMwSetPu) annotation(
    Line(points = {{73, -60}, {80, -60}, {80, -48}, {99, -48}}, color = {0, 0, 127}));
  connect(generatorSynchronous.PGenPu_out, governor.PGenPu) annotation(
    Line(points = {{38, 10}, {50, 10}, {50, -80}, {90, -80}, {90, -56}, {99, -56}}, color = {0, 0, 127}));
  connect(governor.PmPu, generatorSynchronous.PmPu_in) annotation(
    Line(points = {{142, -40}, {150, -40}, {150, -90}, {32, -90}, {32, -16}}, color = {0, 0, 127}));

  annotation(
    preferredView = "diagram",
    experiment(StartTime = 0, StopTime = 15, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(initialStepSize = "0.001", lv = "LOG_STATS", nls = "kinsol", s = "ida", nlsLS = "klu", maxIntegrationOrder = "2", maxStepSize = "10", emit_protected = "()"),
    Diagram(coordinateSystem(extent = {{-160, -100}, {160, 100}})),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">This test case has been created to test the GovCt2 governor model.&nbsp;</span><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">It has been derifved from&nbsp;</span>Dynawo.Examples.SMIB.Standard.GovSteam1ExcSt4b2.</div><div><br></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">It represents a synchronous machine with AVR and governor connected to a load.</span></div><div><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">A load represents a 501 MVA synchronous machine connected to an infinite bus through a transformer and a line, with&nbsp;</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">an active and reactive load between the transformer and the line.</span><span style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br><br>A load step is introduced at t=0.1 s.</span></div><div><font face=\"DejaVu Sans Mono\"><br></font></div><div><font face=\"DejaVu Sans Mono\">Below the response of generated active power, mechanical power and voltage are shown.</font></div><div><br></div><div><font face=\"DejaVu Sans Mono\">
    <figure>PGenPu:</figure><figure><img width=\"450\" src=\"modelica://Dynawo/Examples/SMIB/Resources/Images/GovCt2_PGenPu.png\"><br></figure><figure>PmPu:</figure>
    <figure>
    <img width=\"450\" src=\"modelica://Dynawo/Examples/SMIB/Resources/Images/GovCt2_PmPu.png\">
    </figure><figure>UPu:</figure>
    <figure>
    <img width=\"450\" src=\"modelica://Dynawo/Examples/SMIB/Resources/Images/GovCt2_UPu.png\">
    OmegaPu:</figure>
    <figure>
    <img width=\"450\" src=\"modelica://Dynawo/Examples/SMIB/Resources/Images/GovCt2_OmegaPu.png\">
    </figure><br></font></div></body></html>"));
end GovCt2St4b;
