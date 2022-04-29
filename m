Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4185351576A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 23:53:23 +0200 (CEST)
Received: from localhost ([::1]:58192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkYYE-0000gK-70
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 17:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkYWs-0007gw-Fd
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 17:51:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkYWp-0004EZ-Qt
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 17:51:57 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so7446586pgn.8
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+sAKZ+DAo/g5pRv3C1uIPpxdsOZWZCaeRYdqoEzmEYE=;
 b=ZQnlv+CPjuYwKMQqrHMyIwUTrZd7hgjOa3CUVrw2uY6bvqrTvzdirTX5VDTZne6c8j
 Il9AXAedVh6Mo7k8PrK+/CFfpaio/8TcI+fieynCeSjSiMTzHbYhrDBY9PcILEdQca9X
 o1/jd+DUDfNhWh1mjoZsaIqmRlgTWQZtho9xA/VB82YogSCDQYd9Ww9i2mMZBfmcFLg7
 zINMdvSUK6fNWaUZAnldxUPuBmOrSWV+1ucb8jxHkN2c17ZsRxZ8qRJTaiBFpsX0dIi6
 lBKopqUS1gi8yuei5OoZ0fSHzquk/pXrthY3H1WF4IRM7OtfhDFhd3SApCFb3Oa29N1E
 /8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+sAKZ+DAo/g5pRv3C1uIPpxdsOZWZCaeRYdqoEzmEYE=;
 b=jzl694Qe7lMXlLYVye3BufbjEAGIIMuBwzl2u6rRvvPyweq1oW9qldSowuWOHM2rOo
 1+sbwhldh+CuB733nJEVzAzepqC975JOpjOMweSramh3SVvFrdjAaxUp6rodGKDcwxaP
 2l0wop9TM19JzakX/67zw3tML+L2pYNJbEmBrldmeFLN4vllgSS9ESs9ouWRveQJYBBW
 RwA80ZYCi2HVAScZUGQKJAw8nB5y6xxdW2gEzhaplE4ILCUALmfZTeS7O19l43Ht66Pu
 mrJ8Q8oxjBgZgDw39kvkZ026+5L6VFq8KFoc4MM9wQA6yCie86TXhtP6vD1GPw73KING
 sq9w==
X-Gm-Message-State: AOAM532cnO1pSiazKdyoVExwz5gK5yU6ECBSha6739Xixtxbskq3/Sc1
 gWKYgE7VeCFkYP+dASf05XGF5w==
X-Google-Smtp-Source: ABdhPJx+nL6JSFKOb6pkLCZxPOochll+qveMptcAwzDA7YHb6zwRjRCySMQHMvD9yDTKFzbdhPWGpA==
X-Received: by 2002:a63:d801:0:b0:3c1:7976:8a73 with SMTP id
 b1-20020a63d801000000b003c179768a73mr1014501pgh.266.1651269114277; 
 Fri, 29 Apr 2022 14:51:54 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170902759700b0015e8d4eb2d8sm73418pll.290.2022.04.29.14.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 14:51:53 -0700 (PDT)
Message-ID: <2cf89e1b-cc4b-702e-d547-ba4755155061@linaro.org>
Date: Fri, 29 Apr 2022 14:51:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/25] riscv-to-apply queue
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 21:30, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> The following changes since commit f22833602095b05733bceaddeb20f3edfced3c07:
> 
>    Merge tag 'pull-target-arm-20220428' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-28 08:34:17 -0700)
> 
> are available in the Git repository at:
> 
>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220429
> 
> for you to fetch changes up to 325b7c4e7582c229d28c47123c3b986ed948eb84:
> 
>    hw/riscv: Enable TPM backends (2022-04-29 10:48:48 +1000)
> 
> ----------------------------------------------------------------
> Second RISC-V PR for QEMU 7.1
> 
>   * Improve device tree generation
>   * Support configuarable marchid, mvendorid, mipid CSR values
>   * Add support for the Zbkb, Zbkc, Zbkx, Zknd/Zkne, Zknh, Zksed/Zksh and Zkr extensions
>   * Fix incorrect PTE merge in walk_pte
>   * Add TPM support to the virt board

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alistair Francis (6):
>        hw/riscv: virt: Add a machine done notifier
>        hw/core: Move the ARM sysbus-fdt to core
>        hw/riscv: virt: Create a platform bus
>        hw/riscv: virt: Add support for generating platform FDT entries
>        hw/riscv: virt: Add device plug support
>        hw/riscv: Enable TPM backends
> 
> Bin Meng (2):
>        hw/riscv: spike: Add '/chosen/stdout-path' in device tree unconditionally
>        hw/riscv: Don't add empty bootargs to device tree
> 
> Frank Chang (1):
>        target/riscv: Support configuarable marchid, mvendorid, mipid CSR values
> 
> Ralf Ramsauer (1):
>        target/riscv: Fix incorrect PTE merge in walk_pte
> 
> Weiwei Li (15):
>        target/riscv: rvk: add cfg properties for zbk* and zk*
>        target/riscv: rvk: add support for zbkb extension
>        target/riscv: rvk: add support for zbkc extension
>        target/riscv: rvk: add support for zbkx extension
>        crypto: move sm4_sbox from target/arm
>        target/riscv: rvk: add support for zknd/zkne extension in RV32
>        target/riscv: rvk: add support for zkne/zknd extension in RV64
>        target/riscv: rvk: add support for sha256 related instructions in zknh extension
>        target/riscv: rvk: add support for sha512 related instructions for RV32 in zknh extension
>        target/riscv: rvk: add support for sha512 related instructions for RV64 in zknh extension
>        target/riscv: rvk: add support for zksed/zksh extension
>        target/riscv: rvk: add CSR support for Zkr
>        disas/riscv.c: rvk: add disas support for Zbk* and Zk* instructions
>        target/riscv: rvk: expose zbk* and zk* properties
>        target/riscv: add scalar crypto related extenstion strings to isa_string
> 
>   docs/system/riscv/virt.rst              |  20 ++
>   include/crypto/sm4.h                    |   6 +
>   include/hw/{arm => core}/sysbus-fdt.h   |   0
>   include/hw/riscv/virt.h                 |   8 +-
>   target/riscv/cpu.h                      |  17 ++
>   target/riscv/cpu_bits.h                 |   9 +
>   target/riscv/helper.h                   |  22 ++
>   target/riscv/pmp.h                      |   8 +-
>   target/riscv/insn32.decode              |  97 ++++++--
>   crypto/sm4.c                            |  49 ++++
>   disas/riscv.c                           | 173 +++++++++++++-
>   hw/arm/virt.c                           |   2 +-
>   hw/arm/xlnx-versal-virt.c               |   1 -
>   hw/{arm => core}/sysbus-fdt.c           |   2 +-
>   hw/riscv/microchip_pfsoc.c              |   2 +-
>   hw/riscv/sifive_u.c                     |   2 +-
>   hw/riscv/spike.c                        |   7 +-
>   hw/riscv/virt.c                         | 319 +++++++++++++++++---------
>   target/arm/crypto_helper.c              |  36 +--
>   target/riscv/bitmanip_helper.c          |  80 +++++++
>   target/riscv/cpu.c                      |  58 +++++
>   target/riscv/crypto_helper.c            | 302 ++++++++++++++++++++++++
>   target/riscv/csr.c                      | 118 +++++++++-
>   target/riscv/monitor.c                  |  11 +-
>   target/riscv/op_helper.c                |   9 +
>   target/riscv/translate.c                |   8 +
>   target/riscv/insn_trans/trans_rvb.c.inc | 116 ++++++++--
>   target/riscv/insn_trans/trans_rvk.c.inc | 391 ++++++++++++++++++++++++++++++++
>   crypto/meson.build                      |   1 +
>   hw/arm/meson.build                      |   1 -
>   hw/core/meson.build                     |   1 +
>   hw/riscv/Kconfig                        |   2 +
>   target/riscv/meson.build                |   3 +-
>   33 files changed, 1682 insertions(+), 199 deletions(-)
>   create mode 100644 include/crypto/sm4.h
>   rename include/hw/{arm => core}/sysbus-fdt.h (100%)
>   create mode 100644 crypto/sm4.c
>   rename hw/{arm => core}/sysbus-fdt.c (99%)
>   create mode 100644 target/riscv/crypto_helper.c
>   create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
> 


