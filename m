Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1D5E6C17
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:53:02 +0200 (CEST)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSFp-0001AP-By
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSAw-0004hW-Fh; Thu, 22 Sep 2022 15:48:00 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSAu-0001BQ-Fo; Thu, 22 Sep 2022 15:47:58 -0400
Received: by mail-lf1-x12f.google.com with SMTP id a2so16413534lfb.6;
 Thu, 22 Sep 2022 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=eWRnJn6q8+5p0Mcf5ubyq3uGmjuUPhviH7YFd826Jb0=;
 b=G2hMRFSmcvcUKH1Q8iyCUo8vCnIl9cbFxcqvtTa1AcWsADvX6eWBjOKyIBlmNMjb6b
 P6FPa+W4WK9SkMgBGr3QExud5KkjR34X38/LfmQlcLKE5BfFo9HTCspVeN/rSmJMrwqy
 fNttxkikRv3yF978Mk5sX/1y/Pv+xRpKNcwltG6ljJm+sF+3v4qEVLcMJ+E2K7tj1+Qz
 QVRZ9GkuiWg8wZCJbsbGxDfFnB6eqAvnPUV0N4rZo3JWII/6zEen3l4bjwTo1EmIiwwl
 bh7vwXiqqBRxgA9+E3Bh2vD+WWX39aVS5oLaFNWfgoa0VPVzYj3wHyZjhoKlphTcSX6+
 W9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=eWRnJn6q8+5p0Mcf5ubyq3uGmjuUPhviH7YFd826Jb0=;
 b=hIfyYFDPR0ffAOAFP5Timjtn0XWnm80UZMaKM01Ca9z3Q+f0fbEIRLoJKFMcwv5VQb
 XNmem6KufQWeSnOCusVgGBw+LvqUt/vj6OArg8jzxtlnJoQTgYkAZeptz5hnH4jbwcxR
 09bZqMhlcdXdxvhKtoR1S2a7YsGb3wQfrjoIaevSy570GEKveIdrQIrGb+ruMXHuRmQ8
 tR2vxqlfB1GRom5rHUhEsRfgfRO1v5CzdRc/hhjZKzt6Hdmu+X/Zv+RBgcOwhCaPScgo
 NJfosxiIJJQWV8FBdigp6jozuUNc0hWNPjdwjULUqsRTVgI7ss/QAkVSnl/i0lgTRTxx
 5K0A==
X-Gm-Message-State: ACrzQf0qIgBzMR5Wu+INyNFNIUfTfwz60J5gxiRUlQud99y9ahkuI6va
 N122vMHi4Tymw83ha/p+ZjNOPux3P/V3ZOa6x5Q=
X-Google-Smtp-Source: AMsMyM4a5LkAVzleoipY3gSGkA5ZeioDTmAkJMgWRK90nQTLo0BDiGQwo/JLQjLFZsF28KwPtRRAlNjkAFBFwoAjhGc=
X-Received: by 2002:ac2:5e66:0:b0:49e:bce2:3df5 with SMTP id
 a6-20020ac25e66000000b0049ebce23df5mr1825568lfr.362.1663876074638; Thu, 22
 Sep 2022 12:47:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-9-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-9-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:47:42 +0200
Message-ID: <CAJ+F1C+1majePa1GL-VmTLYFAy_ADCcvfxHr-sxuZCF9UpXckw@mail.gmail.com>
Subject: Re: [PATCH v2 08/39] block/vvfat: Unify the mkdir() call
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000061125205e9495653"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

--00000000000061125205e9495653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 2:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> There is a difference in the mkdir() call for win32 and non-win32
> platforms, and currently is handled in the codes with #ifdefs.
>
> glib provides a portable g_mkdir() API and we can use it to unify
> the codes without #ifdefs.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v2:
> - Change to use g_mkdir()
>
>  block/vvfat.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/block/vvfat.c b/block/vvfat.c
> index d6dd919683..723beef025 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -25,6 +25,7 @@
>
>  #include "qemu/osdep.h"
>  #include <dirent.h>
> +#include <glib/gstdio.h>
>  #include "qapi/error.h"
>  #include "block/block_int.h"
>  #include "block/qdict.h"
> @@ -2726,13 +2727,9 @@ static int
> handle_renames_and_mkdirs(BDRVVVFATState* s)
>              mapping_t* mapping;
>              int j, parent_path_len;
>
> -#ifdef __MINGW32__
> -            if (mkdir(commit->path))
> +            if (g_mkdir(commit->path, 0755)) {
>                  return -5;
> -#else
> -            if (mkdir(commit->path, 0755))
> -                return -5;
> -#endif
> +            }
>
>              mapping =3D insert_mapping(s, commit->param.mkdir.cluster,
>                      commit->param.mkdir.cluster + 1);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000061125205e9495653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:58 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin M=
eng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.men=
g@windriver.com</a>&gt;<br>
<br>
There is a difference in the mkdir() call for win32 and non-win32<br>
platforms, and currently is handled in the codes with #ifdefs.<br>
<br>
glib provides a portable g_mkdir() API and we can use it to unify<br>
the codes without #ifdefs.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v2:<br>
- Change to use g_mkdir()<br>
<br>
=C2=A0block/vvfat.c | 9 +++------<br>
=C2=A01 file changed, 3 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/block/vvfat.c b/block/vvfat.c<br>
index d6dd919683..723beef025 100644<br>
--- a/block/vvfat.c<br>
+++ b/block/vvfat.c<br>
@@ -25,6 +25,7 @@<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
+#include &lt;glib/gstdio.h&gt;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;block/block_int.h&quot;<br>
=C2=A0#include &quot;block/qdict.h&quot;<br>
@@ -2726,13 +2727,9 @@ static int handle_renames_and_mkdirs(BDRVVVFATState*=
 s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping_t* mapping;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int j, parent_path_len;<br>
<br>
-#ifdef __MINGW32__<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir(commit-&gt;path))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_mkdir(commit-&gt;path, 075=
5)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -5;<br=
>
-#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mkdir(commit-&gt;path, 0755)=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -5;<br>
-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mapping =3D insert_mapping(=
s, commit-&gt;param.mkdir.cluster,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0commit-&gt;param.mkdir.cluster + 1);<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000061125205e9495653--

