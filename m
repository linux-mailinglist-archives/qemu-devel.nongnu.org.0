Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34D68B869
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:16:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOxaq-0001fZ-8i; Mon, 06 Feb 2023 04:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxao-0001f0-Ce; Mon, 06 Feb 2023 04:15:18 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxal-0006i4-Ok; Mon, 06 Feb 2023 04:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cn3PlUWTi3L7ULxR84ucr8AaAWduoLO7Cr+Ng8lHszs=; b=AzLyc58bUBQkUH5hF4a9eyidHN
 SlRnwgkqTz0yV/sbRWTwYeBZY26wj5YB84OHjFX/VAUJ4MBqZCjmEA4T0odYPblsKLAYzmRps2jzL
 sJONoiZEyS2VA1JHLiBMWDgKPrAHuGRAdC7v2m3dXZyTVEh0nbSAxBAfuAPcL4XkRPEtsl/w7WAy+
 R46jJgH5jeVHY86nJQh4uO9ebd+fpS4tsLHFfMJznKEW7QX295Ri7ujhC3pgIA9D0lQ9qCh1Ql8/T
 p5DlCQSWoNlCoBYfiJlhAaO5gKFN/Tpuj5tpZ8TCY5fSO5wdJBjmYOTrctQ3waVFBQrgAfSzQ7F1U
 ryonKZ+gLg1eFCqbnKVXFYZhjTVuLdwNvSIkKO8TcwOIgKH+GUf47bI7fW9arvr2xKD0q2DXcn7Ti
 2GlzxFLM3hnBMNxlWPSu5Fp5nrLI2h/b8qJUwHxGPc7Rpgy7fYy3p6+xzaMK7Jv3lQQQypCY8QZ3i
 ddADq6crIZT3izKazUnyfxtYOzW/KY3wbkmyL7D/s8329RpuASJoe+qly6+IaWCiINg9Iz9gdhx6I
 a5km7G8sbhDOnTn0ojiEQj5sQ5aTilwS4gtEEl07EIAFUM7wN0u3ML82pbaf+MPDKTrlZFNUrJgLA
 ygSIePHHIwkLRDgfWoEYAgcWmff3xI8BSgd50BTGA=;
Received: from host86-130-37-175.range86-130.btcentralplus.com
 ([86.130.37.175] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxa9-000BHo-74; Mon, 06 Feb 2023 09:14:37 +0000
Message-ID: <5095dffc-309b-6c72-d255-8cdaa6fd3d52@ilande.co.uk>
Date: Mon, 6 Feb 2023 09:15:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230126211740.66874-1-shentey@gmail.com>
 <20230126211740.66874-8-shentey@gmail.com>
 <fb287888-c88c-60b1-20a4-1e50ddbf1daf@ilande.co.uk>
 <alpine.LMD.2.03.2302052308460.32269@eik.bme.hu>
 <935ae2a8-4327-53c6-1649-36698a00901d@ilande.co.uk>
 <54381726-dcab-8fb2-636d-4937bf0f4866@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <54381726-dcab-8fb2-636d-4937bf0f4866@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.130.37.175
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 07/10] hw/ide/piix: Require an ISABus only for
 user-created instances
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 06:51, Philippe Mathieu-Daudé wrote:

> On 5/2/23 23:32, Mark Cave-Ayland wrote:
>> On 05/02/2023 22:21, BALATON Zoltan wrote:
>>
>>> On Sun, 5 Feb 2023, Mark Cave-Ayland wrote:
>>>> On 26/01/2023 21:17, Bernhard Beschow wrote:
>>>>> Internal instances now defer interrupt wiring to the caller which
>>>>> decouples them from the ISABus. User-created devices still fish out the
>>>>> ISABus from the QOM tree and the interrupt wiring remains in PIIX IDE.
>>>>> The latter mechanism is considered a workaround and intended to be
>>>>> removed once a deprecation period for user-created PIIX IDE devices is
>>>>> over.
>>>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> ---
>>>>>   include/hw/ide/pci.h |  1 +
>>>>>   hw/ide/piix.c        | 64 ++++++++++++++++++++++++++++++++++----------
>>>>>   hw/isa/piix.c        |  5 ++++
>>>>>   3 files changed, 56 insertions(+), 14 deletions(-)
> 
>>>> I haven't checked the datasheet, but I suspect this will be similar to the 
>>>> cmd646/via PCI-IDE interfaces in that there will be a PCI configuration register 
>>>> that will switch between ISA compatibility mode (and ISA irqs) and PCI mode (with 
>>>> PCI IRQs). So it would be the device configuration that would specify PCI or ISA 
>>>> mode, rather than the presence of an ISABus.
>>>
>>> I forgot about this topic already and haven't follwed this series either so what I 
>>> say may not fully make sense but I think CMD646 and via-ide are different. CMD646 
>>> is a PCI device and should use PCI interrupts while via-ide is part of a 
>>> southbridge/superio complex and connected to the ISA PICs within that southbride, 
>>> so I think via-ide always uses ISA IRQs and the ISA btidge within the same chip 
>>> may convert that to PCI IRQs or not (that part is where I'm lost also because we 
>>> may not actually model it that way). After a long debate we managed to find a 
>>> solution back then that works for every guest we use it for now so I think we 
>>> don't want to touch it now until some real need arises. It does not worth the 
>>> trouble and added complexity to model something that is not used just for the sake 
>>> of correctness. By the time we find a use for that, the ISA emulation may evolve 
>>> so it's easier to implement the missing switching between isa and native mode or 
>>> we may want to do it differently (such as we do things differently now compared to 
>>> what we did years ago). So I think it does not worth keeping the ISA model from 
>>> being simplified for some theoretical uses in the future which we may not actually 
>>> do any time soon. But I don't want to get into this again so just shared my 
>>> thoughts and feel free to ignore it. I don't care where these patches go as long 
>>> as the VIA model keeps working for me.
>>
>> I have a vague memory that ISA compatibility mode was part of the original 
>> PCI-BMDMA specification, but it has been a while since I last looked.
>>
>> Bernhard, is there any mention of this in the PIIX datasheet(s)? For reference the 
>> cmd646 datasheet specifies that ISA mode or PCI mode is determined by register 
>> PROG_IF (0x9) in PCI configuration space.
> 
> Orthogonal to this discussion, one problem I see here is a device
> exposing 2 interfaces: ISA and PCI. QOM does support interfaces,
> but ISA and PCI aren't QOM interfaces. The QOM cast macros are
> written as a QOM object can only inherit one parent. Should we
> stick to QDev and convert ISA/PCI as QOM interfaces? That could
> solve some QDev IDE limitations...

The normal approach to this is to encapsulate the chip functionality as a set of 
common functions, for example see esp.c and then have separate files such as 
esp-pci.c and esp-isa.c which can be compiled accordingly using Kconfig dependencies.

FWIW the ability to support a legacy mode is only something that would be present in 
the generation of mixed PCI/ISA motherboards, and so probably not something that is 
worth the effort of reworking separate PCI and ISA QOM interfaces.


ATB,

Mark.

