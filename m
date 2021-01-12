Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C130D2F3307
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:36:34 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKmf-0000pm-Qx
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzKgB-0005qZ-Fd; Tue, 12 Jan 2021 09:29:51 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kzKg9-0004Gj-6o; Tue, 12 Jan 2021 09:29:51 -0500
Received: by mail-ej1-x630.google.com with SMTP id f4so2708232ejx.7;
 Tue, 12 Jan 2021 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRfSDA+8j9d7JeurU7Zc4wEmhFHdsWsPum3PGn0wSSA=;
 b=JLLya2tuQeShbx8L3USzQkF9FSc6aoYKgBgWbB1AncA5oTohaX/6ikZRODfo511ug0
 156jQZG69tn9ndap9344IoD5X3L44B9j2nbrhJcQwwpbjOawt/L1Uk8gkV6yPZaiyc7n
 Id8IAcscV1dTdFE6VFy9n7DK1NNI0ySkcj08thh6QT1sHYPAV3vBkd40DRbOdB9fd6y7
 hJTZpA829KwjbX9iWO//+vU8nPqRVNIFsmWwzhnMiu4irHYBNoGloFb/GIY7d4eaLuaK
 ten/p7c8DNOvpUxO3NsMH6Lopcf3C2I2ZyBYIoIeFrIH/qR2j0hPHCHqPZDFyIU2BKdZ
 mlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRfSDA+8j9d7JeurU7Zc4wEmhFHdsWsPum3PGn0wSSA=;
 b=tYBAG3i2BQyqTqZz23GeO9trL/356FBIoZRreMazD4eh5aSjACKQXEJiwDWpOifW0F
 OubXL7xp1DbmdEeqgUY68eNbVSHXkE9W0syE5GTspXsajm2+Hc0esla+zw+uwBc+sIGQ
 8soG0nB/alj2okMP9hL7NqDKmzIh+VtdrtLEq8jv8/q1do3EGjBk9DdQrKP+SS7NAi/+
 kgEhMpgc9nRb0KQ2kFJ/jzOIgT+NU5HZjsUkOYTiEyPFlnL7ssFYoCnjZtMmE7CAn6qe
 /oqSnDgBw1Z5onq4nMo/ShCRnscS7TtT3svMCElOdTXyzIEWpJ3RzjDuBFBJ/WCu9sCZ
 bmVA==
X-Gm-Message-State: AOAM531BTCby6xCadsL3bcQgYlVERX5U1/1QKS8xgcwfYsADau85IWHS
 sAQbpIJNnirf9hJ4rQbY2AnQxosW1Xyj4UwjiHQ=
X-Google-Smtp-Source: ABdhPJyOvUmSlaurawMWhAXJjTTP8t666BHV/eRetwxmVuTIbm18+5S5jd4auanhN5CISD6zpnelJa3Hn0PiTD53sD4=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr3459536ejj.105.1610461787258; 
 Tue, 12 Jan 2021 06:29:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609167865.git.lukasstraub2@web.de>
 <1f4eeed1d066c6cbb8d05ffa9585f6e87b34aac6.1609167865.git.lukasstraub2@web.de>
In-Reply-To: <1f4eeed1d066c6cbb8d05ffa9585f6e87b34aac6.1609167865.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 12 Jan 2021 18:29:35 +0400
Message-ID: <CAJ+F1CKMzAYaRD9G8RFkhyOHTjdSrVXns3bhSzvrZK2v8a0Ndw@mail.gmail.com>
Subject: Re: [PATCH v14 3/7] chardev/char-socket.c: Add yank feature
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="000000000000c1030705b8b4dac3"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqVw=?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c1030705b8b4dac3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 7:08 PM Lukas Straub <lukasstraub2@web.de> wrote:

> Register a yank function to shutdown the socket on yank.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
>

