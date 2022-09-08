Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241515B202C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 16:11:12 +0200 (CEST)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWIFK-0002Tu-TQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 10:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWI91-0003px-56
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:04:47 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWI8v-0000zG-1S
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 10:04:38 -0400
Received: by mail-lf1-x12b.google.com with SMTP id a8so6313057lff.13
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oV5wDlPNHy2NTZDMzljGSRvjlScMG1Na6svc8k/25sA=;
 b=Pu3bWD32/51FncQo/bfik4xqB8eZso7M6cigqhQdyEC85BOhoE0WmhJob4F8OrelTT
 EtIM/4kw9CvCqYI52FdLOHmcIL+T7Rb6oMlT/Lb2/OUkLR1BCL/280rrvrPZMhYwBkXJ
 Gb7ZWUjeOABGgysGs4a1FetwM0sQCbhH7ag+NCxetBKzIk6m+IFLcTwtOaHCp8N1PyHO
 BJUPp0/7LobZgmJ/7ER9arHyLAR+wDc8dY5uqfWOF+ZBpB2hQylZ7FfTNuICTs4CTEct
 eY5aRPlWaK1JKnA8O/4kZYjzsq1QMaQg+oSwAJwFLPuFhreIyfAe9KiRyzbT+JzMlkPE
 9ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oV5wDlPNHy2NTZDMzljGSRvjlScMG1Na6svc8k/25sA=;
 b=6R1W4jmqil3OUQM+nsE5Ac67myX8swB9FA4TFVumsaZvO3w2yduWPTctZjXjvm92TS
 qeQZ5yZXS/Y6Z8G+6LoZ/ABRHXnlHZq6xx0ZzSCca7cpfjhuuQ3UdQuwpLOeJ8SY/1t2
 YhhvTXzrKvCwRSBdNlMeuX5cEv75LdsR2qUECzsAJW3e+hzDPAtlkW93yAu6+sFyp1nO
 7zPTwp92F/DKhNfyza+sJ4CKuyjqOHIbP4Lr8JccXrTvKeWS/e3mZ7uxaj/nRJTyZ3eg
 Ry1sIgaqrfpWW0KITfjXgoY+10smDLtSiSU9CFMHaF4qP5iEYmWXQa/niruqGMko5Eus
 RQNA==
X-Gm-Message-State: ACgBeo15UUDEW5sBc/MvXikMjIoP2RWv8VF8PLJPtVZWWcQTcDO/ll+i
 lls3nvYCiZjlxLoMmWLwx2CAX/y2xVjz2nGMXAE=
X-Google-Smtp-Source: AA6agR6q9BEfQTOdVpTB8HCoM1mwyVgdbqo4nBDWvc8S5dZ3/nYZ4WL6e2XmO/DB7MISVnX9/eGUva28U8hauQC1BlA=
X-Received: by 2002:a19:2d08:0:b0:494:62f3:fcc3 with SMTP id
 k8-20020a192d08000000b0049462f3fcc3mr2682317lfj.362.1662645871130; Thu, 08
 Sep 2022 07:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-5-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-5-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 18:04:19 +0400
Message-ID: <CAJ+F1C+h=dryHrx_pE8bn-tkZz2JuY+AVb74pXnuMogCawndxQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] .gitlab-ci.d/windows.yml: Drop the sed processing in
 the 64-bit build
To: Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000893e3105e82ae81f"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000893e3105e82ae81f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 8, 2022 at 5:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The sed processing of build/config-host.mak seems to be no longer
> needed, and there is no such in the 32-bit build too. Drop it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  .gitlab-ci.d/windows.yml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index da6013904a..86a4339c48 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -60,7 +60,6 @@ msys2-64bit:
>    - $env:MSYS =3D 'winsymlinks:native' # Enable native Windows symlink
>    - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmm=
u
>        --enable-capstone --without-default-devices'
> -  - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=3D/d' build/config-host.ma=
k"
>

It looks like it is there to remove the ROMS from the make build. No idea
if that still makes sense. Thomas, do you remember?



>    - .\msys64\usr\bin\bash -lc 'make'
>    - .\msys64\usr\bin\bash -lc 'make check'
>
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000893e3105e82ae81f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 5:33 PM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin =
Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;<br>
<br>
The sed processing of build/config-host.mak seems to be no longer<br>
needed, and there is no such in the 32-bit build too. Drop it.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
=C2=A0.gitlab-ci.d/windows.yml | 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml<br>
index da6013904a..86a4339c48 100644<br>
--- a/.gitlab-ci.d/windows.yml<br>
+++ b/.gitlab-ci.d/windows.yml<br>
@@ -60,7 +60,6 @@ msys2-64bit:<br>
=C2=A0 =C2=A0- $env:MSYS =3D &#39;winsymlinks:native&#39; # Enable native W=
indows symlink<br>
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;./configure --target-list=3Dx=
86_64-softmmu<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-capstone --without-default-devices&#39;=
<br>
-=C2=A0 - .\msys64\usr\bin\bash -lc &quot;sed -i &#39;/^ROMS=3D/d&#39; buil=
d/config-host.mak&quot;<br></blockquote><div><br></div><div>It looks like i=
t is there to remove the ROMS from the make build. No idea if that still ma=
kes sense. Thomas, do you remember?<br></div><div><br></div><div>=C2=A0 <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;make&#39;<br>
=C2=A0 =C2=A0- .\msys64\usr\bin\bash -lc &#39;make check&#39;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000893e3105e82ae81f--

