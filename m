Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D44D950D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:13:13 +0100 (CET)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1Mm-0001mI-H8
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:13:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nU0zD-00067V-Ne
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:48:51 -0400
Received: from [2607:f8b0:4864:20::12c] (port=36651
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nU0zA-0000n6-Er
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:48:51 -0400
Received: by mail-il1-x12c.google.com with SMTP id x9so6095474ilc.3
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Azo+OspJCIzLOeoQrZ6w+72uR3leXLiEBVL+mQ4xrl0=;
 b=V7GaJkAHGy5MsWFVBoNMZuqk2T7DRlD7PxP0UPsGTiV/yEHl+9teN6GzMlR7kAVano
 0DFN+hO+QdOns86RdwaU0p3DAhbJ9mIpCPyyePtwE6iYByQXCXnUuqFFhSVNqQLRZxoK
 0/6ktWMc5vKl+eLD0VdYeBkzhbhE+gAUxU/+6CjEdxdd42TTvrsLtZHjjGBLBCNaKN6Z
 928aW3xp7Tpsi0/WIpwqbIm1bTDawv5PcCeVRYgCwtxBcUbmEOE7Puvxc0xH+ac2ZoS1
 RhmATbHrd9dZod5l92EK9JS2BnjV4bksJ12Ic7FClCmXl64HTD7Ek2Bx1OyY9woOPYrG
 8ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Azo+OspJCIzLOeoQrZ6w+72uR3leXLiEBVL+mQ4xrl0=;
 b=ZznBRBAfLjIxjgie6omxD1V9r0crA8023nZ3IhYbVLMjWl77DJL0Cv5NHzBTYy7qrq
 THao5PizepTM8dQalFzMr3s0mCdP0Mgx8SNuoeWc3i9nkCg1e/nmKAMVVMz/hjaGbfOK
 iCMQgpmcgmkEl6qcPC6qTeHvnZBaBJdr65+dTwSZjVoVcFqTrv9MTgqFrlXF2EocN6V3
 v2B0WZ5lv4+oj3bq0Oorlnt+Zz/DosGE3T/ZBVaArLFp5E5EGwpOzWBdhSL26OW6kzzV
 nB/oHAoL5qfUifus6Rf9j0tFtLZOJj0/SWz7rVX4jMyDlsYQstqcHEExnHmo5dn95R5P
 WNrg==
X-Gm-Message-State: AOAM533gJ+PyWVL1Opy9eUUU3Ha6B7QLbWXKlObnsIO+s6hVh1FM5JHn
 990ZxlWcgyoexPuJ6SzkaPgshYfoQHsvHcdhgz0=
X-Google-Smtp-Source: ABdhPJwIgWH0YilxWnPdsZDq+Ii4TgU089Xa+8bQELyyN8ulWupWGQNWEbjCC8+zzKaJEVz0Obn5IGnSZsYvtpca3/Y=
X-Received: by 2002:a92:d80c:0:b0:2c2:c40c:7bd4 with SMTP id
 y12-20020a92d80c000000b002c2c40c7bd4mr20653160ilm.310.1647326926781; Mon, 14
 Mar 2022 23:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
In-Reply-To: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Mar 2022 16:48:21 +1000
Message-ID: <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
Subject: Re: QEMU+KVM on RISC-V + Hypervisor Extension
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jiangyifei <jiangyifei@huawei.com>, 
 Anup Patel <anup@brainfault.org>, Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 13, 2022 at 12:12 PM Ralf Ramsauer
<ralf.ramsauer@oth-regensburg.de> wrote:
>
> Hi,
>
> I'm trying to run Linux/QEMU+KVM inside an emulated
> qemu-system-riscv64 VM (x86 host). On latest&greatest QEMU (1416688c53),
> I run Linux inside QEMU. On host side:
>
> qemu-system-riscv64 -nographic \
>          -machine virt \
>          -cpu 'rv64,h=3Dtrue' \
>          -smp 8 -m 8G \
>          -bios $latest_opensbi \
>          -kernel $latest_upstream_linux \
>         [=E2=80=A6snip=E2=80=A6]
>
> Inside that machine, I boot Linux with KVM enabled:
>
> [=E2=80=A6]
> [    0.228939] kvm [1]: hypervisor extension available
> [    0.229000] kvm [1]: using Sv48x4 G-stage page table format
> [    0.229033] kvm [1]: VMID 14 bits available
> [=E2=80=A6]
>
> KVM seems to load correctly. Inside that machine, I compiled QEMU from
> the same sources with the KVM accelerator enabled. When I try to start
> QEMU with KVM enabled, I get
>
> ./qemu-system-riscv64 -nographic \
>         -monitor none \
>         -machine virt \
>         -smp 1 -m 1G \
>         -bios ./pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
>         -serial stdio \
>         -enable-kvm
>
> [ 4860.559194] kvm [9942]: VCPU exit error -95
> [ 4860.584262] kvm [9942]: SEPC=3D0x0 SSTATUS=3D0x200004120 HSTATUS=3D0x2=
002001c0
> [ 4860.586839] kvm [9942]: SCAUSE=3D0x14 STVAL=3D0x0 HTVAL=3D0x0 HTINST=
=3D0x0
>
> on the ringbuffer, together with a register dump of qemu [1] on the
> console. Needless to say, but without -enable-kvm, it works fine.
>
> As far as I see that, SCAUSE=3D0x14 reports a 'Instruction Guest PF',
> which would be kind of correct, if the guest's PC really tries to
> execute at phys 0x0. DRAM of the 'virt' machine definition should start
> at 0x80000000, where OpenSBI resides. So I wonder if an erroneous reset
> PC might be the culprit=E2=80=A6
>
> Before digging deeper into that issue, I wanted to ask if Qemu/KVM
> inside an emulated riscv64+H-extension is actually supported, or if this
> is a known bug and has some ongoing work.

RISC-V KVM should work. I haven't had a chance to try it myself though.

I have CCed two people who hopefully can help.

Alistair

>
> Thanks
>    Ralf
>
> [1]
>
>   pc       0000000000000000
>   mhartid  0000000000000000
>   mstatus  0000000200000000
>   mip      0000000000000000
>   mie      0000000000000000
>   mideleg  0000000000000000
>   medeleg  0000000000000000
>   mtvec    0000000000000000
>   stvec    0000000000000000
>   mepc     0000000000000000
>   sepc     0000000000000000
>   mcause   0000000000000000
>   scause   0000000000000000
>   mtval    0000000000000000
>   stval    0000000000000000
>   mscratch 0000000000000000
>   sscratch 0000000000000000
>   satp     0000000000000000
>   x0/zero  0000000000000000 x1/ra    0000000000000000 x2/sp
> 0000000000000000 x3/gp    0000000000000000
>   x4/tp    0000000000000000 x5/t0    0000000000000000 x6/t1
> 0000000000000000 x7/t2    0000000000000000
>   x8/s0    0000000000000000 x9/s1    0000000000000000 x10/a0
> 0000000000000000 x11/a1   00000000bf000000
>   x12/a2   0000000000000000 x13/a3   0000000000000000 x14/a4
> 0000000000000000 x15/a5   0000000000000000
>   x16/a6   0000000000000000 x17/a7   0000000000000000 x18/s2
> 0000000000000000 x19/s3   0000000000000000
>   x20/s4   0000000000000000 x21/s5   0000000000000000 x22/s6
> 0000000000000000 x23/s7   0000000000000000
>   x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10
> 0000000000000000 x27/s11  0000000000000000
>   x28/t3   0000000000000000 x29/t4   0000000000000000 x30/t5
> 0000000000000000 x31/t6   0000000000000000
>

