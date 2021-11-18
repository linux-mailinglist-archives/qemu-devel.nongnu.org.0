Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6F45577D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 09:58:32 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mndFW-0004VX-RT
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 03:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mndED-0003Yy-TL; Thu, 18 Nov 2021 03:57:09 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:52911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mndE9-0007cI-Ut; Thu, 18 Nov 2021 03:57:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id ABEE3CC4ACA1;
 Thu, 18 Nov 2021 09:57:03 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 18 Nov
 2021 09:57:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00660791939-3c8d-4bd3-b182-4d86ce58e847,
 4A6ABDF66DC85A3D00A6C17CB73E494911F6EB6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.55.24.82
Message-ID: <79447f84-c2b9-0841-18c1-785e53fc3345@kaod.org>
Date: Thu, 18 Nov 2021 09:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] docs: Introducing pseries documentation.
Content-Language: en-US
To: <lagarcia@linux.ibm.com>, <qemu-ppc@nongnu.org>
References: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <26442e7dd425bb4feca0adb54d3787fd135fffb7.1637180039.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ec995a3a-ea2e-4294-8dca-e075829dae67
X-Ovh-Tracer-Id: 1539949599321721705
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeehgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeeuleeggfffieeffedujefguddtgeektdekgefhgeevfeejgeeuueefkeekudehnecuffhomhgrihhnpehqvghmuhdrohhrghdprhgvrgguthhhvgguohgtshdrihhopdhophgvnhhpohifvghrfhhouhhnuggrthhiohhnrdhorhhgpdhgihhthhhusgdrtghomhdpihgvvggvrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, groug@kaod.org,
 danielhb413@gmail.com, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Leonardo,

On 11/17/21 21:14, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> The purpose of this document is to substitute the content currently
> available in the QEMU wiki at [0]. This initial version does contain
> some additional content as well. Whenever this documentation gets
> upstream and is reflected in [1], the QEMU wiki will be edited to point
> to this documentation, so that we only need to keep it updated in one
> place.
> 
> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> 1. https://qemu.readthedocs.io/en/latest/system/ppc/pseries.html
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>


Thanks for this update,

Some general comments,

There are other ppc documents :

   docs/specs/ppc-spapr-hcalls.txt
   docs/specs/ppc-spapr-hotplug.txt
   docs/specs/ppc-spapr-numa.rst
   docs/specs/ppc-spapr-uv-hcalls.txt
   docs/specs/ppc-spapr-xive.rst
   docs/specs/ppc-xive.rst

that should be moved maybe and/or referenced by this file ? Feel free
to do a follow up.

On the terminology, I think we should use in the text :

    pSeries, PowerNV, POWER[0-9]

When it comes to QEMU machines names, it's 'pseries', 'powernv'

Some small comments,


> ---
>   docs/system/ppc/pseries.rst | 185 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 932d4dd17d..2de3fb4d51 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -1,12 +1,197 @@
>   pSeries family boards (``pseries``)
>   ===================================
>   
> +The Power machine virtualized environment described by the `Linux on Power

para-virtualized ?

> +Architecture Reference document (LoPAR)
> +<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf>`_
> +is called pseries. This environment is also known as sPAPR, System p guests, or
> +simply Power Linux guests (although it is capable of running other operating
> +systems, such as AIX).
> +
> +Even though pseries is designed to behave as a guest environment, it is also
> +capable of acting as a hypervisor OS, providing, on that role, nested
> +virtualization capabilities.

on POWER9 and above processors. Maybe we should start introducing the
KVM-pseries term.

> +
>   Supported devices
>   -----------------
>   
> + * Multi processor support for many Power processors generations: POWER5+,
> +   POWER7, POWER7+, POWER8, POWER8NVL, Power9, and Power10 (there is no support
> +   for POWER6 processors).

POWER8NVL is for baremetal only.

> + * Interrupt Controller, XICS (POWER8) and XIVE (Power9 and Power10)
> + * vPHB PCIe Host bridge.
> + * vscsi and vnet devices, compatible with the same devices available on a
> +   PowerVM hypervisor with VIOS managing LPARs.
> + * Virtio based devices.
> + * PCIe device pass through.
> +
>   Missing devices
>   ---------------
>   
> + * SPICE support.
>   
>   Firmware
>   --------
> +
> +`SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
> +implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
> +Configuration) Firmware: Core Requirements and Practices
> +<https://standards.ieee.org/standard/1275-1994.html>`_.
> +
> +QEMU includes a prebuilt image of SLOF which is updated when a more recent
> +version is required.
> +
> +Build directions
> +----------------
> +
> +.. code-block:: bash
> +
> +  ./configure --target-list=ppc64-softmmu && make
> +
> +Running instructions
> +--------------------
> +
> +Someone can select the pseries machine type by running QEMU with the following
> +options:
> +
> +.. code-block:: bash
> +
> +  qemu-system-ppc64 -M pseries <other QEMU arguments>
> +
> +sPAPR devices
> +-------------
> +
> +The sPAPR specification defines a set of para-virtualized devices, which are
> +also supported by the pseries machine in QEMU and can be instantiated with the
> +`-device` option:
> +
> +* spapr-vlan : A virtual network interface.
> +* spapr-vscsi : A virtual SCSI disk interface.
> +* spapr-rng : A pseudo-device for passing random number generator data to the
> +  guest (see the `H_RANDOM hypercall feature
> +  <https://wiki.qemu.org/Features/HRandomHypercall>`_ for details).

spapr-vty and tpm.

