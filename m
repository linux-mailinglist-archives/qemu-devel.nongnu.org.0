Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF91031C396
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 22:30:15 +0100 (CET)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBlRe-0005D6-8W
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 16:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBlQ3-0004Xp-Vs; Mon, 15 Feb 2021 16:28:36 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:33978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lBlQ1-0007Yk-KZ; Mon, 15 Feb 2021 16:28:35 -0500
Received: by mail-ej1-x631.google.com with SMTP id hs11so13585904ejc.1;
 Mon, 15 Feb 2021 13:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpqTHORryW2lD2kJnhsTDbHkDVnXJfU8VQv92tNoQ54=;
 b=ppB9qJu224DQCoBu1dJYmPKn35ht28jnS6Ty5d8yJSHoRhcpFQ2CUuqZ5NJ/GHpqdG
 zR+4+K0lr3j5fwEW6Zgly1dq7qzceJ5vZ3jhwV1txSRlsoLesQs0pcbUZ5vO0wS+C2W7
 bskyHwaoF7q6rJ+JQSRX1/jr1K/I5jABL6MqR00YN+aVzx/tOo/875aJyp3tR1RKdQK5
 YqVPB/MbT5WmkcQ5HZytie+pdkidiA0j1ATpZLRs15CQgwzuOdmyd1xx33ryQZUUdFEM
 kdneAqLUDW9LqNgu7/VBY2j8EEbYQ4IZKwNgxnlV4JaiHtN4IeFbxIvVc+d7g9t+Uehe
 v3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpqTHORryW2lD2kJnhsTDbHkDVnXJfU8VQv92tNoQ54=;
 b=jGLbxEN/F5al0NR4s+0ZmWdXXiqthx8Nd3mJdEufBcIjkMn36Dntw3V3olRhTjMNCK
 1Y1cHwZUrAAcPr8QFKcp7VXLZt/w/fFZ/nLyECsyqXVfU2gqijQ5tcr8dr+N6zH5NVN3
 OvVZB94pO+OyZ/FYlraI0Phr3/4ipL19/j42DfKmX3K7IOOdSRmvN5+RJS92/b3DLNzb
 B3F0H8u5pKZ29a9aZKxVK/T8jK0JWv3FW5L+aZGB89v2otLFvlJQsKAydaMipeVDoQI9
 Pr50hNLKDhiGURhGyBsaU0Vw7RJ+y0lg93JHzsxo1rX9ZgRuKUtYnJ5ImVBo6Gjk7oaW
 rxNQ==
X-Gm-Message-State: AOAM5302oqsuNAvE4TJmQLd7Uld01raZW0nCofFcf5kn1q7hEQaHQjQE
 ROP+9TAdmP8D1ZmuN1TQpW7E+9iFTU9LSsNKN64=
X-Google-Smtp-Source: ABdhPJzr+DeeLW+fEUEyLmkTacKdRo4Afveu9tn+SyV7soWynFj9o5z/c2Xb5vlMJ8lNraDCbxlArLC7cZgBkSCErQo=
X-Received: by 2002:a17:906:798:: with SMTP id
 l24mr17656756ejc.92.1613424511337; 
 Mon, 15 Feb 2021 13:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20210215090225.1046239-1-thuth@redhat.com>
In-Reply-To: <20210215090225.1046239-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Feb 2021 01:28:19 +0400
Message-ID: <CAJ+F1CKcHAR_Ue+Ca8z4Ekt-Dj1AWA+GRt9d4LDKEb6hSVYhrA@mail.gmail.com>
Subject: Re: [PATCH] net: Use id_generate() in the network subsystem, too
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000deca7905bb66aa25"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: qemu trival <qemu-trivial@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000deca7905bb66aa25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 1:03 PM Thomas Huth <thuth@redhat.com> wrote:

