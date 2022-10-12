Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D6E5FC7FC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:10:20 +0200 (CEST)
Received: from localhost ([::1]:51018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidND-0002AH-K2
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidFv-0002ks-UT
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oidFr-0002zJ-EW
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665586962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hw1yNQk2A42MPuj/2vrnLExfhIFxvxDCKO+kZcLLUz0=;
 b=O9LsSpZRdI4EfClV41KdJOn1i9oamsxbQ1gBLsdp8/+9kT0PioKCHxjBpGLj2BgXL5mihA
 wMm4IEbmPMpj+YOX3ZFZ8nHD71k45Mi4CTXUEN7DcNsOCSG52E1qsGdhXVtR0om1gnvF7w
 qAdqp0eJaPRqku9B5BdWJQMOAMZ7U7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-oIG_UCN5OaKOmjy9LSgVgQ-1; Wed, 12 Oct 2022 11:02:36 -0400
X-MC-Unique: oIG_UCN5OaKOmjy9LSgVgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DB5C1C05AF7;
 Wed, 12 Oct 2022 15:02:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D15F32166B2F;
 Wed, 12 Oct 2022 15:02:35 +0000 (UTC)
Date: Wed, 12 Oct 2022 11:02:34 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH  3/4] docs/devel: simplify the minimal checklist
Message-ID: <Y0bXCl+YhYVGOjYk@fedora>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wf9ip5ASB5hBQPhw"
Content-Disposition: inline
In-Reply-To: <20221012121152.1179051-4-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


