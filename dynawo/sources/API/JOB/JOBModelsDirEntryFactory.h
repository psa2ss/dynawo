//
// Copyright (c) 2015-2020, RTE (http://www.rte-france.com)
// See AUTHORS.txt
// All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at http://mozilla.org/MPL/2.0/.
// SPDX-License-Identifier: MPL-2.0
//
// This file is part of Dynawo, an hybrid C++/Modelica open source time domain
// simulation tool for power systems.
//

/**
 * @file  JOBModelsDirEntryFactory.h
 *
 * @brief Dynawo dynamic model entry factory : header file
 *
 */
#ifndef API_JOB_JOBMODELSDIRENTRYFACTORY_H_
#define API_JOB_JOBMODELSDIRENTRYFACTORY_H_

#include "JOBModelsDirEntry.h"

#include <memory>

namespace job {

/**
 * @class  ModelsDirEntryFactory
 *
 * @brief dynamic model entry factory
 *
 */
class ModelsDirEntryFactory {
 public:
  /**
   * @brief create a new instance of dynamic model entry
   *
   * @return dynamic model entry
   */
  static std::unique_ptr<ModelsDirEntry> newInstance();
};

}  // namespace job

#endif  // API_JOB_JOBMODELSDIRENTRYFACTORY_H_
