Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09207475F8E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:43:39 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYJW-0005Mz-4Q
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:43:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhU-00039Q-B7; Wed, 15 Dec 2021 12:04:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46430
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhR-0004XN-2m; Wed, 15 Dec 2021 12:04:19 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfa8o020477; 
 Wed, 15 Dec 2021 17:04:11 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyhyk42mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:11 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3M8Q024988;
 Wed, 15 Dec 2021 17:04:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvyd9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH46nu34537804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D1E84C046;
 Wed, 15 Dec 2021 17:04:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE1284C040;
 Wed, 15 Dec 2021 17:04:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:05 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D5890220295;
 Wed, 15 Dec 2021 18:04:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 016/102] docs: Introducing pseries documentation.
Date: Wed, 15 Dec 2021 18:02:31 +0100
Message-Id: <20211215170357.321643-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E0TwnEoeUjmHZsmQmRQdjPZZmOfo7Cgk
X-Proofpoint-ORIG-GUID: E0TwnEoeUjmHZsmQmRQdjPZZmOfo7Cgk
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 bulkscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

The purpose of this document is to substitute the content currently
available in the QEMU wiki at [0]. This initial version does contain
some additional content as well. Whenever this documentation gets
upstream and is reflected in [1], the QEMU wiki will be edited to point
to this documentation, so that we only need to keep it updated in one
place.

0. https://wiki.qemu.org/Documentation/Platforms/POWER
1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <66b6fdde52062fdf4f4b4dc35a9f06a899c88293.1638981899.git.lagarc=
ia@br.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/system/ppc/pseries.rst | 226 ++++++++++++++++++++++++++++++++++++
 1 file changed, 226 insertions(+)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 932d4dd17d29..e46f09d4c8d7 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -1,12 +1,238 @@
 pSeries family boards (``pseries``)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+The Power machine para-virtualized environment described by the `Linux on =
Power
+Architecture Reference document (LoPAR)
+<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812=
.pdf>`_
+is called pSeries. This environment is also known as sPAPR, System p guest=
s, or
+simply Power Linux guests (although it is capable of running other operati=
ng
+systems, such as AIX).
+
+Even though pSeries is designed to behave as a guest environment, it is al=
so
+capable of acting as a hypervisor OS, providing, on that role, nested
+virtualization capabilities.
+
 Supported devices
 -----------------
=20
+ * Multi processor support for many Power processors generations: POWER7,
+   POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ ex=
ists,
+   but its state is unknown.
+ * Interrupt Controller, XICS (POWER8) and XIVE (POWER9 and Power10)
+ * vPHB PCIe Host bridge.
+ * vscsi and vnet devices, compatible with the same devices available on a
+   PowerVM hypervisor with VIOS managing LPARs.
+ * Virtio based devices.
+ * PCIe device pass through.
+
 Missing devices
 ---------------
=20
+ * SPICE support.
=20
 Firmware
 --------
+
+`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
+implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
+Configuration) Firmware: Core Requirements and Practices
+<https://standards.ieee.org/standard/1275-1994.html>`_.
+
+QEMU includes a prebuilt image of SLOF which is updated when a more recent
+version is required.
+
+Build directions
+----------------
+
+.. code-block:: bash
+
+  ./configure --target-list=3Dppc64-softmmu && make
+
+Running instructions
+--------------------
+
+Someone can select the pSeries machine type by running QEMU with the follo=
wing
+options:
+
+.. code-block:: bash
+
+  qemu-system-ppc64 -M pseries <other QEMU arguments>
+
+sPAPR devices
+-------------
+
+The sPAPR specification defines a set of para-virtualized devices, which a=
re
+also supported by the pSeries machine in QEMU and can be instantiated with=
 the
+``-device`` option:
+
+* ``spapr-vlan`` : a virtual network interface.
+* ``spapr-vscsi`` : a virtual SCSI disk interface.
+* ``spapr-rng`` : a pseudo-device for passing random number generator data=
 to the
