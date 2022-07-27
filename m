Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12A5834CE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 23:23:13 +0200 (CEST)
Received: from localhost ([::1]:45534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGoUp-0005fO-4R
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 17:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGoSt-0003va-CB; Wed, 27 Jul 2022 17:21:11 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:37413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGoSr-0008Qi-0N; Wed, 27 Jul 2022 17:21:11 -0400
Received: by mail-ua1-f48.google.com with SMTP id s7so54279uao.4;
 Wed, 27 Jul 2022 14:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GNaoZ2q+9hgMhAYMWP0afi/9yxeMTyQwZq40xr65n4M=;
 b=FDQhaKy7AjZj0v2nZHB1cXX1iCOS02uAudW+IDmjVDifZthtXiyJrdz5ekRA74hGho
 JB/6IT40r2AvK7SQKDngoUNeMPsgOD+Zvc89veez1RAd7JjIlJ4TejjP3b53SwQ66Z3D
 M8xU9KhYaKkXdN8rwA8NFQytsfknjYJ/GnTW354CKJXel5ND8QlEoo6xYocn8jsgCkiI
 IZOth0ew5P3wRXMLUxV6IFeciuunJcK9YT5AnKuAmOgu7/mgg9XH4eOBl9740BFOtFVw
 12kDHD1/4gbbuuYLdaboNdY5c5U+18I0ZZZSKV8ElWgweL1m8VlJmbmaHOfpzpykUrdx
 QFhA==
X-Gm-Message-State: AJIora9HW6oBNtG8ujKP63rZ7dVwJoS8DuBUCijwpvLSngBSB7GwUkdn
 im+FqPGfO9DjscE5pIJKa48CTvO5S93Bjb8vBf0=
X-Google-Smtp-Source: AGRyM1t7Rf/Ap2jbX9xVYvem/VFPExsMiUJHB5SO8Di0+mvmd5nRVfEBfBPqw3i/fyyci8kWZzCz/b4lnb9HwWLdBPo=
X-Received: by 2002:ab0:7c50:0:b0:384:e315:a358 with SMTP id
 d16-20020ab07c50000000b00384e315a358mr536685uaw.118.1658956867594; Wed, 27
 Jul 2022 14:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-9-lucas.araujo@eldorado.org.br>
In-Reply-To: <20220727163632.59806-9-lucas.araujo@eldorado.org.br>
Date: Wed, 27 Jul 2022 23:20:56 +0200
Message-ID: <CAAdtpL6=AZkgs7rLGGxwmnyaB6WPDXdUwN2Cj4unZTkkci_YZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] tests/docker: Selective line reading by python
 script
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Willian Rampazzo <willianr@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Erik Skultety <eskultet@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.222.48;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

+Erik/Daniel

On Wed, Jul 27, 2022 at 6:37 PM Lucas Mateus Castro(alqotel)
<lucas.araujo@eldorado.org.br> wrote:
>
> Building some images failed on ppc64le because the dockerfile tried to
> install some packages that are only available in x86 and arm64, to solve
> this while still having those packages be available in those architectures
> a comment was put before the installation command to instruct the python
> script into ignoring those lines for some architectures (in this case
> ppc64le)
>
> Overall I'm not a big fan of the way I solved this problem, so I'd like
> to know if anyone has a better way to make these dockerfilse work in
> PPC64LE.
>
> For context the base images used here are available in PPC64LE but some
> of the packages installed are not (in alpine's case it's XEN, which is
> only available to x86 and ARM), so this patch create a ignore_list which
> is set on a per-architecture basis, and any packages in a dockerfile in
> this ignore_list will not be copied to the temporary dockerfile used in
> the docker command.

Shouldn't this be done on lcitool side?
(https://gitlab.com/libvirt/libvirt-ci/-/tree/master/lcitool)

> Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
> ---
>  tests/docker/docker.py                 | 15 ++++++++++++---
>  tests/docker/dockerfiles/alpine.docker |  2 ++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/tests/docker/docker.py b/tests/docker/docker.py
> index d0af2861b8..9b962d1c78 100755
> --- a/tests/docker/docker.py
> +++ b/tests/docker/docker.py
> @@ -14,6 +14,7 @@
>  import os
>  import sys
>  import subprocess
> +import platform
>  import json
>  import hashlib
>  import atexit
> @@ -207,8 +208,15 @@ def _read_qemu_dockerfile(img_name):
>
>  def _dockerfile_preprocess(df):
>      out = ""
> +    ignore_list = []
>      for l in df.splitlines():
> -        if len(l.strip()) == 0 or l.startswith("#"):
> +        if len(l.strip()) == 0:
> +            continue
> +        if l.startswith("#"):
> +            if len(l.split()) >= 3:
> +                if l.split()[1] == "ignore":
> +                    if platform.processor() in l.split()[2].split(','):
> +                        ignore_list += l.split()[3].split(',')
>              continue
>          from_pref = "FROM qemu/"
>          if l.startswith(from_pref):
> @@ -219,7 +227,8 @@ def _dockerfile_preprocess(df):
>              inlining = _read_qemu_dockerfile(l[len(from_pref):])
>              out += _dockerfile_preprocess(inlining)
>              continue
> -        out += l + "\n"
> +        if not any(x in l.split() for x in ignore_list):
> +            out += l + "\n"
>      return out
>
>
> @@ -330,7 +339,7 @@ def build_image(self, tag, docker_dir, dockerfile,
>          tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
>                                               encoding='utf-8',
>                                               dir=docker_dir, suffix=".docker")
> -        tmp_df.write(dockerfile)
> +        tmp_df.write(_dockerfile_preprocess(dockerfile))
>
>          if user:
>              uid = os.getuid()
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 2943a99730..5cec46d8f2 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -6,6 +6,8 @@
>
>  FROM docker.io/library/alpine:edge
>
> +# Lines to by ignored when this file is read by the python script
> +# ignore ppc64le,ppc64 xen-dev
>  RUN apk update && \
>      apk upgrade && \
>      apk add \
> --
> 2.25.1
>

