Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2411777A1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 14:46:24 +0100 (CET)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j97sN-0002mD-89
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 08:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1j97r4-0001xo-JZ
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 08:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1j97r1-0005u1-Vg
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 08:45:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59945
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1j97r1-0005sJ-Rm
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 08:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583243098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeXQSDLtErqfaNiThSTWKnXlzOiYPY8RyvMS9UWoZSU=;
 b=IlXI4XW0I6QkEtsuhUAJfyOO5BW3WJZVDfeBgCUsn9yFchsiadb/xVtJwyf93+gkpetzuw
 HjFVpEncCgVs9Ia2mmF8N8dI9fL9ZGQazCn3L8x+EeB8X6HkqE66VaRmnd9XqAz+emvsX2
 ICZsnDGoaVl/UjOqOJBe6TEWZMJElyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-tE4OgA6ANKCQQzmTHRAWpA-1; Tue, 03 Mar 2020 08:44:55 -0500
X-MC-Unique: tE4OgA6ANKCQQzmTHRAWpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A370B18C43C1;
 Tue,  3 Mar 2020 13:44:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727805D9C9;
 Tue,  3 Mar 2020 13:44:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AA5B1809565;
 Tue,  3 Mar 2020 13:44:53 +0000 (UTC)
Date: Tue, 3 Mar 2020 08:44:52 -0500 (EST)
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <810018352.9991598.1583243092838.JavaMail.zimbra@redhat.com>
In-Reply-To: <c6f8e8b0-e391-67a7-4fcb-b88464285f65@redhat.com>
References: <20200302180937.24148-1-alex.bennee@linaro.org>
 <c6f8e8b0-e391-67a7-4fcb-b88464285f65@redhat.com>
Subject: Re: [PATCH] tests/acceptance: move @skipUnless decoration to test
 itself
MIME-Version: 1.0
X-Originating-IP: [10.10.123.15, 10.4.195.17]
Thread-Topic: tests/acceptance: move @skipUnless decoration to test itself
Thread-Index: HjJDUGQTkUIbgIpFxnEwQOKYLdXgCg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Aleksandar Markovic <amarkovic@wavecomp.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
> To: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>, qemu-devel@nongnu.org
> Cc: "Aurelien Jarno" <aurelien@aurel32.net>, f4bug@amsat.org, "Aleksandar=
 Markovic" <amarkovic@wavecomp.com>
> Sent: Monday, March 2, 2020 1:14:31 PM
> Subject: Re: [PATCH] tests/acceptance: move @skipUnless decoration to tes=
t itself
>=20
> On 3/2/20 7:09 PM, Alex Benn=C3=A9e wrote:
> > It appears ignore the decoration if just applied to the class.
>=20
> Odd I remember testing this, this might be a feature supported by a
> newer Avocado version than the one available on Travis-CI.
>=20
> >=20
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   tests/acceptance/machine_mips_malta.py | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/tests/acceptance/machine_mips_malta.py
> > b/tests/acceptance/machine_mips_malta.py
> > index 92b4f28a112..b8fac2a44d5 100644
> > --- a/tests/acceptance/machine_mips_malta.py
> > +++ b/tests/acceptance/machine_mips_malta.py
> > @@ -30,14 +30,14 @@ except ImportError:
> >       CV2_AVAILABLE =3D False
> >  =20
> >  =20
> > -@skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
> > -@skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
> >   class MaltaMachineFramebuffer(Test):
> >  =20
> >       timeout =3D 30
> >  =20
> >       KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> >  =20
> > +    @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
> > +    @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
> >       def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
> >           """
> >           Boot Linux kernel and check Tux logo is displayed on the
> >           framebuffer.
> >=20
>=20
> Unfortunately you have to also add it to the 7/8cores tests.
>=20
>=20
>=20

This is true of Avocado < 76.0, but on 76.0 you can decorate the
class too:

https://avocado-framework.readthedocs.io/en/76.0/releases/76_0.html#users-t=
est-writers

Maybe replace this patch and bump Avocado's version?

- Cleber.


