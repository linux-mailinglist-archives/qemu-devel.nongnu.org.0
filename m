Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495049759A
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 21:57:14 +0100 (CET)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBjvE-0005MC-KA
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 15:57:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1nBjnp-0002s1-I7
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 15:49:34 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1nBjnn-0008DB-65
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 15:49:33 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 877AC20775;
 Sun, 23 Jan 2022 20:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1642970965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOPpYkf7BQG31AB94racygvqaZzYMmYnkPeJXCtca2E=;
 b=y1mFHgx4pyEe7sG/Q/UiDHF9ZjkxcM5NB6NXdO9P4HJURmjDL5fyAOEN7YMMmrxYhVyLGx
 StmkoUOWh7Yt3N4OsFBkzXs6JZgN3MBASLEjZ+bBdCbj6/Xaas/Cse5dK3TviDq5ieKphZ
 5Jb2Q2+VNqj5IbJ6mbl20pkE0iM0kI4=
From: Mark Burton <mark.burton@greensocs.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: "Startup" meeting (was Re: Meeting today?)
Date: Sun, 23 Jan 2022 21:49:19 +0100
References: <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
 <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
 <YeWjtxEcbb6jcbi8@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
In-Reply-To: <YeWjtxEcbb6jcbi8@redhat.com>
Message-Id: <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All, I believe we will have a followup meeting this coming Tuesday 25th =
January, at 15:00 (presumably using the same link: =
https://redhat.bluejeans.com/5402697718).

We (GreenSocs/Xilinx) would like to quickly show what now =E2=80=98works=E2=
=80=99, and to give an update on the patches.

Cheers
Mark.




> On 17 Jan 2022, at 18:13, Kevin Wolf <kwolf@redhat.com> wrote:
>=20
> Am 11.01.2022 um 11:22 hat Mark Burton geschrieben:
>> That is my understanding=E2=80=A6=20
>> See you there!
>=20
> Unfortunately, I missed this whole thread until now.
>=20
> If the meeting did happen, has anyone taken notes? And if so, where
> could I find them?
>=20
> Kevin
>=20
>>> On 11 Jan 2022, at 11:20, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>>>=20
>>> Hi,
>>>=20
>>> Just checking in, this call is scheduled for today, 3pm CEST, right?
>>>=20
>>> Here is the KVM call calendar:
>>> =
https://www.google.com/calendar/embed?src=3DdG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3=
BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>>>=20
>>> On 1/6/22 12:23, Daniel P. Berrang=C3=A9 wrote:
>>>> No one objected, so I think we can go for the 11th.
>>>>=20
>>>> On Thu, Jan 06, 2022 at 12:21:56PM +0100, Mark Burton wrote:
>>>>> Can we confirm the 11th for this meeting?
>>>>>=20
>>>>> Cheers
>>>>> Mark.
>>>>>=20
>>>>>=20
>>>>>> On 4 Jan 2022, at 10:29, Edgar E. Iglesias =
<edgar.iglesias@gmail.com> wrote:
>>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>> On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster =
<armbru@redhat.com <mailto:armbru@redhat.com>> wrote:
>>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com =
<mailto:berrange@redhat.com>> writes:
>>>>>>=20
>>>>>>> On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster =
wrote:
>>>>>>>> Mark Burton <mark.burton@greensocs.com =
<mailto:mark.burton@greensocs.com>> writes:
>>>>>>>>=20
>>>>>>>>> I realise it=E2=80=99s very short notice, but what about =
having a discussion today at 15:00 ?
>>>>>>>>=20
>>>>>>>> I have a conflict today.  I could try to reschedule, but I'd =
prefer to
>>>>>>>> talk next week instead.  Less stress, better prep.
>>>>>>>=20
>>>>>>> I fear we've run out of time for this year if we want all =
interested
>>>>>>> parties to be able to attend.  I'll be off on PTO from end of =
this
>>>>>>> week until the new year, and I know alot of folk are doing =
similar.
>>>>>>=20
>>>>>> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan =
11?
>>>>>>=20
>>>>>> Jan 11th works for me!
>>>>>>=20
>>>>>> Thanks,
>>>>>> Edgar
>>>>>=20
>>>>=20
>>>> Regards,
>>>> Daniel
>>=20
>>=20
>=20