Acked-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char-socket.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 213a4c8dd0..8a707d766c 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -34,6 +34,7 @@
>  #include "qapi/error.h"
>  #include "qapi/clone-visitor.h"
>  #include "qapi/qapi-visit-sockets.h"
> +#include "qemu/yank.h"
>
>  #include "chardev/char-io.h"
>  #include "qom/object.h"
> @@ -70,6 +71,7 @@ struct SocketChardev {
>      size_t read_msgfds_num;
>      int *write_msgfds;
>      size_t write_msgfds_num;
> +    bool registered_yank;
>
>      SocketAddress *addr;
>      bool is_listen;
> @@ -415,6 +417,12 @@ static void tcp_chr_free_connection(Chardev *chr)
>
>      tcp_set_msgfds(chr, NULL, 0);
>      remove_fd_in_watch(chr);
> +    if (s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING
> +        || s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED) {
> +        yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                                 yank_generic_iochannel,
> +                                 QIO_CHANNEL(s->sioc));
> +    }
>      object_unref(OBJECT(s->sioc));
>      s->sioc =3D NULL;
>      object_unref(OBJECT(s->ioc));
> @@ -932,6 +940,9 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
>      }
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      tcp_chr_set_client_ioc_name(chr, sioc);
> +    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                           yank_generic_iochannel,
> +                           QIO_CHANNEL(sioc));
>      ret =3D tcp_chr_new_client(chr, sioc);
>      object_unref(OBJECT(sioc));
>      return ret;
> @@ -946,6 +957,9 @@ static void tcp_chr_accept(QIONetListener *listener,
>
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      tcp_chr_set_client_ioc_name(chr, cioc);
> +    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                           yank_generic_iochannel,
> +                           QIO_CHANNEL(cioc));
>      tcp_chr_new_client(chr, cioc);
>  }
>
> @@ -961,6 +975,9 @@ static int tcp_chr_connect_client_sync(Chardev *chr,
> Error **errp)
>          object_unref(OBJECT(sioc));
>          return -1;
>      }
> +    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                           yank_generic_iochannel,
> +                           QIO_CHANNEL(sioc));
>      tcp_chr_new_client(chr, sioc);
>      object_unref(OBJECT(sioc));
>      return 0;
> @@ -976,6 +993,9 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      sioc =3D qio_net_listener_wait_client(s->listener);
>      tcp_chr_set_client_ioc_name(chr, sioc);
> +    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                           yank_generic_iochannel,
> +                           QIO_CHANNEL(sioc));
>      tcp_chr_new_client(chr, sioc);
>      object_unref(OBJECT(sioc));
>  }
> @@ -1086,6 +1106,9 @@ static void char_socket_finalize(Object *obj)
>          object_unref(OBJECT(s->tls_creds));
>      }
>      g_free(s->tls_authz);
> +    if (s->registered_yank) {
> +        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
> +    }
>
>      qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
>  }
> @@ -1101,6 +1124,9 @@ static void qemu_chr_socket_connected(QIOTask *task=
,
> void *opaque)
>
>      if (qio_task_propagate_error(task, &err)) {
>          tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
> +        yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                                 yank_generic_iochannel,
> +                                 QIO_CHANNEL(sioc));
>          check_report_connect_error(chr, err);
>          goto cleanup;
>      }
> @@ -1134,6 +1160,9 @@ static void tcp_chr_connect_client_async(Chardev
> *chr)
>      tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
>      sioc =3D qio_channel_socket_new();
>      tcp_chr_set_client_ioc_name(chr, sioc);
> +    yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> +                           yank_generic_iochannel,
> +                           QIO_CHANNEL(sioc));
>      /*
>       * Normally code would use the qio_channel_socket_connect_async
>       * method which uses a QIOTask + qio_task_set_error internally
> @@ -1376,6 +1405,11 @@ static void qmp_chardev_open_socket(Chardev *chr,
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
>
> +    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)=
)
> {
> +        return;
> +    }
> +    s->registered_yank =3D true;
> +
>      /* be isn't opened until we get a connection */
>      *be_opened =3D false;
>
> --
> 2.29.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000c1030705b8b4dac3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 28, 2020 at 7:08 PM Lukas=
 Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Regis=
