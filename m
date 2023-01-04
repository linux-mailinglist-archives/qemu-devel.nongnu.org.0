Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0165D69A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:55:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5AC-0004en-HL; Wed, 04 Jan 2023 09:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pD5AA-0004eQ-7c
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:54:42 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pD5A8-0000b8-EY
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:54:42 -0500
Received: by mail-lf1-x12c.google.com with SMTP id m6so40364541lfj.11
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtT44MabwEW6rfJh2LKeSkTzQEucDuL6f6VPA+/S558=;
 b=YsoSpJ6VCMqJwgzwtFB+u2+D5o2DRg0sVWU24HnGg9jpyvT2fIuKyhjqrgyXjLoZEa
 7GyE/7ch1NKNH9+xlUdC82TBY6HmbsQn+khyMHxASImdPZ2Uo1pzSwA9Q8Q9UMHR/PUl
 m/wLAp6xlYaT3helBPIMMGu0T8ox7koZ8yVn9ZAMcTSgpS2frBBGHBwShzNASegdbDN1
 qr4GCvICg5nDrHwjph9l7wmSBUL0yWo19NtJi7RdlPKmmkDjmb1viARpNzSDE6/U13+0
 I7GEga5zcQY5LoBkGGnhUe5pEQLw3s8S7pFSnAdxdmFfRL/TGCPO2YY3l/egHGY/+2eI
 7M9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtT44MabwEW6rfJh2LKeSkTzQEucDuL6f6VPA+/S558=;
 b=VnfIWOQz1mTFNQRRANZQBmMqnnqQXWJUlWE51OdOCxROpwSkftqUxJ3vkaSAkGH1ja
 qfdrxTrPX9mRha2ndqk8nUTaKBdbIDcHdoB4MpB7xyFQQS3dt8j7B3MZiJwLzmullQ7w
 cDStf9Z3F16L6+pp/b/V3Tgd7RTWG8hWVr4wFD5leJGB14MNMduJnMSX4+6M53HF1RFt
 pvTrZOU9no+twenwSyIjbv7pEXbvTvJc67z/yyC8NCSUsvGLIvDxr2VIX1GnF9N6T1Xr
 GVamuWS6nMN5Ahb3BUaNw6v9DQfY6GP5ILNSWukjzS7XjqYDj4e7YFxfcurYzDBgu7dF
 1h0g==
X-Gm-Message-State: AFqh2kowLDBE7448C++xGQRKG7WP2dLD/T4LImDkHNNCqVEIdH8hlsYq
 xib9FoBTQL8VWFa91/zC9V3OHSkYs5CxfPRu4ls=
X-Google-Smtp-Source: AMrXdXtGCPpeITd6hKP8noWp3jnh7i5dxjTh8yTUULkGedqdNVcLijxzhawY7i56KKSyatCOWVBHDcVfxxHMCjCucwc=
X-Received: by 2002:ac2:4141:0:b0:4b5:886b:d4af with SMTP id
 c1-20020ac24141000000b004b5886bd4afmr4772628lfi.276.1672844078077; Wed, 04
 Jan 2023 06:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20230104123559.277586-1-thuth@redhat.com>
In-Reply-To: <20230104123559.277586-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 4 Jan 2023 18:54:26 +0400
Message-ID: <CAJ+F1C+T2HYmRj2uvjMsmAC11vAA53rwrH7kDh1pFuT8fWj4Ow@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Wed, Jan 4, 2023 at 4:36 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The windows jobs (especially the 32-bit job) recently started to
> hit the timeout limit. Bump it a little bit to ease the situation
> (80 minutes is quite long already - OTOH, these jobs do not have to
> wait for a job from the container stage to finish, so this should
> still be OK).
>
> Additionally, some update on the container side recently enabled
> OpenGL in these jobs - but the corresponding code fails to compile.
> Thus disable OpenGL here for the time being until someone figured
> out the proper fix in the shader code for this.

It seems msys2 recently enabled egl support, but qemu egl code has not
been tested on win32 yet.

I'll take a look. I am adding egl support in fedora mingw as well:
https://src.fedoraproject.org/rpms/mingw-libepoxy/pull-request/3

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Now that the timeout and OpenGL problems are gone, the 64-bit is
>  working fine for me again. However, I'm still seeing random issues
>  with the 32-bit job ... not sure whether it's a problem on the
>  QEMU side or whether the builders are currently instable, since
>  the issues do not reproduce reliably...
>
>  .gitlab-ci.d/windows.yml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 9b5c4bcd8a..22f794e537 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>        - ${CI_PROJECT_DIR}/msys64/var/cache
>    needs: []
>    stage: build
> -  timeout: 70m
> +  timeout: 80m
>    before_script:
>    - If ( !(Test-Path -Path msys64\var\cache ) ) {
>        mkdir msys64\var\cache
> @@ -71,7 +71,7 @@ msys2-64bit:
>    # for the msys2 64-bit job, due to the build could not complete within
>    # the project timeout.
>    - ..\msys64\usr\bin\bash -lc '../configure --target-list=3Dx86_64-soft=
mmu
> -      --without-default-devices'
> +      --without-default-devices --disable-opengl'
>    - ..\msys64\usr\bin\bash -lc 'make'
>    # qTests don't run successfully with "--without-default-devices",
>    # so let's exclude the qtests from CI for now.
> @@ -113,6 +113,7 @@ msys2-32bit:
>    - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - mkdir output
>    - cd output
> -  - ..\msys64\usr\bin\bash -lc '../configure --target-list=3Dppc64-softm=
mu'
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=3Dppc64-softm=
mu
> +        --disable-opengl'
>    - ..\msys64\usr\bin\bash -lc 'make'
>    - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.t=
xt; exit 1; } ;'
> --
> 2.31.1
>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

