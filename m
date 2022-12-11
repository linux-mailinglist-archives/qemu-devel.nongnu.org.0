Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D464931E
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 08:56:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4HAw-0005DF-MD; Sun, 11 Dec 2022 02:55:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p4HAe-0005Ag-Rs
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 02:54:50 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p4HAd-0004pH-3D
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 02:54:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.27])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7D17314A6FB21;
 Sun, 11 Dec 2022 08:54:26 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 11 Dec
 2022 08:54:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00283129df0-2e04-4026-b9c0-61f0d68fa96a,
 A320C9500CC3D72269AA063E984CC4177386D8D3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <700aada2-5b0a-e558-0d96-e6470743c515@kaod.org>
Date: Sun, 11 Dec 2022 08:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] include/hw/ppc: Don't include hw/pci-host/pnv_phb.h
 from pnv.h
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20221210112140.4057731-1-armbru@redhat.com>
 <20221210112140.4057731-4-armbru@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221210112140.4057731-4-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d60aa9c2-5025-49c6-a314-b3c211809ca6
X-Ovh-Tracer-Id: 10138165711522663389
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.288,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/10/22 12:21, Markus Armbruster wrote:
> The next commit needs to include hw/ppc/pnv.h from
> hw/pci-host/pnv_phb.h.  Avoid an inclusion loop.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

(one comment below)

> ---
>   hw/pci-host/pnv_phb.h          | 1 +
>   include/hw/pci-host/pnv_phb4.h | 3 ++-
>   include/hw/ppc/pnv.h           | 3 ++-
>   hw/ppc/pnv_psi.c               | 1 +
>   4 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
> index 58ebd6dd0f..202de8796c 100644
> --- a/hw/pci-host/pnv_phb.h
> +++ b/hw/pci-host/pnv_phb.h
> @@ -12,6 +12,7 @@
>   
>   #include "hw/pci/pcie_host.h"
>   #include "hw/pci/pcie_port.h"
> +#include "hw/ppc/pnv.h"

Now that the chip definitions have been extrated in pnv_chip.h, I find
it curious that we need to include pnv.h since it should only contain
machine definitions. No big deal, I will take a look later. You did
the hard part and thanks for that.



>   #include "qom/object.h"
>   
>   typedef struct PnvChip PnvChip;
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index d9cea3f952..b4f2b29fb5 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -10,14 +10,15 @@
>   #ifndef PCI_HOST_PNV_PHB4_H
>   #define PCI_HOST_PNV_PHB4_H
>   
> +#include "hw/pci-host/pnv_phb.h"
>   #include "hw/pci/pci_bus.h"
> +#include "hw/ppc/pnv.h"
>   #include "hw/ppc/xive.h"
>   #include "qom/object.h"
>   
>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>   typedef struct PnvPHB4 PnvPHB4;
> -typedef struct PnvPHB PnvPHB;
>   typedef struct PnvChip PnvChip;
>   
>   /*
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index ca49e4281d..96fb850419 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -25,7 +25,6 @@
>   #include "hw/sysbus.h"
>   #include "hw/ipmi/ipmi.h"
>   #include "hw/ppc/pnv_pnor.h"
> -#include "hw/pci-host/pnv_phb.h"
>   
>   #define TYPE_PNV_CHIP "pnv-chip"
>   
> @@ -59,6 +58,8 @@ DECLARE_INSTANCE_CHECKER(PnvChip, PNV_CHIP_POWER10,
>   
>   PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir);
>   
> +typedef struct PnvPHB PnvPHB;
> +
>   #define TYPE_PNV_MACHINE       MACHINE_TYPE_NAME("powernv")
>   typedef struct PnvMachineClass PnvMachineClass;
>   typedef struct PnvMachineState PnvMachineState;
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 98045ed3d2..8aa09ab26b 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -18,6 +18,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "exec/address-spaces.h"
>   #include "hw/irq.h"
>   #include "target/ppc/cpu.h"
>   #include "qemu/log.h"


