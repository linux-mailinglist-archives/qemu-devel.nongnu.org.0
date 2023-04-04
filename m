Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBCE6D67E1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:52:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjiwv-0006iH-3x; Tue, 04 Apr 2023 11:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjiwr-0006hq-Mt
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:51:53 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pjiwo-0004pG-2Z
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:51:53 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1116E746705;
 Tue,  4 Apr 2023 17:50:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C1A677466FF; Tue,  4 Apr 2023 17:50:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BECF07462DB;
 Tue,  4 Apr 2023 17:50:45 +0200 (CEST)
Date: Tue, 4 Apr 2023 17:50:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Cedric Le Goater <clegoate@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>, 
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
In-Reply-To: <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
Message-ID: <3104b591-1d71-76a0-674c-517a292cd16f@eik.bme.hu>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <dbc8b2f6-3e9e-65d7-998f-568b6376d25c@ilande.co.uk>
 <4e42ea6b-0f9b-69e0-1593-c3288712d13c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1528095281-1680623445=:49755"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

--3866299591-1528095281-1680623445=:49755
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 4 Apr 2023, Thomas Huth wrote:
> On 05/02/2023 23.12, Mark Cave-Ayland wrote:
>> On 30/01/2023 20:45, Alex Bennée wrote:
>> 
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>> 
>>>> On Mon, Jan 30, 2023 at 11:47:02AM +0000, Peter Maydell wrote:
>>>>> On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>>>>>> 
>>>>>> Testing 32-bit host OS support takes a lot of precious time during the 
>>>>>> QEMU
>>>>>> contiguous integration tests, and considering that many OS vendors 
>>>>>> stopped
>>>>>> shipping 32-bit variants of their OS distributions and most hardware 
>>>>>> from
>>>>>> the past >10 years is capable of 64-bit
>>>>> 
>>>>> True for x86, not necessarily true for other architectures.
>>>>> Are you proposing to deprecate x86 32-bit, or all 32-bit?
>>>>> I'm not entirely sure about whether we're yet at a point where
>>>>> I'd want to deprecate-and-drop 32-bit arm host support.
>>>> 
>>>> Do we have a feeling on which aspects of 32-bit cause us the support
>>>> burden ? The boring stuff like compiler errors from mismatched integer
>>>> sizes is mostly quick & easy to detect simply through a cross compile.
>>>> 
>>>> I vaguely recall someone mentioned problems with atomic ops in the past,
>>>> or was it 128-bit ints, caused implications for the codebase ?
>>> 
>>> Atomic operations on > TARGET_BIT_SIZE and cputlb when
>>> TCG_OVERSIZED_GUEST is set. Also the core TCG code and a bunch of the
>>> backends have TARGET_LONG_BITS > TCG_TARGET_REG_BITS ifdefs peppered
>>> throughout.
>> 
>> I am one of an admittedly small group of people still interested in using 
>> KVM-PR on ppc32 to boot MacOS, although there is some interest on using 
>> 64-bit KVM-PR to run super-fast MacOS on modern Talos hardware.
>>
>>  From my perspective losing the ability to run 64-bit guests on 32-bit 
>> hardware with TCG wouldn't be an issue, as long as it were still possible 
>> to use qemu-system-ppc on 32-bit hardware using both TCG and KVM to help 
>> debug the remaining issues.
>
> Hi Mark!
>
> Just out of curiosity (since we briefly talked about 32-bit KVM on ppc in 
> today's QEMU/KVM call - in the context of whether qemu-system-ppc64 is a 
> proper superset of qemu-system-ppc when it comes to building a unified 
> qemu-system binary): What host machine are you using for running KVM-PR? And

Another issue I know is that mac99 behaves differently in qemu-system-ppc 
and qemu-system-ppc64. This is not only confusing users but makes it more 
difficult to get rid of qemu-system-ppc. I've tried to solve that and 
sumbitted a patch to start deprecating these but I could not get that 
merged. That thread ended here:

https://lists.nongnu.org/archive/html/qemu-ppc/2023-01/msg00406.html

Regards,
BALATON Zoltan
--3866299591-1528095281-1680623445=:49755--

