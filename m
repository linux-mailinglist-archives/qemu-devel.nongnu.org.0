Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3856BB5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 15:50:04 +0200 (CEST)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOj5-0005l8-7W
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 09:50:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1iCOdv-0002xu-FU
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <flukshun@gmail.com>) id 1iCOdu-0008LK-1y
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:44:43 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:45858)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <flukshun@gmail.com>) id 1iCOdt-0008L1-Rb
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:44:42 -0400
Received: by mail-ot1-x32b.google.com with SMTP id 41so12089911oti.12
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=vqr0we6j3dSE53YXx7KMpTjh0xVWMVevJVSNY8rSHqs=;
 b=Ap5cC+QzsvfD97/r2H//Ywrci1aDx2ceNbFCC8fQWFCQFIyhU0ZjujDUCbPGGHEgHQ
 oXgShP2JrYM9Cdjn9oS7sCY5knFN0PSiuVm4GsP//M+VZSfGw2zqfWHxgA44wDcx15+J
 YsO/cpCy+z7+aqerBhc/YgzAzQNxYjm6PJVDLVxU+fMOKBteLQhWV91w7WB3smj0hPbm
 HIxYCBsmGi5Jx9azPC1AZmteSFXvTMal3RafgZcpz2UvwCGVM+s0Rd0gfOfx0ANpd9xJ
 7p7ZzsQP4j69yfeB7xc+uwQxajB2wkxNp4Uj1B3sBM3noZhQk8vR1+gZTCGYpsjAxelj
 1PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=vqr0we6j3dSE53YXx7KMpTjh0xVWMVevJVSNY8rSHqs=;
 b=OwUKx7jPH2dVmrg7VAlB8/qVBhHh/KurwlDkIr2MsqLEFcGdMjw84sGYRt5N05bdqV
 lHAzaC7WJCGB1WoHOoZIRhGNbuskHHJ8+jlKrp+T3H53kvZVMW77T+tRX4yVKT/1lhUg
 pH5N/6+3QacqSHTrkqoLSJcqBFigtIkSQ82Pt50x36IfySy/iRXEiaUXEiXJ7RdJmxmj
 MvUzypyBABnvV75qAQwRNpZICk9hUDgAhtB9YWbZmk2azE5kcl5BpMt/PAeRY4fbqNer
 UFN6ML++V4z+h0aM3qEu2wy9EpSUdc+CMO4MUtJqCFthmpTWi42sxb4EddJq8mszf8eH
 CL2Q==
X-Gm-Message-State: APjAAAU7WL7HMa3BeZZgz8qJEnTomwaBObbBIf/F5LVzMVoLkJGv59oK
 2rWSuO8hKXbKfmQHO8qc/9E=
X-Google-Smtp-Source: APXvYqxy79rRBUtAx+M3Ol6ehoquoDkHnPHJIjRx2LFgeMvwhwmIAz4idASnRFqGXt/eRwxF/8K3LQ==
X-Received: by 2002:a9d:19a8:: with SMTP id k37mr22215115otk.172.1569246280451; 
 Mon, 23 Sep 2019 06:44:40 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id z16sm3853406otq.78.2019.09.23.06.44.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Sep 2019 06:44:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <20190920174219.22005-1-philmd@redhat.com>
References: <20190920174219.22005-1-philmd@redhat.com>
Message-ID: <156924627485.4270.10312153723917388232@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] .travis.yml: Test the release tarball
Date: Mon, 23 Sep 2019 08:44:34 -0500
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
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
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bruce Rogers <brogers@suse.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting Philippe Mathieu-Daud=C3=A9 (2019-09-20 12:42:19)
> Add a job to generate the release tarball and build/install few
> QEMU targets from it.
> =

> Ideally we should build the 'efi' target from the 'roms' directory,
> but it is too time consuming.

Individual targets might not be too bad. For instance:

  make -f Makefile.edk2 ../pc-bios/edk2-x86_64-secure-code.fd.bz2

builds in about 7m on my 2-core laptop, but the invocation is sort of hacky.
Probably makes sense to expose via `make efi-<arch>` targets before adding
such a test.

Cases covered here seem like a good starting point. Just some minor comments
below.

> =

> This job is only triggered when a tag starting with 'v' is pushed,
> which is the case with release candidate tags.
> =

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> This job is quick enough: Ran for 15 min 32 sec
> https://travis-ci.org/philmd/qemu/jobs/587583631
> =

> Based-on: <20190912231202.12327-1-mdroth@linux.vnet.ibm.com>
> "Fix tarball builds of UEFI/EDK2 firmware"
> https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg02734.html
> ---
>  .travis.yml | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/.travis.yml b/.travis.yml
> index d0b9e099b9..a21f99d22d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -339,3 +339,25 @@ matrix:
>          - CONFIG=3D"--target-list=3Dxtensa-softmmu,arm-softmmu,aarch64-s=
oftmmu,alpha-softmmu"
>          - TEST_CMD=3D"make -j3 check-tcg V=3D1"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
> +
> +
> +    # Release builds
> +    # The make-release script expect a QEMU version, so our tag must sta=
rt with a 'v'
> +    - if: tag IS present AND tag =3D~ ^v

Might ^v be a bit too open-ended? Perhaps ^v\d+\. or something of the
sort?

> +      env:
> +        # We want to build from the release tarball
> +        - BUILD_DIR=3D"release/build/dir" SRC_DIR=3D"../../.."
> +        - BASE_CONFIG=3D"--prefix=3D$PWD/dist"
> +        - CONFIG=3D"--target-list=3Dx86_64-softmmu,aarch64-softmmu,armeb=
-linux-user,ppc-linux-user"
> +        - TEST_CMD=3D"make install -j3"
> +        - QEMU_VERSION=3D"${TRAVIS_TAG:1}"
> +        - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
> +      before_script:
> +        - command -v ccache && ccache --zero-stats
> +        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
> +      script:
> +        - ${SRC_DIR}/scripts/make-release ${SRC_DIR} ${QEMU_VERSION}

Same result currently, but the `make qemu-$version.tar.bz2` target is proba=
bly
more robust/stable to test with.

> +        - ls -l qemu-${QEMU_VERSION}.tar.bz2
> +        - tar -xf qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
> +        - ./configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && ex=
it 1; }
> +        - make install
> -- =

> 2.20.1
>=20

