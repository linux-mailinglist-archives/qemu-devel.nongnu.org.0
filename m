Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2FE2CED1D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:35:33 +0100 (CET)
Received: from localhost ([::1]:59024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9N7-00015U-18
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9Kn-0007zJ-QO
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:33:11 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9Kk-0002l4-MU
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:33:09 -0500
Received: by mail-ej1-x642.google.com with SMTP id n26so8198872eju.6
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PU5snDzB74KpzMq3a0F5Y29Zlc/fhKySjkBQAEo9VfQ=;
 b=F9bJnncTen0m9lwBMMtXpzMKdYKxZL8awQExM2YDW8wu5797MZblPS9kA5myGTWZJV
 RWg7Fn5oiM4z8vvCtchlMEnw5KfgcNQs7kL1aE90eUeWrdBVp6LWehlnASDxdw4GZVpq
 sFZoXzqXvOzUe3L+cYlk7O86wuFQOvF7XXwhsQEE8y1jvnotu7Htbwe8alaCKnqg5lSd
 jOehQ7dq52J1ktxmnyfiWiSE1GxONmV1l7XhgOShZ7mQSofzNY84tgDKALPI0GnMX7uL
 WAfqa8jAVlw8sPCW7Z+3mW97o595IYBvPoBPJxvI0MH2+vvZm6+fRHW7adPhLU8m9JJm
 7Yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PU5snDzB74KpzMq3a0F5Y29Zlc/fhKySjkBQAEo9VfQ=;
 b=PrviKUkYGfIhSKmmMrFH7RROHjsZSMFeFkrwRqDAYXiNoFICC8QdYuO85eD//XqJN+
 Y+L0RcGlcSXTDWdtCfOWRxKMztxBDT6jCxRvbYmKcSGayE9vCCS2EUu53yJ/myTSa9Bd
 sWCGo7gD4uirIpo+UUJ+PvTrpB3z9O1yFHZQj/y9Pg06AkBFntZT3FAKg92oJbOFoF2W
 +vtaribo4/YY/JJS/sANI0uAJEzIeZHTFMw9pMUXzV1iI07NK7sqI73m80QX7wWbwX9N
 RWdiNBo4eB0P29criu3ErdbONi0gwiubiEOgCkSkHZu7tWb1uengpIQVtrQafX9I5Z1b
 jxuA==
X-Gm-Message-State: AOAM533Sf1x2U7jw9Fq6VegxhtzSSLlB+EIARgDl5we6amPm1LLUObwV
 Q6AzOCuM3nVTorVgPA3NPynitUFleIAP/r2QUjc=
X-Google-Smtp-Source: ABdhPJyQYP/Q7aId2GbalB0kUlKPc3h8jOzKL4kebAKYXnUUgymLQ7VRPxJ+P7h0AH4P7C6tKbEXtNWpkyoPCNXPZvY=
X-Received: by 2002:a17:906:385b:: with SMTP id
 w27mr6682671ejc.109.1607081585394; 
 Fri, 04 Dec 2020 03:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-5-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-5-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:32:52 +0400
Message-ID: <CAJ+F1C+Lw4Ek-V-jZzW+rRYCf2bJpWHVdvLJqovvWNY9D+zVig@mail.gmail.com>
Subject: Re: [PATCH 4/9] vnc: drop unused copyrect feature
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005c94005b5a1d7f4"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
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

--00000000000005c94005b5a1d7f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 3:17 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> vnc stopped using the copyrect pseudo encoding in 2017, in commit
> 50628d3479e4 ("cirrus/vnc: zap bitblit support from console code.")
> So we can drop the now unused copyrect feature bit.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.h | 2 --
>  ui/vnc.c | 3 ---
>  2 files changed, 5 deletions(-)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 262fcf179b44..a7fd38a82075 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -445,7 +445,6 @@ enum VncFeatures {
>      VNC_FEATURE_WMVI,
>      VNC_FEATURE_TIGHT,
>      VNC_FEATURE_ZLIB,
> -    VNC_FEATURE_COPYRECT,
>      VNC_FEATURE_RICH_CURSOR,
>      VNC_FEATURE_TIGHT_PNG,
>      VNC_FEATURE_ZRLE,
> @@ -459,7 +458,6 @@ enum VncFeatures {
>  #define VNC_FEATURE_WMVI_MASK                (1 << VNC_FEATURE_WMVI)
>  #define VNC_FEATURE_TIGHT_MASK               (1 << VNC_FEATURE_TIGHT)
>  #define VNC_FEATURE_ZLIB_MASK                (1 << VNC_FEATURE_ZLIB)
> -#define VNC_FEATURE_COPYRECT_MASK            (1 << VNC_FEATURE_COPYRECT)
>  #define VNC_FEATURE_RICH_CURSOR_MASK         (1 <<
> VNC_FEATURE_RICH_CURSOR)
>  #define VNC_FEATURE_TIGHT_PNG_MASK           (1 << VNC_FEATURE_TIGHT_PNG=
)
>  #define VNC_FEATURE_ZRLE_MASK                (1 << VNC_FEATURE_ZRLE)
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 49235056f7a8..8c2771c1ce3b 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2061,9 +2061,6 @@ static void set_encodings(VncState *vs, int32_t
> *encodings, size_t n_encodings)
>          case VNC_ENCODING_RAW:
>              vs->vnc_encoding =3D enc;
>              break;
> -        case VNC_ENCODING_COPYRECT:
> -            vs->features |=3D VNC_FEATURE_COPYRECT_MASK;
> -            break;
>          case VNC_ENCODING_HEXTILE:
>              vs->features |=3D VNC_FEATURE_HEXTILE_MASK;
>              vs->vnc_encoding =3D enc;
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005c94005b5a1d7f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:17 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">vnc stopp=
ed using the copyrect pseudo encoding in 2017, in commit<br>
50628d3479e4 (&quot;cirrus/vnc: zap bitblit support from console code.&quot=
;)<br>
So we can drop the now unused copyrect feature bit.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.h | 2 --<br>
=C2=A0ui/vnc.c | 3 ---<br>
=C2=A02 files changed, 5 deletions(-)<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index 262fcf179b44..a7fd38a82075 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -445,7 +445,6 @@ enum VncFeatures {<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_WMVI,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_TIGHT,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZLIB,<br>
-=C2=A0 =C2=A0 VNC_FEATURE_COPYRECT,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_RICH_CURSOR,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_TIGHT_PNG,<br>
=C2=A0 =C2=A0 =C2=A0VNC_FEATURE_ZRLE,<br>
@@ -459,7 +458,6 @@ enum VncFeatures {<br>
=C2=A0#define VNC_FEATURE_WMVI_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_WMVI)<br>
=C2=A0#define VNC_FEATURE_TIGHT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(1 &lt;&lt; VNC_FEATURE_TIGHT)<br>
=C2=A0#define VNC_FEATURE_ZLIB_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZLIB)<br>
-#define VNC_FEATURE_COPYRECT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (1 &lt;&lt; VNC_FEATURE_COPYRECT)<br>
=C2=A0#define VNC_FEATURE_RICH_CURSOR_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(1 &lt;&lt; VNC_FEATURE_RICH_CURSOR)<br>
=C2=A0#define VNC_FEATURE_TIGHT_PNG_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(1 &lt;&lt; VNC_FEATURE_TIGHT_PNG)<br>
=C2=A0#define VNC_FEATURE_ZRLE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_ZRLE)<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 49235056f7a8..8c2771c1ce3b 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -2061,9 +2061,6 @@ static void set_encodings(VncState *vs, int32_t *enco=
dings, size_t n_encodings)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_RAW:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;vnc_encoding =3D enc=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VNC_ENCODING_COPYRECT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vs-&gt;features |=3D VNC_FEATURE=
_COPYRECT_MASK;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case VNC_ENCODING_HEXTILE:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;features |=3D VNC_FE=
ATURE_HEXTILE_MASK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vs-&gt;vnc_encoding =3D enc=
;<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000005c94005b5a1d7f4--

