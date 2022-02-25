Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17E4C4AF7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:38:04 +0100 (CET)
Received: from localhost ([::1]:34632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdbX-0005Yi-E2
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdQ1-0004WC-Vx; Fri, 25 Feb 2022 11:26:10 -0500
Received: from [2607:f8b0:4864:20::331] (port=44606
 helo=mail-ot1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdPz-0002M4-NL; Fri, 25 Feb 2022 11:26:09 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 u17-20020a056830231100b005ad13358af9so3929750ote.11; 
 Fri, 25 Feb 2022 08:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F87/3br0nyYDz8d1WzPEN8OqVye3+O9CRY4BqyUnkWY=;
 b=GiJcSZijPbgyolH5Dz1hjZBE4DQDpbJGJR4tGdDXkawKdvcdvrMfXDetNvmhGHiAL3
 ifIfJuTeWBwspnQ8kDUoduEbjLGuLuOxnZO4NisOusjNzxOOAi36XeiEMyhXZ5ruzSKt
 OSGdBJZ8hIt0rpHTA1IghTtVMZ+X0ELG8UmgiiaxnU8ekwhW356+yhtXQ3uKZ7qht09b
 lzGhM8hx8/O6NiRzOdc5KfrMSVbVAPhEt8k4fe62GvPUx0L9/YsM5txa9VLJsAgKuDGQ
 5MKsk7SJDJWYF0r/r1Tcp66bMDrKqowWe485rz5jTrrZ9iOtPd4LxXYJvEZOJgCSqCZq
 F9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F87/3br0nyYDz8d1WzPEN8OqVye3+O9CRY4BqyUnkWY=;
 b=HKycm/VWJVzD5wT6xgZnlkq3VG23okXeRhb84azvlxVojyiBBCcoZQOfUBw8jNfl9Z
 WugdqZl47EehBudgqQmgMjyggEEye6/3j2pzYepaF35ahUrsiuzlJQAKqxy/poD0FbMf
 Tq9vG8zLT2pMfbLXY4nokbL60lK5F6D3Ut4qIkV4xhmYbQHG1lf/pPIuzdfCtqUlNfTC
 zZH60Y/ZBaUjFLgLgltMJMy7bLv6FoB13ztBu3B0fzgcMgLINsV2egIvJrGsPWi8/NrJ
 QGjyXQFLeOHHNnVzKSBsgjeeTtnkjVuD2oNyo4cfb6be87++zZnPejkW8ERJrhGfCd/8
 XWEQ==
X-Gm-Message-State: AOAM533QGVhzlScNjxZ080b+7OLBmn6aOPTqG8FpRJ6wjq6BdXkWvKdp
 msPMS2xmMQbAr0ZMr0X8lTo=
X-Google-Smtp-Source: ABdhPJx6Pe7KOb7SyuhK0sljf60IJijAEA5zLzZDvnGpBwfMeyi94sqRmUEHeiL+fWbnbxV3kVobtg==
X-Received: by 2002:a9d:a31:0:b0:5af:244f:266 with SMTP id
 46-20020a9d0a31000000b005af244f0266mr3143400otg.252.1645806366111; 
 Fri, 25 Feb 2022 08:26:06 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a4a5d05000000b0031c67a9b54bsm1271469ooa.45.2022.02.25.08.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:26:05 -0800 (PST)
Message-ID: <e559eaca-4b46-0b0a-1b4d-cbf0f881d9ad@gmail.com>
Date: Fri, 25 Feb 2022 13:26:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 14/18] ppc/pnv: add XIVE Gen2 TIMA support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-15-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-15-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::331
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/26/21 08:53, Cédric Le Goater wrote:
> Only the CAM line updates done by the hypervisor are specific to
> POWER10. Instead of duplicating the TM ops table, we handle these
> commands locally under the PowerNV XIVE2 model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive2.h |  8 ++++
>   hw/intc/pnv_xive2.c    | 27 +++++++++++-
>   hw/intc/xive2.c        | 95 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index 9222b5b36979..cf6211a0ecb9 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -87,5 +87,13 @@ typedef struct Xive2EndSource {
>       Xive2Router     *xrtr;
>   } Xive2EndSource;
>   
> +/*
> + * XIVE2 Thread Interrupt Management Area (POWER10)
> + */
> +
> +void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx, hwaddr offset,
> +                           uint64_t value, unsigned size);
> +uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
> +                               hwaddr offset, unsigned size);
>   
>   #endif /* PPC_XIVE2_H */
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index cb12cea14fc6..4a2649893232 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -1610,15 +1610,32 @@ static const MemoryRegionOps pnv_xive2_ic_tm_indirect_ops = {
>    * TIMA ops
>    */
>   
> +/*
> + * Special TIMA offsets to handle accesses in a POWER10 way.
> + *
> + * Only the CAM line updates done by the hypervisor should be handled
> + * specifically.
> + */
> +#define HV_PAGE_OFFSET         (XIVE_TM_HV_PAGE << TM_SHIFT)
> +#define HV_PUSH_OS_CTX_OFFSET  (HV_PAGE_OFFSET | (TM_QW1_OS + TM_WORD2))
> +#define HV_PULL_OS_CTX_OFFSET  (HV_PAGE_OFFSET | TM_SPC_PULL_OS_CTX)
> +
>   static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
>                                  uint64_t value, unsigned size)
>   {
>       PowerPCCPU *cpu = POWERPC_CPU(current_cpu);
>       PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
>       XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
> +    XivePresenter *xptr = XIVE_PRESENTER(xive);
> +
> +    /* TODO: should we switch the TM ops table instead ? */
> +    if (offset == HV_PUSH_OS_CTX_OFFSET) {
> +        xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
> +        return;
> +    }
>   
>       /* Other TM ops are the same as XIVE1 */
> -    xive_tctx_tm_write(XIVE_PRESENTER(xive), tctx, offset, value, size);
> +    xive_tctx_tm_write(xptr, tctx, offset, value, size);
>   }
>   
>   static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
> @@ -1626,9 +1643,15 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
>       PowerPCCPU *cpu = POWERPC_CPU(current_cpu);
>       PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
>       XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
> +    XivePresenter *xptr = XIVE_PRESENTER(xive);
> +
> +    /* TODO: should we switch the TM ops table instead ? */
> +    if (offset == HV_PULL_OS_CTX_OFFSET) {
> +        return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
> +    }
>   
>       /* Other TM ops are the same as XIVE1 */
> -    return xive_tctx_tm_read(XIVE_PRESENTER(xive), tctx, offset, size);
> +    return xive_tctx_tm_read(xptr, tctx, offset, size);
>   }
>   
>   static const MemoryRegionOps pnv_xive2_tm_ops = {
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 26af08a5de07..e31037e1f030 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -158,6 +158,101 @@ static void xive2_end_enqueue(Xive2End *end, uint32_t data)
>       }
>       end->w1 = xive_set_field32(END2_W1_PAGE_OFF, end->w1, qindex);
>   }
> +
> +/*
> + * XIVE Thread Interrupt Management Area (TIMA) - Gen2 mode
> + */
> +
> +static void xive2_os_cam_decode(uint32_t cam, uint8_t *nvp_blk,
> +                                uint32_t *nvp_idx, bool *vo)
> +{
> +    *nvp_blk = xive2_nvp_blk(cam);
> +    *nvp_idx = xive2_nvp_idx(cam);
> +    *vo = !!(cam & TM2_QW1W2_VO);
> +}
> +
> +uint64_t xive2_tm_pull_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
> +                              hwaddr offset, unsigned size)
> +{
> +    uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
> +    uint32_t qw1w2_new;
> +    uint32_t cam = be32_to_cpu(qw1w2);
> +    uint8_t nvp_blk;
> +    uint32_t nvp_idx;
> +    bool vo;
> +
> +    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
> +
> +    if (!vo) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: pulling invalid NVP %x/%x !?\n",
> +                      nvp_blk, nvp_idx);
> +    }
> +
> +    /* Invalidate CAM line */
> +    qw1w2_new = xive_set_field32(TM2_QW1W2_VO, qw1w2, 0);
> +    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2_new, 4);
> +
> +    return qw1w2;
> +}
> +
> +static void xive2_tctx_need_resend(Xive2Router *xrtr, XiveTCTX *tctx,
> +                                   uint8_t nvp_blk, uint32_t nvp_idx)
> +{
> +    Xive2Nvp nvp;
> +    uint8_t ipb;
> +    uint8_t cppr = 0;
> +
> +    /*
> +     * Grab the associated thread interrupt context registers in the
> +     * associated NVP
> +     */
> +    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No NVP %x/%x\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    if (!xive2_nvp_is_valid(&nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid NVP %x/%x\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    ipb = xive_get_field32(NVP2_W2_IPB, nvp.w2);
> +    if (ipb) {
> +        nvp.w2 = xive_set_field32(NVP2_W2_IPB, nvp.w2, 0);
> +        xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
> +    }
> +
> +    /* An IPB or CPPR change can trigger a resend */
> +    if (ipb || cppr) {
> +        xive_tctx_ipb_update(tctx, TM_QW1_OS, ipb);
> +    }
> +}
> +
> +/*
> + * Updating the OS CAM line can trigger a resend of interrupt
> + */
> +void xive2_tm_push_os_ctx(XivePresenter *xptr, XiveTCTX *tctx,
> +                          hwaddr offset, uint64_t value, unsigned size)
> +{
> +    uint32_t cam = value;
> +    uint32_t qw1w2 = cpu_to_be32(cam);
> +    uint8_t nvp_blk;
> +    uint32_t nvp_idx;
> +    bool vo;
> +
> +    xive2_os_cam_decode(cam, &nvp_blk, &nvp_idx, &vo);
> +
> +    /* First update the thead context */
> +    memcpy(&tctx->regs[TM_QW1_OS + TM_WORD2], &qw1w2, 4);
> +
> +    /* Check the interrupt pending bits */
> +    if (vo) {
> +        xive2_tctx_need_resend(XIVE2_ROUTER(xptr), tctx, nvp_blk, nvp_idx);
> +    }
> +}
> +
>   /*
>    * XIVE Router (aka. Virtualization Controller or IVRE)
>    */

