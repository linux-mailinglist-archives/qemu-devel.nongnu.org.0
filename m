Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C815FC804
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:13:54 +0200 (CEST)
Received: from localhost ([::1]:49324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidQe-000620-0j
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidCs-0000zp-P3
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidCp-0002Oh-SW
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665586775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sBa0dvtrtNh20PRFd5+mPfWFYcF3bUOfNlT73Tep0GA=;
 b=bWNEVB8K/YxuV57cYXopjBtiWjAE/8sCFlTVEId1VBXrWU4B+4OhipgQnSH0OIEAP1t6Yl
 9AhlvUu8yPm8HY8TwRZFl8HM0QQVtkmifyQTPXD6Jq6cewYEEo0o60DibjBsqDbTyQe+9e
 oJLs76/2+87dsNUSWbUU9TQ42mFtN+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-TXyoDoUwNe6_K0XseJAhEA-1; Wed, 12 Oct 2022 10:59:33 -0400
X-MC-Unique: TXyoDoUwNe6_K0XseJAhEA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB1EB884343;
 Wed, 12 Oct 2022 14:59:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA322492B05;
 Wed, 12 Oct 2022 14:59:31 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:59:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH  1/4] docs/devel: add a maintainers section to
 development process
Message-ID: <Y0bWTkNLgwQbQhwQ@fedora>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4dN/DyQZkJZO7Kr9"
Content-Disposition: inline
In-Reply-To: <20221012121152.1179051-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--4dN/DyQZkJZO7Kr9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 01:11:49PM +0100, Alex Benn=E9e wrote:
> We don't currently have a clear place in the documentation to describe
> the rolls and responsibilities of a maintainer. Lets create one so we

s/roll/role/ in the commit description and the patch.

> can. I've moved a few small bits out of other files to try and keep
> everything in one place.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  docs/devel/code-of-conduct.rst           |  2 +
>  docs/devel/index-process.rst             |  1 +
>  docs/devel/maintainers.rst               | 84 ++++++++++++++++++++++++
>  docs/devel/submitting-a-pull-request.rst | 12 ++--
>  4 files changed, 91 insertions(+), 8 deletions(-)
>  create mode 100644 docs/devel/maintainers.rst
>=20
> diff --git a/docs/devel/code-of-conduct.rst b/docs/devel/code-of-conduct.=
rst
> index 195444d1b4..f734ed0317 100644
> --- a/docs/devel/code-of-conduct.rst
> +++ b/docs/devel/code-of-conduct.rst
> @@ -1,3 +1,5 @@
> +.. _code_of_conduct:
> +
>  Code of Conduct
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
> index d0d7a200fd..d50dd74c3e 100644
> --- a/docs/devel/index-process.rst
> +++ b/docs/devel/index-process.rst
> @@ -8,6 +8,7 @@ Notes about how to interact with the community and how an=
d where to submit patch
> =20
>     code-of-conduct
>     conflict-resolution
> +   maintainers
>     style
>     submitting-a-patch
>     trivial-patches
> diff --git a/docs/devel/maintainers.rst b/docs/devel/maintainers.rst
> new file mode 100644
> index 0000000000..e3c7003bfa
> --- /dev/null
> +++ b/docs/devel/maintainers.rst
> @@ -0,0 +1,84 @@
> +.. _maintainers:
> +
> +The Roll of Maintainers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Maintainers are a critical part of the projects contributor ecosystem.

project's

> +They come from a wide range of backgrounds from unpaid hobbyists
> +working in their spare time to employees who work on the project as
> +part of their job. Maintainer activities include:
> +
> +  - reviewing patches and suggesting changes
> +  - preparing pull requests for their subsystems
> +  - participating other project activities
> +
> +They are also human and subject to the same pressures as everyone else
> +including overload and burn out. Like everyone else they are subject
> +to projects :ref:`code_of_conduct`.

to the project's

(Although "project's" can be dropped without changing the meaning.)

