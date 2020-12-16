Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC022DC4CE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:58:13 +0100 (CET)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa7w-0002Pu-BV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa2l-0005TS-Gv
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:52:51 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpa2j-0002wK-Ln
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:52:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ce23so33729500ejb.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ra7h3xhqfoGlwWtJr9f3OvRswMqIWpA1U5CuJhJA/wo=;
 b=ARogm1Yt4quxRy+eGzDUtkYUZ5K5PJhXEHzdDfYccavo0YznIMw0sOjkvFOIvOtw0C
 1WX3GRjzPve/oGVcgi3H8lCKdWacvj4e4NkXi8B/7jVNGjejsrJBoThOIdEEsoSh8HKn
 KtNLpf3ax9uA193wo46JJqt4NVPsWpgdo+OewWtVT1BAlZ3ABGbOsQgqqGoUia8Sa8G7
 mcEJhVHt+J1dtxrOYaORG4NWQ8oDfnbu1BXpxVkfpNpfaGeKFAcN6Bu49+qnNIGhkv5I
 uURjr6qrSSRAkI2sy8Aq2MJ/G6Dr2yeRFoYtehy8hprzCDWaeoen8VsDYL5jv5Ac4iJs
 tOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ra7h3xhqfoGlwWtJr9f3OvRswMqIWpA1U5CuJhJA/wo=;
 b=Qe0BG8Bzksq95OuUE3QAuzY5gJ7yNTqK0ANI3kzRjz5z3fHQLudf5DAOTQszi3LWk4
 yWrsQKJKd+7uE54/mAV8sArbUFdemsWhtrGvWYpZGF5AWdp5oEGL7hD9SFS7eF5uLwxg
 RimIvKycLErjuwsiFVuK6kaTyiEjGAN4M2HbDeYilHRJk8b30kb/bAvG+9JFjwGGdTjG
 PEPbKdjWygr8gZa4GrjAzPc2Fxjd2pZgdEI9CdIIXgidBuPNRhe0eEhwSb0yIEYGpVgS
 mqH3aC3HAGsEHspi9jOHqBcu7b9tCAzqggjRVpFhdgW6pnsNCFFeDZskGXHXrnA/rGE3
 F1BA==
X-Gm-Message-State: AOAM531qw7yoT1+5jfu6r3qxyzR7PKK+JmLBxfDq6OhyCCjy6JftH9Sv
 drAsTtcZ8xxiuKaqvYsIQXdVm8F6qy9iXm1G+Ao=
X-Google-Smtp-Source: ABdhPJxuggoJXxV2VUgKCNE0l6MLCo+UHqq7JP2Hkq7E8uL0O+h0e2QXJa8KnZU1koQpOzvu0vMklktYDBsVQZNSynU=
X-Received: by 2002:a17:906:8587:: with SMTP id
 v7mr30886632ejx.381.1608137567963; 
 Wed, 16 Dec 2020 08:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-3-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 20:52:36 +0400
Message-ID: <CAJ+F1CLCqnS=4rintwgG+wwUM6ouWAVFi_UT2n6qdPG+06iBLA@mail.gmail.com>
Subject: Re: [PATCH 2/7] meson: update submodule to 0.56.0
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d117c05b697b477"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d117c05b697b477
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2020 at 8:25 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  configure | 2 +-
>  meson     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 6317964997..8d12b715e3 100755
> --- a/configure
> +++ b/configure
> @@ -1938,7 +1938,7 @@ python_version=3D$($python -c 'import sys;
> print("%d.%d.%d" % (sys.version_info[0]
>  python=3D"$python -B"
>
>  if test -z "$meson"; then
> -    if test "$explicit_python" =3D no && has meson && version_ge "$(meso=
n
> --version)" 0.55.3; then
> +    if test "$explicit_python" =3D no && has meson && version_ge "$(meso=
n
> --version)" 0.56.0; then
>          meson=3Dmeson
>      elif test -e "${source_path}/.git" && test $git_update =3D 'yes' ; t=
hen
>          meson=3Dgit
> diff --git a/meson b/meson
> index 776acd2a80..f16d31607e 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
> +Subproject commit f16d31607eb3cd0f281758bd0944e206ef6be387
> --
> 2.29.2
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007d117c05b697b477
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:25 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure | 2 +-<br>
=C2=A0meson=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 6317964997..8d12b715e3 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -1938,7 +1938,7 @@ python_version=3D$($python -c &#39;import sys; print(=
&quot;%d.%d.%d&quot; % (sys.version_info[0]<br>
=C2=A0python=3D&quot;$python -B&quot;<br>
<br>
=C2=A0if test -z &quot;$meson&quot;; then<br>
-=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&amp; has m=
eson &amp;&amp; version_ge &quot;$(meson --version)&quot; 0.55.3; then<br>
+=C2=A0 =C2=A0 if test &quot;$explicit_python&quot; =3D no &amp;&amp; has m=
eson &amp;&amp; version_ge &quot;$(meson --version)&quot; 0.56.0; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson=3Dmeson<br>
=C2=A0 =C2=A0 =C2=A0elif test -e &quot;${source_path}/.git&quot; &amp;&amp;=
 test $git_update =3D &#39;yes&#39; ; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson=3Dgit<br>
diff --git a/meson b/meson<br>
index 776acd2a80..f16d31607e 160000<br>
--- a/meson<br>
+++ b/meson<br>
@@ -1 +1 @@<br>
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f<br>
+Subproject commit f16d31607eb3cd0f281758bd0944e206ef6be387<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007d117c05b697b477--

