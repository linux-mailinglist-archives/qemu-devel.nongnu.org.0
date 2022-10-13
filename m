Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587755FD6E2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:19:45 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuNS-00088U-HF
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oitkI-0003xO-UB
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:39:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oitkF-0005wq-H1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 04:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665650350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gOZCUISG+HiWxzIIqiLQlOT9fruItmVTzb0x2fMNE0=;
 b=f74Mfn654tv0wDapkr2LjrKAL4oSLF25y8XlH7daCldnIHWlfUrkKa6ZCy1qUwc0t1LSm2
 RiGZyelo4chjYhTTOQlYBRbIJ4Bo8OvveXx1bFCcpJDvW0+rIhXCOQ5zV0XijC9q2BAvi8
 Bym9FCSU3CI6wq6CSTsiWqxlxzl/bLk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-C8k9VqncM3WeCCbLpNZenQ-1; Thu, 13 Oct 2022 04:39:06 -0400
X-MC-Unique: C8k9VqncM3WeCCbLpNZenQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 456D33C0F454;
 Thu, 13 Oct 2022 08:39:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECE84414A809;
 Thu, 13 Oct 2022 08:39:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 189C321E691D; Thu, 13 Oct 2022 10:39:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  pbonzini@redhat.com,  stefanha@redhat.com,
 peter.maydell@linaro.org,  agraf@csgraf.de
Subject: Re: [RFC PATCH 1/4] docs/devel: add a maintainers section to
 development process
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
Date: Thu, 13 Oct 2022 10:39:02 +0200
In-Reply-To: <20221012121152.1179051-2-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 12 Oct 2022 13:11:49 +0100")
Message-ID: <874jw815jt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We don't currently have a clear place in the documentation to describe
> the rolls and responsibilities of a maintainer. Lets create one so we
> can. I've moved a few small bits out of other files to try and keep
> everything in one place.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/code-of-conduct.rst           |  2 +
>  docs/devel/index-process.rst             |  1 +
>  docs/devel/maintainers.rst               | 84 ++++++++++++++++++++++++
>  docs/devel/submitting-a-pull-request.rst | 12 ++--
>  4 files changed, 91 insertions(+), 8 deletions(-)
>  create mode 100644 docs/devel/maintainers.rst
>
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
>=20=20
> diff --git a/docs/devel/index-process.rst b/docs/devel/index-process.rst
> index d0d7a200fd..d50dd74c3e 100644
> --- a/docs/devel/index-process.rst
> +++ b/docs/devel/index-process.rst
> @@ -8,6 +8,7 @@ Notes about how to interact with the community and how an=
d where to submit patch
>=20=20
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

Do you mean "Role"?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Maintainers are a critical part of the projects contributor ecosystem.
> +They come from a wide range of backgrounds from unpaid hobbyists
> +working in their spare time to employees who work on the project as
> +part of their job. Maintainer activities include:
> +
> +  - reviewing patches and suggesting changes
> +  - preparing pull requests for their subsystems
> +  - participating other project activities

participating in

I think this doesn't quite do justice to what we expect maintainers to
do.

Besides shepherding patches, we expect maintainers to guard the
integrity of their subsystem and the "health" of the developer
community.

We generally defer to a maintainer's reasoned judgement.  This means a
maintainer has a certain power to say no.  With power comes
responsibility.

> +
> +They are also human and subject to the same pressures as everyone else
> +including overload and burn out. Like everyone else they are subject

burnout

> +to projects :ref:`code_of_conduct`.

Arguably even more so than "ordinary" contributors, because by their
visibility they necessarily serve as role models.  With power comes
responsibility.

Should we add something on how a maintainer could get advice?  Say when
they have to deal with bad behavior.

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

bear in mind

> +it does not mean they are paid to support you. This is open source and
> +the code comes with no warranty and the project makes no guarantees
> +about dealing with bugs or features requests.
> +
> +Becoming a maintainer
> +---------------------
> +
> +Maintainers are volunteers who put themselves forward to keep an eye
> +on an area of code.

"Volunteers who put themselves forward"...  The press gangs wielding
clubs are a figment of your drunken imagination!

>                      They are generally accepted by the community to
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
> diff --git a/docs/devel/submitting-a-pull-request.rst b/docs/devel/submit=
ting-a-pull-request.rst
> index c9d1e8afd9..a4cd7ebbb6 100644
> --- a/docs/devel/submitting-a-pull-request.rst
> +++ b/docs/devel/submitting-a-pull-request.rst
> @@ -53,14 +53,10 @@ series) and that "make check" passes before sending o=
ut the pull
>  request. As a submaintainer you're one of QEMU's lines of defense
>  against bad code, so double check the details.
>=20=20
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
>=20=20
>  **Pull requests not for master should say "not for master" and have
>  "PULL SUBSYSTEM whatever" in the subject tag**. If your pull request is


