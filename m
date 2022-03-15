Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574A4D966A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:36:48 +0100 (CET)
Received: from localhost ([::1]:59404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2ff-0006mh-2m
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:36:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nU2cV-00065e-26
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:33:31 -0400
Received: from [2a00:1450:4864:20::429] (port=42818
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nU2cT-0003JR-0h
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:33:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id u10so27771024wra.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OEUsPBEuIs6DIEVHlTdW+ZeJIPqCO+XeDQAk25A4okk=;
 b=xcFODFg6rvRwSYZzhSU4KVxY5hWa2AppA5ZwVBij6hetcLpOMf0nuL++WlVAY7gua8
 sgGwSQSsnr1/1RTrcuy/5QhDFIQSLTA2YpuMUi9MaLHo+44hn9QFIwut5wiGJrjqz3zF
 HbZADJpvRp23bo+6YRZzSe6CY2ZiX1CzwnNHkgbiJKwyq2QQ06TxmXCUfb7yIr8lxmNt
 OP7CpKRNQlpO4zvjP6gIx67CL3iwYwPk2/ZWphk0cUGYrBZ1F4mkS9DdjcoLx1si7v9l
 CrSDOteCLGoFyUaMW1vEZK5B360S+DoDBQbqPgbHbtksGjfCmI/wZFCEnuwBN4EXViBK
 ZS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OEUsPBEuIs6DIEVHlTdW+ZeJIPqCO+XeDQAk25A4okk=;
 b=ss/MPsoycZ/hTBg2b/vLDqSY8zvhfSN1gQ61CDwnBtm5mXHfg+zB+15o7ZoymfX0Za
 EDbkG1iZf1Lqf23YWGNx0dtgqUtPePr0/x2FQ0MP+QqUgSwIKS8bCdzOVZ32A6kQrjrx
 gzExCn0qE9NIbJaCasqMp4qq/6tJ8n9fVvrsb1yhl5hdAmRl79oQvcs9Dpmgy7HbI/SB
 9Q+jEMar+CadgosniQzPqnseKpBAEML5DtwErWYslasiV2hhROBiKdwDivUvC7l00bI3
 nYnR1UqKeu/k3dfnmXoNx3VrKRiYN8GQ+2QY5fqi3a3z4z5EduFe7+306DyBhy86fScu
 o9Tw==
X-Gm-Message-State: AOAM533ycdJwqlDQxxsu7MSb/13bgcuJncxBAvgoJ4kDukV9Ku8IUx5y
 ZRBa61cdHfN7jXZUG2oL51NMYaSp0RlPm0SC4HqZYA==
X-Google-Smtp-Source: ABdhPJxlJEPZjO9NjfW7qBgMZjwMRd3yJIMqxCcPbU2w0p25geYZcU8+w5WxSwlg5Brl+mIWNLYH/NBrXFzJhSe1g8c=
X-Received: by 2002:a5d:588e:0:b0:203:77d2:af48 with SMTP id
 n14-20020a5d588e000000b0020377d2af48mr19582627wrf.214.1647333206827; Tue, 15
 Mar 2022 01:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
In-Reply-To: <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 14:03:13 +0530
Message-ID: <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
Subject: Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jiangyifei <jiangyifei@huawei.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Stefan Huber <stefan.huber@oth-regensburg.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 12:18 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>
> On Sun, Mar 13, 2022 at 12:12 PM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
> >
> > Hi,
> >
> > I'm trying to run Linux/QEMU+KVM inside an emulated
> > qemu-system-riscv64 VM (x86 host). On latest&greatest QEMU (1416688c53)=
,
> > I run Linux inside QEMU. On host side:
> >
> > qemu-system-riscv64 -nographic \
> >          -machine virt \
> >          -cpu 'rv64,h=3Dtrue' \
> >          -smp 8 -m 8G \
> >          -bios $latest_opensbi \
> >          -kernel $latest_upstream_linux \
> >         [=E2=80=A6snip=E2=80=A6]
> >
> > Inside that machine, I boot Linux with KVM enabled:
> >
> > [=E2=80=A6]
> > [    0.228939] kvm [1]: hypervisor extension available
> > [    0.229000] kvm [1]: using Sv48x4 G-stage page table format
> > [    0.229033] kvm [1]: VMID 14 bits available
> > [=E2=80=A6]
> >
> > KVM seems to load correctly. Inside that machine, I compiled QEMU from
> > the same sources with the KVM accelerator enabled. When I try to start
> > QEMU with KVM enabled, I get
> >
> > ./qemu-system-riscv64 -nographic \
> >         -monitor none \
> >         -machine virt \
> >         -smp 1 -m 1G \
> >         -bios ./pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
> >         -serial stdio \
> >         -enable-kvm

The QEMU RISC-V KVM support is quite new so I haven't got a chance
to play with it.

Nevertheless, we should not pass any firmware when using KVM
so can you try "-bios none" ?

Regards,
Anup

> >
> > [ 4860.559194] kvm [9942]: VCPU exit error -95
> > [ 4860.584262] kvm [9942]: SEPC=3D0x0 SSTATUS=3D0x200004120 HSTATUS=3D0=
x2002001c0
> > [ 4860.586839] kvm [9942]: SCAUSE=3D0x14 STVAL=3D0x0 HTVAL=3D0x0 HTINST=
=3D0x0
> >
> > on the ringbuffer, together with a register dump of qemu [1] on the
> > console. Needless to say, but without -enable-kvm, it works fine.
> >
> > As far as I see that, SCAUSE=3D0x14 reports a 'Instruction Guest PF',
> > which would be kind of correct, if the guest's PC really tries to
> > execute at phys 0x0. DRAM of the 'virt' machine definition should start
> > at 0x80000000, where OpenSBI resides. So I wonder if an erroneous reset
> > PC might be the culprit=E2=80=A6
> >
> > Before digging deeper into that issue, I wanted to ask if Qemu/KVM
> > inside an emulated riscv64+H-extension is actually supported, or if thi=
s
> > is a known bug and has some ongoing work.
>
> RISC-V KVM should work. I haven't had a chance to try it myself though.
>
> I have CCed two people who hopefully can help.
>
> Alistair
>
> >
> > Thanks
> >    Ralf
> >
> > [1]
> >
> >   pc       0000000000000000
> >   mhartid  0000000000000000
> >   mstatus  0000000200000000
> >   mip      0000000000000000
> >   mie      0000000000000000
> >   mideleg  0000000000000000
> >   medeleg  0000000000000000
> >   mtvec    0000000000000000
> >   stvec    0000000000000000
> >   mepc     0000000000000000
> >   sepc     0000000000000000
> >   mcause   0000000000000000
> >   scause   0000000000000000
> >   mtval    0000000000000000
> >   stval    0000000000000000
> >   mscratch 0000000000000000
> >   sscratch 0000000000000000
> >   satp     0000000000000000
> >   x0/zero  0000000000000000 x1/ra    0000000000000000 x2/sp
> > 0000000000000000 x3/gp    0000000000000000
> >   x4/tp    0000000000000000 x5/t0    0000000000000000 x6/t1
> > 0000000000000000 x7/t2    0000000000000000
> >   x8/s0    0000000000000000 x9/s1    0000000000000000 x10/a0
> > 0000000000000000 x11/a1   00000000bf000000
> >   x12/a2   0000000000000000 x13/a3   0000000000000000 x14/a4
> > 0000000000000000 x15/a5   0000000000000000
> >   x16/a6   0000000000000000 x17/a7   0000000000000000 x18/s2
> > 0000000000000000 x19/s3   0000000000000000
> >   x20/s4   0000000000000000 x21/s5   0000000000000000 x22/s6
> > 0000000000000000 x23/s7   0000000000000000
> >   x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10
> > 0000000000000000 x27/s11  0000000000000000
> >   x28/t3   0000000000000000 x29/t4   0000000000000000 x30/t5
> > 0000000000000000 x31/t6   0000000000000000
> >

