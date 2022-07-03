Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777EB5644D4
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 06:43:12 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7rRv-0005s6-2c
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 00:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7rNy-0004vL-Uq
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 00:39:07 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7rNv-0003kg-Fi
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 00:39:06 -0400
Received: by mail-pg1-x533.google.com with SMTP id 145so5995543pga.12
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 21:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eTO66OklE7c1hlp1eeEChyNSjoEo+vVYBU610cLEmdU=;
 b=oa6RLX84mXO8vBEFVFtA9eou3g7OICQzW6BR64UNUti014826A2uE7zuZv55Y/pn2X
 YztcY4yVEB4yTMGN2XTced4bSAWV9tHx/kE8JTDrKuptso5BhIZiErihQrPGQoCfaOTD
 lKh1WliJJ2luoelQCEbpkfFLLFBk4+OFHpzTnhh0l+hBT7LCLM4pycv3tGGN7Ht040gX
 e9UqvH5bNYmTxdkmAH1LEAU4TUOG1+tMd2iyIkNEfDUJmjMKfXP+j1s69AOO/8g9Y0cM
 mC5HrGT4enXTnMi0c7WKF0BM6fjOjb/orsbg9wcThfn9q8BII/PYCpAMJbgAXTqdp2+e
 5Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eTO66OklE7c1hlp1eeEChyNSjoEo+vVYBU610cLEmdU=;
 b=2efhI2njbCT6iu6c5IbDr4bWm2x7GdxYSe7S7HkTFdnbRwbozmP6aPE35hYujfcNRY
 MxfOSjIHrVO5VcdANoSgN9eS0Hk7ha4eUkkptHjAxTiZwV9WE0G3I5JqhJI8tgTVuh8g
 VjNK0YC/cbPS2trq7JwZT69ZXDrllecbeaaGlNXC/dyYS1/Z7YXRTiR/S1iqsbDD6OiU
 KiKwLLFzd12HY2/mv2TgMx3b9TmmE4J0ky7KBzrCugZrdYcHAxa9+PcG0sWb8O8SZGKt
 U7PfPeA6tcsbLif48F/Ptrg0j4qmWkyTufckeSyoqc1ZYrxiKWq980oUA00Uqqc2y+Uk
 tRlw==
X-Gm-Message-State: AJIora+NlyyxF9xiFkAX94OqGWuR5YKmfaSnA8gcQdlZjRBwzKmW2OWC
 ppQ4uwrzSZ3vl+v6sYTTDqI97A==
X-Google-Smtp-Source: AGRyM1ui9vukVTjF+q6kcFM3ZLOv+R4mL/4iu3gGcD9WnUJygAlJmPYA6tr9UMJ+P4NuXAzT1qb8nw==
X-Received: by 2002:a63:50:0:b0:3fe:2558:185b with SMTP id
 77-20020a630050000000b003fe2558185bmr19335241pga.513.1656823141429; 
 Sat, 02 Jul 2022 21:39:01 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902988100b0016a4a57a25asm18151631plp.152.2022.07.02.21.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 21:39:01 -0700 (PDT)
Message-ID: <a561e4a3-c8c3-9627-e4ce-a55b1c2e9d30@linaro.org>
Date: Sun, 3 Jul 2022 10:08:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL v2 00/19] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/3/22 05:42, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit d495e432c04a6394126c35cf96517749708b410f:
> 
>    Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220703-1
> 
> for you to fetch changes up to 435774992e82d2d16f025afbb20b4f7be9b242b0:
> 
>    target/riscv: Update default priority table for local interrupts (2022-07-03 10:03:20 +1000)
> 
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 7.1
> 
> * Fix register zero guarding for auipc and lui
> * Ensure bins (mtval) is set correctly
> * Minimize the calls to decode_save_opc
> * Guard against PMP ranges with a negative size
> * Implement mcountinhibit CSR
> * Add support for hpmcounters/hpmevents
> * Improve PMU implenentation
> * Support mcycle/minstret write operation
> * Fixup MSECCFG minimum priv check
> * Ibex (OpenTitan) fixup priv version
> * Fix bug resulting in always using latest priv spec
> * Reduce FDT address alignment constraints
> * Set minumum priv spec version for mcountinhibit
> * AIA update to v0.3 of the spec

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Alistair Francis (3):
>        target/riscv: Fixup MSECCFG minimum priv check
>        target/riscv: Ibex: Support priv version 1.11
>        hw/riscv: boot: Reduce FDT address alignment constraints
> 
> Anup Patel (4):
>        target/riscv: Don't force update priv spec version to latest
>        target/riscv: Set minumum priv spec version for mcountinhibit
>        target/riscv: Remove CSRs that set/clear an IMSIC interrupt file bits
>        target/riscv: Update default priority table for local interrupts
> 
> Atish Patra (7):
>        target/riscv: Fix PMU CSR predicate function
>        target/riscv: Implement PMU CSR predicate function for S-mode
>        target/riscv: pmu: Rename the counters extension to pmu
>        target/riscv: pmu: Make number of counters configurable
>        target/riscv: Implement mcountinhibit CSR
>        target/riscv: Add support for hpmcounters/hpmevents
>        target/riscv: Support mcycle/minstret write operation
> 
> Nicolas Pitre (1):
>        target/riscv/pmp: guard against PMP ranges with a negative size
> 
> Richard Henderson (3):
>        target/riscv: Set env->bins in gen_exception_illegal
>        target/riscv: Remove generate_exception_mtval
>        target/riscv: Minimize the calls to decode_save_opc
> 
> Víctor Colombo (1):
>        target/riscv: Remove condition guarding register zero for auipc and lui
> 
>   target/riscv/cpu.h                             |  24 +-
>   target/riscv/cpu_bits.h                        |  30 +-
>   target/riscv/pmu.h                             |  28 +
>   hw/riscv/boot.c                                |   4 +-
>   target/riscv/cpu.c                             |  17 +-
>   target/riscv/cpu_helper.c                      | 134 ++--
>   target/riscv/csr.c                             | 857 +++++++++++++++----------
>   target/riscv/machine.c                         |  25 +
>   target/riscv/pmp.c                             |   3 +
>   target/riscv/pmu.c                             |  32 +
>   target/riscv/translate.c                       |  31 +-
>   target/riscv/insn_trans/trans_privileged.c.inc |   4 +
>   target/riscv/insn_trans/trans_rvh.c.inc        |   2 +
>   target/riscv/insn_trans/trans_rvi.c.inc        |  10 +-
>   target/riscv/meson.build                       |   3 +-
>   tests/tcg/riscv64/Makefile.softmmu-target      |  21 +
>   tests/tcg/riscv64/issue1060.S                  |  53 ++
>   tests/tcg/riscv64/semihost.ld                  |  21 +
>   18 files changed, 843 insertions(+), 456 deletions(-)
>   create mode 100644 target/riscv/pmu.h
>   create mode 100644 target/riscv/pmu.c
>   create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
>   create mode 100644 tests/tcg/riscv64/issue1060.S
>   create mode 100644 tests/tcg/riscv64/semihost.ld
> 


