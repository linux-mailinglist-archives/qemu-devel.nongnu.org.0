Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E2224F07
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 14:40:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT44L-0002x4-2E
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 08:40:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hT42f-0002Hr-7t
	for qemu-devel@nongnu.org; Tue, 21 May 2019 08:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sathnaga@linux.vnet.ibm.com>) id 1hT42c-0007Zs-LV
	for qemu-devel@nongnu.org; Tue, 21 May 2019 08:38:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36094
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sathnaga@linux.vnet.ibm.com>)
	id 1hT42c-0007Yu-F4
	for qemu-devel@nongnu.org; Tue, 21 May 2019 08:38:50 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4LCbM0A114796
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 08:38:49 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2smhewg697-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 08:38:48 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <sathnaga@linux.vnet.ibm.com>;
	Tue, 21 May 2019 13:38:47 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 21 May 2019 13:38:44 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
	(b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4LCchWO49217650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 21 May 2019 12:38:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15374A405B;
	Tue, 21 May 2019 12:38:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C713A4054;
	Tue, 21 May 2019 12:38:41 +0000 (GMT)
Received: from sathnaga86.d4t-in.ibmmobiledemo.com (unknown [9.122.211.101])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Tue, 21 May 2019 12:38:41 +0000 (GMT)
Date: Tue, 21 May 2019 18:08:39 +0530
From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
References: <20190521082411.24719-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190521082411.24719-1-clg@kaod.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-TM-AS-GCONF: 00
x-cbid: 19052112-0008-0000-0000-000002E8EEE7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052112-0009-0000-0000-00002255A51D
Message-Id: <20190521123839.GA8336@sathnaga86.d4t-in.ibmmobiledemo.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-21_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905210079
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id x4LCbM0A114796
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v3] docs: provide documentation on the
 POWER9 XIVE interrupt controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 10:24:11AM +0200, C=E9dric Le Goater wrote:
> This documents the overall XIVE architecture and the XIVE support for
> sPAPR guest machines (pseries).
>=20
> It also provides documentation on the 'info pic' command.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>=20
>  Changes since v2:
>=20
>  - fixed typos.
>=20
>  Changes since v1:
>=20
>  - reorganized into different files and directories. I don't think the
>    'info pic' documentation belongs to 'interop' nor 'devel' and so
>    the ppc-spapr-xive.rst file seemed like the best place for it.
>   =20
>  docs/index.rst                |   1 +
>  docs/specs/index.rst          |  13 +++
>  docs/specs/ppc-spapr-xive.rst | 174 +++++++++++++++++++++++++++++
>  docs/specs/ppc-xive.rst       | 199 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                   |   1 +
>  5 files changed, 388 insertions(+)
>  create mode 100644 docs/specs/index.rst
>  create mode 100644 docs/specs/ppc-spapr-xive.rst
>  create mode 100644 docs/specs/ppc-xive.rst

Reviewed-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

