Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3205187D7B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 10:55:41 +0100 (CET)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE8wm-0004EH-PI
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 05:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1jE8vW-0002lH-Q8
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1jE8vV-0006kV-LL
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:54:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1jE8vV-0006Xh-G8
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 05:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584438858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjJ47UJEm8nrHIKwp/rnf19reU48jEoAg5NUpVfxZQg=;
 b=ikJsCvHGjUL12fnxYHb8DdVcQA48DYjhr8bOkRXUit4nDSg5Ovd69hbIZLiNKBa6QzlYL7
 GcwRKXvn5xxeg+gzi4XhxFAdzu42wins8pBPHELR5WIHx2FgF4iBdgM8AI4KNL78+IlnMn
 SfohLH/93qhQs65DucE3eEhxrQi+0Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-NS5CNhc6Orm0wlwOkbSeSQ-1; Tue, 17 Mar 2020 05:54:16 -0400
X-MC-Unique: NS5CNhc6Orm0wlwOkbSeSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3CFADB60;
 Tue, 17 Mar 2020 09:54:15 +0000 (UTC)
Received: from localhost (ovpn-114-232.ams2.redhat.com [10.36.114.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 574C394941;
 Tue, 17 Mar 2020 09:54:15 +0000 (UTC)
Date: Tue, 17 Mar 2020 09:54:14 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] tools/virtiofsd: add support for --socket-group
Message-ID: <20200317095414.GC492272@stefanha-x1.localdomain>
References: <20200312104142.21259-1-alex.bennee@linaro.org>
 <20200312104913.GB4089516@redhat.com>
 <CAJ+F1CJWy2gEHHjzqyqnvHFf6EP4mEGABLt4aA7xptkXDwPGiw@mail.gmail.com>
 <20200316103331.GC1528804@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200316103331.GC1528804@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 10:33:31AM +0000, Daniel P. Berrang=E9 wrote:
> On Sat, Mar 14, 2020 at 02:33:25PM +0100, Marc-Andr=E9 Lureau wrote:
> > Hi
> >=20
> > On Thu, Mar 12, 2020 at 11:49 AM Daniel P. Berrang=E9 <berrange@redhat.=
com> wrote:
> > >
> > > On Thu, Mar 12, 2020 at 10:41:42AM +0000, Alex Benn=E9e wrote:
> > > > If you like running QEMU as a normal user (very common for TCG runs=
)
> > > > but you have to run virtiofsd as a root user you run into connectio=
n
> > > > problems. Adding support for an optional --socket-group allows the
> > > > users to keep using the command line.
> > >
> > > If we're going to support this, then I think we need to put it in
> > > the vhost-user.rst specification so we standardize across backends.
> > >
> > >
> >=20
> > Perhaps. Otoh, I wonder if the backend spec should be more limited to
> > arguments/introspection that are used by programs.
> >=20
> > In this case, I even consider --socket-path to be unnecessary, as a
> > management layer can/should provide a preopened & setup fd directly.
> >=20
> > What do you think?
>=20
> I think there's value in standardization even if it is an option targette=
d
> at human admins, rather than machine usage. You are right though that
> something like libvirt would never use --socket-group, or --socket-path.
> Even admins would benefit if all programs followed the same naming for
> these.  We could document such options as "SHOULD" rather than "MUST"
> IOW, we don't mandate --socket-group, but if you're going to provide a
> way to control socket group, this option should be used.

I agree.  It's still useful to have a convention that most vhost-user
backend programs follow.

Stefan

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5wnkYACgkQnKSrs4Gr
c8gfEAgAlIOYHvcSibTyNM3a0mBaciVGPWkvVFZMAl7UwKBHKSRSVWJP9VF0MlPH
19LjzXSopgKBpi5zEHqCH+IYTbYI2QP4jBlsTej9+ElFrTJ/XG6UjAghyjy/hOV1
u/GAEssUNxSIGjeMWE1PmMjf4vjCZcQ+HHjA1VUTR/KanO6irv+bfiw2dnS2i6/9
jPC5NYN5JmUDQmtE0ad0x+5WhCrP+aZ5W211ZJKDIBUoy98VB0vp7l8xw52+btTw
OK7o75IE3asQQGH1XkhPWMBsoU3tpVanthaX4uA77ab1GKNVOyHcpsOFZ+jTe3+o
ff8HcJqoZUMlb4dYgnpZ/9O/IAZcuw==
=hOvd
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--


