Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78941EED3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:43:44 +0200 (CEST)
Received: from localhost ([::1]:36074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIpC-0000rQ-Mm
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWInW-0008Ly-0o; Fri, 01 Oct 2021 09:41:58 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWInS-0003cB-AR; Fri, 01 Oct 2021 09:41:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 23ECA748F4E;
 Fri,  1 Oct 2021 15:41:48 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EAA41746399; Fri,  1 Oct 2021 15:41:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E8913746398;
 Fri,  1 Oct 2021 15:41:47 +0200 (CEST)
Date: Fri, 1 Oct 2021 15:41:47 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and
 the 405 CPU models
In-Reply-To: <CAFEAcA-QTiMhaGa+TVmfbGSC=FT0cqKyshvEunstZ1hy2FZfaw@mail.gmail.com>
Message-ID: <7cf2296e-52cb-7089-7bd1-be3d4cfa7061@eik.bme.hu>
References: <20211001121943.1016447-1-thuth@redhat.com>
 <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
 <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
 <CAFEAcA-QTiMhaGa+TVmfbGSC=FT0cqKyshvEunstZ1hy2FZfaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021, Peter Maydell wrote:
> On Fri, 1 Oct 2021 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>> On 01/10/2021 14.46, Peter Maydell wrote:
>>> On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> These machines need a firmware image called 'ppc405_rom.bin', and nobody
>>>> seems to have such a firmware image left for testing, so the machines are
>>>> currently unusable. There used to be support in U-Boot, but it has been
>>>> removed a couple of year ago already.
>>>> Thus let's mark these boards and the 405 CPU as deprecated now, so that we
>>>> could remove them in a couple of releases (unless somebody speaks up and
>>>> says that these are still usefull for them).
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   docs/about/deprecated.rst | 15 +++++++++++++++
>>>>   hw/ppc/ppc405_boards.c    |  2 ++
>>>>   2 files changed, 17 insertions(+)
>>>>
>>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>>> index 2f7db9a98d..27c03ef624 100644
>>>> --- a/docs/about/deprecated.rst
>>>> +++ b/docs/about/deprecated.rst
>>>> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>>>>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>>>>   this CPU is also deprecated.
>>>>
>>>> +PPC 405 CPU models (since 6.2)
>>>> +''''''''''''''''''''''''''''''
>>>> +
>>>> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
>>>> +
>>>
>>> What is this "too" a reference to? The immediately preceding section
>>> in the document is about the MIPS I7200 CPU model.
>>
>> It was meant as a reference to the machines below. I'll try to rephrase in v2.
>> (As far as I can see, the 405 can only be used on these boards, it does not
>> seem to be possible to use these CPU types on other boards)
>
> OK. I think it's probably a good policy to make deprecation-notice
> section text self-contained, because we're going to be regularly deleting
> them, or moving them to removed-features.rst.
>
>>> The not-being-deprecated sam460ex board also uses the ppc405 CPU
>>> I think, so I don't think we can drop the CPU models.
>>
>> No, that board uses a 460exb CPU which is a slightly different kind of
>> embedded PPC CPU, as far as I know.
>
> Ah, right. I was confused because sam460ex.c calls ppc405_ebc_init(),
> and so it came up from a quick grep for 'ppc405'.

The AMCC ppc460EX SoC the sam460ex is using has a PPC440 core but since 
these ppc4xx SoCs are based on previous ones they have similar parts which 
are reused. This was and still is quite a mess, I've tried to move some 
ppc440 specific parts to separate file and also common parts to ppc4xx 
when adding sam460ex but some parts from ppc405 is reused without moving 
it to ppc4xx and a lot of it is still predating QOM which would have been 
too much work to fix so left as it was before.

> If we want to deprecate the CPU models I think it would be useful
> to list all the ones we're deprecating explicitly here (using the
> names that the '-cpu' option accepts).

Maybe the ppc405 CPU should be kept due to the entaglement of ppc405 and 
ppc440 parts and also because it could be useful if somebody wants to try 
to run code for that CPU (with user mode or maybe qemi-system-ppc -M none 
-cpu ppc405 plus some other devices if needed).

Regards,
BALATON Zoltan