>=20
> diff --git a/docs/index.rst b/docs/index.rst
> index 3690955dd1f5..baa5791c174b 100644
> --- a/docs/index.rst
> +++ b/docs/index.rst
> @@ -12,4 +12,5 @@ Welcome to QEMU's documentation!
> =20
>     interop/index
>     devel/index
> +   specs/index
> =20
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> new file mode 100644
> index 000000000000..2e927519c2e7
> --- /dev/null
> +++ b/docs/specs/index.rst
> @@ -0,0 +1,13 @@
> +. This is the top level page for the 'specs' manual
> +
> +
> +QEMU full-system emulation guest hardware specifications
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +Contents:
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   xive
> diff --git a/docs/specs/ppc-spapr-xive.rst b/docs/specs/ppc-spapr-xive.=
rst
> new file mode 100644
> index 000000000000..539ce7ca4e90
> --- /dev/null
> +++ b/docs/specs/ppc-spapr-xive.rst
> @@ -0,0 +1,174 @@
> +XIVE for sPAPR (pseries machines)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The POWER9 processor comes with a new interrupt controller
> +architecture, called XIVE as "eXternal Interrupt Virtualization
> +Engine". It supports a larger number of interrupt sources and offers
> +virtualization features which enables the HW to deliver interrupts
> +directly to virtual processors without hypervisor assistance.
> +
> +A QEMU ``pseries`` machine (which is PAPR compliant) using POWER9
> +processors can run under two interrupt modes:
> +
> +- *Legacy Compatibility Mode*
> +
> +  the hypervisor provides identical interfaces and similar
> +  functionality to PAPR+ Version 2.7.  This is the default mode
> +
> +  It is also referred as *XICS* in QEMU.
> +
> +- *XIVE native exploitation mode*
> +
> +  the hypervisor provides new interfaces to manage the XIVE control
> +  structures, and provides direct control for interrupt management
> +  through MMIO pages.
> +
> +Which interrupt modes can be used by the machine is negotiated with
> +the guest O/S during the Client Architecture Support negotiation
> +sequence. The two modes are mutually exclusive.
> +
> +Both interrupt mode share the same IRQ number space. See below for the
> +layout.
> +
> +CAS Negotiation
> +---------------
> +
> +QEMU advertises the supported interrupt modes in the device tree
> +property "ibm,arch-vec-5-platform-support" in byte 23 and the OS
> +Selection for XIVE is indicated in the "ibm,architecture-vec-5"
> +property byte 23.
> +
> +The interrupt modes supported by the machine depend on the CPU type
> +(POWER9 is required for XIVE) but also on the machine property
> +``ic-mode`` which can be set on the command line. It can take the
> +following values: ``xics``, ``xive``, ``dual`` and currently ``xics``
> +is the default but it may change in the future.
> +
> +The choosen interrupt mode is activated after a reconfiguration done
> +in a machine reset.
> +
> +XIVE Device tree properties
> +---------------------------
> +
> +The properties for the PAPR interrupt controller node when the *XIVE
> +native exploitation mode* is selected shoud contain:
> +
> +- ``device_type``
> +
> +  value should be "power-ivpe".
> +
> +- ``compatible``
> +
> +  value should be "ibm,power-ivpe".
> +
> +- ``reg``
> +
> +  contains the base address and size of the thread interrupt
> +  managnement areas (TIMA), for the User level and for the Guest OS
> +  level. Only the Guest OS level is taken into account today.
> +
> +- ``ibm,xive-eq-sizes``
> +
> +  the size of the event queues. One cell per size supported, contains
> +  log2 of size, in ascending order.
> +
> +- ``ibm,xive-lisn-ranges``
> +
> +  the IRQ interrupt number ranges assigned to the guest for the IPIs.
> +
> +The root node also exports :
> +
> +- ``ibm,plat-res-int-priorities``
> +
> +  contains a list of priorities that the hypervisor has reserved for
> +  its own use.
> +
> +IRQ number space
> +----------------
> +
> +IRQ Number space of the ``pseries`` machine is 8K wide and is the same
> +for both interrupt mode. The different ranges are defined as follow :
> +
> +- ``0x0000 .. 0x0FFF`` 4K CPU IPIs (only used under XIVE)
> +- ``0x1000 .. 0x1000`` 1 EPOW
> +- ``0x1001 .. 0x1001`` 1 HOTPLUG
> +- ``0x1100 .. 0x11FF`` 256 VIO devices
> +- ``0x1200 .. 0x127F`` 32 PHBs devices
> +- ``0x1280 .. 0x12FF`` unused
> +- ``0x1300 .. 0x1FFF`` PHB MSIs
> +
> +Monitoring XIVE
> +---------------
> +
> +The state of the XIVE interrupt controller can be queried through the
> +monitor commands ``info pic``. The output comes in two parts.
> +
> +First, the state of the thread interrupt context registers is dumped
> +for each CPU :
> +
> +::
> +
> +   (qemu) info pic
> +   CPU[0000]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
> +   CPU[0000]: USER    00   00  00    00   00  00  00   00  00000000
> +   CPU[0000]:   OS    00   ff  00    00   ff  00  ff   ff  80000400
> +   CPU[0000]: POOL    00   00  00    00   00  00  00   00  00000000
> +   CPU[0000]: PHYS    00   00  00    00   00  00  00   ff  00000000
> +   ...
> +
> +In the case of a ``pseries`` machine, QEMU acts as the hypervisor and =
only
> +the O/S and USER register rings make sense. ``W2`` contains the vCPU C=
AM
> +line which is set to the VP identifier.
> +
> +Then comes the routing information which aggregates the EAS and the
> +END configuration:
> +
> +::
> +
> +   ...
> +   LISN         PQ    EISN     CPU/PRIO EQ
> +   00000000 MSI --    00000010   0/6    380/16384 @1fe3e0000 ^1 [ 8000=
0010 ... ]
> +   00000001 MSI --    00000010   1/6    305/16384 @1fc230000 ^1 [ 8000=
0010 ... ]
> +   00000002 MSI --    00000010   2/6    220/16384 @1fc2f0000 ^1 [ 8000=
0010 ... ]
> +   00000003 MSI --    00000010   3/6    201/16384 @1fc390000 ^1 [ 8000=
0010 ... ]
> +   00000004 MSI -Q  M 00000000
> +   00000005 MSI -Q  M 00000000
> +   00000006 MSI -Q  M 00000000
> +   00000007 MSI -Q  M 00000000
> +   00001000 MSI --    00000012   0/6    380/16384 @1fe3e0000 ^1 [ 8000=
0010 ... ]
> +   00001001 MSI --    00000013   0/6    380/16384 @1fe3e0000 ^1 [ 8000=
0010 ... ]
> +   00001100 MSI --    00000100   1/6    305/16384 @1fc230000 ^1 [ 8000=
0010 ... ]
> +   00001101 MSI -Q  M 00000000
> +   00001200 LSI -Q  M 00000000
> +   00001201 LSI -Q  M 00000000
> +   00001202 LSI -Q  M 00000000
> +   00001203 LSI -Q  M 00000000
> +   00001300 MSI --    00000102   1/6    305/16384 @1fc230000 ^1 [ 8000=
0010 ... ]
> +   00001301 MSI --    00000103   2/6    220/16384 @1fc2f0000 ^1 [ 8000=
0010 ... ]
> +   00001302 MSI --    00000104   3/6    201/16384 @1fc390000 ^1 [ 8000=
0010 ... ]
> +
> +The source information and configuration:
> +
> +- The ``LISN`` column outputs the interrupt number of the source in
> +  range ``[ 0x0 ... 0x1FFF ]`` and its type : ``MSI`` or ``LSI``
> +- The ``PQ`` column reflects the state of the PQ bits of the source :
> +
> +  - ``--`` source is ready to take events
> +  - ``P-`` an event was sent and an EOI is PENDING
> +  - ``PQ`` an event was QUEUED
> +  - ``-Q`` source is OFF
> +
> +  a ``M`` indicates that source is *MASKED* at the EAS level,
> +
> +The targeting configuration :
> +
> +- The ``EISN`` column is the event data that will be queued in the eve=
nt
> +  queue of the O/S.
> +- The ``CPU/PRIO`` column is the tuple defining the CPU number and
> +  priority queue serving the source.
> +- The ``EQ`` column outputs :
> +
> +  - the current index of the event queue/ the max number of entries
> +  - the O/S event queue address
> +  - the toggle bit
> +  - the last entries that were pushed in the event queue.
> diff --git a/docs/specs/ppc-xive.rst b/docs/specs/ppc-xive.rst
> new file mode 100644
> index 000000000000..b997dc062910
> --- /dev/null
> +++ b/docs/specs/ppc-xive.rst
> @@ -0,0 +1,199 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +POWER9 XIVE interrupt controller
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The POWER9 processor comes with a new interrupt controller
> +architecture, called XIVE as "eXternal Interrupt Virtualization
> +Engine".
> +
> +Compared to the previous architecture, the main characteristics of
> +XIVE are to support a larger number of interrupt sources and to
> +deliver interrupts directly to virtual processors without hypervisor
> +assistance. This removes the context switches required for the
> +delivery process.
> +
> +
> +XIVE architecture
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The XIVE IC is composed of three sub-engines, each taking care of a
> +processing layer of external interrupts:
> +
> +- Interrupt Virtualization Source Engine (IVSE), or Source Controller
> +  (SC). These are found in PCI PHBs, in the PSI host bridge
> +  controller, but also inside the main controller for the core IPIs
> +  and other sub-chips (NX, CAP, NPU) of the chip/processor. They are
> +  configured to feed the IVRE with events.
> +- Interrupt Virtualization Routing Engine (IVRE) or Virtualization
> +  Controller (VC). It handles event coalescing and perform interrupt
> +  routing by matching an event source number with an Event
> +  Notification Descriptor (END).
> +- Interrupt Virtualization Presentation Engine (IVPE) or Presentation
> +  Controller (PC). It maintains the interrupt context state of each
> +  thread and handles the delivery of the external interrupt to the
> +  thread.
> +
> +::
> +
> +                XIVE Interrupt Controller
> +                +------------------------------------+      IPIs
> +                | +---------+ +---------+ +--------+ |    +-------+
> +                | |IVRE     | |Common Q | |IVPE    |----> | CORES |
> +                | |     esb | |         | |        |----> |       |
> +                | |     eas | |  Bridge | |   tctx |----> |       |
> +                | |SC   end | |         | |    nvt | |    |       |
> +    +------+    | +---------+ +----+----+ +--------+ |    +-+-+-+-+
> +    | RAM  |    +------------------|-----------------+      | | |
> +    |      |                       |                        | | |
> +    |      |                       |                        | | |
> +    |      |  +--------------------v------------------------v-v-v--+  =
  other
