Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF1632835B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:18:17 +0100 (CET)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlFQ-00009j-VS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlBK-0003Us-1H
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:14:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGlBE-0003pc-66
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fedXA+Dil1DGolBjcw9j9Y6oUVui3JR8flzQEcLE2Zs=;
 b=LtoDqlsvRybpaGgCcHe1QhUJpguPutWzQUF37EWguacFefwSYETPWdrdG5dK30b+yLcMzO
 wCrnAkuQLHRZR4xfHHa0yNt3V8EUsg1ynnS9FQJY50YauKB/CCnOMAo7e21OEkMpFl4m8W
 UiW/3N3yVQKAR9KCiWOSu9lbmePt+qA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-OGOruQkkMnSy10PkQVAVYQ-1; Mon, 01 Mar 2021 11:13:37 -0500
X-MC-Unique: OGOruQkkMnSy10PkQVAVYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67B58801977;
 Mon,  1 Mar 2021 16:13:35 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 107D919C45;
 Mon,  1 Mar 2021 16:13:34 +0000 (UTC)
Date: Mon, 1 Mar 2021 16:13:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] docs: move CODING_STYLE into the developer documentation
Message-ID: <YD0Srpx+1PNX2Fi5@stefanha-x1.localdomain>
References: <20210223095931.16908-1-alex.bennee@linaro.org>
 <CAFEAcA-v51sgBiNs5hpHwyQx0X=rYdmaWYPesJ0pGy=+ufyi4w@mail.gmail.com>
 <2ee6c3b3-7b90-e10c-8950-bfd07c963558@redhat.com>
 <5a1c4191-b0e6-8dcf-d5db-7335b5f41628@redhat.com>
 <87lfbe51oy.fsf@linaro.org>
 <YDZDSY3G9+KpgJsE@stefanha-x1.localdomain>
 <YDZETVhPKm7H2My2@redhat.com>
 <YDZv9ROdREeN5o5u@stefanha-x1.localdomain>
 <YDZx1WEpMPGZB+b9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YDZx1WEpMPGZB+b9@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yu59N3YRzIXOLjp7"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yu59N3YRzIXOLjp7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 03:33:41PM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Feb 24, 2021 at 03:25:41PM +0000, Stefan Hajnoczi wrote:
> > On Wed, Feb 24, 2021 at 12:19:25PM +0000, Daniel P. Berrang=E9 wrote:
> > > On Wed, Feb 24, 2021 at 12:15:05PM +0000, Stefan Hajnoczi wrote:
> > > > On Tue, Feb 23, 2021 at 01:37:45PM +0000, Alex Benn=E9e wrote:
> > > > >=20
> > > > > Philippe Mathieu-Daud=E9 <philmd@redhat.com> writes:
> > > > > > Or even better since we have a job pushing to Gitlab pages
> > > > > > accessible on https://qemu-project.gitlab.io/qemu/:
> > > > > >
> > > > > > https://qemu-project.gitlab.io/qemu/devel/style.html
> > > > > >
> > > > > > Maybe the https://www.qemu.org/docs/ redirect should
> > > > > > go to gitlab page now?
> > > > >=20
> > > > > It could do either, I think the result is exactly the same.
> > > >=20
> > > > Standarizing project infrastructure on GitLab CI seems good to me. =
That
> > > > way developers will be able to reuse their CI knowledge and won't h=
ave
> > > > to learn other systems (like readthedocs).
> > > >=20
> > > > However, I don't see .gitlab-ci.yml directives that build the docs =
and
> > > > publish a static page yet. Is anyone volunteering to do this? (It c=
an be
> > > > done as a separate step from this patch.)
> > >=20
> > > The very last job (called 'pages') in .gitlab-ci.yml does this.
> >=20
> > Awesome! I have updated the qemu.org HTTP redirect to GitLab:
> >=20
> >   https://qemu.org/docs/master/
> >=20
> > If anyone wants to discuss RTD vs GitLab docs hosting more, please go
> > ahead. We can change the redirect again in the future, if necessary.
>=20
> The downside with using a HTTP redirect is that user's still see the
> particular hosting choice. So they are liable to bookmark these
> links which will  break if we move again.
>=20
> Paolo had proposed a patch to rsync the CI content directly onto
> qemu.org:
>=20
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04629.html

That sounds good too.

Stefan

--yu59N3YRzIXOLjp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9Eq0ACgkQnKSrs4Gr
c8iVmggAgUaMJSh+/2fi//w3eCKDTzsI8qp9DolFcZJBlC4zRR2cReF8sn6oooit
GkAAf28LrWxtMFd/232jXNw9fhGyGPeyoE1LixIyvgVHqiXv9ED7NeZB/7o2xUmQ
1+Mc6wdov7zf4d1d6ftsh/dXvAdQ6R07pyxp7NGRwO2BZBOkJyOp7s/Ajr6WCL8F
itvN3dpkBurt/OOFFuouRNe4QUpPZcIvXTxCBFtrGAaUHqDxBSrftoNDlo35zsYc
I3yCzUP0/j5Ild/DSTCZq3PV3JB7kCR7Z6Z5fvIykdT8hhDzWSAA0ENvcSsQ1od4
/erKKCOFyyTjCWJya6+Pe3hW6ddong==
=FCT+
-----END PGP SIGNATURE-----

--yu59N3YRzIXOLjp7--


