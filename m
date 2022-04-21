Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BDD50A1F5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:16:51 +0200 (CEST)
Received: from localhost ([::1]:54772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXc2-0002rS-Mm
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhXF8-0008Pn-KB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:53:13 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhXF6-0006Wj-Gn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:53:10 -0400
Received: by mail-pl1-x635.google.com with SMTP id j8so4910064pll.11
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SBl/LEzzjkEHF86UvjBc2IqSo8dMOwsKIcfmbf7vlk8=;
 b=oqSXxzxEp5bMzvauQHvHWOFmZvPKy6uyuDBPDjwTdMJpNcKYLRwNX84sxLh7FuG+QR
 0ZsyZ0GaOk4w9IKawLXyF1tfnLQJE4oSAgqtpCHio9a8abz9ICPCDy6rFHCTifVYTxJA
 wIAT/9hOp6Z9jyHhyK8Ra418tbpofC/T/2Iz1yWIq0D5cUlG4NUoaNikOHvdaTf2ITUi
 i8QfIQrKUjGr9vzMOsOXMilmwIhWd38Y9VfwfMnz5cl9n9qRMCjSlHetHuApELJazzcU
 CKYBEf3YlHtCaZoEZ2cBebmcg4s3FBGlo8+hQ58Rj8C0Dts8KMshYQ300m9nsT7WVNIs
 1uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SBl/LEzzjkEHF86UvjBc2IqSo8dMOwsKIcfmbf7vlk8=;
 b=endWzMrEeQPiqymmNWSaa946KDdJmfnKSe61gCvJ1orNBa1LlX+BeRdrx/PBMTlrM/
 AYDHu4ET1FFVRjry8GHFr4nh9A3awanct0wPvQ+H6tVSZfqYKHa+EpA8nR+xhrSZ83cY
 Uf5adwzIonw3MdaQdWEDwTQypv1OAr2iTsaCBnmwimNvBVfEA+sc+5yjQnxopBihdkGu
 /gRI5itJ9M+a/z1jY6thecsjCPJGkcIk+S5RWyF+XLmoj1cYmB18UIw2pOwpSQWGXSq3
 mcSFETjduiClOktL/q0RIOHCXpiOOTlKO/8J3FkK+wIlf2RsKUa4FHFSZGjmTuqizQGB
 2H6g==
X-Gm-Message-State: AOAM5322DFEWjGO2LzCDQYmVe39MRGMvEwEh1dA69+mP2m317PAAqjAy
 rQUzVR+tlH8iqFEq83xNww4BMQ==
X-Google-Smtp-Source: ABdhPJw+TVaERFCT0nOfcWw/v5OCe9I5XK20jN1KGcnXGoNDotu3LOIDF3YymPOKCb76q/HKOXI5AA==
X-Received: by 2002:a17:902:b582:b0:14c:a63d:3df6 with SMTP id
 a2-20020a170902b58200b0014ca63d3df6mr25708779pls.51.1650549186608; 
 Thu, 21 Apr 2022 06:53:06 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18?
 ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056a00229300b004fb157f136asm24059950pfe.153.2022.04.21.06.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 06:53:06 -0700 (PDT)
Message-ID: <c98b72fd-f462-7e4d-5255-cf1017d2a7e7@linaro.org>
Date: Thu, 21 Apr 2022 06:53:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/23] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220420221329.169755-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/22 15:13, Daniel Henrique Barboza wrote:
> The following changes since commit 2d20a57453f6a206938cbbf77bed0b378c806c1f:
> 
>    Merge tag 'pull-fixes-for-7.1-200422-1' of https://github.com/stsquad/qemu into staging (2022-04-20 11:13:08 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220420-2
> 
> for you to fetch changes up to 2d94af4b16c40758eee3a8591307ae173090d4ad:
> 
>    hw/ppc: change indentation to spaces from TABs (2022-04-20 18:00:30 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-04-20
> 
> First batch of ppc patches for QEMU 7.1:
> 
> - skiboot firmware version bump
> - pseries: add 2M DDW pagesize
> - pseries: make virtual hypervisor code TCG only
> - powernv: introduce GPIO lines for PSIHB device
> - powernv: remove PCIE root bridge LSI
> - target/ppc: alternative softfloat 128 bit integer support
> - assorted fixes

Applied, thanks.  Please update the wiki changelog for 7.1 as appropriate.


r~

> 
> ----------------------------------------------------------------
> Alexey Kardashevskiy (2):
>        ppc/spapr/ddw: Add 2M pagesize
>        ppc/vof: Fix uninitialized string tracing
> 
> Bernhard Beschow (1):
>        hw/ppc/ppc405_boards: Initialize g_autofree pointer
> 
> Cédric Le Goater (5):
>        ppc/pnv: Fix PSI IRQ definition
>        ppc/pnv: Remove PnvLpcController::psi link
>        ppc/pnv: Remove PnvOCC::psi link
>        ppc/pnv: Remove PnvPsiClas::irq_set
>        ppc/pnv: Remove useless checks in set_irq handlers
> 
> Fabiano Rosas (3):
>        spapr: Move hypercall_register_softmmu
>        spapr: Move nested KVM hypercalls under a TCG only config.
>        target/ppc: Improve KVM hypercall trace
> 
> Frederic Barrat (3):
>        pcie: Don't try triggering a LSI when not defined
>        ppc/pnv: Remove LSI on the PCIE host bridge
>        target/ppc: Add two missing register callbacks on POWER10
> 
> Guo Zhi (1):
>        hw/ppc: change indentation to spaces from TABs
> 
> Joel Stanley (1):
>        ppc/pnv: Update skiboot to v7.0
> 
> Matheus Ferst (7):
>        qemu/int128: add int128_urshift
>        softfloat: add uint128_to_float128
>        softfloat: add int128_to_float128
>        softfloat: add float128_to_uint128
>        softfloat: add float128_to_int128
>        target/ppc: implement xscv[su]qqp
>        target/ppc: implement xscvqp[su]qz
> 
>   fpu/softfloat.c                     | 183 ++++++++++++++++++++++++++++++++++++
>   hw/pci-host/pnv_phb3.c              |   1 +
>   hw/pci-host/pnv_phb4.c              |   1 +
>   hw/pci/pcie.c                       |   5 +-
>   hw/pci/pcie_aer.c                   |   2 +-
>   hw/ppc/pnv.c                        |  30 +++---
>   hw/ppc/pnv_lpc.c                    |  19 +---
>   hw/ppc/pnv_occ.c                    |  16 +---
>   hw/ppc/pnv_psi.c                    |  36 +++----
>   hw/ppc/ppc405_boards.c              |   4 +-
>   hw/ppc/ppc440_bamboo.c              |   6 +-
>   hw/ppc/spapr_hcall.c                |  74 +++++++++------
>   hw/ppc/spapr_rtas.c                 |  18 ++--
>   hw/ppc/spapr_rtas_ddw.c             |   1 +
>   hw/ppc/vof.c                        |   2 +-
>   include/fpu/softfloat.h             |   7 ++
>   include/hw/ppc/pnv_lpc.h            |   8 +-
>   include/hw/ppc/pnv_occ.h            |   7 +-
>   include/hw/ppc/pnv_psi.h            |   7 +-
>   include/hw/ppc/ppc.h                |  10 +-
>   include/hw/ppc/spapr.h              |   1 +
>   include/qemu/int128.h               |  21 +++++
>   pc-bios/skiboot.lid                 | Bin 2528128 -> 2527240 bytes
>   roms/skiboot                        |   2 +-
>   target/ppc/cpu_init.c               |   2 +
>   target/ppc/fpu_helper.c             |  33 +++++++
>   target/ppc/helper.h                 |   4 +
>   target/ppc/insn32.decode            |   7 ++
>   target/ppc/kvm.c                    |   2 +-
>   target/ppc/trace-events             |   2 +-
>   target/ppc/translate/vsx-impl.c.inc |  22 +++++
>   tests/unit/test-int128.c            |  50 ++++++++++
>   32 files changed, 446 insertions(+), 137 deletions(-)


