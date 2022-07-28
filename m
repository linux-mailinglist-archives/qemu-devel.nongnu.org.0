Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1BD583F67
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:01:15 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH38d-0000wJ-1I
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH33k-0005pl-FV
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:56:12 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH33i-0007HA-QW
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:56:12 -0400
Received: by mail-lf1-x12f.google.com with SMTP id w15so2686638lft.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+Xf3SXeLKKtBDKNtR6juxXVaEyW17X6rOyLfChviOs=;
 b=iedox6uboMudcaoJd6A0ln/hGeyoTicSuLQ4uweQyhcbGBNQPE2Ohv3DtFeOD5rV56
 qpUXK4acTVM7XkxRo6ypGlzIvbfp8ShcQyZgBk5WRKWCwrzm6Hp1Uv7ed2ZSQynPeTyy
 jI8P/MljHkHw/BrNgHGm4Ie/66uexLCTMnGH+LBNb2jcm5bj4I1FQuRmmhdXC+Pwjwia
 +yVzi7UoATsCS8WtY92kBseNG1hozB9b7ZKm3bNRH4bBhon018ISo6SWiqy6WOCMa0yK
 n2VqMaKIf4o1U8Ysan11pjEaK+nK2pKYNI0rnnweNggTdEhQgausS7QD2ZUIeD09ZEKP
 C+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+Xf3SXeLKKtBDKNtR6juxXVaEyW17X6rOyLfChviOs=;
 b=TF9Lgwsa970PC8kc/Dhou3EQlZgnFkcJtEC7cMJA/Py0Y8BGyANLNcYmiRNTeIGtOp
 P9GO9zT7OWSxVAQc6/sOZfRkfXI3mXCjvyeWQ+AzqLUOISjGkDHOlTZ/fRT7lWoX4J+x
 bjWwKgZd7w9DcJ1kvV6qoBlEEdRlTBlijDfXycMD1bcPcTDPBxh2E3cQetPWj0nutW/Z
 5DxnlyLQgFfaZshiX9LgC3WXNO5HxpZxWm9wSjFsxib1FdMhkVJAVO5xwgzgQz3baiIF
 ZnreJw/HrBngweusOxFjjekBVWzUIuRnB1OcdKii0RJhdN+V8HEfhgGSKVWW7+3Q+In7
 IPaw==
X-Gm-Message-State: AJIora+wcUOtocJqp09M6ko7KaG7/d5IVJ/XPiT5dYRMn3F5Z3gOqedh
 efrHpbIkuFLmo7Rl8/3o9PEYg1IsnBMqc7gO89w=
X-Google-Smtp-Source: AGRyM1us7ehe+Vzpc6HDGMi0JbtfZsY/+rE3n9bkIZCPgSAhy69slWh2cv0Om3/ETQK76U7pQ05lw+fFvOM1+zNCwe8=
X-Received: by 2002:a05:6512:3f19:b0:48a:874f:534 with SMTP id
 y25-20020a0565123f1900b0048a874f0534mr7401968lfa.446.1659012968520; Thu, 28
 Jul 2022 05:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
 <20220727132802.812580-4-bmeng.cn@gmail.com>
In-Reply-To: <20220727132802.812580-4-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 16:55:57 +0400
Message-ID: <CAJ+F1C+cziL4QU_u+sYisqb2NC39hiwHp+WFB+2EVukhmzbJ1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] qga/commands-win32: Use os_get_win_version()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000aaa1da05e4dd0ee4"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--000000000000aaa1da05e4dd0ee4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 27, 2022 at 5:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Drop its own ga_get_win_version() implementation, and use the one
> provided in oslib-win32 instead.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Will be squashed with the previous patch, since the move should be done
together.


