Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB2612717
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 04:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooytC-0007Va-MY; Sat, 29 Oct 2022 23:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooyt8-0007VK-VF
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 23:21:31 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooyt7-0001jI-3r
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 23:21:30 -0400
Received: by mail-qk1-x736.google.com with SMTP id f8so5845599qkg.3
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R8rDivxZQ6Zph//V2hA7NTpQMX7WMWCbLxDyt9vhZmE=;
 b=lgDU8deaEXhmHLP74YNepPxLDyeckBf84cySyWEJEYxnsgAAl20MJmfscgWz3NK5SL
 Fam4wfd0g1qRLm+OM4bGXf1F24ZTQoft0UrKvYsA9XQYxvodv6P7LfkDtU1gxuw/8/aJ
 OhIbtoEVigKgwflLzj9NCeWigyLwzihOQlLmgxZrrVFq6oFYxWI7NLvoLb2yUoysDSYM
 1QjJoEdGq+4T7VGIaQJoWJCx5e5E1JkQAZOVj+eklqq9D+4eev0i7a93miHJ58CimSgn
 xY+2jaP7Sr2m3lgEckVjEn06AckL3+DBd73NdyJdi3n7gRRuSM6tQ9oApZRfN+P207bX
 JhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8rDivxZQ6Zph//V2hA7NTpQMX7WMWCbLxDyt9vhZmE=;
 b=Yx3c4lXGMmha58HSXji6cdoC4W/RyGgOsD3L6Gc7C0828XFUnjnOS0Y8Kt3g8Ke22E
 hbFZ1lEw+d/H4i53PylpYXisNyWVX+LVwRxmOHPe1VvHGcWiKUBtdrmZL6Woxz/9/nx6
 FBCq9VJH7Ogf8+g6eqb8OVOu/DMNZ8vW4DBoDiSXCQlX+wyZU4EFjPSKCl9G2coZbssX
 kRnYdcKQIQW87IY3lMKUVF5aSD9QUHrkVt72bczhwWonQ7GrpdoaJ6G5J+uG7q0XCk0X
 ciJ05KDWQTfL1jyqg88uJWK3YwTsQvrTa88cUH7j98A+bsD6IgJsuOAnwN62Jd/pM7N2
 pEpg==
X-Gm-Message-State: ACrzQf2/fZLvMFk1kLGRbpwq0y71A3qS+5EGHTwMOZaKEzzzAL4VX9BR
 gHlGSkr/HH7DCLahdZ6M9oKdjh8VExegKcjzbko=
X-Google-Smtp-Source: AMsMyM5t7U533JiaDkC+hAxaA+RqkR7Rbk9Tn5oVCLhg5nraguSP2ZTfyr6mVr2b4bqkQ0aT5d92WrwE8pDjrqX2I6o=
X-Received: by 2002:a37:63c4:0:b0:6fa:23a2:9fc6 with SMTP id
 x187-20020a3763c4000000b006fa23a29fc6mr739995qkb.376.1667100087967; Sat, 29
 Oct 2022 20:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-8-bmeng.cn@gmail.com>
 <ae19df77-a7b2-5ad6-710b-bc3c2d226978@weilnetz.de>
In-Reply-To: <ae19df77-a7b2-5ad6-710b-bc3c2d226978@weilnetz.de>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 30 Oct 2022 11:21:16 +0800
Message-ID: <CAEUhbmXiGOu6KT8vUAzXc92XQa9WiaUi7=ac5pDcDBC3Cs16cQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in
 the CI
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Oct 30, 2022 at 12:39 AM Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 08.09.22 um 15:28 schrieb Bin Meng:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Now that we have supported packaging DLLs automatically, let's add
> > the 'make installer' in the CI and publish the generated installer
> > file as an artifact.
> >
> > Increase the job timeout to 90 minutes to accommodate to it.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   .gitlab-ci.d/windows.yml | 27 +++++++++++++++++++--------
> >   1 file changed, 19 insertions(+), 8 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index fffb202658..3a94d40e73 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -10,7 +10,7 @@
> >         - ${CI_PROJECT_DIR}/msys64/var/cache
> >     needs: []
> >     stage: build
> > -  timeout: 70m
> > +  timeout: 90m
> >     before_script:
> >     - If ( !(Test-Path -Path msys64\var\cache ) ) {
> >         mkdir msys64\var\cache
> > @@ -28,6 +28,11 @@
> >     - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
> >     - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
> >     - taskkill /F /FI "MODULES eq msys-2.0.dll"
> > +  artifacts:
> > +    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
> > +    expire_in: 7 days
> > +    paths:
> > +      - build/qemu-setup*.exe
> >
> >   msys2-64bit:
> >     extends: .shared_msys2_builder
> > @@ -51,6 +56,7 @@ msys2-64bit:
> >         mingw-w64-x86_64-lzo2
> >         mingw-w64-x86_64-nettle
> >         mingw-w64-x86_64-ninja
> > +      mingw-w64-x86_64-nsis
> >         mingw-w64-x86_64-pixman
> >         mingw-w64-x86_64-pkgconf
> >         mingw-w64-x86_64-python
> > @@ -60,12 +66,15 @@ msys2-64bit:
> >         mingw-w64-x86_64-usbredir
> >         mingw-w64-x86_64-zstd "
> >     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> > -  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
> > +  - $env:MSYSTEM = 'MINGW64'     # Start a 64-bit MinGW environment
>
> I use Mingw-w64, not MinGW. :-)
>
> https://www.mingw-w64.org/ uses inconsistent case, mostly Mingw-w64, but
> also MinGW-w64. The same confusion exists in the description of the
> Debian packages, but there MinGW-w64 is more common.
>
> So there seems to be no right or wrong.

I would suggest we either use mingw-w64, or MinGW-w64 :)

>
> >     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> > -  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
> > +  - mkdir build
> > +  - cd build
> > +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
> >         --enable-capstone --without-default-devices'
> > -  - .\msys64\usr\bin\bash -lc 'make'
> > -  - .\msys64\usr\bin\bash -lc 'make check'
> > +  - ..\msys64\usr\bin\bash -lc 'make'
> > +  - ..\msys64\usr\bin\bash -lc 'make check'
> > +  - ..\msys64\usr\bin\bash -lc 'make installer'
> >
> >   msys2-32bit:
> >     extends: .shared_msys2_builder
> > @@ -89,6 +98,7 @@ msys2-32bit:
> >         mingw-w64-i686-lzo2
> >         mingw-w64-i686-nettle
> >         mingw-w64-i686-ninja
> > +      mingw-w64-i686-nsis
> >         mingw-w64-i686-pixman
> >         mingw-w64-i686-pkgconf
> >         mingw-w64-i686-python
> > @@ -98,10 +108,11 @@ msys2-32bit:
> >         mingw-w64-i686-usbredir
> >         mingw-w64-i686-zstd "
> >     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> > -  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
> > +  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
> >     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> > -  - mkdir output
> > -  - cd output
> > +  - mkdir build
> > +  - cd build
> >     - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
> >     - ..\msys64\usr\bin\bash -lc 'make'
> >     - ..\msys64\usr\bin\bash -lc 'make check'
> > +  - ..\msys64\usr\bin\bash -lc 'make installer'
>
> Maybe it is sufficient to build only a 64 bit installer. Is there still
> need for QEMU on 32 bit Windows? For CI, most parts of the NSIS process
> (which requires a lot of resources) are covered by either 32 or 64 bit
> builds, so running both might be unnecessary.

I see no need to support QEMU on 32-bit Windows as it is less common.

Regards,
Bin

