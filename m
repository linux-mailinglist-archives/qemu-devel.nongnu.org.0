Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E796A5E03
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3Ye-0004yP-O3; Tue, 28 Feb 2023 12:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX3Yc-0004yD-PV; Tue, 28 Feb 2023 12:14:30 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pX3Ya-0004YL-MT; Tue, 28 Feb 2023 12:14:30 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 481587462DB;
 Tue, 28 Feb 2023 18:14:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 06BDC7457E7; Tue, 28 Feb 2023 18:14:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 04A09745706;
 Tue, 28 Feb 2023 18:14:24 +0100 (CET)
Date: Tue, 28 Feb 2023 18:14:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
cc: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
In-Reply-To: <Y/4q+gZ6Q2738hmx@redhat.com>
Message-ID: <88ffe803-b5d3-da6f-9e52-00e6dd9cf092@eik.bme.hu>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
 <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
 <b4b60712-a94c-69f4-2de0-b9b5e08970fc@linaro.org>
 <16efff7f-afe7-7c92-bdbe-6b0920bf2438@eik.bme.hu>
 <Y/4q+gZ6Q2738hmx@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-554275059-1677604464=:7539"
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

--3866299591-554275059-1677604464=:7539
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 28 Feb 2023, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 04:05:30PM +0100, BALATON Zoltan wrote:
>> On Mon, 27 Feb 2023, Philippe Mathieu-Daudé wrote:
>>> On 27/2/23 18:47, BALATON Zoltan wrote:
>>>> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>>>>> Unfortunately my patches had changes merged in. This now makes it hard to
>>>>> show what really changed (spoiler: nothing that affects behavior).
>>>>>
>>>>> As you probably noticed in the "resend" version of this iteration I split
>>>>> off a patch introducing the priq properties. It belongs to the sub series
>>>>> of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
>>>>> to show up in `git blame` as the author of any of these changes. I
>>>>> attributed it to you because this was really your change which
>>>>> I'm not even
>>>>> sure is legal.
>>>>>
>>>>> Let's avoid such complications by keeping our series separate.
>>>>
>>>> Let's cool down a bit. Philippe took some of the sm501 patches in
>>>> his giant pull request (and a lot of your patches too) now so I'll
>>>> wait until that lands and hope to get some review for the remaining
>>>> patches too. Once that pull req is merged I'll rebase the remaining
>>>> patches and resubmit the series also adding changes for reasonable
>>>> review comments I get by then.
>>>
>>> I'm sorry it took me so long, I was expecting these patches to be picked
>>> up by other maintainers but everybody is very busy. I know you'll need
>>
>> You have no reason to apologise really, you did a great job merging all the
>> patches. I was thinking that because as you say every maintainer is very
>> busy now and we also had CI outage for a few weeks should we consider
>> extending the date until the freeze by one or two weeks? That would allow
>> people to relax a bit and be able to consolidate and merge all still pending
>> patches. Postponing the 8.0 release one or two weeks is probably better than
>> missing a lot of changes until the next release in September. We'd still aim
>> for the original freeze date but if we fail to meet that it would be more
>> convenient to know there could be a possibility for extending it. But make
>> it clear that this is only for this one time because of CI outage and
>> additional maintainer load caused by that so not something that should be
>> done regularly but under current circumstances I would consider it.
>
> There's no need to change the release schedule IMHO. Subsystem maintainers
> should continue to send pull requests as normal. Peter is still processing
> PRs, albeit at a lower rate with adhoc CI. From the soft freeze POV what
> matters is just that the PRs are posted on the mailing list before the
> deadline. If they're posted in time, they're still valid for inclusion in
> the release. Our CI allowance is reset at the end of today anyway.

Problem is that some patches will need to be rebased on still pending pull 
request and also may need the maintainer's attention to review them and 
send the final pull despite series have been on the list few weeks before 
the freeze that should be in time. So this will mean we might still have 
some pending patches end of this week and if somebody asks for last minute 
changes then it will be hard to meet the deadline. So at least one week 
extension seems to resolve the pressure this causes and also give 
maintainers some time to catch up. It's better than just saying "Sorry it 
was out fault but you've still missed the release, see you next time."

Regards,
BALATON Zoltan
--3866299591-554275059-1677604464=:7539--