> +
> +These are compatible with the devices historically available for use when
> +running the IBM PowerVM hypervisor with LPARs.
> +
> +However, since these devices have originally been specified with another
> +hypervisor and non-Linux guests in mind, you should use the virtio counterparts
> +(virtio-net, virtio-blk/scsi and virtio-rng) if possible instead, since they
> +will most probably give you better performance with Linux guests in a QEMU
> +environment.
> +
> +The pseries machine in QEMU is always instantiated with a NVRAM device
> +(``spapr-nvram``), so it is not needed to add this manually. 

also a spapr-vty and a spapr-pci-host-bridge

> However, if someone
> +wants to make the contents of the NVRAM device persistent, they will need to
> +specify a PFLASH device when starting QEMU, i.e. either use
> +``-drive if=pflash,file=<filename>,format=raw`` to set the default PFLASH
> +device, or specify one with an ID
> +(``-drive if=none,file=<filename>,format=raw,id=pfid``) and pass that ID to the
> +NVRAM device with ``-global spapr-nvram.drive=pfid``.
> +
> +Switching between the KVM-PR and KVM-HV kernel module
> +-----------------------------------------------------
> +
> +Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
> +``kvm_pr.ko``.
> +
> +
> +If a host supports both KVM modes, and both KVM kernel modules are loaded, it is
> +possible to switch between the two modes with the ``kvm-type`` parameter:
> +
> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=PR`` to use the
> +  ``kvm_pr.ko`` kernel module.
> +* Use ``qemu-system-ppc64 -M pseries,accel=kvm,kvm-type=HV`` to use ``kvm_hv.ko``
> +  instead.
> +
> +KVM-PR
> +^^^^^^
> +
> +KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the guests,
> +i.e. the virtual machine is run in user mode and all privileged instructions
> +trap and have to be emulated by the host. That means you can run KVM-PR inside
> +a pseries guest (or a PowerVM LPAR for that matter), and that is where it has
> +originated, as historically (prior to POWER7) it was not possible to run Linux
> +on hypervisor mode on a Power processor (this function was restricted to
> +PowerVM, the IBM proprietary hypervisor).
> +
> +Because all privileged instructions are trapped, guests that use a lot of
> +privileged instructions run quite slow with KVM-PR. On the other hand, because
> +of that, this kernel module can run on pretty much every PPC hardware, and is
> +able to emulate a lot of guests CPUs. This module can even be used to run other
> +PowerPC guests like an emulated PowerMac.
> +
> +As KVM-PR can be run inside a pseries guest, it can also provide nested
> +virtualization capabilities (i.e. running a guest from within a guest).
> +
> +KVM-HV
> +^^^^^^
> +
> +KVM-HV uses the hypervisor mode of more recent Power processors, that allow
> +access to the bare metal hardware directly. Although POWER7 had this capability,
> +it was only starting with POWER8 that this was officially supported by IBM.
> +
> +Originally, KVM-HV was only available when running on a powernv platform (a.k.a.
> +Power bare metal). Although it runs on a powernv platform, it can only be used
> +to start pseries guests. As the pseries guest doesn't have access to the
> +hypervisor mode of the Power CPU, it wasn't possible to run KVM-HV on a guest.
> +This limitation has been lifted, and now it is possible to run KVM-HV inside
> +pseries guests as well, making nested virtualization possible with KVM-HV.
> +
> +As KVM-HV has access to privileged instructions, guests that use a lot of these
> +can run much faster than with KVM-PR. On the other hand, the guest CPU has to be
> +of the same type as the host CPU this way, e.g. it is not possible to specify an
> +embedded PPC CPU for the guest with KVM-HV. However, there is at least the
> +possibility to run the guest in a backward-compatibility mode of the previous
> +CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
> +``-cpu POWER8,compat=power7`` as parameter to QEMU.
> +
> +Modules support
> +---------------
> +
> +As noticed in the sections above, each module can run in a different
> +environment. The following table shows with which environment each module can
> +run. As long as you are in a supported environment, you can run KVM-PR or KVM-HV
> +nested. Combinations not shown in the table are not available.
> +
> ++--------------+------------+------+-------------------+----------+--------+
> +| Platform     | Host type  | Bits | Page table format | KVM-HV   | KVM-PR |
> ++==============+============+======+===================+==========+========+
> +| powernv      | bare metal | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | yes      | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | yes      | no     |
> ++--------------+------------+------+-------------------+----------+--------+
> +| pseries [*]_ | powernv    | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | yes [*]_ | no     |
> +|              +------------+------+-------------------+----------+--------+
> +|              | PowerVM    | 32   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix             | N/A      | N/A    |
> +|              |            +------+-------------------+----------+--------+
> +|              |            | 64   | hash              | no       | yes    |
> +|              |            |      +-------------------+----------+--------+
> +|              |            |      | radix [*]_        | no       | yes    |
> ++--------------+------------+------+-------------------+----------+--------+
>
> +
> +.. [*] On POWER9 DD2.1 processors, the page table format on the host and guest
> +   must be the same.
> +
> +.. [*] KVM-HV cannot run nested on POWER8 machines.
> +
> +.. [*] Introduced on Power10 machines.

Shouldn't we use numbers for the above notes ?



you could add references to other pages here.

Thanks,

C.


  
> +Maintainer contact information
> +------------------------------
> +
> +Cédric Le Goater <clg@kaod.org>
> +
> +Daniel Henrique Barboza <danielhb413@gmail.com>
> \ No newline at end of file
> 


