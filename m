Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED795F7B32
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:11:13 +0200 (CEST)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpwN-00083Y-Ud
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogp2v-0002Pf-Lu; Fri, 07 Oct 2022 11:13:53 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:33385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogp2t-0004HB-Vk; Fri, 07 Oct 2022 11:13:53 -0400
Received: by mail-lf1-x134.google.com with SMTP id j4so7863158lfk.0;
 Fri, 07 Oct 2022 08:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BdHqOg2Gu9jxzhSC1couJYAt5WgalzoWVDJHsPqJhi0=;
 b=bxhYhABeaY/Z2c27V0SvBlsZshUkqpu9E72vmZ5wAbTRi6YbQlJvPzAT/sbh83CWg+
 DA+xO1t/19IhKj28zs/9DMgqKxJ//8SG0qNB01IsMco9UB3E8oIIKLBvasO716opSAWV
 LzvQNIiWO5y1BHOajuwk1xLSYsoc4ZlRrYKE8ZqfKX8a23deyxvaKWu0w0NIn1OT8Eth
 OfLe+S1QGJQ74MUf1PvJy2MwFwC7ZYWacRNqfBEjIEBi5k3GHNM5lgGFbfdTfKLPm4BA
 z/rGNDG1rH8rhhjKfxKE/smAzJRRfQalci1/jVBasirbQ57jTF6z+Cre94KIrCArx+nK
 a3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdHqOg2Gu9jxzhSC1couJYAt5WgalzoWVDJHsPqJhi0=;
 b=naNEDPMTGHue2qYoJMvnw5DbrW1zxy6QiZSdSPqqimHE1dl21eeuNLY7MaVquQRzUG
 ieZcYuoUSDiEy+8nKCTqmqdJsfRAKCIl75rVNomjceYjobW/CbZUxQAldoTQGv7trerB
 TB1qoblAN8aTaRl0PC9BNnkjVX0jss9+DKeYjhMW8+oMVC3MmZSgr42lH1PnZBDcYIP3
 C7hWsgApjN3pylzCvDe/TW0lAIhrRhulionEWdybHnn8HojnpNHhbnvtlT+UAQAhMpp7
 7YE4iHhXJ0OT+Dt8vYmxkPqA6K+C0VIQYf5hlMkjMCVALsy7D7ZrsBbFgiIiVexSXEdI
 zO+Q==
X-Gm-Message-State: ACrzQf0eMwi6ye83oW0YVqYDQzFUrTWF13/1w58rFvHsQQAD2bJ8Nt7t
 7CXExcF06iwyA3z5KmdbkX8=
X-Google-Smtp-Source: AMsMyM5wz2dWY+1STOOOmY1P21mL061iFilYt4HCrcD+4rwH/PQQ4Ld6W2m3ONtV2+i096LEWdmHew==
X-Received: by 2002:a05:6512:798:b0:497:aa2b:8b10 with SMTP id
 x24-20020a056512079800b00497aa2b8b10mr2274819lfr.636.1665155629075; 
 Fri, 07 Oct 2022 08:13:49 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05651203b200b00494813c689dsm321033lfp.219.2022.10.07.08.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:13:47 -0700 (PDT)
Date: Fri, 7 Oct 2022 17:13:45 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 6/8] m25p80: Add the w25q256 SFPD table
Message-ID: <20221007151344.GG20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-7-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-7-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x134.google.com
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

On [2022 Jul 22] Fri 08:36:00, Cédric Le Goater wrote:
> The SFDP table size is 0x100 bytes long. Only the mandatory table for
> basic features is available at byte 0x80.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  2 ++
>  hw/block/m25p80.c      |  3 ++-
>  hw/block/m25p80_sfdp.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 468e3434151b..f60429ab8542 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -21,4 +21,6 @@ extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
>  extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
>  extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
>  
> +extern uint8_t m25p80_sfdp_w25q256(uint32_t addr);
(optional -extern)

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> +
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 52df24d24751..220dbc8fb327 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -345,7 +345,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("w25q64",      0xef4017,      0,  64 << 10, 128, ER_4K) },
>      { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
>      { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
> -    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K),
> +      .sfdp_read = m25p80_sfdp_w25q256 },
>      { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
>      { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
>  };
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 38c3ced34d2e..5b011559d43d 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -218,3 +218,43 @@ static const uint8_t sfdp_mx66l1g45g[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(mx66l1g45g);
> +
> +/*
> + * Windbond
> + */
> +
> +static const uint8_t sfdp_w25q256[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x00, 0xff,
> +    0x00, 0x00, 0x01, 0x09, 0x80, 0x00, 0x00, 0xff,
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
> +    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
> +    0xff, 0xff, 0x21, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0x00, 0xff, 0xff, 0xff, 0xff,
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
> +define_sfdp_read(w25q256);
> -- 
> 2.35.3
> 

