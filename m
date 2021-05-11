Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7937A3EF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:43:57 +0200 (CEST)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOvk-0007o5-5h
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgOgZ-00059Q-5a
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:28:15 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:47066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgOgW-00006E-PZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:28:14 -0400
Received: by mail-ed1-x532.google.com with SMTP id r11so7194662edt.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euWgkOnSIyiYrHuRxYSQwMZnQgiFTmiCaURh6tfU/4s=;
 b=Q4TlUOFMVd4lrf39XFPAYNgN0UwE0wRY7tyFi+LA+7vWK1uJSoPHZWuU5eKVFxZPsw
 w1s8alXaMzcyc+V7WtkeS2ZH4mJY/0ayW/YEV+rwxEP3FmSYnm9wjZw06GOlVJyoNEoi
 szcGuKRX/aNQ1OqJojdPJquVlSAPyvkRfd4SFAMBLNmNWiOn+i3EMmjYWCF2ZFXDqGal
 fJfnk1bcz0f0T0uKU+KOopb1YSDk1CDNgxXZqoZEruWc9zntPKxet7Fv68/pFs1zxDQe
 qWaizKHHzZmWbH6P2PPfFJMijYJvwutIoPxVCchB+MPCBFaQhdznArlqhAAme10LR1Fn
 340g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euWgkOnSIyiYrHuRxYSQwMZnQgiFTmiCaURh6tfU/4s=;
 b=ekhAPdVCiinY4x7FOgxSUuWA+erH5EZQ6spMJr3SPAOUCnw+U54IF0IfYjD69L8Q5j
 zFqtrMgRAL2OpzqJ5LU8nKSXOuJN4sKW36JQA1/y2jmLAEgOH3TOckuROOhVDIPjWol+
 xsr7imBQuZPOBN8ppifnDaMQgCyEBo1Z06JLV1+nlasbOe0l2bE9bPaPzRvisizRpLXZ
 dkOAkL48kdLGwsZnMLgDOGC+HE6Q5kZxfqpnZNd9BiLiycekv7XQ3mycLwaF2a72LS+y
 gPR3YDrCBEOziYQl7m/K03lgk/bnDh0iMbCLs7PCpiSwoNq+7/wxBZ6aSR7Axveka/oq
 NzQQ==
X-Gm-Message-State: AOAM532hgY92xMx1asFFbtSqS/Fo3EIqGzeDCe0H2z883eWSEZHCIJb4
 Go11vO3sTichy4pwYwKOIFpQZh2IHvh67PSsB84=
X-Google-Smtp-Source: ABdhPJxh75HKPDGtSpP0DzRxNZAEqvsKeJY+GQE8lUHndPP+eqsa7s+E9kR5mMNUMhlQMIzaxL+fPpzmAnPeWSmkkRk=
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr14763927edt.53.1620725290490; 
 Tue, 11 May 2021 02:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210505060901.828658-1-kraxel@redhat.com>
 <20210505060901.828658-5-kraxel@redhat.com>
 <CAJ+F1CKJyE3P7DX6tewSBHUBrqsc_h5CNZi95VpT9bGu=eVgFQ@mail.gmail.com>
 <20210511090419.nl6akk43mt4g5rua@sirius.home.kraxel.org>
