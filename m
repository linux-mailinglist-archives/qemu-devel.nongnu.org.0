Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B7349B00
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:32:14 +0100 (CET)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWeK-0003WZ-Fb
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWbb-0002gE-9o
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:29:23 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lPWbX-00026k-U1
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:29:23 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b7so5080851ejv.1
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 13:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YFA2F//jbmpp/WmtxBp/pRlzLf8lxFbkFg8VceMomYg=;
 b=sQR4YXSt/K0dzB95U+kNQPjnPHkY8z+4JDOOXeZjtA/IBKhzhrTXXrQ4vFIuWYJ9KK
 br0K3/4ekxzw3dYF7mqLx3gLU1i9IDikTKUvuF0pz2VtcpgJSNjLycUkKKgc5cTsMvyi
 wuqhJYnoWJqaFwZ5okZJ7RaWwqL8dBuvaORnm0YxhAjMN/5x3m75X8LfAVpsQCYA9wD8
 P8eys2TOf9fXcReJk3j+x/tG1RSAPPjnsGzef62/tRAoHPpox9u0pjfhRKfvNegBL0iR
 wpIgo3MtjOW7Lut+VG0+ZtOeWYrvb7foxcp6ed2bWZvj5cefaU2Fyi8NhIGARJOeAbe+
 0cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YFA2F//jbmpp/WmtxBp/pRlzLf8lxFbkFg8VceMomYg=;
 b=UWANO3UdiMrFTfysoMcI66lzpPEA3vzs30PSq9Hobtqq+OBDhxsjA7MhN83RBEqhS2
 odjS+t6OwDuTZ9h1RqsFl8semkXoIbA3G0yEsuOFjccaFiCM/IAkmoB/TytuKVjDFD1f
 OkJcG3CWxlfSoZRFjY4hPsxbXFyKfiIvSGUMGOU1nrnAAVmKEJQN8ud9sEEDdoPDWqcT
 vdAatynAQU2UEj8tfCXcQlDPqH+2YgQufgbXBo0e43EjQNVG5qhcZOmt3vDsYsiRfiZf
 VdmeHOQmZcTVyWY1zErUs20FEl0s3e8Hh79ZdbrBkG3mJBx3Fid/8/dounhWFPw5OTPG
 1NrA==
X-Gm-Message-State: AOAM531aaZTu+uZ7yyuD74z0NYiLb0lhriW5srq37jAjszgDfgW18QKs
 3vEJAGkMSUZtwP8Af3V07wQKENZvBPBtn+cK6wE=
X-Google-Smtp-Source: ABdhPJyG9xoxjYwHvFgCbPzGiyBJ10hb70wGyb5t1cS42gxKkUiYtlFFnhI7tJUaV0rQlMl7B0MVg/xi888Ujj5B1Gw=
X-Received: by 2002:a17:906:a3d1:: with SMTP id
 ca17mr11624936ejb.92.1616704158249; 
 Thu, 25 Mar 2021 13:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616521341.git.lukasstraub2@web.de>
 <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
In-Reply-To: <20ff143fc2db23e27cd41d38043e481376c9cec1.1616521341.git.lukasstraub2@web.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Mar 2021 00:29:05 +0400
Message-ID: <CAJ+F1CLgJx5LFGC3w-Fn23gegKXLDyHNOYUEVrAuPpW+haggCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] yank: Remove dependency on qiochannel
To: Lukas Straub <lukasstraub2@web.de>
Content-Type: multipart/alternative; boundary="0000000000000f371805be624582"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000f371805be624582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 9:54 PM Lukas Straub <lukasstraub2@web.de> wrote:

