Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED25A4C4714
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:07:56 +0100 (CET)
Received: from localhost ([::1]:59984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbGF-0006QR-FN
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:07:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNatb-0008W6-4I; Fri, 25 Feb 2022 08:44:31 -0500
Received: from [2607:f8b0:4864:20::335] (port=33691
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNatZ-0002im-4s; Fri, 25 Feb 2022 08:44:30 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 j8-20020a056830014800b005ad00ef6d5dso3667239otp.0; 
 Fri, 25 Feb 2022 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kbm6kim/dmb8aMN1uOAc9YspaXxbaFhaX5SLsE5YbQg=;
 b=BSi+/6OSFXbVvmQriuTTtDtkONHbkUc1pNHtjHMCx/ee/pBgw6xCWIqVjt/pJBxuBB
 Znb1rMXEj/nuwdRxWSoMw0r0t+5b5oBb24VVYUs6J3+pJJYj1V84KzPx2xeHkJoKvuEo
 rJDPzR39dYxhmQF8FJVf0sVY7roISjF4AgMLQ3iiT7mxQFFe8DMoXqZSDzJeEhB1F2Yx
 VzNmy+QD/AwWOrh2IB0JAvlsGXhXtEORjY3ajMvsRijOFdFsG2+Qfh/gGL3ULEitD6oH
 DuDg0ZKnU77BR8ZQRgYj7DZuVtnMHAy2RvFMmVIBRSWzN9WAtb2Ub1G51sIpthustgJS
 qGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kbm6kim/dmb8aMN1uOAc9YspaXxbaFhaX5SLsE5YbQg=;
 b=CRIotRCY4iDiUvrho7pe/9N00ZQN/5eJ/L0GtmEYCSvh6YQU26EIz4D8FT6VFssRW2
 dhbAZoCNL21iuBggwoIY9gYWy0aT+vMMGChsUTTvuJnGKLLF25GiOgB9xtDXOmLa+jEq
 10K7WHMBG2tVLZVGCdXzxJXghKK3LCJYqhJNwK5kV7i3B3tjrkMquhmeJZeYLDQMj34y
 ghUbkJPz7OhDbKZo9ggkwJ/l/HYLAQp8gu6yNPKFEZnK/2vpHU9c0HJ/PvvPt/KXiD8P
 UxaSvAeOswBf/05cWx53GD7ddwkA3BVgKp0r6ddenPbh1qANWUQuMbKS1QpejqVbtU+e
 iT2g==
X-Gm-Message-State: AOAM533t2jjqdM96ABVf7AoTrztTs2gXVcvdn9HdcAviDwSg827HIyJc
 5JBJ07PQvBM6U3SxueQtmbE=
X-Google-Smtp-Source: ABdhPJxYZxfiPFMfVDS1bYFiC6ujhjX4tkVC5UQof4ysc/eNXGs/ukSc7Zumg9CTtBQd3mVdzkrcMw==
X-Received: by 2002:a05:6830:1bf2:b0:5ad:549e:30b5 with SMTP id
 k18-20020a0568301bf200b005ad549e30b5mr2671392otb.18.1645796663332; 
 Fri, 25 Feb 2022 05:44:23 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a4a2c06000000b0031c0514194fsm1048479ooo.31.2022.02.25.05.44.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 05:44:23 -0800 (PST)
Message-ID: <fa4f9014-a8c2-7bef-a0b4-4b1f231f101e@gmail.com>
Date: Fri, 25 Feb 2022 10:44:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/18] ppc/xive2: Introduce a presenter matching routine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-3-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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
> The VP space is larger in XIVE2 (P10), 24 bits instead of 19bits on
> XIVE (P9), and the CAM line can use a 7bits or 8bits thread id.
> 
> For now, we only use 7bits thread ids, same as P9, but because of the
> change of the size of the VP space, the CAM matching routine is
> different between P9 and P10. It is easier to duplicate the whole
> routine than to add extra handlers in xive_presenter_tctx_match() used
> for P9.
> 
> We might come with a better solution later on, after we have added
> some more support for the XIVE2 controller.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive2.h |  9 +++++
>   hw/intc/xive2.c        | 82 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 91 insertions(+)
> 
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index a3cd02520475..e881c039d9c0 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -55,6 +55,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>   
>   void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
>   
> +/*
> + * XIVE2 Presenter (POWER10)
> + */
> +
> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
> +                               uint8_t format,
> +                               uint8_t nvt_blk, uint32_t nvt_idx,
> +                               bool cam_ignore, uint32_t logic_serv);
> +
>   /*
>    * XIVE2 END ESBs  (POWER10)
>    */
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index e4aa614f3cc8..9e186bbb6cd9 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -209,6 +209,88 @@ static int xive2_router_get_block_id(Xive2Router *xrtr)
>      return xrc->get_block_id(xrtr);
>   }
>   
> +/*
> + * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
> + * width and block id width is configurable at the IC level.
> + *
> + *    chipid << 24 | 0000 0000 0000 0000 1 threadid (7Bit)
> + *    chipid << 24 | 0000 0000 0000 0001 threadid   (8Bit)
> + */
> +static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tctx)
> +{
> +    Xive2Router *xrtr = XIVE2_ROUTER(xptr);
> +    CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
> +    uint32_t pir = env->spr_cb[SPR_PIR].default_value;
> +    uint8_t blk = xive2_router_get_block_id(xrtr);
> +    uint8_t tid_shift = 7;
> +    uint8_t tid_mask = (1 << tid_shift) - 1;
> +
> +    return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
> +}
> +
> +/*
> + * The thread context register words are in big-endian format.
> + */
> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
> +                               uint8_t format,
> +                               uint8_t nvt_blk, uint32_t nvt_idx,
> +                               bool cam_ignore, uint32_t logic_serv)
> +{
> +    uint32_t cam =   xive2_nvp_cam_line(nvt_blk, nvt_idx);
> +    uint32_t qw3w2 = xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
> +    uint32_t qw2w2 = xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL]);
> +    uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
> +    uint32_t qw0w2 = xive_tctx_word2(&tctx->regs[TM_QW0_USER]);
> +
> +    /*
> +     * TODO (PowerNV): ignore mode. The low order bits of the NVT
> +     * identifier are ignored in the "CAM" match.
> +     */
> +
> +    if (format == 0) {
> +        if (cam_ignore == true) {
> +            /*
> +             * F=0 & i=1: Logical server notification (bits ignored at
> +             * the end of the NVT identifier)
> +             */
> +            qemu_log_mask(LOG_UNIMP, "XIVE: no support for LS NVT %x/%x\n",
> +                          nvt_blk, nvt_idx);
> +            return -1;
> +        }
> +
> +        /* F=0 & i=0: Specific NVT notification */
> +
> +        /* PHYS ring */
> +        if ((be32_to_cpu(qw3w2) & TM2_QW3W2_VT) &&
> +            cam == xive2_tctx_hw_cam_line(xptr, tctx)) {
> +            return TM_QW3_HV_PHYS;
> +        }
> +
> +        /* HV POOL ring */
> +        if ((be32_to_cpu(qw2w2) & TM2_QW2W2_VP) &&
> +            cam == xive_get_field32(TM2_QW2W2_POOL_CAM, qw2w2)) {
> +            return TM_QW2_HV_POOL;
> +        }
> +
> +        /* OS ring */
> +        if ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
> +            cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) {
> +            return TM_QW1_OS;
> +        }
> +    } else {
> +        /* F=1 : User level Event-Based Branch (EBB) notification */
> +
> +        /* USER ring */
> +        if  ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
> +             (cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) &&
> +             (be32_to_cpu(qw0w2) & TM2_QW0W2_VU) &&
> +             (logic_serv == xive_get_field32(TM2_QW0W2_LOGIC_SERV, qw0w2))) {
> +            return TM_QW0_USER;
> +        }
> +    }
> +    return -1;
> +}
> +
>   static void xive2_router_realize(DeviceState *dev, Error **errp)
>   {
>       Xive2Router *xrtr = XIVE2_ROUTER(dev);

