Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB6831CF69
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:44:55 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC4P8-0007Lu-TY
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lC4Nv-0006uT-Rv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lC4Nt-0001h1-Jj
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 12:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613497414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGC+NlBSdWCESYlQ+8gmljNbGxBtLNx988BKCr4u4UY=;
 b=Rft87T45vEN8uz6QSu7GalB7+pkO250hE42Zxoc5XmvYifPPzf9/w4cLOlE2fvwIc/aNKM
 rhv0uLGRcogiHj9mYCJgILkfb6eINhbNoKR0g3TG52RuJV2bSzzuxgtqkELA5RW007WWnS
 iAfV6gHYhT4eWYrJzTP6RTg5kBPN2Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-cYdmCzMVNqOIbVxBG_2iug-1; Tue, 16 Feb 2021 12:43:29 -0500
X-MC-Unique: cYdmCzMVNqOIbVxBG_2iug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E938F107ACE4;
 Tue, 16 Feb 2021 17:43:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFFB41349A;
 Tue, 16 Feb 2021 17:43:21 +0000 (UTC)
Date: Tue, 16 Feb 2021 12:43:19 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 20/20] tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Message-ID: <20210216174319.GA168121@localhost.localdomain>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-21-marcandre.lureau@redhat.com>
 <87ft1wt1dv.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ft1wt1dv.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 04:34:06PM +0000, Alex Benn=E9e wrote:
>=20
> marcandre.lureau@redhat.com writes:
>=20
> > From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> >
> > This will check virtio/vhost-user-vga & virgl are correctly initialized
> > by the Linux kernel on an egl-headless display.
> >
> > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/acceptance/virtio-gpu.py | 161 +++++++++++++++++++++++++++++++++
> >  1 file changed, 161 insertions(+)
> >  create mode 100644 tests/acceptance/virtio-gpu.py
>=20
> This failed when I got to master:
>=20
>   2021-02-16 14:33:46,266 qmp              L0255 DEBUG| >>> {'execute': '=
qmp_capabilities'}
>   2021-02-16 14:33:46,441 machine          L0385 DEBUG| Error launching V=
M
>   2021-02-16 14:33:46,441 machine          L0387 DEBUG| Command: './qemu-=
system-x86_64 -display none -vga none -chardev socket,id=3Dmon,path=3D/var/=
tmp/avo_qemu_sock_xy9ndjnm/qemu
>   -29492-monitor.sock -mon chardev=3Dmon,mode=3Dcontrol -chardev socket,i=
d=3Dconsole,path=3D/var/tmp/avo_qemu_sock_xy9ndjnm/qemu-29492-console.sock,=
server=3Don,wait=3Doff -serial chardev:
>   console -cpu host -m 2G -machine pc,accel=3Dkvm -device virtio-vga,virg=
l=3Don -display egl-headless -kernel /home/alex.bennee/avocado/data/cache/b=
y_location/892ae21f3ae7d04994d8
>   1e1c0bf204ecebe555bb/vmlinuz -initrd /home/alex.bennee/avocado/data/cac=
he/by_location/892ae21f3ae7d04994d81e1c0bf204ecebe555bb/initrd.img -append =
printk.time=3D0 console=3DttyS0
>    rdinit=3D/bin/bash'
>   2021-02-16 14:33:46,441 machine          L0389 DEBUG| Output: "qemu-sys=
tem-x86_64: -device virtio-vga,virgl=3Don: Property 'virtio-vga.virgl' not =
found\n"
>   2021-02-16 14:33:46,441 stacktrace       L0039 ERROR|
>=20
> I'm going to assume this is because the beefy server I was building on
> didn't have the VirGL headers to enable this feature. In lieu of feature
> probing you might have to do what I did for the plugins test:
>=20
>         try:
>             vm.launch()
>         except:
>             # TODO: probably fails because plugins not enabled but we
>             # can't currently probe for the feature.
>             self.cancel("TCG Plugins not enabled?")
>=20
>

While this pattern is indeed an improvement over test errors, checking
for "build time features" is far from a new testing requirement, and
its still not properly solved.  A long time ago I proposed a way to
look at the Makefile variables during test time, but it had a number
of shortcomings.  I guess it's now time to revisit this issue.

First, I'm a strong believer in limiting the *probing* that the test itself
does with regards to build time features.  The probing and authoritative
information should already be with the build system.  I'm pretty sure that
meson makes it easy to grab that kind of information.

Once it's understood and agreed that the build system will provide
that information, the question becomes whether tests will get that
information from the build system (and thus require a build tree) or
if that information will be persisted in the QEMU binary and be
available for introspection.

Thoughts? Does this sound like something other people would be
interested in?

Regards,
- Cleber.

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsBDUACgkQZX6NM6Xy
CfNBAw/+OwfQ1tIE8FoqlxxEn0XqjfGJmDdGO96UldlIt4DEi957L8mujVdMlwiY
FDG66gU9B1aknLKDOIQ+11HvmWO4WMuNsh2VzG/fzTrj09oocwJcbz8AKSBj4UnJ
goXQdQX+Qjx4Xw1oUV8C3Z+wWzdNmeW91WVm5OvBmiMra9OQDQU3OWgnsrulZeQU
1GD+/EQny1lvjZb3NxgjdJgYN1Id14pza5mvU2nJTf0ZcevB1NCuOOPOqj9bg2jW
21Ae1aGc6b9tLRaonuEoyI/oVyc2nmvfsg2Vvzkrq8sGlWugYMyOuXCls9Go/k4C
gY3VzILg4G1hMSK1wAxleYwanBT9MuPPlGZgxLqputCrcroSFEVCYCBRHLglu7IO
gBHPZrsi5OQiVqUZyFbw1s2PXvCqaCgwJg9sz46olF4w+R/yLZ8wCaPAhX3ZSQFa
MNge8ENQj7S9plwAuYMVJ+UY4HykZXnsgONKCwqjjDdZffLeYckTMwZoID5M+Mvs
HyQvjEvolSe51a1iK/sSU28lsGzCxftuY8+FB5LjNneowkZcBAPFIM9+nUpQY1VV
8zAb3sMygpGtYNDtjY6F8bLFYPL6Ue/nYW4FCr3jbGjsG8+6jzgm1NZE2bJNoi6D
113tnMZyxGjj2ncTNoFxbwQV0P/4MeI07USKp0z8DnJxMoSQ3yY=
=xQkk
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


