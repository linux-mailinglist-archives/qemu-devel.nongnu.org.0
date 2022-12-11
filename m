Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E206F64931F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 08:56:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4HBF-0005Om-V9; Sun, 11 Dec 2022 02:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p4HBD-0005O0-46
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 02:55:23 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p4HBA-0004ug-Il
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 02:55:22 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 69F562FAA8;
 Sun, 11 Dec 2022 07:55:18 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sun, 11 Dec
 2022 08:55:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0032047fb81-4d82-461c-a658-ba9f6a516f7e,
 A320C9500CC3D72269AA063E984CC4177386D8D3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <781d3278-f55a-4eb6-feb5-8a48381a831f@kaod.org>
Date: Sun, 11 Dec 2022 08:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] include/hw/ppc include/hw/pci-host: Drop extra
 typedefs
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20221210112140.4057731-1-armbru@redhat.com>
 <20221210112140.4057731-5-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221210112140.4057731-5-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 97de298f-6a7f-4a03-ace9-40b79b67045c
X-Ovh-Tracer-Id: 10152802412564089821
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.288,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/10/22 12:21, Markus Armbruster wrote:
> PnvChip is typedef'ed in five places, and PnvPhb4PecState in two.
> Keep one, drop the others.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/pci-host/pnv_phb.h          | 1 -
>   include/hw/pci-host/pnv_phb3.h | 1 -
>   include/hw/pci-host/pnv_phb4.h | 2 --
>   include/hw/ppc/pnv_core.h      | 3 +--
>   include/hw/ppc/pnv_homer.h     | 2 +-
>   include/hw/ppc/pnv_lpc.h       | 8 ++------
>   include/hw/ppc/pnv_xive.h      | 7 +++----
>   7 files changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
> index 202de8796c..eb429d529f 100644
> --- a/hw/pci-host/pnv_phb.h
> +++ b/hw/pci-host/pnv_phb.h
> @@ -15,7 +15,6 @@
>   #include "hw/ppc/pnv.h"
>   #include "qom/object.h"
>   
> -typedef struct PnvChip PnvChip;
>   typedef struct PnvPhb4PecState PnvPhb4PecState;
>   
>   struct PnvPHB {
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index f791ebda9b..d62b3091ac 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -15,7 +15,6 @@
>   #include "hw/pci-host/pnv_phb.h"
>   
>   typedef struct PnvPHB3 PnvPHB3;
> -typedef struct PnvChip PnvChip;
>   
>   /*
>    * PHB3 XICS Source for MSIs
> diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
> index b4f2b29fb5..1f3237c9d5 100644
> --- a/include/hw/pci-host/pnv_phb4.h
> +++ b/include/hw/pci-host/pnv_phb4.h
> @@ -16,10 +16,8 @@
>   #include "hw/ppc/xive.h"
>   #include "qom/object.h"
>   
> -typedef struct PnvPhb4PecState PnvPhb4PecState;
>   typedef struct PnvPhb4PecStack PnvPhb4PecStack;
>   typedef struct PnvPHB4 PnvPHB4;
> -typedef struct PnvChip PnvChip;
>   
>   /*
>    * We have one such address space wrapper per possible device under
> diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
> index c22eab2e1f..3d75706e95 100644
> --- a/include/hw/ppc/pnv_core.h
> +++ b/include/hw/ppc/pnv_core.h
> @@ -22,14 +22,13 @@
>   
>   #include "hw/cpu/core.h"
>   #include "target/ppc/cpu.h"
> +#include "hw/ppc/pnv.h"
>   #include "qom/object.h"
>   
>   #define TYPE_PNV_CORE "powernv-cpu-core"
>   OBJECT_DECLARE_TYPE(PnvCore, PnvCoreClass,
>                       PNV_CORE)
>   
> -typedef struct PnvChip PnvChip;
> -
>   struct PnvCore {
>       /*< private >*/
>       CPUCore parent_obj;
> diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
> index 07e8b19311..b1c5d498dc 100644
> --- a/include/hw/ppc/pnv_homer.h
> +++ b/include/hw/ppc/pnv_homer.h
> @@ -39,7 +39,7 @@ DECLARE_INSTANCE_CHECKER(PnvHomer, PNV10_HOMER,
>   struct PnvHomer {
>       DeviceState parent;
>   
> -    struct PnvChip *chip;
> +    PnvChip *chip;
>       MemoryRegion pba_regs;
>       MemoryRegion regs;
>   };
> diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
> index 001eee27d7..5d22c45570 100644
> --- a/include/hw/ppc/pnv_lpc.h
> +++ b/include/hw/ppc/pnv_lpc.h
> @@ -21,6 +21,7 @@
>   #define PPC_PNV_LPC_H
>   
>   #include "exec/memory.h"
> +#include "hw/ppc/pnv.h"
>   #include "hw/qdev-core.h"
>   
>   #define TYPE_PNV_LPC "pnv-lpc"
> @@ -93,13 +94,8 @@ struct PnvLpcClass {
>       DeviceRealize parent_realize;
>   };
>   
> -/*
> - * Old compilers error on typdef forward declarations. Keep them happy.
> - */
> -struct PnvChip;
> -
>   ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp);
> -int pnv_dt_lpc(struct PnvChip *chip, void *fdt, int root_offset,
> +int pnv_dt_lpc(PnvChip *chip, void *fdt, int root_offset,
>                  uint64_t lpcm_addr, uint64_t lpcm_size);
>   
>   #endif /* PPC_PNV_LPC_H */
> diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
> index b5d91505e5..9c48430ee4 100644
> --- a/include/hw/ppc/pnv_xive.h
> +++ b/include/hw/ppc/pnv_xive.h
> @@ -10,12 +10,11 @@
>   #ifndef PPC_PNV_XIVE_H
>   #define PPC_PNV_XIVE_H
>   
> +#include "hw/ppc/pnv.h"
>   #include "hw/ppc/xive.h"
>   #include "qom/object.h"
>   #include "hw/ppc/xive2.h"
>   
> -struct PnvChip;
> -
>   #define TYPE_PNV_XIVE "pnv-xive"
>   OBJECT_DECLARE_TYPE(PnvXive, PnvXiveClass,
>                       PNV_XIVE)
> @@ -31,7 +30,7 @@ struct PnvXive {
>       XiveRouter    parent_obj;
>   
>       /* Owning chip */
> -    struct PnvChip *chip;
> +    PnvChip *chip;
>   
>       /* XSCOM addresses giving access to the controller registers */
>       MemoryRegion  xscom_regs;
> @@ -106,7 +105,7 @@ typedef struct PnvXive2 {
>       Xive2Router   parent_obj;
>   
>       /* Owning chip */
> -    struct PnvChip *chip;
> +    PnvChip *chip;
>   
>       /* XSCOM addresses giving access to the controller registers */
>       MemoryRegion  xscom_regs;


