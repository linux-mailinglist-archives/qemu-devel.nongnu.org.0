Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5C648E77
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 12:42:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3yFE-0005bS-O2; Sat, 10 Dec 2022 06:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p3yF5-0005as-1R
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:42:07 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p3yF2-0001th-Iq
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:42:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B34B02DCA2;
 Sat, 10 Dec 2022 11:42:01 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Sat, 10 Dec
 2022 12:42:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00181ca402a-ac08-4bc7-b118-9cdd800bf733,
 44AACDB81BE59B98CC36297FC0CE4402BB499AC8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5ee6b84c-676c-5b95-b24e-f25622548311@kaod.org>
Date: Sat, 10 Dec 2022 12:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] include/hw/ppc: Supply a few missing includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20221210112140.4057731-1-armbru@redhat.com>
 <20221210112140.4057731-3-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221210112140.4057731-3-armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 545e19f5-5c67-4079-878b-d16cf3761df8
X-Ovh-Tracer-Id: 8109012606599400413
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.288,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
> A few headers neglect to include headers they need.  They compile only
> if something else includes the required header(s) first.  Fix that.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   include/hw/ppc/pnv_lpc.h    | 3 ++-
>   include/hw/ppc/pnv_occ.h    | 3 ++-
>   include/hw/ppc/pnv_pnor.h   | 2 +-
>   include/hw/ppc/pnv_sbe.h    | 3 ++-
>   include/hw/ppc/pnv_xscom.h  | 3 ++-
>   include/hw/ppc/xive2.h      | 2 ++
>   include/hw/ppc/xive2_regs.h | 2 ++
>   7 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv_lpc.h b/include/hw/ppc/pnv_lpc.h
> index 8a8d1a3d42..001eee27d7 100644
> --- a/include/hw/ppc/pnv_lpc.h
> +++ b/include/hw/ppc/pnv_lpc.h
> @@ -20,7 +20,8 @@
>   #ifndef PPC_PNV_LPC_H
>   #define PPC_PNV_LPC_H
>   
> -#include "qom/object.h"
> +#include "exec/memory.h"
> +#include "hw/qdev-core.h"
>   
>   #define TYPE_PNV_LPC "pnv-lpc"
>   typedef struct PnvLpcClass PnvLpcClass;
> diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
> index 90a81dae2b..df321244e3 100644
> --- a/include/hw/ppc/pnv_occ.h
> +++ b/include/hw/ppc/pnv_occ.h
> @@ -20,7 +20,8 @@
>   #ifndef PPC_PNV_OCC_H
>   #define PPC_PNV_OCC_H
>   
> -#include "qom/object.h"
> +#include "exec/memory.h"
> +#include "hw/qdev-core.h"
>   
>   #define TYPE_PNV_OCC "pnv-occ"
>   OBJECT_DECLARE_TYPE(PnvOCC, PnvOCCClass,
> diff --git a/include/hw/ppc/pnv_pnor.h b/include/hw/ppc/pnv_pnor.h
> index bab2f79844..2e37ac88bf 100644
> --- a/include/hw/ppc/pnv_pnor.h
> +++ b/include/hw/ppc/pnv_pnor.h
> @@ -10,7 +10,7 @@
>   #ifndef PPC_PNV_PNOR_H
>   #define PPC_PNV_PNOR_H
>   
> -#include "qom/object.h"
> +#include "hw/sysbus.h"
>   
>   /*
>    * PNOR offset on the LPC FW address space
> diff --git a/include/hw/ppc/pnv_sbe.h b/include/hw/ppc/pnv_sbe.h
> index f54a3ae9ba..b6b378ad14 100644
> --- a/include/hw/ppc/pnv_sbe.h
> +++ b/include/hw/ppc/pnv_sbe.h
> @@ -20,7 +20,8 @@
>   #ifndef PPC_PNV_SBE_H
>   #define PPC_PNV_SBE_H
>   
> -#include "qom/object.h"
> +#include "exec/memory.h"
> +#include "hw/qdev-core.h"
>   
>   #define TYPE_PNV_SBE "pnv-sbe"
>   OBJECT_DECLARE_TYPE(PnvSBE, PnvSBEClass, PNV_SBE)
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index c6e9ef8dd2..cbe848d27b 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -20,7 +20,8 @@
>   #ifndef PPC_PNV_XSCOM_H
>   #define PPC_PNV_XSCOM_H
>   
> -#include "qom/object.h"
> +#include "exec/memory.h"
> +#include "hw/ppc/pnv.h"
>   
>   typedef struct PnvXScomInterface PnvXScomInterface;
>   
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index e9e3ea135e..ab68f8d157 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -11,7 +11,9 @@
>   #ifndef PPC_XIVE2_H
>   #define PPC_XIVE2_H
>   
> +#include "hw/ppc/xive.h"
>   #include "hw/ppc/xive2_regs.h"
> +#include "hw/sysbus.h"
>   
>   /*
>    * XIVE2 Router (POWER10)
> diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
> index 14605bd458..b7adbdb7b9 100644
> --- a/include/hw/ppc/xive2_regs.h
> +++ b/include/hw/ppc/xive2_regs.h
> @@ -10,6 +10,8 @@
>   #ifndef PPC_XIVE2_REGS_H
>   #define PPC_XIVE2_REGS_H
>   
> +#include "cpu.h"
> +
>   /*
>    * Thread Interrupt Management Area (TIMA)
>    *


