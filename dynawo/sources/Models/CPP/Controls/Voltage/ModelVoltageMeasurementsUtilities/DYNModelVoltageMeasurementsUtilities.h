//
// Copyright (c) 2022, RTE (http://www.rte-france.com)
// See AUTHORS.txt
// All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at http://mozilla.org/MPL/2.0/.
// SPDX-License-Identifier: MPL-2.0
//
// This file is part of Dynawo, an hybrid C++/Modelica open source suite of simulation tools
// for power systems.
//

/**
 * @file  DYNModelVoltageMeasurementsUtilities.h
 *
 * @brief model for voltage aggregating voltage values on a local subnetworks
 *
 */

#ifndef MODELS_CPP_CONTROLS_VOLTAGE_MODELVOLTAGEMEASUREMENTSUTILITIES_DYNMODELVOLTAGEMEASUREMENTSUTILITIES_H_
#define MODELS_CPP_CONTROLS_VOLTAGE_MODELVOLTAGEMEASUREMENTSUTILITIES_DYNMODELVOLTAGEMEASUREMENTSUTILITIES_H_

#include "DYNModelCPP.h"
#include "DYNModelConstants.h"
#include "DYNSubModelFactory.h"

namespace DYN {
class DataInterface;

/**
 * @brief ModelVoltageMeasurementsUtilitiesFactory factory
 *
 * Implementation of @p SubModelFactory template for
 * ModelVoltageMeasurementsUtilitiesFactory model
 */
class ModelVoltageMeasurementsUtilitiesFactory : public SubModelFactory {
 public:
  /**
   * @brief default constructor
   *
   */
  ModelVoltageMeasurementsUtilitiesFactory() {}

  /**
   * @brief default destructor
   *
   */
  virtual ~ModelVoltageMeasurementsUtilitiesFactory() {}

  /**
   * @brief ModelVoltageMeasurementsUtilitiesFactory getter
   *
   * @return A pointer to a new instance of ModelVoltageMeasurementsUtilitiesFactory
   */
  SubModel *create() const;

  /**
   * @brief ModelVoltageMeasurementsUtilitiesFactory destroy
   */
  void destroy(SubModel *) const;
};

/**
 * @brief Voltage measurement utilities model class
 *
 * This model connects to a dynamic number of buses and outputs some interesting
 * values computed from the input voltage levels.
 * Outputs currently included:
 * -> Minimum voltage level
 * -> Maximum voltage level
 * -> Average voltage level
 */
class ModelVoltageMeasurementsUtilities : public ModelCPP {
 public:
  /**
   * @brief define type of calculated variables
   *
   */
  typedef enum {
    minValIdx_ = 0,
    maxValIdx_,
    avgValIdx_,
    nbCalculatedVars_
  } CalculatedVars_t;

  /**
   * @brief define indexing of discrete variables
   * This list may be updated if the class increases in complexity.
   *
   */
  typedef enum {
    tLastUpdate_ = 0,
    nbDiscreteVars_
  } DiscreteVars_t;

    /**
   * @brief define indexing of root variables
   *
   */
  typedef enum {
    // minChangedLoc_ = 0,
    // maxChangedLoc_ = 1,
    timeToUpdate_ = 0,
    // connectionUpdated_ = 3,
    nbRoots_
  } RootVars_t;

  /**
   * @brief ModelVoltageMeasurementsUtilities model default constructor
   *
   *
   */
  ModelVoltageMeasurementsUtilities();

  /**
   * @brief ModelVoltageMeasurementsUtilities model default destructor
   *
   *
   */
  ~ModelVoltageMeasurementsUtilities() { }

  /**
   * @brief ModelVoltageMeasurementsUtilities model initialization
   * @param t0 : initial time of the simulation
   */
  void init(const double t0);

  /**
   * @brief ModelVoltageMeasurementsUtilities model's sizes getter
   *
   * Get the sizes of the vectors and matrices used by the solver to simulate
   * ModelVoltageMeasurementsUtilities instance. Used by @p ModelMulti to generate right size matrices
   * and vector for the solver.
   */
  void getSize();

  /**
   * @brief ModelVoltageMeasurementsUtilities F(t,y,y') function evaluation
   *
   * Get the residues' values at a certain instant time with given state variables,
   * state variables derivatives
   *
   * @param t Simulation instant
   * @param[in] type type of the residues to compute (algebraic, differential or both)
   */
  void evalF(double t, propertyF_t type);

  /**
   * @brief ModelVoltageMeasurementsUtilities G(t,y,y') function evaluation
   *
   * Get the root's value
   *
   * @param t Simulation instant
   */
  void evalG(const double t);

  /**
   * @brief ModelVoltageMeasurementsUtilities discrete variables evaluation
   *
   * Get the discrete variables' value depending on current simulation instant and
   * current state variables values.
   *
   * @param t Simulation instant
   */
  void evalZ(const double t);

  /**
   * @brief set the silent flag for discrete variables
   * @param silentZTable flag table
   */
  void collectSilentZ(BitMask* silentZTable);

  /**
   * @copydoc ModelCPP::evalMode(const double t)
   */
  modeChangeType_t evalMode(const double t);

  /**
   * @brief ModelVoltageMeasurementsUtilities transposed jacobian evaluation
   *
   * Get the sparse transposed jacobian \f$ Jt=@F/@y + cj*@F/@y' \f$
   *
   * @param t Simulation instant
   * @param cj Jacobian prime coefficient
   * @param jt jacobian matrix to fullfill
   * @param rowOffset offset to use to identify the row where data should be added
   */
  void evalJt(const double t, const double cj, SparseMatrix& jt, const int rowOffset);

