Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86942681F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 12:44:09 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYnMF-0001UE-Lg
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 06:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYnHM-0000Ha-3e
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:39:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYnH6-0006Mh-EO
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 06:39:03 -0400
Received: from [192.168.15.195] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 4A5EF21C38;
 Fri,  8 Oct 2021 10:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633689523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7ITtSaOABSeha5K6gkLBGf3rzaHjdnTxEo1tX0srFY=;
 b=Io2Gqyo8dohGjWIEj81+4C8tOGEsoI1QnfVEIaPPD/jOkWWVzhdM6JHjqfZS3gf+WRSBgO
 38E4oMgisDn2sr3Dup0QJF0uWAKMSJkATpdPP2kVI/EXQg254Dn7YyaHS2MLElub0k3q7c
 mTztVKEz4eB3j2h3TTqXhHGYZYm5KCk=
Message-ID: <97f817b9-9455-9899-ff20-530baa77190d@greensocs.com>
Date: Fri, 8 Oct 2021 12:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
 <6b919273-ab23-6822-fdeb-66e18009f70a@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <6b919273-ab23-6822-fdeb-66e18009f70a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/7/21 09:59, Philippe Mathieu-Daudé wrote:
> On 10/7/21 08:41, Alistair Francis wrote:
>> On Wed, Oct 6, 2021 at 10:04 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>>> Right now, we cannot load some binary file if it is bigger than the
>>>>> machine's ram size. This limitation only occurs when loading a
>>>>> binary file: we can load a corresponding elf file without this
>>>>> limitation.
>>>>>
>>>>> This is an issue for machines that have small ram or do not use the
>>>>> ram_size feature at all.
>>>>>
>>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>>> to access `current_machine`.
>>>>>
>>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>>> ---
>>>>>
>>>>> Hi Alistair,
>>>>>
>>>>> I found this while experimenting with a ram_size=0 machine.
>>>
>>>
>>>
>>>>
>>>> Where are you loading your file?
>>>>
>>>
>>> In a rom.
>>>
>>> The loader does not check at all that we are loading to the machine's
>>> ram. It just check the size for the raw binary file format.
>>
>> Hmmm... This is probably correct, in that a user might want to load a
>> binary into ROM and doesn't want to be blocked by the ram size.
>>
>> In general though a user would expect an error if they are loading a
>> file into RAM that is larger then the RAM. So I'm not fully convinced
>> we want this change.
> 
> I agree with Damien using current_machine->ram_size is not ideal,
> for example some machines have the RAM split and mapped at different
> regions, so even if ram_size is enough for the image to load,
> a region might not be big enough and I'd expect load_image_targphys_as()
> to fail.
> 
> Maybe we can call memory_region_find(s->addr) then on match:
> 
>   if (memory_region_is_ram*(match)) {
>     size = memory_region_size(match);
>   } else {
>     size = -1;
>   }
> 

So I worked a bit on this.

We could call memory_region_find(get_system_memory(), addr, ...) like 
Philippe proposed.
and check that the memory is big enough and has the proper "type" (ram, 
rom, ...)

Note that we will check only the current state of the address space. So 
it means the region must already exists (sounds reasonable to me).

If this sounds like a good direction to you, I'll propose an updated 
version of the patch.

regarding relying on load_image_targphys to check this. I don't know...
all these functions (load_targphys_...() and rom_add_...()) just put 
rom(s) in a list. The list is checked afterward against overlap and 
loaded at reset.
It is possible but it changes the behavior of all rom_add_...() functions.

We could also check, during the reset, that the rom loading works. But 
maybe some part of qemu expects that we silently skip some missing bits.
Maybe a log/warning there ?

Thanks,
Damien

