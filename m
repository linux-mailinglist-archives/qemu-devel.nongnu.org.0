Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4747343BD6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:34:18 +0100 (CET)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOG0v-0008Pq-EZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFzM-0007iX-Nx
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:32:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lOFzK-00066T-CH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 04:32:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id a7so19778906ejs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 01:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J3cMitsQoC100y4hjp1sbqRRmPwVOWc6b9M7ADK9He8=;
 b=pKhxQN0cPXRnskzaTmD8k0rsFBZaHdZEEvGrEiqvZ8vV0MV0A/SGUxezhQJNNUu/Hr
 ErRLyAEjgEAZOTpD54G3E8ta2vkv9oocska6SAZ4dat1fKCR1nA1TNa/qpTu225AWegU
 YUmLppRoWSeCo3QozwzWIpvVE4NrOyKjMu1IwaCQZYjTvqzd2T+dg9cBdVHn6dqk3zhC
 e6ekKTzSC/FU7E+6oJ5T3FB++fORrEUz0TBmPrQ4JPr77NAHZLnKRhfxmL5Yu1xPNuId
 PU7epeiqUJWuJRnXNt+7XOInMC/VvXkwECCcWltklph9IZr1Xh6YEfZzGKRWcgBtnCoK
 3fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J3cMitsQoC100y4hjp1sbqRRmPwVOWc6b9M7ADK9He8=;
 b=elQ1zv9PQDBbfL719fTK4FGfvhnRy+tLfJJWnGHiy/pK7mnNOciKeam0qFAw0s+3Hp
 Aweg5ISotmZZFoaiumB0zESTqvdpxvZrGyosrddJRnbVDGaCwjaA8GifzInCf2Raf/wW
 961skO2hLT+howGH2I8ZrwK6INsfr1c7fLaueapvUHGv9KnMOFKRIQXn9jkxX6x8apf2
 izc3Rx1pDPkgmmniGe75vNPUKq/zdcSpF8Mn6ONzFcp3ZBkZm4QV0y8sh/RuFT1B45dG
 7qgSUf2pHmg6ozYNfwB52KYnMhTm0f+39cHpwS9wCgTGwQpiGOIKxSGlarGC0n04OZXz
 XcWw==
X-Gm-Message-State: AOAM532MxU+L1Hw8AhPD2Q/J7bZjIf+BTvvO5ixXhJfyGUF5eiN1lbfl
 Y4PbJLHqTOPnAvZTohr5ENtxxngxxKYFau0gCag=
X-Google-Smtp-Source: ABdhPJyWS+X7+1mVaPuMkgHLKxfuDAMfcx6YwYgTO6flkwWQ8m2PbkXuKmrx2V1F0PuDbbE8/sJYwisdn09zOZzeFFQ=
X-Received: by 2002:a17:906:3643:: with SMTP id
 r3mr17735810ejb.527.1616401956789; 
 Mon, 22 Mar 2021 01:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616368879.git.lukasstraub2@web.de>
 <dcf21a36f4b85e959a0e71776ee34bbc09d26684.1616368879.git.lukasstraub2@web.de>
In-Reply-To: <dcf21a36f4b85e959a0e71776ee34bbc09d26684.1616368879.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 22 Mar 2021 12:32:23 +0400
Message-ID: <CAJ+F1C+TyvKb=1aP1_0mRNMWQ+6V2OGHmmODhQ-UfRq6_i6pSQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] chardev: Fix yank with the chardev-change case
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="00000000000072e25505be1be837"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Li Zhang <zhlcindy@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000072e25505be1be837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 22, 2021 at 3:32 AM Lukas Straub <lukasstraub2@web.de> wrote:

