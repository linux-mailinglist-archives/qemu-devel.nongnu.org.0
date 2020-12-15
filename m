Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CFE2DB42F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:02:00 +0100 (CET)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFa9-0005CQ-1B
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpFYO-0004bs-Jw
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:00:08 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpFYL-0001kW-Qm
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:00:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id r7so20933192wrc.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 11:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aT1PJnajciJE2dqCzWg1aHs1GZklEjKsUm8z46pbejA=;
 b=QhXRaJPhkgfnd4SaaKWQHSeaEei8xLWzw26Hp1K18TR9ajmV5Ej+vX/MFZphop4cfv
 giQ55k5XtkD+5gvJkKcNKxtW5mnrM7Jjrli8W4iAr3poOwDBYYFwRYHYG00WUoWuIYm6
 DJOVV8x9fy/okGU+sRDOcFfYgd6rBLjm31R7PStE+q6v0DNV3H4AVXp/UCcIqrDZhQNa
 5CL8sE5Dtuh8iO3fpV8zmUmZMDF9FKQNVhmBDtRsvtmuRpcibDygXoL1ZjijMeCEWWjh
 rCQvln2NZYCE1DFYJEbMGTa2/FnD7Mk+tBhnJGsiBxe674LnTo6gRPe1FebOAZl5sRXM
 FfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aT1PJnajciJE2dqCzWg1aHs1GZklEjKsUm8z46pbejA=;
 b=dRDeRBeMAtT9U0hDTyEwXwRo4CvptVQqkAAFsjg33d73Gf7HOUX/qLtcIC3PFhVO5u
 b4JBErV7AhNc6Kq1bpjO0J3ubyd++GPI16KrZoY1PRmznaH6l3Puru0OWZ+Udd9MY8A5
 7Or82ciJD17u6D7m8kaLiNy0nzdUl4mvla11ZKXeLFc8AGacTG5+dzuvOK0w07folHNL
 AHc7aAA3sd2fErKdkqM+RZv/ZXpIP+/bDpQYJ1MSKQU+Gr++ubxrVNkZHwbTEDUYFoR7
 GML6Qbkp3efZGt2bRKg1tIwjLCFW4D1qh4qLBH4+5NG4yCY65Z7J/6aa/OMJIyzAAiTO
 udbg==
X-Gm-Message-State: AOAM531gqlLDGI4yK0a7+HmYNctEh9Qh7/e2iT3mNY5UP7LuckN22cpf
 xR4ON/HU0YWYwzuNEZGZYuM=
X-Google-Smtp-Source: ABdhPJy6HQrXfvvj6hsfog09rPzxtPJZNP7hh1tKQMxkQQLMl4O/dCQKEgV1zkhWR3+b6xZ27H22xw==
X-Received: by 2002:adf:b343:: with SMTP id k3mr34730670wrd.202.1608058803884; 
 Tue, 15 Dec 2020 11:00:03 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d191sm37510180wmd.24.2020.12.15.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 11:00:02 -0800 (PST)
Subject: Re: [PATCH v2 00/16] target/mips: Boring code reordering + add
 "translate.h"
To: qemu-devel@nongnu.org, no-reply@patchew.org
References: <160804228706.20355.2388937911912422319@600e7e483b3a>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e7d7154a-c9d9-5d91-9601-3e7d2c36c383@amsat.org>
Date: Tue, 15 Dec 2020 20:00:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160804228706.20355.2388937911912422319@600e7e483b3a>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: aleksandar.rikalo@syrmia.com, kvm@vger.kernel.org, chenhuacai@kernel.org,
 laurent@vivier.eu, jiaxun.yang@flygoat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 3:24 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20201214183739.500368-1-f4bug@amsat.org/
> 
> 
> === OUTPUT BEGIN ===
> 1/16 Checking commit 02da9907b334 (target/mips: Inline cpu_state_reset() in mips_cpu_reset())
> 2/16 Checking commit a129631d782b (target/mips: Extract FPU helpers to 'fpu_helper.h')
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #42: 
> new file mode 100644
> 
> total: 0 errors, 1 warnings, 193 lines checked
> 
> Patch 2/16 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 3/16 Checking commit 8a5a0b7f9c26 (target/mips: Add !CONFIG_USER_ONLY comment after #endif)
> 4/16 Checking commit d10b7c71feb1 (target/mips: Remove consecutive CONFIG_USER_ONLY ifdefs)
> 5/16 Checking commit 051e87cd7a13 (target/mips: Extract common helpers from helper.c to common_helper.c)
> ERROR: space prohibited after that '&' (ctx:WxW)
> #41: FILE: target/mips/cpu.c:53:
> +    cu = (v >> CP0St_CU0) & 0xf;
>                            ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #42: FILE: target/mips/cpu.c:54:
> +    mx = (v >> CP0St_MX) & 0x1;
>                           ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #43: FILE: target/mips/cpu.c:55:
> +    ksu = (v >> CP0St_KSU) & 0x3;
>                             ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #70: FILE: target/mips/cpu.c:82:
> +        uint32_t ksux = (1 << CP0St_KX) & val;
>                                          ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #78: FILE: target/mips/cpu.c:90:
> +        mask &= ~(((1 << CP0St_SR) | (1 << CP0St_NMI)) & val);
>                                                         ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #105: FILE: target/mips/cpu.c:117:
> +        mask &= ~((1 << CP0Ca_WP) & val);
>                                    ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #110: FILE: target/mips/cpu.c:122:
> +    if ((old ^ env->CP0_Cause) & (1 << CP0Ca_DC)) {
>                                 ^
> 
> ERROR: space prohibited after that '&' (ctx:WxW)
> #120: FILE: target/mips/cpu.c:132:
> +        if ((old ^ env->CP0_Cause) & (1 << (CP0Ca_IP + i))) {
>                                     ^
> 
> total: 8 errors, 0 warnings, 433 lines checked
> 
> Patch 5/16 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

All pre-existing issues (code moved).

