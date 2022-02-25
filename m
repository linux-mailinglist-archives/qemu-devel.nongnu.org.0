Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8D4C4B05
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:41:17 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdee-0000Wx-4C
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdSC-0006g9-Rf; Fri, 25 Feb 2022 11:28:24 -0500
Received: from [2607:f8b0:4864:20::c31] (port=41795
 helo=mail-oo1-xc31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdSA-0002cx-Nf; Fri, 25 Feb 2022 11:28:24 -0500
Received: by mail-oo1-xc31.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so6849160oob.8; 
 Fri, 25 Feb 2022 08:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sd9NUKW7/JMrOZR5qCjJdPEsRMI/5o1rCKA5JHLuaV8=;
 b=nqcXCJ5LziApALt77Z5oK/CybElstVpV+4W3y08JMhB04XW/g6+m42yGChKhZWu1N8
 XNmgMygWeHVKBKy2QSfn6QyW8o3s/RsvvlY6T7C7UgEIbWlF94f+0S1r6FNexzDNoO0y
 CZCCF5Y7yM+9tm/1aMABRgwQ6HT48KFc4KxnGSimfcmceAvERf1ZFQewwqeBvFUuDumc
 3oNid9YrRPURrdzfRccirmAIaLaKHd9GREeA88ghqcalEpawNAXSlf+s3PjweHBAbJpd
 hIOTFXtAXFJ5kOFWI+ho29RGLOKyRNzo8HaNpR3oV5UiLWvqvvD0hS/w/IrShvuSU3R2
 KHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sd9NUKW7/JMrOZR5qCjJdPEsRMI/5o1rCKA5JHLuaV8=;
 b=LlpMTj9q5G5o8+jWsybyhHATAljAcnqKm4C6DF2f/pPwy1nWm9h5sea1OobxGjGKH6
 CkJaemrpkf1UdGUEFL4jtDbc49K7m9r/VlYh6C7wb5Nds0MixupDMf+nFnz5CQKfrFbq
 7rmO7Z/FGDzsmVhwJLpToLY9rUAgfLed/Is4NzaRypSnptaPh7XblNKlOKJzw7SHEUwW
 t0bFFC4vT5GB+q2gS4Lonm4aSYn3YHkHbu+Ks2s92P/mhw6fO94MH/SGtmktazMVIuad
 Ulgg8uFMU/FFVuxcI9hJdaFPdNubtPCa6NOXCX7Ykc2T0T1CAT8Ra0nX0HZo/LO/fBsg
 mZ8Q==
X-Gm-Message-State: AOAM533v8/qeKDIaL8Gsm77kb7s3ddecuOn2g9KWL6Xv4umFg7cnipco
 q9ajFgAOex1RtDmBPOAxjb0=
X-Google-Smtp-Source: ABdhPJxVXxBY0uq3jzLzFyeFd1mfzGxXMx5X3xWjlAiklz0VSA3csbNlbb2GFerK0QsLBi8On9z26A==
X-Received: by 2002:a05:6870:f819:b0:d2:cc3f:5e9 with SMTP id
 fr25-20020a056870f81900b000d2cc3f05e9mr1626769oab.35.1645806501046; 
 Fri, 25 Feb 2022 08:28:21 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 ex5-20020a056870ed4500b000a8853e8651sm1344773oab.23.2022.02.25.08.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:28:20 -0800 (PST)
Message-ID: <4ff9be10-7637-7fab-06fa-06ce309cb178@gmail.com>
Date: Fri, 25 Feb 2022 13:28:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 15/18] pnv/xive2: Add support XIVE2 P9-compat mode (or
 Gen1)
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-16-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-16-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc31.google.com
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
> The thread interrupt management area (TIMA) is a set of pages mapped
> in the Hypervisor and in the guest OS address space giving access to
> the interrupt thread context registers for interrupt management, ACK,
> EOI, CPPR, etc.
> 
> XIVE2 changes slightly the TIMA layout with extra bits for the new
> features, larger CAM lines and the controller provides configuration
> switches for backward compatibility. This is called the XIVE2
> P9-compat mode, of Gen1 TIMA. It impacts the layout of the TIMA and
> the availability of the internal features associated with it,
> Automatic Save & Restore for instance. Using a P9 layout also means
> setting the controller in such a mode at init time.
> 
> As the OPAL driver initializes the XIVE2 controller with a XIVE2/P10
> TIMA directly, the XIVE2 model only has a simple support for the
> compat mode in the OS TIMA.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/intc/pnv_xive2_regs.h |  6 ++++++
>   hw/intc/pnv_xive2.c      | 22 +++++++++++++++++-----
>   2 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/intc/pnv_xive2_regs.h b/hw/intc/pnv_xive2_regs.h
> index 46d4fb378135..902220e6be69 100644
> --- a/hw/intc/pnv_xive2_regs.h
> +++ b/hw/intc/pnv_xive2_regs.h
> @@ -60,6 +60,12 @@
>   #define    CQ_XIVE_CFG_HYP_HARD_BLKID_OVERRIDE  PPC_BIT(16)
>   #define    CQ_XIVE_CFG_HYP_HARD_BLOCK_ID        PPC_BITMASK(17, 23)
>   
> +#define    CQ_XIVE_CFG_GEN1_TIMA_OS             PPC_BIT(24)
> +#define    CQ_XIVE_CFG_GEN1_TIMA_HYP            PPC_BIT(25)
> +#define    CQ_XIVE_CFG_GEN1_TIMA_HYP_BLK0       PPC_BIT(26) /* 0 if bit[25]=0 */
> +#define    CQ_XIVE_CFG_GEN1_TIMA_CROWD_DIS      PPC_BIT(27) /* 0 if bit[25]=0 */
> +#define    CQ_XIVE_CFG_GEN1_END_ESX             PPC_BIT(28)
> +
>   /* Interrupt Controller Base Address Register - 512 pages (32M) */
>   #define X_CQ_IC_BAR                             0x08
>   #define CQ_IC_BAR                               0x040
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index 4a2649893232..b364ee3b306b 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -444,6 +444,8 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, uint8_t format,
>       PnvChip *chip = xive->chip;
>       int count = 0;
>       int i, j;
> +    bool gen1_tima_os =
> +        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
>   
>       for (i = 0; i < chip->nr_cores; i++) {
>           PnvCore *pc = chip->cores[i];
> @@ -460,9 +462,15 @@ static int pnv_xive2_match_nvt(XivePresenter *xptr, uint8_t format,
>   
>               tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
>   
> -            ring = xive2_presenter_tctx_match(xptr, tctx, format, nvt_blk,
> -                                              nvt_idx, cam_ignore,
> -                                              logic_serv);
> +            if (gen1_tima_os) {
> +                ring = xive_presenter_tctx_match(xptr, tctx, format, nvt_blk,
> +                                                 nvt_idx, cam_ignore,
> +                                                 logic_serv);
> +            } else {
> +                ring = xive2_presenter_tctx_match(xptr, tctx, format, nvt_blk,
> +                                                   nvt_idx, cam_ignore,
> +                                                   logic_serv);
> +            }
>   
>               /*
>                * Save the context and follow on to catch duplicates,
> @@ -1627,9 +1635,11 @@ static void pnv_xive2_tm_write(void *opaque, hwaddr offset,
>       PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
>       XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
>       XivePresenter *xptr = XIVE_PRESENTER(xive);
> +    bool gen1_tima_os =
> +        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
>   
>       /* TODO: should we switch the TM ops table instead ? */
> -    if (offset == HV_PUSH_OS_CTX_OFFSET) {
> +    if (!gen1_tima_os && offset == HV_PUSH_OS_CTX_OFFSET) {
>           xive2_tm_push_os_ctx(xptr, tctx, offset, value, size);
>           return;
>       }
> @@ -1644,9 +1654,11 @@ static uint64_t pnv_xive2_tm_read(void *opaque, hwaddr offset, unsigned size)
>       PnvXive2 *xive = pnv_xive2_tm_get_xive(cpu);
>       XiveTCTX *tctx = XIVE_TCTX(pnv_cpu_state(cpu)->intc);
>       XivePresenter *xptr = XIVE_PRESENTER(xive);
> +    bool gen1_tima_os =
> +        xive->cq_regs[CQ_XIVE_CFG >> 3] & CQ_XIVE_CFG_GEN1_TIMA_OS;
>   
>       /* TODO: should we switch the TM ops table instead ? */
> -    if (offset == HV_PULL_OS_CTX_OFFSET) {
> +    if (!gen1_tima_os && offset == HV_PULL_OS_CTX_OFFSET) {
>           return xive2_tm_pull_os_ctx(xptr, tctx, offset, size);
>       }
>   

