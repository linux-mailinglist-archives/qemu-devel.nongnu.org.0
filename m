Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204E31CE75
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:54:05 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3bw-00057Q-8v
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lC36D-0004jq-C2
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:21:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lC369-000373-N3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:21:16 -0500
Received: from [192.168.100.1] ([82.252.134.158]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTRdK-1lJeqj0NXI-00Tp8q; Tue, 16 Feb 2021 17:21:05 +0100
Subject: Re: [RFC PATCH] linux-user/mmap: Return EFAULT for invalid addresses
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <b71cbfb68c227ae999e8caa5e247d5bb93ddad43.camel@linuxfoundation.org>
 <4309ac79-d729-682c-b3e2-7d657869566c@vivier.eu>
 <0fb977ec30a318ace2bb1853b9cca7b8d7cfcea5.camel@linuxfoundation.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <40acb232-a9da-951c-38fd-2fa1c529edd5@vivier.eu>
Date: Tue, 16 Feb 2021 17:21:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0fb977ec30a318ace2bb1853b9cca7b8d7cfcea5.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tz8p6wChR68FjnXLzU7khFIvpTqsjSBVl1WBQYneltfk5+TyEWI
 SGPsBLNxqvHW0aj07xfOgVdwMa6dEgvrWVU8X+Fft4hC0ho/BCFn4weu2SLxAHJAfPkUzRz
 L0K2EMUqNSCgAyDTwS0oia7WT7XAT7qheUItri5G7dIQojdrs/1Td3Kv15KbunBfn0B4wEA
 tF+TRgrxS79pwrEHkxWzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M9+Vs2s+V4Q=:+6l1HNl48MZAG15WUGsHdC
 ljvQQfdSTqOWgfm9rbtXn0yuskYCpzCh95mek6SKuSYR3bdD5jdFosWj2WklcJ83cwN070jxv
 umbVfo4XFi4vkgUSkaEcywABA0kS6jOoxF/AmMUz52m/QEiUnZIemKWc311vmIc0QtBAN8LzS
 m1AHgyhNh3RDhBIXk0xWZ2fSHa4nNW3Ns/3JC8B15otyYhjJ6mlgy+8gND0e8WFpzwiAgnt35
 +W9ZBg13L+CW50A67POMxyoUiguUV9NFe7w23NIXOMft/zJfPNevTBOf77rOANMUnqv/aK80G
 sqT1YZzWnvmEvCYlXNVbE1mZrR5Do3Ikh9uee08RqVu0S6faiPiwPOHIgTZDJgqEsPd3Nxsyj
 1p3Tx+ZsBKfjYus43nmQ0vN6eH63h84A6HhfLvMA9kPJuiZxIS0lb7HcemAOL
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/02/2021 à 12:49, Richard Purdie a écrit :
> On Sat, 2021-02-13 at 18:40 +0100, Laurent Vivier wrote:
>> Le 08/01/2021 à 18:46, Richard Purdie a écrit :
>>> When using qemu-i386 to run gobject introspection parts of a webkitgtk 
>>> build using musl as libc on a 64 bit host, it sits in an infinite loop 
>>> of mremap calls of ever decreasing/increasing addresses.
>>>
>>> I suspect something in the musl memory allocation code loops indefinitely
>>> if it only sees ENOMEM and only exits when it hits EFAULT.
>>>
>>> According to the docs, trying to mremap outside the address space
>>> can/should return EFAULT and changing this allows the build to succeed.
>>>
>>> There was previous discussion of this as it used to work before qemu 2.11
>>> and we've carried hacks to work around it since, this appears to be a
>>> better fix of the real issue?
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>>>
>>> Index: qemu-5.2.0/linux-user/mmap.c
>>> ===================================================================
>>> --- qemu-5.2.0.orig/linux-user/mmap.c
>>> +++ qemu-5.2.0/linux-user/mmap.c
>>> @@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
>>>           !guest_range_valid(new_addr, new_size)) ||
>>>          ((flags & MREMAP_MAYMOVE) == 0 &&
>>>           !guest_range_valid(old_addr, new_size))) {
>>> -        errno = ENOMEM;
>>> +        errno = EFAULT;
>>>          return -1;
>>>      }
>>>  
>>>
>>>
>>>
>>
>> I agree with that, the ENOMEM is returned when there is not enough virtual memory (the
>> mmap_find_vma() case).
>>
>> According to the manpage, EFAULT is returned when old_addr and old_addr + old_size is an invalid
>> address space.
>>
>> So:
>>
>>     if (!guest_range_valid(old_addr, old_size)) {
>>         errno = EFAULT;
>>         return -1;
>>     }
>>
>> But in the case of new_size and new_addr, it seems the good value to use is EINVAL.
>>
>> So:
>>
>>    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
>>        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
>>         errno = EINVAL;
>>         return -1;
>>     }
>>
>> Did you try that?
> 
> Its taken me a short while to reproduce the test environment but I did
> so and can confirm that using EINVAL works just as well as EFAULT in
> the test case we have. The above would therefore seem to make sense to
> me and would fix the case we found.

Could you send a v2 of your patch with these changes?

Thanks,
Laurent


