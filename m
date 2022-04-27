Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EA511C78
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:00:31 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njl1i-0006J4-G0
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njkyt-0003bO-54
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:57:35 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:35185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njkyr-00056x-6n
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 12:57:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 273E7201DF;
 Wed, 27 Apr 2022 16:57:29 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 18:57:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0062b38607f-4e5c-4875-bd00-2495dc795066,
 17BF23367636C0D6DAFD61CED3DAD67CB3096C97) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e6fa04a7-9ca3-fdc0-05b2-137ca5d458b7@kaod.org>
Date: Wed, 27 Apr 2022 18:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] ppc/xive: Update the state of the External interrupt
 signal
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220427160223.96758-1-fbarrat@linux.ibm.com>
 <20220427160223.96758-3-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220427160223.96758-3-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f2bc432a-9341-48f5-b19a-439b6b38d59c
X-Ovh-Tracer-Id: 8500825772392418211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: npiggin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 18:02, Frederic Barrat wrote:
> When pulling or pushing an OS context from/to a CPU, we should
> re-evaluate the state of the External interrupt signal. Otherwise, we
> can end up catching the External interrupt exception in hypervisor
> mode, which is unexpected.
> 
> The problem is best illustrated with the following scenario:
> 
> 1. an External interrupt is raised while the guest is on the CPU.
> 
> 2. before the guest can ack the External interrupt, an hypervisor
> interrupt is raised, for example the Hypervisor Decrementer or
> Hypervisor Virtualization interrupt. The hypervisor interrupt forces
> the guest to exit while the External interrupt is still pending.
> 
> 3. the hypervisor handles the hypervisor interrupt. At this point, the
> External interrupt is still pending. So it's very likely to be
> delivered while the hypervisor is running. That's unexpected and can
> result in an infinite loop where the hypervisor catches the External
> interrupt, looks for an interrupt in its hypervisor queue, doesn't
> find any, exits the interrupt handler with the External interrupt
> still raised, repeat...
> 
> The fix is simply to always lower the External interrupt signal when
> pulling an OS context. It means it needs to be raised again when
> re-pushing the OS context. Fortunately, it's already the case, as we
> now always call xive_tctx_ipb_update(), which will raise the signal if
> needed.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/intc/xive.c        | 14 ++++++++++++++
>   hw/intc/xive2.c       |  2 ++
>   include/hw/ppc/xive.h |  1 +
>   3 files changed, 17 insertions(+)
> 
> diff --git a/hw/intc/xive.c b/hw/intc/xive.c
> index 6b62918ea7..e230b14e94 100644
> --- a/hw/intc/xive.c
> +++ b/hw/intc/xive.c
> @@ -114,6 +114,17 @@ static void xive_tctx_notify(XiveTCTX *tctx, uint8_t ring)
>       }
>   }
>   
> +void xive_tctx_reset_os_signal(XiveTCTX *tctx)
> +{
> +    /*
> +     * Lower the External interrupt. Used when pulling an OS
> +     * context. It is necessary to avoid catching it in the hypervisor
> +     * context. It should be raised again when re-pushing the OS
> +     * context.
> +     */
> +    qemu_irq_lower(xive_tctx_output(tctx, TM_QW1_OS));
> +}
> +
>   static void xive_tctx_set_cppr(XiveTCTX *tctx, uint8_t ring, uint8_t cppr)
>   {
>       uint8_t *regs = &tctx->regs[ring];
> @@ -388,6 +399,8 @@ static uint64_t xive_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
>       /* Invalidate CAM line */
>       qw1w2_new = xive_set_field32(TM_QW1W2_VO, qw1w2, 0);
>       xive_tctx_set_os_cam(tctx, qw1w2_new);
> +
> +    xive_tctx_reset_os_signal(tctx);
>       return qw1w2;
>   }
>   
> @@ -419,6 +432,7 @@ static void xive_tctx_need_resend(XiveRouter *xrtr, XiveTCTX *tctx,
>        * escalation found in the NVT above, there could be a pending
>        * interrupt which was saved when the context was pulled and we
>        * need the recalculate the PIPR (which is not saved/restored).
> +     * It will also raise the External interrupt signal if needed.
>        */
>       xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 2c62f68444..173e0120f8 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -269,6 +269,7 @@ uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
>           xive2_tctx_save_os_ctx(xrtr, tctx, nvp_blk, nvp_idx);
>       }
>   
> +    xive_tctx_reset_os_signal(tctx);
>       return qw1w2;
>   }
>   
> @@ -349,6 +350,7 @@ static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
>        * escalation found in the NVT above, there could be a pending
>        * interrupt which was saved when the context was pulled and we
>        * need the recalculate the PIPR (which is not saved/restored).
> +     * It will also raise the External interrupt signal if needed.
>        */
>       xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
>   }
> diff --git a/include/hw/ppc/xive.h b/include/hw/ppc/xive.h
> index 126e4e2c3a..f7eea4ca81 100644
> --- a/include/hw/ppc/xive.h
> +++ b/include/hw/ppc/xive.h
> @@ -527,6 +527,7 @@ Object *xive_tctx_create(Object *cpu, XivePresenter *xptr, Error **errp);
>   void xive_tctx_reset(XiveTCTX *tctx);
>   void xive_tctx_destroy(XiveTCTX *tctx);
>   void xive_tctx_ipb_update(XiveTCTX *tctx, uint8_t ring, uint8_t ipb);
> +void xive_tctx_reset_os_signal(XiveTCTX *tctx);
>   
>   /*
>    * KVM XIVE device helpers