> When changing from chardev-socket (which supports yank) to
> chardev-socket again, it fails, because the new chardev attempts
> to register a new yank instance. This in turn fails, as there
> still is the yank instance from the current chardev. Also,
> the old chardev shouldn't unregister the yank instance when it
> is freed.
>
> To fix this, now the new chardev only registers a yank instance if
> the current chardev doesn't support yank and thus hasn't registered
> one already. Also, when the old chardev is freed, it now only
> unregisters the yank instance if the new chardev doesn't need it.
>
> s->registered_yank is always true here, as chardev-change only works
> on user-visible chardevs and those are guraranteed to register a
> yank instance as they are initialized via
> chardev_new()
>  qemu_char_open()
>   cc->open() (qmp_chardev_open_socket()).
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  chardev/char-socket.c  | 20 +++++++++++++++++---
>  chardev/char.c         | 32 +++++++++++++++++++++++++-------
>  include/chardev/char.h |  4 ++++
>  3 files changed, 46 insertions(+), 10 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index c8bced76b7..8186b6a205 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1119,7 +1119,13 @@ static void char_socket_finalize(Object *obj)
>      }
>      g_free(s->tls_authz);
>      if (s->registered_yank) {
> -        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
> +        /*
> +         * In the chardev-change special-case, we shouldn't unregister
> the yank
> +         * instance, as it still may be needed.
> +         */
> +        if (chr->yank_unregister_instance) {
> +            yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
> +        }
>      }
>
>      qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
> @@ -1421,8 +1427,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
>
> -    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)=
)
> {
> -        return;
> +    /*
> +     * In the chardev-change special-case, we shouldn't register a new
> yank
> +     * instance, as there already may be one.
> +     */
> +    if (chr->yank_register_instance) {
> +        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label),
> errp)) {
> +            return;
> +        }
>      }
>      s->registered_yank =3D true;
>
> @@ -1564,6 +1576,8 @@ static void char_socket_class_init(ObjectClass *oc,
> void *data)
>  {
>      ChardevClass *cc =3D CHARDEV_CLASS(oc);
>
> +    cc->supports_yank =3D true;
> +
>      cc->parse =3D qemu_chr_parse_socket;
>      cc->open =3D qmp_chardev_open_socket;
>      cc->chr_wait_connected =3D tcp_chr_wait_connected;
> diff --git a/chardev/char.c b/chardev/char.c
> index ad416c0714..245f8be201 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -39,6 +39,7 @@
>  #include "qemu/option.h"
>  #include "qemu/id.h"
>  #include "qemu/coroutine.h"
> +#include "qemu/yank.h"
>
>  #include "chardev-internal.h"
>
> @@ -266,6 +267,8 @@ static void char_init(Object *obj)
>  {
>      Chardev *chr =3D CHARDEV(obj);
>
> +    chr->yank_register_instance =3D true;
> +    chr->yank_unregister_instance =3D true;
>      chr->logfd =3D -1;
>      qemu_mutex_init(&chr->chr_write_lock);
>
> @@ -956,6 +959,7 @@ void qemu_chr_set_feature(Chardev *chr,
>  static Chardev *chardev_new(const char *id, const char *typename,
>                              ChardevBackend *backend,
>                              GMainContext *gcontext,
> +                            bool yank_register_instance,
>                              Error **errp)
>  {
>      Object *obj;
> @@ -968,6 +972,7 @@ static Chardev *chardev_new(const char *id, const cha=
r
> *typename,
>
>      obj =3D object_new(typename);
>      chr =3D CHARDEV(obj);
> +    chr->yank_register_instance =3D yank_register_instance;
>      chr->label =3D g_strdup(id);
>      chr->gcontext =3D gcontext;
>
> @@ -1001,7 +1006,7 @@ Chardev *qemu_chardev_new(const char *id, const cha=
r
> *typename,
>          id =3D genid;
>      }
>
> -    chr =3D chardev_new(id, typename, backend, gcontext, errp);
> +    chr =3D chardev_new(id, typename, backend, gcontext, true, errp);
>      if (!chr) {
>          return NULL;
>      }
> @@ -1029,7 +1034,7 @@ ChardevReturn *qmp_chardev_add(const char *id,
> ChardevBackend *backend,
>      }
>
>      chr =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> -                      backend, NULL, errp);
> +                      backend, NULL, true, errp);
>      if (!chr) {
>          return NULL;
>      }
> @@ -1054,7 +1059,7 @@ ChardevReturn *qmp_chardev_change(const char *id,
> ChardevBackend *backend,
>                                    Error **errp)
>  {
>      CharBackend *be;
> -    const ChardevClass *cc;
> +    const ChardevClass *cc, *cc_new;
>      Chardev *chr, *chr_new;
>      bool closed_sent =3D false;
>      ChardevReturn *ret;
> @@ -1088,13 +1093,20 @@ ChardevReturn *qmp_chardev_change(const char *id,
> ChardevBackend *backend,
>          return NULL;
>      }
>
> -    cc =3D char_get_class(ChardevBackendKind_str(backend->type), errp);
> -    if (!cc) {
> +    cc =3D CHARDEV_GET_CLASS(chr);
> +    cc_new =3D char_get_class(ChardevBackendKind_str(backend->type), err=
p);
> +    if (!cc_new) {
>          return NULL;
>      }
>
> -    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> -                          backend, chr->gcontext, errp);
> +    /*
> +     * Only register a yank instance if the current chardev hasn't
> registered
> +     * one already.
> +     */
> +    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_ne=
w)),
> +                          backend, chr->gcontext,
> +                          /* yank_register_instance =3D */
> !cc->supports_yank,
> +                          errp);
>      if (!chr_new) {
>          return NULL;
>      }
> @@ -1118,6 +1130,12 @@ ChardevReturn *qmp_chardev_change(const char *id,
> ChardevBackend *backend,
>          return NULL;
>      }
>
> +    /*
> +     * When the old chardev is freed, it should only unregister the yank
> +     * instance if the new chardev doesn't need it.
> +     */
> +    chr->yank_unregister_instance =3D !cc_new->supports_yank;
> +
>      object_unparent(OBJECT(chr));
>      object_property_add_child(get_chardevs_root(), chr_new->label,
>                                OBJECT(chr_new));
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index 4181a2784a..ff38bb3af0 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -65,6 +65,9 @@ struct Chardev {
>      char *filename;
>      int logfd;
>      int be_open;
> +    /* used to coordinate the chardev-change special-case: */
> +    bool yank_register_instance;
> +    bool yank_unregister_instance;
>      GSource *gsource;
>      GMainContext *gcontext;
>      DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
> @@ -251,6 +254,7 @@ struct ChardevClass {
>      ObjectClass parent_class;
>
>      bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
> +    bool supports_yank;
>      void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp)=
;
>
>      void (*open)(Chardev *chr, ChardevBackend *backend,
>


Not very pleased with the change, but I can't imagine anything
better/simpler atm. Maybe someone else. So
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000072e25505be1be837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 2021 at 3:32 AM Luk=
as Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Whe=
n changing from chardev-socket (which supports yank) to<br>
chardev-socket again, it fails, because the new chardev attempts<br>
to register a new yank instance. This in turn fails, as there<br>
still is the yank instance from the current chardev. Also,<br>
the old chardev shouldn&#39;t unregister the yank instance when it<br>
is freed.<br>
<br>
To fix this, now the new chardev only registers a yank instance if<br>
the current chardev doesn&#39;t support yank and thus hasn&#39;t registered=
<br>
one already. Also, when the old chardev is freed, it now only<br>
unregisters the yank instance if the new chardev doesn&#39;t need it.<br>
<br>
s-&gt;registered_yank is always true here, as chardev-change only works<br>
on user-visible chardevs and those are guraranteed to register a<br>
yank instance as they are initialized via<br>
chardev_new()<br>
=C2=A0qemu_char_open()<br>
=C2=A0 cc-&gt;open() (qmp_chardev_open_socket()).<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
---<br>
=C2=A0chardev/char-socket.c=C2=A0 | 20 +++++++++++++++++---<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 32 ++++++++++++++++=
+++++++++-------<br>
=C2=A0include/chardev/char.h |=C2=A0 4 ++++<br>
=C2=A03 files changed, 46 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index c8bced76b7..8186b6a205 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -1119,7 +1119,13 @@ static void char_socket_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(s-&gt;tls_authz);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_unregister_instance(CHARDEV_YANK_INSTANCE=
(chr-&gt;label));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* In the chardev-change special-case, we=
 shouldn&#39;t unregister the yank<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* instance, as it still may be needed.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chr-&gt;yank_unregister_instance) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_unregister_instance(CHARDEV=
_YANK_INSTANCE(chr-&gt;label));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_CLOSED);<br>
@@ -1421,8 +1427,14 @@ static void qmp_chardev_open_socket(Chardev *chr,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATU=
RE_FD_PASS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr-&gt;la=
bel), errp)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* In the chardev-change special-case, we shouldn&#39;t=
 register a new yank<br>
