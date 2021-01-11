Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6F2F1012
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 11:29:46 +0100 (CET)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyuSH-0005yz-VM
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 05:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuRM-0005YI-GS
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:28:49 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:60367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyuRI-0002pP-Tp
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 05:28:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F423F7470E7;
 Mon, 11 Jan 2021 11:28:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B8EC17470E3; Mon, 11 Jan 2021 11:28:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B6FA27470DD;
 Mon, 11 Jan 2021 11:28:40 +0100 (CET)
Date: Mon, 11 Jan 2021 11:28:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
In-Reply-To: <f5466f0b-cc4f-4a71-8c06-7971198a7602@www.fastmail.com>
Message-ID: <2e29d39-8622-3232-d6cd-80d77beb98@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
 <f5466f0b-cc4f-4a71-8c06-7971198a7602@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2085507900-1610360920=:96624"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2085507900-1610360920=:96624
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 11 Jan 2021, Jiaxun Yang wrote:
> On Mon, Jan 11, 2021, at 3:25 AM, BALATON Zoltan wrote:
>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>> +PCI experts
>>>
>>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>
> [...]
>
>>> I'm not a PCI expert but my understanding is PCI device functions are
>>> restricted to the PCI bus address space. The host bridge may map this
>>> space within the host.
>>>
>>> QEMU might be using get_system_memory() because for some host bridge
>>> the mapping is not implemented so it was easier this way?
>>
>> Maybe, also one less indirection which if not really needed is a good
>> thing for performance so unless it's found to be needed to use another
>> address space here I'm happy with this as it matches what other similar
>> devices do and it seems to work. Maybe a separate address space is only
>> really needed if we have an iommu?
>
> Hi Zoltan,
>
> It is possible for bonito to remap PCI address space so maybe it's essential for bonito.

I'm still not sure it's needed or how that would work. Maybe while it's 
possible to remap these, all guests just map these one-to-one (otherwise 
they may need to do some address translation which is much better avoided) 
so in practice we don't need to emulate this. If we use a different memory 
region maybe we also need some additional iommu code somewhere to connect 
the two but I'm not sure, I haven't tried since most other isa bridges do 
the same way using system_memory and this seems to work. I'm also a bit 
concerned about additional overhead which we could avoid if possible. Just 
to model something that's not really used I don't think it's worth the 
additional complexity and possible performance loss unless it's found to 
be needed to get some guests work.

> Appreciate for your work. I'm going to help with reviewing as well.

Thanks, I hope to get these in now before the freeze so testing and 
reviewing is really appreciated.

Regards,
BALATON Zoltan
--3866299591-2085507900-1610360920=:96624--

