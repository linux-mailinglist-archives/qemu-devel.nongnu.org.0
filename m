Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CB4863BC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 12:29:14 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QxF-0002QX-T6
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 06:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1n5QqU-0000w7-Qd
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:22:15 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1n5QqR-0003fH-Bx
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 06:22:14 -0500
Received: from smtpclient.apple (unknown [54.37.16.242])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A753C20785;
 Thu,  6 Jan 2022 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1641468125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yym0w6QX7BKHUcPMs0Hgk/yOMtZ/yaPGS64FVzKLhEY=;
 b=aFkTOY+uLZ5PdPTTIzqXeo+ut+Oxjf3bqG53/T5w53navjfOqWrHQBE9PdNTNvnSSC2Fih
 2+vL7/rq5ERh1EMiiqpFTR0BqGZJkogK7FpKkBUIYMJ4rIs6tX63mgwrnI/aysfXDa4+/L
 6pFiMNiAeO+WIUrGL01p7zzNmrNSKgs=
From: Mark Burton <mark.burton@greensocs.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1108A576-F24F-46B4-9F2D-4F8BFEE7D793"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: "Startup" meeting (was Re: Meeting today?)
Date: Thu, 6 Jan 2022 12:21:56 +0100
References: <YbJU5vVdesoGuug9@redhat.com> <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <CC132B60-3F08-4F03-B328-4C33407BB944@greensocs.com>
 <87lf0nto1k.fsf@dusky.pond.sub.org> <YbiS8Zc7fcoeoSyC@redhat.com>
 <87bl1jqm1a.fsf@dusky.pond.sub.org>
 <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
In-Reply-To: <CAJy5ezofpy09ZOtVHFofGTzt3U8MEA_ddpBHifuF50sVDFXULA@mail.gmail.com>
Message-Id: <73955990-9FD1-42CD-B476-F2AD95C219E9@greensocs.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=mark.burton@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_1108A576-F24F-46B4-9F2D-4F8BFEE7D793
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Can we confirm the 11th for this meeting?

Cheers
Mark.


> On 4 Jan 2022, at 10:29, Edgar E. Iglesias <edgar.iglesias@gmail.com> =
wrote:
>=20
>=20
>=20
> On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster <armbru@redhat.com =
<mailto:armbru@redhat.com>> wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com =
<mailto:berrange@redhat.com>> writes:
>=20
> > On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster wrote:
> >> Mark Burton <mark.burton@greensocs.com =
<mailto:mark.burton@greensocs.com>> writes:
> >>=20
> >> > I realise it=E2=80=99s very short notice, but what about having a =
discussion today at 15:00 ?
> >>=20
> >> I have a conflict today.  I could try to reschedule, but I'd prefer =
to
> >> talk next week instead.  Less stress, better prep.
> >
> > I fear we've run out of time for this year if we want all interested
> > parties to be able to attend.  I'll be off on PTO from end of this
> > week until the new year, and I know alot of folk are doing similar.
>=20
> Right.  I'll be off from Dec 23 to Jan 9.  Can we all make Jan 11?
>=20
> Jan 11th works for me!
>=20
> Thanks,
> Edgar


--Apple-Mail=_1108A576-F24F-46B4-9F2D-4F8BFEE7D793
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Can =
we confirm the 11th for this meeting?<div class=3D""><br =
class=3D""></div><div class=3D"">Cheers</div><div =
class=3D"">Mark.</div><div class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 4 Jan =
2022, at 10:29, Edgar E. Iglesias &lt;<a =
href=3D"mailto:edgar.iglesias@gmail.com" =
class=3D"">edgar.iglesias@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div dir=3D"ltr" class=3D""><br class=3D""></div><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Dec 14, 2021 at 3:49 PM Markus Armbruster =
&lt;<a href=3D"mailto:armbru@redhat.com" =
class=3D"">armbru@redhat.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Daniel P. Berrang=C3=A9 &lt;<a =
href=3D"mailto:berrange@redhat.com" target=3D"_blank" =
class=3D"">berrange@redhat.com</a>&gt; writes:<br class=3D"">
<br class=3D"">
&gt; On Tue, Dec 14, 2021 at 12:37:43PM +0100, Markus Armbruster =
wrote:<br class=3D"">
&gt;&gt; Mark Burton &lt;<a href=3D"mailto:mark.burton@greensocs.com" =
target=3D"_blank" class=3D"">mark.burton@greensocs.com</a>&gt; =
writes:<br class=3D"">
&gt;&gt; <br class=3D"">
&gt;&gt; &gt; I realise it=E2=80=99s very short notice, but what about =
having a discussion today at 15:00 ?<br class=3D"">
&gt;&gt; <br class=3D"">
&gt;&gt; I have a conflict today.&nbsp; I could try to reschedule, but =
I'd prefer to<br class=3D"">
&gt;&gt; talk next week instead.&nbsp; Less stress, better prep.<br =
class=3D"">
&gt;<br class=3D"">
&gt; I fear we've run out of time for this year if we want all =
interested<br class=3D"">
&gt; parties to be able to attend.&nbsp; I'll be off on PTO from end of =
this<br class=3D"">
&gt; week until the new year, and I know alot of folk are doing =
similar.<br class=3D"">
<br class=3D"">
Right.&nbsp; I'll be off from Dec 23 to Jan 9.&nbsp; Can we all make Jan =
11?<br class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">Jan 11th works for me!</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div class=3D"">Edgar<br =
class=3D""></div></div></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_1108A576-F24F-46B4-9F2D-4F8BFEE7D793--