+=C2=A0 =C2=A0 =C2=A0* instance, as there already may be one.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (chr-&gt;yank_register_instance) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label), errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;registered_yank =3D true;<br>
<br>
@@ -1564,6 +1576,8 @@ static void char_socket_class_init(ObjectClass *oc, v=
oid *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ChardevClass *cc =3D CHARDEV_CLASS(oc);<br>
<br>
+=C2=A0 =C2=A0 cc-&gt;supports_yank =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;parse =3D qemu_chr_parse_socket;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;open =3D qmp_chardev_open_socket;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;chr_wait_connected =3D tcp_chr_wait_connected;<b=
r>
diff --git a/chardev/char.c b/chardev/char.c<br>
index ad416c0714..245f8be201 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -39,6 +39,7 @@<br>
=C2=A0#include &quot;qemu/option.h&quot;<br>
=C2=A0#include &quot;qemu/id.h&quot;<br>
=C2=A0#include &quot;qemu/coroutine.h&quot;<br>
+#include &quot;qemu/yank.h&quot;<br>
<br>
=C2=A0#include &quot;chardev-internal.h&quot;<br>
<br>
@@ -266,6 +267,8 @@ static void char_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr =3D CHARDEV(obj);<br>
<br>
+=C2=A0 =C2=A0 chr-&gt;yank_register_instance =3D true;<br>
+=C2=A0 =C2=A0 chr-&gt;yank_unregister_instance =3D true;<br>
=C2=A0 =C2=A0 =C2=A0chr-&gt;logfd =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0qemu_mutex_init(&amp;chr-&gt;chr_write_lock);<br>
<br>
@@ -956,6 +959,7 @@ void qemu_chr_set_feature(Chardev *chr,<br>
=C2=A0static Chardev *chardev_new(const char *id, const char *typename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GMainContext *gcontext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool yank_register_instance,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Object *obj;<br>
@@ -968,6 +972,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,<br>
<br>
=C2=A0 =C2=A0 =C2=A0obj =3D object_new(typename);<br>
=C2=A0 =C2=A0 =C2=A0chr =3D CHARDEV(obj);<br>
+=C2=A0 =C2=A0 chr-&gt;yank_register_instance =3D yank_register_instance;<b=
r>
=C2=A0 =C2=A0 =C2=A0chr-&gt;label =3D g_strdup(id);<br>
=C2=A0 =C2=A0 =C2=A0chr-&gt;gcontext =3D gcontext;<br>
<br>
@@ -1001,7 +1006,7 @@ Chardev *qemu_chardev_new(const char *id, const char =
*typename,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D genid;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 chr =3D chardev_new(id, typename, backend, gcontext, errp);<=
br>
+=C2=A0 =C2=A0 chr =3D chardev_new(id, typename, backend, gcontext, true, e=
rrp);<br>
=C2=A0 =C2=A0 =C2=A0if (!chr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1029,7 +1034,7 @@ ChardevReturn *qmp_chardev_add(const char *id, Charde=
vBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0chr =3D chardev_new(id, object_class_get_name(OBJECT_CL=
ASS(cc)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 backend, NULL, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 backend, NULL, true, errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!chr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1054,7 +1059,7 @@ ChardevReturn *qmp_chardev_change(const char *id, Cha=
rdevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CharBackend *be;<br>
-=C2=A0 =C2=A0 const ChardevClass *cc;<br>
+=C2=A0 =C2=A0 const ChardevClass *cc, *cc_new;<br>
=C2=A0 =C2=A0 =C2=A0Chardev *chr, *chr_new;<br>
=C2=A0 =C2=A0 =C2=A0bool closed_sent =3D false;<br>
=C2=A0 =C2=A0 =C2=A0ChardevReturn *ret;<br>
@@ -1088,13 +1093,20 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 cc =3D char_get_class(ChardevBackendKind_str(backend-&gt;typ=
e), errp);<br>
-=C2=A0 =C2=A0 if (!cc) {<br>
+=C2=A0 =C2=A0 cc =3D CHARDEV_GET_CLASS(chr);<br>
+=C2=A0 =C2=A0 cc_new =3D char_get_class(ChardevBackendKind_str(backend-&gt=
;type), errp);<br>
+=C2=A0 =C2=A0 if (!cc_new) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLA=
SS(cc)),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 backend, chr-&gt;gcontext, errp);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Only register a yank instance if the current chardev=
 hasn&#39;t registered<br>
+=C2=A0 =C2=A0 =C2=A0* one already.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLA=
SS(cc_new)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 backend, chr-&gt;gcontext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* yank_register_instance =3D */ !cc-&gt;supports_yank,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 errp);<br>
=C2=A0 =C2=A0 =C2=A0if (!chr_new) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1118,6 +1130,12 @@ ChardevReturn *qmp_chardev_change(const char *id, Ch=
ardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* When the old chardev is freed, it should only unregi=
ster the yank<br>
+=C2=A0 =C2=A0 =C2=A0* instance if the new chardev doesn&#39;t need it.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 chr-&gt;yank_unregister_instance =3D !cc_new-&gt;supports_ya=
nk;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0object_unparent(OBJECT(chr));<br>
=C2=A0 =C2=A0 =C2=A0object_property_add_child(get_chardevs_root(), chr_new-=
&gt;label,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJECT(chr_new));<br>
diff --git a/include/chardev/char.h b/include/chardev/char.h<br>
index 4181a2784a..ff38bb3af0 100644<br>
--- a/include/chardev/char.h<br>
+++ b/include/chardev/char.h<br>
@@ -65,6 +65,9 @@ struct Chardev {<br>
=C2=A0 =C2=A0 =C2=A0char *filename;<br>
=C2=A0 =C2=A0 =C2=A0int logfd;<br>
=C2=A0 =C2=A0 =C2=A0int be_open;<br>
+=C2=A0 =C2=A0 /* used to coordinate the chardev-change special-case: */<br=
>
+=C2=A0 =C2=A0 bool yank_register_instance;<br>
+=C2=A0 =C2=A0 bool yank_unregister_instance;<br>
=C2=A0 =C2=A0 =C2=A0GSource *gsource;<br>
=C2=A0 =C2=A0 =C2=A0GMainContext *gcontext;<br>
=C2=A0 =C2=A0 =C2=A0DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);<br>
@@ -251,6 +254,7 @@ struct ChardevClass {<br>
=C2=A0 =C2=A0 =C2=A0ObjectClass parent_class;<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool internal; /* TODO: eventually use TYPE_USER_CREATA=
BLE */<br>
+=C2=A0 =C2=A0 bool supports_yank;<br>
=C2=A0 =C2=A0 =C2=A0void (*parse)(QemuOpts *opts, ChardevBackend *backend, =
Error **errp);<br>
<br>
=C2=A0 =C2=A0 =C2=A0void (*open)(Chardev *chr, ChardevBackend *backend,<br =
clear=3D"all"></blockquote><div><br></div><div><br></div><div>Not very plea=
sed with the change, but I can&#39;t imagine anything better/simpler atm. M=
aybe someone else. So<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; </div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000072e25505be1be837--

