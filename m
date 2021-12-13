Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB74735DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 21:26:41 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwruC-0001uA-44
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 15:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mwrq1-0007n2-TW
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:22:21 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mwrpz-0006yV-E9
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 15:22:21 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C533421C28;
 Mon, 13 Dec 2021 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639426935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FwztYzJCJm9hg9c5vMsJKogjS3uQJsNRH3fnes//2G0=;
 b=ePnY1uGvzxguDGOFaJxFgKCnTnZGVrZNwXlju4qwVeATHlinvsxtohvb+hchsE2MRw2BUF
 PIn6dX1yyHPN6Y8cjRPJLY1sXaEhYTdjuyD1WaNg+KMc7JPBlUjDOK/0QIHd+DfuMbO+dG
 cOx9KiwAXGnSQzMmOP7cwwC4w/ePDfc=
From: Mark Burton <mark.burton@greensocs.com>
Message-Id: <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D78613B8-BE2E-4B03-BA4B-E51CC55C1C5E"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
Date: Mon, 13 Dec 2021 21:22:14 +0100
In-Reply-To: <YbeJ/zTV/n+l2CmH@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_D78613B8-BE2E-4B03-BA4B-E51CC55C1C5E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 13 Dec 2021, at 18:59, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> =E2=80=A6. we no longer have to solve everything
> Ourselves.=20

I support this sentiment.

Lets re-factor the code so people can build what they need using an API.
Actually, =E2=80=98QEMU=E2=80=99 only need support the existing CLI, and =
provide a suitable internal API.
If that API was relatively stable, that would help those (few) who =
maintain a different startup mechanism (but its only a =E2=80=99nice to =
have=E2=80=99). (Making that convenient, as Paolo has show, would also =
be =E2=80=99nice to have=E2=80=99).

If Paolo (sorry to pick on you :-) ) wants a pink spotted dog, then - =
surely - let him have it. YES it=E2=80=99s a separate binary. YES it has =
a different CLI=E2=80=A6. So what? It has nothing to do with QEMU =
itself, Paolo can maintain it, out of the QEMU tree. QEMU should not =
attempt to directly support all use cases -  those who have the use case =
should support them. (e.g. We should not be arguing about what JSON =
parsing mechanism to use, how command lines could be better,  or =
configuration languages - thats for the use case provider to worry =
about. )

That leaves us needing a =E2=80=98full=E2=80=99 API. Surely we should be =
arguing about that - what =E2=80=9Cfull=E2=80=9D means, how the QAPI =
should work, specifically how phases should work, etc. How to move QAPI =
forward.

To help, I do think it=E2=80=99s important that we include use cases =
into QEMU (as it stands) in order to build test cases and to effectively =
have the use cases coded; but only as a =E2=80=99step=E2=80=99. The plan =
to refactor needs to be there from the start. [Once refactored, =
=E2=80=98unstable=E2=80=99 features used to demonstrate use cases can be =
removed of course]

Of course, =E2=80=98Refactoring the code=E2=80=99 and getting the CLI to =
work with the =E2=80=98new=E2=80=99 QAPI will be hard  - but each and =
every scheme I=E2=80=99ve seen so far has some pain involved. If we know =
this is the goal, then we can start planning how to get there. (And =
GreenSocs will commit to help if we can).

(Of course, one day, a =E2=80=98use case provider=E2=80=99 might come =
along with the best CLI ever, and the best config language ever, and we =
will all bow down and use it=E2=80=A6. Until that day=E2=80=A6. Can we =
focus on the key for QEMU, providing a =E2=80=98full=E2=80=99 QAPI tat =
can support all use cases (and the existing CLI)).

Cheers
Mark.


--Apple-Mail=_D78613B8-BE2E-4B03-BA4B-E51CC55C1C5E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 13 Dec 2021, at 18:59, Daniel P. Berrang=C3=A9 &lt;<a =
href=3D"mailto:berrange@redhat.com" class=3D"">berrange@redhat.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta=
 charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">=E2=80=A6. we no longer have to solve everything</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
14px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Ourselves.<span =
class=3D"Apple-converted-space">&nbsp;</span></span></div></blockquote></d=
iv><br class=3D""><div class=3D"">I support this sentiment.</div><div =
class=3D""><br class=3D""></div><div class=3D""><font color=3D"#000000" =
class=3D"">Lets re-factor the code so people can build what they need =
using an API.</font></div><div class=3D""><font color=3D"#000000" =
class=3D"">Actually, =E2=80=98QEMU=E2=80=99 only need support the =
existing CLI, and provide a suitable internal API.</font></div><div =
class=3D""><font color=3D"#000000" class=3D"">If that API was relatively =
stable, that&nbsp;would help those (few) who maintain a different =
startup mechanism (but its only a&nbsp;=E2=80=99nice to have=E2=80=99). =
(Making that convenient, as Paolo has show, would also be&nbsp;=E2=80=99ni=
ce to have=E2=80=99).</font></div><div class=3D""><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">If Paolo (sorry to pick on you :-) ) wants a pink =
spotted dog, then - surely - let him have it. YES it=E2=80=99s a =
separate binary. YES it has a different CLI=E2=80=A6. So what? It has =
nothing to do with QEMU itself, Paolo can maintain it, out of the QEMU =
tree. QEMU should not attempt to directly support all use cases - =
&nbsp;those who have the use case should support them. (e.g. We should =
not be arguing about what JSON parsing mechanism to use, how command =
lines could be better, &nbsp;or configuration languages - thats for the =
use case provider to worry about. )</div><div style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br class=3D""></div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D"">That =
leaves us needing a =E2=80=98full=E2=80=99 API. Surely we should be =
arguing about that - what =E2=80=9Cfull=E2=80=9D means, how the QAPI =
should work, specifically how phases should work, etc. How to move QAPI =
forward.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">To help, I do think it=E2=80=99s =
important that we include use cases into QEMU (as it stands) in order to =
build test cases and to effectively have the use cases coded; but only =
as a =E2=80=99step=E2=80=99. The plan to refactor needs to be there from =
the start. [Once refactored, =E2=80=98unstable=E2=80=99 features used to =
demonstrate use cases can be removed of course]</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">Of course, =E2=80=98Refactoring the code=E2=80=99 and =
getting the CLI to work with the =E2=80=98new=E2=80=99 QAPI will be hard =
&nbsp;- but each and every scheme I=E2=80=99ve seen so far has some pain =
involved. If we know this is the goal, then we can start planning how to =
get there. (And GreenSocs will commit to help if we can).</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">(Of course, one day, a =E2=80=98use case provider=E2=80=
=99 might come along with the best CLI ever, and the best config =
language ever, and we will all bow down and use it=E2=80=A6. Until that =
day=E2=80=A6. Can we focus on the key for QEMU, providing a =E2=80=98full=E2=
=80=99 QAPI tat can support all use cases (and the existing =
CLI)).</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0);" class=3D""><br class=3D""></div><div style=3D"caret-color: rgb(0, =
0, 0); color: rgb(0, 0, 0);" class=3D"">Cheers</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Mark.</div></div><div class=3D""><br =
class=3D""></div></body></html>=

--Apple-Mail=_D78613B8-BE2E-4B03-BA4B-E51CC55C1C5E--

