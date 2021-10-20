Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0250434A75
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:47:28 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdA47-00037H-F8
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1md9zE-0006aU-W3; Wed, 20 Oct 2021 07:42:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:10785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1md9zC-0005O8-7d; Wed, 20 Oct 2021 07:42:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 39BB4756057;
 Wed, 20 Oct 2021 13:42:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 01549756036; Wed, 20 Oct 2021 13:42:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F2FE3756047;
 Wed, 20 Oct 2021 13:42:18 +0200 (CEST)
Date: Wed, 20 Oct 2021 13:42:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
In-Reply-To: <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
Message-ID: <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2035401154-1634730138=:8668"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2035401154-1634730138=:8668
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 20 Oct 2021, Philippe Mathieu-Daudé wrote:
> On 10/5/21 14:29, Thomas Huth wrote:
>> On 05/10/2021 14.20, BALATON Zoltan wrote:
>>> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>>>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in
>>>>>>>>>>>> QEMU (as far as I
>>>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>>>> also not possible
>>>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>>>
>>>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>>>
>>>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>>>> couple of years ago already:
>>>>>>>>>>
>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>>>
>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>>>
>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>>>
>>>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>>>> deprecate-and-delete them.
>>>>>>>>>>
>>>>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>>>
>>>>>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>>>
>>>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any
>>>>>>>>> regression
>>>>>>>>> tests of Linux Kernel on those processors.
>>>>>>>>
>>>>>>>> If you/someone managed to compile an old version of u-boot for
>>>>>>>> one of these
>>>>>>>> two boards, so that we would finally have something for
>>>>>>>> regression testing,
>>>>>>>> we can of course also keep the boards in QEMU...
>>>>>>>
>>>>>>> I can see that it would be usefor for some cases, but unless someone
>>>>>>> volunteers to track down the necessary firmware and look after it, I
>>>>>>> think we do need to deprecate it - I certainly don't have the
>>>>>>> capacity
>>>>>>> to look into this.
>>>>>>>
>>>>>>
>>>>>> I will look at it, please allow me a few weeks though.
>>>>>
>>>>> Well, building it was not hard but now I'd like to know what board
>>>>> QEMU actually emulates, there are way too many codenames and PVRs.
>>>>
>>>> yes. We should try to reduce the list below. Deprecating embedded
>>>> machines
>>>> is one way.
>>>
>>> Why should we reduce that list? It's good to have different cpu
>>> options when one wants to test code for different PPC versions (maybe
>>> also in user mode) or just to have a quick list of these at one place.
>>
>> I think there are many CPUs in that list which cannot be used with any
>> board, some of them might be also in a very incomplete state. So
>> presenting such a big list to the users is confusing and might create
>> wrong expectations. It would be good to remove at least the CPUs which
>> are really completely useless.
>
> Maybe only remove some from system emulation but keep all of them
> in user emulation?

Or keep them all but mark those that are not tested/may be incomplete? So 
the used can see what is expected to work and what may need to be fixed. 
That way somebody may try and fix it whereas if it's not there they are 
unlikely to try to add it.

Regards,
BALATON Zoltan
--3866299591-2035401154-1634730138=:8668--

