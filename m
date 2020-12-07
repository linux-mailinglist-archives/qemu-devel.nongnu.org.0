Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C232D0939
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 03:47:47 +0100 (CET)
Received: from localhost ([::1]:36058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km6Yz-0000RB-7P
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 21:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1km6Wv-0008EF-Jm; Sun, 06 Dec 2020 21:45:37 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42935 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1km6Wq-0001Ks-WD; Sun, 06 Dec 2020 21:45:36 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cq72d3llFz9sVx; Mon,  7 Dec 2020 13:45:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607309113;
 bh=TC0GOGaKbPAwP2EkbRQ9BPtcqZhEMWFvPmP9ecxIISo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUcv192BLmiuo8zL9otdtQLt0UfmEo9EO574qHkkb6rjQT6zTr7LJVVf2p3ucpts5
 7cCe77CeGg6dbknawRx9okhPJam/pPRWj1UOXXKDU9Ofz0d7yY7SUKIGVn6xqTuM1f
 BBPukzLSjLblB+Cwg8oG8n6FG6BUR8UK014fAN+4=
Date: Mon, 7 Dec 2020 12:38:38 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 6/8] gitlab-ci: Add KVM PPC cross-build jobs
Message-ID: <20201207013838.GA2555@yekko.fritz.box>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-7-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20201206185508.3545711-7-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Thomas Huth <thuth@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 06, 2020 at 07:55:06PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Cross-build PPC target with KVM and TCG accelerators enabled.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
> later this job build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-ppc.yml | 5 +++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> diff --git a/.gitlab-ci.d/crossbuilds-kvm-ppc.yml b/.gitlab-ci.d/crossbui=
lds-kvm-ppc.yml
> new file mode 100644
> index 00000000000..9df8bcf5a73
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
> @@ -0,0 +1,5 @@
> +cross-ppc64el-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-ppc64el-cross
> +    TARGETS: ppc64-softmmu
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a69619d7319..024624908e8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -15,6 +15,7 @@ include:
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>    - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
> =20
>  .native_build_job_template: &native_build_job_definition
>    stage: build
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d41401f6683..c7766782174 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -397,6 +397,7 @@ PPC KVM CPUs
>  M: David Gibson <david@gibson.dropbear.id.au>
>  S: Maintained
>  F: target/ppc/kvm.c
> +F: .gitlab-ci.d/crossbuilds-kvm-ppc.yml
> =20
>  S390 KVM CPUs
>  M: Halil Pasic <pasic@linux.ibm.com>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/Nh5wACgkQbDjKyiDZ
s5LYEhAA36/x+ZVjKjbCR9cpbx/bxHW9hRFzSUsSkrFIx/72fqe7yXS0+kSyiZXE
yZw9xCYqyHNWkGbRdPbWWeICzn7uKP4JrKOGXhIWYmuAdCmRoodf95DLaEEsgyW1
kJswja2Od7ZqPytGo3Ybe540knkUj6a/Hae5nskOMw6f3RfjC1sLeCLz5Dfzup3F
0tbSKBXobELtf0AP7PIut9DQZKdorQXf4OO0gJDOkCqHUsvkuL0HqJ7mARHu0ca2
oFCZaO5Ko8frdptD5ik/n77Nqi+MqJrp81LvkiJrLRCSZPoex8RUWcAg/gDcQfoL
3nd92ZnOyWmuo72Pz0LK3jQCaIyvxVzikuWqpdeYK1/fQ3wx3em2S1vaksXmSbRJ
RXgIE/zSbZhbKSqpeQyowhJ1N0MxgrTiAwXJMapfwoA0z7rOvMFNAhhX2RLEIPYC
G/9c/KHEtBod2tp0GSUtMkIM2k/Dq9jobShxZubJOV3Z2bMsuILrPBccYIaEjjzT
eA8OCWafnik+e2Rqi9SOrTbVqgsVqOmhw1Muu5zrgRLBahI9FQx9XKC2Wji6mbTB
3/+qZ67nkzA29J4wfMi+WDpGUztqt6Ee65opWx8tTmOUMB2ReWYovhh34IbtsL4s
5RwEYP5Fm5CbUoZ0m/O2dsUXPt66NDALXeP51FDZuup1HQXp5y4=
=Obzg
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

