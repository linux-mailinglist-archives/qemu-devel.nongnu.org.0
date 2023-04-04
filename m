Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF66D67C7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:43:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjior-0003ao-AH; Tue, 04 Apr 2023 11:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjiop-0003aW-9b
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:43:35 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjiom-0000N5-V0
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:43:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 98F4F746F32;
 Tue,  4 Apr 2023 17:42:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 49B15746F31; Tue,  4 Apr 2023 17:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 46FFA746F7F;
 Tue,  4 Apr 2023 17:42:27 +0200 (CEST)
Date: Tue, 4 Apr 2023 17:42:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clegoate@redhat.com>
cc: Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>, 
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <dc07d506-283a-b884-1ab5-54f2e1134fb8@redhat.com>
Message-ID: <77c41865-1585-6a3a-f02e-1c072a4368bd@eik.bme.hu>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
 <dc07d506-283a-b884-1ab5-54f2e1134fb8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2050281228-1680622947=:49755"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2050281228-1680622947=:49755
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 4 Apr 2023, Cédric Le Goater wrote:
> [ adding Zoltan ]
>
> On 4/4/23 16:00, Thomas Huth wrote:
>> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>>> On 30/01/2023 20:45, Alex Bennée wrote:
>>> 
>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>> 
>>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>> 
>>>>>>> Testing 32-bit host OS support takes a lot of precious time during the 
>>>>>>> QEMU
>>>>>>> contiguous integration tests, and considering that many OS vendors 
>>>>>>> stopped
>>>>>>> shipping 32-bit variants of their OS distributions and most hardware 
>>>>>>> from
>>>>>>> the past >10 years is capable of 64-bit
>>>>>> 
>>>>>> True for x86, not necessarily true for other architectures.
>>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>>> 
>>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>>> 
>>>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>>>> or was it 128-bit ints, caused implications for the codebase ?
>>>> 
>>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>>> throughout.
>>> 
>>> I am one of an admittedly small group of people still interested in using 
>>> KVM-PR on ppc32 to boot MacOS, although there is some interest on using 
>>> 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
>>> 
>>>  From my perspective losing the ability to run 64-bit guests on 32-bit 
>>> hardware with TCG wouldn't be an issue, as long as it were still possible 
>>> to use qemu-system-ppc on 32-bit hardware using both TCG and KVM to help 
>>> debug the remaining issues.
>>
>>   Hi Mark!
>> 
>> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in 
>> today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a 
>> proper superset of qemu-system-ppc when it comes to building a unified 
>> qemu-system binary): What host machine are you using for running KVM-PR? 
>> And which QEMU machine are you using for running macOS? The mac99 or the 
>> g3beige machine?
>
> Zoltan, what about the pegasos2 and sam460ex machines ? can they be run under 
> KVM ?

I don't know as I don't have PPC hardware to test on but theoretically 
they should work. Although BookE KVM was dropped from Linux I think so 
sam460ex could only work with an old kernel on a BookE host which is now 
rare but pegasos2 uses G4 CPU which is more likely to work on a host with 
the same CPU but I don't know anybody tested it yet. I know some people 
are interested to use it especially on G4 and G5 and some tested the 
latter but it does not work due to some differences that should be handled 
by KVM-PR but apparently they aren't (e.g. dcbz cache line size which I've 
seen debugged and identified by at least two sources that I sent 
references to this list before but to my knowledge no fix got upstream in 
Linux for this).

AFAIK Mark has a G4 Mac mini on which KVM-PR works and it may also work on 
G5 when using 32 bit Kernel but running G4 guest on G5 with 64 bit kernel 
does not work. G5 host with 64 bit kernel may work with 64 bit guests but 
all Amiga like OSes I'm interested in are 32 bit so they either need 32 
bit host kernel, preferably with same CPU as the guest (so G4 for pegasos2 
or PPC440 for sam460ex) or fixing the patching and emulation of 
instructions in KVM-PR that behave differently between G4 and G5 which 
should be possible but nobody seems to have done it or bothered to 
upstream it and what's there may be incomplete or buggy.

The only reports I've seen that said it works were either running 32bit 
guest on 32bit BookS host or 64bit guest on 64bit BookS host. (A special 
case is running 64bit aware 32bit guest such as newer MacOS or MorphOS 
versions on 64bit hosts which can run on real G5 so these may run as long 
as they correctly identify the CPU they are running on but the G5 Mac 
emulation in QEMU currently can't boot these because the machine is not 
emulated precisely enough for them.)

Regards,
BALATON Zoltan
--3866299591-2050281228-1680622947=:49755--

