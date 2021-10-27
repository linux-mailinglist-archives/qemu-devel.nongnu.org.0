Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4343C142
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:21:32 +0200 (CEST)
Received: from localhost ([::1]:46686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaRP-0004gi-Jm
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaLs-0006Sq-2D; Wed, 27 Oct 2021 00:15:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaLl-0003tC-Bz; Wed, 27 Oct 2021 00:15:46 -0400
Received: by mail-wr1-x42b.google.com with SMTP id e4so1767276wrc.7;
 Tue, 26 Oct 2021 21:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DBOXOA7PL7QbcyVM/gdsNC0oGoQL4dt90HL6w85Y1p0=;
 b=cCvKswuajZMeu2ueQotxZvLYuKaSQVesSKQl1n1e0HrFt4KxOv2/wHnagUiHiMkQg1
 /bVI6vXubG3CZqFtXdSVKXYIb/3nvlWdzU68qWkC8I93Q8ZrV6LYYJW009S4ngZ3l18+
 nlCQll1ME/WxsaPm9rUqUXoEvB3SZ0nzkQDMN3jAQ7g30eMeRoZcW771UVdSPZvAqN1a
 cX3j4nFu65Twuq3fclGxWnQBRnFudnLZoBfP3lN65bXx71IUFsgRgvXjBsVJnGWINRq9
 783ah4u45oZnJfxsJ9PqWinEqmooJwbh1Mw4qEwhd8Grs2hBm/QcQxyhu3aQiDCslySN
 epKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DBOXOA7PL7QbcyVM/gdsNC0oGoQL4dt90HL6w85Y1p0=;
 b=3B6YiUfeYuqzK1NOQWt8DS8+z6jddCDMKQPn7tjgR7PmnbA7QkbX3I2AS/NhvUwmG7
 H1iwzUv5idnqJTVyysIr01ytlfUxeCBgUFDSZEePdLMJKMemCUTW1DijbYt5UVRSOz3Q
 /BoGjjojIWDp7rM1ZCGET5qvDxmcGhOWacvBemOzmFapqxzuuxHV/YsNbJ8DjF8Ru7+0
 Clh+JVWduIxp51+T2w6IJOFLY43QtWzJYwW6QMMFtPsDZqLQJp5RVBDt1ncrt7znWw6c
 Eb9g9xlTbqU+kNM8xu/ONfbtt+jBfwQn3d5/o2qnHAvKfv++oFnGabhDv3weJ4H67f2l
 /saQ==
X-Gm-Message-State: AOAM532vTK+jMTsiBhIhl9cEiL3HUei5dvj6X63tX6j/OIa+ogCe+2aM
 U/Gs9CSmu6H+Y0UcupnBA4kwYoM6b1A=
X-Google-Smtp-Source: ABdhPJw5oNd2LhGklTjSruWnSchbPpXnwcaGOrHcGQH4v1XlA7GoqzvM4I1RxXQ7IwuJxNWkSNrrQA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr37774240wrx.137.1635308139331; 
 Tue, 26 Oct 2021 21:15:39 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm538989wrt.97.2021.10.26.21.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:15:38 -0700 (PDT)
Message-ID: <ff832553-d5cc-ded3-1364-2413d38af0b2@amsat.org>
Date: Wed, 27 Oct 2021 06:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Content-Language: en-US
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211004083835.3802961-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004083835.3802961-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@ (patch reviewed)

On 10/4/21 10:38, Philippe Mathieu-Daudé wrote:
> Hardware emulated models don't belong to the TCG MAINTAINERS
> section. Move them to the 'HP-PARISC Machines' section.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..002620c6cad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  S: Maintained
>  F: target/hppa/
> -F: hw/hppa/
>  F: disas/hppa.c
> -F: hw/net/*i82596*
> -F: include/hw/net/lasi_82596.h
>  
>  M68K TCG CPUs
>  M: Laurent Vivier <laurent@vivier.eu>
> @@ -1098,6 +1095,8 @@ R: Helge Deller <deller@gmx.de>
>  S: Odd Fixes
>  F: configs/devices/hppa-softmmu/default.mak
>  F: hw/hppa/
> +F: hw/net/*i82596*
> +F: include/hw/net/lasi_82596.h
>  F: pc-bios/hppa-firmware.img
>  
>  M68K Machines
> 

