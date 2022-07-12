Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8B571031
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:28:34 +0200 (CEST)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5dZ-0004IU-V7
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB5Re-00049e-LG
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:16:14 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB5Rc-0008SC-Dw
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 22:16:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id d5so6004331plo.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 19:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=dLgnOh+Zc9O4qeeV59yLvxXFRgNt84Z6qm9JgQNto8U=;
 b=a6J7+qTSSEeP519WjtmNps4Xa4HvHDgTfkRrbPEtxXy3zQLnQchci2QakAqxTzjFGC
 lkag2QFZbFGk5bPcOnXi2jX6e+3yh+q6WLP3lDHQ0dJy2IuQK4otvKVPxcicm7uUwTmb
 XT3F/edqjaM1K80plpWZjW6Ds4M89HxCCUUkqu6B931n1q+igpLQqvGDdjOQ4Z/NOumL
 fWw5HWA+JfBj9+ggMFnif9nzwwYBX8AVzkeJOMaiy4Zh7y42eUGllcRlBh1g52tQsJsQ
 KiyaX74cyKF6oA8ibigSRoRdPgNF8FWiFRHvBu3JNL0i6iBxhrpHjOXVazK9BdpV4QIQ
 oqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dLgnOh+Zc9O4qeeV59yLvxXFRgNt84Z6qm9JgQNto8U=;
 b=WWR5Whwk8WQhLNNelFCpq6nItk0JXVVhSEjEQgvSQx0FfvUYflrrztP31W0uqhl/Ne
 5dWXfFuNDTsKPBnOmwYLf07c6K+SIgu7KAeiiyK5Qgg0rt+UvNYDitjOJjNNiWMpFBhH
 Cz++ECLDGEzx4+PekS3p585tD/xtM40HZGBQbrHB9oPVCzfXq7X0pekB4sCpuTCzNDSs
 PDQb0GAhUo5nRp9VauMvBhvDb5oHEUf3OFMLqRdzATSU01BnBZvTFwQNTnQBX2hRv5Xh
 IEa8YsVuwBkcFvm6TRC6YRmDi+yNSUhrTeA1X61K7GQZ8avTUdFd9hy747aoHbS/13Jp
 4wig==
X-Gm-Message-State: AJIora/WVE0poa+/Hr3v7XoJwyziyi+SkZpyW4/mKmsON0tCCynn1i0/
 4qvrISm5s282i2MH5XpDTFRUax6mnVtd6N1p
X-Google-Smtp-Source: AGRyM1tkTOReLhxwgk7e1mrjpwJo2okl0wLDuUyM5l++IpSjboZ4Md267qC9ruGoDec4DYzh3Dn4Bg==
X-Received: by 2002:a17:902:c205:b0:16b:f021:4299 with SMTP id
 5-20020a170902c20500b0016bf0214299mr21633526pll.70.1657592170811; 
 Mon, 11 Jul 2022 19:16:10 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a63c109000000b0040d87299ca3sm4914258pgf.54.2022.07.11.19.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 19:16:10 -0700 (PDT)
