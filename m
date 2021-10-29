Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C823F44049C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 23:03:00 +0200 (CEST)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgZ1f-0003A0-Tl
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 17:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgYsP-0008RZ-V5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:53:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:56112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgYsN-0002T2-QJ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:53:25 -0400
Received: by mail-pj1-x1033.google.com with SMTP id om14so7980733pjb.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 13:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/oe66p6hVgoS75WOWQ4VkdHRBYEFckk7VzowxU0MzGw=;
 b=S9/SN/MRi4rUMX9hIIKrG9rUgHUO0JnjbJHg326DSKiQ09rvz/LUYg0UJeawRiaHPC
 w4n+CfbuOpjQZ99ma9zYrqUyr9+0VdVKqPa8vRBVaVmeBXFEPA6n8dSRvt7uHET2Q4f5
 oNLRsxrK+DgEWnBXlw8ftGvKychhMyANIgMevH95ahBConWRypRaLGYx1XtvjcNInB5k
 22lqGi+OCwXQMBmMMeMlsY62xz8WzZefNCn+lWq+qIlpbv8fU7QvkBxuJ4DXs9hfeUz7
 R+/wTjgTSUObWwk57Wp01vQEWla2HH2EGw9Bh/ICm+0rmDdM75ILh+1b3pEHAjRgv8kS
 S+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/oe66p6hVgoS75WOWQ4VkdHRBYEFckk7VzowxU0MzGw=;
 b=KiONOpGK6TVaLhBYKEvg22o8mMoqOvcDZVuALxNoBXZKO4Y5+a9S/XeQOGp7hSFvtJ
 04/EZdbtV7Mc3JOzgdBCp8xJ51BctYSAwt1hpeXovupFJwbRRjaIGmxJG3FnlFt94MbJ
 zwrc6TMx87NdzbJcTxgRScDHw9vpuJwBxxG1zTr0DtWldTNnAp013i+DIL9gUgE9Ml0G
 DBvGQkNUadaTRGMwUC8RqfYUlqU1bAcrG5HpeDnODCwruk5P6FgFBgh+fpk1cRobI6YL
 KdMYuOmPZwN28zim9E1lNV+Ta8ytX5SYIqSlFZZPW7E/TZveCpaEhi+GqMPvXRRoZhqv
 IB5Q==
X-Gm-Message-State: AOAM533RrezGHi7ta7w3UKRY6IicnEn19Za8w8QmBfFwKNnsgjj38RaO
 fJ1M4bx3zgi16xlsJyGmwlDyeA==
X-Google-Smtp-Source: ABdhPJxxPlTe0kqtaLXnD0Y+HjohintcNNip09w9zi+ZQM1XInnGViVaK6/FO3oSQLTApwobGFQCdw==
X-Received: by 2002:a17:90b:3846:: with SMTP id
 nl6mr14131553pjb.53.1635540802285; 
 Fri, 29 Oct 2021 13:53:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k13sm8623789pfc.197.2021.10.29.13.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 13:53:21 -0700 (PDT)
Subject: Re: [PULL v2 00/18] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <99b0620f-7e80-a273-fb90-99887ed07dfe@linaro.org>
Date: Fri, 29 Oct 2021 13:53:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 12:07 AM, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211029-1
> 
> for you to fetch changes up to 15161e425ee1bb1180f9cec574cda44fb10c0931:
> 
>    target/riscv: change the api for RVF/RVD fmin/fmax (2021-10-29 16:56:12 +1000)
> 
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 6.2
> 
>   - Use a shared PLIC config helper function
>   - Fixup the OpenTitan PLIC configuration
>   - Add support for the experimental J extension
>   - Update the fmin/fmax handling
>   - Fixup VS interrupt forwarding
> 
> ----------------------------------------------------------------
> Alexey Baturo (7):
>        target/riscv: Add J-extension into RISC-V
>        target/riscv: Add CSR defines for RISC-V PM extension
>        target/riscv: Support CSRs required for RISC-V PM extension except for the h-mode
>        target/riscv: Add J extension state description
>        target/riscv: Print new PM CSRs in QEMU logs
>        target/riscv: Support pointer masking for RISC-V for i/c/f/d/a types of instructions
>        target/riscv: Allow experimental J-ext to be turned on
> 
> Alistair Francis (6):
>        hw/riscv: virt: Don't use a macro for the PLIC configuration
>        hw/riscv: boot: Add a PLIC config string function
>        hw/riscv: sifive_u: Use the PLIC config helper function
>        hw/riscv: microchip_pfsoc: Use the PLIC config helper function
>        hw/riscv: virt: Use the PLIC config helper function
>        hw/riscv: opentitan: Fixup the PLIC context addresses
> 
> Anatoly Parshintsev (1):
>        target/riscv: Implement address masking functions required for RISC-V Pointer Masking extension
> 
> Chih-Min Chao (2):
>        softfloat: add APIs to handle alternative sNaN propagation for fmax/fmin
>        target/riscv: change the api for RVF/RVD fmin/fmax
> 
> Jose Martins (2):
>        target/riscv: fix VS interrupts forwarding to HS
>        target/riscv: remove force HS exception
> 
>   include/fpu/softfloat.h                 |  10 ++
>   include/hw/riscv/boot.h                 |   2 +
>   include/hw/riscv/microchip_pfsoc.h      |   1 -
>   include/hw/riscv/sifive_u.h             |   1 -
>   include/hw/riscv/virt.h                 |   1 -
>   target/riscv/cpu.h                      |  17 +-
>   target/riscv/cpu_bits.h                 | 102 +++++++++++-
>   fpu/softfloat.c                         |  19 ++-
>   hw/riscv/boot.c                         |  25 +++
>   hw/riscv/microchip_pfsoc.c              |  14 +-
>   hw/riscv/opentitan.c                    |   4 +-
>   hw/riscv/sifive_u.c                     |  14 +-
>   hw/riscv/virt.c                         |  20 +--
>   target/riscv/cpu.c                      |  13 ++
>   target/riscv/cpu_helper.c               |  72 +++-----
>   target/riscv/csr.c                      | 285 ++++++++++++++++++++++++++++++++
>   target/riscv/fpu_helper.c               |  16 +-
>   target/riscv/machine.c                  |  27 +++
>   target/riscv/translate.c                |  43 +++++
>   fpu/softfloat-parts.c.inc               |  25 ++-
>   target/riscv/insn_trans/trans_rva.c.inc |   3 +
>   target/riscv/insn_trans/trans_rvd.c.inc |   2 +
>   target/riscv/insn_trans/trans_rvf.c.inc |   2 +
>   target/riscv/insn_trans/trans_rvi.c.inc |   2 +
>   24 files changed, 605 insertions(+), 115 deletions(-)

Applied, thanks.

r~


