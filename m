Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB134D22F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:13:12 +0200 (CEST)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQsdj-0006mU-Hj
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQscj-0006Ku-Ta
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lQsch-0005JQ-A4
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617027125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QbXnCpovIZ5xwKTI7qvcocs6L6NzBRUHYgRspjiAyuo=;
 b=I0c+uV3LIwS59WPeeyYGLYkbvtU01BUphYs3xV3sCo/LddHwataz2q357qLnVxqZC9E2NG
 HpE7eCdpnvIi24+sodNcBvWbdvPuJfu9sjeC5OepmEiuerybB7/LLjBQJDwpddhrPe7sJ5
 ywAFAWYy3xJTY528cgmkRUMgW6aIUJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-6CxFVvhOPr2GVr3mQHySmQ-1; Mon, 29 Mar 2021 10:11:57 -0400
X-MC-Unique: 6CxFVvhOPr2GVr3mQHySmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4634910D170C;
 Mon, 29 Mar 2021 14:10:44 +0000 (UTC)
Received: from localhost (ovpn-114-227.ams2.redhat.com [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91E0196E3;
 Mon, 29 Mar 2021 14:10:37 +0000 (UTC)
Date: Mon, 29 Mar 2021 15:10:36 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8YjXQIwmXniMHxmr"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8YjXQIwmXniMHxmr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 12:27:10PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 3/19/21 8:34 AM, Philippe Mathieu-Daud=E9 wrote:
> > On 3/19/21 11:59 AM, Paolo Bonzini wrote:
> > > On 19/03/21 11:18, Andrew Jones wrote:
> > > > > Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minut=
es are
> > > > > on slow machines or if we'll hit the same issue with dedicated ru=
nners.
> > > > > It seems like CI optimization will be necessary...
> > > > >=20
> > > > We need to reduce the amount of CI we do, not only because we can't
> > > > afford
> > > > it, but because it's wasteful. I hate to think of all the kWhs spen=
t
> > > > testing the exact same code in the exact same way, since everyone r=
uns
> > > > everything with a simple 'git push'.
> > > Yes, I thought the same.
> > >=20
> > > > IMHO, 'git push' shouldn't trigger
> > > > anything. Starting CI should be an explicit step.
> > * tests/acceptance: Only run tests tagged 'gating-ci' on GitLab CI
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html
> >=20
> > * gitlab-ci: Allow forks to select & restrict build jobs
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg758331.html
>=20
> In my opinion that series is the first step towards a smart CI. It got so=
me
> reviews of Thomas and myself already but it didn't move ahead. If Philipp=
e
> for some reason cannot continue that work, I'm volunteering to take it ov=
er.

Hi,
I wanted to follow up with a summary of the CI jobs:

1. Containers & Containers Layer2 - ~3 minutes/job x 39 jobs
2. Builds - ~50 minutes/job x 61 jobs
3. Tests - ~12 minutes/job x 20 jobs
4. Deploy - 52 minutes x 1 job

The Builds phase consumes the most CI minutes. If we can optimize this
phase then we'll achieve the biggest impact.

In the short term builds could be disabled. However, in the long term I
think full build coverage is desirable to prevent merging code that
breaks certain host OSes/architectures (e.g. stable Linux distros,
macOS, etc).

Traditionally ccache (https://ccache.dev/) was used to detect
recompilation of the same compiler input files. This is trickier to do
in GitLab CI since it would be necessary to share and update a cache,
potentially between untrusted users. Unfortunately this shifts the
bottleneck from CPU to network in a CI-as-a-Service environment since
the cached build output needs to be accessed by the linker on the CI
runner but is stored remotely.

A complementary approach is avoiding compilation altogether when code
changes do not affect a build target. For example, a change to
qemu-storage-daemon.c does not require rebuilding the system emulator
targets. Either the compiler or the build system could produce a
manifest of source files that went into a build target, and that
information is what's needed to avoid compiling unchanged targets.

Ideally the CI would look at the code changes and only launch jobs that
were affected. Those jobs would use a C compiler cache to avoid
rebuilding compiler input that has not changed. Basically, we need
incremental builds.

This is as far as I've gotten with thinking about CI efficiency. Do you
think these optimizations are worth investigating or should we keep it
simple and just disable many builds by default?

Stefan

--8YjXQIwmXniMHxmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBh39wACgkQnKSrs4Gr
c8h3XggAgdcNwRV3Ht0mmeDrG8rfpzdXeOgDetMXKpF6Gvk9ixB0uURnfayf2o6B
6BOn+70G//ZmfKjgRSj2T0xctfvka/IPpk/0E44nqEwqvkHYHXJxifVmL6gH5N5M
PO21l7143UUeFs0h0Xy09Ttr6GUJHg4a/6zoHNChIGA0KFrQYGC+jxZ9YQHNxstB
7QpuGw1qbLPvpabULVueqk0gPurNnpvcdFhBV+u3SFu9FtjkmGT8re+vM8esSKeW
bvschsS8esaYFYSSd/YNmVGQeo2+16vbNvro8EVivaLnoUqgfqasYCLu0yK1ccOl
J3vo6UpIdtQSDEJ7Subh8Ut9NipVpQ==
=oMX5
-----END PGP SIGNATURE-----

--8YjXQIwmXniMHxmr--


