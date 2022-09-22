Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F585E6C40
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:56:37 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obSJI-0005jC-8S
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSFw-0001W0-DZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:53:10 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1obSFu-000285-ED
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:53:08 -0400
Received: by mail-lj1-x235.google.com with SMTP id a10so12345200ljq.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 12:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ssyi/xZUxSH0lWcZWJwiKOutOPgLyCm5dN203B45ABM=;
 b=N0WUIpWvC+8lFPQhRWHMBYzTlvAMipqLnk6etpYMntj07Kf8dcQGvgCKvkNhK4LGuM
 osy8sdNioXElwPq405RO7AhKDkcjfvMf2yQoRwphEIbP6X6umDZDARfHaHdvsNpEy+gf
 jfI2FSwtVS0kfSy2Ek7i6wBDJgGch/+4Jck1Pzzz1To1Ni9jubtoAwQ/aTBO6oLS2XHG
 2gQE9kPx+wOhq9ACsWgcauaQZy4DHgIOj9mV9wbNYiN0DE6VXKGY/On1o5ixpv7p/zwJ
 b63P9vXs/+t1mrcqMdXlEQHjrpYJIY8EuqstBKit7YSFg5huJC3yKxDM8n0kdY//vgt1
 mZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ssyi/xZUxSH0lWcZWJwiKOutOPgLyCm5dN203B45ABM=;
 b=MqHaMfLRn0/Co4v3PLPd61R1vqbBryNchxOcFsWdeZSqYoL/iZzkaINDAAql3xZkGK
 tCBgUMuiKQl5CcDnzcnko08g1QznRDVqU8mT/nktIjh0zN6m6Oj1ajuLOvTK9eP8BwCN
 V3arq4P8mwv63xmkrimJKsrFLj6wxyQBSb0dKcWANdjW2kLBsM6rEHgeCu/1g03B++tf
 JwiFab1dvg6TBxjC1Un9NT3FXeigShiSRzWHjO25WKcCtzrcmn8uSjpIq3i4D2oNwO0P
 zeMizc8qr36CaQqPUxJkEPlOFJxjI6ymhweAe1cyXF5cSAZF8F0y70BK+EXmq33g/qKa
 wgPw==
X-Gm-Message-State: ACrzQf0JKCytA65sA5xh7XJi3VMbQB0w294TZSDU25XXIjJeZabXixxP
 vLe1KjuU/pCjex+9HNi2rNDac+fCkdQu0E5TB5g=
X-Google-Smtp-Source: AMsMyM7b84rjYfkaHjZ7I24IGg0styv/Yn4Emc8xB7FSS7JkRt1IdzVQXgdczDdegoMP2pfhNLirYk+Ai8r2Bz1IAUM=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr1664231ljn.94.1663876384361; Thu, 22
 Sep 2022 12:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-17-bmeng.cn@gmail.com>
In-Reply-To: <20220920103159.1865256-17-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 22 Sep 2022 21:52:52 +0200
Message-ID: <CAJ+F1C+gznpMkWK8++c1ZEzT9AeYAafy-7E1=paiOEVxNFtLXQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/39] tests/qtest: Use send/recv for socket
 communication
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d71e5b05e94968d2"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

