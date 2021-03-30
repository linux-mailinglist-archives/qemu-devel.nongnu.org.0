Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A50F34EA12
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:14:45 +0200 (CEST)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRF8m-0000UP-Dp
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRF47-0002wO-3b
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRF3z-000585-7K
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617113386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sR2PucaV/L9kjDh8x9BGCLhvc4nO1JnnuZSY34xZChw=;
 b=JQo0o575GgPdWScDja6nmUtODe8/1p6A7V9qZaepQc4Y+2mtpk8Y0QxUg/y2B8hIuxeOEb
 UMM3lHXi1sdxcAzYRqF7Ao5IL8omxDJ8qcGPry39XFDkvKiKRD3leNAxXx0meEd6sg+qx3
 DAgBSYw92v/HVXvSwgYCr41iVckRSCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-8ZXOYVFpM0qyuOVcoMjVvA-1; Tue, 30 Mar 2021 10:09:41 -0400
X-MC-Unique: 8ZXOYVFpM0qyuOVcoMjVvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472D283DD27;
 Tue, 30 Mar 2021 14:09:40 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE5A75D761;
 Tue, 30 Mar 2021 14:09:21 +0000 (UTC)
Date: Tue, 30 Mar 2021 15:09:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGMxC8tJnKm/J2Nu@stefanha-x1.localdomain>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YGMJSoIGa5VoVDB1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAwCu6TwApouZcZU"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--KAwCu6TwApouZcZU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 12:19:38PM +0100, Daniel P. Berrang=E9 wrote:
> On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:
> > Hi,
> > I wanted to follow up with a summary of the CI jobs:
> >=20
> > 1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
> > 2. Builds - ~50 minutes/job x 61 jobs
> > 3. Tests - ~12 minutes/job x 20 jobs
> > 4. Deploy - 52 minutes x 1 job
> >=20
> > The Builds phase consumes the most CI minutes. If we can optimize this
> > phase then we'll achieve the biggest impact.
> >=20
> > In the short term builds could be disabled. However, in the long term I
> > think full build coverage is desirable to prevent merging code that
> > breaks certain host OSes/architectures (e.g. stable Linux distros,
> > macOS, etc).
>=20
> The notion of "full build coverage" doesn't really exist in reality.
> The number of platforms that QEMU is targetting, combined with the
> number of features that can be turned on/off in QEMU configure
> means that the matrix for "full build coverage" is too huge to ever
> contemplate.

Good point. We will never cover the full build matrix. I do think that
it's important to cover real-world builds, especially ones that tend to
expose issues (e.g. macOS, Windows, stable Linux distros, etc).

> I think a challenges we have with our incremental approach is that
> we're not really taking into account relative importance of the
> different build scenarios, and often don't look at the big picture
> of what the new job adds in terms of quality, compared to existing
> jobs.
>=20
> eg Consider we have
>=20
>   build-system-alpine:
>   build-system-ubuntu:
>   build-system-debian:
>   build-system-fedora:
>   build-system-centos:
>   build-system-opensuse:
>=20
>   build-trace-multi-user:
>   build-trace-ftrace-system:
>   build-trace-ust-system:
>=20
> I'd question whether we really need any of those 'build-trace'
> jobs. Instead, we could have build-system-ubuntu pass
> --enable-trace-backends=3Dlog,simple,syslog, build-system-debian
> pass --enable-trace-backends=3Dust and build-system-fedora
> pass --enable-trace-backends=3Dftrace, etc.=20

Yes, I agree. The trace builds could be collapsed into various other
builds.

> > Traditionally ccache (https://ccache.dev/) was used to detect
> > recompilation of the same compiler input files. This is trickier to do
> > in GitLab CI since it would be necessary to share and update a cache,
> > potentially between untrusted users. Unfortunately this shifts the
> > bottleneck from CPU to network in a CI-as-a-Service environment since
> > the cached build output needs to be accessed by the linker on the CI
> > runner but is stored remotely.
>=20
> Our docker containers install ccache already and I could have sworn
> that we use that in gitlab, but now I'm not so sure. We're only
> saving the "build/" directory as an artifact between jobs, and I'm
> not sure that directory holds the ccache cache.

It seems we're not benefitting much from ccache at the moment since the
build takes 50 minutes. Maybe this is a good area to investigate further
and find out what can be improved.

Stefan

--KAwCu6TwApouZcZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBjMQsACgkQnKSrs4Gr
c8hQ3AgAwHze2S4K3QTWciivZ+LsamFNHl4Ztna9uKo8zja+WbPMrKmHtTUDM+nY
/dTksXGKgSQ0wGZqvJUINv2PXMWSQ6cUPHIZn1VrS87ogjL7AfV8MpFPI/7ndZSU
sMBcjZmXRLBrNKAyFg37IeFYESdnXi8VMxUO39x/OnGWtN98i0v5he88Tv+vjbim
mEnhbz3s6ZTKLISHGVEAQRuZK70cuK99kNurHxyucYeKHxFmysjiZDR1B5v/KKe0
tph8iynuZX6iBnl0ATXGSo1Tf3wwvFkN2tosw2F1iU1l7Na2dAr7mpmt3XmB/Ob+
Pri0nRRDwdMmoFot599lrkyvcVxOPA==
=vdrS
-----END PGP SIGNATURE-----

--KAwCu6TwApouZcZU--


