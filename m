Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE7C32308F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:23:25 +0100 (CET)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcLE-0005Zu-DM
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEcJT-0004fq-Mu
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:21:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEcJQ-0005Za-6N
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:21:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614104489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WVe2mtVhQDgnzQ9UduB7w8v8grubQTRclLp0VO6zFY=;
 b=B+He028GHUXCS1dYp+xoq0qZvp8kcyopNJBj5NUegtQKklOwyvxkxGYX+FLFGO25gUXjXe
 LUduxZ0i56rFEYyhVpNlCV9IxMk63smhWm7e3c5KsR4HqfKGgwQUmlVWdrT77pHRBP3SE4
 4ykqt6FmPYrYxvS1CexBTu+Tx2+OsVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-XYNeH3p7PtGm8Vcc6vcdJg-1; Tue, 23 Feb 2021 13:21:25 -0500
X-MC-Unique: XYNeH3p7PtGm8Vcc6vcdJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBB198030D0;
 Tue, 23 Feb 2021 18:21:23 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BC1519C79;
 Tue, 23 Feb 2021 18:21:19 +0000 (UTC)
Date: Tue, 23 Feb 2021 13:21:14 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <20210223182114.GG987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
MIME-Version: 1.0
In-Reply-To: <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7uYPyRQQ5N0D02nI"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--7uYPyRQQ5N0D02nI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 04:17:23PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/19/21 10:58 PM, Cleber Rosa wrote:
> > The QEMU project has two machines (aarch64 and s390x) that can be used
> > for jobs that do build and run tests.  This introduces those jobs,
> > which are a mapping of custom scripts used for the same purpose.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Daniel P. Berrang=E9 <berrange@redhat.com>
> > ---
> >  .gitlab-ci.d/custom-runners.yml | 204 ++++++++++++++++++++++++++++++++
> >  1 file changed, 204 insertions(+)
> >=20
> > diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runn=
ers.yml
> > index 3004da2bda..a9166c82a2 100644
> > --- a/.gitlab-ci.d/custom-runners.yml
> > +++ b/.gitlab-ci.d/custom-runners.yml
> > @@ -12,3 +12,207 @@
> >  # strategy.
> >  variables:
> >    GIT_SUBMODULE_STRATEGY: recursive
> > +
> > +# All ubuntu-18.04 jobs should run successfully in an environment
> > +# setup by the scripts/ci/setup/build-environment.yml task
> > +# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> > +ubuntu-18.04-s390x-all-linux-static:
> > + allow_failure: true
> > + needs: []
> > + stage: build
> > + tags:
> > + - ubuntu_18.04
> > + - s390x
>=20
> Where is this tag list filled upon registration?
>

The documentation on this series (previous patch) describes how one
should go about settings the tags.  Pasting it here for easier context:

---

Following the registration, it's necessary to configure the runner tags,
and optionally other configurations on the GitLab UI.  Navigate to:

 * Settings (the gears like icon), then
 * CI/CD, then
 * Runners, and click on the "Expand" button, then
 * "Runners activated for this project", then
 * Click on the "Edit" icon (next to the "Lock" Icon)

Under tags, add values matching the jobs a runner should run.  For a
Ubuntu 20.04 aarch64 system, the tags should be set as::

  ubuntu_20.04,aarch64

Because the job definition at ``.gitlab-ci.d/custom-runners.yml``
would contain::

  ubuntu-20.04-aarch64-all:
   tags:
   - ubuntu_20.04
   - aarch64

---

Does that answer your question?

> > + rules:
> > + - if: '$CI_COMMIT_BRANCH =3D~ /^staging/'
> > + script:
> > + # --disable-libssh is needed because of https://bugs.launchpad.net/qe=
mu/+bug/1838763
> > + # --disable-glusterfs is needed because there's no static version of =
those libs in distro supplied packages
> > + - mkdir build
> > + - cd build
> > + - ../configure --enable-debug --static --disable-system --disable-glu=
sterfs --disable-libssh
> > + - make --output-sync -j`nproc`
> > + - make --output-sync -j`nproc` check V=3D1
> > + - make --output-sync -j`nproc` check-tcg V=3D1
>=20
> Also this break the rest of the tests...
>=20
> The first containers job (amd64-alpine-container) got
> added to the custom runner and failed (because docker-dind
> isn't there?):
>

The documentation explains that, saying that it's recommended to uncheck
the "Run untagged jobs" check box.

> $ export TAG=3D"$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
> $ export COMMON_TAG=3D"$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
> $ apk add python3
> bash: line 110: apk: command not found
> Running after_script 00:01
> Running after script...
> $ docker logout
> Removing login credentials for https://index.docker.io/v1/
> ERROR: Job failed: exit status 1
>=20
> Do we need to restrict the other jobs to the Gitlab public
> (x86) runners? Maybe as:
>

You just need to take care of the runners you add.  All the other jobs
are assumed to be running on the shared runners.

Regards,
- Cleber.

--7uYPyRQQ5N0D02nI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1R5cACgkQZX6NM6Xy
CfMCgA/8DN1KcvPBgSx33Jes3GTvbOczrpgQqVD/7bX6GMSShrwotnwfN1diqGen
2vni1aRda9DMCNOWEc29K/kdMgg89ULSb5nscJniqDJYjaGfySwB8I2DAyTHFuHe
fNJiy+uObeLg20kITSBDB7umDGEfE68zktwugGXWvsv0vEXBjy3Ni/KHC2v8ROBf
H42vUFfzUqBLR2aVK3OtNFdPM0b3S/C+EFgTKQ1DjoHgV0cENpBdftnmH4sbnjLt
4kgZn+EN0ZBcqpSpndfI0/MoQVXErwWeKAfeg535lMzIty4B/k9pkT/dOU2QGty/
TcZ/fued31euUtYusWZDUBGnTEtCeukhtOZQN5GO1WnTCM0bbHYOsKoMZc3xNHOw
jbHr8fDTmLBNBWAar+de9662Qal0L1IpjTQ8NVJ7tQ7l5r0rUxhkqyraR4lVCfE/
dJbQGGAIpTSUMVrG2nmNAd+yPLKAt2xj5KxrOZybhck5xd69HwkPcIeKFJNvaKx4
a4lbiH5Q+QEbIBIXx4usINoCiFJUHCyULrYvA9/jQk4J1CNdaSxseKy/XDXoTW4v
bjpZzIsAb5SLR1332/ZufgTCToNGV/8WdjEpuLpfnUAeFmokCrhpJI+kcGG1PQL/
SRwH6NwCrvEREzTu8SUxrdhu2AGO7SMlNS+DvZxuVZBeWP6BKEE=
=8twh
-----END PGP SIGNATURE-----

--7uYPyRQQ5N0D02nI--


