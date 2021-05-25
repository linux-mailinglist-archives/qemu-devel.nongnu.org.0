Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6456839095A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:01:11 +0200 (CEST)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcIg-0001Ef-7k
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcH2-0000Ff-O2
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1llcH1-0003fT-5d
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621969166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F/NIA22H5FYpN6V9nvwrkFK4b6dB/KLkev8zap+Z+/A=;
 b=iMAjsK9i4/sinA/nQ1fWYr/yICIS3d+QzWnwoHkQLoOJklQYP6mBVTGU5GBK4ileXJtKPR
 77SfeoHaFsgReixYM+yYK1U7omrXD/l4rzjlt01/XXzPv/lKOh/K5K8lQB1uRa4JVJzniQ
 ercweXQZ1XCzh5ZgJO3cHzPJWekO03M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-fT6fS2EHPpCz4Ha-SV59gg-1; Tue, 25 May 2021 14:59:22 -0400
X-MC-Unique: fT6fS2EHPpCz4Ha-SV59gg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DB680ED8E;
 Tue, 25 May 2021 18:59:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B85AC617E;
 Tue, 25 May 2021 18:58:59 +0000 (UTC)
Date: Tue, 25 May 2021 14:58:56 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 21/25] python: add avocado-framework and tests
Message-ID: <YK1I8IXCkVdkwBUs@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-22-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-22-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V60WV1uGnVf7qEQR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--V60WV1uGnVf7qEQR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:37PM -0400, John Snow wrote:
> Try using avocado to manage our various tests; even though right now
> they're only invoking shell scripts and not really running any
> python-native code.
>=20
> Create tests/, and add shell scripts which call out to mypy, flake8,
> pylint and isort to enforce the standards in this directory.
>=20
> Add avocado-framework to the setup.cfg development dependencies, and add
> avocado.cfg to store some preferences for how we'd like the test output
> to look.
>=20
> Finally, add avocado-framework to the Pipfile environment and lock the
> new dependencies. We are using avocado >=3D 87.0 here to take advantage o=
f
> some features that Cleber has helpfully added to make the test output
> here *very* friendly and easy to read for developers that might chance
> upon the output in Gitlab CI.
>=20
> [Note: ALL of the dependencies get updated to the most modern versions
> that exist at the time of this writing. No way around it that I have
> seen. Not ideal, but so it goes.]
>=20
> Provided you have the right development dependencies (mypy, flake8,
> isort, pylint, and now avocado-framework) You should be able to run
> "avocado --config avocado.cfg run tests/" from the python folder to run
> all of these linters with the correct arguments.
>=20
> (A forthcoming commit adds the much easier 'make check'.)
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst      |   2 +
>  python/Pipfile.lock    | 104 ++++++++++++++++++++++-------------------
>  python/avocado.cfg     |  10 ++++
>  python/setup.cfg       |   1 +
>  python/tests/flake8.sh |   2 +
>  python/tests/isort.sh  |   2 +
>  python/tests/mypy.sh   |   2 +
>  python/tests/pylint.sh |   2 +
>  8 files changed, 77 insertions(+), 48 deletions(-)
>  create mode 100644 python/avocado.cfg
>  create mode 100755 python/tests/flake8.sh
>  create mode 100755 python/tests/isort.sh
>  create mode 100755 python/tests/mypy.sh
>  create mode 100755 python/tests/pylint.sh
>=20

With the patches from your "Python: delint python library" series:

   $ pipenv run avocado --config avocado.cfg run tests/
   JOB ID     : b27b48eded8b405c6672e61e3d1561407fca9d5e
   JOB LOG    : /home/cleber/avocado/job-results/job-2021-05-25T14.56-b27b4=
8e/job.log
    (1/4) tests/flake8.sh: PASS (0.67 s)
    (2/4) tests/isort.sh: PASS (0.37 s)
    (3/4) tests/mypy.sh: PASS (0.39 s)
    (4/4) tests/pylint.sh: PASS (4.85 s)
   RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |=
 CANCEL 0
   JOB TIME   : 6.75 s

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--V60WV1uGnVf7qEQR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtSOwACgkQZX6NM6Xy
CfMb1BAAsKXjHWfsOauSvcIiIQucyEdbbmNh8fFVHss86GBgjuzWlMBaPyj54Qo7
DPqih35VsT6LLobFUEKAajSMnYgXTvF4/KoAyhc6iW7VZfAzjAGKToUK281HXcgw
yEyU1aPmR+61TI0IJ3WGPcYPtmdiJizC5B9pkA/FqYtxweOi38purEY+pbmMpxpz
nvpt7NNSYUyiteSjLF16rWUtJmGRK56Zgag5Q8AmPPDErrrLY5kxB6TFZDtKIhph
2XLe2PKj11aB0U1Edxzk0u4YXdf3qQWjr0h4vqDKBAEav2y0XKRr2iFWM/Ys00aq
jrc8psjtHFlwhRU/aKAL1gF3TvcAFR2f2TACoif//CoUqxBLmmke1x3ycbM/oZGD
PQckImIgWZzrWE3H0AheM9i1bQTAWGmtu6C5vtMdMTLqldITRxioU0h1rj9fMnpj
E+3r+PDCTjudiOsDDlAETlveSUJRlb5I80VZxiDmkVGtNTA0ePsZFrdQNokCk2HW
LapQpLfrunvjc8XNX3LdqmTKdbGfvdmNS5ysZnLvtMYI82aHJ98hdyQ4E69NCj4s
VLfJUWeuvOWegzmMtIl39NoFdtvpeP61hgXqaR3hT4T9xyt01XFDU8bT3B4T26v0
vK2hnnZRmIg+bp27VUbqPf72cmdPuiNU+a02I36zZY2xfa7gp5Q=
=aI3v
-----END PGP SIGNATURE-----

--V60WV1uGnVf7qEQR--


