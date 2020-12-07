Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D142D1E1F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:11:18 +0100 (CET)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPf2-0008Cj-Kq
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:11:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPcZ-0007fX-PI
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:08:44 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPcW-0004J2-U4
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:08:42 -0500
Received: by mail-ej1-x643.google.com with SMTP id n26so21921331eju.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GWExKdJa7yxrN9nrFkZ0y/S8qL/9jt7D6u0geGUi38A=;
 b=DoXrsYQ8/d8HxLKrTYe9KaZ0pr9NAX/ETzgaueQp+0UnA+/uaTGlitrYIoiz/XJVHF
 LPRJde0pxW2z4J+Z7S9Qdw0whXQD6P5aiLkw165BvsRnDwHS2KoR8rrli22gRddf5YQH
 KCmJx1fqkwOAu1vz+TXdQd/8L/LRicOsCEr3NjkahQQnffwKzMgv6/6fjDBmOo799TyZ
 KU2oeWWNxz7bYMsiWsZS9FSxFPG7Lq2Ly4MKfIDSw0tfXa6yhN+bqop0hnW7ry1avr0a
 thiWwWO1uAfJLxt+ekjxLHUcfITuwlL+vQdA+r90O425rr5Y9dWAh6AtEuMhGY/w5L0k
 CabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWExKdJa7yxrN9nrFkZ0y/S8qL/9jt7D6u0geGUi38A=;
 b=F3o7cRyecXMh/m14fynTfrRH6HlSzfGxrYv1o3TyMsxCncWCWkOew67FokURZgURwA
 aJ0taxqeJzvUzAmSmU70b0TygycdcVHhEHrpWUiGoHyEpJCdhaIN42ou6oA2Fo161Qfh
 dmNvYw8xsXMBSMkH8Y2JjkOrF6a6yVjT/ALR0kSW222eBPKg5fE8w23T7YJrGFq1rL8Y
 YiB5/5ZICarNOMvl4081fl8UqM9gkc8VtICK85/G4EkBij12qMI7FJ5OyV+Iz30PiO34
 0tY8t4vBW3xsmvojPXoyHlbP/fe+eNvDBq1eO40nbOxpMXHKDjGqoH+Pvgp9u+30vwes
 ckKQ==
X-Gm-Message-State: AOAM532dRJUo6dH0VHNUHOb9sPm6R0ufZwrqnGkd3zIoN09Ff0bdC/L2
 cwgZTVNst5OY546lV8/+IWc=
X-Google-Smtp-Source: ABdhPJx+SeHZO3OSzAJKsrb3C34PHbLIZccfpXv0dwAsvTIzr1ICIOIU7CUFGKNk5IqaXROmNR3XeQ==
X-Received: by 2002:a17:907:2061:: with SMTP id
 qp1mr20298285ejb.222.1607382517947; 
 Mon, 07 Dec 2020 15:08:37 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s9sm14753242edt.51.2020.12.07.15.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 15:08:36 -0800 (PST)
Subject: Re: [PATCH v2 00/28] target/mips: Explode 60% of the 32K-lines
 translate.c
To: qemu-devel@nongnu.org
References: <20201123204448.3260804-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae2fd653-b326-6534-60ad-00bfafd63ff7@amsat.org>
Date: Tue, 8 Dec 2020 00:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 9:44 PM, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Addressed Richard review comments
> 
> Patches missing review: 1,3,4,21,22,25
> 
> Hi,
> 
> This series, while boring, helps maintainability.
> 
> I simply exploded 60% of the huge target/mips/translate.c,
> reducing it from 32K lines of code to 13500.
> 
> The small overhead in the diffstat is due to entries added in
> MAINTAINERS and license boilerplate addition:
> 20225 insertions(+), 19987 deletions(-)
> 
> While being a massive diff, it is a no-brain review using
> 'git-diff --color-moved=dimmed-zebra' which highlights very few
> changes: #include and license lines.
> 
> The exploded new layout, which allows more useful filtering
> with the get_maintainer.pl script, is:
> 
> - MIPS ISA, ASE and modules:
> 
>  . isa-micromips_helper.h.inc
>  . isa-nanomips_translate.c.inc
> 
>  . ase-mips16e_translate.c.inc
> 
>  . mod-dsp_helper.c
>  . mod-dsp_helper.h.inc
>  . mod-dsp_translate.c.inc
>  . mod-msa_helper.h.inc
>  . mod-msa_translate.c.inc
>  . mod-msa_helper.c
>  . mod-mt_helper.h.inc
> 
> - MIPS Vendor Specific:
> 
>  . vendor-loong-simd_helper.c
>  . vendor-loong-ext_translate.c.inc
>  . vendor-loong-simd_helper.h.inc
>  . vendor-loong-simd_translate.c.inc
> 
>  . vendor-tx-mmi_translate.c.inc
>  . vendor-tx_translate.c.inc
> 
>  . vendor-vr54xx_helper.c
>  . vendor-vr54xx_helper.h.inc
>  . vendor-vr54xx_translate.c.inc
> 
>  . vendor-mxu_translate.c.inc
> 
> There should be no logical code change (only code movement).
> 
> The series is available at:
> 
>   https://gitlab.com/philmd/qemu.git tags/mips_translate_explode-v2
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (28):
>   target/mips: Use FloatRoundMode enum for FCR31 modes conversion
>   target/mips: Extract FPU helpers to 'fpu_helper.h'

Patches 1 and 2 queued to mips-next.

