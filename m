Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D3393481
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:05:16 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJRa-000170-LC
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmJPj-0007QE-5K
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lmJPg-0003eu-8I
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622134994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gnbcuAS2l/lAfCl65MwVGHxcEPeh92yfDvnixwSb+60=;
 b=E1bDwYxMWMqvsrggcQmbbS2NuBNNWZlbL/27Pn1tzxtnSIQH38kyRrO2lSOQL0cH3dzlYG
 1NHH7IEhEmb3JhkDI8sOqFh7kdGlwlfUBeZ/CzI/vRezoUA2jgbGnoCIpW832jcJTcMM9f
 /1MYQd6HG842NjJVgdV97qtpZjk/Co4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-wp6dkeZCMAKLnYohx4_Y6Q-1; Thu, 27 May 2021 13:03:11 -0400
X-MC-Unique: wp6dkeZCMAKLnYohx4_Y6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D56E01009479;
 Thu, 27 May 2021 17:03:10 +0000 (UTC)
Received: from localhost (ovpn-114-2.phx2.redhat.com [10.3.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 571D51349A;
 Thu, 27 May 2021 17:03:04 +0000 (UTC)
Date: Thu, 27 May 2021 13:02:49 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v7 31/31] gitlab: add python linters to CI
Message-ID: <20210527170249.GH1916721@amachine.somewhere>
References: <20210526002454.124728-1-jsnow@redhat.com>
 <20210526002454.124728-32-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210526002454.124728-32-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vtJ+CqYNzKB4ukR4"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--vtJ+CqYNzKB4ukR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 08:24:54PM -0400, John Snow wrote:
> Add a python container that contains just enough juice for us to run the =
python
> code quality analysis tools.
>=20
> Base this container on fedora, because fedora has very convenient
> packaging for testing multiple python versions.
>=20
> Add two tests:
>=20
> check-python-pipenv uses pipenv to test a frozen, very explicit set of
> packages against our minimum supported python version, Python 3.6. This
> test is not allowed to fail.
>=20
> check-python-tox uses tox to install the latest versions of required
> python dependencies against a wide array of Python versions from 3.6 to
> 3.9, even including the yet-to-be-released Python 3.10. This test is
> allowed to fail with a warning.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml            |  5 +++++
>  .gitlab-ci.yml                         | 26 ++++++++++++++++++++++++++
>  tests/docker/dockerfiles/python.docker | 18 ++++++++++++++++++
>  3 files changed, 49 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/python.docker
>=20
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 765408ae274..05ebd4dc11d 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -242,3 +242,8 @@ amd64-opensuse-leap-container:
>    extends: .container_job_template
>    variables:
>      NAME: opensuse-leap
> +
> +python-container:
> +  extends: .container_job_template
> +  variables:
> +    NAME: python
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f718b61fa78..cc2a3935c62 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -789,6 +789,32 @@ check-patch:
>      GIT_DEPTH: 1000

As others have pointed out, this can use a tweak.

>    allow_failure: true
>
> +
> +check-python-pipenv:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make venv-check

Nipick:

      - make -C python venv-check

> +  variables:
> +    GIT_DEPTH: 1000
> +  needs:
> +    job: python-container
> +
> +
> +check-python-tox:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
> +  script:
> +    - cd python
> +    - make check-tox
> +  variables:
> +    GIT_DEPTH: 1000

Same here.

> +  needs:
> +    job: python-container
> +  allow_failure: true
> +
> +
>  check-dco:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> diff --git a/tests/docker/dockerfiles/python.docker b/tests/docker/docker=
files/python.docker
> new file mode 100644
> index 00000000000..56d88417df4
> --- /dev/null
> +++ b/tests/docker/dockerfiles/python.docker
> @@ -0,0 +1,18 @@
> +# Python library testing environment
> +
> +FROM fedora:latest
> +MAINTAINER John Snow <jsnow@redhat.com>
> +
> +# Please keep this list sorted alphabetically
> +ENV PACKAGES \
> +    gcc \

Now with this question answered, with or without the suggestion
above:

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--vtJ+CqYNzKB4ukR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCv0LcACgkQZX6NM6Xy
CfMm2xAA0a4eST03AdSRciaTJUjqMiKGX2By8FrMC1RbiRN92FxXIOG5qCCWKAXR
1vEdIXGkCsfi6HTd+HqYR3bnyg9OvNd2unkJj9nBG9p2j4JwCEyOdSgfXdmzb6WJ
TYDMmVwt85SiXwN8/Ao3aXt4UbSWnZTL0MYl8TTbSDr05h+meIANRxjYoazuPPWy
+L3TZZh5XDe6NYsKKVjpNrAWSTZ6nRmbegOU/lvgv9tdVa9bJcB8pHSsJml37Jj4
RTFWcynfCVoReMHpfWJU2baMsGjXOSSBGvR1b/gIM2W/UZ3yjtZt6v5fQoV0P1rM
Ieg2SYfSob/CVQJCGUeEnxRVGU/XIaGhbZ2ihn61372X0i06LFP9KI0/cJbz525O
9WbiPla/YgdlKS8Mvxsk5NbSQBStGrYQUoXR5I+X66XrKYORfTlDEZKtyyVAq5cU
E8Z+my8U4mW3mvntKhFprR5ryDRs7RIcMAaO7KKWhdCW4g8CMgkdOBowdvzHMkVO
QEKK1XSBk2aq6PBRfDJu8WhFfzAMulUJpq+qSIlVHAQ2tIIP7Kegt9rj4iQC3dy1
GJvI8so6EECI8bbgcIFEimBfnHuYJ7XQHqfXpJf5Wp8Fu6RBbI6JCSAC/au/HJQS
IGGRXHL01/6OJdtRR3Z5rrXDRoNzhzjxwCmgH01sq/VXnPTfiOI=
=wFYH
-----END PGP SIGNATURE-----

--vtJ+CqYNzKB4ukR4--


