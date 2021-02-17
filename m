Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7731D93B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:12:22 +0100 (CET)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLgs-0000Dh-2J
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLeo-0007iZ-TA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:10:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLek-0005zT-1w
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:10:14 -0500
Received: by mail-wm1-x32c.google.com with SMTP id l17so1941674wmq.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/ZrACANPe8Sm4LT5UOKUctaPpl2sstTOmcOZag14p6E=;
 b=Pc33g6Sw4mTmtn7/JCKvSZbzhztgM3VPVDkmLHhZ3eRp0aloO7ab84y2czTWX74tI0
 u9StLNVI+ZaA4R//Bsr7XReiOnxCy1OuuJpEiX3MKbD+8uqDUO7kgKvhm8VNYXzuNxvk
 Pxk3DwYC2EvIAbI1uEzFAOZpHIIkwmcFrU1zG2oEvBALQ50wGwPm5wkGLBUZVhkMe9qP
 hGxruo2weyqdzUYVPTIF0JtMTveCJj2hSecgETwtXiNtZy3hkzU/HrgkbXEhw0cLcdGt
 C1lj2vyfnLzlgCGmkbCboRkvSj8PF7EQ4IPXsyMMEHNlDRJrbei7Fdyh4vCAOeG+nveL
 ESyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/ZrACANPe8Sm4LT5UOKUctaPpl2sstTOmcOZag14p6E=;
 b=BYIecFhR69Z4nUSj8Zb/1QSdZ2VQpJKWQ2SDbzpnkDeuF6t9ElLPPu+3G4qT6jqmbM
 rvSqEalGwsud/Tfj/xIq5USRU+sWIuFY7ymiKCGYs13oGi+G3oWZAR/aIBC7NqzN3ypv
 +/4Z+XWW6C+ZVDhnI8T4g259Tvsx8d6LJO3Mzok0MNP47qcFDHa8alpb8al7bDkaQT5i
 9k2g8ayY6T724RR45aCT6V7hA4ytqP0+UrVtNyW/fNuZuFXubKlMcQVRWno1rYgjAc13
 wU/DEM/xuynxLadMss3R+vRvhjUeuhS1Plv5evtjREAVlFPbB9Lc4OrqgMqoXpe5yiOC
 XU5w==
X-Gm-Message-State: AOAM531A+nFBhHl1JjgMvQyOk8JAE+u70XyCybccU7Ayvd/iXdlitbE0
 EeksvO85MDqQRzzv6giiopBOqQ==
X-Google-Smtp-Source: ABdhPJzKKBG2Lbbuq0hJlEZ+jcefoVuliBvuTlOEsAW0ItMNxtQ8g+iQ17X/eDnQ8BP5K68V+rbJhg==
X-Received: by 2002:a1c:f309:: with SMTP id q9mr6184163wmq.156.1613563808534; 
 Wed, 17 Feb 2021 04:10:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm5068775wrx.23.2021.02.17.04.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:10:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5D5B1FF7E;
 Wed, 17 Feb 2021 12:10:05 +0000 (GMT)
References: <20210118181255.314672-1-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docker: Bump Fedora images to release 33
Date: Wed, 17 Feb 2021 12:09:27 +0000
In-reply-to: <20210118181255.314672-1-philmd@redhat.com>
Message-ID: <874kiauc82.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Daniel =?utf-8?Q?Be?= =?utf-8?Q?rrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Fedora 33 was released on October 27, 2020.
>
> Update all the Fedora 32 images to this new release.

Queued to testing/next, thanks.
>
> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20210118181115.313742-1-philmd@redhat.com>
> hw/usb/hcd-xhci: Fix extraneous format-truncation error on 32-bit hosts
>
> Based-on: <20210118170308.282442-1-philmd@redhat.com>
> hw/usb/dev-uas: Fix Clang 11 -Wgnu-variable-sized-type-not-at-end error
> ---
>  tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
>  tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>  tests/docker/dockerfiles/fedora.docker             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/do=
cker/dockerfiles/fedora-cris-cross.docker
> index 09e7e449f9b..1dfff6e0b96 100644
> --- a/tests/docker/dockerfiles/fedora-cris-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
> @@ -2,7 +2,7 @@
>  # Cross compiler for cris system tests
>  #
>=20=20
> -FROM fedora:30
> +FROM fedora:33
>  ENV PACKAGES gcc-cris-linux-gnu
>  RUN dnf install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/do=
cker/dockerfiles/fedora-i386-cross.docker
> index a6e411291b9..966072c08e6 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:31
> +FROM fedora:33
>  ENV PACKAGES \
>      bzip2 \
>      diffutils \
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win32-cross.docker
> index 087df598a09..81b5659e9c5 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM fedora:33
>=20=20
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/d=
ocker/dockerfiles/fedora-win64-cross.docker
> index d5d2f5f00d6..bcb428e7242 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM fedora:33
>=20=20
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
> index 0b5053f2d09..9ba8c147edd 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM fedora:33
>=20=20
>  # Please keep this list sorted alphabetically
>  ENV PACKAGES \


--=20
Alex Benn=C3=A9e