--Wf9ip5ASB5hBQPhw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 01:11:51PM +0100, Alex Benn=E9e wrote:
> The bullet points are quite long and contain process tips. Move those
> bits of the bullet to the relevant sections and link to them. Use a
> table for nicer formatting of the checklist.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 75 ++++++++++++++++++++-----------
>  roms/qboot                        |  2 +-
>  2 files changed, 50 insertions(+), 27 deletions(-)
>=20
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-=
patch.rst
> index fb1673e974..41771501bf 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -12,25 +12,18 @@ be committed faster.
>  This page seems very long, so if you are only trying to post a quick
>  one-shot fix, the bare minimum we ask is that:
> =20
> --  You **must** provide a Signed-off-by: line (this is a hard
> -   requirement because it's how you say "I'm legally okay to contribute
> -   this and happy for it to go into QEMU", modeled after the `Linux kern=
el
> -   <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d815=
7f#n297>`__
> -   policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
> --  All contributions to QEMU must be **sent as patches** to the
> -   qemu-devel `mailing list <https://wiki.qemu.org/Contribute/MailingLis=
ts>`__.
> -   Patch contributions should not be posted on the bug tracker, posted on
> -   forums, or externally hosted and linked to. (We have other mailing li=
sts too,
> -   but all patches must go to qemu-devel, possibly with a Cc: to another
> -   list.) ``git send-email`` (`step-by-step setup
> -   guide <https://git-send-email.io/>`__ and `hints and
> -   tips <https://elixir.bootlin.com/linux/latest/source/Documentation/pr=
ocess/email-clients.rst>`__)
> -   works best for delivering the patch without mangling it, but
> -   attachments can be used as a last resort on a first-time submission.
> --  You must read replies to your message, and be willing to act on them.
> -   Note, however, that maintainers are often willing to manually fix up
> -   first-time contributions, since there is a learning curve involved in
> -   making an ideal patch submission.
> +.. list-table:: Minimal Checklist for Patches
> +   :widths: 35 65
> +   :header-rows: 1
> +
> +   * - Check
> +     - Reason
> +   * - Patches contain Signed-off-by: Author Name <author@email>
> +     - States you are legally able to contribute the code. See :ref:`pat=
ch_emails_must_include_a_signed_off_by_line`
> +   * - Sent as patch emails to ``qemu-devel@nongnu.org``
> +     - The project uses an email list based workflow. See :ref:`submitti=
ng_your_patches`
> +   * - Be prepared to respond to review comments
> +     - Code that doesn't pass review will not get merged. See :ref:`part=
icipating_in_code_review`
> =20
>  You do not have to subscribe to post (list policy is to reply-to-all to
>  preserve CCs and keep non-subscribers in the loop on the threads they
> @@ -229,6 +222,19 @@ bisection doesn't land on a known-broken state.
>  Submitting your Patches
>  -----------------------
> =20
> +The QEMU project uses a public email based workflow for reviewing and
> +merging patches. As a result all contributions to QEMU must be **sent
> +as patches** to the qemu-devel `mailing list
> +<https://wiki.qemu.org/Contribute/MailingLists>`__. Patch
> +contributions should not be posted on the bug tracker, posted on
> +forums, or externally hosted and linked to. (We have other mailing
> +lists too, but all patches must go to qemu-devel, possibly with a Cc:
> +to another list.) ``git send-email`` (`step-by-step setup guide
> +<https://git-send-email.io/>`__ and `hints and tips
> +<https://elixir.bootlin.com/linux/latest/source/Documentation/process/em=
ail-clients.rst>`__)
> +works best for delivering the patch without mangling it, but
> +attachments can be used as a last resort on a first-time submission.
> +
>  .. _if_you_cannot_send_patch_emails:
> =20
>  If you cannot send patch emails
> @@ -314,10 +320,12 @@ git repository to fetch the original commit.
>  Patch emails must include a ``Signed-off-by:`` line
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
> -For more information see `SubmittingPatches 1.12
> -<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#=
n297>`__.
> -This is vital or we will not be able to apply your patch! Please use
> -your real name to sign a patch (not an alias or acronym).
> +Your patches **must** include a Signed-off-by: line. This is a hard
> +requirement because it's how you say "I'm legally okay to contribute
> +this and happy for it to go into QEMU". The process is modelled after
> +the `Linux kernel
> +<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#=
n297>`__
> +policy.
> =20
>  If you wrote the patch, make sure your "From:" and "Signed-off-by:"
>  lines use the same spelling. It's okay if you subscribe or contribute to
> @@ -327,6 +335,11 @@ include a "From:" line in the body of the email (dif=
ferent from your
>  envelope From:) that will give credit to the correct author; but again,
>  that author's Signed-off-by: line is mandatory, with the same spelling.
> =20
> +There are various tooling options for automatically adding these tags
> +include using ``git commit -s`` or ``git format-patch -s``. For more
> +information see `SubmittingPatches 1.12
> +<http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#=
n297>`__.
> +
>  .. _include_a_meaningful_cover_letter:
> =20
>  Include a meaningful cover letter
> @@ -397,9 +410,19 @@ Participating in Code Review
>  ----------------------------
> =20
>  All patches submitted to the QEMU project go through a code review
> -process before they are accepted. Some areas of code that are well
> -maintained may review patches quickly, lesser-loved areas of code may
> -have a longer delay.
> +process before they are accepted. This will often mean a series will
> +go through a number of iterations before being picked up by
> +:ref:`maintainers<maintainers>`. You therefor should be prepared to

therefore

> +read replies to your messages and be willing to act on them.
> +
> +Maintainers are often willing to manually fix up first-time
> +contributions, since there is a learning curve involved in making an
> +ideal patch submission. However for the best results you should
> +proactively respond to suggestions with changes or justifications for
> +your current approach.
> +
> +Some areas of code that are well maintained may review patches
> +quickly, lesser-loved areas of code may have a longer delay.
> =20
>  .. _stay_around_to_fix_problems_raised_in_code_review:

--Wf9ip5ASB5hBQPhw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNG1woACgkQnKSrs4Gr
c8g20Af9GPjxrKPIA8XX1V9tUrpcr9kCFqhIwoCrU4G6QZsX+EMY8Yo5whAMYoSv
X7bipmMDyItsTIfd3YjL0Uj3CEzQMox3P/OXMgQW00p28XUrWVdA018uXNPP53B/
6pyH0IM0r4e0gQlxBPx1emZVqCK9YOCgTyhxWS8VB8YeZ0vFhhu6uflgQ0Eykl38
epsWTM86yscU2anbawZfS14QVVVxAhZ7DTYq7SyUp1rnzthhwQpFipXc50SrV4m1
8LH2+DOGZki8snjC9NS0N3kQV46FVCH0JIKBf0QWR4WC2Rncybe7OQseghbmEJ/G
XQQQLn6bNXrzoBEUQfrM7Dejp+6lEg==
=m8H0
-----END PGP SIGNATURE-----

--Wf9ip5ASB5hBQPhw--


