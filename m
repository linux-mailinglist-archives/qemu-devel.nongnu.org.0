Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0513141C3B5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:47:02 +0200 (CEST)
Received: from localhost ([::1]:46328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVY3A-0002RL-Cj
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mVXxL-0000DF-V9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:41:04 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mVXxI-00037d-Re
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:40:59 -0400
Received: by mail-yb1-xb32.google.com with SMTP id m132so4602661ybf.8
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 04:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3jwp1MqwzuS22b/fCZCawlUERQZG/XZut2S7fdOzFyc=;
 b=p8knFB769ilib6cniYLX47Cbai74wojg6jcCe582iHTRy4Jus93+YvC0zb0fEQU+jc
 vHsks452i+ylCuZzJ14xjtbNfKtCJAW/QQGVp5DUdKIceEsSPcRl0/zPevPLwxuTH3zE
 59MM1FSawzBr5W0R0mVBgvQeZB0AVKoQMcdoUXd2j4VX+0tx7q2PngndUbxECQxuudiS
 7uFaMu8IzQ7Bk3HdQ6KaA2OEW6VVphnB8wsc/iAD98m+VdotyrXs9n9LMTtZ+cbO/d+H
 a2Y7P66ioSHtfuBNwF5CnfTUDRgPfOUa0Ag6LkmZL12R2reqGs2Lu/6gonRfJrpUGvWx
 xJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3jwp1MqwzuS22b/fCZCawlUERQZG/XZut2S7fdOzFyc=;
 b=0Cqel1mIdxaT4Z9t+4wsKnGthaakDi95BRPRTcEqLAHlkwNBy9Ifyj3VYhUEhu+1EO
 u920FppIJKyS7gY6zKRQ3fxkrEMfEYtTnUnnnMhIi3hwLY7yQuK9UuiNTaQfWWHNmBeD
 XKUGgsv6lsQXTZs5uPSK2MZGHwUL2L5zkbsjWIieM2en/6a5UBPipTRgGFijstuY2GQj
 8GvnQUyV0Y+X/N6sBLKdLCrmRS85kjbCK8aDk8NUmIzOR1q5R0fN58yBitkqS1fRkcm4
 wAeiHPS8JV7DFitGGkqKW5kTqvYogso83dAvLjQGAlOHHS7J/k9osAzDtktrBUv+Q8hO
 9BwA==
X-Gm-Message-State: AOAM533p8ua8SjZAk/bbHsPZlDbYTN3tn4wPHCvl8plEEtUh4dvSCkDx
 m0gea4jcqQOVlQ5edyXRHN7+Q51JkguF13cRfy8/8wLKS3tuZQ==
X-Google-Smtp-Source: ABdhPJzC0wfHqF3P18xQTpdlJaREsglFEwixu1jq+NANmWia7qxtLQATa5FmTMu6avu0phsmH2LH4s5L7J7qkEwKt9g=
X-Received: by 2002:a25:3b87:: with SMTP id
 i129mr12917297yba.446.1632915653267; 
 Wed, 29 Sep 2021 04:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121420.183499-1-konstantin@daynix.com>
In-Reply-To: <20210914121420.183499-1-konstantin@daynix.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Wed, 29 Sep 2021 14:40:42 +0300
Message-ID: <CAJ28CFR8z5u2Uzq9bKroLU7c=cRgCZe1cwcF_Ka6fK+Wr8UfDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga-win: Detect OS based on Windows 10 by first build
 number
To: Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007625a305cd20cd66"
Received-SPF: none client-ip=2607:f8b0:4864:20::b32;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007625a305cd20cd66
Content-Type: text/plain; charset="UTF-8"

ping

On Tue, Sep 14, 2021 at 3:14 PM Kostiantyn Kostiuk <konstantin@daynix.com>
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
> ---
>  qga/commands-win32.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 4e84afd83b..a8e9d40b31 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2162,7 +2162,7 @@ static ga_matrix_lookup_t const
> WIN_VERSION_MATRIX[2][8] = {
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
>      int tbl_idx = (os_version->wProductType != VER_NT_WORKSTATION);
>      ga_matrix_lookup_t const *table = WIN_VERSION_MATRIX[tbl_idx];
>      ga_win_10_0_server_t const *win_10_0_table =
> WIN_10_0_SERVER_VERSION_MATRIX;
> +    ga_win_10_0_server_t const *win_10_0_version = NULL;
>      while (table->version != NULL) {
>          if (major == 10 && minor == 0 && tbl_idx) {
>              while (win_10_0_table->version != NULL) {
> -                if (build <= win_10_0_table->final_build) {
> -                    if (id) {
> -                        return g_strdup(win_10_0_table->version_id);
> -                    } else {
> -                        return g_strdup(win_10_0_table->version);
> -                    }
> +                if (build >= win_10_0_table->first_build) {
> +                    win_10_0_version = win_10_0_table;
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
>          } else if (major == table->major && minor == table->minor) {
>              if (id) {
>                  return g_strdup(table->version_id);
> --
> 2.33.0
>
>

--0000000000007625a305cd20cd66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 3:14 PM Kostiantyn Kostiuk=
 &lt;<a href=3D"mailto:konstantin@daynix.com">konstantin@daynix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Windows =
Server 2016, 2019, 2022 are based on Windows 10 and<br>
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
om" target=3D"_blank">konstantin@daynix.com</a>&gt;<br>
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
</blockquote></div>

--0000000000007625a305cd20cd66--