> Remove dependency on qiochannel by removing yank_generic_iochannel and
> letting migration and chardev use their own yank function for
> iochannel.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  MAINTAINERS                   |  1 +
>  chardev/char-socket.c         | 21 ++++++++++++++-------
>  include/qemu/yank.h           | 10 ----------
>  migration/channel.c           |  6 ++++--
>  migration/meson.build         |  1 +
>  migration/multifd.c           |  3 ++-
>  migration/qemu-file-channel.c |  3 ++-
>  migration/yank_functions.c    | 20 ++++++++++++++++++++
>  migration/yank_functions.h    | 17 +++++++++++++++++
>  stubs/yank.c                  |  6 ------
>  util/yank.c                   |  8 --------
>  11 files changed, 61 insertions(+), 35 deletions(-)
>  create mode 100644 migration/yank_functions.c
>  create mode 100644 migration/yank_functions.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9147e9a429..455775c4a3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2821,6 +2821,7 @@ M: Lukas Straub <lukasstraub2@web.de>
>  S: Odd fixes
>  F: util/yank.c
>  F: stubs/yank.c
> +F: migration/yank_functions*
>  F: include/qemu/yank.h
>  F: qapi/yank.json
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index f618bdec28..1d455ecca4 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -402,6 +402,13 @@ static void remove_hup_source(SocketChardev *s)
>      }
>  }
>
> +static void char_socket_yank_iochannel(void *opaque)
> +{
> +    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> +
> +    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +}
> +
>  static void tcp_chr_free_connection(Chardev *chr)
>  {
>      SocketChardev *s =3D SOCKET_CHARDEV(chr);
> @@ -424,7 +431,7 @@ static void tcp_chr_free_connection(Chardev *chr)
>          (s->state =3D=3D TCP_CHARDEV_STATE_CONNECTING
>          || s->state =3D=3D TCP_CHARDEV_STATE_CONNECTED)) {
>          yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                                 yank_generic_iochannel,
> +                                 char_socket_yank_iochannel,
>                                   QIO_CHANNEL(s->sioc));
>      }
>      object_unref(OBJECT(s->sioc));
> @@ -946,7 +953,7 @@ static int tcp_chr_add_client(Chardev *chr, int fd)
>      tcp_chr_set_client_ioc_name(chr, sioc);
>      if (s->registered_yank) {
>          yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                               yank_generic_iochannel,
> +                               char_socket_yank_iochannel,
>                                 QIO_CHANNEL(sioc));
>      }
>      ret =3D tcp_chr_new_client(chr, sioc);
> @@ -965,7 +972,7 @@ static void tcp_chr_accept(QIONetListener *listener,
>      tcp_chr_set_client_ioc_name(chr, cioc);
>      if (s->registered_yank) {
>          yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                               yank_generic_iochannel,
> +                               char_socket_yank_iochannel,
>                                 QIO_CHANNEL(cioc));
>      }
>      tcp_chr_new_client(chr, cioc);
> @@ -985,7 +992,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr,
> Error **errp)
>      }
>      if (s->registered_yank) {
>          yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                               yank_generic_iochannel,
> +                               char_socket_yank_iochannel,
>                                 QIO_CHANNEL(sioc));
>      }
>      tcp_chr_new_client(chr, sioc);
> @@ -1005,7 +1012,7 @@ static void tcp_chr_accept_server_sync(Chardev *chr=
)
>      tcp_chr_set_client_ioc_name(chr, sioc);
>      if (s->registered_yank) {
>          yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                               yank_generic_iochannel,
> +                               char_socket_yank_iochannel,
>                                 QIO_CHANNEL(sioc));
>      }
>      tcp_chr_new_client(chr, sioc);
> @@ -1138,7 +1145,7 @@ static void qemu_chr_socket_connected(QIOTask *task=
,
> void *opaque)
>          tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
>          if (s->registered_yank) {
>              yank_unregister_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                                     yank_generic_iochannel,
> +                                     char_socket_yank_iochannel,
>                                       QIO_CHANNEL(sioc));
>          }
>          check_report_connect_error(chr, err);
> @@ -1176,7 +1183,7 @@ static void tcp_chr_connect_client_async(Chardev
> *chr)
>      tcp_chr_set_client_ioc_name(chr, sioc);
>      if (s->registered_yank) {
>          yank_register_function(CHARDEV_YANK_INSTANCE(chr->label),
> -                               yank_generic_iochannel,
> +                               char_socket_yank_iochannel,
>                                 QIO_CHANNEL(sioc));
>      }
>      /*
> diff --git a/include/qemu/yank.h b/include/qemu/yank.h
> index 5b93c70cbf..5375a1f195 100644
> --- a/include/qemu/yank.h
> +++ b/include/qemu/yank.h
> @@ -73,16 +73,6 @@ void yank_unregister_function(const YankInstance
> *instance,
>                                YankFn *func,
>                                void *opaque);
>
> -/**
> - * yank_generic_iochannel: Generic yank function for iochannel
> - *
> - * This is a generic yank function which will call qio_channel_shutdown
> on the
> - * provided QIOChannel.
> - *
> - * @opaque: QIOChannel to shutdown
> - */
> -void yank_generic_iochannel(void *opaque);
> -
>  #define BLOCKDEV_YANK_INSTANCE(the_node_name) (&(YankInstance) { \
>          .type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, \
>          .u.block_node.node_name =3D (the_node_name) })
> diff --git a/migration/channel.c b/migration/channel.c
> index 35fe234e9c..c9ee902021 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -20,6 +20,7 @@
>  #include "io/channel-tls.h"
>  #include "io/channel-socket.h"
>  #include "qemu/yank.h"
> +#include "yank_functions.h"
>
>  /**
>   * @migration_channel_process_incoming - Create new incoming migration
> channel
> @@ -38,7 +39,8 @@ void migration_channel_process_incoming(QIOChannel *ioc=
)
>          ioc, object_get_typename(OBJECT(ioc)));
>
>      if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
> -        yank_register_function(MIGRATION_YANK_INSTANCE,
> yank_generic_iochannel,
> +        yank_register_function(MIGRATION_YANK_INSTANCE,
> +                               migration_yank_iochannel,
>                                 QIO_CHANNEL(ioc));
>      }
>
> @@ -76,7 +78,7 @@ void migration_channel_connect(MigrationState *s,
>      if (!error) {
>          if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)) {
>              yank_register_function(MIGRATION_YANK_INSTANCE,
> -                                   yank_generic_iochannel,
> +                                   migration_yank_iochannel,
>                                     QIO_CHANNEL(ioc));
>          }
>
> diff --git a/migration/meson.build b/migration/meson.build
> index 9645f44005..2cfa8eed72 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -6,6 +6,7 @@ migration_files =3D files(
>    'vmstate.c',
>    'qemu-file-channel.c',
>    'qemu-file.c',
> +  'yank_functions.c',
>  )
>  softmmu_ss.add(migration_files)
>
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 03527c564c..a6677c45c8 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -27,6 +27,7 @@
>
>  #include "qemu/yank.h"
>  #include "io/channel-socket.h"
> +#include "yank_functions.h"
>
>  /* Multiple fd's */
>
> @@ -989,7 +990,7 @@ int multifd_load_cleanup(Error **errp)
>          if (object_dynamic_cast(OBJECT(p->c), TYPE_QIO_CHANNEL_SOCKET)
>              && OBJECT(p->c)->ref =3D=3D 1) {
>              yank_unregister_function(MIGRATION_YANK_INSTANCE,
> -                                     yank_generic_iochannel,
> +                                     migration_yank_iochannel,
>                                       QIO_CHANNEL(p->c));
>          }
>
> diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.=
c
> index afc3a7f642..876d05a540 100644
> --- a/migration/qemu-file-channel.c
> +++ b/migration/qemu-file-channel.c
> @@ -28,6 +28,7 @@
>  #include "io/channel-socket.h"
>  #include "qemu/iov.h"
>  #include "qemu/yank.h"
> +#include "yank_functions.h"
>
>
>  static ssize_t channel_writev_buffer(void *opaque,
> @@ -108,7 +109,7 @@ static int channel_close(void *opaque, Error **errp)
>      if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_SOCKET)
>          && OBJECT(ioc)->ref =3D=3D 1) {
>          yank_unregister_function(MIGRATION_YANK_INSTANCE,
> -                                 yank_generic_iochannel,
> +                                 migration_yank_iochannel,
>                                   QIO_CHANNEL(ioc));
>      }
>      object_unref(OBJECT(ioc));
> diff --git a/migration/yank_functions.c b/migration/yank_functions.c
> new file mode 100644
> index 0000000000..96c90e17dc
> --- /dev/null
> +++ b/migration/yank_functions.c
> @@ -0,0 +1,20 @@
> +/*
> + * migration yank functions
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "io/channel.h"
> +#include "yank_functions.h"
> +
> +void migration_yank_iochannel(void *opaque)
> +{
> +    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> +
> +    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> +}
> diff --git a/migration/yank_functions.h b/migration/yank_functions.h
> new file mode 100644
> index 0000000000..055ea22523
> --- /dev/null
> +++ b/migration/yank_functions.h
> @@ -0,0 +1,17 @@
> +/*
> + * migration yank functions
> + *
> + * Copyright (c) Lukas Straub <lukasstraub2@web.de>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +/**
> + * migration_yank_iochannel: yank function for iochannel
> + *
> + * This yank function will call qio_channel_shutdown on the provided
> QIOChannel.
> + *
> + * @opaque: QIOChannel to shutdown
> + */
> +void migration_yank_iochannel(void *opaque);
> diff --git a/stubs/yank.c b/stubs/yank.c
> index 6090416065..11b24fc057 100644
> --- a/stubs/yank.c
> +++ b/stubs/yank.c
> @@ -21,9 +21,3 @@ void yank_unregister_function(const YankInstance
> *instance,
>                                void *opaque)
>  {
>  }
> -
> -void yank_generic_iochannel(void *opaque)
> -{
> -}
> -
> -
> diff --git a/util/yank.c b/util/yank.c
> index fc08f65209..abf47c346d 100644
> --- a/util/yank.c
> +++ b/util/yank.c
> @@ -15,7 +15,6 @@
>  #include "qapi/qapi-commands-yank.h"
>  #include "qapi/qapi-visit-yank.h"
>  #include "qapi/clone-visitor.h"
> -#include "io/channel.h"
>  #include "qemu/yank.h"
>
>  struct YankFuncAndParam {
> @@ -151,13 +150,6 @@ void yank_unregister_function(const YankInstance
> *instance,
>      abort();
>  }
>
> -void yank_generic_iochannel(void *opaque)
> -{
> -    QIOChannel *ioc =3D QIO_CHANNEL(opaque);
> -
> -    qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
> -}
> -
>  void qmp_yank(YankInstanceList *instances,
>                Error **errp)
>  {
> --
> 2.30.2
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000f371805be624582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 23, 2021 at 9:54 PM Lukas=
 Straub &lt;<a href=3D"mailto:lukasstraub2@web.de">lukasstraub2@web.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Remov=
e dependency on qiochannel by removing yank_generic_iochannel and<br>
letting migration and chardev use their own yank function for<br>
iochannel.<br>
<br>
Signed-off-by: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" targ=
et=3D"_blank">lukasstraub2@web.de</a>&gt;<br></blockquote><div><br></div><d=
iv>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0chardev/char-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 +++++++++=
+++++-------<br>
=C2=A0include/qemu/yank.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 ----=
------<br>
=C2=A0migration/channel.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6=
 ++++--<br>
=C2=A0migration/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br=
>
=C2=A0migration/multifd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3=
 ++-<br>
=C2=A0migration/qemu-file-channel.c |=C2=A0 3 ++-<br>
=C2=A0migration/yank_functions.c=C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A0migration/yank_functions.h=C2=A0 =C2=A0 | 17 +++++++++++++++++<br>
=C2=A0stubs/yank.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 ------<br>
=C2=A0util/yank.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 --------<br>
=C2=A011 files changed, 61 insertions(+), 35 deletions(-)<br>
=C2=A0create mode 100644 migration/yank_functions.c<br>
=C2=A0create mode 100644 migration/yank_functions.h<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 9147e9a429..455775c4a3 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -2821,6 +2821,7 @@ M: Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@we=
b.de" target=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
=C2=A0S: Odd fixes<br>
=C2=A0F: util/yank.c<br>
=C2=A0F: stubs/yank.c<br>
+F: migration/yank_functions*<br>
=C2=A0F: include/qemu/yank.h<br>
=C2=A0F: qapi/yank.json<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index f618bdec28..1d455ecca4 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -402,6 +402,13 @@ static void remove_hup_source(SocketChardev *s)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static void char_socket_yank_iochannel(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 QIOChannel *ioc =3D QIO_CHANNEL(opaque);<br>
+<br>
+=C2=A0 =C2=A0 qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);<=
br>
+}<br>
+<br>
=C2=A0static void tcp_chr_free_connection(Chardev *chr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
@@ -424,7 +431,7 @@ static void tcp_chr_free_connection(Chardev *chr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(s-&gt;state =3D=3D TCP_CHARDEV_STATE_CON=
NECTING<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| s-&gt;state =3D=3D TCP_CHARDEV_STATE_C=
ONNECTED)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_unregister_function(CHARDEV_YANK_INS=
TANCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(s-&gt;sioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(s-&gt;sioc));<br>
@@ -946,7 +953,7 @@ static int tcp_chr_add_client(Chardev *chr, int fd)<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0ret =3D tcp_chr_new_client(chr, sioc);<br>
@@ -965,7 +972,7 @@ static void tcp_chr_accept(QIONetListener *listener,<br=
>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, cioc);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(cioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, cioc);<br>
@@ -985,7 +992,7 @@ static int tcp_chr_connect_client_sync(Chardev *chr, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, sioc);<br>
@@ -1005,7 +1012,7 @@ static void tcp_chr_accept_server_sync(Chardev *chr)<=
br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_new_client(chr, sioc);<br>
@@ -1138,7 +1145,7 @@ static void qemu_chr_socket_connected(QIOTask *task, =
void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_change_state(s, TCP_CHARDEV_STATE=
_DISCONNECTED);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_unregister_function(CH=
ARDEV_YANK_INSTANCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_ioc=
hannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank=
_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(sio=
c));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_report_connect_error(chr, err);<br>
@@ -1176,7 +1183,7 @@ static void tcp_chr_connect_client_async(Chardev *chr=
)<br>
=C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, sioc);<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;registered_yank) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(CHARDEV_YANK_INSTA=
NCE(chr-&gt;label),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char_socket_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(sioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/include/qemu/yank.h b/include/qemu/yank.h<br>
index 5b93c70cbf..5375a1f195 100644<br>
--- a/include/qemu/yank.h<br>
+++ b/include/qemu/yank.h<br>
@@ -73,16 +73,6 @@ void yank_unregister_function(const YankInstance *instan=
ce,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0YankFn *func,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque);<br>
<br>
-/**<br>
- * yank_generic_iochannel: Generic yank function for iochannel<br>
- *<br>
- * This is a generic yank function which will call qio_channel_shutdown on=
 the<br>
- * provided QIOChannel.<br>
- *<br>
- * @opaque: QIOChannel to shutdown<br>
- */<br>
-void yank_generic_iochannel(void *opaque);<br>
-<br>
=C2=A0#define BLOCKDEV_YANK_INSTANCE(the_node_name) (&amp;(YankInstance) { =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D YANK_INSTANCE_TYPE_BLOCK_NODE, =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.u.block_node.node_name =3D (the_node_nam=
e) })<br>
diff --git a/migration/channel.c b/migration/channel.c<br>
index 35fe234e9c..c9ee902021 100644<br>
--- a/migration/channel.c<br>
+++ b/migration/channel.c<br>
@@ -20,6 +20,7 @@<br>
=C2=A0#include &quot;io/channel-tls.h&quot;<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
+#include &quot;yank_functions.h&quot;<br>
<br>
=C2=A0/**<br>
=C2=A0 * @migration_channel_process_incoming - Create new incoming migratio=
n channel<br>
@@ -38,7 +39,8 @@ void migration_channel_process_incoming(QIOChannel *ioc)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioc, object_get_typename(OBJECT(ioc)));<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_S=
OCKET)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register_function(MIGRATION_YANK_INSTANCE=
, yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 yank_register_function(MIGRATION_YANK_INSTANCE=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(ioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
@@ -76,7 +78,7 @@ void migration_channel_connect(MigrationState *s,<br>
=C2=A0 =C2=A0 =C2=A0if (!error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (object_dynamic_cast(OBJECT(ioc), TYPE=
_QIO_CHANNEL_SOCKET)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_register_function(MIGR=
ATION_YANK_INSTANCE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_yank_iochanne=
l,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(ioc));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/migration/meson.build b/migration/meson.build<br>
index 9645f44005..2cfa8eed72 100644<br>
--- a/migration/meson.build<br>
+++ b/migration/meson.build<br>
@@ -6,6 +6,7 @@ migration_files =3D files(<br>
=C2=A0 =C2=A0&#39;vmstate.c&#39;,<br>
=C2=A0 =C2=A0&#39;qemu-file-channel.c&#39;,<br>
=C2=A0 =C2=A0&#39;qemu-file.c&#39;,<br>
+=C2=A0 &#39;yank_functions.c&#39;,<br>
=C2=A0)<br>
=C2=A0softmmu_ss.add(migration_files)<br>
<br>
diff --git a/migration/multifd.c b/migration/multifd.c<br>
index 03527c564c..a6677c45c8 100644<br>
--- a/migration/multifd.c<br>
+++ b/migration/multifd.c<br>
@@ -27,6 +27,7 @@<br>
<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
+#include &quot;yank_functions.h&quot;<br>
<br>
=C2=A0/* Multiple fd&#39;s */<br>
<br>
@@ -989,7 +990,7 @@ int multifd_load_cleanup(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (object_dynamic_cast(OBJECT(p-&gt;c), =
TYPE_QIO_CHANNEL_SOCKET)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; OBJECT(p-&gt;c)-=
&gt;ref =3D=3D 1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_unregister_function(MI=
GRATION_YANK_INSTANCE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_ioc=
hannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_yank_i=
ochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(p-&=
gt;c));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c<=
br>
index afc3a7f642..876d05a540 100644<br>
--- a/migration/qemu-file-channel.c<br>
+++ b/migration/qemu-file-channel.c<br>
@@ -28,6 +28,7 @@<br>
=C2=A0#include &quot;io/channel-socket.h&quot;<br>
=C2=A0#include &quot;qemu/iov.h&quot;<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
+#include &quot;yank_functions.h&quot;<br>
<br>
<br>
=C2=A0static ssize_t channel_writev_buffer(void *opaque,<br>
@@ -108,7 +109,7 @@ static int channel_close(void *opaque, Error **errp)<br=
>
=C2=A0 =C2=A0 =C2=A0if (object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_S=
OCKET)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; OBJECT(ioc)-&gt;ref =3D=3D 1) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_unregister_function(MIGRATION_YANK_I=
NSTANCE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yank_generic_iochannel,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0migration_yank_iochannel,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QIO_CHANNEL(ioc));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0object_unref(OBJECT(ioc));<br>
diff --git a/migration/yank_functions.c b/migration/yank_functions.c<br>
new file mode 100644<br>
index 0000000000..96c90e17dc<br>
--- /dev/null<br>
+++ b/migration/yank_functions.c<br>
@@ -0,0 +1,20 @@<br>
+/*<br>
+ * migration yank functions<br>
+ *<br>
+ * Copyright (c) Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" t=
arget=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;io/channel.h&quot;<br>
+#include &quot;yank_functions.h&quot;<br>
+<br>
+void migration_yank_iochannel(void *opaque)<br>
+{<br>
+=C2=A0 =C2=A0 QIOChannel *ioc =3D QIO_CHANNEL(opaque);<br>
+<br>
+=C2=A0 =C2=A0 qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);<=
br>
+}<br>
diff --git a/migration/yank_functions.h b/migration/yank_functions.h<br>
new file mode 100644<br>
index 0000000000..055ea22523<br>
--- /dev/null<br>
+++ b/migration/yank_functions.h<br>
@@ -0,0 +1,17 @@<br>
+/*<br>
+ * migration yank functions<br>
+ *<br>
+ * Copyright (c) Lukas Straub &lt;<a href=3D"mailto:lukasstraub2@web.de" t=
arget=3D"_blank">lukasstraub2@web.de</a>&gt;<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+/**<br>
+ * migration_yank_iochannel: yank function for iochannel<br>
+ *<br>
+ * This yank function will call qio_channel_shutdown on the provided QIOCh=
annel.<br>
+ *<br>
+ * @opaque: QIOChannel to shutdown<br>
+ */<br>
+void migration_yank_iochannel(void *opaque);<br>
diff --git a/stubs/yank.c b/stubs/yank.c<br>
index 6090416065..11b24fc057 100644<br>
--- a/stubs/yank.c<br>
+++ b/stubs/yank.c<br>
@@ -21,9 +21,3 @@ void yank_unregister_function(const YankInstance *instanc=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *opaque)<br>
=C2=A0{<br>
=C2=A0}<br>
-<br>
-void yank_generic_iochannel(void *opaque)<br>
-{<br>
-}<br>
-<br>
-<br>
diff --git a/util/yank.c b/util/yank.c<br>
index fc08f65209..abf47c346d 100644<br>
--- a/util/yank.c<br>
+++ b/util/yank.c<br>
@@ -15,7 +15,6 @@<br>
=C2=A0#include &quot;qapi/qapi-commands-yank.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-visit-yank.h&quot;<br>
=C2=A0#include &quot;qapi/clone-visitor.h&quot;<br>
-#include &quot;io/channel.h&quot;<br>
=C2=A0#include &quot;qemu/yank.h&quot;<br>
<br>
=C2=A0struct YankFuncAndParam {<br>
@@ -151,13 +150,6 @@ void yank_unregister_function(const YankInstance *inst=
ance,<br>
=C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0}<br>
<br>
-void yank_generic_iochannel(void *opaque)<br>
-{<br>
-=C2=A0 =C2=A0 QIOChannel *ioc =3D QIO_CHANNEL(opaque);<br>
-<br>
-=C2=A0 =C2=A0 qio_channel_shutdown(ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);<=
br>
-}<br>
-<br>
=C2=A0void qmp_yank(YankInstanceList *instances,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
=C2=A0{<br>
--<br>
2.30.2<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000f371805be624582--