> +    |      <--+                     Power Bus                      +--=
> chips
> +    |  esb |  +---------+-----------------------+------------------+
> +    |  eas |            |                       |
> +    |  end |         +--|------+                |
> +    |  nvt |       +----+----+ |           +----+----+
> +    +------+       |IVSE     | |           |IVSE     |
> +                   |         | |           |         |
> +                   | PQ-bits | |           | PQ-bits |
> +                   | local   |-+           |  in VC  |
> +                   +---------+             +---------+
> +                      PCIe                 NX,NPU,CAPI
> +
> +
> +    PQ-bits: 2 bits source state machine (P:pending Q:queued)
> +    esb: Event State Buffer (Array of PQ bits in an IVSE)
> +    eas: Event Assignment Structure
> +    end: Event Notification Descriptor
> +    nvt: Notification Virtual Target
> +    tctx: Thread interrupt Context registers
> +
> +
> +
> +XIVE internal tables
> +--------------------
> +
> +Each of the sub-engines uses a set of tables to redirect interrupts
> +from event sources to CPU threads.
> +
> +::
> +
> +                                            +-------+
> +    User or O/S                             |  EQ   |
> +        or                          +------>|entries|
> +    Hypervisor                      |       |  ..   |
> +      Memory                        |       +-------+
> +                                    |           ^
> +                                    |           |
> +               +-------------------------------------------------+
> +                                    |           |
> +    Hypervisor      +------+    +---+--+    +---+--+   +------+
> +      Memory        | ESB  |    | EAT  |    | ENDT |   | NVTT |
> +     (skiboot)      +----+-+    +----+-+    +----+-+   +------+
> +                      ^  |        ^  |        ^  |       ^
> +                      |  |        |  |        |  |       |
> +               +-------------------------------------------------+
> +                      |  |        |  |        |  |       |
> +                      |  |        |  |        |  |       |
> +                 +----|--|--------|--|--------|--|-+   +-|-----+    +-=
-----+
> +                 |    |  |        |  |        |  | |   | | tctx|    |T=
hread|
> +     IPI or   ---+    +  v        +  v        +  v |---| +  .. |----->=
     |
