Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7B3240FB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:59:43 +0100 (CET)
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwZi-0001iy-4F
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEwVD-0005Hs-J0
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEwVB-0001XK-AR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614182100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pLVWjNVIpu+7PObzSFCqM9sSkLzxwhSdmFNxnPOc2uU=;
 b=AqUGzPW9RM19QI331P4obM2ml2PdBwpu75+RWgCYrNtKM6RgDdFsny/b8D6ABpMVDRMmhk
 A/5L79HZuaVsRY61i6aBbSOHyVHv4MXoVkRfhwHF588RHSuKT/yvvJHyvK8jLaThQeuOQM
 hqZNP3tt4GVLV2S8cDZ8uLqLmJGwXNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-EJVq4JRYPXCeetdGCy0BSQ-1; Wed, 24 Feb 2021 10:54:48 -0500
X-MC-Unique: EJVq4JRYPXCeetdGCy0BSQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B898D8633;
 Wed, 24 Feb 2021 15:48:03 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 603875C224;
 Wed, 24 Feb 2021 15:48:00 +0000 (UTC)
Date: Wed, 24 Feb 2021 10:47:21 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 1/4] Jobs based on custom runners: documentation and
 configuration placeholder
Message-ID: <20210224154721.GA1074102@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-2-crosa@redhat.com>
 <3f0a3854-425d-27e7-d466-f6f4db4dd9aa@redhat.com>
 <e884e35a-cb4c-059b-7b67-1c69f7869347@redhat.com>
 <20210223164718.GA987581@amachine.somewhere>
 <8de62a35-7e66-b182-a182-4d021b713b5a@redhat.com>
 <bf8a9dd0-c20f-7bef-ae65-2c3c1e10da68@redhat.com>
 <20210223180932.GF987581@amachine.somewhere>
 <b1ec9717-01bf-1e5e-a3f7-6c2d0f87d1a1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b1ec9717-01bf-1e5e-a3f7-6c2d0f87d1a1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 12:57:52PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/23/21 7:09 PM, Cleber Rosa wrote:
> > Hi Phil,
> >=20
> > I'm not following what you meant by "I cloned"... Are you experimenting
> > with this on a machine of your own and manually cloning the submodules?
>=20
> I meant "my test runner has been cloning ..."
>=20
> >> But reach the runner time limit of 2h.
>=20
> The first failure was 1h, I raised the job limit to the maximum
> I could use for this runner, 2h.
>=20
> >> The directory reports 3GB of source code.
> >>
> >> I don't think the series has been tested enough before posting,
> >=20
> > Please take into consideration that this series, although simple in
> > content, touches and interacts with a lot of moving pieces, and
> > possibly with personal systems that I did not have, or will have,
> > access to.  As far as public testing proof goes, you can see a
> > pipeline here with this version of this series here:
> >=20
> >    https://gitlab.com/cleber.gnu/qemu/-/pipelines/258982039/builds
>=20
> Expand the timeout and retry the same job on the same runner
> various times:
>=20
> diff --git a/.gitlab-ci.d/custom-runners.yml
> b/.gitlab-ci.d/custom-runners.yml
> @@ -17,6 +17,7 @@ variables:
>  # setup by the scripts/ci/setup/build-environment.yml task
>  # "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
>  ubuntu-18.04-s390x-all-linux-static:
> + timeout: 2h 30m
>   allow_failure: true
>   needs: []
>   stage: build
>=20
> Each time it will clone more submodules.
>=20
> I stopped at the 3rd intent.
>=20
> > As I said elsewhere, I only noticed the recursive submodule being
> > applied to the existing jobs after I submitted the series.  Mea culpa.
> > But:
> >=20
> >  * none of the jobs took noticeably longer than the previous baseline
> >  * there was one *container build failure* (safe to say it's not
> >    related)
> >  * all other jobs passed successfully
>=20
> I had less luck then (see the docker-dind jobs started on the custom
> runner commented elsewhere in this thread).
>

Hi Phil,

I replied to this issue elsewhere too... I assume you missed the
documentation and did not uncheck the "Run untagged jobs" as
instructed.

> > And, along with the previous versions, this series were tested on all
> > the previously included architectures and operating systems.  It's
> > unfortunate that because of your experience at this time (my
> > apologies), you don't realize the amount of testing done so far.
>=20
> As I commented to Erik on IRC, the single difference I did
> is use the distribution runner, not the official one:
>=20
> $ sudo apt-get install gitlab-runner docker.io
>=20
> Then registered changing the path (/usr/bin/gitlab-runner instead
> of /usr/local/bin/gitlab-runner). Everything else left unchanged.
>

Assuming you did your experiments on Ubuntu 20.04:

   # dpkg -l gitlab-runner
  ||/ Name           Version              Architecture Description
  +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
  ii  gitlab-runner  11.2.0+dfsg-2ubuntu1 amd64        GitLab Runner - runs=
 continuous integration (CI) jobs

This supposedly "single" difference, actually amounts to thousands of
changes (not counting the possible downstream patches, differences with
regards to packaging, etc):

  [gitlab-runner]$ git log --no-merges --oneline v11.2.0..v13.1.1 | wc -l
  1477

Version 13.1.1 referred above is what you'd get *if* using the
playbook.

Like I said before, I very much appreciate your help reviewing this,
but unfortunately what you used was *WAY OFF* what was proposed.

And you're right, this version was not tested enough (on an
environment similar to what you used) before it was posted.

Regards,
- Cleber.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA2dQUACgkQZX6NM6Xy
CfMSQhAAnuWldEnRZjngmJ/Q/mYFW1x9z2+TF6Py3A3XZRp/Ok/Vv2j/rMwwan+v
0BraMZs8JT5lHD08jRErrP9YOadsiR+y75KtCxFc+iEtdQQy6l2NlYUP2F0YhDr3
7uTXoM+7ZxDjCPZ0PjRizDnkCeWMfMGcQJZNzixk6jMFJ8r3d+iVf0XOryN2Kkbm
R32WHK88VjVpgHxAIZuKTc3GNokpbiElqaLTknfq81/Ce4KHRyrwKDX4m1McHSWV
H+JSMO8A6WZ1gLU0rV7fWWXQRcHTb8ZrY+v4lJ/I2PPumXe5eyZe4/57VvX/EsdT
oPwvKwpQ5TLacgybD3QrwjeyZR4e6yuSgBIZXNL+Laij9vyGPdM2hmhGtX1atzGd
NeMHa9VOmrlCTAxNzfDVdHnyDMDiikKYuZFj1nq7jztg/p8PlrhIJLwEWIXtz5mZ
y5PFTm8ZU9EDvzGWx0L3itwXOtYAt3qCumxuDed3gs46PriQXO2ZJbdU++3jRNyr
P1lx5kutYkV14zWSNoNVhQknxkEq50FW2rzaPqqfQW7ZmDQmWfpFXW38P1TKpXT1
PUg2TxtgHhT9Zo/h58gcUTBl/OW1EjLv/OCTv9ioNmoj8qWH5Eb3TTMaPmJ1GzEp
kPeUwLKtQ8Jzt+M/gBwpZv18bUWgDRmIaiV/Ct2n1AZLwEWuLMA=
=OdM6
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--


