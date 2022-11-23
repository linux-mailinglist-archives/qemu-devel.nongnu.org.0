Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B0636142
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:14:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqVM-0000Hb-TQ; Wed, 23 Nov 2022 09:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oxqVJ-0000HJ-LQ
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:13:33 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oxqVE-0002sj-JI
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:13:31 -0500
Received: by mail-lj1-x234.google.com with SMTP id z24so21532602ljn.4
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sg8Jj1A/E263IFB05cj4OCNikbZh5MPzP026k4jLNEo=;
 b=iqRL1I0lyixWnC9JyLNzJqI6q03+tP4BqwC+omCdtHloWmLk+zc5juqd1Cl2gXheSu
 Xxve+ziQwcDY7YAp1duPO3lFtlIVj1fIKypEdPKf2PJTbosJlSB1JnndkLDuzFTmimW3
 8oBjKmU1pujZ5nULSXrVMeRNz3kuD9qN0AJs+Riyxusm6if5ciJJ4H75OiCoLdf6bO4k
 wbI+C61yO8y2LD7ho2ToT7x+l54azspNdfKb7LaimkQtKYuQMvOCgqX/JXAAVAakpxsV
 2Df8I/vJ8e3KdIf5T9DJsKweYFtqZqMwcuAhxGPSdTPaj+cwk9MsDO5bITJ6ZCYYBc6A
 J7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sg8Jj1A/E263IFB05cj4OCNikbZh5MPzP026k4jLNEo=;
 b=VyQCzRSwSzKX8GQzkcnXJy4iBrJm88hLfUtG4bjAeNvAkXAscUxtMLlqq3tE1GgCk5
 jUZSUK0BqPV/glSu5dMvjEKDM8829TZX2Yq5SmCtkJPF5KZm6CuUuJmd4QWbfX71V7Yd
 wohvZggMa+2vmOrIciZWt9TW3X02oR60kiZ1ETnhJwUJ9wh8yrpUTNVY3VFmExioJsSy
 Glccv0JhH3u5535OsTx//MRyxz6vZ9QUgUYg3FJA6ni6aXm2SFfCJQZk0/qJ2UmQcO+1
 hauXVJwouhD4BU+ihYsvCwTOu+zuK6y7NseRaBw9+LXArPJIMu1YyBghYR2P4pXPRUdj
 mBGQ==
X-Gm-Message-State: ANoB5pleL/D8FqUSqF/3LradGmko9OTAXPLSWR7WKAHqbJFYpHPS4X/G
 EcTRE0ruQ+OAWb+PdDxs5rDnujUQ579BP16ogSQ=
X-Google-Smtp-Source: AA0mqf4uGv/kmPq37NwZRPqC07hhFPTXLBDFwNW1G4KqnkJPKR44Rw8oKbytYiYpnMEIceaTEAIO8baioY0fYIap5EE=
X-Received: by 2002:a05:651c:200c:b0:279:3d7a:c240 with SMTP id
 s12-20020a05651c200c00b002793d7ac240mr6397113ljo.289.1669212806146; Wed, 23
 Nov 2022 06:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
In-Reply-To: <20221028045736.679903-12-bin.meng@windriver.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 23 Nov 2022 18:13:14 +0400
Message-ID: <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
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

Hi Bin

On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wrote:
>
> Now that we have fixed various test case issues as seen when running
> on Windows, let's enable the qtest build on Windows.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

We haven't solved the CI timing out or eating all the CPU time, right?

Can we simply exclude it from CI for now, ie add to this patch

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 093276ddbc..ba9045ec38 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -62,7 +62,7 @@ msys2-64bit:
   - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmmu
       --enable-capstone'
   - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check || { cat
build/meson-logs/testlog.txt; exit 1; } ;'
+  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'

 msys2-32bit:
   extends: .shared_msys2_builder
@@ -96,4 +96,4 @@ msys2-32bit:
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=3Dppc64-softmmu=
"
   - ..\msys64\usr\bin\bash -lc 'make'
-  - ..\msys64\usr\bin\bash -lc 'make check || { cat
meson-logs/testlog.txt; exit 1; } ;'
+  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'


Could you resubmit your missing win test patches and check if gitlab is hap=
py?

thanks

>
> ---
>
> Changes in v5:
> - Drop patches that are already merged
>
> Changes in v3:
> - Drop the host test
>
> Changes in v2:
> - new patch: "tests/qtest: Enable qtest build on Windows"
>
>  tests/qtest/meson.build | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c07a5b1a5f..f0ebb5fac6 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -1,9 +1,3 @@
> -# All QTests for now are POSIX-only, but the dependencies are
> -# really in libqtest, not in the testcases themselves.
> -if not config_host.has_key('CONFIG_POSIX')
> -  subdir_done()
> -endif
> -
>  slow_qtests =3D {
>    'ahci-test' : 60,
>    'bios-tables-test' : 120,
> --
> 2.25.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

