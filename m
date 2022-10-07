Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5A5F7692
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:59:43 +0200 (CEST)
Received: from localhost ([::1]:56900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogk8s-0003GG-1g
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogk6b-000148-GK
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:57:22 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:36758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ogk6Z-00043C-Kv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:57:21 -0400
Received: by mail-lf1-x131.google.com with SMTP id bu25so6561879lfb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lf4K7/D5+uToefWHVucPU60cDyMKOmkSCVbh6VxMFcg=;
 b=dhmKMmp1RNoLAzooO8TQwI8GtKssXjCuAvFViEmzjC+VtUvRmwsd7JYnAwh6RUr8Sa
 s2pzhWffeOXSJHJCS8n5RKer/2iCjBUCVjQ4eXJAQcBjMN23XQhJxuRteE1I+b6uHQDo
 56ol6DaWt5BQQJOKB+ezcRfgJn+qIBl94HeYoouArP32YimUV/5o8So7xMrtWdumO77F
 A7PJ6t0cSHMnJaYwJpqH1p8v0veB7N46wwkZ5emVFlAtIqDcPz168J49g65F6fnGC6dh
 pTILbwX3EdK45dLG/5+uYYp0DK9C71jfM6xHrIWUP1qQWCp2ghygt7tD7EKCd0AV0MkU
 uKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lf4K7/D5+uToefWHVucPU60cDyMKOmkSCVbh6VxMFcg=;
 b=hLBl7j6ggHmATdqPANBTZfc7eh49kQVVnuPsNbcVHWBDmXk5iZV2yo/SBqaaLHbv/U
 cmqYwlawujhL6XDBigkRDXyvrxLZdiUo9fT2z7K/NdnyPAJBWcFPuMzyKs3czlgCaaSl
 ugGNjOxMtaP5tbr8xls88k6QAU3imRCcnLpKC3APRXTUuJEK+Z1nULW6OAM8asPp6kGy
 iZWUAthxqOXx6if4Tu7w0GUvllmlB/HyVciNDRjz36YnyHpG/9YE5+sUN/koSQwyr0wl
 EOVyVerKVxqQekBuHE3xhyrb09uvBOQPzknGbhGht1XimYD+jy7hdReLjdniIo3qXCIZ
 XpfA==
X-Gm-Message-State: ACrzQf0Rps8MtgyJ8pPZVg1fKqonw0Y1U4jN4loc6japOK7x6lbxU0Eg
 xN6pVPLv3FWgXB+3BA+saa5zCu//uC6kIsqe180=
X-Google-Smtp-Source: AMsMyM7MeXvb4r0Rdx1M1W9Kc7h9+EYHRud3kONP2ad0y6K1h5TKxu9DO8jT7EPRhF7303V2xWdbciHdBIslg7YjvMw=
X-Received: by 2002:a05:6512:419:b0:4a2:2e45:bf0 with SMTP id
 u25-20020a056512041900b004a22e450bf0mr1738152lfk.356.1665136637081; Fri, 07
 Oct 2022 02:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-18-bmeng.cn@gmail.com>
In-Reply-To: <20221006151927.2079583-18-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 Oct 2022 13:57:05 +0400
Message-ID: <CAJ+F1CL4DPuZtL461E1X_L8FySvbH_94iDfEJu2ELk+WU+2E4w@mail.gmail.com>
Subject: Re: [PATCH v5 17/18] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
To: Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c17d2005ea6ed5cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000c17d2005ea6ed5cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 6, 2022 at 8:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using
> --without-default-devices"
> changed to compile QEMU with the --without-default-devices switch for
> the msys2-64bit job, due to the build could not complete within the
> project timeout (1h), and also mentioned that a bigger timeout was
> getting ignored on the shared Gitlab-CI Windows runners.
>
> However as of today it seems the shared Gitlab-CI Windows runners does
> honor the job timeout, and the runner has the timeout limit of 2h, so
> let's increase the timeout to 90 minutes and drop the configure switch
> "--without-default-devices" to get a larger build coverage.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Given the discussion in "[PATCH v2 36/39] .gitlab-ci.d/windows.yml:
Increase the timeout to 90 minutes", maybe we should drop this patch for
now?

---
>
> (no changes since v2)
>
> Changes in v2:
> - Change the timeout limit to 90 minutes
>
>  .gitlab-ci.d/windows.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index a3e7a37022..093276ddbc 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -10,7 +10,7 @@
>        - ${CI_PROJECT_DIR}/msys64/var/cache
>    needs: []
>    stage: build
> -  timeout: 70m
> +  timeout: 90m
>    before_script:
>    - If ( !(Test-Path -Path msys64\var\cache ) ) {
>        mkdir msys64\var\cache
> @@ -60,7 +60,7 @@ msys2-64bit:
>    - $env:MSYSTEM =3D 'MINGW64'     # Start a 64 bit Mingw environment
>    - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmm=
u
> -      --enable-capstone --without-default-devices'
> +      --enable-capstone'
>    - .\msys64\usr\bin\bash -lc 'make'
>    - .\msys64\usr\bin\bash -lc 'make check || { cat
> build/meson-logs/testlog.txt; exit 1; } ;'
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c17d2005ea6ed5cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022 at 8:16 PM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin =
Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;<br>
<br>
commit 9f8e6cad65a6 (&quot;gitlab-ci: Speed up the msys2-64bit job by using=
 --without-default-devices&quot;<br>
changed to compile QEMU with the --without-default-devices switch for<br>
the msys2-64bit job, due to the build could not complete within the<br>
project timeout (1h), and also mentioned that a bigger timeout was<br>
getting ignored on the shared Gitlab-CI Windows runners.<br>
<br>
However as of today it seems the shared Gitlab-CI Windows runners does<br>
honor the job timeout, and the runner has the timeout limit of 2h, so<br>
let&#39;s increase the timeout to 90 minutes and drop the configure switch<=
br>
&quot;--without-default-devices&quot; to get a larger build coverage.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Given the discussion in &quot;[PATCH v2 36/39] .gitlab-ci.d/windows.ym=
l: Increase the timeout to 90 minutes&quot;, maybe we should drop this patc=
h for now?</div><div><br> </div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
---<br>
<br>
(no changes since v2)<br>
<br>
Changes in v2:<br>
- Change the timeout limit to 90 minutes<br>
<br>
=C2=A0.gitlab-ci.d/windows.yml | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml<br>
index a3e7a37022..093276ddbc 100644<br>
--- a/.gitlab-ci.d/windows.yml<br>
+++ b/.gitlab-ci.d/windows.yml<br>
@@ -10,7 +10,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0- ${CI_PROJECT_DIR}/msys64/var/cache<br>
=C2=A0 =C2=A0needs: []<br>
=C2=A0 =C2=A0stage: build<br>
-=C2=A0 timeout: 70m<br>
+=C2=A0 timeout: 90m<br>
=C2=A0 =C2=A0before_script:<br>
=C2=A0 =C2=A0- If ( !(Test-Path -Path msys64\var\cache ) ) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir msys64\var\cache<br>
@@ -60,7 +60,7 @@ msys2-64bit:<br>
=C2=A0 =C2=A0- $env:MSYSTEM =3D &#39;MINGW64&#39;=C2=A0 =C2=A0 =C2=A0# Star=
t a 64 bit Mingw environment<br>
=C2=A0 =C2=A0- $env:MSYS =3D &#39;winsymlinks:native&#39; # Enable native W=
indows symlink<br>
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;./configure --target-list=3Dx=
86_64-softmmu<br>
-=C2=A0 =C2=A0 =C2=A0 --enable-capstone --without-default-devices&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 --enable-capstone&#39;<br>
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;make&#39;<br>
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;make check || { cat build/mes=
on-logs/testlog.txt; exit 1; } ;&#39;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c17d2005ea6ed5cf--

