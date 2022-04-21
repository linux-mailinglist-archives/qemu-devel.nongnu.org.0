Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35F509763
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:22:06 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQCa-0008Ge-WA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhQ5g-0005Gp-SA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:14:56 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhQ5f-0004Xl-0I
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:14:56 -0400
Received: by mail-io1-xd34.google.com with SMTP id p62so4312904iod.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOXkJ1IRAgVER97Y63fX46bE2rnIDJsRjAn+/E9O07c=;
 b=n21I6UHBQJclAWLD/4asRRX4zedl5n2/Ke3Lfo+eg++r2RAFt4L+6m1LJsKJ65xs5F
 sH7vvyboNLA47LtEZu91IecV5C0ftJ1aDjyRiL7/SeVFpJV4DbvfUZG4UR+18THamxKi
 Yd6zZHuKL7/3s9nAKkLMsRVX+RI+rLBgoWKJmC6Ax7vY6VYpMlB/7ZX245uNxTogT3hU
 UzrYVEqsZ5/L1DvZu3ll8BBBGdSxafaYXgc2rroLTdKEzGxeevLd3ydc0dKrD/s+g9Of
 j/tNIYU2gtPYnbxncM1ViuB86riAb7EcUWC9qfeqEdZY1TczkArocHqmDFzfuh8ABVhT
 OMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOXkJ1IRAgVER97Y63fX46bE2rnIDJsRjAn+/E9O07c=;
 b=cgrskv8JOr+CBHkziLQfhvoJm8PkuSXfvM1vFYRrfi9BJPdYVx43RAaJcw2FT1TrP/
 9nlMUIPpWcvmEMRn94qZT9KV+Wvh3tJnrAM65IKqC1hGjQYs/s7CinTQowsHeoS0gnwy
 DCWVYz2/2/qNMwo2kY2XS7M5EbOGNkut9s+LGCQ1/Z+Gg6oi1wEldBf9vV7HTqAtCMV6
 a6KUCousdkv9Bk6AaBVgzEz68i2hGcAnkq4HvSvR4pDaMT2pFTI2LVspDcImSajmI4Ul
 c1J/U8IKsB3jB4X5v9dFGOqDatPg7xyzw42GukPeKknFo8S/9cp2jAeOBqs7ie+yDGy/
 XD7g==
X-Gm-Message-State: AOAM5330/Sb5Lv5pIA3Jc7IqV5UPq1XJwqD663uNUbnlrY1wQUfE60k5
 may2Or5q7ZdhS9u3zdxDJTuveD/mfRaK293H0sQvKpuhIoFhcA==
X-Google-Smtp-Source: ABdhPJwUFJSVKcfs5GRhJYlnYlZkEjzl7GKmB1JHICtECVWQaINbrmX/QOYK6w+cRP0Du4qAVduIqLJyZerOJK2gLtk=
X-Received: by 2002:a05:6638:1914:b0:32a:8804:da85 with SMTP id
 p20-20020a056638191400b0032a8804da85mr3425930jal.212.1650521693747; Wed, 20
 Apr 2022 23:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
In-Reply-To: <20220316222116.2492777-1-tjeznach@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Apr 2022 16:14:27 +1000
Message-ID: <CAKmqyKP8c9mOj-dxkgfSPtJy_gNEErYf2y7tbDos=adpEEcOwQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] hw/riscv: Baseline QEMU support for RISC-V IOMMU
 (draft)
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 8:23 AM Tomasz Jeznach <tjeznach@rivosinc.com> wrote:
>
> This is the series of patches to introduce RISC-V IOMMU emulation in QEMU.
>
> The Rivos IOMMU device implementation is based on a draft proposal of a
> RISC-V I/O Management Unit (IOMMU) [1] as published on 2022/03/10, shared and
> discussed with RISCV-V IOMMU Task Group [2].

Awesome!

>
> Specification is in *draft* stage and is expected to be changed based on
> discussion and feedback received from RISC-V IOMMU TG.

So I'm assuming this will become a "RISC-V IOMMU" and not a "Rivos
IOMMU" as the spec progresses?

>
> This series enables rivos-iommu support for riscv/virt machine emulation.
> With corresponding Linux kernel driver and (modified) pending AIA-IMSIC
> support [3] QEMU is able to boot into Linux with I/O protection enabled for
> PCIe devices.  Without AIA-IMSIC support interrupt based I/O translation fault
> reporting and MSI remapping features are not available, while all remaining
> IOMMU features are active.
>
> To enable IOMMU in QEMU add 'rivos-iommu' to the device list for 'virt' machine
> emulation.

Cool!

So one thought, if a user is expected to enable the IOMMU, AIA and
other options in the virt machine it might be worthwhile adding a
coverall option.

So for example a user could do

-machine virt,full-virt=true

and that would enable the IOMMU, AIA and other important virtulisation features.


Alistair

>
>
> [1] https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view
> [2] https://lists.riscv.org/g/tech-iommu/message/3
> [3] https://lore.kernel.org/qemu-devel/20220220085526.808674-1-anup@brainfault.org
>
> Tomasz Jeznach (2):
>   hw/riscv: rivos-iommu: Baseline implementation of RIVOS IOMMU.
>   hw/riscv: virt: Add rivos-iommu device to 'virt' machine.
>
>  hw/riscv/Kconfig               |    4 +
>  hw/riscv/meson.build           |    1 +
>  hw/riscv/rivos_iommu.c         | 1350 ++++++++++++++++++++++++++++++++
>  hw/riscv/trace-events          |    7 +
>  hw/riscv/trace.h               |    2 +
>  hw/riscv/virt.c                |  115 ++-
>  include/hw/pci/pci_ids.h       |    1 +
>  include/hw/riscv/rivos_iommu.h |   80 ++
>  include/hw/riscv/virt.h        |    2 +
>  meson.build                    |    1 +
>  10 files changed, 1539 insertions(+), 24 deletions(-)
>  create mode 100644 hw/riscv/rivos_iommu.c
>  create mode 100644 hw/riscv/trace-events
>  create mode 100644 hw/riscv/trace.h
>  create mode 100644 include/hw/riscv/rivos_iommu.h
>
> --
> 2.25.1
>
>

