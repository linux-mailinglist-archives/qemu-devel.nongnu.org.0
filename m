Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3533885B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:13:55 +0100 (CET)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdrm-0006V1-CF
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdlY-0007KB-UI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:07:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lKdlX-0003ZX-3h
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615540046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPwWdXHLPr/0jf1XfhB5sA15IUGWUEPtEodn1rN7ZW8=;
 b=iyy5BmehU/lDuu8oOi46HpPTYk+5WrO1xeCFSiR2uI9TEaA+3cRMKNpP7wAHbunz//pY69
 454YKbQIHblOy2mIzZDpVTK6PhRh/5HoT0skoc6ee0P4XHFWxxSYYlPUcvqZHLjhNJqp2t
 lexbQM+xW7yvdNyKm/mUPnnxY2QBTJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-MtpGE9lXPGug_BgL4q1BsA-1; Fri, 12 Mar 2021 04:07:22 -0500
X-MC-Unique: MtpGE9lXPGug_BgL4q1BsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E8418397A1;
 Fri, 12 Mar 2021 09:07:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA5B1F064;
 Fri, 12 Mar 2021 09:07:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 554FD1132C12; Fri, 12 Mar 2021 10:07:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Add a job to run common coccinelle checks
References: <20210311193006.1442775-1-philmd@redhat.com>
Date: Fri, 12 Mar 2021 10:07:16 +0100
In-Reply-To: <20210311193006.1442775-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 11 Mar 2021 20:30:06
 +0100")
Message-ID: <878s6s68qj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Add a job to run common coccinelle checks.

This makes sense only for coccinelle scripts that come up clean and have
a reasonably high confidence.

Come up clean: we get no reports for master.  Otherwise new reports will
drown in the old reports, and soon enough nobody will bother to look.

Reasonably high confidence: when the scripts complain, the complaint is
valid often enough, and when they propose a change, the change is good
enough often enough.

How do the scripts proposed in this patch score?

> We use spatch tool from Fedora 32 (Docker image) because
> more recent versions are failing.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20210311192700.1441263-1-philmd@redhat.com>
> ---
>  .gitlab-ci.d/containers.yml                   |  5 ++++
>  .gitlab-ci.yml                                | 26 +++++++++++++++++++
>  .../dockerfiles/fedora-coccinelle.docker      | 16 ++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/fedora-coccinelle.docker
>
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index 33e4046e233..8f14afdccab 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -249,3 +249,8 @@ amd64-opensuse-leap-container:
>    <<: *container_job_definition
>    variables:
>      NAME: opensuse-leap
> +
> +cocci-fedora-container:
> +  <<: *container_job_definition
> +  variables:
> +    NAME: fedora-coccinelle
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 07202f6ffb2..615a0b98fe2 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -746,6 +746,32 @@ build-libvhost-user:
>      - meson
>      - ninja
> =20
> +check-cocci:
> +  stage: build
> +  needs: ['cocci-fedora-container']
> +  image: $CI_REGISTRY_IMAGE/qemu/fedora-coccinelle:latest
> +  script:
> +    - for script in
> +            scripts/coccinelle/errp-guard.cocci

I doubt the tree's state permits this one.  Its output should not be
applied blindly.

> +            scripts/coccinelle/exec_rw_const.cocci
> +            scripts/coccinelle/inplace-byteswaps.cocci
> +            scripts/coccinelle/overflow_muldiv64.cocci
> +            scripts/coccinelle/qom-parent-type.cocci
> +            scripts/coccinelle/qom-parent-type.cocci
> +            scripts/coccinelle/remove_local_err.cocci
> +            scripts/coccinelle/remove_muldiv64.cocci
> +            scripts/coccinelle/return_directly.cocci
> +            scripts/coccinelle/typecast.cocci
> +            scripts/coccinelle/use-after-abort-fatal-errp.cocci
> +      ; do
> +        spatch --macro-file scripts/cocci-macro-file.h
> +               --sp-file $script
> +               --timeout 137
> +               --jobs 2
> +               --use-gitgrep
> +               --dir .
> +      ; done
> +
>  # Prepare for GitLab pages deployment. Anything copied into the
>  # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
>  pages:
> diff --git a/tests/docker/dockerfiles/fedora-coccinelle.docker b/tests/do=
cker/dockerfiles/fedora-coccinelle.docker
> new file mode 100644
> index 00000000000..5392c73fcb2
> --- /dev/null
> +++ b/tests/docker/dockerfiles/fedora-coccinelle.docker
> @@ -0,0 +1,16 @@
> +#
> +# Docker image to run Coccinelle spatch
> +# (program matching and transformation engine)
> +#
> +# Copyright (C) 2021 Red Hat, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +FROM fedora:32
> +
> +# Please keep this list sorted alphabetically
> +RUN dnf install -y \
> +    coccinelle \
> +    diffutils \
> +    findutils \
> +    git-core


