Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D15520431
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:08:52 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7oR-0002R4-4m
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no7mK-0000zF-DE
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:06:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no7mI-0005XJ-Gw
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:06:40 -0400
Received: by mail-pg1-x533.google.com with SMTP id s16so2605098pgs.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 11:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=EtDeWNlQoI33PNvj0+RZpceNsDLAxz3rU0jJXZspUoY=;
 b=dLRb/1DJ/A/JrngI0OpWMYpnC2FauURfxP40y/FMCNzgxno4X85p6qIAnU8NmhGFFo
 gV7gLCz8vlYoiAMewEAkpFa32lm1MFf2QVAbRBTuSemIQjkLW1OmKhksn37CwTH2+Q+4
 8UlQRaAdM9qS02plh/ZCRvjCvlriC+Jf1s8xUDUtzblgA07B26xuPX/dGeyXGSK12fC1
 HbrfVtYSCcWpAK1ZyFD5LnKXj98tV8wNIPux23McgHCXdXur/qHRmjmTyyaETOCHmgCy
 ZNsYfX/e85zRWlYTMv703e6178aWTetoMEICprOx1lGAZfhcnkFZSdr8II87I/OLMsas
 Fnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EtDeWNlQoI33PNvj0+RZpceNsDLAxz3rU0jJXZspUoY=;
 b=Y4IjOXjvC8mTqalKDyPag0Zind7OKnKt0NkjCN8pvXH4LsvCtkRHaoBKf6CrmSK+cw
 eRMV8FRYUEoK6dS/1T/8XRb8Ginjx8EkElB3pS7804pHoFNn19Wlk7NY3ZZsPdmGVTnL
 9h5rbMHIEgm/2o0K6KrdBYHu1KLEyBkBOYDvy7XMedGGWscLvEwJgkgUdK0jvBL4k7/a
 laIlk6N2TEJrM9gINa6z6rl7vkBZkeuEGaSIHQitN5prAb4x9B5/tS6RWWdCxWfah+rb
 1j/6njzDlrIlwtf7NuD4zrUtDCRkjFLZ+tPD2gzP9XXEx3IsYsfM9TvByTiauqwYNVMA
 qDrg==
X-Gm-Message-State: AOAM531VzQ18M/bRIJFs4OlOR7pijVJdc22jQYXIzyFbj+46nN99Smx0
 NDMtp4wtCq7PRXQQwjXGHja0/A==
X-Google-Smtp-Source: ABdhPJxLXaWcNxD2h436z0dp4fNBp3hhDGs29Wgw+ObFN9FZtda0SB4hjtqtPaWITujXFENMTB2bFA==
X-Received: by 2002:a05:6a00:1707:b0:510:36b2:1d1f with SMTP id
 h7-20020a056a00170700b0051036b21d1fmr17243549pfc.32.1652119596776; 
 Mon, 09 May 2022 11:06:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 h14-20020aa796ce000000b0050dc7628136sm9111365pfq.16.2022.05.09.11.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 11:06:36 -0700 (PDT)
