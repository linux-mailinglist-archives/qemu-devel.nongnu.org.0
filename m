Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0734EA2A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:21:07 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFEw-0006zb-Fh
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRF8C-000100-Ek
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:14:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRF8A-0007cw-QL
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4FyFJ2vWfmQ/+UTkXjTUM/thmbaTnXHRGcmHheChgDU=;
 b=HnYlGL87r6zCe1oriDB1LkxZR2kbaK7ma0a0cj0OJB77gRjYPG5o5HlO+Mg2f39MosT0oE
 iEO3zYJzTqZ5ZdBrpnaxB3GYr3plkOptdgIzr0F2tC+W4mqF4qKyDzjuSjq44N+pGLFfi6
 NrnLA+3hylGq475KKdaXfUODAc8lJAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-Ezl-OtKUPhKntCCMi60Nog-1; Tue, 30 Mar 2021 10:14:01 -0400
X-MC-Unique: Ezl-OtKUPhKntCCMi60Nog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AC691083E82;
 Tue, 30 Mar 2021 14:14:00 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5A377217B;
 Tue, 30 Mar 2021 14:13:56 +0000 (UTC)
Date: Tue, 30 Mar 2021 15:13:55 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGMyIxXn6QgBJNqJ@stefanha-x1.localdomain>
References: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PFVBJm/WuuJYtRqW"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PFVBJm/WuuJYtRqW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 01:55:48PM +0200, Thomas Huth wrote:
> On 30/03/2021 13.19, Daniel P. Berrang=E9 wrote:
> > On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
> > > Hi,
> > > I wanted to follow up with a summary of the CI jobs:
> > >=20
> > > 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
> > > 2. Builds - ~50 minutes/job x 61 jobs
> > > 3. Tests - ~12 minutes/job x 20 jobs
> > > 4. Deploy - 52 minutes x 1 job
>=20
> I hope that 52 was just a typo ... ?

No, but I think Dan already found this issue a little while ago. The
deploy job uses "make install":

  # Prepare for GitLab pages deployment. Anything copied into the
  # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
  pages:
    image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
    stage: test
    needs:
      - job: build-tools-and-docs-debian
    script:
      - mkdir -p public
      # HTML-ised source tree
      - make gtags
      - htags -anT --tree-view=3Dfiletree -m qemu_init
          -t "Welcome to the QEMU sourcecode"
      - mv HTML public/src
      # Project documentation
      - make -C build install DESTDIR=3D$(pwd)/temp-install
      - mv temp-install/usr/local/share/doc/qemu/* public/
    artifacts:
      paths:
        - public

Do we have/need a docs-only install target?

Stefan

--PFVBJm/WuuJYtRqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjMiMACgkQnKSrs4Gr
c8hq2gf+IkokRUZu6DttvPD6Z+qD8fdWdTIx+hEIgbIHlgMJH2kqTZL/WayhFTz1
ypHftUi6tWh555DscC/jEaKHLwlOr322CasxUItI6ThN79/trIdMXyA54GHQqL4T
PcZuYCu5a2PZwObwF1gfJ1cnVUttYjvNXzu9Mi8Sz7mIyaI/q8ocdhRJnyLOy6q/
JMPxJpfFoeQM+45ikekC2SqdIbGoWQoBAMpTn31O3UQ+IQzCk6f7H6pHBlVL/9S3
KxQYP9/fAN2p6sugQQ4aI0fRhGWhb6CT5TD8dJ4r3eb4bZNqWUgKO6tbNgoUi2CL
nK2ZDKkPjH+U6YG5n1BesNTuI8nLew==
=f5Gy
-----END PGP SIGNATURE-----

--PFVBJm/WuuJYtRqW--


