Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BC2F2D6A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:09:27 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHYE-0002bH-O8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzGzU-0004s7-Tr
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:33:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kzGzT-0007jw-53
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610447610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3p2EeBb6UokiXcIxrPUVWv6eCpQyRCKjieSwlmFh2kE=;
 b=gulzhzYiMIP4EGnkp4hEJAWgjT7XrNKvtuvg/dKe4lBXTfiX+sbfwQMWv0BsFl3zkuifMK
 q8SawjEwCpCIsbl6qXYO8GcC0DQymt83SICh/HGTnymkKQP8kimJWvErlv3htrMmn9R1vG
 +3KClUzJ3XcGEiTB3JhkaRxDYefakkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-L9V4VDKBPVOcyTHxb4csJg-1; Tue, 12 Jan 2021 05:33:25 -0500
X-MC-Unique: L9V4VDKBPVOcyTHxb4csJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D408049C2;
 Tue, 12 Jan 2021 10:33:24 +0000 (UTC)
Received: from localhost (ovpn-115-99.ams2.redhat.com [10.36.115.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE3D9779CE;
 Tue, 12 Jan 2021 10:33:17 +0000 (UTC)
Date: Tue, 12 Jan 2021 10:33:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] .github: point Repo Lockdown bot to GitLab repo
Message-ID: <20210112103316.GC194658@stefanha-x1.localdomain>
References: <20210111115017.156802-1-stefanha@redhat.com>
 <20210111115017.156802-2-stefanha@redhat.com>
 <20210111115149.GC1172772@redhat.com>
 <0db7e143-d31b-c067-716c-6a82fad60383@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0db7e143-d31b-c067-716c-6a82fad60383@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 08:49:55AM +0100, Thomas Huth wrote:
> On 11/01/2021 12.51, Daniel P. Berrang=E9 wrote:
> > On Mon, Jan 11, 2021 at 11:50:12AM +0000, Stefan Hajnoczi wrote:
> > > Use the GitLab repo URL as the main repo location in order to reduce
> > > load on qemu.org.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >   .github/lockdown.yml | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/.github/lockdown.yml b/.github/lockdown.yml
> > > index 9acc393f1c..07fc2f31ee 100644
> > > --- a/.github/lockdown.yml
> > > +++ b/.github/lockdown.yml
> > > @@ -10,8 +10,8 @@ issues:
> > >     comment: |
> > >       Thank you for your interest in the QEMU project.
> > > -    This repository is a read-only mirror of the project's master
> > > -    repostories hosted on https://git.qemu.org/git/qemu.git.
> > > +    This repository is a read-only mirror of the project's repostori=
es hosted
> > > +    at https://gitlab.com/qemu-project/qemu.git.
> >=20
> > NB this URL triggers a redirect to strip the .git suffix
> >=20
> >            https://gitlab.com/qemu-project/qemu
>=20
> If you try to do:
>=20
>  git clone https://gitlab.com/qemu-project/qemu
>=20
> You get this warning message instead:
>=20
>  warning: redirecting to https://gitlab.com/qemu-project/qemu.git/
>=20
> So I think the patch is fine.
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Same here. https://gitlab.com/qemu-project/qemu.git clones without
warnings here. https://gitlab.com/qemu-project/qemu clones with a
warning, so I think we should leave the patch unchanged.

Stefan

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/9euwACgkQnKSrs4Gr
c8h9OAf8DZbRdYNCRkpWYZcG6k9qITbwlxqbr6iG9FS2SYdjAoUcsW6NH6wgj1mZ
9/6zoPI2Z/Os5EEvlMZNQb9FnkQxO0EjooOpafwI1hS9Z/7g++x8GZMjqZ8tXpkO
sLJyd/sh5jTiTvXkcK+KjU9PNwcuEzKEG1sDVWgeVcZJwOH7GM/z1R7RSqk7jujj
E00IlqvFP6czWk3h6QNUnseaoepYe0321SA/HO/18X74YUh3WC9hnJivbrf7oEJT
Lu0+q4vBVeQ/YPA05GexjIJyHolcuroI2RwynzCqvHPSQQjEJYxyQYmza4/+HkGe
phwkdRrnS8627v8LzBjRosuv6dQO4Q==
=8NKO
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--


