Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B52E2849
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 18:11:10 +0100 (CET)
Received: from localhost ([::1]:55948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksU8q-0000NL-T9
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 12:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksU73-0008He-3w
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:09:17 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:25557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksU6z-0005Yk-SH
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 12:09:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6345E746552;
 Thu, 24 Dec 2020 18:09:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C610874646C; Thu, 24 Dec 2020 18:09:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C0A1D746383;
 Thu, 24 Dec 2020 18:09:09 +0100 (CET)
Date: Thu, 24 Dec 2020 18:09:09 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <CAAdtpL7E+Vxe1FxP5F53AfyjUdJNh18LE198t-jvJbAkr8NXBg@mail.gmail.com>
Message-ID: <35352fb-6264-f7da-4c24-db19fa81b0aa@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
 <8a3b2030-8ee6-fd56-6bfa-206457db84f@eik.bme.hu>
 <165973a-135e-3072-ee2c-afda64844770@eik.bme.hu>
 <20201224053216.GA60462@roeck-us.net>
 <88314cc3-6219-3dc-2981-279ef6442514@eik.bme.hu>
 <CAAdtpL7E+Vxe1FxP5F53AfyjUdJNh18LE198t-jvJbAkr8NXBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1306857043-1608829749=:89778"
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1306857043-1608829749=:89778
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 24 Dec 2020, Philippe Mathieu-Daudé wrote:
> On Thu, Dec 24, 2020 at 9:11 AM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> On Wed, 23 Dec 2020, Guenter Roeck wrote:
>>> On Thu, Dec 24, 2020 at 02:34:07AM +0100, BALATON Zoltan wrote:
>>> [ ... ]
>>>>
>>>> If we need legacy mode then we may be able to emulate that by setting BARs
>>>> to legacy ports ignoring what values are written to them if legacy mode
>>>> config is set (which may be what the real chip does) and we already have
>>>> IRQs hard wired to legacy values so that would give us legacy and
>>>> half-native mode which is enough for both fuloong2e and pegasos2 but I'm not
>>>> sure how can we fix BARs in QEMU because that's also handled by generic PCI
>>>> code which I also don't want to break.
>>>
>>> The code below works for booting Linux while at the same time not affecting
>>> any other emulation. I don't claim it to be a perfect fix, and overloading
>>> the existing property is a bit hackish, but it does work.
> [...]
>> I think we don't need more complete
>> emulation of this chip than this for now but if somebody wants to attempt
>> that I don't mind as long as it does not break pegasos2.
>
> Fine by me as long as pegasos2 doesn't break other OSes :)

Sure, I did try to avoid breaking fuloong2e last time too and tested with 
the kernel I could dig up. Unfortunately that does not seem to be the 
right test for that machine. The fuloong2e model wasn't in very good shape 
back then. Now we have better test cases for it.

> Can we have integration tests of pegasos2 so we can modify the device models
> without introducing regressions?
> If it is not open-source, you could still contribute tests with hash
> of tested binary
> and provide the binary file to test on demand off-list.

We're not there yet when I can submit pegasos2 patches for merging because 
I'll need to make more clean ups to via model and also have a replacement 
for the firmware binary that I plan to do as time permits. For OS there 
may be some older PPC Linux distros that used to work with pegasos2 and 
MorphOS demo is freely downloadable but not redistributable so maybe 
possible to use as test but I'll need some help with the python module to 
integrate it in QEMU tests. I'll keep you cc-d about this anyway as the 
MIPS maintainer.

Regards,
BALATON Zoltan
--3866299591-1306857043-1608829749=:89778--

