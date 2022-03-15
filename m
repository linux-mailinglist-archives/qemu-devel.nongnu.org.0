Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2034D9B36
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:28:49 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6IC-0004oT-Uv
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:28:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU67k-0003nW-4V
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:18:03 -0400
Received: from mta01.hs-regensburg.de ([194.95.104.11]:54936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nU67h-0001VJ-73
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:17:59 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KHsqY4CMLzxwx;
 Tue, 15 Mar 2022 13:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1647346665;
 bh=YWC49eknsf2PPvGpaET3JJqjaQHdb4kDxPC2UEonxU8=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=YGVSoPI8Fhi8T7HUcMf5U4FD2NQkXYhxK7NtPxn46uZQ5jOKAWyimLSes7UW4P2eK
 VMuxgBS1CbjuNV+w/k0J+z0XDZh6kZg8E3nYaCFYzDSMYDdKdKowx88JfaQujYZJO3
 k0YYlZd5PP8GvhDhKztlYJb6jJ+EmIxNnqb84WhDWqQ/jWFI6QYDFii2rzxBeJwFxk
 elJCpxF0LtR0xuqixDpElxt6BC9drl56c0BadWm7dWeVk08K83hAOaURlu7MIvukEY
 vUhjZ75s5+B4UuAAl4CmcNh021dBDkfgrPy+hEKj/c1BqATmtQqC2FI8wc/emfr/Zd
 mutlXpwCSxnXA==
Received: from [IPV6:2a02:810d:8fc0:44bc::2592] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 15 Mar 2022 13:17:45 +0100
Message-ID: <a840f9ac-7315-4381-4c85-719efb413b18@oth-regensburg.de>
Date: Tue, 15 Mar 2022 13:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
Content-Language: en-US
To: Anup Patel <anup@brainfault.org>, Alistair Francis <alistair23@gmail.com>
References: <57412635-6b46-823b-14a4-0ee694ace5b8@oth-regensburg.de>
 <CAKmqyKOZN=hS73TfgHfMtxktZ9kkw4kBBA4-gjGAV8Q0Kw+KHw@mail.gmail.com>
 <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAAhSdy23Ag=ZqUj82aZ6BNA2SJq54rbCDjeX=1cHtbq7LR8jaQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
Received-SPF: pass client-ip=194.95.104.11;
 envelope-from=ralf.ramsauer@oth-regensburg.de; helo=mta01.hs-regensburg.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jiangyifei <jiangyifei@huawei.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Huber <stefan.huber@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 15/03/2022 09:33, Anup Patel wrote:
> On Tue, Mar 15, 2022 at 12:18 PM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Sun, Mar 13, 2022 at 12:12 PM Ralf Ramsauer
>> <ralf.ramsauer@oth-regensburg.de> wrote:
>>>
>>> Hi,
>>>
>>> I'm trying to run Linux/QEMU+KVM inside an emulated
>>> qemu-system-riscv64 VM (x86 host). On latest&greatest QEMU (1416688c53),
>>> I run Linux inside QEMU. On host side:
>>>
>>> qemu-system-riscv64 -nographic \
>>>           -machine virt \
>>>           -cpu 'rv64,h=true' \
>>>           -smp 8 -m 8G \
>>>           -bios $latest_opensbi \
>>>           -kernel $latest_upstream_linux \
>>>          […snip…]
>>>
>>> Inside that machine, I boot Linux with KVM enabled:
>>>
>>> […]
>>> [    0.228939] kvm [1]: hypervisor extension available
>>> [    0.229000] kvm [1]: using Sv48x4 G-stage page table format
>>> [    0.229033] kvm [1]: VMID 14 bits available
>>> […]
>>>
>>> KVM seems to load correctly. Inside that machine, I compiled QEMU from
>>> the same sources with the KVM accelerator enabled. When I try to start
>>> QEMU with KVM enabled, I get
>>>
>>> ./qemu-system-riscv64 -nographic \
>>>          -monitor none \
>>>          -machine virt \
>>>          -smp 1 -m 1G \
>>>          -bios ./pc-bios/opensbi-riscv64-generic-fw_dynamic.bin \
>>>          -serial stdio \
>>>          -enable-kvm
> 
> The QEMU RISC-V KVM support is quite new so I haven't got a chance
> to play with it.

Btw, the kernel's KVM selftests seem to run.

> 
> Nevertheless, we should not pass any firmware when using KVM
> so can you try "-bios none" ?

I have no kernel specified in the guest, so I'd then expect to boot into 
an completely empty machine (besides the tiny startup stub in the MROM). 
However, I still get the exact same error as mentioned in my initial mail.

Again, without "-enable-kvm", everything works as expected (i.e., I 
don't see any output, because there's basically no guest code to execute).

Just out of curiosity: if you don't pass a bios to the machine, what 
would then the boot sequence be?

Thanks
   Ralf

> 
> Regards,
> Anup
> 
>>>
>>> [ 4860.559194] kvm [9942]: VCPU exit error -95
>>> [ 4860.584262] kvm [9942]: SEPC=0x0 SSTATUS=0x200004120 HSTATUS=0x2002001c0
>>> [ 4860.586839] kvm [9942]: SCAUSE=0x14 STVAL=0x0 HTVAL=0x0 HTINST=0x0
>>>
>>> on the ringbuffer, together with a register dump of qemu [1] on the
>>> console. Needless to say, but without -enable-kvm, it works fine.
>>>
>>> As far as I see that, SCAUSE=0x14 reports a 'Instruction Guest PF',
>>> which would be kind of correct, if the guest's PC really tries to
>>> execute at phys 0x0. DRAM of the 'virt' machine definition should start
>>> at 0x80000000, where OpenSBI resides. So I wonder if an erroneous reset
>>> PC might be the culprit…
>>>
>>> Before digging deeper into that issue, I wanted to ask if Qemu/KVM
>>> inside an emulated riscv64+H-extension is actually supported, or if this
>>> is a known bug and has some ongoing work.
>>
>> RISC-V KVM should work. I haven't had a chance to try it myself though.
>>
>> I have CCed two people who hopefully can help.
>>
>> Alistair
>>
>>>
>>> Thanks
>>>     Ralf
>>>
>>> [1]
>>>
>>>    pc       0000000000000000
>>>    mhartid  0000000000000000
>>>    mstatus  0000000200000000
>>>    mip      0000000000000000
>>>    mie      0000000000000000
>>>    mideleg  0000000000000000
>>>    medeleg  0000000000000000
>>>    mtvec    0000000000000000
>>>    stvec    0000000000000000
>>>    mepc     0000000000000000
>>>    sepc     0000000000000000
>>>    mcause   0000000000000000
>>>    scause   0000000000000000
>>>    mtval    0000000000000000
>>>    stval    0000000000000000
>>>    mscratch 0000000000000000
>>>    sscratch 0000000000000000
>>>    satp     0000000000000000
>>>    x0/zero  0000000000000000 x1/ra    0000000000000000 x2/sp
>>> 0000000000000000 x3/gp    0000000000000000
>>>    x4/tp    0000000000000000 x5/t0    0000000000000000 x6/t1
>>> 0000000000000000 x7/t2    0000000000000000
>>>    x8/s0    0000000000000000 x9/s1    0000000000000000 x10/a0
>>> 0000000000000000 x11/a1   00000000bf000000
>>>    x12/a2   0000000000000000 x13/a3   0000000000000000 x14/a4
>>> 0000000000000000 x15/a5   0000000000000000
>>>    x16/a6   0000000000000000 x17/a7   0000000000000000 x18/s2
>>> 0000000000000000 x19/s3   0000000000000000
>>>    x20/s4   0000000000000000 x21/s5   0000000000000000 x22/s6
>>> 0000000000000000 x23/s7   0000000000000000
>>>    x24/s8   0000000000000000 x25/s9   0000000000000000 x26/s10
>>> 0000000000000000 x27/s11  0000000000000000
>>>    x28/t3   0000000000000000 x29/t4   0000000000000000 x30/t5
>>> 0000000000000000 x31/t6   0000000000000000
>>>