> ---
>
> (no changes since v1)
>
>  qga/commands-win32.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 7ed7664715..6186f2e1f2 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2178,26 +2178,6 @@ static ga_win_10_0_t const
> WIN_10_0_CLIENT_VERSION_MATRIX[3] =3D {
>      {0, 0}
>  };
>
> -static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)
> -{
> -    typedef NTSTATUS(WINAPI *rtl_get_version_t)(
> -        RTL_OSVERSIONINFOEXW *os_version_info_ex);
> -
> -    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW);
> -
> -    HMODULE module =3D GetModuleHandle("ntdll");
> -    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> -    if (fun =3D=3D NULL) {
> -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> -            "Failed to get address of RtlGetVersion");
> -        return;
> -    }
> -
> -    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun;
> -    rtl_get_version(info);
> -    return;
> -}
> -
>  static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool id=
)
>  {
>      DWORD major =3D os_version->dwMajorVersion;
> @@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)
>
>  GuestOSInfo *qmp_guest_get_osinfo(Error **errp)
>  {
> -    Error *local_err =3D NULL;
>      OSVERSIONINFOEXW os_version =3D {0};
>      bool server;
>      char *product_name;
>      GuestOSInfo *info;
>
> -    ga_get_win_version(&os_version, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return NULL;
> -    }
> +    os_get_win_version(&os_version);
>
>      server =3D os_version.wProductType !=3D VER_NT_WORKSTATION;
>      product_name =3D ga_get_win_product_name(errp);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aaa1da05e4dd0ee4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:30 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Drop its own ga_get_win_version() implementation, and use the one<br>
provided in oslib-win32 instead.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Will be squashed with the previous patch, since the move should be don=
e together.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
<br>
(no changes since v1)<br>
<br>
=C2=A0qga/commands-win32.c | 27 +--------------------------<br>
=C2=A01 file changed, 1 insertion(+), 26 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 7ed7664715..6186f2e1f2 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2178,26 +2178,6 @@ static ga_win_10_0_t const WIN_10_0_CLIENT_VERSION_M=
ATRIX[3] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{0, 0}<br>
=C2=A0};<br>
<br>
-static void ga_get_win_version(RTL_OSVERSIONINFOEXW *info, Error **errp)<b=
r>
-{<br>
-=C2=A0 =C2=A0 typedef NTSTATUS(WINAPI *rtl_get_version_t)(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 RTL_OSVERSIONINFOEXW *os_version_info_ex);<br>
-<br>
-=C2=A0 =C2=A0 info-&gt;dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW=
);<br>
-<br>
-=C2=A0 =C2=A0 HMODULE module =3D GetModuleHandle(&quot;ntdll&quot;);<br>
-=C2=A0 =C2=A0 PVOID fun =3D GetProcAddress(module, &quot;RtlGetVersion&quo=
t;);<br>
-=C2=A0 =C2=A0 if (fun =3D=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, QERR_QGA_COMMAND_FAILED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to get address of R=
tlGetVersion&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun=
;<br>
-=C2=A0 =C2=A0 rtl_get_version(info);<br>
-=C2=A0 =C2=A0 return;<br>
-}<br>
-<br>
=C2=A0static char *ga_get_win_name(OSVERSIONINFOEXW const *os_version, bool=
 id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DWORD major =3D os_version-&gt;dwMajorVersion;<br>
@@ -2312,17 +2292,12 @@ static char *ga_get_current_arch(void)<br>
<br>
=C2=A0GuestOSInfo *qmp_guest_get_osinfo(Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0OSVERSIONINFOEXW os_version =3D {0};<br>
=C2=A0 =C2=A0 =C2=A0bool server;<br>
=C2=A0 =C2=A0 =C2=A0char *product_name;<br>
=C2=A0 =C2=A0 =C2=A0GuestOSInfo *info;<br>
<br>
-=C2=A0 =C2=A0 ga_get_win_version(&amp;os_version, &amp;local_err);<br>
-=C2=A0 =C2=A0 if (local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 os_get_win_version(&amp;os_version);<br>
<br>
=C2=A0 =C2=A0 =C2=A0server =3D os_version.wProductType !=3D VER_NT_WORKSTAT=
ION;<br>
=C2=A0 =C2=A0 =C2=A0product_name =3D ga_get_win_product_name(errp);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aaa1da05e4dd0ee4--