> +
> +The MAINTAINERS file
> +--------------------
> +
> +The `MAINTAINERS
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS>`__
> +file contains the canonical list of who is a maintainer. The file
> +is machine readable so an appropriately configured git (see
> +:ref:`cc_the_relevant_maintainer`) can automatically Cc them on
> +patches that touch their area of code.
> +
> +The file also describes the status of the area of code to give an idea
> +of how actively that section is maintained.
> +
> +.. list-table:: Meaning of support status in MAINTAINERS
> +   :widths: 25 75
> +   :header-rows: 1
> +
> +   * - Status
> +     - Meaning
> +   * - Supported
> +     - Someone is actually paid to look after this.
> +   * - Maintained
> +     - Someone actually looks after it.
> +   * - Odd Fixes
> +     - It has a maintainer but they don't have time to do
> +       much other than throw the odd patch in.
> +   * - Orphan
> +     - No current maintainer.
> +   * - Obsolete
> +     - Old obsolete code, should use something else.
> +
> +Please bare in mind that even if someone is paid to support something
> +it does not mean they are paid to support you. This is open source and
> +the code comes with no warranty and the project makes no guarantees
> +about dealing with bugs or features requests.
> +
> +Becoming a maintainer
> +---------------------
> +
> +Maintainers are volunteers who put themselves forward to keep an eye
> +on an area of code. They are generally accepted by the community to
> +have a good understanding of the subsystem and able to make a positive
> +contribution to the project.
> +
> +The process is simple - simply sent a patch to the list that updates
> +the ``MAINTAINERS`` file. Sometimes this is done as part of a larger
> +series when a new sub-system is being added to the code base. This can
> +also be done by a retiring maintainer who nominates their replacement
> +after discussion with other contributors.
> +
> +Once the patch is reviewed and merged the only other step is to make
> +sure your GPG key is signed.
> +
> +.. _maintainer_keys:
> +
> +Maintainer GPG Keys
> +~~~~~~~~~~~~~~~~~~~
> +
> +GPG is used to sign pull requests so they can be identified as really
> +coming from the maintainer. If your key is not already signed by
> +members of the QEMU community, you should make arrangements to attend
> +a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
> +example at KVM Forum) or make alternative arrangements to have your
> +key signed by an attendee. Key signing requires meeting another
> +community member **in person** so please make appropriate
> +arrangements.

In practice there are maintainers who have not yet been able to perform
key signing in person. It is still possible to become a maintainer
without a signed GPG key but the goal should be to get it signed as soon
as practically possible. In this case the maintainer still signs pull
requests with their GPG key but the commit logs will show that the key
is not trusted and extra scrutiny is applied when merging code.

> diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submit=
ting-a-pull-request.rst
> index c9d1e8afd9..a4cd7ebbb6 100644
> --- a/docs/devel/submitting-a-pull-request.rst
> +++ b/docs/devel/submitting-a-pull-request.rst
> @@ -53,14 +53,10 @@ series) and that "make check" passes before sending o=
ut the pull
>  request. As a submaintainer you're one of QEMU's lines of defense
>  against bad code, so double check the details.
> =20
> -**All pull requests must be signed**. If your key is not already signed
> -by members of the QEMU community, you should make arrangements to attend
> -a `KeySigningParty <https://wiki.qemu.org/KeySigningParty>`__ (for
> -example at KVM Forum) or make alternative arrangements to have your key
> -signed by an attendee.  Key signing requires meeting another community
> -member \*in person\* so please make appropriate arrangements.  By
> -"signed" here we mean that the pullreq email should quote a tag which is
> -a GPG-signed tag (as created with 'gpg tag -s ...').
> +**All pull requests must be signed**. By "signed" here we mean that
> +the pullreq email should quote a tag which is a GPG-signed tag (as
> +created with 'gpg tag -s ...'). See :ref:`maintainer_keys` for
> +details.
> =20
>  **Pull requests not for master should say "not for master" and have
>  "PULL SUBSYSTEM whatever" in the subject tag**. If your pull request is
> --=20
> 2.34.1
>=20

--4dN/DyQZkJZO7Kr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNG1k4ACgkQnKSrs4Gr
c8jn7Af/VQbseygP1Vza0okYa4eoAsFbINlZQkJDyZl9NDc8XMfHc9y15shG4Mbq
cJ20U/TWvH2dWgeqcKWIQihrz3rlP+6+dsT0xuS53HjtC0hZe3gOvz7nW9Km9Ytw
64n5H6ogw0opUFnBpwvRO7uUdibc67RxqVWvmBLknNnWRbnn432K/Jw9TLAlvflp
nCPJJR70qfkaqBpse0GNCqBpD/0VrGdo6vhCsxFoIN6oOQLPcB4IAlqetULtNFXS
NFjVLUMHUW1zotUwbK+hsR1x3ZrAgoSymSB3Kyelgnv0fLdw8W5E2XCNZZ6EtyrT
Bae9yVwsLjsxt4/aGlo8/QGiZKCOFQ==
=zjLB
-----END PGP SIGNATURE-----

--4dN/DyQZkJZO7Kr9--


