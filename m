Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CBC2CED1C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 12:35:03 +0100 (CET)
Received: from localhost ([::1]:57680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl9Mc-0000Y6-RB
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 06:35:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9KK-0007ef-TN
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:32:40 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kl9KI-0002cx-Gi
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 06:32:40 -0500
Received: by mail-ed1-x543.google.com with SMTP id l5so5435929edq.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 03:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdySS1FdGaqtFm9RnpUh6jfnUtDfftiHdnauVzTVNrs=;
 b=cgKns1DoQJ7P+rUfnWDpfUXCFZIk9PgEHmP0TQBy+Ij8pORr5rQQsaNZe7PZc3KVXe
 R3pjr4rpD1WbzfamAAfR4R/ZU2jCZQxksOo1t9/1WFKl8Dp6mk/f+tDCIoL1ZAb090yX
 SboR1yoeDAgAh9QQU+3w7IRlDXz6400aBgijkw+MyyQTqEzFJnChOoqVld73msyt9zgZ
 hKHgq9NgNtX9PcQ5gkfz4W4TDmGNWSefgIReqLQdya8mmykitpYs2DUYa74oR/aoAP8C
 fLvx5/OvXs+ehW0KIYjb0J1XVqp3CQuquu/m3RrwjWAYhhlQafswbzZ6s6M1FDvwSJd2
 xh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdySS1FdGaqtFm9RnpUh6jfnUtDfftiHdnauVzTVNrs=;
 b=GttOAy6eJxUxvbkdzEOx1Myg+MmtRAsulHbSWROBTc1cLEhOu5HXjm+O9Fs8UkWypb
 NhV08KMJ7zk7RboWJVkGhCAoBPNp/Nelg17U/s8yjgWy2d8liCcDc58pFLWgsbnG68Bn
 djui3EyPq9GvUKdid+FuGCoJ+E8O3UWdxCRw/+VG2zMsi2kTwhoAVlzFoItUiOSQUEAS
 IsJlq6D2LOfXapnOe6e43/ha8YEN8P0Y3gSLcQF5A8cfiDGm59eZKNz2pU/J/k7LnZZL
 S2lXsvjWwfyE/787SBG83drtajfTArd5HHYzHIEbsmgp1sU1zClGYdj/by3Jmrj9rgYx
 uPsA==
X-Gm-Message-State: AOAM5318thd7hRxCjWR4SgiPOCVqVQ9vlfVBh8M+ToD3+z7P5IuhPFqn
 foYdF6nBDi8nMIzFjz6cpgueh7lVwT8EzRwiOGeQNB3t0Vl/Og==
X-Google-Smtp-Source: ABdhPJwwkxAZ7bOD7Z+ovU+L9R3ZiYh4IMudunWAmDMHydFzt2JEE0nZiCiXGYlnNJMyuy06gvWxS7zBwdK3iwtd6Gk=
X-Received: by 2002:a50:a245:: with SMTP id 63mr7002568edl.314.1607081557176; 
 Fri, 04 Dec 2020 03:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-4-kraxel@redhat.com>
In-Reply-To: <20201203110806.13556-4-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Dec 2020 15:32:25 +0400
Message-ID: <CAJ+F1CL3VQL-0hmRqrHr5Y+qapOAOiKDH1ay9VOUq9-VaHzsbQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] vnc: use enum for features
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000057372105b5a1d554"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

--00000000000057372105b5a1d554
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 3, 2020 at 3:08 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Use an enum for the vnc feature bits.  That way they are enumerated
> automatically and we don't have to do that manually when adding or
> removing features.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/vnc.h | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/ui/vnc.h b/ui/vnc.h
> index 4e2637ce6c5c..262fcf179b44 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -438,18 +438,20 @@ enum {
>   *
>
> *************************************************************************=
****/
>
> -#define VNC_FEATURE_RESIZE                   0
> -#define VNC_FEATURE_HEXTILE                  1
> -#define VNC_FEATURE_POINTER_TYPE_CHANGE      2
> -#define VNC_FEATURE_WMVI                     3
> -#define VNC_FEATURE_TIGHT                    4
> -#define VNC_FEATURE_ZLIB                     5
> -#define VNC_FEATURE_COPYRECT                 6
> -#define VNC_FEATURE_RICH_CURSOR              7
> -#define VNC_FEATURE_TIGHT_PNG                8
> -#define VNC_FEATURE_ZRLE                     9
> -#define VNC_FEATURE_ZYWRLE                  10
> -#define VNC_FEATURE_LED_STATE               11
> +enum VncFeatures {
> +    VNC_FEATURE_RESIZE,
> +    VNC_FEATURE_HEXTILE,
> +    VNC_FEATURE_POINTER_TYPE_CHANGE,
> +    VNC_FEATURE_WMVI,
> +    VNC_FEATURE_TIGHT,
> +    VNC_FEATURE_ZLIB,
> +    VNC_FEATURE_COPYRECT,
> +    VNC_FEATURE_RICH_CURSOR,
> +    VNC_FEATURE_TIGHT_PNG,
> +    VNC_FEATURE_ZRLE,
> +    VNC_FEATURE_ZYWRLE,
> +    VNC_FEATURE_LED_STATE,
> +};
>
>  #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
>  #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000057372105b5a1d554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 3:08 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use an en=
um for the vnc feature bits.=C2=A0 That way they are enumerated<br>
automatically and we don&#39;t have to do that manually when adding or<br>
removing features.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/vnc.h | 26 ++++++++++++++------------<br>
=C2=A01 file changed, 14 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/ui/vnc.h b/ui/vnc.h<br>
index 4e2637ce6c5c..262fcf179b44 100644<br>
--- a/ui/vnc.h<br>
+++ b/ui/vnc.h<br>
@@ -438,18 +438,20 @@ enum {<br>
=C2=A0 *<br>
=C2=A0 ********************************************************************=
*********/<br>
<br>
-#define VNC_FEATURE_RESIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00<br>
-#define VNC_FEATURE_HEXTILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1<br>
-#define VNC_FEATURE_POINTER_TYPE_CHANGE=C2=A0 =C2=A0 =C2=A0 2<br>
-#define VNC_FEATURE_WMVI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
-#define VNC_FEATURE_TIGHT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 4<br>
-#define VNC_FEATURE_ZLIB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
-#define VNC_FEATURE_COPYRECT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A06<br>
-#define VNC_FEATURE_RICH_CURSOR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 7<br>
-#define VNC_FEATURE_TIGHT_PNG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 8<br>
-#define VNC_FEATURE_ZRLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A09<br>
-#define VNC_FEATURE_ZYWRLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 10<br>
-#define VNC_FEATURE_LED_STATE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A011<br>
+enum VncFeatures {<br>
+=C2=A0 =C2=A0 VNC_FEATURE_RESIZE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_HEXTILE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_POINTER_TYPE_CHANGE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_WMVI,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_TIGHT,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_ZLIB,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_COPYRECT,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_RICH_CURSOR,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_TIGHT_PNG,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_ZRLE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_ZYWRLE,<br>
+=C2=A0 =C2=A0 VNC_FEATURE_LED_STATE,<br>
+};<br>
<br>
=C2=A0#define VNC_FEATURE_RESIZE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (1 &lt;&lt; VNC_FEATURE_RESIZE)<br>
=C2=A0#define VNC_FEATURE_HEXTILE_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(1 &lt;&lt; VNC_FEATURE_HEXTILE)<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000057372105b5a1d554--

