Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCFFA7296
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 20:35:30 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5DeK-0004vE-RB
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 14:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1i5DdC-0004U0-Pd
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 14:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1i5DdB-0006IJ-GJ
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 14:34:18 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:41456
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1i5DdB-0006Hh-9W
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 14:34:17 -0400
Received: from host86-168-80-252.range86-168.btcentralplus.com
 ([86.168.80.252] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1i5Db8-0000SO-DK; Tue, 03 Sep 2019 19:32:12 +0100
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
 <5746cc58-c132-ef29-6ff4-da07c6086dac@ilande.co.uk>
 <3fe632b7-e83c-9b26-9338-1d7a9c881e0d@linaro.org>
 <CABLmASFUnBnn2DZidKFAiaMb7gExYttgvEv12uce9EPi6NL9Qw@mail.gmail.com>
 <f1eeb1de-a6e7-bb83-3501-705382da4b14@ilande.co.uk>
 <CAL1e-=gtgzRHzZyX9r69_zB5-v-ThYeuxBameoF12TBs59M95w@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 mQENBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAG0ME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPokB
 OAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63LkBDQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABiQEfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Message-ID: <db28c297-290b-3641-d87a-67fde65312a8@ilande.co.uk>
Date: Tue, 3 Sep 2019 19:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gtgzRHzZyX9r69_zB5-v-ThYeuxBameoF12TBs59M95w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.168.80.252
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: No (on mail.default.ilande.uk0.bigv.io); Unknown failure
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: Re: [Qemu-devel] [PATCH v6 00/16] tcg/ppc: Add vector opcodes
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2019 18:37, Aleksandar Markovic wrote:

> On Tue, Sep 3, 2019 at 7:05 PM Mark Cave-Ayland <
> mark.cave-ayland@ilande.co.uk> wrote:
> 
>> On 01/07/2019 19:34, Howard Spoelstra wrote:
>>
>>> On Mon, Jul 1, 2019 at 12:30 PM Richard Henderson <
>>> richard.henderson@linaro.org> wrote:
>>>
>>>> On 6/30/19 7:58 PM, Mark Cave-Ayland wrote:
>>>>> I don't have space for a full set of images on the G4, however I've
>>>> tried boot tests
>>>>> on installer CDs for MacOS 9, OS X 10.2, Linux and HelenOS and it looks
>>>> good here.
>>>>>
>>>>> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [PPC32]
>>>>
>>>> Thanks!
>>>>
>>>> Hi
>>>
>>> I just compiled the v6 set applied to current master on my G5, Ubuntu 16.
>>> command line:
>>> ./qemu-system-ppc -L pc-bios -boot c m 512 -M mac99,via=pmu \
>>> -netdev user,id=net1 -device sungem,netdev=net1 \
>>> -drive file=10.3.img,format=raw,media=disk \
>>>
>>> With no specific cpu set, Mac OS 9.2 hard disk image and 9.2 iso do not
>> get
>>> to the desktop, they just hang while still in the openbios window. They
>>> need -cpu G4 on the command line to get to the desktop.
>>>
>>> OSX 10.3 installed image boots to desktop.
>>> OSX 10.3 iso boots to installer
>>> OSX 10.4 installed image boots to desktop.
>>> OSX 10.4 iso boot to installer
>>> OSX 10.5 installed image boots to desktop.
>>> OSX 10.5 iso boots to installer
>>>
>>> So there seems to be a difference between hosts: If ran on a G4 host
>> there
>>> is no need to add -cpu G4 to run Mac OS 9.x, while there is when ran on a
>>> G5 host.
>>
>> Are there any outstanding issues with this patchset now, or is it ready to
>> be merged?
>> I'm really looking forward to seeing the improved performance when testing
>> QEMU on my
>> Mac Mini :)
>>
>>
> Howard pointed to some illogical quirks of command line:
> 
>> If ran on a G4 host there is no need to add -cpu G4 to run Mac OS 9.x,
>> while there is when ran on a G5 host.
> 
> I am not sure if Howard says that this is a consequence of this series
> though.

No, that has been an existing issue for a long time :)

> Overall, I think this is a very good series - however, I had a number of
> minor
> objections to multiple patches, that don't affect (or affect in a minimal
> way)
> provided functionality - those objections are not addressed, nor properly
> discussed - but I do think they should be addressed in order to get the
> series
> in a better shape before upstreaming.

I've had a quick look at some of your review comments, and certainly I can see how
the earlier revisions have benefited from your feedback. There has been a lot of
positive discussion, and Richard has taken the time to respond and update the
patchset over several weeks to its latest revision.

AFAICT the only remaining issue is that related to the ISA flags, but to me this
isn't something that should prevent the patchset being merged. I can certainly see
how the current flags implementation may not be considered technically correct, but
then from your comments I don't see that it would be something that would be
particularly difficult to change at a later date either.

The things that are important to me are i) is the patchset functionally correct and
ii) is it understandable and maintainable. I would say that the first point is
clearly true (both myself and Howard have spent a lot of time testing it), and given
that I had to delve into these patches to fix the R2 register issue on 32-bit PPC
then I can confirm that the contents of the patches were a reasonably accurate
representation of the changes described within. And that's from someone like me who
is mostly still a TCG beginner :)

From a slightly more selfish position as the PPC Mac machine maintainer, these
patches make a significant difference to me in that they reduce the MacOS boot times
during everyday testing. Now for someone like myself who works on QEMU as a hobby
outside of family life and a full time job, those few minutes are really important to
me and soon add up really quickly during testing.

I would really like these patches to be merged soon, since the worst thing that can
happen is that the patchset ends up bit-rotting and then all the time and effort put
into writing, testing and reviewing the patches by Richard, Howard, David, myself and
indeed your review time will all end up going to waste.


ATB,

Mark.

