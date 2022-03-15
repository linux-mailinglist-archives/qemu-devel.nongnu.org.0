Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3C4D9A61
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:28:56 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5MF-0003zT-DG
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:28:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nU59h-0007lq-1b
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:15:57 -0400
Received: from [2a00:1450:4864:20::42e] (port=44990
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nU59f-0007bd-0D
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:15:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b19so6072149wrh.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Div+G4a29QV/gXVNplpWYz9B2vwv/LmTlnDwcJ0elUU=;
 b=D0/XrawzDGNKuZsi++/82f+mxXXi9Y44p1+OvUNUFXfGQfNxcjWf6eCYl4zMl9TOyu
 TPq4THyIqy+D6uTGrovVI6RaoQy2dHpI8LOXfzYqVRdb4PW15hgxePNxKL4N4xuc77lW
 pt/NYPdtbJVaLd+uSnU70SJehxhOnz+qdfu0QW2DDdJ+f0DuAaxz7461QbqEOJUced6/
 dh7WH4WFmSGq+vaJn5SzOGIagEH8D4ETIZVP0lIzq7mEPvzBAGu+qMGQfMuUK7jlWOFO
 uLL/aq6V4bIezDgJ6Yfp81znxk1TwhA78OTlmH2Yv3sTyLUl57huWhK+/RLS0pMYCqh9
 euog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Div+G4a29QV/gXVNplpWYz9B2vwv/LmTlnDwcJ0elUU=;
 b=o33Z6rx+oWfiPb3BW40jzfS5N7s3VtISSaDqq7gD/oxAAcwo0nq0So3U6Jl6aQgIK6
 nRf/vEg/ZSbU6Ko6raceK1qfFm0myXNkZSswc2b3nGoltW4wP8AilzUyo772gOzmPnVz
 XAcr5tC2mkYs7YZXBCYgExJoIzAfNuPmt9JOgk2lUs2ie03a7xCgu3N/j+9jUq3P+nWP
 BHjInT5vnUz/2nOrUDV338L4zGX79pTWK8ZfDqB6OhJSBpyWQXZSQyU7LfKp8ZIYUPvW
 5FeGgtZQ/62UH6v1O8tz6QSJlJScL87VsOMOi+gLkoKpc512mN3Ku+F62GETpcehLqod
 YPoQ==
X-Gm-Message-State: AOAM531/fWkgO/DMpBzfM3JunKi5tf1+fFTHlvp22LduAnAGpjJixoka
 UNE1N02B3HC4LaGUhcIYsZaqngj/nV62fxKBXWA=
X-Google-Smtp-Source: ABdhPJxaeK0MMS2zjmrktj5Nwjx3Fdqxuye1H4VU0p61qTMYmw4l/Knmcx5NuFDs2bZq68C9udlqN6wchAsfmD4Vja8=
X-Received: by 2002:a5d:4cd1:0:b0:1f0:24d5:7c37 with SMTP id
 c17-20020a5d4cd1000000b001f024d57c37mr19993970wrt.421.1647342952258; Tue, 15
 Mar 2022 04:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4FA22100C@SHASXM06.verisilicon.com>
In-Reply-To: <4C23C17B8E87E74E906A25A3254A03F4FA22100C@SHASXM06.verisilicon.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 15 Mar 2022 15:15:40 +0400
Message-ID: <CAJ+F1CJcWJLtPnpXRx09KAq-60Wb1sDd6i0RsBu1YHGTgB+YTg@mail.gmail.com>
Subject: Re: [PATCH] ui: avoid unnecessary memory operations in
 vnc_refresh_server_surface()
To: "Wen, Jianxian" <Jianxian.Wen@verisilicon.com>
Content-Type: multipart/alternative; boundary="0000000000007e205f05da3febfa"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007e205f05da3febfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 15, 2022 at 11:24 AM Wen, Jianxian <Jianxian.Wen@verisilicon.co=
m>
wrote:

> Check the dirty bits in advance to avoid unnecessary memory operations.
> In the case that guest surface has different format than the server,
> but it does not have dirty bits which means no refresh is actually needed=
,
> the memory operations is not necessary.
>
> Signed-off-by: Jianxian Wen <jianxian.wen@verisilicon.com>
> Signed-off-by: Lu Gao <lu.gao@verisilicon.com>
> ---
>  ui/vnc.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 3ccd33dedc..310a873c21 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3098,6 +3098,9 @@ static int vnc_refresh_server_surface(VncDisplay *v=
d)
>      VncState *vs;
>      int has_dirty =3D 0;
>      pixman_image_t *tmpbuf =3D NULL;
> +    unsigned long offset;
> +    int x;
> +    uint8_t *guest_ptr, *server_ptr;
>
>      struct timeval tv =3D { 0, 0 };
>
> @@ -3106,6 +3109,13 @@ static int vnc_refresh_server_surface(VncDisplay
> *vd)
>          has_dirty =3D vnc_update_stats(vd, &tv);
>      }
>
> +    offset =3D find_next_bit((unsigned long *) &vd->guest.dirty,
> +                           height * VNC_DIRTY_BPL(&vd->guest), 0);
> +    if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
> +        /* no dirty bits in guest surface */
> +        return has_dirty;
> +    }
> +
>      /*
>       * Walk through the guest dirty map.
>       * Check and copy modified bits from guest to server surface.
> @@ -3130,15 +3140,6 @@ static int vnc_refresh_server_surface(VncDisplay
> *vd)
>      line_bytes =3D MIN(server_stride, guest_ll);
>
>      for (;;) {
> -        int x;
> -        uint8_t *guest_ptr, *server_ptr;
> -        unsigned long offset =3D find_next_bit((unsigned long *)
> &vd->guest.dirty,
> -                                             height *
> VNC_DIRTY_BPL(&vd->guest),
> -                                             y *
> VNC_DIRTY_BPL(&vd->guest));
> -        if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
> -            /* no more dirty bits */
> -            break;
> -        }
>          y =3D offset / VNC_DIRTY_BPL(&vd->guest);
>          x =3D offset % VNC_DIRTY_BPL(&vd->guest);
>
> @@ -3177,6 +3178,13 @@ static int vnc_refresh_server_surface(VncDisplay
> *vd)
>          }
>
>          y++;
> +        offset =3D find_next_bit((unsigned long *) &vd->guest.dirty,
> +                               height * VNC_DIRTY_BPL(&vd->guest),
> +                               y * VNC_DIRTY_BPL(&vd->guest));
> +        if (offset =3D=3D height * VNC_DIRTY_BPL(&vd->guest)) {
> +            /* no more dirty bits */
> +            break;
> +        }
>      }
>      qemu_pixman_image_unref(tmpbuf);
>      return has_dirty;
> --
> 2.33.0
>
>
lgtm,

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007e205f05da3febfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 15, 2022 at 11:24 AM We=
n, Jianxian &lt;<a href=3D"mailto:Jianxian.Wen@verisilicon.com">Jianxian.We=
n@verisilicon.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Check the dirty bits in advance to avoid unnecessary memor=
y operations.<br>
In the case that guest surface has different format than the server,<br>
but it does not have dirty bits which means no refresh is actually needed,<=
br>
the memory operations is not necessary.<br>
<br>
Signed-off-by: Jianxian Wen &lt;<a href=3D"mailto:jianxian.wen@verisilicon.=
com" target=3D"_blank">jianxian.wen@verisilicon.com</a>&gt;<br>
Signed-off-by: Lu Gao &lt;<a href=3D"mailto:lu.gao@verisilicon.com" target=
=3D"_blank">lu.gao@verisilicon.com</a>&gt;<br>
---<br>
=C2=A0ui/vnc.c | 26 +++++++++++++++++---------<br>
=C2=A01 file changed, 17 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/ui/vnc.c b/ui/vnc.c<br>
index 3ccd33dedc..310a873c21 100644<br>
--- a/ui/vnc.c<br>
+++ b/ui/vnc.c<br>
@@ -3098,6 +3098,9 @@ static int vnc_refresh_server_surface(VncDisplay *vd)=
<br>
=C2=A0 =C2=A0 =C2=A0VncState *vs;<br>
=C2=A0 =C2=A0 =C2=A0int has_dirty =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0pixman_image_t *tmpbuf =3D NULL;<br>
+=C2=A0 =C2=A0 unsigned long offset;<br>
+=C2=A0 =C2=A0 int x;<br>
+=C2=A0 =C2=A0 uint8_t *guest_ptr, *server_ptr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0struct timeval tv =3D { 0, 0 };<br>
<br>
@@ -3106,6 +3109,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0has_dirty =3D vnc_update_stats(vd, &amp;t=
v);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 offset =3D find_next_bit((unsigned long *) &amp;vd-&gt;guest=
.dirty,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0height * VNC_DIRTY_BPL(&amp;vd-&gt;guest), 0);<br>
+=C2=A0 =C2=A0 if (offset =3D=3D height * VNC_DIRTY_BPL(&amp;vd-&gt;guest))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no dirty bits in guest surface */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return has_dirty;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Walk through the guest dirty map.<br>
=C2=A0 =C2=A0 =C2=A0 * Check and copy modified bits from guest to server su=
rface.<br>
@@ -3130,15 +3140,6 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)<br>
=C2=A0 =C2=A0 =C2=A0line_bytes =3D MIN(server_stride, guest_ll);<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (;;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int x;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *guest_ptr, *server_ptr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long offset =3D find_next_bit((unsign=
ed long *) &amp;vd-&gt;guest.dirty,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0height * VNC_DIRTY_BPL(&amp;vd-&gt;guest),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0y * VNC_DIRTY_BPL(&amp;vd-&gt;guest));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset =3D=3D height * VNC_DIRTY_BPL(&amp;=
vd-&gt;guest)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no more dirty bits */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D offset / VNC_DIRTY_BPL(&amp;vd-&gt;=
guest);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x =3D offset % VNC_DIRTY_BPL(&amp;vd-&gt;=
guest);<br>
<br>
@@ -3177,6 +3178,13 @@ static int vnc_refresh_server_surface(VncDisplay *vd=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D find_next_bit((unsigned long *) &am=
p;vd-&gt;guest.dirty,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0height * VNC_DIRTY_BPL(&amp;vd-&gt;gu=
est),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y * VNC_DIRTY_BPL(&amp;vd-&gt;guest))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset =3D=3D height * VNC_DIRTY_BPL(&amp;=
vd-&gt;guest)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no more dirty bits */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0qemu_pixman_image_unref(tmpbuf);<br>
=C2=A0 =C2=A0 =C2=A0return has_dirty;<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div><div><br></div><div>lgtm,</div><div><br></div><div>Revie=
wed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redha=
t.com">marcandre.lureau@redhat.com</a>&gt;<br></div><br>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007e205f05da3febfa--

