Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7AD486900
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:44:41 +0100 (CET)
Received: from localhost ([::1]:43428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Woa-0000wB-VB
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5WlV-0007TW-Td
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:41:29 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:50059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5WlS-0005yj-Ue
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:41:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.253])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C51F7216B2;
 Thu,  6 Jan 2022 17:41:21 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 18:41:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064e252dd4-e48f-4065-ac65-986dd5352956,
 021048AAC49377EB75D2DE2E73CB44671C288654) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bd2b3654-2468-d1aa-8968-4475b59e223e@kaod.org>
Date: Thu, 6 Jan 2022 18:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs: Clarifications and formatting changes in ppc docs.
Content-Language: en-US
To: <lagarcia@linux.ibm.com>, <qemu-ppc@nongnu.org>
References: <3b228af4785241c7fb4a2c70f0c495d2a9adea83.1641405872.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3b228af4785241c7fb4a2c70f0c495d2a9adea83.1641405872.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7a65b30c-ee17-41c9-aa6c-5c1aa3ca1f33
X-Ovh-Tracer-Id: 3008686028829461353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteekveeufefgfeefvdeuteefudeggffhjefhieeffefhgffhfeeuueffvdelieenucffohhmrghinhepohhpvghnphhofigvrhhfohhunhgurghtihhonhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/5/22 19:08, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

One comment below.

Thanks,

C.


