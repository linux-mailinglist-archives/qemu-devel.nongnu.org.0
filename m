Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D55F7A81
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:26:26 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpF2-0008Ay-SM
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogoad-000663-ES; Fri, 07 Oct 2022 10:44:39 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogoab-00087G-DZ; Fri, 07 Oct 2022 10:44:38 -0400
Received: by mail-lj1-x232.google.com with SMTP id a12so5950743ljr.7;
 Fri, 07 Oct 2022 07:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c9g9gqS0l7jC0Nc6xKddj5ituTuY4IAP6mrG4rTHp4k=;
 b=XZuqZy0dcNqcfvb8fsF+eYgl0fwvP/+IzW9tA2uBX60xA6/BDrsVwJ4fvierE8oMR1
 hG/zjqzNUcHFIlGPfd/d0xLKTXNi1pu/P15DJAmPdT1EdroJKyoKBVtGKNGy0ySMvtuy
 +g23pwP4H2dbfC/VttMai4tOoz+WloJA8WpHHND+BY1QayFKO3rd0ZUbY99VyBX+5gki
 mcnCNLeH7SLSNfKaycPq8ZgwqfICZCQmRGPz9E7ws1twJdJTHM4SRwTP5pWFtbvzoLYe
 qx83j6m0khDAegtg9H6cGCMq4i6ppgV2nr9skBWh9qUR20tTQ00vTiM7/JFVNXfpJG8a
 VWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c9g9gqS0l7jC0Nc6xKddj5ituTuY4IAP6mrG4rTHp4k=;
 b=FAKbovRcnoXMhkNZh96KuLg1CJHHM8DGKw2s4JDGY9I8SegmiFsLmY+WXHZFEDVW0k
 a/6SFyrGBtFV0xpkonPdzFa2cZ8h9Qeciclj/jpg3kT7QFNn1SDx1tyGf41+jYY6p4Df
 7WYVxpwAwFobx8s1TmvJbMabRqCXIYqUtNvwM87zYq+eZPZ8k+gD6e6wiatroGyp5qK3
 3hknwSf8RazIBqhpP0YvXhXMREvc7rd6rvUu1m+Y56Poq/v4I0eBt8ysZlwTbi5bFX+T
 gFL2SR227/WL0z/Y4T9ICNryUKs0W4HauPt64pv8COTkxfI/B91wHHbPFu8Zns4IWK2I
 0IzA==
X-Gm-Message-State: ACrzQf3QSAYdtmG1npwVUTglPkdZKSjktfeNGA6PqogVxA5ZWs3RT/GN
 8qI3UKNpmNueFQAKTlsinDg=
X-Google-Smtp-Source: AMsMyM5m7eyU77VSilFCQD0XOgP5YzKyT6UUjE7XecEsM39r+3vExkMiFTxa15AT82BMUkbyVSyhpg==
X-Received: by 2002:a2e:a41a:0:b0:26d:e82f:ea5c with SMTP id
 p26-20020a2ea41a000000b0026de82fea5cmr1873505ljn.514.1665153874776; 
 Fri, 07 Oct 2022 07:44:34 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a19ee03000000b00494716e4f23sm319585lfb.111.2022.10.07.07.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:44:33 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:44:32 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
Message-ID: <20221007144431.GE20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-5-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x232.google.com
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

On [2022 Jul 22] Fri 08:35:58, Cédric Le Goater wrote:
> The mx25l25635e and mx25l25635f chips have the same JEDEC id but the
> mx25l25635f has more capabilities reported in the SFDP table. Support
> for 4B opcodes is of interest because it is exploited by the Linux
> kernel.
> 
> The SFDP table size is 0x200 bytes long. The mandatory table for basic
> features is available at byte 0x30 and an extra Macronix specific
> table is available at 0x60.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  1 +
>  hw/block/m25p80.c      |  2 ++
>  hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 0c46e669b335..87690a173c78 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -18,6 +18,7 @@
>  extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
>  
>  extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
> +extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
(optional -extern above)

>  
>  
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 028b026d8ba2..6b120ce65212 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>      { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
>        .sfdp_read = m25p80_sfdp_mx25l25635e },
> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 0),

I think I'm not seeing the extended id part in the datasheet I've found so
might be that you can switch to just INFO and _ext_id 0 above (might be the
same in the previous patch with the similar flash). Otherwise looks good to
me:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>


> +      .sfdp_read = m25p80_sfdp_mx25l25635f },
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>      { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 6499c4c39954..70c13aea7c63 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -82,3 +82,71 @@ static const uint8_t sfdp_mx25l25635e[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(mx25l25635e)
> +
> +static const uint8_t sfdp_mx25l25635f[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
> +    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
> +    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x00, 0x36, 0x00, 0x27, 0x9d, 0xf9, 0xc0, 0x64,
> +    0x85, 0xcb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xc2, 0xf5, 0x08, 0x0a,
> +    0x08, 0x04, 0x03, 0x06, 0x00, 0x00, 0x07, 0x29,
> +    0x17, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
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
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(mx25l25635f);
> -- 
> 2.35.3
> 

