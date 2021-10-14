Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065042D570
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:51:56 +0200 (CEST)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawSv-0002IP-79
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mawRF-0001XA-Pv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:50:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mawRE-0004Md-12
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:50:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id g25so17063955wrb.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P74VqEjJmfYNoE/t5s+xS35CQ/KL72RE0X6+AJNi4Rg=;
 b=mhOPSrZ2atLqlxVrmNJyuaNgdzx+vNHGGOsa1s3QVh974YmnkLyc6uOGKSKXKqs3Er
 Oo/oR7aQdYOE59neHfUrm35C87t3JSNSWU9EvL+PeXWfr387ruwGRcgxHsQ/0kXB57oz
 +XeZ2kZvBVBjwW2niFEcRJ4xfSSyOagaJo03Em+18deixwcs1dECjBhtYiyc+/DfRkAO
 Jyrr2VGYW1keF3k6Hi0/RNs8nlSs8nlr9PwBR+L7Rs9puwiDBUyp5obH/J/ucJuvGfKf
 W5imMrhY01FG80+3JpbjwCJvIhOHGh0Uaki95AaUJbPE77PvyIv6NvL6MUWaBZDDk8Vh
 SkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P74VqEjJmfYNoE/t5s+xS35CQ/KL72RE0X6+AJNi4Rg=;
 b=uxGnpH4nwVtDpFdynSH9P0F5Vsy9zp8U3kb+OoLhVEAPS2UfM6KN5JZgQKb/hYUb/a
 pYoireiINlLFLne56fdKibVRb5vKiE0wGOQsmR8KQ1dHo/8uwquA4NnNCddRiz+ihWbZ
 L1YMOv6CXr3YqLxKLeuHxxgg7vldOZdUzgtDJ4pM7j5ZSLywXdpwYSVTcFDJBe5W/BDK
 KCK1TsKdQAqyNYXyNqNj4NQX32QMIDCqETU5T2PVek5rPQRh7dSysTHrqj93B2Yhc9Kx
 O9ODa8ADOlS/cqtdcH3w2ItqK93DJRg46IaDnp9wdWMXwlOUhweEdyoUONVYnnJ9ny+5
 GIrw==
X-Gm-Message-State: AOAM530o8aA7calyv0tVgVeEWUvMGEmg3hAF49481I54SxtnvJ/pyGv0
 /F4/HkBnqeCBuQ/AZRqSXbe9OCnLvxCIkd/mY6Y=
X-Google-Smtp-Source: ABdhPJw8xre8JT/jYNudrefWyrguuLuP/+Ei9wcZGMHWc+XBvC1jjmf1x+KirpWWFrgR8Yyoq9UUCrAPVc7RoCdRDuE=
X-Received: by 2002:adf:a209:: with SMTP id p9mr5154310wra.70.1634201406448;
 Thu, 14 Oct 2021 01:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121420.183499-1-konstantin@daynix.com>
In-Reply-To: <20210914121420.183499-1-konstantin@daynix.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Oct 2021 12:49:53 +0400
Message-ID: <CAJ+F1CL6y_iF6OYiBjiOWffCrfyxZYGEiN8ECzuv4waXpPbRiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga-win: Detect OS based on Windows 10 by first build
 number
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Content-Type: multipart/alternative; boundary="00000000000052a9a705ce4c2ae9"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Yan Vugenfirer <yan@daynix.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052a9a705ce4c2ae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 4:18 PM Kostiantyn Kostiuk <konstantin@daynix.com>
wrote:

> Windows Server 2016, 2019, 2022 are based on Windows 10 and
> have the same major and minor versions. So, the only way to
> detect the proper version is to use the build number.
>
> Before this commit, the guest agent use the last build number
> for each OS, but it causes problems when new OS releases.
> There are few preview versions before release, and we
> can't update this list.
>
> After this commit, the guest agent will use the first build
> number. For each new preview version or release version,
> Microsoft increases the build number, so we can add the number
> of the first preview build and this will work until the new
> OS release.
>
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  qga/commands-win32.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 4e84afd83b..a8e9d40b31 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2162,7 +2162,7 @@ static ga_matrix_lookup_t const
> WIN_VERSION_MATRIX[2][8] =3D {
>  };
>
>  typedef struct _ga_win_10_0_server_t {
> -    int final_build;
> +    int first_build;
>      char const *version;
>      char const *version_id;
>  } ga_win_10_0_server_t;
> @@ -2202,18 +2202,22 @@ static char *ga_get_win_name(OSVERSIONINFOEXW
> const *os_version, bool id)
>      int tbl_idx =3D (os_version->wProductType !=3D VER_NT_WORKSTATION);
>      ga_matrix_lookup_t const *table =3D WIN_VERSION_MATRIX[tbl_idx];
>      ga_win_10_0_server_t const *win_10_0_table =3D
> WIN_10_0_SERVER_VERSION_MATRIX;
> +    ga_win_10_0_server_t const *win_10_0_version =3D NULL;
>      while (table->version !=3D NULL) {
>          if (major =3D=3D 10 && minor =3D=3D 0 && tbl_idx) {
>              while (win_10_0_table->version !=3D NULL) {
> -                if (build <=3D win_10_0_table->final_build) {
> -                    if (id) {
> -                        return g_strdup(win_10_0_table->version_id);
> -                    } else {
> -                        return g_strdup(win_10_0_table->version);
> -                    }
> +                if (build >=3D win_10_0_table->first_build) {
> +                    win_10_0_version =3D win_10_0_table;
>                  }
>                  win_10_0_table++;
>              }
> +            if (win_10_0_table) {
> +                if (id) {
> +                    return g_strdup(win_10_0_version->version_id);
> +                } else {
> +                    return g_strdup(win_10_0_version->version);
> +                }
> +            }
>          } else if (major =3D=3D table->major && minor =3D=3D table->mino=
r) {
>              if (id) {
>                  return g_strdup(table->version_id);
> --
> 2.33.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000052a9a705ce4c2ae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 4:18 PM Kosti=
antyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@dayni=
x.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Windows Server 2016, 2019, 2022 are based on Windows 10 and<br>
have the same major and minor versions. So, the only way to<br>
detect the proper version is to use the build number.<br>
<br>
Before this commit, the guest agent use the last build number<br>
for each OS, but it causes problems when new OS releases.<br>
There are few preview versions before release, and we<br>
can&#39;t update this list.<br>
<br>
After this commit, the guest agent will use the first build<br>
number. For each new preview version or release version,<br>
Microsoft increases the build number, so we can add the number<br>
of the first preview build and this will work until the new<br>
OS release.<br>
<br>
Signed-off-by: Kostiantyn Kostiuk &lt;<a href=3D"mailto:konstantin@daynix.c=
om" target=3D"_blank">konstantin@daynix.com</a>&gt;<br></blockquote><div><b=
r></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marc=
andre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0qga/commands-win32.c | 18 +++++++++++-------<br>
=C2=A01 file changed, 11 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index 4e84afd83b..a8e9d40b31 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2162,7 +2162,7 @@ static ga_matrix_lookup_t const WIN_VERSION_MATRIX[2]=
[8] =3D {<br>
=C2=A0};<br>
<br>
=C2=A0typedef struct _ga_win_10_0_server_t {<br>
-=C2=A0 =C2=A0 int final_build;<br>
+=C2=A0 =C2=A0 int first_build;<br>
=C2=A0 =C2=A0 =C2=A0char const *version;<br>
=C2=A0 =C2=A0 =C2=A0char const *version_id;<br>
=C2=A0} ga_win_10_0_server_t;<br>
@@ -2202,18 +2202,22 @@ static char *ga_get_win_name(OSVERSIONINFOEXW const=
 *os_version, bool id)<br>
=C2=A0 =C2=A0 =C2=A0int tbl_idx =3D (os_version-&gt;wProductType !=3D VER_N=
T_WORKSTATION);<br>
=C2=A0 =C2=A0 =C2=A0ga_matrix_lookup_t const *table =3D WIN_VERSION_MATRIX[=
tbl_idx];<br>
=C2=A0 =C2=A0 =C2=A0ga_win_10_0_server_t const *win_10_0_table =3D WIN_10_0=
_SERVER_VERSION_MATRIX;<br>
+=C2=A0 =C2=A0 ga_win_10_0_server_t const *win_10_0_version =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0while (table-&gt;version !=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (major =3D=3D 10 &amp;&amp; minor =3D=
=3D 0 &amp;&amp; tbl_idx) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (win_10_0_table-&gt;v=
ersion !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (build &lt;=3D =
win_10_0_table-&gt;final_build) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
id) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return g_strdup(win_10_0_table-&gt;version_id);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return g_strdup(win_10_0_table-&gt;version);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (build &gt;=3D =
win_10_0_table-&gt;first_build) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 win_=
10_0_version =3D win_10_0_table;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0win_10_0_tabl=
e++;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (win_10_0_table) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (id) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn g_strdup(win_10_0_version-&gt;version_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn g_strdup(win_10_0_version-&gt;version);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (major =3D=3D table-&gt;major &=
amp;&amp; minor =3D=3D table-&gt;minor) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (id) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_strd=
up(table-&gt;version_id);<br>
-- <br>
2.33.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000052a9a705ce4c2ae9--