--000000000000d71e5b05e94968d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2022 at 2:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>
> Socket communication in the libqtest and libqmp codes uses read()
> and write() which work on any file descriptor on *nix, and sockets
> in *nix are an example of a file descriptor.
>
> However sockets on Windows do not use *nix-style file descriptors,
> so read() and write() cannot be used on sockets on Windows.
> Switch over to use send() and recv() instead which work on both
> Windows and *nix.
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v2:
> - Introduce qemu_send_full() and use it
>
>  include/qemu/sockets.h |  2 ++
>  tests/qtest/libqmp.c   |  5 +++--
>  tests/qtest/libqtest.c |  4 ++--
>  util/osdep.c           | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 038faa157f..8ff7832eba 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -15,6 +15,8 @@ int inet_aton(const char *cp, struct in_addr *ia);
>  bool fd_is_socket(int fd);
>  int qemu_socket(int domain, int type, int protocol);
>  int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
> +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> +    G_GNUC_WARN_UNUSED_RESULT;
>  int socket_set_cork(int fd, int v);
>  int socket_set_nodelay(int fd);
>  void qemu_socket_set_block(int fd);
> diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
> index ade26c15f0..2b08382e5d 100644
> --- a/tests/qtest/libqmp.c
> +++ b/tests/qtest/libqmp.c
> @@ -23,6 +23,7 @@
>  #endif
>
>  #include "qemu/cutils.h"
> +#include "qemu/sockets.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/qjson.h"
> @@ -36,7 +37,7 @@ typedef struct {
>
>  static void socket_send(int fd, const char *buf, size_t size)
>  {
> -    size_t res =3D qemu_write_full(fd, buf, size);
> +    ssize_t res =3D qemu_send_full(fd, buf, size);
>
>      assert(res =3D=3D size);
>  }
> @@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)
>          ssize_t len;
>          char c;
>
> -        len =3D read(fd, &c, 1);
> +        len =3D recv(fd, &c, 1, 0);
>          if (len =3D=3D -1 && errno =3D=3D EINTR) {
>              continue;
>          }
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index a0f28ddf8e..a25a8b47d0 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -436,7 +436,7 @@ void qtest_quit(QTestState *s)
>
>  static void socket_send(int fd, const char *buf, size_t size)
>  {
> -    size_t res =3D qemu_write_full(fd, buf, size);
> +    ssize_t res =3D qemu_send_full(fd, buf, size);
>
>      assert(res =3D=3D size);
>  }
> @@ -468,7 +468,7 @@ static GString
> *qtest_client_socket_recv_line(QTestState *s)
>          ssize_t len;
>          char buffer[1024];
>
> -        len =3D read(s->fd, buffer, sizeof(buffer));
> +        len =3D recv(s->fd, buffer, sizeof(buffer), 0);
>          if (len =3D=3D -1 && errno =3D=3D EINTR) {
>              continue;
>          }
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..0342e754e1 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -502,6 +502,39 @@ int qemu_accept(int s, struct sockaddr *addr,
> socklen_t *addrlen)
>      return ret;
>  }
>
> +/*
> + * A variant of send(2) which handles partial send.
> + *
> + * Return the number of bytes transferred over the socket.
> + * Set errno if fewer than `count' bytes are sent.
> + *
> + * This function don't work with non-blocking socket's.
> + * Any of the possibilities with non-blocking socket's is bad:
> + *   - return a short write (then name is wrong)
> + *   - busy wait adding (errno =3D=3D EAGAIN) to the loop
> + */
> +ssize_t qemu_send_full(int s, const void *buf, size_t count)
> +{
> +    ssize_t ret =3D 0;
> +    ssize_t total =3D 0;
> +
> +    while (count) {
> +        ret =3D send(s, buf, count, 0);
> +        if (ret < 0) {
> +            if (errno =3D=3D EINTR) {
> +                continue;
> +            }
> +            break;
> +        }
> +
> +        count -=3D ret;
> +        buf +=3D ret;
> +        total +=3D ret;
> +    }
> +
> +    return total;
> +}
> +
>  void qemu_set_hw_version(const char *version)
>  {
>      hw_version =3D version;
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d71e5b05e94968d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 20, 2022 at 2:23 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuzho=
u Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.com" target=3D"_blank"=
>xuzhou.cheng@windriver.com</a>&gt;<br>
<br>
Socket communication in the libqtest and libqmp codes uses read()<br>
and write() which work on any file descriptor on *nix, and sockets<br>
in *nix are an example of a file descriptor.<br>
<br>
However sockets on Windows do not use *nix-style file descriptors,<br>
so read() and write() cannot be used on sockets on Windows.<br>
Switch over to use send() and recv() instead which work on both<br>
Windows and *nix.<br>
<br>
Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzhou.cheng@windriver.co=
m" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v2:<br>
- Introduce qemu_send_full() and use it<br>
<br>
=C2=A0include/qemu/sockets.h |=C2=A0 2 ++<br>
=C2=A0tests/qtest/libqmp.c=C2=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A0tests/qtest/libqtest.c |=C2=A0 4 ++--<br>
=C2=A0util/osdep.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 +++++++++++=
++++++++++++++++++++++<br>
=C2=A04 files changed, 40 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
index 038faa157f..8ff7832eba 100644<br>
--- a/include/qemu/sockets.h<br>
+++ b/include/qemu/sockets.h<br>
@@ -15,6 +15,8 @@ int inet_aton(const char *cp, struct in_addr *ia);<br>
=C2=A0bool fd_is_socket(int fd);<br>
=C2=A0int qemu_socket(int domain, int type, int protocol);<br>
=C2=A0int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);<br=
>
+ssize_t qemu_send_full(int s, const void *buf, size_t count)<br>
+=C2=A0 =C2=A0 G_GNUC_WARN_UNUSED_RESULT;<br>
=C2=A0int socket_set_cork(int fd, int v);<br>
=C2=A0int socket_set_nodelay(int fd);<br>
=C2=A0void qemu_socket_set_block(int fd);<br>
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c<br>
index ade26c15f0..2b08382e5d 100644<br>
--- a/tests/qtest/libqmp.c<br>
+++ b/tests/qtest/libqmp.c<br>
@@ -23,6 +23,7 @@<br>
=C2=A0#endif<br>
<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
+#include &quot;qemu/sockets.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/json-parser.h&quot;<br>
=C2=A0#include &quot;qapi/qmp/qjson.h&quot;<br>
@@ -36,7 +37,7 @@ typedef struct {<br>
<br>
=C2=A0static void socket_send(int fd, const char *buf, size_t size)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 size_t res =3D qemu_write_full(fd, buf, size);<br>
+=C2=A0 =C2=A0 ssize_t res =3D qemu_send_full(fd, buf, size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(res =3D=3D size);<br>
=C2=A0}<br>
@@ -69,7 +70,7 @@ QDict *qmp_fd_receive(int fd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char c;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D read(fd, &amp;c, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D recv(fd, &amp;c, 1, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=3D=
 EINTR) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
index a0f28ddf8e..a25a8b47d0 100644<br>
--- a/tests/qtest/libqtest.c<br>
+++ b/tests/qtest/libqtest.c<br>
@@ -436,7 +436,7 @@ void qtest_quit(QTestState *s)<br>
<br>
=C2=A0static void socket_send(int fd, const char *buf, size_t size)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 size_t res =3D qemu_write_full(fd, buf, size);<br>
+=C2=A0 =C2=A0 ssize_t res =3D qemu_send_full(fd, buf, size);<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(res =3D=3D size);<br>
=C2=A0}<br>
@@ -468,7 +468,7 @@ static GString *qtest_client_socket_recv_line(QTestStat=
e *s)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char buffer[1024];<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D read(s-&gt;fd, buffer, sizeof(buffer))=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D recv(s-&gt;fd, buffer, sizeof(buffer),=
 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len =3D=3D -1 &amp;&amp; errno =3D=3D=
 EINTR) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/util/osdep.c b/util/osdep.c<br>
index 60fcbbaebe..0342e754e1 100644<br>
--- a/util/osdep.c<br>
+++ b/util/osdep.c<br>
@@ -502,6 +502,39 @@ int qemu_accept(int s, struct sockaddr *addr, socklen_=
t *addrlen)<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * A variant of send(2) which handles partial send.<br>
+ *<br>
+ * Return the number of bytes transferred over the socket.<br>
+ * Set errno if fewer than `count&#39; bytes are sent.<br>
+ *<br>
+ * This function don&#39;t work with non-blocking socket&#39;s.<br>
+ * Any of the possibilities with non-blocking socket&#39;s is bad:<br>
+ *=C2=A0 =C2=A0- return a short write (then name is wrong)<br>
+ *=C2=A0 =C2=A0- busy wait adding (errno =3D=3D EAGAIN) to the loop<br>
+ */<br>
+ssize_t qemu_send_full(int s, const void *buf, size_t count)<br>
+{<br>
+=C2=A0 =C2=A0 ssize_t ret =3D 0;<br>
+=C2=A0 =C2=A0 ssize_t total =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 while (count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D send(s, buf, count, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno =3D=3D EINTR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 count -=3D ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf +=3D ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 total +=3D ret;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return total;<br>
+}<br>
+<br>
=C2=A0void qemu_set_hw_version(const char *version)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0hw_version =3D version;<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d71e5b05e94968d2--

