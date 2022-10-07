Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799F5F7B13
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:55:23 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogph4-0005Of-4S
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogp3O-0003Sn-GY; Fri, 07 Oct 2022 11:14:23 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:36584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogp3M-0004K9-J6; Fri, 07 Oct 2022 11:14:22 -0400
Received: by mail-lf1-x135.google.com with SMTP id bu25so7765640lfb.3;
 Fri, 07 Oct 2022 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tAKJ8t2DHEPZMbyCSdY5m6ep0+fQIJx3NX2yPmLZGgo=;
 b=UheHTgHgGos9n5KZlcOr2lID0T94Blji2GGXcigvTHh6YnXqdb90zFQBc7t0PYf5+/
 eD1yzVwCuHIKIy6EpcYieTX63L6bLCdewUU3NfxL61ID++ALlfQ/sHvqqdYb3mUOhb6P
 wfUExPUSL9/6FriIlbNvKfp0km0W3Y941AYrf5+JCY6A6MWmEoukQVE2VV4WwivVvRCT
 TrdPRyKsdqlisOwdAk9Hc+um8Q6aNCZspeNLGDJnDpwaWmCL82N1JFBWkD2PRo4BpfEQ
 ibHNNf8zWknSfh/ygtkw3//mjiaPEUG03Q/4ZnpWu8zdSHpCJXi+QffEmtPG2rA1n0Si
 tU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tAKJ8t2DHEPZMbyCSdY5m6ep0+fQIJx3NX2yPmLZGgo=;
 b=eP6mmw/2UszObCG15KhkwWDaIYL6XeOAM3kKl4C6PZzO2dJhaV8MkcVoNJYsc9FXWw
 F8OuXZqqiIcu/WQ/34dA7UB95x5LXnjpeiIlACDFiRsnyoMoRCiavb2siQdYzVRsI15e
 9ALWDJskIDpG7hNo/8GQ+6O5glxoVWmk+NVENJEgtSfOBj6CL78ylc2+TAvCfBfChKrU
 0cY7LSc3eSNU0x11O2XUGaFCbFpkPle0lH5F3Z5pjy/nZvzqvj93Jly7OrXP/ZzMpPHe
 I4UsaaGMa635s94sG5sqK7msN1AWgHQHiV7Ysjffr+wlWlLm/V73PzazagqXkBYtGgSn
 MqPQ==
X-Gm-Message-State: ACrzQf2En3vt0fftKBca5aWGYiaRweSGz+UjcYiJJICIaTuo6trMgDJL
 3E2t8GIp6wYK3qC2Vqa5eFc=
X-Google-Smtp-Source: AMsMyM7K7s0QjcYKL1ikdhAarQ1OIvX1flYKp+dzvVcr66098QKE05GolLQ9vxqOHHCmnzXxAgovOQ==
X-Received: by 2002:a05:6512:2281:b0:4a2:e81:6873 with SMTP id
 f1-20020a056512228100b004a20e816873mr2015310lfu.273.1665155658177; 
 Fri, 07 Oct 2022 08:14:18 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f17-20020ac25331000000b00496693860dcsm322210lfh.232.2022.10.07.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:14:17 -0700 (PDT)
Date: Fri, 7 Oct 2022 17:14:15 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 7/8] m25p80: Add the w25q512jv SFPD table
Message-ID: <20221007151414.GH20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-8-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-8-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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

On [2022 Jul 22] Fri 08:36:01, Cédric Le Goater wrote:
> The SFDP table size is 0x100 bytes long. The mandatory table for basic
> features is available at byte 0x80 and two extra Winbond specifics
> table are available at 0xC0 and 0xF0.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  1 +
>  hw/block/m25p80.c      |  3 ++-
>  hw/block/m25p80_sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index f60429ab8542..62f140a2fcef 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -22,5 +22,6 @@ extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
>  extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
>  
>  extern uint8_t m25p80_sfdp_w25q256(uint32_t addr);
> +extern uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
(optional -extern)

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

>  
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 220dbc8fb327..8ba9d732a323 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -347,7 +347,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
>      { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
>        .sfdp_read = m25p80_sfdp_w25q256 },
> -    { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
> +    { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K),
> +      .sfdp_read = m25p80_sfdp_w25q512jv },
>      { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
>  };
>  
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 5b011559d43d..dad3d7e64f9f 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -258,3 +258,39 @@ static const uint8_t sfdp_w25q256[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(w25q256);
> +
> +static const uint8_t sfdp_w25q512jv[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
> +    0x00, 0x06, 0x01, 0x10, 0x80, 0x00, 0x00, 0xff,
> +    0x84, 0x00, 0x01, 0x02, 0xd0, 0x00, 0x00, 0xff,
> +    0x03, 0x00, 0x01, 0x02, 0xf0, 0x00, 0x00, 0xff,
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
> +    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x1f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
> +    0xff, 0xff, 0x40, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0x00, 0x36, 0x02, 0xa6, 0x00,
> +    0x82, 0xea, 0x14, 0xe2, 0xe9, 0x63, 0x76, 0x33,
> +    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xa2, 0xd5, 0x5c,
> +    0x19, 0xf7, 0x4d, 0xff, 0xe9, 0x70, 0xf9, 0xa5,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0x0a, 0xf0, 0xff, 0x21, 0xff, 0xdc, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(w25q512jv);
> -- 
> 2.35.3
> 