ter a yank function to shutdown the socket on yank.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
Acked-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=
=3D"_blank">stefanha@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Acked-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div> =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-socket.c | 34 ++++++++++++++++++++++++++++++++++<br>
=C2=A01 file changed, 34 insertions(+)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 213a4c8dd0..8a707d766c 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -34,6 +34,7 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/clone-visitor.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-sockets.h&quot;<br>
+#include &quot;qemu/yank.h&quot;<br>
<br>
=C2=A0#include &quot;chardev/char-io.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
@@ -70,6 +71,7 @@ struct SocketChardev {<br>
=C2=A0 =C2=A0 =C2=A0size_t read_msgfds_num;<br>
=C2=A0 =C2=A0 =C2=A0int *write_msgfds;<br>
=C2=A0 =C2=A0 =C2=A0size_t write_msgfds_num;<br>
+=C2=A0 =C2=A0 bool registered_yank;<br>
<br>
=C2=A0 =C2=A0 =C2=A0SocketAddress *addr;<br>
=C2=A0 =C2=A0 =C2=A0bool is_listen;<br>
@@ -415,6 +417,12 @@ static void tcp_chr_free_connection(Chardev *chr)<br>
<br>
=C2=A0 =C2=A0 =C2=A0tcp_set_msgfds(chr, NULL, 0);<br>
=C2=A0 =C2=A0 =C2=A0remove_fd_in_watch(chr);<br>
+=C2=A0 =C2=A0 if (s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNECTING<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 || s-&gt;state =3D=3D TCP_CHARDEV_STATE_CONNEC=
TED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_unregister_function(CHARDEV_YANK_INSTANCE=
(chr-&gt;label),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(s-&gt;sioc));<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;sioc));<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;sioc =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;ioc));<br>
@@ -932,6 +940,9 @@ static int tcp_chr_add_client(Chardev *chr, int fd)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<=
br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
+=C2=A0 =C2=A0 yank_register_function(CHARDEV_YANK_INSTANCE(chr-&gt;label),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0ret =3D tcp_chr_new_client(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
@@ -946,6 +957,9 @@ static void tcp_chr_accept(QIONetListener *listener,<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<=
br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, cioc);<br>
+=C2=A0 =C2=A0 yank_register_function(CHARDEV_YANK_INSTANCE(chr-&gt;label),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(cioc));<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, cioc);<br>
=C2=A0}<br>
<br>
@@ -961,6 +975,9 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 yank_register_function(CHARDEV_YANK_INSTANCE(chr-&gt;label),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
@@ -976,6 +993,9 @@ static void tcp_chr_accept_server_sync(Chardev *chr)<br=
>
=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<=
br>
=C2=A0 =C2=A0 =C2=A0sioc =3D qio_net_listener_wait_client(s-&gt;listener);<=
br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
+=C2=A0 =C2=A0 yank_register_function(CHARDEV_YANK_INSTANCE(chr-&gt;label),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(sioc));<br>
=C2=A0}<br>
@@ -1086,6 +1106,9 @@ static void char_socket_finalize(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;tls_creds));<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0g_free(s-&gt;tls_authz);<br>
+=C2=A0 =C2=A0 if (s-&gt;registered_yank) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_unregister_instance(CHARDEV_YANK_INSTANCE=
(chr-&gt;label));<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_be_event(chr, CHR_EVENT_CLOSED);<br>
=C2=A0}<br>
@@ -1101,6 +1124,9 @@ static void qemu_chr_socket_connected(QIOTask *task, =
void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (qio_task_propagate_error(task, &amp;err)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE=
_DISCONNECTED);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_unregister_function(CHARDEV_YANK_INSTANCE=
(chr-&gt;label),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_report_connect_error(chr, err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -1134,6 +1160,9 @@ static void tcp_chr_connect_client_async(Chardev *chr=
)<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);<=
br>
=C2=A0 =C2=A0 =C2=A0sioc =3D qio_channel_socket_new();<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
+=C2=A0 =C2=A0 yank_register_function(CHARDEV_YANK_INSTANCE(chr-&gt;label),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Normally code would use the qio_channel_socket_conne=
ct_async<br>
=C2=A0 =C2=A0 =C2=A0 * method which uses a QIOTask + qio_task_set_error int=
ernally<br>
@@ -1376,6 +1405,11 @@ static void qmp_chardev_open_socket(Chardev *chr,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATU=
RE_FD_PASS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr-&gt;la=
bel), errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 s-&gt;registered_yank =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0/* be isn&#39;t opened until we get a connection */<br>
=C2=A0 =C2=A0 =C2=A0*be_opened =3D false;<br>
<br>
--<br>
2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000c1030705b8b4dac3--

