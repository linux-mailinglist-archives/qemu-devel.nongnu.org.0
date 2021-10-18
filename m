Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB804326C8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 20:43:23 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXbX-000321-06
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 14:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXaG-0002IE-If
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:42:04 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcXaE-0002qd-LP
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 14:42:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so675242pjb.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJDJkq1rCs6nJCzll3Y+MHqQ+IhvShvsW4v2kkvaYD8=;
 b=NLx/hZp3ehf+R8ChuTvXjG+faE+y+y9rERtmgnZvxetcxeoDvprs6RObT0JTCnnw68
 ubiOd4DRMvvFCBi6SZ98m7Y4axtV+/KQjhtdDRU2/CDerOtmhRnTN6aAMGHrMMkxFKjf
 AlAUnTBGR27IqUpDC8u/wxJkDdOkiE5flo/MHdx9XAEjvUfRMMd8sTsFKnq7Qk0uMWYs
 znZKCZzo8Yocc6b9tmoZPQNK16cjAuytQ3IKKjbHPdokbwxxgjxI4/TY87xI4lvLoHJA
 9qXU2is852bIF6hsk0u0Z2v0RN1RDrne0peOR7qw3X2W459OkoFeRmnLNk8ry0HhmmTC
 G4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FJDJkq1rCs6nJCzll3Y+MHqQ+IhvShvsW4v2kkvaYD8=;
 b=037aIbWbUORJIe1KdzySIzk/LwLYM9Zf4eEzJDutE7vFPh1q5rVouniD9VfsDHvIg8
 oGzbc6YSOsy8XcwngUs2LLMDjPjSTZPFk4Su2AQ1CJcL4GKXugM/c7TvN/x7NEKRZe9H
 nzGLRSUkiBLPIleWto9SyAuOwnANI4Or6h6bDDxv87j5Flz224DKkV2hwT4QngtxIoI+
 ZfAmEIKG9DWDvoJfDxtR7BA5UWcSAlQ3S2EvUmEFTF2rH3yLzk4nm4R6ZYVYUvp4GK13
 D9WQD296VU47szFATzWs/N70VZBEDd9C4oYKggvL5NQILvaVk2IUH5kAWtTpy9AqEylQ
 E2oQ==
X-Gm-Message-State: AOAM5327GSl7gTTFCuq+wt8IfN4zMibDWHhzJYYxb6/xJ3jWK5SB6gUM
 CHx11FrRN9ZL8/GhAxdNJ3IqJA==
X-Google-Smtp-Source: ABdhPJzN5e9ctKK6lYdRWO9T8y5TYsqcBrVYSxOyy23d2sd+QMhCK3qGC6jKjI3U1tXXYOyQ5sEOsQ==
X-Received: by 2002:a17:90a:930d:: with SMTP id
 p13mr651806pjo.171.1634582520929; 
 Mon, 18 Oct 2021 11:42:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c24sm14815170pgj.63.2021.10.18.11.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 11:42:00 -0700 (PDT)
Subject: Re: [PULL 00/17] MIPS patches for 2021-10-18
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211017225245.2618892-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23ffd3b9-4210-33f5-cada-b1dafe4c838e@linaro.org>
Date: Mon, 18 Oct 2021 11:41:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/21 3:52 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit c148a0572130ff485cd2249fbdd1a3260d5e10a4:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211016' into staging (2021-10-16 11:16:28 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/mips-20211018
> 
> for you to fetch changes up to 2792cf20ca7eed0e354a0ed731422411faca4908:
> 
>    via-ide: Avoid using isa_get_irq() (2021-10-18 00:41:36 +0200)
> 
> ----------------------------------------------------------------
> MIPS patches queue
> 
> Hardware emulation:
> - Generate FDT blob for Boston machine (Jiaxun)
> - VIA chipset cleanups (Zoltan)
> 
> TCG:
> - Use tcg_constant() in Compact branch and MSA opcodes
> - Restrict nanoMIPS DSP MULT[U] opcode accumulator to Rel6
> - Fix DEXTRV_S.H DSP opcode
> - Remove unused TCG temporary for some DSP opcodes
> 
> ----------------------------------------------------------------
> 
> BALATON Zoltan (4):
>    via-ide: Set user_creatable to false
>    vt82c686: Move common code to via_isa_realize
>    vt82c686: Add a method to VIA_ISA to raise ISA interrupts
>    via-ide: Avoid using isa_get_irq()
> 
> Jiaxun Yang (3):
>    hw/mips/boston: Massage memory map information
>    hw/mips/boston: Allow loading elf kernel and dtb
>    hw/mips/boston: Add FDT generator
> 
> Philippe Mathieu-Daudé (10):
>    target/mips: Check nanoMIPS DSP MULT[U] accumulator with Release 6
>    target/mips: Remove unused register from MSA 2R/2RF instruction format
>    target/mips: Use tcg_constant_i32() in gen_msa_elm_df()
>    target/mips: Use tcg_constant_i32() in gen_msa_2rf()
>    target/mips: Use tcg_constant_i32() in gen_msa_2r()
>    target/mips: Use tcg_constant_i32() in gen_msa_3rf()
>    target/mips: Use explicit extract32() calls in gen_msa_i5()
>    target/mips: Use tcg_constant_tl() in gen_compute_compact_branch()
>    target/mips: Fix DEXTRV_S.H DSP opcode
>    target/mips: Remove unused TCG temporary in gen_mipsdsp_accinsn()
> 
>   include/hw/isa/vt82c686.h                |   4 +
>   hw/ide/via.c                             |   7 +-
>   hw/isa/vt82c686.c                        |  75 +++--
>   hw/mips/boston.c                         | 371 +++++++++++++++++++++--
>   target/mips/tcg/msa_translate.c          |  51 ++--
>   target/mips/tcg/translate.c              |  11 +-
>   target/mips/tcg/nanomips_translate.c.inc |   6 +
>   7 files changed, 415 insertions(+), 110 deletions(-)

Applied, thanks.

r~