Message-ID: <ad435909-26ad-37c8-1a45-a44d2a69ccee@linaro.org>
Date: Mon, 9 May 2022 11:06:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/32] target-arm queue
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/9/22 06:58, Peter Maydell wrote:
> target-arm queue: the big stuff here is the final part of
> rth's patches for Cortex-A76 and Neoverse-N1 support;
> also present are Gavin's NUMA series and a few other things.
> 
> thanks
> -- PMM
> 
> The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:
> 
>    Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220509
> 
> for you to fetch changes up to ae9141d4a3265553503bf07d3574b40f84615a34:
> 
>    hw/acpi/aml-build: Use existing CPU topology to build PPTT table (2022-05-09 11:47:55 +0100)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * MAINTAINERS/.mailmap: update email for Leif Lindholm
>   * hw/arm: add version information to sbsa-ref machine DT
>   * Enable new features for -cpu max:
>     FEAT_Debugv8p2, FEAT_Debugv8p4, FEAT_RAS (minimal version only),
>     FEAT_IESB, FEAT_CSV2, FEAT_CSV2_2, FEAT_CSV3, FEAT_DGH
>   * Emulate Cortex-A76
>   * Emulate Neoverse-N1
>   * Fix the virt board default NUMA topology

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Gavin Shan (6):
>        qapi/machine.json: Add cluster-id
>        qtest/numa-test: Specify CPU topology in aarch64_numa_cpu()
>        hw/arm/virt: Consider SMP configuration in CPU topology
>        qtest/numa-test: Correct CPU and NUMA association in aarch64_numa_cpu()
>        hw/arm/virt: Fix CPU's default NUMA node ID
>        hw/acpi/aml-build: Use existing CPU topology to build PPTT table
> 
> Leif Lindholm (2):
>        MAINTAINERS/.mailmap: update email for Leif Lindholm
>        hw/arm: add versioning to sbsa-ref machine DT
> 
> Richard Henderson (24):
>        target/arm: Handle cpreg registration for missing EL
>        target/arm: Drop EL3 no EL2 fallbacks
>        target/arm: Merge zcr reginfo
>        target/arm: Adjust definition of CONTEXTIDR_EL2
>        target/arm: Move cortex impdef sysregs to cpu_tcg.c
>        target/arm: Update qemu-system-arm -cpu max to cortex-a57
>        target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
>        target/arm: Split out aa32_max_features
>        target/arm: Annotate arm_max_initfn with FEAT identifiers
>        target/arm: Use field names for manipulating EL2 and EL3 modes
>        target/arm: Enable FEAT_Debugv8p2 for -cpu max
>        target/arm: Enable FEAT_Debugv8p4 for -cpu max
>        target/arm: Add minimal RAS registers
>        target/arm: Enable SCR and HCR bits for RAS
>        target/arm: Implement virtual SError exceptions
>        target/arm: Implement ESB instruction
>        target/arm: Enable FEAT_RAS for -cpu max
>        target/arm: Enable FEAT_IESB for -cpu max
>        target/arm: Enable FEAT_CSV2 for -cpu max
>        target/arm: Enable FEAT_CSV2_2 for -cpu max
>        target/arm: Enable FEAT_CSV3 for -cpu max
>        target/arm: Enable FEAT_DGH for -cpu max
>        target/arm: Define cortex-a76
>        target/arm: Define neoverse-n1
> 
>   docs/system/arm/emulation.rst |  10 +
>   docs/system/arm/virt.rst      |   2 +
>   qapi/machine.json             |   6 +-
>   target/arm/cpregs.h           |  11 +
>   target/arm/cpu.h              |  23 ++
>   target/arm/helper.h           |   1 +
>   target/arm/internals.h        |  16 ++
>   target/arm/syndrome.h         |   5 +
>   target/arm/a32.decode         |  16 +-
>   target/arm/t32.decode         |  18 +-
>   hw/acpi/aml-build.c           | 111 ++++----
>   hw/arm/sbsa-ref.c             |  16 ++
>   hw/arm/virt.c                 |  21 +-
>   hw/core/machine-hmp-cmds.c    |   4 +
>   hw/core/machine.c             |  16 ++
>   target/arm/cpu.c              |  66 ++++-
>   target/arm/cpu64.c            | 353 ++++++++++++++-----------
>   target/arm/cpu_tcg.c          | 227 +++++++++++-----
>   target/arm/helper.c           | 600 +++++++++++++++++++++++++-----------------
>   target/arm/op_helper.c        |  43 +++
>   target/arm/translate-a64.c    |  18 ++
>   target/arm/translate.c        |  23 ++
>   tests/qtest/numa-test.c       |  19 +-
>   .mailmap                      |   3 +-
>   MAINTAINERS                   |   2 +-
>   25 files changed, 1068 insertions(+), 562 deletions(-)
> 