Message-ID: <0f409c01-4a6c-3a5d-0b7f-23b038224cc0@linaro.org>
Date: Tue, 12 Jul 2022 07:46:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/45] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220711135750.765803-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 7/11/22 19:27, Peter Maydell wrote:
> I don't have anything else queued up at the moment, so this is just
> Richard's SME patches.
> 
> -- PMM
> 
> The following changes since commit 63b38f6c85acd312c2cab68554abf33adf4ee2b3:
> 
>    Merge tag 'pull-target-arm-20220707' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-08 06:17:11 +0530)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220711
> 
> for you to fetch changes up to f9982ceaf26df27d15547a3a7990a95019e9e3a8:
> 
>    linux-user/aarch64: Add SME related hwcap entries (2022-07-11 13:43:52 +0100)
> 
> ----------------------------------------------------------------
> target-arm:
>   * Implement SME emulation, for both system and linux-user

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Richard Henderson (45):
>        target/arm: Handle SME in aarch64_cpu_dump_state
>        target/arm: Add infrastructure for disas_sme
>        target/arm: Trap non-streaming usage when Streaming SVE is active
>        target/arm: Mark ADR as non-streaming
>        target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
>        target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as non-streaming
>        target/arm: Mark PMULL, FMMLA as non-streaming
>        target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
>        target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
>        target/arm: Mark string/histo/crypto as non-streaming
>        target/arm: Mark gather/scatter load/store as non-streaming
>        target/arm: Mark gather prefetch as non-streaming
>        target/arm: Mark LDFF1 and LDNF1 as non-streaming
>        target/arm: Mark LD1RO as non-streaming
>        target/arm: Add SME enablement checks
>        target/arm: Handle SME in sve_access_check
>        target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
>        target/arm: Implement SME ZERO
>        target/arm: Implement SME MOVA
>        target/arm: Implement SME LD1, ST1
>        target/arm: Export unpredicated ld/st from translate-sve.c
>        target/arm: Implement SME LDR, STR
>        target/arm: Implement SME ADDHA, ADDVA
>        target/arm: Implement FMOPA, FMOPS (non-widening)
>        target/arm: Implement BFMOPA, BFMOPS
>        target/arm: Implement FMOPA, FMOPS (widening)
>        target/arm: Implement SME integer outer product
>        target/arm: Implement PSEL
>        target/arm: Implement REVD
>        target/arm: Implement SCLAMP, UCLAMP
>        target/arm: Reset streaming sve state on exception boundaries
>        target/arm: Enable SME for -cpu max
>        linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
>        linux-user/aarch64: Reset PSTATE.SM on syscalls
>        linux-user/aarch64: Add SM bit to SVE signal context
>        linux-user/aarch64: Tidy target_restore_sigframe error return
>        linux-user/aarch64: Do not allow duplicate or short sve records
>        linux-user/aarch64: Verify extra record lock succeeded
>        linux-user/aarch64: Move sve record checks into restore
>        linux-user/aarch64: Implement SME signal handling
>        linux-user: Rename sve prctls
>        linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
>        target/arm: Only set ZEN in reset if SVE present
>        target/arm: Enable SME for user-only
>        linux-user/aarch64: Add SME related hwcap entries
> 
>   docs/system/arm/emulation.rst     |    4 +
>   linux-user/aarch64/target_cpu.h   |    5 +-
>   linux-user/aarch64/target_prctl.h |   62 +-
>   target/arm/cpu.h                  |    7 +
>   target/arm/helper-sme.h           |  126 ++++
>   target/arm/helper-sve.h           |    4 +
>   target/arm/helper.h               |   18 +
>   target/arm/translate-a64.h        |   45 ++
>   target/arm/translate.h            |   16 +
>   target/arm/sme-fa64.decode        |   60 ++
>   target/arm/sme.decode             |   88 +++
>   target/arm/sve.decode             |   41 +-
>   linux-user/aarch64/cpu_loop.c     |    9 +
>   linux-user/aarch64/signal.c       |  243 ++++++--
>   linux-user/elfload.c              |   20 +
>   linux-user/syscall.c              |   28 +-
>   target/arm/cpu.c                  |   35 +-
>   target/arm/cpu64.c                |   11 +
>   target/arm/helper.c               |   56 +-
>   target/arm/sme_helper.c           | 1140 +++++++++++++++++++++++++++++++++++++
>   target/arm/sve_helper.c           |   28 +
>   target/arm/translate-a64.c        |  103 +++-
>   target/arm/translate-sme.c        |  373 ++++++++++++
>   target/arm/translate-sve.c        |  393 ++++++++++---
>   target/arm/translate-vfp.c        |   12 +
>   target/arm/translate.c            |    2 +
>   target/arm/vec_helper.c           |   24 +
>   target/arm/meson.build            |    3 +
>   28 files changed, 2821 insertions(+), 135 deletions(-)
>   create mode 100644 target/arm/sme-fa64.decode
>   create mode 100644 target/arm/sme.decode
>   create mode 100644 target/arm/translate-sme.c
> 


