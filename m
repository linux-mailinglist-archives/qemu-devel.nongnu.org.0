Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E43698C65
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:50:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX98-0007JR-Mr; Thu, 16 Feb 2023 00:49:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pSX8j-00075O-O3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:49:08 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pSX8h-0005Y9-Qk
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:49:05 -0500
Received: by mail-ej1-x631.google.com with SMTP id 10so1788561ejc.10
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2t+DDbgWjK4z8DpiT5xtRN70nGm683hAEkcP2R/Wng8=;
 b=EZMvLDK4VQ/JKRvj9E6ls+xPHsSR2smQaLW5gTegeLWo2rekoESpgmJ+sHFjz0dBZZ
 DNfCfkLSQ3GlKJ+H9DXoGhycHtCNzSgX8zyF6yeZbAgK16ZgB6Wu2lHOrYdCkHEwyoOx
 3UOZ8Ske4KadCM3JAKWaKfbFnrWPyL3H2vUi8KCjSrJr1AAzaK5Y3s753AfPl48al5fM
 niZjnaYV03VHvuTxel34ZejKy89OxQbX7+b9hDHBKs7HJ2b3T2HQncJ+bB0co7SgqipQ
 LXAlFAaXZA7MRjJeRwgei0KcBnoJzrhR6qG/8VBzaQKH2pJtgsfuwN3GjEvXWokgpF8I
 Mr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2t+DDbgWjK4z8DpiT5xtRN70nGm683hAEkcP2R/Wng8=;
 b=C2YkgePrUwT44xAqf3MaUxJWbPQuVu9olKIHpD3lV3To8L/J1bojq1YgPvEYtafuzm
 zKjG0siRHEX2dyHHCNG7DauFAwO3FXZfyBDkeGI7O6IGsMQ6JAVTjaEv8OjqKr4849Aa
 9zhxjIl+fVIDNFgevG3KDgH9lYRj7r1hrZKlE5jVpSOMWb62C8k1otzSWH8nj2N+Y+8n
 Nhj/HSyS9SYJHYwyweTUxO2pismdGiH7ELhD4CEDKUuyHBBnXo7MilK2sXHTB+VkQPRr
 mVZeQ7EOw7yZaT8veF6X3X8w1Hrb7/CICpgL0tUyqmlYM8qsnzpJOUPYQlIDCVnVYiUw
 Rnxw==
X-Gm-Message-State: AO0yUKV0JKhNV9q5+yxQ5WuhtJkBx7FT2Kjq/e0EpFmGtuZqZIV053ol
 OdpBnW5TDnMbsSpDSWRTKf5nVl+MeN5+CyAz2L7vFdeV4B8=
X-Google-Smtp-Source: AK7set/NfGSOjaqn9KA2oBVd1S0l23OhxKBuGRBzgVEunNpZKhbvUV3W/CW0RZrcrp+jrb0rKqe/jdDyTuimjIjt/wA=
X-Received: by 2002:a17:906:2dd8:b0:8b1:2898:2138 with SMTP id
 h24-20020a1709062dd800b008b128982138mr2246878eji.3.1676526540179; Wed, 15 Feb
 2023 21:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20230208233111.398577-1-dinahbaum123@gmail.com>
 <20230208233111.398577-2-dinahbaum123@gmail.com>
In-Reply-To: <20230208233111.398577-2-dinahbaum123@gmail.com>
From: Dinah B <dinahbaum123@gmail.com>
Date: Thu, 16 Feb 2023 00:48:48 -0500
Message-ID: <CAH50XReYAK1=8OQvven4v2ZYx9G=q9GQSJo4Bditp9KHcDmUCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] configure: Add 'mkdir build' check
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e24e8105f4cac0e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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

--000000000000e24e8105f4cac0e4
Content-Type: text/plain; charset="UTF-8"

*ping*

Patch series:
https://lore.kernel.org/qemu-devel/20230208233111.398577-1-dinahbaum123@gmail.com/

-Dinah

On Wed, Feb 8, 2023 at 6:31 PM Dinah Baum <dinahbaum123@gmail.com> wrote:

> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
>
> Checking if 'mkdir dir' succeeds prevents this error.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
> ---
>  configure | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index 64960c6000..3b384914ce 100755
> --- a/configure
> +++ b/configure
> @@ -31,10 +31,11 @@ then
>          fi
>      fi
>
> -    mkdir build
> -    touch $MARKER
> +    if mkdir build
> +    then
> +        touch $MARKER
>
> -    cat > GNUmakefile <<'EOF'
> +        cat > GNUmakefile <<'EOF'
>  # This file is auto-generated by configure to support in-source tree
>  # 'make' command invocation
>
> @@ -56,8 +57,12 @@ force: ;
>  GNUmakefile: ;
>
>  EOF
> -    cd build
> -    exec "$source_path/configure" "$@"
> +        cd build
> +        exec "$source_path/configure" "$@"
> +    else
> +        echo "ERROR: Unable to use ./build dir, try using a
> ../qemu/configure build"
> +        exit 1
> +    fi
>  fi
>
>  # Temporary directory used for files created while
> --
> 2.30.2
>
>

--000000000000e24e8105f4cac0e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><b>ping</b><br></div><div><br></div><div>Patch series=
: <a href=3D"https://lore.kernel.org/qemu-devel/20230208233111.398577-1-din=
ahbaum123@gmail.com/">https://lore.kernel.org/qemu-devel/20230208233111.398=
577-1-dinahbaum123@gmail.com/</a></div><div><br></div><div>-Dinah<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Feb 8, 2023 at 6:31 PM Dinah Baum &lt;<a href=3D"mailto:dinahbaum12=
3@gmail.com">dinahbaum123@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">QEMU configure script goes into an infin=
ite error printing loop<br>
when in read only directory due to &#39;build&#39; dir never being created.=
<br>
<br>
Checking if &#39;mkdir dir&#39; succeeds prevents this error.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/321" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/321</a><br>
---<br>
=C2=A0configure | 15 ++++++++++-----<br>
=C2=A01 file changed, 10 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 64960c6000..3b384914ce 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -31,10 +31,11 @@ then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
-=C2=A0 =C2=A0 mkdir build<br>
-=C2=A0 =C2=A0 touch $MARKER<br>
+=C2=A0 =C2=A0 if mkdir build<br>
+=C2=A0 =C2=A0 then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 touch $MARKER<br>
<br>
-=C2=A0 =C2=A0 cat &gt; GNUmakefile &lt;&lt;&#39;EOF&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; GNUmakefile &lt;&lt;&#39;EOF&#39;<br>
=C2=A0# This file is auto-generated by configure to support in-source tree<=
br>
=C2=A0# &#39;make&#39; command invocation<br>
<br>
@@ -56,8 +57,12 @@ force: ;<br>
=C2=A0GNUmakefile: ;<br>
<br>
=C2=A0EOF<br>
-=C2=A0 =C2=A0 cd build<br>
-=C2=A0 =C2=A0 exec &quot;$source_path/configure&quot; &quot;$@&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec &quot;$source_path/configure&quot; &quot;=
$@&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: Unable to use ./build dir, t=
ry using a ../qemu/configure build&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+=C2=A0 =C2=A0 fi<br>
=C2=A0fi<br>
<br>
=C2=A0# Temporary directory used for files created while<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--000000000000e24e8105f4cac0e4--

