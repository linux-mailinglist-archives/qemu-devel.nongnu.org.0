Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200735335AC
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 05:20:09 +0200 (CEST)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nthZ9-000356-MU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 23:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nthYA-0002LD-En
 for qemu-devel@nongnu.org; Tue, 24 May 2022 23:19:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nthY8-0008Ip-GI
 for qemu-devel@nongnu.org; Tue, 24 May 2022 23:19:06 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so544684pjg.2
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 20:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=r40YNlSOdRVEPYkfgYAXAXyclBo7eQfzBMcRQRMcuj8=;
 b=zAL/J4xck2LDwOgFkBO9RESabnf6tIX8se0nZJnPn4EmCntXqU59/TEzWsqtw0Bz5j
 ZXWs/Ky2gEun8mv0hNkI78pWHBQC07JCt4mBuGOF1cGw2eSBRo0PrmOPSGPC5k5C0o6c
 iMCLD74IG1J05Iv4U3PaQIco39YjZwrW+/gcAfBrtyb5aR65UrupZH64OtFnv4Z6AgR0
 yuz0NAA0fHHuOtRTFmtQE3pQyMrnbOQBrhK/kLeXEI0iPHblvsCfVuGuXGmOQ8WfbbuK
 s/vg9azZ/YYYG7/QUsgxMEVdFG2QvSlKtUOf3U7FJy3ZE+p0qFF6e/mcbF6O316nlG9n
 FLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r40YNlSOdRVEPYkfgYAXAXyclBo7eQfzBMcRQRMcuj8=;
 b=sgE64M9P52MHh1BUMFpSk10tQ6VxGASS8ArOP5B/eIt/v6rVYMduIxeYK57IhJAiWN
 9/hkL8MY98Sw9xwuATVjrJk2c46PbKyvh/20XryKcZFh4Qp5KPoEN/CHwLhWN03YG9p1
 m2YlPLwkjNs3K/ZObg5nR8+lxBcWX9386aep6hZW0SVfZPrdbw/0yXYnJiOCDl6ZnfqQ
 XHH+ZPAjyhvdtdVyyEIlVSsofeR8TcngaMZdy3b22tUwecqdBZwoFzN1lZ5roYhTr4La
 ScPrVYV7zpgElQsKOpQJs1qYlEmXuvMMIYMFlRpcTEKdKxQ4zW0V/LMWhKxwWqBj1wiR
 kZpg==
X-Gm-Message-State: AOAM530mElECZCWZeEHJ0v/oTDt+Ee2K/yal9K/Vcbm/GTeDeRYbxm1B
 LrvuwdHcRInYrNwHomkug/nywg==
X-Google-Smtp-Source: ABdhPJxCopB+TGIwlaoqpMERRgfy3XtXiVwY3QfFchL9fSGRzY8fFBYEerSmgXf/evkbMKwaDGk7Tw==
X-Received: by 2002:a17:902:da8c:b0:162:33b5:6aa1 with SMTP id
 j12-20020a170902da8c00b0016233b56aa1mr9269848plx.75.1653448742897; 
 Tue, 24 May 2022 20:19:02 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902e0c400b00161947ecc82sm660375pla.199.2022.05.24.20.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 20:19:02 -0700 (PDT)
Message-ID: <87dfd452-47c2-b312-0a6f-50326b95cdde@linaro.org>
Date: Tue, 24 May 2022 20:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/23] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 5/24/22 15:44, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:
> 
>    Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220525
> 
> for you to fetch changes up to 8fe63fe8e512d77583d6798acd2164f1fa1e40ab:
> 
>    hw/core: loader: Set is_linux to true for VxWorks uImage (2022-05-24 10:38:50 +1000)
> 
> ----------------------------------------------------------------
> Third RISC-V PR for QEMU 7.1
> 
>   * Fixes for accessing VS hypervisor CSRs
>   * Improvements for RISC-V Vector extension
>   * Fixes for accessing mtimecmp
>   * Add new short-isa-string CPU option
>   * Improvements to RISC-V machine error handling
>   * Disable the "G" extension by default internally, no functional change
>   * Enforce floating point extension requirements
>   * Cleanup ISA extension checks
>   * Resolve redundant property accessors
>   * Fix typo of mimpid cpu option
>   * Improvements for virtulisation
>   * Add zicsr/zifencei to isa_string
>   * Support for VxWorks uImage

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Anup Patel (4):
>        target/riscv: Fix csr number based privilege checking
>        target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-mode
>        target/riscv: Set [m|s]tval for both illegal and virtual instruction traps
>        hw/riscv: virt: Fix interrupt parent for dynamic platform devices
> 
> Atish Patra (1):
>        hw/intc: Pass correct hartid while updating mtimecmp
> 
> Bernhard Beschow (2):
>        hw/vfio/pci-quirks: Resolve redundant property getters
>        hw/riscv/sifive_u: Resolve redundant property accessors
> 
> Bin Meng (2):
>        hw/core: Sync uboot_image.h from U-Boot v2022.01
>        hw/core: loader: Set is_linux to true for VxWorks uImage
> 
> Dylan Reid (1):
>        target/riscv: Fix VS mode hypervisor CSR access
> 
> Frank Chang (1):
>        target/riscv: Fix typo of mimpid cpu option
> 
> Hongren (Zenithal) Zheng (1):
>        target/riscv: add zicsr/zifencei to isa_string
> 
> Tsukasa OI (9):
>        target/riscv: Move Zhinx* extensions on ISA string
>        target/riscv: Add short-isa-string option
>        hw/riscv: Make CPU config error handling generous (virt/spike)
>        hw/riscv: Make CPU config error handling generous (sifive_e/u/opentitan)
>        target/riscv: Fix coding style on "G" expansion
>        target/riscv: Disable "G" by default
>        target/riscv: Change "G" expansion
>        target/riscv: FP extension requirements
>        target/riscv: Move/refactor ISA extension checks
> 
> Weiwei Li (1):
>        target/riscv: check 'I' and 'E' after checking 'G' in riscv_cpu_realize
> 
> eopXD (1):
>        target/riscv: rvv: Fix early exit condition for whole register load/store
> 
>   hw/core/uboot_image.h                   | 213 +++++++++++++++++++++-----------
>   target/riscv/cpu.h                      |  12 +-
>   hw/core/loader.c                        |  15 +++
>   hw/intc/riscv_aclint.c                  |   3 +-
>   hw/riscv/opentitan.c                    |   2 +-
>   hw/riscv/sifive_e.c                     |   2 +-
>   hw/riscv/sifive_u.c                     |  28 +----
>   hw/riscv/spike.c                        |   2 +-
>   hw/riscv/virt.c                         |  27 ++--
>   hw/vfio/pci-quirks.c                    |  34 ++---
>   target/riscv/cpu.c                      |  91 ++++++++++----
>   target/riscv/cpu_helper.c               |   4 +-
>   target/riscv/csr.c                      |  26 ++--
>   target/riscv/translate.c                |  17 ++-
>   target/riscv/insn_trans/trans_rvv.c.inc |  58 +++++----
>   15 files changed, 325 insertions(+), 209 deletions(-)
> 


