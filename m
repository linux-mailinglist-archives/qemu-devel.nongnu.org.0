Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2461390A1F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:57:26 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lldB7-0002bw-FM
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldAA-0001VV-5n
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:56:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lldA2-0004bS-8Z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621972576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BviKVpgmKZtSl0ZjWPTAGHHPAWXetB3zqfpwaYJbOEY=;
 b=MpiF+Dug+6ButixSXorF4RacxWwVCu8io+qfSTp42m48hxMfdu0HEnjzpBB+fy3CpF4BWE
 1y6Odqr48vqa61jRKqSjsVs47EE9JZ4CsqFEbgpKSPPiVrdQ8oZBzk8hYyJDucfDnkyTpg
 m7e3eonbjilO/QmVrn9efEn/s57BuSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-vkPYTBCWND-Ou3tMGSbSCA-1; Tue, 25 May 2021 15:56:14 -0400
X-MC-Unique: vkPYTBCWND-Ou3tMGSbSCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F4219251A0;
 Tue, 25 May 2021 19:56:12 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-219.ams2.redhat.com
 [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 904006060F;
 Tue, 25 May 2021 19:56:02 +0000 (UTC)
Date: Tue, 25 May 2021 15:55:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 24/25] gitlab: add python linters to CI
Message-ID: <YK1WT2b69BZVN1Kw@localhost.localdomain>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-25-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210512231241.2816122-25-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eFYy3d9iWE3fwrwH"
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

--eFYy3d9iWE3fwrwH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 07:12:40PM -0400, John Snow wrote:
> Add python3.6 to the fedora container image: we need it to run the
> linters against that explicit version to make sure we don't break our
> minimum version promise.
>=20
> Add pipenv so that we can fetch precise versions of pip packages we need
> to guarantee test reproducability.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab-ci.yml                         | 12 ++++++++++++
>  tests/docker/dockerfiles/fedora.docker |  2 ++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index dcb6317aace..a371c0c7163 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -779,6 +779,18 @@ check-patch:
>      GIT_DEPTH: 1000
>    allow_failure: true
> =20
> +
> +check-python:
> +  stage: test
> +  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
> +  script:
> +    - cd python
> +    - make venv-check
> +  variables:
> +    GIT_DEPTH: 1000
> +  needs:
> +    job: amd64-fedora-container
> +
>  check-dco:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
> index 915fdc1845e..6908d69ac37 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -84,6 +84,7 @@ ENV PACKAGES \
>      numactl-devel \
>      perl \
>      perl-Test-Harness \
> +    pipenv \
>      pixman-devel \
>      python3 \
>      python3-PyYAML \
> @@ -93,6 +94,7 @@ ENV PACKAGES \
>      python3-pip \
>      python3-sphinx \
>      python3-virtualenv \
> +    python3.6 \

I personally would prefer having a different container image for this
job.  Because it would:

1. Be super simple (FROM fedora:33 / dnf -y install python3.6 pipenv)
2. Not carry all this unnecessary baggage
3. Not risk building QEMU with Python 3.6 (suppose the ./configure
   probe changes unintentionally)

But, AFAICT there is no precedent in requiring new images for
different types of checks.  So, unless someone else complains loudly,
I'm OK with this.

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--eFYy3d9iWE3fwrwH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCtVikACgkQZX6NM6Xy
CfMy4A//QfQs0JEsCOMW40vmdXH4znrnmXZcShGvS7Vh06CFenDh5ZV+pe4qHc4c
3lgKN7Hpwo4W8Yzj0leLBaGRXNOAv0kKWaBHn++S+OvvZKaz6yQkGt85dw741uB6
lAb4PpWuSA7e9oncjPiglON5PjW2qsnVUWWvcWr1YbrdPeJW5ke736xoaBHutgQB
tgVkEgd3mIw6fkcDOuqxms7D1oKrNmHNnW7WOWpUm+UVyN9Bv6SF4Azmjz/ks6dl
u129MnXyArVDQt2jzkmrYR2oMWKZfNYc0m79/ZeKW68oVXfb008AYLxL8CwY1RIh
XBWLDFDFzwnTeBttOJQaFyuim0WTsR459LdVF8pd+vod+mKtAinvtDqA1nDVeder
NauZJhcueT/gGYqqqERHNW3XOaASKhb1SMy00+2IyM43oAjlqw+E9PqJHAxXdOSB
CrB2AiuLSgsUsoLSq7o7rj1AwBcbCSQ1b93jE1NX3D1bQRQREe0hLgcJSJkDjVud
Lgcs7vDjOfRfzrvAMVytlUzPbCWyYb/uLSNpdreXLdSuNYCjqTsE+SbSktEVtyrW
LcIExnTJAVu2UpFnodODhl0pLowGnk+LAyQaCVXJQcrVN5vX4PggT3opKFDwrmx0
AG9GLyLFrNQEQ7P/mkEG1gw0KyIfn+YUhVDRWaPONDG4gJF4OPM=
=irpk
-----END PGP SIGNATURE-----

--eFYy3d9iWE3fwrwH--


