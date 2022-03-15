Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3434D9B67
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:40:54 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6Tt-0006Ir-Kp
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:40:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nU6Ev-0002XM-0I
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:25:27 -0400
Received: from [2a00:1450:4864:20::331] (port=44593
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nU6Et-0002qs-2X
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:25:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1381379wmb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L+KJ0RYcjtSoGfdULxYKtRbAqUcK2UaJvm1gNr71i7I=;
 b=Kk3+nKzOnuKU5yfK3JtZpuAeIqjhS0cpl49QPnKU6NUl2nHImI27lnEHnP+1EyqZ6c
 N9mOTnEC/WRcFACT6QHEBvZA6zaTZPXFfhXD8wN7bnc4/vYEcsQOzU6a1a6omPKL/taz
 WRzgeVbqW6lE2KFdzAzJIgb8LBA0Jls3iBeMd9y1NFYhkZSkYlrai0WGNsQDgbQGjryw
 pDfYahK73gDFZXoCUvoog82I3Yi5yZuZCw0wNdt6yvCMJVZyCTjSxF6iIIiBUKw38drF
 MwU2JXyCmlxmX+OFTox2VxGk3zNj44O8F95vuoQMhdkVUVnDivF3Rr8x9vwzBzF0kazC
 +r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+KJ0RYcjtSoGfdULxYKtRbAqUcK2UaJvm1gNr71i7I=;
 b=vGmx11mr3y1LV9F015pjlxTx8P4jLdIYcRtDwYzzzoNFv1+3ER4+yKcZq5E44riYXH
 QrWt1FUdRmwElqz9oy5kORNOX9L993XBYEHe4YWGb/0bHos6Xgv/s93GmLLMYQCDecnK
 FS0X5AsBo/cEMM0MYNrwip2TffeFpENGNGcIDUB7nU5pEambcB9D46nVRov3TbmpSED6
 0RW/rgPSbdx4NjDtA+VJAEIYBmEJyt3QKKLTsstBXEZ24VakzZYqvDd8Abd5Rd+FYQdr
 JNOxfCHdgaR4BSKWwXYl55PRiozFbn3q5TPONu6mioFhANRXy8FIcBWcl7EwXp25Wuss
 HmjQ==
X-Gm-Message-State: AOAM530kQRFi14Fp5igHNGIysoHDJjwbxUYa4m9JdFV1KD3TW7oqUxl8
 TZ0xuCcKR6pmTaliEJKdRBDxurJ6QS5ygbafwGUJfQ==
X-Google-Smtp-Source: ABdhPJxpWKqD8mJJDzEty7ewDtdMk7fspaakLVBMDXBFwRvLH1alVn7A1XCYYxy0WosnaT8Jlx0KlwFmVLjwpu9AeEs=
X-Received: by 2002:a05:600c:3516:b0:389:f9aa:f821 with SMTP id
 h22-20020a05600c351600b00389f9aaf821mr3159449wmq.73.1647347120584; Tue, 15
 Mar 2022 05:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
In-Reply-To: <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Mar 2022 17:55:09 +0530
Message-ID: <CAAhSdy1BG+rNUKPyJC2Ye90GiCCbBwykkiSf_ZQhFmWKnMVs=w@mail.gmail.com>
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x331.google.com
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
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>, Jiangyifei <jiangyifei@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 5:47 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
>
>
> On 15/03/2022 09:33, Anup Patel wrote:
> > On Tue, Mar 15, 2022 at 12:18 PM Alistair Francis <alistair23@gmail.com=
> wrote:
> >>
> >> On Sun, Mar 13, 2022 at 12:12 PM Ralf Ramsauer
> >> <ralf.ramsauer@oth-regensburg.de> wrote:
> >>>
> >>> Hi,
> >>>
> >>> I'm trying to run Linux/QEMU+KVM inside an emulated
> >>> qemu-system-riscv64 VM (x86 host). On latest&greatest QEMU (1416688c5=
3),
> >>> I run Linux inside QEMU. On host side:
> >>>
> >>> qemu-system-riscv64 -nographic \
> >>>           -machine virt \
> >>>           -cpu 'rv64,h=3Dtrue' \
> >>>           -smp 8 -m 8G \
> >>>           -bios $latest_opensbi \
> >>>           -kernel $latest_upstream_linux \
> >>>          [=E2=80=A6snip=E2=80=A6]
> >>>
> >>> Inside that machine, I boot Linux with KVM enabled:
> >>>
> >>> [=E2=80=A6]
> >>> [    0.228939] kvm [1]: hypervisor extension available
> >>> [    0.229000] kvm [1]: using Sv48x4 G-stage page table format
> >>> [    0.229033] kvm [1]: VMID 14 bits available
> >>> [=E2=80=A6]
> >>>
> >>> KVM seems to load correctly. Inside that machine, I compiled QEMU fro=
m
> >>> the same sources with the KVM accelerator enabled. When I try to star=
t
> >>> QEMU with KVM enabled, I get
> >>>
> >>> ./qemu-system-riscv64 -nographic \
> >>>          -monitor none \
> >>>          -machine virt \
> >>>          -smp 1 -m 1G \
> >>>          -bios ./pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
> >>>          -serial stdio \
> >>>          -enable-kvm
> >
> > The QEMU RISC-V KVM support is quite new so I haven't got a chance
> > to play with it.
>
> Btw, the kernel's KVM selftests seem to run.
>
> >
> > Nevertheless, we should not pass any firmware when using KVM
> > so can you try "-bios none" ?
>
> I have no kernel specified in the guest, so I'd then expect to boot into
> an completely empty machine (besides the tiny startup stub in the MROM).
> However, I still get the exact same error as mentioned in my initial mail=
.

When KVM is enabled and the kernel is not provided, there is simply
nothing in Guest RAM (0x80000000) or ROM (0x00000000) which means
you are booting garbage.

>
> Again, without "-enable-kvm", everything works as expected (i.e., I
> don't see any output, because there's basically no guest code to execute)=
.

Strange, but even in this case you might be running garbage.

>
> Just out of curiosity: if you don't pass a bios to the machine, what
> would then the boot sequence be?

For QEMU KVM:
1) There is no M-mode
2) Guest directly boots in S-mode
3) The SBI services are provided by in-kernel KVM module

