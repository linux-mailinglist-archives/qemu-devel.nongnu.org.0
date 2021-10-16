Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216804305A8
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 01:51:57 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbtT0-0001Wy-Lg
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 19:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbtQW-0000rB-9k
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 19:49:20 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbtQT-0000RR-RD
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 19:49:19 -0400
Received: by mail-pl1-x629.google.com with SMTP id f21so8776917plb.3
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 16:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3Uuv156Ah8r45cUDZSDAu4R69O1wnb1ifz5JN+/Areo=;
 b=IgQUXNLYcdICAnvFU9tRLV6txSE/eNIXRbhKekHfMzs2K2/UfLRfCTnED+MHnX2eel
 /PlKWTZGH8V4qnLbBnyS9mYkbZ+D6GVNjwzmfIpD5Zrs8+BBgou1uCSiOjX4es9jyvjU
 shZFgT0PWlzUTMGdcVwLLv7jpC2vmE1wqmsiYi7vwBxOopLYtK+b0FF7ktAMUVYc5IY+
 bs6aKUiFosSFTb0Zgm7pq5AJW2HPYybWa1e1QvP7hfsTTOQ/Q9c3IhexUTUHteT7awWk
 LIas848litk5DmqdIOdbc5kzbD/G4ZW27NhP4bCF4OvT1yXLRsAKxQNTb+cpyG93DLvc
 xFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Uuv156Ah8r45cUDZSDAu4R69O1wnb1ifz5JN+/Areo=;
 b=VSoPgp+fb66rVjLNM0bms+5Cv7fOadn3Oh9VW6nbH3ZtIuvEF3WaSyz7jyCe9r192O
 IIFH7z5GcPmlNtuLgzcJXBpd/qqLfLj62XUyCTh5KxJlaSgEs1yVjLuq7YmGE21lr77m
 3ypii7BooFB8a6Ed8J2C+rjNCKprbjxw9t4LzA9hwDGvp4syj/mPOL7YJNWP9uAVvcSc
 AWcIGEGsX4M8Wqmi5m5GvBhp2UOan/mcH4wFqURTA7ayGK+sOjL1EWN8jo++F4T/vTKv
 5YVLmFOaH4mqpINkP096+57oBQWelLqbrK9T/zszDpazA/5DqE8JuBsxJ/5qnde1SHmR
 b/Rw==
X-Gm-Message-State: AOAM532eExZB3Nq69bVRNlyuAIF/TamEtvW3T3z/He688JOca5R93Qdm
 uFMXEh+HJ5x284eVLrqBfJkTuu+0JAUGIw==
X-Google-Smtp-Source: ABdhPJxnbwYnFwaVRUBZeSbmn4Y5tTQy1gyjNu5falaDKH113syaL23HoJ2gtHdvUs+Hp4sBvWeu9A==
X-Received: by 2002:a17:90b:398:: with SMTP id
 ga24mr23773027pjb.87.1634428155321; 
 Sat, 16 Oct 2021 16:49:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c24sm8849670pgj.63.2021.10.16.16.49.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 16:49:14 -0700 (PDT)
Subject: Re: [PULL 00/24] tcg patch queue
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
Message-ID: <bec46fd4-8785-888a-aa99-299e0812b47c@linaro.org>
Date: Sat, 16 Oct 2021 16:49:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/21 11:14 AM, Richard Henderson wrote:
> The following changes since commit 6587b0c1331d427b0939c37e763842550ed581db:
> 
>    Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-10-15' into staging (2021-10-15 14:16:28 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211016
> 
> for you to fetch changes up to 995b87dedc78b0467f5f18bbc3546072ba97516a:
> 
>    Revert "cpu: Move cpu_common_props to hw/core/cpu.c" (2021-10-15 16:39:15 -0700)
> 
> ----------------------------------------------------------------
> Move gdb singlestep to generic code
> Fix cpu_common_props
> 
> ----------------------------------------------------------------
> Richard Henderson (24):
>        accel/tcg: Handle gdb singlestep in cpu_tb_exec
>        target/alpha: Drop checks for singlestep_enabled
>        target/avr: Drop checks for singlestep_enabled
>        target/cris: Drop checks for singlestep_enabled
>        target/hexagon: Drop checks for singlestep_enabled
>        target/arm: Drop checks for singlestep_enabled
>        target/hppa: Drop checks for singlestep_enabled
>        target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
>        target/i386: Drop check for singlestep_enabled
>        target/m68k: Drop checks for singlestep_enabled
>        target/microblaze: Check CF_NO_GOTO_TB for DISAS_JUMP
>        target/microblaze: Drop checks for singlestep_enabled
>        target/mips: Fix single stepping
>        target/mips: Drop exit checks for singlestep_enabled
>        target/openrisc: Drop checks for singlestep_enabled
>        target/ppc: Drop exit checks for singlestep_enabled
>        target/riscv: Remove dead code after exception
>        target/riscv: Remove exit_tb and lookup_and_goto_ptr
>        target/rx: Drop checks for singlestep_enabled
>        target/s390x: Drop check for singlestep_enabled
>        target/sh4: Drop check for singlestep_enabled
>        target/tricore: Drop check for singlestep_enabled
>        target/xtensa: Drop check for singlestep_enabled
>        Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
> 
>   include/hw/core/cpu.h                          |  1 +
>   target/i386/helper.h                           |  1 -
>   target/rx/helper.h                             |  1 -
>   target/sh4/helper.h                            |  1 -
>   target/tricore/helper.h                        |  1 -
>   accel/tcg/cpu-exec.c                           | 11 ++++
>   cpu.c                                          | 21 ++++++++
>   hw/core/cpu-common.c                           | 17 +-----
>   target/alpha/translate.c                       | 13 ++---
>   target/arm/translate-a64.c                     | 10 +---
>   target/arm/translate.c                         | 36 +++----------
>   target/avr/translate.c                         | 19 ++-----
>   target/cris/translate.c                        | 16 ------
>   target/hexagon/translate.c                     | 12 +----
>   target/hppa/translate.c                        | 17 ++----
>   target/i386/tcg/misc_helper.c                  |  8 ---
>   target/i386/tcg/translate.c                    |  9 ++--
>   target/m68k/translate.c                        | 44 ++++-----------
>   target/microblaze/translate.c                  | 18 ++-----
>   target/mips/tcg/translate.c                    | 75 ++++++++++++--------------
>   target/openrisc/translate.c                    | 18 ++-----
>   target/ppc/translate.c                         | 38 +++----------
>   target/riscv/translate.c                       | 27 +---------
>   target/rx/op_helper.c                          |  8 ---
>   target/rx/translate.c                          | 12 +----
>   target/s390x/tcg/translate.c                   |  8 +--
>   target/sh4/op_helper.c                         |  5 --
>   target/sh4/translate.c                         | 14 ++---
>   target/tricore/op_helper.c                     |  7 ---
>   target/tricore/translate.c                     | 14 +----
>   target/xtensa/translate.c                      | 25 +++------
>   target/riscv/insn_trans/trans_privileged.c.inc | 10 ++--
>   target/riscv/insn_trans/trans_rvi.c.inc        |  8 ++-
>   target/riscv/insn_trans/trans_rvv.c.inc        |  2 +-
>   34 files changed, 141 insertions(+), 386 deletions(-)

Applied, thanks.

r~


