Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E8AC034
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 21:08:43 +0200 (CEST)
Received: from localhost ([::1]:59474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Jb8-0000J2-HQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 15:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40733)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i6JYG-0006ds-UM
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 15:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i6JYF-0000yB-8a
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 15:05:44 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:47038)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i6JYE-0000wx-Lh
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 15:05:43 -0400
Received: by mail-oi1-x243.google.com with SMTP id x7so5810124oie.13
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VuFeZk6bcFV8nXTtDJxbZInrPsNA51bavqI+ylOvIqI=;
 b=A7kr0N4RcYyRKI1ox7dfa9yEeHxZK2wBgtNTvgH580l6GIo8dlk5Wf9/koXALefVHO
 NjHJ52mM3ZQcP1ZfjsdmCgGrK0XWvfAjicUNbAPrHdyBszLtKV6Kk62pTs0ifvmGczFn
 U4iL0HvwgaKy+EIAuOKlSOPL7hVPu8VAzewNKXKjAyWhbmv1VDMDbFGmoC+4VWaW32em
 Ul/KwSomm0q71JhQHF+PiAbjFPcmXPMHKfMsDMMgnFZU6fVIiUt8pnB+wSSk9mfkj20K
 lBo6JIxnq8SDMKypZC0NNF+BYvXo81gdywT5B8Vh+MXkWGYs8KAD7HVKuYtiqQ/DecVU
 GaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VuFeZk6bcFV8nXTtDJxbZInrPsNA51bavqI+ylOvIqI=;
 b=dKWk9eitCG+DL+nNeSDAX1+Uxpjipp//G4N3wD2an4iFCQ7hZ1Z8y6nmaGr5FIy5YY
 yMwFxZoh3Ibx38V43mqtXa9b9Ax4HZdgtDuXF/l8qAsCaLVrwv14RUQZEBPFW3Kq7IZP
 qsSVOZ9KE/UiWYHHgj64ftIhMR2AkcQdAnspE6IZAk/IqAHCZtt6HqLOOXC0AkJz1bFh
 yP0xbiVDqXc7g8gJvJJityJcjTU95MHZogYztJimE/o3XVC35tSu3b5oV6nhAUG6v4aE
 nA7ei4ydLwAbEbiLfYDiOznINzOdPtM24oPpg0DkZoLfxiZZ7l4Iycdz4o9CUNaKQPri
 uH3A==
X-Gm-Message-State: APjAAAXAqCn655R+80Jr9DvFCGTPcyu0ykcnzVy9sSdBMEfUdSrLXZdk
 o5A8x0UMxZ3CZie1/u9RO/UX8KtSRBnJ3c28nUw=
X-Google-Smtp-Source: APXvYqyVxhaYj/TwVR5L1TiW8X2dGkOku75qhYEJjYnp4QWg/KCERQsGBMybsWPDmcP3NQeccNyIw7z9Bh+fFacLg28=
X-Received: by 2002:aca:c505:: with SMTP id v5mr8044622oif.79.1567796740749;
 Fri, 06 Sep 2019 12:05:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 12:05:40 -0700 (PDT)
Received: by 2002:a9d:340a:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 12:05:40 -0700 (PDT)
In-Reply-To: <20190904203013.9028-19-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
 <20190904203013.9028-19-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 6 Sep 2019 21:05:40 +0200
Message-ID: <CAL1e-=i2+dDq1atGvW=wzaK5C4=D7vP13k98Nw3NMyn-t2Z=RQ@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v1 18/42] tests/docker: move our mips64
 cross compile to Buster
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
Cc: fam@euphon.net, berrange@redhat.com,
 Aleksandar Markovic <amarkovic@wavecomp.com>, stefanb@linux.vnet.ibm.com,
 Aleksandar Rikalo <arikalo@wavecomp.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, f4bug@amsat.org, cota@braap.org, stefanha@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

04.09.2019. 23.59, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> =D1=98=D0=B5=
 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Now Buster is released we can stop relying on the movable feast that
> is Sid for our cross-compiler for building tests.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  tests/docker/Makefile.include                       | 2 +-
>  tests/docker/dockerfiles/debian-mips64-cross.docker | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.includ=
e
> index e946aae14fa..896c1c5a601 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -102,11 +102,11 @@ docker-image-debian-alpha-cross:
docker-image-debian10
>  docker-image-debian-arm64-cross: docker-image-debian10
>  docker-image-debian-hppa-cross: docker-image-debian10
>  docker-image-debian-m68k-cross: docker-image-debian10
> +docker-image-debian-mips64-cross: docker-image-debian10
>  docker-image-debian-powerpc-cross: docker-image-debian10
>  docker-image-debian-sh4-cross: docker-image-debian10
>  docker-image-debian-sparc64-cross: docker-image-debian10
>
> -docker-image-debian-mips64-cross: docker-image-debian-sid
>  docker-image-debian-riscv64-cross: docker-image-debian-sid
>  docker-image-debian-ppc64-cross: docker-image-debian-sid
>  docker-image-travis: NOUSER=3D1
> diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker
b/tests/docker/dockerfiles/debian-mips64-cross.docker
> index bf0073a4662..1a79505d696 100644
> --- a/tests/docker/dockerfiles/debian-mips64-cross.docker
> +++ b/tests/docker/dockerfiles/debian-mips64-cross.docker
> @@ -1,10 +1,9 @@
>  #
>  # Docker cross-compiler target
>  #
> -# This docker target builds on the debian sid base image which
> -# contains cross compilers for Debian "ports" targets.
> +# This docker target builds on the debian Buster base image.
>  #
> -FROM qemu:debian-sid
> +FROM qemu:debian10
>
>  RUN apt update && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
> --
> 2.20.1
>
>
