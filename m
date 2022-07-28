Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B993E583F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:58:44 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH36B-0007Wm-9Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH327-0004um-G1
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:54:34 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH325-0003VR-Oh
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:54:31 -0400
Received: by mail-lf1-x12e.google.com with SMTP id t1so2698730lft.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XayPAOeCU0JCltzVvxkOZ8RNCR6hB7aKhjXHXt227oI=;
 b=GKjpWqc5ixDGE+5UuVQSVywXLOuUlSE8HvKowj/+Cq9xM0KQkCPtwZ+jMFhClL9SGB
 sGax8rniRmAu3MQ1J98EB205twYZtY74BXvxWu9L1WBTGZO/nRLH3UchU+TksagTVdKn
 38V7iBOgxQoqJ59oXvTAHe/y3F2oNR006B5DWYGCVv4dk3j13aiK42/Hacp16qZRAsQp
 +KGNJT35x3UStticYICgcubmvPbJpzI9MNlVUmCW4hudGZRWo+BcKH3/AhWoE2pXclxR
 6yFqA2LCDg7/zBXbHJvVbvpYUaOOk5Xb42Nm5udtBmKyouZuU/iEfc3y0D4nUVP2YmeJ
 vpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XayPAOeCU0JCltzVvxkOZ8RNCR6hB7aKhjXHXt227oI=;
 b=GRpJq/WoR/FXH6I06E2EQJLZhJd69hNL5lzvxac9avwpFdSti67zXseFdlqLmm6BSG
 MEX7h+tfygXuyAOxYlibSkKBLbgeZFUUVwXD2b4URNIuxUMVd4AbiMDWqQontsBWe4W/
 /m1D0ZJdvIDIMDItu50oGaZkimGBqnfzPtJPm8wyldKg0z9Y0jguHM1fPvO0h1YSR5OQ
 X95F5UI/y2xgqeFn+is6LESbCbGLGEhx512/8xLvvBKaeUImXwhoTjbk59xoohhD0Ry3
 cj/IIuHaV5LSx9g+/MRSZKtHqgAY8tE0b2SqeawBNOeOmNMKBZMkTaHAhJPwNMVh5rRe
 JsYQ==
X-Gm-Message-State: AJIora/A2fpuaOLkydH4bzwJF2GuJmhukP7RoaEbh9EX3fQaypdYLEGh
 niRZ4EgrpjsONmvvqYQOIkoZ7p7lfKovOdxK9XyPT7ub7ekpVw==
X-Google-Smtp-Source: AGRyM1sQMqMGlgmDjCzn71/HpyeVWJdjS/qUjNuj13oOiRTlIziYj54NQnRW3X/p5VhotocyTeppeQAwRLyrtXYJB9s=
X-Received: by 2002:a05:6512:3e24:b0:48a:97af:d76e with SMTP id
 i36-20020a0565123e2400b0048a97afd76emr6152316lfv.432.1659012867924; Thu, 28
 Jul 2022 05:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
 <20220727132802.812580-3-bmeng.cn@gmail.com>
In-Reply-To: <20220727132802.812580-3-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 16:54:16 +0400
Message-ID: <CAJ+F1CL+yNJEWy_njk_Re28kvVTiauk_kCeyB3i3Ee=g+VkoXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] util/oslib-win32: Add a helper to get the Windows
 version
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000aba67605e4dd085f"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

--000000000000aba67605e4dd085f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 27, 2022 at 5:35 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> This adds a helper to get the Windows version via the RtlGetVersion
> call, for QEMU codes to determine the Windows version at run-time.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>

It looks like you are introducing new code, but in fact it's almost
identical as the  ga_get_win_version() function. Please do the move in the
same patch.


>  include/sysemu/os-win32.h |  2 ++
>  util/oslib-win32.c        | 15 +++++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> index edc3b38a57..1e324026a4 100644
> --- a/include/sysemu/os-win32.h
> +++ b/include/sysemu/os-win32.h
> @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t
> len, int flags);
>  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
>                             struct sockaddr *addr, socklen_t *addrlen);
>
> +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> +
>  #ifdef __cplusplus
>  }
>  #endif
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 5723d3eb4c..6d2387b9ff 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
>       */
>      return qemu_fdatasync(fd);
>  }
> +
> +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> +{
> +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
> +
> +    /* RtlGetVersion is available starting with Windows 2000 */
> +    HMODULE module =3D GetModuleHandle("ntdll");
> +    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> +    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun;
> +
> +    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW);
> +    rtl_get_version(info);
> +
> +    return;
> +}
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000aba67605e4dd085f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 5:35 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
This adds a helper to get the Windows version via the RtlGetVersion<br>
call, for QEMU codes to determine the Windows version at run-time.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
(no changes since v1)<br></blockquote><div><br></div><div>It looks like you=
 are introducing new code, but in fact it&#39;s almost identical as the=C2=
=A0 ga_get_win_version() function. Please do the move in the same patch.</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0include/sysemu/os-win32.h |=C2=A0 2 ++<br>
=C2=A0util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++++++++++<br=
>
=C2=A02 files changed, 17 insertions(+)<br>
<br>
diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h<br>
index edc3b38a57..1e324026a4 100644<br>
--- a/include/sysemu/os-win32.h<br>
+++ b/include/sysemu/os-win32.h<br>
@@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t le=
n, int flags);<br>
=C2=A0ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int fla=
gs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr *addr, socklen_t *addrlen);<br>
<br>
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info);<br>
+<br>
=C2=A0#ifdef __cplusplus<br>
=C2=A0}<br>
=C2=A0#endif<br>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br>
index 5723d3eb4c..6d2387b9ff 100644<br>
--- a/util/oslib-win32.c<br>
+++ b/util/oslib-win32.c<br>
@@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0return qemu_fdatasync(fd);<br>
=C2=A0}<br>
+<br>
+void os_get_win_version(RTL_OSVERSIONINFOEXW *info)<br>
+{<br>
+=C2=A0 =C2=A0 typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOE=
XW);<br>
+<br>
+=C2=A0 =C2=A0 /* RtlGetVersion is available starting with Windows 2000 */<=
br>
+=C2=A0 =C2=A0 HMODULE module =3D GetModuleHandle(&quot;ntdll&quot;);<br>
+=C2=A0 =C2=A0 PVOID fun =3D GetProcAddress(module, &quot;RtlGetVersion&quo=
t;);<br>
+=C2=A0 =C2=A0 rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun=
;<br>
+<br>
+=C2=A0 =C2=A0 info-&gt;dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW=
);<br>
+=C2=A0 =C2=A0 rtl_get_version(info);<br>
+<br>
+=C2=A0 =C2=A0 return;<br>
+}<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000aba67605e4dd085f--

