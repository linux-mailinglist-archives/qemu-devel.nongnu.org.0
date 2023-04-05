Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AC66D7C08
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 13:56:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk1k0-0006iV-UR; Wed, 05 Apr 2023 07:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pk1jy-0006iB-Hz
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:55:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pk1jv-0002lv-Vw
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 07:55:50 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5B3B6746361;
 Wed,  5 Apr 2023 13:54:42 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0DCD974633D; Wed,  5 Apr 2023 13:54:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0AF57746377;
 Wed,  5 Apr 2023 13:54:42 +0200 (CEST)
Date: Wed, 5 Apr 2023 13:54:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clegoate@redhat.com>, 
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
In-Reply-To: <55cab42d-19b1-c454-8979-0aaae4a64a00@redhat.com>
Message-ID: <b1e05818-2dce-15fb-9796-680648ca3dd6@eik.bme.hu>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
 <dc07d506-283a-b884-1ab5-54f2e1134fb8@redhat.com>
 <77c41865-1585-6a3a-f02e-1c072a4368bd@eik.bme.hu>
 <55cab42d-19b1-c454-8979-0aaae4a64a00@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2121317180-1680695682=:43849"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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

--3866299591-2121317180-1680695682=:43849
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 5 Apr 2023, Thomas Huth wrote:
> On 04/04/2023 17.42, BALATON Zoltan wrote:
>> On Tue, 4 Apr 2023, Cédric Le Goater wrote:
>>> [ adding Zoltan ]
>>> 
>>> On 4/4/23 16:00, Thomas Huth wrote:
>>>> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>>>>> On 30/01/2023 20:45, Alex Bennée wrote:
>>>>> 
>>>>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>>>>> 
>>>>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>> 
>>>>>>>>> Testing 32-bit host OS support takes a lot of precious time during 
>>>>>>>>> the QEMU
>>>>>>>>> contiguous integration tests, and considering that many OS vendors 
>>>>>>>>> stopped
>>>>>>>>> shipping 32-bit variants of their OS distributions and most hardware 
>>>>>>>>> from
>>>>>>>>> the past >10 years is capable of 64-bit
>>>>>>>> 
>>>>>>>> True for x86, not necessarily true for other architectures.
>>>>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>>>>> 
>>>>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>>>>> 
>>>>>>> I vaguely recall someone mentioned problems with atomic ops in the 
>>>>>>> past,
>>>>>>> or was it 128-bit ints, caused implications for the codebase ?
>>>>>> 
>>>>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>>>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>>>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>>>>> throughout.
>>>>> 
>>>>> I am one of an admittedly small group of people still interested in 
>>>>> using KVM-PR on ppc32 to boot MacOS, although there is some interest on 
>>>>> using 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
>>>>> 
>>>>>  From my perspective losing the ability to run 64-bit guests on 32-bit 
>>>>> hardware with TCG wouldn't be an issue, as long as it were still 
>>>>> possible to use qemu-system-ppc on 32-bit hardware using both TCG and 
>>>>> KVM to help debug the remaining issues.
>>>> 
>>>>   Hi Mark!
>>>> 
>>>> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in 
>>>> today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a 
>>>> proper superset of qemu-system-ppc when it comes to building a unified 
>>>> qemu-system binary): What host machine are you using for running KVM-PR? 
>>>> And which QEMU machine are you using for running macOS? The mac99 or the 
>>>> g3beige machine?
>>> 
>>> Zoltan, what about the pegasos2 and sam460ex machines ? can they be run 
>>> under KVM ?
>> 
>> I don't know as I don't have PPC hardware to test on but theoretically they 
>> should work. Although BookE KVM was dropped from Linux I think so sam460ex 
>> could only work with an old kernel on a BookE host which is now rare 
> [...]
>
> Thanks for your explanations, that indeed helps to understand the situation!
>
> But are you sure about the BookE KVM removal in the Linux kernel? ... when I 
> look at the arch/powerpc/kvm/ folder there, I can still see some files there 
> with "booke" in the name?

No, I'm not sure but I think KVM on PPC440 (which is used by sam460ex) is 
likely not working properly. What's there may work on newer cores such as 
e500 and later but not sure if that can run PPC440 code. I never heard 
anyone successfully getting sam460ex work with KVM but that may also be 
because real PPC440 hosts are rare.

But if the question is if we still need 32 bit PPC host I think we do for 
now as that's the only way to run 32bit guests with G3 and G4 until the 
issues which prevent them to run on 64bit host kernel are fixed.

Regards,
BALATON Zoltan
--3866299591-2121317180-1680695682=:43849--