In-Reply-To: <20210511090419.nl6akk43mt4g5rua@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 11 May 2021 13:27:58 +0400
Message-ID: <CAJ+F1C+5znoXc9Dy5+q86LkJhY6U6a4Q6yBcPRhQp58w6kRpwQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000037de0f05c20a8308"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000037de0f05c20a8308
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 11, 2021 at 1:04 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> > > +/* -----------------------------------------------------------------=
-
> */
> > > +/* send messages
> */
> > > +
> > > +static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t
> > > msgsize)
> > > +{
> > > +    uint8_t *msgbuf =3D ptr;
> > > +    uint32_t len, pos =3D 0;
> > > +
> > > +    while (pos < msgsize) {
> > > +        len =3D qemu_chr_be_can_write(CHARDEV(vd));
> > > +        if (len > msgsize - pos) {
> > > +            len =3D msgsize - pos;
> > > +        }
> > > +        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
> > > +        pos +=3D len;
> > > +    }
> > >
> >
> > This looks like it could easily busy loop. Have you thought about fixin=
g
> > this?
>
> Incremental fix [ to be squashed ]
>
>
thanks, a few comments below

take care,
>   Gerd
>
> diff --git a/ui/vdagent.c b/ui/vdagent.c
> index 64213aa25a06..efa98725fb22 100644
> --- a/ui/vdagent.c
> +++ b/ui/vdagent.c
> @@ -3,7 +3,9 @@
>  #include "include/qemu-common.h"
>  #include "chardev/char.h"
>  #include "hw/qdev-core.h"
> +#include "qemu/buffer.h"
>  #include "qemu/option.h"
> +#include "qemu/units.h"
>  #include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "ui/input.h"
> @@ -16,6 +18,7 @@
>
>  #define VDAGENT_MOUSE_DEFAULT true
>  #define VDAGENT_CLIPBOARD_DEFAULT false
> +#define VDAGENT_BUFFER_LIMIT (1 * MiB)
>
>  struct VDAgentChardev {
>      Chardev parent;
> @@ -32,6 +35,7 @@ struct VDAgentChardev {
>      uint32_t msgsize;
>      uint8_t *xbuf;
>      uint32_t xoff, xsize;
> +    Buffer outbuf;
>
>      /* mouse */
>      DeviceState mouse_dev;
> @@ -124,18 +128,20 @@ static const char *type_name[] =3D {
>  /* ------------------------------------------------------------------ */
>  /* send messages                                                      */
>
> -static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t
> msgsize)
> +static void vdagent_send_buf(VDAgentChardev *vd)
>  {
> -    uint8_t *msgbuf =3D ptr;
> -    uint32_t len, pos =3D 0;
> +    uint32_t len;
>
> -    while (pos < msgsize) {
> +    while (!buffer_empty(&vd->outbuf)) {
>          len =3D qemu_chr_be_can_write(CHARDEV(vd));
> -        if (len > msgsize - pos) {
> -            len =3D msgsize - pos;
> +        if (len =3D=3D 0) {
> +            return;
>          }
> -        qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, len);
> -        pos +=3D len;
> +        if (len > vd->outbuf.offset) {
> +            len =3D vd->outbuf.offset;
> +        }
> +        qemu_chr_be_write(CHARDEV(vd), vd->outbuf.buffer, len);
> +        buffer_advance(&vd->outbuf, len);
>      }
>  }
>
> @@ -150,16 +156,22 @@ static void vdagent_send_msg(VDAgentChardev *vd,
> VDAgentMessage *msg)
>
>      msg->protocol =3D VD_AGENT_PROTOCOL;
>
> +    if (vd->outbuf.offset + msgsize > VDAGENT_BUFFER_LIMIT) {
> +        return;
> +    }
>

Silently dropping messages, there might be some bad consequences. At least
I think we should error_report(). Eventually, the caller should be informed
too.


> +
>      while (msgoff < msgsize) {
>          chunk.port =3D VDP_CLIENT_PORT;
>          chunk.size =3D msgsize - msgoff;
>          if (chunk.size > 1024) {
>              chunk.size =3D 1024;
>          }
> -        vdagent_send_buf(vd, &chunk, sizeof(chunk));
> -        vdagent_send_buf(vd, msgbuf + msgoff, chunk.size);
> +        buffer_reserve(&vd->outbuf, sizeof(chunk) + chunk.size);
> +        buffer_append(&vd->outbuf, &chunk, sizeof(chunk));
> +        buffer_append(&vd->outbuf, msgbuf + msgoff, chunk.size);
>          msgoff +=3D chunk.size;
>      }
> +    vdagent_send_buf(vd);
>  }
>
>  static void vdagent_send_caps(VDAgentChardev *vd)
> @@ -550,6 +562,7 @@ static void vdagent_chr_open(Chardev *chr,
>
> &vdagent_mouse_handler);
>      }
>
> +    buffer_init(&vd->outbuf, "vdagent-outbuf");
>

Needs a buffer_free(). Move it to object init/finalize ?

     *be_opened =3D true;
>  }
>
> @@ -702,6 +715,13 @@ static int vdagent_chr_write(Chardev *chr, const
> uint8_t *buf, int len)
>      return ret;
>  }
>
> +static void vdagent_chr_accept_input(Chardev *chr)
> +{
> +    VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);
> +
> +    vdagent_send_buf(vd);
> +}
> +
>  static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)
>  {
>      VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);
> @@ -748,6 +768,7 @@ static void vdagent_chr_class_init(ObjectClass *oc,
> void *data)
>      cc->open             =3D vdagent_chr_open;
>      cc->chr_write        =3D vdagent_chr_write;
>      cc->chr_set_fe_open  =3D vdagent_chr_set_fe_open;
> +    cc->chr_accept_input =3D vdagent_chr_accept_input;
>  }
>
>  static const TypeInfo vdagent_chr_type_info =3D {
> --
> 2.31.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000037de0f05c20a8308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 11, 2021 at 1:04 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; &=
gt; +/* ------------------------------------------------------------------ =
*/<br>
&gt; &gt; +/* send messages=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +<br>
&gt; &gt; +static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint=
32_t<br>
&gt; &gt; msgsize)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t *msgbuf =3D ptr;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t len, pos =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 while (pos &lt; msgsize) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D qemu_chr_be_can_write(CHARDE=
V(vd));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; msgsize - pos) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D msgsize - pos;=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(CHARDEV(vd), msgbu=
f + pos, len);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pos +=3D len;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; <br>
&gt; This looks like it could easily busy loop. Have you thought about fixi=
ng<br>
&gt; this?<br>
<br>
Incremental fix [ to be squashed ]<br>
<br></blockquote><div><br></div><div>thanks, a few comments below</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
take care,<br>
=C2=A0 Gerd<br>
<br>
diff --git a/ui/vdagent.c b/ui/vdagent.c<br>
index 64213aa25a06..efa98725fb22 100644<br>
--- a/ui/vdagent.c<br>
+++ b/ui/vdagent.c<br>
@@ -3,7 +3,9 @@<br>
=C2=A0#include &quot;include/qemu-common.h&quot;<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;hw/qdev-core.h&quot;<br>
+#include &quot;qemu/buffer.h&quot;<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
+#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/input.h&quot;<br>
@@ -16,6 +18,7 @@<br>
<br>
=C2=A0#define VDAGENT_MOUSE_DEFAULT true<br>
=C2=A0#define VDAGENT_CLIPBOARD_DEFAULT false<br>
+#define VDAGENT_BUFFER_LIMIT (1 * MiB)<br>
<br>
=C2=A0struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
@@ -32,6 +35,7 @@ struct VDAgentChardev {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t msgsize;<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *xbuf;<br>
=C2=A0 =C2=A0 =C2=A0uint32_t xoff, xsize;<br>
+=C2=A0 =C2=A0 Buffer outbuf;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* mouse */<br>
=C2=A0 =C2=A0 =C2=A0DeviceState mouse_dev;<br>
@@ -124,18 +128,20 @@ static const char *type_name[] =3D {<br>
=C2=A0/* ------------------------------------------------------------------=
 */<br>
=C2=A0/* send messages=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
<br>
-static void vdagent_send_buf(VDAgentChardev *vd, void *ptr, uint32_t msgsi=
ze)<br>
+static void vdagent_send_buf(VDAgentChardev *vd)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 uint8_t *msgbuf =3D ptr;<br>
-=C2=A0 =C2=A0 uint32_t len, pos =3D 0;<br>
+=C2=A0 =C2=A0 uint32_t len;<br>
<br>
-=C2=A0 =C2=A0 while (pos &lt; msgsize) {<br>
+=C2=A0 =C2=A0 while (!buffer_empty(&amp;vd-&gt;outbuf)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D qemu_chr_be_can_write(CHARDEV(vd)=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; msgsize - pos) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D msgsize - pos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(CHARDEV(vd), msgbuf + pos, l=
en);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pos +=3D len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; vd-&gt;outbuf.offset) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D vd-&gt;outbuf.offset;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_be_write(CHARDEV(vd), vd-&gt;outbuf.b=
uffer, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_advance(&amp;vd-&gt;outbuf, len);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
@@ -150,16 +156,22 @@ static void vdagent_send_msg(VDAgentChardev *vd, VDAg=
entMessage *msg)<br>
<br>
=C2=A0 =C2=A0 =C2=A0msg-&gt;protocol =3D VD_AGENT_PROTOCOL;<br>
<br>
+=C2=A0 =C2=A0 if (vd-&gt;outbuf.offset + msgsize &gt; VDAGENT_BUFFER_LIMIT=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>Silently dropping mess=
ages, there might be some bad consequences. At least I think we should erro=
r_report(). Eventually, the caller should be informed too.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0while (msgoff &lt; msgsize) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk.port =3D VDP_CLIENT_PORT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk.size =3D msgsize - msgoff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chunk.size &gt; 1024) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk.size =3D 1024;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_buf(vd, &amp;chunk, sizeof(chunk)=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vdagent_send_buf(vd, msgbuf + msgoff, chunk.si=
ze);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_reserve(&amp;vd-&gt;outbuf, sizeof(chun=
k) + chunk.size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_append(&amp;vd-&gt;outbuf, &amp;chunk, =
sizeof(chunk));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_append(&amp;vd-&gt;outbuf, msgbuf + msg=
off, chunk.size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msgoff +=3D chunk.size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 vdagent_send_buf(vd);<br>
=C2=A0}<br>
<br>
=C2=A0static void vdagent_send_caps(VDAgentChardev *vd)<br>
@@ -550,6 +562,7 @@ static void vdagent_chr_open(Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;vdagent_mouse_handler);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 buffer_init(&amp;vd-&gt;outbuf, &quot;vdagent-outbuf&quot;);=
<br></blockquote><div><br></div><div>Needs a buffer_free(). Move it to obje=
ct init/finalize ?<br></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0*be_opened =3D true;<br>
=C2=A0}<br>
<br>
@@ -702,6 +715,13 @@ static int vdagent_chr_write(Chardev *chr, const uint8=
_t *buf, int len)<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+static void vdagent_chr_accept_input(Chardev *chr)<br>
+{<br>
+=C2=A0 =C2=A0 VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);<br>
+<br>
+=C2=A0 =C2=A0 vdagent_send_buf(vd);<br>
+}<br>
+<br>
=C2=A0static void vdagent_chr_set_fe_open(struct Chardev *chr, int fe_open)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VDAgentChardev *vd =3D QEMU_VDAGENT_CHARDEV(chr);<br>
@@ -748,6 +768,7 @@ static void vdagent_chr_class_init(ObjectClass *oc, voi=
d *data)<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D vdagent_chr_open;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D vdagent=
_chr_write;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_set_fe_open=C2=A0 =3D vdagent_chr_set_fe_ope=
n;<br>
+=C2=A0 =C2=A0 cc-&gt;chr_accept_input =3D vdagent_chr_accept_input;<br>
=C2=A0}<br>
<br>
=C2=A0static const TypeInfo vdagent_chr_type_info =3D {<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000037de0f05c20a8308--

