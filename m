Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33423465E73
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 07:55:05 +0100 (CET)
Received: from localhost ([::1]:46170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msfzi-0007Ce-OM
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 01:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msfwa-0005Bn-EQ; Thu, 02 Dec 2021 01:51:48 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:57453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msfwW-0004OC-78; Thu, 02 Dec 2021 01:51:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.241])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 32B88CF4F9AA;
 Thu,  2 Dec 2021 07:51:40 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 07:51:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003bca5db46-0306-40c1-94a1-3e8c917e9625,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0eabc870-39d2-e336-a43e-311921605b25@kaod.org>
Date: Thu, 2 Dec 2021 07:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] docs: Minor updates on the powernv documentation.
Content-Language: en-US
To: <lagarcia@linux.ibm.com>, <qemu-ppc@nongnu.org>
References: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 49cec289-4aeb-47e4-b2a4-bc52fb83bf5a
X-Ovh-Tracer-Id: 7853151854405061600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieeggddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffeuheegheefuddtuefgfeefueejudduteeiudfhkeffueeuteeuffevgeetteevnecuffhomhgrihhnpeifihhkihhpvgguihgrrdhorhhgpdhgihhthhhusgdrtghomhdpkhgrohgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhgrghgrrhgtihgrsegsrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Leonardo,

On 11/23/21 13:10, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

It seems that POWER10 was renamed to Power10 but not POWER9. And :

   https://en.wikipedia.org/wiki/Power9  redirects to POWER9
   https://en.wikipedia.org/wiki/POWER10 redirects to Power10

I will keep the upper case POWER9. No need to resend.

Thanks,

C.



>   docs/system/ppc/powernv.rst | 57 +++++++++++++++++++------------------
>   1 file changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
> index 86186b7d2c..eda4219a27 100644
> --- a/docs/system/ppc/powernv.rst
> +++ b/docs/system/ppc/powernv.rst
> @@ -1,7 +1,7 @@
> -PowerNV family boards (``powernv8``, ``powernv9``)
> +PowerNV family boards (``powernv8``, ``powernv9``, ``powernv10``)
>   ==================================================================
>   
> -PowerNV (as Non-Virtualized) is the "baremetal" platform using the
> +PowerNV (as Non-Virtualized) is the "bare metal" platform using the
>   OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
>   be used as an hypervisor OS, running KVM guests, or simply as a host
>   OS.
> @@ -15,17 +15,15 @@ beyond the scope of what QEMU addresses today.
>   Supported devices
>   -----------------
>   
> - * Multi processor support for POWER8, POWER8NVL and POWER9.
> - * XSCOM, serial communication sideband bus to configure chiplets
> - * Simple LPC Controller
> - * Processor Service Interface (PSI) Controller
> - * Interrupt Controller, XICS (POWER8) and XIVE (POWER9)
> - * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge
> - * Simple OCC is an on-chip microcontroller used for power management
> -   tasks
> - * iBT device to handle BMC communication, with the internal BMC
> -   simulator provided by QEMU or an external BMC such as an Aspeed
> -   QEMU machine.
> + * Multi processor support for POWER8, POWER8NVL and Power9.
> + * XSCOM, serial communication sideband bus to configure chiplets.
> + * Simple LPC Controller.
> + * Processor Service Interface (PSI) Controller.
> + * Interrupt Controller, XICS (POWER8) and XIVE (Power9) and XIVE2 (Power10).
> + * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge.
> + * Simple OCC is an on-chip micro-controller used for power management tasks.
> + * iBT device to handle BMC communication, with the internal BMC simulator
> +   provided by QEMU or an external BMC such as an Aspeed QEMU machine.
>    * PNOR containing the different firmware partitions.
>   
>   Missing devices
> @@ -33,27 +31,25 @@ Missing devices
>   
>   A lot is missing, among which :
>   
> - * POWER10 processor
> - * XIVE2 (POWER10) interrupt controller
> - * I2C controllers (yet to be merged)
> - * NPU/NPU2/NPU3 controllers
> - * EEH support for PCIe Host bridge controllers
> - * NX controller
> - * VAS controller
> - * chipTOD (Time Of Day)
> + * I2C controllers (yet to be merged).
> + * NPU/NPU2/NPU3 controllers.
> + * EEH support for PCIe Host bridge controllers.
> + * NX controller.
> + * VAS controller.
> + * chipTOD (Time Of Day).
>    * Self Boot Engine (SBE).
> - * FSI bus
> + * FSI bus.
>   
>   Firmware
>   --------
>   
>   The OPAL firmware (OpenPower Abstraction Layer) for OpenPower systems
>   includes the runtime services ``skiboot`` and the bootloader kernel and
> -initramfs ``skiroot``. Source code can be found on GitHub:
> +initramfs ``skiroot``. Source code can be found on the `OpenPOWER account at
> +GitHub <https://github.com/open-power>`_.
>   
> -  https://github.com/open-power.
> -
> -Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the `OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
> +Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the
> +`OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
>   
>   QEMU includes a prebuilt image of ``skiboot`` which is updated when a
>   more recent version is required by the models.
> @@ -83,6 +79,7 @@ and a SATA disk :
>   
>   Complex PCIe configuration
>   ~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
>   Six PHBs are defined per chip (POWER9) but no default PCI layout is
>   provided (to be compatible with libvirt). One PCI device can be added
>   on any of the available PCIe slots using command line options such as:
> @@ -157,7 +154,7 @@ one on the command line :
>   The files `palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-SDR.bin>`__
>   and `palmetto-FRU.bin <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin>`__
>   define a Sensor Data Record repository and a Field Replaceable Unit
> -inventory for a palmetto BMC. They can be used to extend the QEMU BMC
> +inventory for a Palmetto BMC. They can be used to extend the QEMU BMC
>   simulator.
>   
>   .. code-block:: bash
> @@ -189,4 +186,8 @@ CAVEATS
>   -------
>   
>    * No support for multiple HW threads (SMT=1). Same as pseries.
> - * CPU can hang when doing intensive I/Os. Use ``-append powersave=off`` in that case.
> +
> +Maintainer contact information
> +------------------------------
> +
> +Cédric Le Goater <clg@kaod.org>
> \ No newline at end of file
> 


