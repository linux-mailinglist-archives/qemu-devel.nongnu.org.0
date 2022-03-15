Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E34D9B8C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:48:26 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6bB-0004zF-5a
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:48:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU6Xe-0002sS-Er
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:44:46 -0400
Received: from [2001:638:a01:1096::11] (port=35880 helo=mta01.hs-regensburg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU6XN-0005fd-Pm
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:44:45 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KHtQC0CXxzy0c;
 Tue, 15 Mar 2022 13:44:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1647348259;
 bh=FVojw5NfZ5RLitYu1T7H97w6+xK3qzpxhrliveYvfmU=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=O9LQahernne8bJ/aH+iVTbnDwBMkqmoK5Q60hUC5PP+QeQPl8dCAOU4VSYYsoF5BA
 KQTWAoQAm+TZrEZWC0yX53SEM6Zwv7BuwG6jUTxIoa0TfJcPDWVfSuD90jPltaXjGk
 ux4k3oa9ZyP8et3p0mxyzLvwiUB2avqXrGho9LIy11oZeOA88BUqRey1zHONkd8ZmH
 T6kYgbZKAxRI2rd44zT402XlUiV42uKLx0WlKY8lnj25sXdIwUKTDgIlMxYH08gL8L
 nF4N+nRg48vqJ7hD/p/4UPJJsiNvT2dnNbql8LJx9h/sOCdJRLrpZ97yURwlqc6Kpd
 GJ0f1xFUifNOQ==
Received: from [IPV6:2a02:810d:8fc0:44bc::2592] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 15 Mar 2022 13:44:18 +0100
Message-ID: <bcaddca8-7795-cf27-aad7-b2284d33b54d@oth-regensburg.de>
Date: Tue, 15 Mar 2022 13:44:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
 <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
 <CAAhSdy1BG+rNUKPyJC2Ye90GiCCbBwykkiSf_ZQhFmWKnMVs=w@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAAhSdy1BG+rNUKPyJC2Ye90GiCCbBwykkiSf_ZQhFmWKnMVs=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:638:a01:1096::11
 (failed)
Received-SPF: pass client-ip=2001:638:a01:1096::11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



On 15/03/2022 13:25, Anup Patel wrote:
> On Tue, Mar 15, 2022 at 5:47 PM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
>>
>>
>>
>> On 15/03/2022 09:33, Anup Patel wrote:
>>> On Tue, Mar 15, 2022 at 12:18 PM Alistair Francis <alistair23@gmail.com> wrote:
>>>>
>>>> On Sun, Mar 13, 2022 at 12:12 PM Ralf Ramsauer
>>>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I'm trying to run Linux/QEMU+KVM inside an emulated
>>>>> qemu-system-riscv64 VM (x86 host). On latest&greatest QEMU (1416688c53),
>>>>> I run Linux inside QEMU. On host side:
>>>>>
>>>>> qemu-system-riscv64 -nographic \
>>>>>            -machine virt \
>>>>>            -cpu 'rv64,h=true' \
>>>>>            -smp 8 -m 8G \
>>>>>            -bios $latest_opensbi \
>>>>>            -kernel $latest_upstream_linux \
>>>>>           […snip…]
>>>>>
>>>>> Inside that machine, I boot Linux with KVM enabled:
>>>>>
>>>>> […]
>>>>> [    0.228939] kvm [1]: hypervisor extension available
>>>>> [    0.229000] kvm [1]: using Sv48x4 G-stage page table format
>>>>> [    0.229033] kvm [1]: VMID 14 bits available
>>>>> […]
>>>>>
>>>>> KVM seems to load correctly. Inside that machine, I compiled QEMU from
>>>>> the same sources with the KVM accelerator enabled. When I try to start
>>>>> QEMU with KVM enabled, I get
>>>>>
>>>>> ./qemu-system-riscv64 -nographic \
>>>>>           -monitor none \
>>>>>           -machine virt \
>>>>>           -smp 1 -m 1G \
>>>>>           -bios ./pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
>>>>>           -serial stdio \
>>>>>           -enable-kvm
>>>
>>> The QEMU RISC-V KVM support is quite new so I haven't got a chance
>>> to play with it.
>>
>> Btw, the kernel's KVM selftests seem to run.
>>
>>>
>>> Nevertheless, we should not pass any firmware when using KVM
>>> so can you try "-bios none" ?
>>
>> I have no kernel specified in the guest, so I'd then expect to boot into
>> an completely empty machine (besides the tiny startup stub in the MROM).
>> However, I still get the exact same error as mentioned in my initial mail.
> 
> When KVM is enabled and the kernel is not provided, there is simply
> nothing in Guest RAM (0x80000000) or ROM (0x00000000) which means
> you are booting garbage.

In all machine models ROM is at 0x1000, afaict. This is also the 
DEFAULT_RESETVEC of Qemu/RiscV. At least those few instructions should 
execute.

Cf.
https://github.com/qemu/qemu/blob/master/hw/riscv/boot.c#L285
and
https://github.com/qemu/qemu/blob/master/hw/riscv/virt.c#L1371

> 
>>
>> Again, without "-enable-kvm", everything works as expected (i.e., I
>> don't see any output, because there's basically no guest code to execute).
> 
> Strange, but even in this case you might be running garbage.

Yeah, and in case of !kvm, booting garbage results in no output. With 
kvm enabled, it faults.

> 
>>
>> Just out of curiosity: if you don't pass a bios to the machine, what
>> would then the boot sequence be?
> 
> For QEMU KVM:
> 1) There is no M-mode
> 2) Guest directly boots in S-mode
> 3) The SBI services are provided by in-kernel KVM module

