Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B122B4250DE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:18:31 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQTu-00086H-Lg
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYQOD-0004ww-7S
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:37 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mYQO8-0006eG-79
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:12:36 -0400
Received: from [192.168.15.163] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 75EBC21C38;
 Thu,  7 Oct 2021 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1633601546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GMsSi9mlV2bVCWNNQ+M3wjnMhRCluSzpKHhb8Q8isoU=;
 b=fnAv2yfuZX1rbtfBBXAurcn87B4QPdXZKx0o3CS2pn//UpDkisuMElCL/rziCR5jsiwR6V
 Xya1qhqjIq/CTf8X9NdiuANYx7suXgkRQ+mDaBc/WFH66VjedzEB9ES2+ItoiZ0E8IEaMm
 YOt0jVzw43n6zGscAGuYBJ88mYoFE+I=
Message-ID: <d37459ab-227d-1879-dc2e-82b4c321f464@greensocs.com>
Date: Thu, 7 Oct 2021 12:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] generic-loader: remove the ram_size limit when a loading
 binary file
Content-Language: en-US-large
To: Alistair Francis <alistair23@gmail.com>
References: <20211006113707.96907-1-damien.hedde@greensocs.com>
 <03e1e2d6-d974-272b-9d25-805914ec0026@redhat.com>
 <4fd0ab8a-7edb-a855-09ce-312ab2057325@greensocs.com>
 <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CAKmqyKPF+91=qpqmd-5OwLvDCTE_8vb083RA_k-NGi+7Bwa51Q@mail.gmail.com>
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/7/21 08:41, Alistair Francis wrote:
> On Wed, Oct 6, 2021 at 10:04 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 10/6/21 13:49, Philippe Mathieu-Daudé wrote:
>>> On 10/6/21 13:37, Damien Hedde wrote:
>>>> Right now, we cannot load some binary file if it is bigger than the
>>>> machine's ram size. This limitation only occurs when loading a
>>>> binary file: we can load a corresponding elf file without this
>>>> limitation.
>>>>
>>>> This is an issue for machines that have small ram or do not use the
>>>> ram_size feature at all.
>>>>
>>>> Also get rid of "hw/boards.h" include, since we needed it only
>>>> to access `current_machine`.
>>>>
>>>> Fixes: e481a1f63c9 ("generic-loader: Add a generic loader")
>>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>>> ---
>>>>
>>>> Hi Alistair,
>>>>
>>>> I found this while experimenting with a ram_size=0 machine.
>>
>>
>>
>>>
>>> Where are you loading your file?
>>>
>>
>> In a rom.
>>
>> The loader does not check at all that we are loading to the machine's
>> ram. It just check the size for the raw binary file format.
> 
> Hmmm... This is probably correct, in that a user might want to load a
> binary into ROM and doesn't want to be blocked by the ram size.
> 
> In general though a user would expect an error if they are loading a
> file into RAM that is larger then the RAM. So I'm not fully convinced
> we want this change.

I do agree for the error, but right now if you give a wrong base 
address, it does not fail (see below).

I can give a look to see if such check would be possible.

> 
> What error do you get if you try to load a binary that is too large
> with this patch applied?

Nothing if you pass the ram_size check. You can even try to load 
something to an unmapped area, it doesn't report an error.

But it does not do anything visible to the guest I suppose (in the 
monitor, x/'xp' commands still tell you it cannot access the memory if 
you tried to load it somewhere that does not exist).

If you try to load something bigger than the target region, the region 
seems to be initialized.

Thanks,
Damien

> 
> Alistair
> 
>>
>> --
>> Damien
>>
>>
>>

