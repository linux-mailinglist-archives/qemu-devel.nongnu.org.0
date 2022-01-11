Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F448AB6F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 11:32:30 +0100 (CET)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ES5-0004ij-EX
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 05:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1n7EJ0-00008h-Nv
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:23:06 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1n7EIw-0003dB-Ag
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 05:23:04 -0500
Received: from smtpclient.apple (unknown [54.37.16.242])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 85BAF21C6C;
 Tue, 11 Jan 2022 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1641896564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HanuKaBdSOgPOC7KR55uMl918YT2wyqPl6fEBo/DUCw=;
 b=NoybH2+7b1QuENzGFaJbBy3hg5ELv8GDEFjhpbUtSPUjKnK9gxumUVwzItbU6m0dTcjbHI
 HQ9LDFEsNT8X1HcVLNoJIoWGSp5WZdleusP/neeLEVZEUroMCNNHYah7dXep5UmRpjhnXR
 UDX7zJuLwU4AL3cP6YftunM+QxHomcI=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: "Startup" meeting (was Re: Meeting today?)
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
Date: Tue, 11 Jan 2022 11:22:37 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC0208B2-5ECE-4F74-9DFF-FB8959642C48@greensocs.com>
References: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
 <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
 <YdbRShE01esANc5h@redhat.com>
 <fb519eb4-c0c6-a0b6-585d-e708b04ed207@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That is my understanding=E2=80=A6=20
See you there!
Cheers
Mark.


> On 11 Jan 2022, at 11:20, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> Hi,
>=20
> Just checking in, this call is scheduled for today, 3pm CEST, right?
>=20
> Here is the KVM call calendar:
> =
https://www.google.com/calendar/embed?src=3DdG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3=
BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>=20
> On 1/6/22 12:23, Daniel P. Berrang=C3=A9 wrote:
>> No one objected, so I think we can go for the 11th.
>>=20
>> On Thu, Jan 06, 2022 at 12:21:56PM +0100, Mark Burton wrote:
>>> Can we confirm the 11th for this meeting?
>>>=20
>>> Cheers
>>> Mark.
>>>=20
>>>=20
>>>> On 4 Jan 2022, at 10:29, Edgar E. Iglesias =
<edgar.iglesias@gmail.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>> On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster =
<armbru@redhat.com <mailto:armbru@redhat.com>> wrote:
>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com =
<mailto:berrange@redhat.com>> writes:
>>>>=20
>>>>> On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
>>>>>> Mark Burton <mark.burton@greensocs.com =
<mailto:mark.burton@greensocs.com>> writes:
>>>>>>=20
>>>>>>> I realise it=E2=80=99s very short notice, but what about having =
a discussion today at 15:00 ?
>>>>>>=20
>>>>>> I have a conflict today.  I could try to reschedule, but I'd =
prefer to
>>>>>> talk next week instead.  Less stress, better prep.
>>>>>=20
>>>>> I fear we've run out of time for this year if we want all =
interested
>>>>> parties to be able to attend.  I'll be off on PTO from end of this
>>>>> week until the new year, and I know alot of folk are doing =
similar.
>>>>=20
>>>> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
>>>>=20
>>>> Jan 11th works for me!
>>>>=20
>>>> Thanks,
>>>> Edgar
>>>=20
>>=20
>> Regards,
>> Daniel


