Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A7950BAE2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:57:13 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuie-0005FW-42
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nhugp-00048w-LW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:55:19 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:37026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nhugn-0007LX-Io
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:55:19 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f16645872fso88013737b3.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FX1Zxb8Jq7RTn8rPNxil4sPAWIy9/XN0BZ21+91L+UQ=;
 b=k0okKlhw0kovgggtlHfT9jq2PDY0HQWrDIIyDgP76sZFdxiCIXrlGjBIPGGxVpULT1
 DOkemNEQ+fXQWZmkTohUqGAgCmKprA9894QPL1/v35LzAnkw+TTOthjGICwD5oXcHjZK
 Lu4Hi6Cv9huiHotKE+Z+0bWc4mA5RSmBp1atU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FX1Zxb8Jq7RTn8rPNxil4sPAWIy9/XN0BZ21+91L+UQ=;
 b=XrcsoU/OwBhKnKm0pXdoYqto+PZeqhBjRLpZwrvhLwIiZNeFIuU2hPncu7R9islfqp
 VNzh5LyR+qXClfMdVvxX14WJH4b9ghiqWu4v5azMW/xB/q9aVw1XkcByfrI10g+g4UaU
 iOerFYK4zq+uJEV6oKEYfrbt5miI8x3dyX562J3JKs3X+yQUWtM5BMPc4d/0v1TsH7k5
 6hOg2zRTvpKeaW9RQZ2YY1oBgQSkAWnfhkcFTa0Lnro3p2ynoPUn/AsJp66ZSCJK+LAV
 dlQPpWLPooscQuSbwZvOgcwHVhSpgRS+Gmh6tdagClo7GUY2QbXL1GAn8JrPV7DaSZP/
 HDeg==
X-Gm-Message-State: AOAM531BO2CaGeHdWMdcgRapOKCMiy30FX3ZXtyY4mUFij+u/KBzxdgq
 McTqJdEOKQ4jAKpfJTYqpu2f92xC6v/+hvkUs6KF
X-Google-Smtp-Source: ABdhPJwc1r8vJ0s9/JFxa/3M2fsZBH4uM720Q5V1F0e8jgvYliak5eSxUWzuMfk4d8hzshktK6rddbXyIY8S5nlsYN4=
X-Received: by 2002:a05:690c:16:b0:2db:cfed:de0e with SMTP id
 bc22-20020a05690c001600b002dbcfedde0emr5282142ywb.271.1650639315681; Fri, 22
 Apr 2022 07:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
 <CAKmqyKP8c9mOj-dxkgfSPtJy_gNEErYf2y7tbDos=adpEEcOwQ@mail.gmail.com>
In-Reply-To: <CAKmqyKP8c9mOj-dxkgfSPtJy_gNEErYf2y7tbDos=adpEEcOwQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 22 Apr 2022 07:55:04 -0700
Message-ID: <CAOnJCU+vdvbbhedO07E+mFDKzjrpb8a9g9_x2oH95qmnXhPttw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/riscv: Baseline QEMU support for RISC-V IOMMU
 (draft)
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 11:18 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Mar 17, 2022 at 8:23 AM Tomasz Jeznach <tjeznach@rivosinc.com> wrote:
> >
> > This is the series of patches to introduce RISC-V IOMMU emulation in QEMU.
> >
> > The Rivos IOMMU device implementation is based on a draft proposal of a
> > RISC-V I/O Management Unit (IOMMU) [1] as published on 2022/03/10, shared and
> > discussed with RISCV-V IOMMU Task Group [2].
>
> Awesome!
>
> >
> > Specification is in *draft* stage and is expected to be changed based on
> > discussion and feedback received from RISC-V IOMMU TG.
>
> So I'm assuming this will become a "RISC-V IOMMU" and not a "Rivos
> IOMMU" as the spec progresses?
>
> >
> > This series enables rivos-iommu support for riscv/virt machine emulation.
> > With corresponding Linux kernel driver and (modified) pending AIA-IMSIC
> > support [3] QEMU is able to boot into Linux with I/O protection enabled for
> > PCIe devices.  Without AIA-IMSIC support interrupt based I/O translation fault
> > reporting and MSI remapping features are not available, while all remaining
> > IOMMU features are active.
> >
> > To enable IOMMU in QEMU add 'rivos-iommu' to the device list for 'virt' machine
> > emulation.
>
> Cool!
>
> So one thought, if a user is expected to enable the IOMMU, AIA and
> other options in the virt machine it might be worthwhile adding a
> coverall option.
>
> So for example a user could do
>
> -machine virt,full-virt=true
>
> and that would enable the IOMMU, AIA and other important virtulisation features.
>

There are different options for AIA as well. aplic , aplic-imsic. In
the future, there can be imsic
option as well depending on the fate of the 'minic' machine series.

I guess you mean aplic-imsic here.

>
> Alistair
>
> >
> >
> > [1] https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view
> > [2] https://lists.riscv.org/g/tech-iommu/message/3
> > [3] https://lore.kernel.org/qemu-devel/20220220085526.808674-1-anup@brainfault.org
> >
> > Tomasz Jeznach (2):
> >   hw/riscv: rivos-iommu: Baseline implementation of RIVOS IOMMU.
> >   hw/riscv: virt: Add rivos-iommu device to 'virt' machine.
> >
> >  hw/riscv/Kconfig               |    4 +
> >  hw/riscv/meson.build           |    1 +
> >  hw/riscv/rivos_iommu.c         | 1350 ++++++++++++++++++++++++++++++++
> >  hw/riscv/trace-events          |    7 +
> >  hw/riscv/trace.h               |    2 +
> >  hw/riscv/virt.c                |  115 ++-
> >  include/hw/pci/pci_ids.h       |    1 +
> >  include/hw/riscv/rivos_iommu.h |   80 ++
> >  include/hw/riscv/virt.h        |    2 +
> >  meson.build                    |    1 +
> >  10 files changed, 1539 insertions(+), 24 deletions(-)
> >  create mode 100644 hw/riscv/rivos_iommu.c
> >  create mode 100644 hw/riscv/trace-events
> >  create mode 100644 hw/riscv/trace.h
> >  create mode 100644 include/hw/riscv/rivos_iommu.h
> >
> > --
> > 2.25.1
> >
> >
>


-- 
Regards,
Atish

