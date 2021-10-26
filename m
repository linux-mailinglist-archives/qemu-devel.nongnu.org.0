Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32C43AB87
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 07:05:09 +0200 (CEST)
Received: from localhost ([::1]:51838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfEe4-0003A6-2K
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 01:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mfEcB-0001kn-HX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 01:03:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mfEc9-0008DI-DP
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 01:03:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id g141so12790294wmg.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 22:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4dwIin+kAjocSuB7DTVHkvAbJrTs6HidXT+/BVEKm4=;
 b=4VXDmc3qL/za9Old9/c3plUGrlbiNQOcd1XN2Wl9h+Knn4xBIel9fVqfozdSS78Hx3
 8m88gPYUWhMrApPGyrXrp3+pUInyq8b04w6/jLcMPqxTvYs/5csWCMqLpPVh+hyFg1dH
 qg85ZN5cQxPHVaVWd57/X/FHt6JZFtQu80jD7MQRtYmeqIqqwE9bgJsvhCxVsxLJkTqK
 mLTE051lecdPip8uhRdAr1RGVfuFfgVdSXUOnaA4uY2m/Zy5jyr8OLELECLhxYMpGT6/
 pYlukxJh0CKtolDrpfbZwWZRhlDqEqy5Mk8O1KCw7078oBefs88ZlYGk7GSVXPJ1rN6g
 S+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4dwIin+kAjocSuB7DTVHkvAbJrTs6HidXT+/BVEKm4=;
 b=msxpa3NAPHRBZ9MEno+YtRw2BCgK8+Wnp6FJfgKQXv5Sgn1IxcOJmEt5UuDrr5scGj
 voC2dzdLYK9N6Rwo2eYTOY9nydF+XTf4zoqb2GWjDHajn+VrnnnqWhv8+yTHNM3UdzEZ
 hLLgrpt1oHp//dXe6s1ZFvtYWLFSMvN7lu8wO7oYhxZU18vFLHG58wMKbmO+tlMsc4B0
 5xwv2chsCVh2fG82yTYLaLRXwh9JJR6MtmrExI1ktqq0ECcLAK1J7buZjQeYptJ1Nxlz
 8vZZaCUuypK5oFl5HPyx6mFxx0NF4VEbBXkRH4hj2WJa3Tg64m662KKhrnAx7VxBWqci
 SLwA==
X-Gm-Message-State: AOAM532QbCiVAWXriu0GFfvMu8bXpe4YtjNlpyteIU+fZ48gBxSFTBtB
 5sRqFn0P8rvBHs562mZ7yGD/8sD41QgqnkOy3DWohw==
X-Google-Smtp-Source: ABdhPJwYi4Wirz9+8ZkCBGV1VBv5Z/eflW1ObRkZhOYOkeYF5AbdPp1TVXrAJ3HPawULMhpgloLitUPIXe/ocDilGbY=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr52955332wmc.176.1635224586453; 
 Mon, 25 Oct 2021 22:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211023084638.1697057-1-anup.patel@wdc.com>
In-Reply-To: <20211023084638.1697057-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Oct 2021 10:32:54 +0530
Message-ID: <CAAhSdy1FYmv-D3O42tBeeiK-AYJ1sMC53ApOKhaMiSo1SUfekA@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] QEMU RISC-V AIA support
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On Sat, Oct 23, 2021 at 2:17 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The advanced interrupt architecture (AIA) extends the per-HART local
> interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> and Advanced PLIC (wired interrupt controller).
>
> The latest AIA draft specification can be found here:
> https://github.com/riscv/riscv-aia/releases/download/0.2-draft.27/riscv-interrupts-027.pdf
>
> This series adds RISC-V AIA support in QEMU which includes emulating all
> AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
> not implemented because we don't have any local interrupt greater than 12.
>
> To enable AIA in QEMU, use one of the following:
> 1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
>    in the QEMU command-line
> 2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
>    in the QEMU command-line
> 3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
>    machine parameter in the QEMU command-line
> 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
>    "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
>    command-line
>
> To test series, we require OpenSBI and Linux with AIA support which can
> be found in riscv_aia_v1 branch at:
> https://github.com/avpatel/opensbi.git
> https://github.com/avpatel/linux.git
>
> This series can be found riscv_aia_v3 branch at:
> https://github.com/avpatel/qemu.git
>
> Changes since v2:
>  - Update PATCH4 to check and inject interrupt after V=1 when
>    transitioning from V=0 to V=1
>
> Changes since v1:
>  - Revamped whole series and created more granular patches
>  - Added HGEIE and HGEIP CSR emulation for H-extension
>  - Added APLIC emulation
>  - Added IMSIC emulation
>
> Anup Patel (22):
>   target/riscv: Fix trap cause for RV32 HS-mode CSR access from RV64
>     HS-mode
>   target/riscv: Implement SGEIP bit in hip and hie CSRs
>   target/riscv: Implement hgeie and hgeip CSRs
>   target/riscv: Improve delivery of guest external interrupts
>   target/riscv: Allow setting CPU feature from machine/device emulation
>   target/riscv: Add AIA cpu feature
>   target/riscv: Add defines for AIA CSRs
>   target/riscv: Allow AIA device emulation to set ireg rmw callback
>   target/riscv: Implement AIA local interrupt priorities
>   target/riscv: Implement AIA CSRs for 64 local interrupts on RV32
>   target/riscv: Implement AIA hvictl and hviprioX CSRs
>   target/riscv: Implement AIA interrupt filtering CSRs
>   target/riscv: Implement AIA mtopi, stopi, and vstopi CSRs
>   target/riscv: Implement AIA xiselect and xireg CSRs
>   target/riscv: Implement AIA IMSIC interface CSRs
>   hw/riscv: virt: Use AIA INTC compatible string when available
>   target/riscv: Allow users to force enable AIA CSRs in HART
>   hw/intc: Add RISC-V AIA APLIC device emulation
>   hw/riscv: virt: Add optional AIA APLIC support to virt machine
>   hw/intc: Add RISC-V AIA IMSIC device emulation
>   hw/riscv: virt: Add optional AIA IMSIC support to virt machine
>   docs/system: riscv: Document AIA options for virt machine