> We already got a global function called id_generate() to create unique
> IDs within QEMU. Let's use it in the network subsytem, too, instead of
> inventing our own ID scheme here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/qemu/id.h | 1 +
>  net/net.c         | 6 +++---
>  util/id.c         | 1 +
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/include/qemu/id.h b/include/qemu/id.h
> index b55c406e69..46b759b284 100644
> --- a/include/qemu/id.h
> +++ b/include/qemu/id.h
> @@ -5,6 +5,7 @@ typedef enum IdSubSystems {
>      ID_QDEV,
>      ID_BLOCK,
>      ID_CHR,
> +    ID_NET,
>      ID_MAX      /* last element, used as array size */
>  } IdSubSystems;
>
> diff --git a/net/net.c b/net/net.c
> index fb7b7dcc25..ca30df963d 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -43,6 +43,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/config-file.h"
>  #include "qemu/ctype.h"
> +#include "qemu/id.h"
>  #include "qemu/iov.h"
>  #include "qemu/qemu-print.h"
>  #include "qemu/main-loop.h"
> @@ -1111,8 +1112,7 @@ static int net_client_init(QemuOpts *opts, bool
> is_netdev, Error **errp)
>
>      /* Create an ID for -net if the user did not specify one */
>      if (!is_netdev && !qemu_opts_id(opts)) {
> -        static int idx;
> -        qemu_opts_set_id(opts, g_strdup_printf("__org.qemu.net%i",
> idx++));
> +        qemu_opts_set_id(opts, id_generate(ID_NET));
>      }
>
>      if (visit_type_Netdev(v, NULL, &object, errp)) {
> @@ -1467,7 +1467,7 @@ static int net_param_nic(void *dummy, QemuOpts
> *opts, Error **errp)
>      /* Create an ID if the user did not specify one */
>      nd_id =3D g_strdup(qemu_opts_id(opts));
>      if (!nd_id) {
> -        nd_id =3D g_strdup_printf("__org.qemu.nic%i", idx);
> +        nd_id =3D id_generate(ID_NET);
>          qemu_opts_set_id(opts, nd_id);
>      }
>
> diff --git a/util/id.c b/util/id.c
> index 5addb4460e..ded41c5025 100644
> --- a/util/id.c
> +++ b/util/id.c
> @@ -35,6 +35,7 @@ static const char *const id_subsys_str[ID_MAX] =3D {
>      [ID_QDEV]  =3D "qdev",
>      [ID_BLOCK] =3D "block",
>      [ID_CHR] =3D "chr",
> +    [ID_NET] =3D "net",
>  };
>
>  /*
> --
> 2.27.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000deca7905bb66aa25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 15, 2021 at 1:03 PM Thoma=
s Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">We already g=
ot a global function called id_generate() to create unique<br>
IDs within QEMU. Let&#39;s use it in the network subsytem, too, instead of<=
br>
inventing our own ID scheme here.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/qemu/id.h | 1 +<br>
=C2=A0net/net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A0util/id.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A03 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/include/qemu/id.h b/include/qemu/id.h<br>
index b55c406e69..46b759b284 100644<br>
--- a/include/qemu/id.h<br>
+++ b/include/qemu/id.h<br>
@@ -5,6 +5,7 @@ typedef enum IdSubSystems {<br>
=C2=A0 =C2=A0 =C2=A0ID_QDEV,<br>
=C2=A0 =C2=A0 =C2=A0ID_BLOCK,<br>
=C2=A0 =C2=A0 =C2=A0ID_CHR,<br>
+=C2=A0 =C2=A0 ID_NET,<br>
=C2=A0 =C2=A0 =C2=A0ID_MAX=C2=A0 =C2=A0 =C2=A0 /* last element, used as arr=
ay size */<br>
=C2=A0} IdSubSystems;<br>
<br>
diff --git a/net/net.c b/net/net.c<br>
index fb7b7dcc25..ca30df963d 100644<br>
--- a/net/net.c<br>
+++ b/net/net.c<br>
@@ -43,6 +43,7 @@<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
=C2=A0#include &quot;qemu/config-file.h&quot;<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
+#include &quot;qemu/id.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/qemu-print.h&quot;<br>
=C2=A0#include &quot;qemu/main-loop.h&quot;<br>
@@ -1111,8 +1112,7 @@ static int net_client_init(QemuOpts *opts, bool is_ne=
tdev, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Create an ID for -net if the user did not specify on=
e */<br>
=C2=A0 =C2=A0 =C2=A0if (!is_netdev &amp;&amp; !qemu_opts_id(opts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 static int idx;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_set_id(opts, g_strdup_printf(&quot;_=
_<a href=3D"http://org.qemu.net" rel=3D"noreferrer" target=3D"_blank">org.q=
emu.net</a>%i&quot;, idx++));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_set_id(opts, id_generate(ID_NET));<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (visit_type_Netdev(v, NULL, &amp;object, errp)) {<br=
>
@@ -1467,7 +1467,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts,=
 Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0/* Create an ID if the user did not specify one */<br>
=C2=A0 =C2=A0 =C2=A0nd_id =3D g_strdup(qemu_opts_id(opts));<br>
=C2=A0 =C2=A0 =C2=A0if (!nd_id) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 nd_id =3D g_strdup_printf(&quot;__org.qemu.nic=
%i&quot;, idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nd_id =3D id_generate(ID_NET);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_set_id(opts, nd_id);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/util/id.c b/util/id.c<br>
index 5addb4460e..ded41c5025 100644<br>
--- a/util/id.c<br>
+++ b/util/id.c<br>
@@ -35,6 +35,7 @@ static const char *const id_subsys_str[ID_MAX] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[ID_QDEV]=C2=A0 =3D &quot;qdev&quot;,<br>
=C2=A0 =C2=A0 =C2=A0[ID_BLOCK] =3D &quot;block&quot;,<br>
=C2=A0 =C2=A0 =C2=A0[ID_CHR] =3D &quot;chr&quot;,<br>
+=C2=A0 =C2=A0 [ID_NET] =3D &quot;net&quot;,<br>
=C2=A0};<br>
<br>
=C2=A0/*<br>
-- <br>
2.27.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000deca7905bb66aa25--

