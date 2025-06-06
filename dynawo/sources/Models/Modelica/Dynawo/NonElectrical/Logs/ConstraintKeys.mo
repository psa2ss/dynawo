within Dynawo.NonElectrical.Logs;

/*
* Copyright (c) 2021, RTE (http://www.rte-france.com)
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

encapsulated package ConstraintKeys

  final constant Integer OverloadOpen = 0;
  final constant Integer OverloadOpenCLA = 1;
  final constant Integer OverloadUp = 2;
  final constant Integer OverloadUpCLA = 3;
  final constant Integer PATL = 4;
  final constant Integer UInfUmin = 5;
  final constant Integer USupUmax = 6;
  final constant Integer UsMax = 7;
  final constant Integer UsMin = 8;

  annotation(preferredView = "text");
end ConstraintKeys;