The PATCH19 and PATCH21 uses "aplic,xxx" and "imsic,xxx" DT
properties which is not allowed as-per Linux DT schema checker
because "aplic" and "imsic" prefixes are not vendor names. Instead
of this we should use "riscv" prefix which is registered vendor in
Linux DT bindings.

I will send v4 to fix the above.

Regards,
Anup

>
>  docs/system/riscv/virt.rst    |   16 +
>  hw/intc/Kconfig               |    6 +
>  hw/intc/meson.build           |    2 +
>  hw/intc/riscv_aplic.c         |  970 +++++++++++++++++++++++++
>  hw/intc/riscv_imsic.c         |  443 ++++++++++++
>  hw/riscv/Kconfig              |    2 +
>  hw/riscv/virt.c               |  694 +++++++++++++++---
>  include/hw/intc/riscv_aplic.h |   73 ++
>  include/hw/intc/riscv_imsic.h |   68 ++
>  include/hw/riscv/virt.h       |   40 +-
>  target/riscv/cpu.c            |   97 ++-
>  target/riscv/cpu.h            |   67 +-
>  target/riscv/cpu_bits.h       |  132 ++++
>  target/riscv/cpu_helper.c     |  300 +++++++-
>  target/riscv/csr.c            | 1273 ++++++++++++++++++++++++++++++---
>  target/riscv/machine.c        |   24 +-
>  16 files changed, 3901 insertions(+), 306 deletions(-)
>  create mode 100644 hw/intc/riscv_aplic.c
>  create mode 100644 hw/intc/riscv_imsic.c
>  create mode 100644 include/hw/intc/riscv_aplic.h
>  create mode 100644 include/hw/intc/riscv_imsic.h
>
> --
> 2.25.1
>

