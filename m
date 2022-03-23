Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BCB4E5724
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:06:41 +0100 (CET)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4RU-00008E-52
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:06:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX4QG-0007ls-CW
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:05:24 -0400
Received: from [2001:638:a01:1096::11] (port=42738 helo=mta01.hs-regensburg.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralf.ramsauer@oth-regensburg.de>)
 id 1nX4QD-0007w3-LJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:05:23 -0400
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de
 [IPv6:2001:638:a01:8013::93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "E16S03", Issuer "E16S03" (not verified))
 by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4KNvqV4yqnzy2b;
 Wed, 23 Mar 2022 18:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oth-regensburg.de;
 s=mta01-20211122; t=1648055110;
 bh=FOtCIgl93LzvuUQBmOsjosrFQyXaaBTgWafWZDYjh80=;
 h=Date:Subject:To:CC:References:From:In-Reply-To:From;
 b=FIeRmu4R61Rn+7j2l+H72RCKs1uElzO1StjDwZcIFrxV6GNuXQNaQIFbKUUP5G2fW
 7jm/gB7ClvkLd2Tk6eJXD7KVp/pc9Sw5oGLGI5DeHgd8cdtuNqFIAqs3kUhHEbZvHi
 MP68pAJJQsIbtH6vNYLK6+Kkdv3ORX64V2nEaNZvRYQKxVSA86Xg+eiip77I6Knf2M
 UF/WhoLNQDYExpD+F7wm+i0kPrXaPtAFAu74zKuGxyWqoIyfiV1RE3flnFISFh9kVN
 v9MSbBYCH0ngB40j6WfHilydJMOtMrxC1WLU3CqzrjHFXsdtMwsUaTwP1FqKDyrW3y
 C8prJPggj/vdg==
Received: from [IPV6:2001:638:a01:8068:7fd:af2f:5cb8:5796]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 23 Mar
 2022 18:05:10 +0100
Message-ID: <ce845d03-1215-9481-6a6f-097abb75a5f0@oth-regensburg.de>
Date: Wed, 23 Mar 2022 18:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [EXT] Re: QEMU+KVM on RISC-V + Hypervisor Extension
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, <alistair23@gmail.com>
References: <mhng-274dfa51-81cb-47bc-b31c-1a2dd8efa543@palmer-ri-x1c9>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <mhng-274dfa51-81cb-47bc-b31c-1a2dd8efa543@palmer-ri-x1c9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
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
Cc: apatel@ventanamicro.com, Peter Maydell <peter.maydell@linaro.org>,
 anup@brainfault.org, qemu-devel@nongnu.org, jiangyifei@huawei.com,
 stefan.huber@oth-regensburg.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/03/2022 21:47, Palmer Dabbelt wrote:
> On Sun, 20 Mar 2022 22:43:07 PDT (-0700), alistair23@gmail.com wrote:
>> On Thu, Mar 17, 2022 at 7:46 PM Peter Maydell 
>> <peter.maydell@linaro.org> wrote:
>>>
>>> On Wed, 16 Mar 2022 at 22:23, Alistair Francis <alistair23@gmail.com> 
>>> wrote:
>>> > Hmm... This seems like a bug. We shouldn't allow the user to specify a
>>> > `-bios` option if using KVM. Would you mind preparing a patch to catch
>>> > this?
>>>
>>> You don't want to allow the possibility of a bios blob that expects
>>> to run in S-mode, the way arm virt can run an EL1 UEFI BIOS ?
>>
>> Interesting. We could still allow that by using -device loader though.
>>
>> If we load something in S mode it really is a kernel and not firmware,
>> so I think the -bios argument is a little misleading. We could make
>> -bios and -enable-kvm a warning instead, to discourage users from
>> providing OpenSBI, but still allow them to pass something.
> 
> We could handle this in OpenSBI: have it just detect that it's been 
> launched in S-mode and just jump to the payload.
> 
>> To me not allowing it seems reasonable, and we can always re-allow it
>> in the future if there is a good use case.
> 
> That also seems fine to me.  There'd be a lot of work involved in doing 
> anything useful with S-mode firmware, given that things aren't really 
> designed to work that way.  Certainly a lot more work than re-enabling 
> this sort of flag, and while it might be a bit of a headache coupling 
> that to a QEMU source-level change my guess is that there'd need to be a 
> bunch of work done on new HW interfaces to make this useful so there'd 
> be QEMU changes to emulate those either way.
> 
> Having at least a warning seems prudent, as most users are going to end 
> up with a hang here and a silent hang is a headache for everyone.

Okay, my analysis was wrong, -bios is in fact already ignored when being 
used in combination with -enable-kvm on the virt machine model. See:

https://git.qemu.org/?p=qemu.git;a=blob;f=hw/riscv/virt.c;h=da50cbed43ec54777992d40dbf158ec63fccef03;hb=HEAD#l1314

However, the bios will be silently ignored and dropped, which led me to 
the mistake. I'll provide a patch that gives a warning to the user.

   Ralf

> 
>> Alistair
>>
>>>
>>> thanks
>>> -- PMM