You need to specify the Guest kernel using "-kernel" parameter when
using QEMU KVM.

Regards,
Anup

>
> Thanks
>    Ralf
>
> >
> > Regards,
> > Anup
> >
> >>>
> >>> [ 4860.559194] kvm [9942]: VCPU exit error -95
> >>> [ 4860.584262] kvm [9942]: SEPC=3D0x0 SSTATUS=3D0x200004120 HSTATUS=
=3D0x2002001c0
> >>> [ 4860.586839] kvm [9942]: SCAUSE=3D0x14 STVAL=3D0x0 HTVAL=3D0x0 HTIN=
ST=3D0x0
> >>>
> >>> on the ringbuffer, together with a register dump of qemu [1] on the
> >>> console. Needless to say, but without -enable-kvm, it works fine.
> >>>
> >>> As far as I see that, SCAUSE=3D0x14 reports a 'Instruction Guest PF',
> >>> which would be kind of correct, if the guest's PC really tries to
> >>> execute at phys 0x0. DRAM of the 'virt' machine definition should sta=
rt
> >>> at 0x80000000, where OpenSBI resides. So I wonder if an erroneous res=
et
> >>> PC might be the culprit=E2=80=A6
> >>>
> >>> Before digging deeper into that issue, I wanted to ask if Qemu/KVM
> >>> inside an emulated riscv64+H-extension is actually supported, or if t=
his
> >>> is a known bug and has some ongoing work.
> >>
> >> RISC-V KVM should work. I haven't had a chance to try it myself though=
.
> >>
> >> I have CCed two people who hopefully can help.
> >>
> >> Alistair
> >>
> >>>
> >>> Thanks
> >>>     Ralf
> >>>
> >>> [1]
> >>>
> >>>    pc       0000000000000000
> >>>    mhartid  0000000000000000
> >>>    mstatus  0000000200000000
> >>>    mip      0000000000000000
> >>>    mie      0000000000000000
> >>>    mideleg  0000000000000000
> >>>    medeleg  0000000000000000
> >>>    mtvec    0000000000000000
> >>>    stvec    0000000000000000
> >>>    mepc     0000000000000000
> >>>    sepc     0000000000000000
> >>>    mcause   0000000000000000
> >>>    scause   0000000000000000
> >>>    mtval    0000000000000000
> >>>    stval    0000000000000000
> >>>    mscratch 0000000000000000
> >>>    sscratch 0000000000000000
> >>>    satp     0000000000000000
> >>>    x0/zero  0000000000000000 x1/ra    0000000000000000 x2/sp
> >>> 0000000000000000 x3/gp    0000000000000000
> >>>    x4/tp    0000000000000000 x5/t0    0000000000000000 x6/t1
> >>> 0000000000000000 x7/t2    0000000000000000
> >>>    x8/s0    0000000000000000 x9/s1    0000000000000000 x10/a0
> >>> 0000000000000000 x11/a1   00000000bf000000
> >>>    x12/a2   0000000000000000 x13/a3   0000000000000000 x14/a4
> >>> 0000000000000000 x15/a5   0000000000000000
> >>>    x16/a6   0000000000000000 x17/a7   0000000000000000 x18/s2
> >>> 0000000000000000 x19/s3   0000000000000000
> >>>    x20/s4   0000000000000000 x21/s5   0000000000000000 x22/s6
> >>> 0000000000000000 x23/s7   0000000000000000
> >>>    x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10
> >>> 0000000000000000 x27/s11  0000000000000000
> >>>    x28/t3   0000000000000000 x29/t4   0000000000000000 x30/t5
> >>> 0000000000000000 x31/t6   0000000000000000
> >>>

