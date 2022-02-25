Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD8D4C4B19
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:44:41 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdhw-0003M3-MF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdXX-0002f9-8h; Fri, 25 Feb 2022 11:33:58 -0500
Received: from [2607:f8b0:4864:20::22e] (port=42601
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNdXU-0003Wb-GL; Fri, 25 Feb 2022 11:33:54 -0500
Received: by mail-oi1-x22e.google.com with SMTP id a6so7975555oid.9;
 Fri, 25 Feb 2022 08:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mSwGXf00eR92GiCUPPGN89+4kb5OnoRkEFmdsHn+Hgw=;
 b=bo3L/HbNtxjx5VmTZMwextpNZpIcj5bTQSms8Q6aaTsdDA1rfHtBuDWpgfR3lmWJHZ
 zWVlPi/Mkx5caXt72tDosRbxEiNpQCSD3xSK19f4LawNecrETXgZef+jTJG+bDH4HtIU
 JzSCh7R8XCoM5fxAdoitSi7vlzbFhDsoeN4wB3cFXNY4l2IQFxrluTRrmoEnvDKsBaBD
 a9/BNHq9908cAUDLmCNb3GrRj8Fthrws9sWSFLTliv0/4PUJ9cy3fZffakU2sXnmHZiW
 ksWQLxVPLNhkpJQ4AwFqHC/jOh9M3Mq48jsXOWUDct7hCnh4NPZxVtLFkuxZR9Hz8EbI
 rWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mSwGXf00eR92GiCUPPGN89+4kb5OnoRkEFmdsHn+Hgw=;
 b=siPBqBfFJTaZaxVDGuiqVohl75S1spXJkjuroA10aM1QfSC1AB0q/BGoMWGKIRyj6Z
 kSpPMKopsWQmuUOGg3oNcK/dHbKxPbFVJdJelTQFV45HlJpMovjMa2ohSedpZrX1JkA+
 Cdbt2WcrhSek5VdfXt4uh2os5o4B/HgvDRsbr+tTX4YqAdZ+TuNV/VF0rDACnsDJiD3b
 1d10vi/T4WPILs+v3eArdZDnfelVeucA8gQ66gwqTsg9imVT3gfXPDqfce53G3xQkwwX
 7Wpj8oAM7xdeouPKTqL7RSWQ1V5nlD7IaK8wB+IU/gpbIpGcWyAMKRetkz2aFpTr3IRR
 eCog==
X-Gm-Message-State: AOAM533lpi0GNnLULE90MWm/X0aSVI5fjR1QsImc8xK+DkkzBdJgucoo
 4Twv2wgDksHso2YYucTFBls=
X-Google-Smtp-Source: ABdhPJzOFmcFjXGgWRXcPcHMjIQNytGU8PzTTcqlW4tol6JO9gU+FLjA5rZwHTmbvHRO2eYpYFzg+A==
X-Received: by 2002:a05:6808:23cf:b0:2d7:1fca:4792 with SMTP id
 bq15-20020a05680823cf00b002d71fca4792mr56409oib.5.1645806831195; 
 Fri, 25 Feb 2022 08:33:51 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 d35-20020a9d2926000000b005ad1fa8da87sm1303273otb.53.2022.02.25.08.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:33:50 -0800 (PST)
Message-ID: <e47f8ed3-bedd-1a76-701c-cf1a566efb44@gmail.com>
Date: Fri, 25 Feb 2022 13:33:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 18/18] pnv/xive2: Add support for 8bits thread id
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211126115349.2737605-1-clg@kaod.org>
 <20211126115349.2737605-19-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211126115349.2737605-19-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
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
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/ppc/xive2.h | 1 +
>   hw/intc/pnv_xive2.c    | 5 +++++
>   hw/intc/xive2.c        | 3 ++-
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> index 88c3e393162d..001388ccea7a 100644
> --- a/include/hw/ppc/xive2.h
> +++ b/include/hw/ppc/xive2.h
> @@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(Xive2Router, Xive2RouterClass, XIVE2_ROUTER);
>   
>   #define XIVE2_GEN1_TIMA_OS      0x00000001
>   #define XIVE2_VP_SAVE_RESTORE   0x00000002
> +#define XIVE2_THREADID_8BITS    0x00000004
>   
>   typedef struct Xive2RouterClass {
>       SysBusDeviceClass parent;
> diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
> index 6f0a63cd3d2f..5aaccaf78934 100644
> --- a/hw/intc/pnv_xive2.c
> +++ b/hw/intc/pnv_xive2.c
> @@ -438,6 +438,11 @@ static uint32_t pnv_xive2_get_config(Xive2Router *xrtr)
>           cfg |= XIVE2_VP_SAVE_RESTORE;
>       }
>   
> +    if (GETFIELD(CQ_XIVE_CFG_HYP_HARD_RANGE,
> +              xive->cq_regs[CQ_XIVE_CFG >> 3]) == CQ_XIVE_CFG_THREADID_8BITS) {
> +        cfg |= XIVE2_THREADID_8BITS;
> +    }
> +
>       return cfg;
>   }
>   
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index 978a0e3972e1..6b46f7021b46 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -458,7 +458,8 @@ static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tctx)
>       CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
>       uint32_t pir = env->spr_cb[SPR_PIR].default_value;
>       uint8_t blk = xive2_router_get_block_id(xrtr);
> -    uint8_t tid_shift = 7;
> +    uint8_t tid_shift =
> +        xive2_router_get_config(xrtr) & XIVE2_THREADID_8BITS ? 8 : 7;
>       uint8_t tid_mask = (1 << tid_shift) - 1;
>   
>       return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));

