Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D46336AD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 09:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxOM0-0000h8-VB; Tue, 22 Nov 2022 03:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oxOLT-0000ak-M1
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:09:43 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oxOLR-0002Ic-SX
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 03:09:31 -0500
Received: by mail-pf1-x42f.google.com with SMTP id 140so13676870pfz.6
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sb8YnLCJpHRQPXtTp5Rv2mhgsRJx1k/ho731xOQ5kXA=;
 b=2Rh44m3j7KHFKJF/1WMMIgG3iPbTErYmeUkGywbsXJYteuONwBsjEUwWDRnccUaK5F
 shrAOpW2jOIfUU12nqghhCsHt7073jGE7F2uHp/E9OcTcI6OZeU2bfuOt/2klvNgeRCf
 MzlSpZqVyOZHd05rWj7Db8JA8cctljv5zuZAci6P/DAL6RRMLYfV4a2p8tMe0axICyq+
 RLZpvBrl7Qq3tVu2VpxTVT5t0+Djr82W/J6X9TCe/bwHhZ1bAbdlZyo2Y/3NB7ZcmSwv
 KrecaAtQqmLnhadLp8M0VbSWxv7M4xZehsWbHg69dVWADYq5ga3clHLu14rDyIY5dBz4
 4pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sb8YnLCJpHRQPXtTp5Rv2mhgsRJx1k/ho731xOQ5kXA=;
 b=J73K3rrFLcDIgq6385HsFMG+pqcJltz1FsdZSur4Qtnv/1gy5xabJZANu49QepkFnp
 dpRByhTQLZdh1KhYCBypY6ZztLq75WSzgqOHKi87u4sN3tsrXFYdMVPRDp/P9nbdZho0
 Mn3uUfedF3PzG4Hvnp8ELMJL5euOwJfhtpOt6JRq452zeh2BXKLHx7O8JcT/938aA208
 1UEizFKlSzRu3g+8iLrDTJ2Z9lBnsmjBqqIwln6aEdZWRwLRwlctKdMRohV7dwxqGEFr
 Bg/GTZ7dbb6dHutT6a7fBJoo2GmQAV0rL69qiFWgFP4ZrCS+tcnz2t5byEMWMNtvnIh/
 de5w==
X-Gm-Message-State: ANoB5plYazJClSkQNw1/F/ducYM3Kxxy0gkjsStYAMwHGaVXeXBJCdyJ
 LWZSh5BIuf5Ugu3atoTEPvy5gN2HcRCasha/EDW3cg==
X-Google-Smtp-Source: AA0mqf709XEn/juSmpZVJVFcHsKLgYrRwlb4PlFDwhPuUVq4cz6VVijC/JbENdMjvhYAve6mcXRUGMYKPVxqP4845CQ=
X-Received: by 2002:a62:54c2:0:b0:56b:fb4f:3d7c with SMTP id
 i185-20020a6254c2000000b0056bfb4f3d7cmr24550098pfb.54.1669104568444; Tue, 22
 Nov 2022 00:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20221113095101.3395628-1-atishp@rivosinc.com>
 <CAKmqyKP-+5hOjn7p_30MfYgK1ANx9P_Y0SE7+NSq6T-GMpYyFg@mail.gmail.com>
In-Reply-To: <CAKmqyKP-+5hOjn7p_30MfYgK1ANx9P_Y0SE7+NSq6T-GMpYyFg@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 22 Nov 2022 00:09:17 -0800
Message-ID: <CAHBxVyHATHnmT8Ggkvxwpefb2Bpz9W8Gk0Vj1oddt3Py0FUnHQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: virt: Remove the redundant ipi-id property
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 21, 2022 at 10:11 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sun, Nov 13, 2022 at 7:52 PM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The imsic DT binding[1] has changed and no longer require an ipi-id.
> > The latest IMSIC driver dynamically allocates ipi id if slow-ipi
> > is not defined.
> >
> > Get rid of the unused dt property which may lead to confusion.
> >
> > [1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/riscv/virt.c         | 2 --
> >  include/hw/riscv/virt.h | 1 -
> >  2 files changed, 3 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index a5bc7353b412..0bc0964e42a8 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
> >          riscv_socket_count(mc) * sizeof(uint32_t) * 4);
> >      qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
> >          VIRT_IRQCHIP_NUM_MSIS);
> > -    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
> > -        VIRT_IRQCHIP_IPI_MSI);
> >      if (riscv_socket_count(mc) > 1) {
> >          qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
> >              imsic_num_bits(imsic_max_hart_per_socket));
> > diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> > index be4ab8fe7f71..62513e075c47 100644
> > --- a/include/hw/riscv/virt.h
> > +++ b/include/hw/riscv/virt.h
> > @@ -93,7 +93,6 @@ enum {
> >
> >  #define VIRT_PLATFORM_BUS_NUM_IRQS 32
> >
> > -#define VIRT_IRQCHIP_IPI_MSI 1
>
> This is used elsewhere with a different "riscv,ipi-id" and this fails to compile
>

I am not sure what I was thinking when I sent the patch. It is such a
silly patch.
Anyways, I am really sorry for the breakage. I have sent the v3.

> I have dropped this patch
>
> Alistair
>
> >  #define VIRT_IRQCHIP_NUM_MSIS 255
> >  #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
> >  #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
> > --
> > 2.25.1
> >
> >