Aaah! I understand. Thanks for the clarification.

> 
> You need to specify the Guest kernel using "-kernel" parameter when
> using QEMU KVM.

Yikes, that one works!

qemu-system-riscv64 -monitor none \
	-machine virt -smp 1 -m 1G \
	-bios none -nographic -serial stdio \
	-enable-kvm -kernel ./Image

[    0.000000] Linux version 5.17.0-rc7-00235-gaad611a868d1 
(ralf@redstone02) (riscv64-linux-gnu-gcc (Ubuntu 10.3.0-8ubuntu1) 
10.3.0, GNU ld (GNU Binutils for Ubuntu) 2.37) #10 SMP Sun Mar 13 
01:11:32 CET 2022
[    0.000000] Machine model: riscv-virtio,qemu
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000080000000-0x00000000bfffffff]
[    0.000000] SBI specification v0.2 detected
[    0.000000] SBI implementation ID=0x3 Version=0x51100
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] SBI HSM extension detected
[…]


I thought it'd be better to get OpenSBI running before even trying to 
pass a kernel. I didn't know that SBI services are emulated/moderated(?) 
by KVM, and that there must be no bios specified when using KVM. Will 
have a closer look at the code.

Anup, thank you!

   Ralf

> 
> Regards,
> Anup
> 
>>
>> Thanks
>>     Ralf
>>
>>>
>>> Regards,
>>> Anup
>>>
>>>>>
>>>>> [ 4860.559194] kvm [9942]: VCPU exit error -95
>>>>> [ 4860.584262] kvm [9942]: SEPC=0x0 SSTATUS=0x200004120 HSTATUS=0x2002001c0
>>>>> [ 4860.586839] kvm [9942]: SCAUSE=0x14 STVAL=0x0 HTVAL=0x0 HTINST=0x0
>>>>>
>>>>> on the ringbuffer, together with a register dump of qemu [1] on the
>>>>> console. Needless to say, but without -enable-kvm, it works fine.
>>>>>
>>>>> As far as I see that, SCAUSE=0x14 reports a 'Instruction Guest PF',
>>>>> which would be kind of correct, if the guest's PC really tries to
>>>>> execute at phys 0x0. DRAM of the 'virt' machine definition should start
>>>>> at 0x80000000, where OpenSBI resides. So I wonder if an erroneous reset
>>>>> PC might be the culprit…
>>>>>
>>>>> Before digging deeper into that issue, I wanted to ask if Qemu/KVM
>>>>> inside an emulated riscv64+H-extension is actually supported, or if this
>>>>> is a known bug and has some ongoing work.
>>>>
>>>> RISC-V KVM should work. I haven't had a chance to try it myself though.
>>>>
>>>> I have CCed two people who hopefully can help.
>>>>
>>>> Alistair
>>>>
>>>>>
>>>>> Thanks
>>>>>      Ralf
>>>>>
>>>>> [1]
>>>>>
>>>>>     pc       0000000000000000
>>>>>     mhartid  0000000000000000
>>>>>     mstatus  0000000200000000
>>>>>     mip      0000000000000000
>>>>>     mie      0000000000000000
>>>>>     mideleg  0000000000000000
>>>>>     medeleg  0000000000000000
>>>>>     mtvec    0000000000000000
>>>>>     stvec    0000000000000000
>>>>>     mepc     0000000000000000
>>>>>     sepc     0000000000000000
>>>>>     mcause   0000000000000000
>>>>>     scause   0000000000000000
>>>>>     mtval    0000000000000000
>>>>>     stval    0000000000000000
>>>>>     mscratch 0000000000000000
>>>>>     sscratch 0000000000000000
>>>>>     satp     0000000000000000
>>>>>     x0/zero  0000000000000000 x1/ra    0000000000000000 x2/sp
>>>>> 0000000000000000 x3/gp    0000000000000000
>>>>>     x4/tp    0000000000000000 x5/t0    0000000000000000 x6/t1
>>>>> 0000000000000000 x7/t2    0000000000000000
>>>>>     x8/s0    0000000000000000 x9/s1    0000000000000000 x10/a0
>>>>> 0000000000000000 x11/a1   00000000bf000000
>>>>>     x12/a2   0000000000000000 x13/a3   0000000000000000 x14/a4
>>>>> 0000000000000000 x15/a5   0000000000000000
>>>>>     x16/a6   0000000000000000 x17/a7   0000000000000000 x18/s2
>>>>> 0000000000000000 x19/s3   0000000000000000
>>>>>     x20/s4   0000000000000000 x21/s5   0000000000000000 x22/s6
>>>>> 0000000000000000 x23/s7   0000000000000000
>>>>>     x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10
>>>>> 0000000000000000 x27/s11  0000000000000000
>>>>>     x28/t3   0000000000000000 x29/t4   0000000000000000 x30/t5
>>>>> 0000000000000000 x31/t6   0000000000000000
>>>>>

