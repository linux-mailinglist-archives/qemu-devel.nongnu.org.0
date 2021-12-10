Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76DA47031C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:48:55 +0100 (CET)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhCg-0006Te-TT
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mvh6m-0005Ln-98
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:42:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.burton@greensocs.com>)
 id 1mvh6a-0002S6-Le
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:42:39 -0500
Received: from smtpclient.apple (lfbn-bor-1-1317-97.w193-250.abo.wanadoo.fr
 [193.250.130.97])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B4E6320780;
 Fri, 10 Dec 2021 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1639147353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgqYUsKVKfmbO8WMp3lBK8hr45Js6uvwcnvJ802CPGY=;
 b=P6hWO2IS60yAzFIXDhh7rzz1J2V4P1tRSwLOokgcDT+69EttoN8nbCokUy0cKkDhhENOoo
 UYQoATDwT/Y7yaFVWmrNcRdyLRK+GNeKae1DXHxkgw7BqIOUOzDpz/4i3h/bICbOccLPc5
 Nz6K0d+U2AdUppXuFQ01C+cR4anwOBw=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Redesign of QEMU startup & initial configuration
From: Mark Burton <mark.burton@greensocs.com>
In-Reply-To: <YbNjsq6hUWSIDtVt@redhat.com>
Date: Fri, 10 Dec 2021 15:42:33 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <12CD36FC-84C5-4DC2-8066-DB8CACA6CF3C@greensocs.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <YbM5Q+gq89rWoPt8@redhat.com>
 <A220E257-3378-4E43-86B6-4ED84E3CA3E8@greensocs.com>
 <YbNjsq6hUWSIDtVt@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 10 Dec 2021, at 15:26, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Fri, Dec 10, 2021 at 03:15:50PM +0100, Mark Burton wrote:
>>=20
>>=20
>>> On 10 Dec 2021, at 12:25, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>>>=20
>>> On Fri, Dec 10, 2021 at 09:34:41AM +0100, Paolo Bonzini wrote:
>>>> On 12/9/21 20:11, Daniel P. Berrang=C3=A9 wrote:
>>>>>>   They still need to bootstrap a QMP monitor, and for that, CLI =
is fine
>>>>>>   as long as it's simple and stable.
>>>>=20
>>>> I would go a step further and say that the QMP monitor socket =
should be
>>>> created by whoever invoked QEMU and passed down via systemd's =
socket
>>>> activation protocol, with a fallback to stdin/stdout.
>>=20
>> Could we take one more small step =E2=80=A6.=20
>> (Sorry - I=E2=80=99m sure you=E2=80=99ll all hate me for pointing at =
the elephant in the room=E2=80=A6.)
>>=20
>> Why should QEMU itself handle this? You may want to use systemd
>> socket activation, I may be happier with a different approach.
>> The commonality is surely at the level of the underlying QAPI.
>> Being able to build QEMU as a =E2=80=A6.. library, with a single =
entry
>> point to access the QAPI would allow the QEMU community to focus
>> on it=E2=80=99s key =E2=80=98kernel=E2=80=99, while others are able =
to propose integrated
>> solutions like activation through systemd an/or whatever libvirt
>> does etc etc=E2=80=A6. By all means there can be a systemd-qemu =
project=E2=80=A6.
>> But does that have to be baked into QEMU?
>=20
> Systemd activation doesn't really tie QEMU into systemd at
> all. The socket passing scheme is trivial and both sides are
> easily implemented by any application. It is reasonable to
> use in QEMU on any UNIX platform at least. Windows is probably
> the only complication here.
>=20
>> I know there=E2=80=99s a history on the use of the =E2=80=9CLibrary=E2=80=
=9D word - equally
>> there is a notion of a library needing a static interface etc - I
>> propose we agree upon a single access mechanism to the QAPI - who=E2=80=
=99s
>> existence and stability we have already (I think) agreed upon.
>=20
> A stable/static interface is not hard - it doesn't require all
> that much more than exposing a few APIs related to input and
> output of QAPI based JSON docs. This all exists already, you
> wwould just get skipping thue sockets serialization of QMP.
>=20

Yes - good - seems we agree on that part :-)

> The biggest stumbling block for QEMU as a library is actually
> the licensing mess. Too much of our code is GPLv2-only, which
> makes it impractical to use as a library in too many use cases.
> Any app that is not GPLv2-only compatible would have to isolate
> QEMU in its own process and talk to it over RPC, at which point
> it has just reinventing QMP again.

To be clear I am not suggesting that we touch, in any way, the license. =
Stipulating that the application that uses QEMU is GPLv2 is FINE with =
me. All I=E2=80=99m saying is that If you want to put it in a different =
process - the way you do that (QMP or other) is then your choice.

Cheers
Mark.


>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20


