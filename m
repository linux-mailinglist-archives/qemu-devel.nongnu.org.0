Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43594ADA6B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:53:08 +0100 (CET)
Received: from localhost ([::1]:34982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQva-0004FS-Hf
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:53:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1nHP2r-00032p-QQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:52:30 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:60852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1nHP2h-0004AJ-Cu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:52:29 -0500
Received: from smtpclient.apple (unknown [54.37.16.242])
 by beetle.greensocs.com (Postfix) with ESMTPSA id AD6872076B;
 Tue,  8 Feb 2022 11:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644321135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfI8K6/zeBXK1id4ST9g7U4Oyay9AbNlCOiv/P+2Zx8=;
 b=PBOa1bS0YYLFPTy5ZsEXwOObRWth+Gkg3R2eJxDlhY0+jArboGux5EMvUoaK+N2A4F5qXP
 lWEqrBzK5xW9vaidl6I89RDz/MWQk452/VJ8AdpOBEqtpRrbAMv6ZLnQVhUCFAKAYqE1hN
 VG2Sj5kdVvwYWoghffPMo3XSsRPkuws=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: "Startup" meeting (was Re: Meeting today?)
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <874k5srsiz.fsf@secure.mitica>
Date: Tue, 8 Feb 2022 12:52:08 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <38067656-7C95-4CA2-8860-1E5E37CDCDA9@greensocs.com>
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
 <D36E42AD-05A6-4139-8647-07C9CEF3D659@greensocs.com>
 <87h79sw64t.fsf@secure.mitica>
 <b3d70518-256d-2bd0-5979-ff96a1154fd1@amsat.org>
 <874k5srsiz.fsf@secure.mitica>
To: Juan Quintela <quintela@redhat.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Hedde <damien.hedde@greensocs.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Juan, is there a meeting today? I think the plan was to talk about =
=E2=80=99startup=E2=80=99 itself ?
Cheers
Mark.


> On 25 Jan 2022, at 11:58, Juan Quintela <quintela@redhat.com> wrote:
>=20
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>> On 1/25/22 09:50, Juan Quintela wrote:
>>> Mark Burton <mark.burton@greensocs.com> wrote:
>>>> All, I believe we will have a followup meeting this coming Tuesday
>>>> 25th January, at 15:00 (presumably using the same link:
>>>> https://redhat.bluejeans.com/5402697718).
>>>>=20
>>>> We (GreenSocs/Xilinx) would like to quickly show what now =
=E2=80=98works=E2=80=99, and to give an update on the patches.
>>>=20
>>> I send the call for agenda already.
>>>=20
>>> We are having the meeting.
>>=20
>> Do we need to stick to bluejeans, or can we switch to something more
>> generic to easily record the call, and be able to start when Juan is
>> not available?
>=20
> Hi
>=20
> Anyone from inside Red Hat can start the call.  So I think that =
starting
> the call shouldn't be a problem.
>=20
> If I remember correctly, one of the reasons for using bluejeans was =
that
> in the past we used to be around 40 people on the call, and that was =
not
> easy to setup.  Perhaps today it is different.
>=20
> About recording, I will ask everybody if they agree on the call and we
> can record it.  On the past we _didn't_ want recordings, but I can't
> remember the reason.
>=20
> Later, Juan.
>=20