> ---
>   docs/specs/ppc-spapr-hcalls.rst | 22 ++++++++---------
>   docs/system/ppc/pseries.rst     | 43 +++++++++++++++++----------------
>   2 files changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/docs/specs/ppc-spapr-hcalls.rst b/docs/specs/ppc-spapr-hcalls.rst
> index 28daf9734a..b4a18a01e6 100644
> --- a/docs/specs/ppc-spapr-hcalls.rst
> +++ b/docs/specs/ppc-spapr-hcalls.rst
> @@ -1,13 +1,12 @@
> +======================
>   sPAPR hypervisor calls
> -----------------------
> +======================
>   
>   When used with the ``pseries`` machine type, ``qemu-system-ppc64`` implements
> -a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
> -Architecture Reference document (LoPAR)
> -<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
> -This document is a subset of the Power Architecture Platform Reference (PAPR+)
> -specification (IBM internal only), which is what PowerVM, the IBM proprietary
> -hypervisor, adheres to.
> +a set of hypervisor calls (a.k.a. hcalls) defined in the Linux on Power
> +Architecture Reference ([LoPAR]_) document. This document is a subset of the
> +Power Architecture Platform Reference (PAPR+) specification (IBM internal only),
> +which is what PowerVM, the IBM proprietary hypervisor, adheres to.
>   
>   The subset in LoPAR is selected based on the requirements of Linux as a guest.
>   
> @@ -18,8 +17,8 @@ running in the guest and QEMU.
>   All those hypercalls start at hcall number 0xf000 which correspond
>   to an implementation specific range in PAPR.
>   
> -H_RTAS (0xf000)
> -^^^^^^^^^^^^^^^
> +``H_RTAS (0xf000)``
> +===================
>   
>   RTAS stands for Run-Time Abstraction Sercies and is a set of runtime services
>   generally provided by the firmware inside the guest to the operating system. It
> @@ -44,8 +43,8 @@ Returns:
>   
>     ``H_PARAMETER``: Unknown token.
>   
> -H_LOGICAL_MEMOP (0xf001)
> -^^^^^^^^^^^^^^^^^^^^^^^^
> +``H_LOGICAL_MEMOP (0xf001)``
> +============================
>   
>   When the guest runs in "real mode" (in powerpc terminology this means with MMU
>   disabled, i.e. guest effective address equals to guest physical address), it
> @@ -98,3 +97,4 @@ Returns:
>     ``H_SUCCESS``: Success.
>   
>     ``H_PARAMETER``: Invalid argument.
> +
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 72e315eff6..ead33e6764 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -1,19 +1,18 @@
> +===================================
>   pSeries family boards (``pseries``)
>   ===================================
>   
> -The Power machine para-virtualized environment described by the `Linux on Power
> -Architecture Reference document (LoPAR)
> -<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_
> -is called pSeries. This environment is also known as sPAPR, System p guests, or
> -simply Power Linux guests (although it is capable of running other operating
> -systems, such as AIX).
> +The Power machine para-virtualized environment described by the Linux on Power
> +Architecture Reference ([LoPAR]_) document is called pSeries. This environment
> +is also known as sPAPR, System p guests, or simply Power Linux guests (although
> +it is capable of running other operating systems, such as AIX).
>   
>   Even though pSeries is designed to behave as a guest environment, it is also
>   capable of acting as a hypervisor OS, providing, on that role, nested
>   virtualization capabilities.
>   
>   Supported devices
> ------------------
> +=================
>   
>    * Multi processor support for many Power processors generations: POWER7,
>      POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ exists,

pseries with 970, 970MP, POWER5+ CPUs are supported now (TCG only).

POWER7 on KVM has an uncertain status.

> @@ -26,12 +25,12 @@ Supported devices
>    * PCIe device pass through.
>   
>   Missing devices
> ----------------
> +===============
>   
>    * SPICE support.
>   
>   Firmware
> ---------
> +========
>   
>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>   implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
> @@ -42,14 +41,14 @@ QEMU includes a prebuilt image of SLOF which is updated when a more recent
>   version is required.
>   
>   Build directions
> -----------------
> +================
>   
>   .. code-block:: bash
>   
>     ./configure --target-list=ppc64-softmmu && make
>   
>   Running instructions
> ---------------------
> +====================
>   
>   Someone can select the pSeries machine type by running QEMU with the following
>   options:
> @@ -59,7 +58,7 @@ options:
>     qemu-system-ppc64 -M pseries <other QEMU arguments>
>   
>   sPAPR devices
> --------------
> +=============
>   
>   The sPAPR specification defines a set of para-virtualized devices, which are
>   also supported by the pSeries machine in QEMU and can be instantiated with the
> @@ -102,11 +101,9 @@ device, or specify one with an ID
>   NVRAM device with ``-global spapr-nvram.drive=pfid``.
>   
>   sPAPR specification
> -^^^^^^^^^^^^^^^^^^^
> +-------------------
>   
> -The main source of documentation on the sPAPR standard is the `Linux on Power
> -Architecture Reference document (LoPAR)
> -<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
> +The main source of documentation on the sPAPR standard is the [LoPAR]_ document.
>   However, documentation specific to QEMU's implementation of the specification
>   can  also be found in QEMU documentation:
>   
> @@ -124,7 +121,7 @@ Other documentation available in QEMU docs directory:
>     (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
>   
>   Switching between the KVM-PR and KVM-HV kernel module
> ------------------------------------------------------
> +=====================================================
>   
>   Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
>   ``kvm_pr.ko``.
> @@ -139,7 +136,7 @@ possible to switch between the two modes with the ``kvm-type`` parameter:
>     instead.
>   
>   KVM-PR
> -^^^^^^
> +------
>   
>   KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the guests,
>   i.e. the virtual machine is run in user mode and all privileged instructions
> @@ -166,7 +163,7 @@ In order to run KVM-PR guests with POWER9 processors, someone will need to start
>   QEMU with ``kernel_irqchip=off`` command line option.
>   
>   KVM-HV
> -^^^^^^
> +------
>   
>   KVM-HV uses the hypervisor mode of more recent Power processors, that allow
>   access to the bare metal hardware directly. Although POWER7 had this capability,
> @@ -188,7 +185,7 @@ CPUs generations, e.g. you can run a POWER7 guest on a POWER8 host by using
>   ``-cpu POWER8,compat=power7`` as parameter to QEMU.
>   
>   Modules support
> ----------------
> +===============
>   
>   As noticed in the sections above, each module can run in a different
>   environment. The following table shows with which environment each module can
> @@ -231,8 +228,12 @@ nested. Combinations not shown in the table are not available.
>   .. [3] Introduced on Power10 machines.
>   
>   Maintainer contact information
> -------------------------------
> +==============================
>   
>   Cédric Le Goater <clg@kaod.org>
>   
>   Daniel Henrique Barboza <danielhb413@gmail.com>
> +
> +.. [LoPAR] `Linux on Power Architecture Reference document (LoPAR) revision
> +   2.9 <https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf>`_.
> +
> 


