Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754F952D1A2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:40:58 +0200 (CEST)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nreWN-0006nJ-Rx
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreLi-0000Ie-U2
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nreLh-0002be-7h
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652959784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHUVTNY086Mjq705wRBwIU6qLJvp6k0zDBGbDgfdBu0=;
 b=GcBDlKUpYLok4SmJXp20DtmQqq7dLeDj/RMmwqwxH1NZGml22oLoE7wbyXaWGZYVIu6IAe
 QQpzmojm4Fox6qya/zRJ2u+/N9QP35GrtjzSlnp/A2wgcksyae/IAl3ux0ekix72PV164S
 VlfF96wLw2asYYfxIWnZH+qhHs4IZnU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-4dcIqlbzPRy_Cn5XRo2Q7g-1; Thu, 19 May 2022 07:29:43 -0400
X-MC-Unique: 4dcIqlbzPRy_Cn5XRo2Q7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2590802803;
 Thu, 19 May 2022 11:29:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 664BE40C1421;
 Thu, 19 May 2022 11:29:42 +0000 (UTC)
Date: Thu, 19 May 2022 12:29:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Message-ID: <YoYqJbeTyTGgMIHe@stefanha-x1.localdomain>
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
 <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EjTA/szm0TjdRxV3"
Content-Disposition: inline
In-Reply-To: <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--EjTA/szm0TjdRxV3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 08:29:09AM +0200, Thomas Huth wrote:
> On 18/05/2022 18.12, Richard Henderson wrote:
> > On 5/18/22 02:04, Thomas Huth wrote:
> > > =A0 Hi Richard!
> > >=20
> > > The following changes since commit eec398119fc6911d99412c37af06a6bc27=
871f85:
> > >=20
> > > =A0=A0 Merge tag 'for_upstream' of
> > > git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging
> > > (2022-05-16 16:31:01 -0700)
> > >=20
> > > are available in the Git repository at:
> > >=20
> > > =A0=A0 https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
> > >=20
> > > for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120=
fc:
> > >=20
> > > =A0=A0 capstone: Remove the capstone submodule (2022-05-18 08:54:22 +=
0200)
> > >=20
> > > ----------------------------------------------------------------
> > > * Remove Ubuntu 18.04 containers (not supported anymore)
> > > * Improve the cleanup of the QEMU binary in case of failing qtests
> > > * Update the Windows support statement
> > > * Remove the capstone submodule (and rely on Capstone of the distros =
instead)
> >=20
> > Fails centos-stream-8-x86_64 test,
> >=20
> > Run-time dependency capstone found: NO (tried pkgconfig)
> > ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pk=
gconfig
> >=20
> > https://gitlab.com/qemu-project/qemu/-/jobs/2473935684
>=20
> That's a custom runner ... who has access to that one? Cleber? Stefan? I
> didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...
>=20
> Anyway, somebody needs to install "capstone-devel" on that machine - or we
> need to disable capstone in scripts/ci/org.centos/stream/8/x86_64/configu=
re
> now if the machine can't be changed...

I don't manage a custom CI runner for QEMU.

Stefan

--EjTA/szm0TjdRxV3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKGKiUACgkQnKSrs4Gr
c8imeAgAtUea+5feyF25n0XmIne/+YYPzvj9vUHsk5KRnBypgQfPZymz8qIvf6aR
gRgdB0cuMD9XYTcp/Atm0SMQ930gwX95QGvBj0FfZnfdiCWkNxw40qVRcGYCoK9Q
4l1b26DaFfXeLEBzXH4nnooS8nhe6Omuh7mh1fN5nG4a9ZX4nZKgCQtmMmT0Gopd
zF0IAnaTbOqApptFFU9XwdoBEyKn6aTczD8UHG4iwOMcZBl777pkYzr1rBL9V8WB
QQjL8i/gdvrxyZpzgA7VkH7PI/fj2rQjUJVEqiFm6L6ycXFFY5oxnNfUFVbkcI0t
8kvfcRqb2VC3UmsS5KdwhjcreV5k6Q==
=ifpY
-----END PGP SIGNATURE-----

--EjTA/szm0TjdRxV3--


