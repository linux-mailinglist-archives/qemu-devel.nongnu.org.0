Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB8B5F7AFE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:48:19 +0200 (CEST)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpaE-0005h9-M7
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognxB-0003RW-Jm; Fri, 07 Oct 2022 10:03:55 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ognx6-00018k-Cn; Fri, 07 Oct 2022 10:03:53 -0400
Received: by mail-lf1-x130.google.com with SMTP id a29so7482510lfo.1;
 Fri, 07 Oct 2022 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I3FsUtEdz8eRgdJEYD+dMXSNHOFwTB9u3Mc+602Wzec=;
 b=WBZ2gmF0rV5QFJTi9WoLHbW/8SKk7fpn4kS9jGuMFcnb2zqfznmUPwNu1zLUSXFdRe
 4XhDFQhbu2+QkzuLVdG7GIcdgYrzRzj9Y58LooQH61tKRCSR95nWr8/x8xtnH3WhWyju
 WzMjlaVttLI6nXPZ4RwGZK39YDWa8h+jEwIDCtpSBVe0i1q1OBVWwE9Kms3ZY0iEuAcF
 tPHdaE4vn0FaJxSflSHYS4rtNzUr57R2xTPIkLhrJo+q8sFeGpuzaaMOfplfCbOq8m9s
 ER6hU6NSYAvQORJ/NX4EHsxPL6Kg0xlSfz73jz+hobTpHq9SZR5yQeKYWhNwr4T8PNGH
 S40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3FsUtEdz8eRgdJEYD+dMXSNHOFwTB9u3Mc+602Wzec=;
 b=LFARfR6yvLbAhYhJVqG+100oGVDDet6deojt2inzfOZIp08NUEQzVzMJzG5YFIhC2+
 p7wTf8FnWrcvze2r8PuBwfJS5fYg+bKeG+Rb6gifz2lCX1OA12SOmvo5cxG6snYBsr4C
 jjJulDqJyqwz5XFffj2JTVZafvW6zzjy8r7L0dXqc2VxGHXcESYaiKbW3qHYakX0vpDR
 kOc+KaWs39P0HI3vOCkBPNyDcd0iTT0UP+qEXHK3yTRsiskH6/pmORJ3+eTEd0RH1tSb
 X/fNKDFAFqU8Tct8YDTBcYJICIUf3Ky5S5mBtm5rN/oAhOKJcD2H81FlK3u2FfFiUr4Z
 IV1Q==
X-Gm-Message-State: ACrzQf3yhiBTjz5PZfzmv4nWwyO4VT9OVP0fo1Y4AsjMUHKeTy3KKwSO
 G50cp/GaAGLRlcDQYzf54osC4GsH8UwCkA==
X-Google-Smtp-Source: AMsMyM6xHOAqcWqXOLZqON4yVx/htew/FuKJtuitpk5fNKybDsJpBJCQTPOA3jr3JUpLbUk6mLjeNg==
X-Received: by 2002:a05:6512:3f08:b0:4a1:af5e:5643 with SMTP id
 y8-20020a0565123f0800b004a1af5e5643mr1954821lfa.86.1665151423846; 
 Fri, 07 Oct 2022 07:03:43 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a2eb706000000b0026dcf81d804sm277347ljo.31.2022.10.07.07.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:03:42 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:03:40 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 2/8] m25p80: Add the n25q256a SFDP table
Message-ID: <20221007140337.GC20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-3-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Jul 22] Fri 08:35:56, Cédric Le Goater wrote:
> The same values were collected on 4 differents OpenPower systems,
> palmettos, romulus and tacoma.
> 
> The SFDP table size is defined as being 0x100 bytes but it could be
> bigger. Only the mandatory table for basic features is available at
> byte 0x30.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  2 ++
>  hw/block/m25p80.c      |  8 +++---
>  hw/block/m25p80_sfdp.c | 58 ++++++++++++++++++++++++++++++++++++++++++
>  hw/block/meson.build   |  1 +
>  4 files changed, 66 insertions(+), 3 deletions(-)
>  create mode 100644 hw/block/m25p80_sfdp.c
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 230b07ef3308..d3a0a778ae84 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -15,4 +15,6 @@
>   */
>  #define M25P80_SFDP_MAX_SIZE  (1 << 24)
>  
> +extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);

(-extern above if we would like)


> +
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index abdc4c0b0da7..13e7b28fd2b0 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -247,13 +247,15 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
>      { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
>      { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
> -    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K),
> +      .sfdp_read = m25p80_sfdp_n25q256a },
>      { INFO("n25q512a11",  0x20bb20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q512a13",  0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512,
> -           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB) },
> -    { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> +           ER_4K | HAS_SR_BP3_BIT6 | HAS_SR_TB),
> +      .sfdp_read = m25p80_sfdp_n25q256a },
> +   { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
>      { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> new file mode 100644
> index 000000000000..24ec05de79a1
> --- /dev/null
> +++ b/hw/block/m25p80_sfdp.c
> @@ -0,0 +1,58 @@
> +/*
> + * M25P80 Serial Flash Discoverable Parameter (SFDP)
> + *
> + * Copyright (c) 2020, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/host-utils.h"
> +#include "m25p80_sfdp.h"
> +
> +#define define_sfdp_read(model)                                       \
> +    uint8_t m25p80_sfdp_##model(uint32_t addr)                        \
> +    {                                                                 \
> +        assert(is_power_of_2(sizeof(sfdp_##model)));                  \
> +        return sfdp_##model[addr & (sizeof(sfdp_##model) - 1)];       \
> +    }
> +
> +/*
> + * Micron
> + */
> +static const uint8_t sfdp_n25q256a[] = {

The datasheets I found wasn't completetly as this table but I can't argue
with the hw read out of 4 flashes.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x29, 0xeb, 0x27, 0x6b, 0x08, 0x3b, 0x27, 0xbb,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x27, 0xbb,
> +    0xff, 0xff, 0x29, 0xeb, 0x0c, 0x20, 0x10, 0xd8,
> +    0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(n25q256a);
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 2389326112ae..3129ca4c52eb 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -12,6 +12,7 @@ softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
>  softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
>  softmmu_ss.add(when: 'CONFIG_PFLASH_CFI02', if_true: files('pflash_cfi02.c'))
>  softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
> +softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
>  softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>  softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
> -- 
> 2.35.3
> 