  /**
   * @brief  ModelVoltageMeasurementsUtilities transposed jacobian evaluation
   *
   * Get the sparse transposed jacobian \f$ Jt=@F/@y' \f$
   *
   * @param t Simulation instant
   * @param cj Jacobian prime coefficient
   * @param jt jacobian matrix to fullfill
   * @param rowOffset offset to use to identify the row where data should be added
   */
  void evalJtPrim(const double t, const double cj, SparseMatrix& jt, const int rowOffset);

  /**
   * @brief calculate calculated variables
   */
  void evalCalculatedVars();

  /**
   * @copydoc ModelCPP::evalStaticFType()
   */
  void evalStaticFType();

  /**
   * @copydoc ModelCPP::evalDynamicFType()
   */
  void evalDynamicFType() { /* not needed */}

  /**
   * @copydoc ModelCPP::getY0()
   */
  void getY0();

  /**
   * @copydoc ModelCPP::evalStaticYType()
   */
  void evalStaticYType();

  /**
   * @copydoc ModelCPP::evalDynamicYType()
   */
  void evalDynamicYType() { /* not needed */}

  /**
   * @brief get the index of variables used to define the jacobian associated to a calculated variable
   *
   * @param iCalculatedVar index of the calculated variable
   * @param indexes vector to fill with the indexes
   */
  void getIndexesOfVariablesUsedForCalculatedVarI(unsigned iCalculatedVar, std::vector<int>& indexes) const;

  /**
   * @brief evaluate the jacobian associated to a calculated variable
   *
   * @param iCalculatedVar index of the calculated variable
   * @param res values of the jacobian
   */
  void evalJCalculatedVarI(unsigned iCalculatedVar, std::vector<double>& res)const;

  /**
   * @brief evaluate the value of a calculated variable
   *
   * @param iCalculatedVar index of the calculated variable
   *
   * @return value of the calculated variable
   */
  double evalCalculatedVarI(unsigned iCalculatedVar) const;

  /**
   * @brief ModelVoltageMeasurementsUtilities parameters setter
   */
  void setSubModelParameters();

  /**
   * @brief ModelVoltageMeasurementsUtilities elements initializer
   *
   * Define elements for this model( elements to be seen by other models)
   *
   * @param elements  Reference to elements' vector
   * @param mapElement Map associating each element index in the elements vector to its name
   */
  void defineElements(std::vector<Element> &elements, std::map<std::string, int>& mapElement);

  /**
   * @copydoc SubModel::dumpUserReadableElementList()
   */
  void dumpUserReadableElementList(const std::string& nameElement) const;

  /**
   * @brief initialize variables of the model
   *
   * A variable is a structure which contains all information needed to interact with the model
   * @param variables vector to fill with each variables
   */
  void defineVariables(std::vector<boost::shared_ptr<Variable> >& variables);

  /**
   * @brief define parameters
   * @param parameters vector to fill with each parameters
   */
  void defineParameters(std::vector<ParameterModeler>& parameters);

  /**
   * @brief get check sum number
   * @return the check sum number associated to the model
   */
  std::string getCheckSum() const;

  /**
   * @copydoc ModelCPP::initializeStaticData()
   */
  void initializeStaticData() { /* not needed */ }

  /**
   * @copydoc ModelCPP::initializeFromData(const boost::shared_ptr<DataInterface> &data)
   */
  void initializeFromData(const boost::shared_ptr<DataInterface>& data);

  /**
   * @copydoc ModelCPP::setFequations()
   */
  void setFequations();

  /**
   * @copydoc ModelCPP::setGequations()
   */
  void setGequations() { /* not needed */ }

  /**
   * @copydoc ModelCPP::initParams()
   */
  void initParams() { /* not needed */ }

  /**
   * @copydoc ModelCPP::checkDataCoherence(const double t)
   */
  void checkDataCoherence(const double t);

  /**
   * @copydoc SubModel::hasDataCheckCoherence() const
   */
  bool hasCheckDataCoherence() const { return true; }

 private:
   /**
    * @brief gets the minimum value of the (connected and active) input voltages
    */
  double computeMin(unsigned int &minIdx) const;

  /**
   * @brief gets the maximum value of the (connected and active) input voltages
   */
  double computeMax(unsigned int &maxIdx) const;

  /**
   * @brief gets the average value of the (connected and active) input voltages
   */
  double computeAverage(unsigned int &nbActive) const;

  /**
   * @brief returns whether or not an input is actively connected
   */
  bool isRunning(unsigned int inputIdx) const;

  /**
   * @brief initializes all attributes and important variables.
   * @param t the time of initialization.
   */
  void initializeVMU(const double t = 0.0);

 private:
  unsigned int nbConnectedInputs_;  ///< Number of active inputs (external parameter)
  unsigned int nbActive_;  ///< Keeps track of how many components are indeed connected at a given time.
  unsigned int achievedMin_;  ///< Keeps track of where the min is coming from.
  unsigned int achievedMax_;  ///< Keeps track of where the max is coming from.
  double lastMin_;  ///< Keeps track of latest updated min.
  double lastMax_;  ///< Keeps track of latest updated min.
  double lastAverage_;  ///< Keeps track of latest updated average.
  double step_;  ///< step in seconds between two updates of the utilities computations. (external parameter)
  bool isInitialized_;  ///< is True if a first initialization of the model has been made; false until first update.
  bool* isActive_;  ///< keeps track of which asset was active at last update.
};

}  // namespace DYN

#endif  // MODELS_CPP_CONTROLS_VOLTAGE_MODELVOLTAGEMEASUREMENTSUTILITIES_DYNMODELVOLTAGEMEASUREMENTSUTILITIES_H_