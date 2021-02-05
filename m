Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DD310DC1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:20:16 +0100 (CET)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83qB-0002PW-55
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l83oN-0001fY-TL
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l83oM-0002sU-7m
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612541901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IDI7wU+rmpBDnheX3jNSQn43A73Afsmt0QN1h067yDg=;
 b=Vls9+6CJeGn3BuSyBMuXARuIHSeMrlL64cNSCIZsjosyN9XRkelVrxGZMu/K6MlXArTZ4w
 dJxD4SKmCiQ5mTQeGdpxT24fWb/cv5AoK/td9NyNICI6oT4tAWvzVsnGVnkWF2I3dyVgmc
 vPcoc4M3WpusLaw+1T0mXANfnoBDiZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-qt4kI16BOoacHpQJgMA-dg-1; Fri, 05 Feb 2021 11:18:17 -0500
X-MC-Unique: qt4kI16BOoacHpQJgMA-dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F0E1005501;
 Fri,  5 Feb 2021 16:18:15 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 080E45D9CC;
 Fri,  5 Feb 2021 16:18:08 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:18:08 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena <elena.ufimtseva@oracle.com>
Subject: Re: [PULL v2 00/27] Block patches
Message-ID: <20210205161808.GA416527@stefanha-x1.localdomain>
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
 <20210204184926.GA116253@heatpipe>
MIME-Version: 1.0
In-Reply-To: <20210204184926.GA116253@heatpipe>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 John G Johnson <john.g.johnson@oracle.com>, "Denis V. Lunev" <den@openvz.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 10:49:26AM -0800, elena wrote:
> On Thu, Feb 04, 2021 at 05:35:31PM +0000, Peter Maydell wrote:
> > On Thu, 4 Feb 2021 at 15:43, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> > >
> > > The following changes since commit db754f8ccaf2f073c9aed46a4389e9c0c2=
080399:
> > >
> > >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-2021=
0202' into staging (2021-02-03 19:35:57 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> > >
> > > for you to fetch changes up to abe42229db7b87caa11b3c02835ebf9d384e0b=
d4:
> > >
> > >   docs: fix Parallels Image "dirty bitmap" section (2021-02-04 15:17:=
10 +0000)
> > >
> > > ----------------------------------------------------------------
> > > Pull request
> > >
> > > v2:
> > >  * Rebase to resolve memory_region_init_ram_from_file() conflict due =
to the new
> > >    offset argument that was added in qemu.git/master in the meantime =
[Peter]
> > >
> > > ----------------------------------------------------------------
> >=20
> > Fails to compile, clang:
> >=20
> > ../../hw/remote/mpqemu-link.c:40:29: error: suggest braces around
> > initialization of subobject [-Werror,-Wmissing-braces]
> >     struct iovec send[2] =3D {0};
> >                             ^
> >                             {}
>=20
> Stefan, should we make changes for the patch?

I'll send another revision of this pull request since it's a trivial
fix.

Thanks,
Stefan

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAdb78ACgkQnKSrs4Gr
c8j3/QgAwV8I8KVZxJME1DlbTWKdzvDTzQEgKMk0ZMUZiaE0TxXVVL5n8yDvJbJ2
hphA1zb+NvvHfcxi6x6M3GOY6Ps9BlKUG+evXasqUEYoPvLjvxsMJh4H4AGmVIuT
4yPkICKXdKLpDpLq1nqHs5ip+JvqEBi+CADFn2FLSrpGEPt5W4JRQ9I4K877Cf5M
Im7+BBBK1Vj+tqCeu4r8yrMjnR0W14D7loZ8MNqh2x1JtFdb0mjldM9D5S7ty0Xg
CkQFmawxHmY3Jhp280M88jlbVNnU7k0OCupJxLKsPGLdQ9LbaGrzriXCyDkgSs/b
KRUggnAFJhzNz0HBI0tZ3zd3/APGRg==
=GeYH
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--


