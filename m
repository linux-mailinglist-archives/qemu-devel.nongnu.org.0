Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331684D0451
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:41:03 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGPu-0002d0-A1
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:41:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nRGOa-0001B6-Lp; Mon, 07 Mar 2022 11:39:40 -0500
Received: from [2a00:1450:4864:20::22d] (port=34609
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1nRGOY-0006Ip-0n; Mon, 07 Mar 2022 11:39:40 -0500
Received: by mail-lj1-x22d.google.com with SMTP id r20so21320902ljj.1;
 Mon, 07 Mar 2022 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O6JT0/Bzl6SvjZ7zHTgPZ08MXKAI1tVThL3+aNnNtoo=;
 b=FSkKswk4jWg3hxoFuV7JW8UA7Ai5g910PX/1AKUHoODnbcTd8uhG86XD6SkcHL5qNx
 XZwaK5jDgvf5taWr+Xeg/9NdovCvg7GsWTVDvKhOdtBcE8ZaskdAeauyXfxajsnymfYL
 PDx0mGVhw6LbLYEMFM/DKU+jK9DdgrwZ8UjJupKByNFjPlSYo95zBcFmBV8gD5UVO5q5
 BLqYVYk5drHdI82KNMWa2ZVl0NruoLOOg8DdQeUnbfpt4GxBpKusy6HA5neKqonEDBna
 kKQiqprOGJsKeDZWKpE5lFjhiVJkcTpzvJ5MP+UG9aoZ0xUKbrEICTfzT1BsiffkE4WL
 98KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O6JT0/Bzl6SvjZ7zHTgPZ08MXKAI1tVThL3+aNnNtoo=;
 b=KumqceQLKj33UZzQTMNhmjrSRta1hiT9xOc9FQ+dryfwckRJ391kcmONyVdrDuUWJx
 px9/GquDw6kMpcMzaVIN04wHo1b91vmZ2kHj7m6DttOd84bf105ezAGjH9JKGQga88Ow
 DDXTgknkkcuk364jlZaWtWF3MteOIFtn6mZMFeOVvsgaCDt2DG/+WvwwSSQYZlc+B3ej
 wkzAslJlBLQr1AYWV0PWYNm4g890E92b9lsbajHafp9g2URUo8nZ5TuJ0FMRyHxUupwT
 cTw24g0rvNx0DR2AE4xV4VknND/F8EY01QOEJM0oub78HN8eC6VE379UyZ+787dRugPN
 5ndA==
X-Gm-Message-State: AOAM530UQPB/UqQckXNu0vsuRTkELhTOgEUCeS1bQAHBsO+UFQw7zAun
 99RHN84gI2j24mOFAHbrTU4=
X-Google-Smtp-Source: ABdhPJyEMjSG2TpNfKcpgAA1GCeuylIeTKvOcTrGi7Zk0rI88bSqEVhKrSb1mw8qT9il4QI+k850dw==
X-Received: by 2002:a05:651c:124d:b0:246:1a54:cc17 with SMTP id
 h13-20020a05651c124d00b002461a54cc17mr8155559ljh.301.1646671170157; 
 Mon, 07 Mar 2022 08:39:30 -0800 (PST)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 v25-20020ac25939000000b0044662feaa50sm2674442lfi.0.2022.03.07.08.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:39:29 -0800 (PST)
Date: Mon, 7 Mar 2022 17:39:28 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH] hw/block: m25p80: Add support for w25q01jvq
Message-ID: <20220307163927.GA23718@fralle-msi>
References: <20220304180920.1780992-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304180920.1780992-1-patrick@stwcx.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Mar 04] Fri 12:09:20, Patrick Williams wrote:
> The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
> and the two have been tested together.
> 
> 1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Cc: Potin Lai <potin.lai@quantatw.com>
> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index c6bf3c6bfa..7d3d8b12e0 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
>      { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
>      { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

>  };
>  
>  typedef enum {
> -- 
> 2.34.1
> 
> 