+  guest (see the `H_RANDOM hypercall feature
+  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).
+* ``spapr-vty``: a virtual teletype.
+* ``spapr-pci-host-bridge``: a PCI host bridge.
+* ``tpm-spapr``: a Trusted Platform Module (TPM).
+* ``spapr-tpm-proxy``: a TPM proxy.
+
+These are compatible with the devices historically available for use when
+running the IBM PowerVM hypervisor with LPARs.
+
+However, since these devices have originally been specified with another
+hypervisor and non-Linux guests in mind, you should use the virtio counter=
parts
+(virtio-net, virtio-blk/scsi and virtio-rng for instance) if possible inst=
ead,
+since they will most probably give you better performance with Linux guest=
s in a
+QEMU environment.
+
+The pSeries machine in QEMU is always instantiated with the following devi=
ces:
+
+* A NVRAM device (``spapr-nvram``).
+* A virtual teletype (``spapr-vty``).
+* A PCI host bridge (``spapr-pci-host-bridge``).
+
+Hence, it is not needed to add them manually, unless you use the ``-nodefa=
ults``
+command line option in QEMU.
+
+In the case of the default ``spapr-nvram`` device, if someone wants to mak=
e the
+contents of the NVRAM device persistent, they will need to specify a PFLASH
+device when starting QEMU, i.e. either use
+``-drive if=3Dpflash,file=3D<filename>,format=3Draw`` to set the default P=
FLASH
+device, or specify one with an ID
+(``-drive if=3Dnone,file=3D<filename>,format=3Draw,id=3Dpfid``) and pass t=
hat ID to the
+NVRAM device with ``-global spapr-nvram.drive=3Dpfid``.
+
+sPAPR specification
+^^^^^^^^^^^^^^^^^^^
+
+The main source of documentation on the sPAPR standard is the `Linux on Po=
wer
+Architecture Reference document (LoPAR)
+<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812=
.pdf>`_.
+However, documentation specific to QEMU's implementation of the specificat=
ion
+can  also be found in QEMU documentation:
+
+.. toctree::
+   :maxdepth: 1
+
+   ../../specs/ppc-spapr-numa.rst
+   ../../specs/ppc-spapr-xive.rst
+
+Other documentation available in QEMU docs directory:
+
+* Hypervisor calls (a.k.a. hcalls) (``docs/specs/ppc-spapr-hcalls.txt``).
+* Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
+* Hypervisor calls needed by the Ultravisor
+  (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
+
+Switching between the KVM-PR and KVM-HV kernel module
+-----------------------------------------------------
+
+Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
+``kvm_pr.ko``.
+
+
+If a host supports both KVM modes, and both KVM kernel modules are loaded,=
 it is
+possible to switch between the two modes with the ``kvm-type`` parameter:
+
+* Use ``qemu-system-ppc64 -M pseries,accel=3Dkvm,kvm-type=3DPR`` to use the
+  ``kvm_pr.ko`` kernel module.
+* Use ``qemu-system-ppc64 -M pseries,accel=3Dkvm,kvm-type=3DHV`` to use ``=
kvm_hv.ko``
+  instead.
+
+KVM-PR
+^^^^^^
+
+KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the g=
uests,
+i.e. the virtual machine is run in user mode and all privileged instructio=
ns
+trap and have to be emulated by the host. That means you can run KVM-PR in=
side
+a pSeries guest (or a PowerVM LPAR for that matter), and that is where it =
has
+originated, as historically (prior to POWER7) it was not possible to run L=
inux
+on hypervisor mode on a Power processor (this function was restricted to
+PowerVM, the IBM proprietary hypervisor).
+
+Because all privileged instructions are trapped, guests that use a lot of
+privileged instructions run quite slow with KVM-PR. On the other hand, bec=
ause
+of that, this kernel module can run on pretty much every PPC hardware, and=
 is
+able to emulate a lot of guests CPUs. This module can even be used to run =
other
+PowerPC guests like an emulated PowerMac.
+
+As KVM-PR can be run inside a pSeries guest, it can also provide nested
+virtualization capabilities (i.e. running a guest from within a guest).
+
+It is important to notice that, as KVM-HV provides a much better execution
+performance, maintenance work has been much more focused on it in the past
+years. Maintenance for KVM-PR has been minimal.
+
+In order to run KVM-PR guests with POWER9 processors, someone will need to=
 start
+QEMU with ``kernel_irqchip=3Doff`` command line option.
+
+KVM-HV
+^^^^^^
+
+KVM-HV uses the hypervisor mode of more recent Power processors, that allow
+access to the bare metal hardware directly. Although POWER7 had this capab=
ility,
+it was only starting with POWER8 that this was officially supported by IBM.
+
+Originally, KVM-HV was only available when running on a PowerNV platform (=
a.k.a.
+Power bare metal). Although it runs on a PowerNV platform, it can only be =
used
+to start pSeries guests. As the pSeries guest doesn't have access to the
+hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV on a gu=
est.
+This limitation has been lifted, and now it is possible to run KVM-HV insi=
de
+pSeries guests as well, making nested virtualization possible with KVM-HV.
+
+As KVM-HV has access to privileged instructions, guests that use a lot of =
these
+can run much faster than with KVM-PR. On the other hand, the guest CPU has=
 to be
+of the same type as the host CPU this way, e.g. it is not possible to spec=
ify an
+embedded PPC CPU for the guest with KVM-HV. However, there is at least the
+possibility to run the guest in a backward-compatibility mode of the previ=
ous
+CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
+``-cpu POWER8,compat=3Dpower7`` as parameter to QEMU.
+
+Modules support
+---------------
+
+As noticed in the sections above, each module can run in a different
+environment. The following table shows with which environment each module =
can
+run. As long as you are in a supported environment, you can run KVM-PR or =
KVM-HV
+nested. Combinations not shown in the table are not available.
+
++--------------+------------+------+-------------------+----------+-------=
-+
+| Platform     | Host type  | Bits | Page table format | KVM-HV   | KVM-PR=
 |
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D+=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D+
+| PowerNV      | bare metal | 32   | hash              | no       | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix             | N/A      | N/A   =
 |
+|              |            +------+-------------------+----------+-------=
-+
+|              |            | 64   | hash              | yes      | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix             | yes      | no    =
 |
++--------------+------------+------+-------------------+----------+-------=
-+
+| pSeries [1]_ | PowerNV    | 32   | hash              | no       | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix             | N/A      | N/A   =
 |
+|              |            +------+-------------------+----------+-------=
-+
+|              |            | 64   | hash              | no       | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix             | yes [2]_ | no    =
 |
+|              +------------+------+-------------------+----------+-------=
-+
+|              | PowerVM    | 32   | hash              | no       | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix             | N/A      | N/A   =
 |
+|              |            +------+-------------------+----------+-------=
-+
+|              |            | 64   | hash              | no       | yes   =
 |
+|              |            |      +-------------------+----------+-------=
-+
+|              |            |      | radix [3]_        | no       | yes   =
 |
++--------------+------------+------+-------------------+----------+-------=
-+
+
+.. [1] On POWER9 DD2.1 processors, the page table format on the host and g=
uest
+   must be the same.
+
+.. [2] KVM-HV cannot run nested on POWER8 machines.
+
+.. [3] Introduced on Power10 machines.
+
+Maintainer contact information
+------------------------------
+
+C=C3=A9dric Le Goater <clg@kaod.org>
+
+Daniel Henrique Barboza <danielhb413@gmail.com>
\ No newline at end of file
--=20
2.31.1