> +    HW events    |                                 |   |       |    | =
     |
> +                 |             IVRE                |   | IVPE  |    +-=
-----+
> +                 +---------------------------------+   +-------+
> +
> +
> +The IVSE have a 2-bits state machine, P for pending and Q for queued,
> +for each source that allows events to be triggered. They are stored in
> +an Event State Buffer (ESB) array and can be controlled by MMIOs.
> +
> +If the event is let through, the IVRE looks up in the Event Assignment
> +Structure (EAS) table for an Event Notification Descriptor (END)
> +configured for the source. Each Event Notification Descriptor defines
> +a notification path to a CPU and an in-memory Event Queue, in which
> +will be enqueued an EQ data for the O/S to pull.
> +
> +The IVPE determines if a Notification Virtual Target (NVT) can handle
> +the event by scanning the thread contexts of the VCPUs dispatched on
> +the processor HW threads. It maintains the interrupt context state of
> +each thread in a NVT table.
> +
> +XIVE thread interrupt context
> +-----------------------------
> +
> +The XIVE presenter can generate four different exceptions to its
> +HW threads:
> +
> +- hypervisor exception
> +- O/S exception
> +- Event-Based Branch (user level)
> +- msgsnd (doorbell)
> +
> +Each exception has a state independent from the others called a Thread
> +Interrupt Management context. This context is a set of registers which
> +lets the thread handle priority management and interrupt
> +acknowledgment among other things. The most important ones being :
> +
> +- Interrupt Priority Register  (PIPR)
> +- Interrupt Pending Buffer     (IPB)
> +- Current Processor Priority   (CPPR)
> +- Notification Source Register (NSR)
> +
> +TIMA
> +~~~~
> +
> +The Thread Interrupt Management registers are accessible through a
> +specific MMIO region, called the Thread Interrupt Management Area
> +(TIMA), four aligned pages, each exposing a different view of the
> +registers. First page (page address ending in ``0b00``) gives access
> +to the entire context and is reserved for the ring 0 view for the
> +physical thread context. The second (page address ending in ``0b01``)
> +is for the hypervisor, ring 1 view. The third (page address ending in
> +``0b10``) is for the operating system, ring 2 view. The fourth (page
> +address ending in ``0b11``) is for user level, ring 3 view.
> +
> +Interrupt flow from an O/S perspective
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +After an event data has been enqueued in the O/S Event Queue, the IVPE
> +raises the bit corresponding to the priority of the pending interrupt
> +in the register IBP (Interrupt Pending Buffer) to indicate that an
> +event is pending in one of the 8 priority queues. The Pending
> +Interrupt Priority Register (PIPR) is also updated using the IPB. This
> +register represent the priority of the most favored pending
> +notification.
> +
> +The PIPR is then compared to the the Current Processor Priority
> +Register (CPPR). If it is more favored (numerically less than), the
> +CPU interrupt line is raised and the EO bit of the Notification Source
> +Register (NSR) is updated to notify the presence of an exception for
> +the O/S. The O/S acknowledges the interrupt with a special load in the
> +Thread Interrupt Management Area.
> +
> +The O/S handles the interrupt and when done, performs an EOI using a
> +MMIO operation on the ESB management page of the associate source.
> +
> +Overview of the QEMU models for XIVE
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The XiveSource models the IVSE in general, internal and external. It
> +handles the source ESBs and the MMIO interface to control them.
> +
> +The XiveNotifier is a small helper interface interconnecting the
> +XiveSource to the XiveRouter.
> +
> +The XiveRouter is an abstract model acting as a combined IVRE and
> +IVPE. It routes event notifications using the EAS and END tables to
> +the IVPE sub-engine which does a CAM scan to find a CPU to deliver the
> +exception. Storage should be provided by the inheriting classes.
> +
> +XiveEnDSource is a special source object. It exposes the END ESB MMIOs
> +of the Event Queues which are used for coalescing event notifications
> +and for escalation. Not used on the field, only to sync the EQ cache
> +in OPAL.
> +
> +Finally, the XiveTCTX contains the interrupt state context of a thread=
,
> +four sets of registers, one for each exception that can be delivered
> +to a CPU. These contexts are scanned by the IVPE to find a matching VP
> +when a notification is triggered. It also models the Thread Interrupt
> +Management Area (TIMA), which exposes the thread context registers to
> +the CPU for interrupt management.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9424a490d647..82ac0415b493 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1708,6 +1708,7 @@ L: qemu-ppc@nongnu.org
>  S: Supported
>  F: hw/*/*xive*
>  F: include/hw/*/*xive*
> +F: docs/*/*xive*
> =20
>  Subsystems
>  ----------
> --=20
> 2.20.1
>=20
>=20


