Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995B33FA481
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Aug 2021 10:28:56 +0200 (CEST)
Received: from localhost ([::1]:53964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJthv-0007BY-Lo
	for lists+qemu-devel@lfdr.de; Sat, 28 Aug 2021 04:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJth2-0006KQ-IK; Sat, 28 Aug 2021 04:28:00 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:53179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mJth0-0008Sl-MS; Sat, 28 Aug 2021 04:28:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.31])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id C550613B1AA;
 Sat, 28 Aug 2021 08:27:55 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sat, 28 Aug
 2021 10:27:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005b63b32f7-9b47-4311-9601-38bc26273f22,
 6CE952B1E590FC391734534FA2C2FCCDA042449D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 83.199.102.86
Subject: Re: [PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass
To: <pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9bfa54fc-2f2d-7072-2949-ee0698b9d6e1@kaod.org>
Date: Sat, 28 Aug 2021 10:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827210417.4022054-2-pdel@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1d98c45d-fbf4-4c82-8788-309c405d6ef6
X-Ovh-Tracer-Id: 17549120376237165536
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudduhedgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphguvghlsehfsgdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On 8/27/21 11:04 PM, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> The AST2500 uses different logic than the AST2600 for getting IRQ's.
> This adds a virtual `get_irq` function to the Aspeed SOC class, so that
> the shared initialization code in `hw/arm/aspeed.c` can retrieve IRQ's.

Thanks for this new machine. See my comment on patch 2. We might need 
to rework the serial initialization which would deprecate this change.

C.

> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/arm/aspeed_ast2600.c     | 1 +
>  hw/arm/aspeed_soc.c         | 1 +
>  include/hw/arm/aspeed_soc.h | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index e3013128c6..56e1adb343 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -527,6 +527,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>      sc->irqmap       = aspeed_soc_ast2600_irqmap;
>      sc->memmap       = aspeed_soc_ast2600_memmap;
>      sc->num_cpus     = 2;
> +    sc->get_irq      = aspeed_soc_get_irq;
>  }
>  
>  static const TypeInfo aspeed_soc_ast2600_type_info = {
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 3ad6c56fa9..c373182299 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -476,6 +476,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>      sc->irqmap       = aspeed_soc_ast2400_irqmap;
>      sc->memmap       = aspeed_soc_ast2400_memmap;
>      sc->num_cpus     = 1;
> +    sc->get_irq      = aspeed_soc_get_irq;
>  }
>  
>  static const TypeInfo aspeed_soc_ast2400_type_info = {
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index d9161d26d6..ca16e1e383 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -84,6 +84,7 @@ struct AspeedSoCClass {
>      const int *irqmap;
>      const hwaddr *memmap;
>      uint32_t num_cpus;
> +    qemu_irq (*get_irq)(AspeedSoCState *s, int ctrl);
>  };
>  
>  
> 


