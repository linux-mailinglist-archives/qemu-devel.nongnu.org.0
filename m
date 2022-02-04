Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CD4A93E3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 07:18:08 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFrv5-0006nP-BU
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 01:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFrrX-0005Ns-Qi
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:14:27 -0500
Received: from [2607:f8b0:4864:20::436] (port=33465
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFrrU-0006qj-Uq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:14:27 -0500
Received: by mail-pf1-x436.google.com with SMTP id i186so4304706pfe.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 22:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LoLsU9FSrEdLsaAUo5mR4PB2Z6j0tXhCV0ljgBfmsfg=;
 b=lAApuDWkc8H7sLJ/SEegw0aNAo6eml/I+vvkdDQBYz3Wz/oHrCGauVaRj0wzwhilf0
 utxfKeOnfLYsGT2hw/fJ8AvUyMUhW/GcjXclvhq4u/vWbpYQKhFyYa6LNIGtdh+bnyDw
 lw9qzTWvPk4Gn9budGpViD03H92VI8ghLJCGxL89aZUahIlyC5FApeEb8r9NCzemYuBT
 5oowYhUsUBGjJ0zm0GGBb+WmaucDYSXc1sQnDox+9QfNWegdKx5O8I/Gj+WNW/esIa0Y
 H1YjOLuk4SlEIPLiFV6lnvgK2kTORxZGGSF8SsRjjc9SYlfcrGKMLlxJ9Eqv6UVAA0uM
 Jb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LoLsU9FSrEdLsaAUo5mR4PB2Z6j0tXhCV0ljgBfmsfg=;
 b=wv72c1qFpjpUa+fUGAsP9lAHQOGbO1O+NzC3ibbcC1JGAYLjO8EC7gK2oFs50mRXiJ
 +9CUGrLC9nSoSGwfYx0LFndGF377l2iQmAbiEIxNRBzUrPO80gEOupYcAOxoh3ERlk9H
 ONztBBfvArNf/s/Sce9y3RQ1eJSf6BhmEoK8Wa/Ba7wJywYCnjjW2GPXx9r4QuP5CD6q
 wNzThwxwVyLnTVHEDx2i0VjFvgXjg9mGsoerMfB8Q3d6Tqdvrik7jsoEsLRHR2JTg/lr
 fRpgKbQvjNkJMw3aB6gBaeTUwNeBOM1eS47gSis0fsynkM4n+8Tt0lWwGsGn9+2D5+hp
 RyVg==
X-Gm-Message-State: AOAM533SYkSlXrGfiybjg9CQ4wUxJJ4j28GZVtDGR8W+iUPWUQT1dB30
 ajAroqb9i5Tic422RBPtCcQ=
X-Google-Smtp-Source: ABdhPJwwoIaSi/3R35Rb7SErIVUY1YV6o1lzYQb0OZzWX9r0NcLh7DMmcobVMt+bxXsNDJcXjtYOaw==
X-Received: by 2002:a63:24a:: with SMTP id 71mr1265407pgc.300.1643955263172;
 Thu, 03 Feb 2022 22:14:23 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i10sm743543pgm.30.2022.02.03.22.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 22:14:22 -0800 (PST)
Message-ID: <32825533-497c-f06e-50ff-c3f7142d2416@amsat.org>
Date: Fri, 4 Feb 2022 07:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 0/2] tcg/mips: Unaligned access support
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20220201234107.316487-1-richard.henderson@linaro.org>
In-Reply-To: <20220201234107.316487-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing other reviewers:

$ ./scripts/get_maintainer.pl -f tcg/mips/tcg-target.h
"Philippe Mathieu-Daudé" <f4bug@amsat.org> (odd fixer:MIPS TCG target)
Aurelien Jarno <aurelien@aurel32.net> (reviewer:MIPS TCG target)
Huacai Chen <chenhuacai@kernel.org> (reviewer:MIPS TCG target)
Jiaxun Yang <jiaxun.yang@flygoat.com> (reviewer:MIPS TCG target)
Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> (reviewer:MIPS TCG target)
Richard Henderson <richard.henderson@linaro.org> (maintainer:Common TCG 
code)
qemu-devel@nongnu.org (open list:All patches CC here)

On 2/2/22 00:41, Richard Henderson wrote:
> Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>
> ("[PATCH v4 0/7] Unaligned access for user only")
> 
> Changes from v4:
>    * Rebase on master.
>    * Drop other cleanup for now.
> 
> Changes from v3:
>    * Rebase on master, which has some patches applied.
> 
> 
> r~
> 
> Richard Henderson (2):
>    tcg/mips: Support unaligned access for user-only
>    tcg/mips: Support unaligned access for softmmu
> 
>   tcg/mips/tcg-target.h     |   2 -
>   tcg/mips/tcg-target.c.inc | 387 +++++++++++++++++++++++++++++++++++---
>   2 files changed, 360 insertions(+), 29 deletions(-)
> 


