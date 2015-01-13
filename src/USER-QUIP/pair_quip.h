/* ----------------------------------------------------------------------
   LAMMPS - Large-scale Atomic/Molecular Massively Parallel Simulator
   http://lammps.sandia.gov, Sandia National Laboratories
   Steve Plimpton, sjplimp@sandia.gov

   Copyright (2003) Sandia Corporation.  Under the terms of Contract
   DE-AC04-94AL85000 with Sandia Corporation, the U.S. Government retains
   certain rights in this software.  This software is distributed under 
   the GNU General Public License.

   See the README file in the top-level LAMMPS directory.
------------------------------------------------------------------------- */

#ifdef PAIR_CLASS

PairStyle(quip,PairQUIP)

#else

#ifndef LMP_PAIR_QUIP_H
#define LMP_PAIR_QUIP_H

#include "pair.h"

#ifdef QUIP_GFORTRAN
extern "C" void   __quip_lammps_wrapper_module_MOD_quip_lammps_wrapper(int*, int*, int*, 
      int*, int*, int*, 
      int*, int*, double*, 
      int*, int*, double*,
      double*, double*, double*, double*, double*);
extern "C" void __quip_lammps_wrapper_module_MOD_quip_lammps_potential_initialise(int*, int*, double*, char*, int*, char*, int*);
#endif

#ifdef QUIP_IFORT_ICC
extern "C" void quip_lammps_wrapper_module_mp_quip_lammps_wrapper_ (int*, int*, int*, 
      int*, int*, int*, 
      int*, int*, double*, 
      int*, int*, double*,
      double*, double*, double*, double*, double*);
extern "C" void quip_lammps_wrapper_module_mp_quip_lammps_potential_initialise_(int*, int*, double*, char*, int*, char*, int*);
#endif


namespace LAMMPS_NS {

class PairQUIP : public Pair {
 public:
  PairQUIP(class LAMMPS *);
  ~PairQUIP();

  void compute(int, int);
  void settings(int, char **);
  void coeff(int, char **);
  void init_style();
  double init_one(int, int);
  void allocate();

 private:
  double cutoff;
  int* quip_potential;
  int n_quip_potential;
  int *map;                     // mapping from atom types to elements
  char *quip_file;                     // mapping from atom types to elements
  int n_quip_file;
  char *quip_string;                     // mapping from atom types to elements
  int n_quip_string;

};

}

#endif
#endif
