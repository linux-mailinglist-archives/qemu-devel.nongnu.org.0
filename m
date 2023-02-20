Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47769C9DB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4LB-0004Vv-TQ; Mon, 20 Feb 2023 06:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pU4L9-0004VZ-8q; Mon, 20 Feb 2023 06:28:15 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pU4L6-0001AV-Tk; Mon, 20 Feb 2023 06:28:14 -0500
Received: by mail-lj1-x22c.google.com with SMTP id j17so993663ljq.11;
 Mon, 20 Feb 2023 03:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+wG3S28bbn6lnyJyqxwMLr0SJDA0sll2D1Vt5e6a5Cw=;
 b=gpm1mjxi9YkeGSiq8y5zaiImmS87lj+dUVjdJ+qs1pVWRYe5eY1AAx+3FF5TM+TRWY
 qekpW5dZmKJACpcDo3GpuDwbUN1a1e83vXnQz6C47KRTkRtQ7PsWNsob7brpMa+ygX/h
 n897iF2Vjl/+EzdPrOQcwTgGgVQiy6GJc1SCPqZuQI9zLuhOjtzemC7DZOlhkW0YYl2y
 f5mhn0HA6Bgn+XJ8nKYZEU5lyR5CgpZ6vy4AcTGFIpzdPZndjpkE+wi8HZAXvHF+Xbb5
 ws6dZrSBkVuLWqPmuwKFrHa3giCjqHLhr6PsnX6971BAAo4UKU4YYax/HH9IO04g5qtX
 bYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+wG3S28bbn6lnyJyqxwMLr0SJDA0sll2D1Vt5e6a5Cw=;
 b=2U3yd2fI2CaiA7eNXV5IlbfDMGZ2GIn9K/jHpMbDGrnxTV1YBdLRBx/44kg6PquZwO
 hvWH5klv8P9BdJgD/Vl/2eTxyUiZWXCADflRNe7/DRadMD2DTDhpzxlX2ZPe2B0rlSGS
 8mjRuvl+EEtpDIHZ1whoo+Oub3S8wdfVc8LfQzuBWgEggAkNRAxFiY89BhDpSIxAl3CL
 Qcq2taU51uJ1UNsx+ZE8z27WrNtFFrDIhZKx5WeQsM12evl2sT7nXBUpB23nH/XkjRd0
 jWEkRQiv8kyBI+vai/5YBF6h7a0ylDw5L1LlL2jj78MJJeU+qthEpDhX0T7L8elgeMRw
 2nEA==
X-Gm-Message-State: AO0yUKXontNgMxHYjMcVIn7zpbWiOeIC0Z03ZOjhtYAzvUMVGcORhWBY
 oFXdAiNPl4oF4MlQJaI3oLxA8bfubipvcjV8D5uINEnxIYY=
X-Google-Smtp-Source: AK7set9Sp71hnbuYtt82OSatJoQw0XiUNdXVB2DyKkJGdclDQ69/73bsB1zT8ievdAGBTC1huW0coQyErB93mnFlCvI=
X-Received: by 2002:a2e:a4b7:0:b0:293:535a:c1 with SMTP id
 g23-20020a2ea4b7000000b00293535a00c1mr529875ljm.0.1676892490182; 
 Mon, 20 Feb 2023 03:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230212204942.1905959-4-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 20 Feb 2023 15:27:58 +0400
Message-ID: <CAJ+F1CLV_JY94XT28nYuXn99BVBxq3WpphRb5vfQ7Hd0fgJ6kQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Mon, Feb 13, 2023 at 12:51 AM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Until now, a win32 SOCKET handle is often cast to an int file
> descriptor, as this is what other OS use for sockets. When necessary,
> QEMU eventually queries whether it's a socket with the help of
> fd_is_socket(). However, there is no guarantee of conflict between the
> fd and SOCKET space. Such conflict would have surprising consequences,
> we shouldn't mix them.
>
> Also, it is often forgotten that SOCKET must be closed with
> closesocket(), and not close().
>
> Instead, let's make the win32 socket wrapper functions return and take a
> file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> necessary. A bit of adaptation is necessary in io/ as well.
>
> Unfortunately, we can't drop closesocket() usage, despite
> _open_osfhandle() documentation claiming transfer of ownership, testing
> shows bad behaviour if you forget to call closesocket().
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  io/channel-socket.c |  18 +++--
>  io/channel-watch.c  |  17 +++--
>  util/oslib-win32.c  | 164 ++++++++++++++++++++++++++++++++++++++------
>  3 files changed, 165 insertions(+), 34 deletions(-)
>
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 2040297d2b..18cc062431 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -426,6 +426,14 @@ static void qio_channel_socket_init(Object *obj)
>      ioc->fd =3D -1;
>  }
>
> +static void wsa_event_clear(int sockfd)
> +{
> +#ifdef WIN32
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +    WSAEventSelect(s, NULL, 0);
> +#endif
> +}
> +
>  static void qio_channel_socket_finalize(Object *obj)
>  {
>      QIOChannelSocket *ioc =3D QIO_CHANNEL_SOCKET(obj);
> @@ -441,9 +449,7 @@ static void qio_channel_socket_finalize(Object *obj)
>                  err =3D NULL;
>              }
>          }
> -#ifdef WIN32
> -        WSAEventSelect(ioc->fd, NULL, 0);
> -#endif
> +        wsa_event_clear(ioc->fd);
>          closesocket(ioc->fd);
>          ioc->fd =3D -1;
>      }
> @@ -845,9 +851,7 @@ qio_channel_socket_close(QIOChannel *ioc,
>      Error *err =3D NULL;
>
>      if (sioc->fd !=3D -1) {
> -#ifdef WIN32
> -        WSAEventSelect(sioc->fd, NULL, 0);
> -#endif
> +        wsa_event_clear(sioc->fd);
>          if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
>              socket_listen_cleanup(sioc->fd, errp);
>          }
> @@ -899,7 +903,7 @@ static void qio_channel_socket_set_aio_fd_handler(QIO=
Channel *ioc,
>                                                    void *opaque)
>  {
>      QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> -    aio_set_fd_handler(ctx, sioc->fd, false,
> +    aio_set_fd_handler(ctx, _get_osfhandle(sioc->fd), false,

My bad, this breaks compilation on !win32, fixing. (ah, if only it was
a gitlab MR with CI..)

>                         io_read, io_write, NULL, NULL, opaque);
>  }
>
> diff --git a/io/channel-watch.c b/io/channel-watch.c
> index ad7c568a84..8c1c24008f 100644
> --- a/io/channel-watch.c
> +++ b/io/channel-watch.c
> @@ -19,6 +19,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "io/channel-watch.h"
>
>  typedef struct QIOChannelFDSource QIOChannelFDSource;
> @@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel *io=
c,
>
>  #ifdef CONFIG_WIN32
>  GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
> -                                         int socket,
> +                                         int sockfd,
>                                           GIOCondition condition)
>  {
> +    SOCKET s =3D _get_osfhandle(sockfd);
>      GSource *source;
>      QIOChannelSocketSource *ssource;
>
> -    WSAEventSelect(socket, ioc->event,
> -                   FD_READ | FD_ACCEPT | FD_CLOSE |
> -                   FD_CONNECT | FD_WRITE | FD_OOB);
> +    if (s =3D=3D -1 ||
> +        WSAEventSelect(s, ioc->event,
> +                       FD_READ | FD_ACCEPT | FD_CLOSE |
> +                       FD_CONNECT | FD_WRITE | FD_OOB) =3D=3D SOCKET_ERR=
OR) {
> +        g_autofree gchar *emsg =3D g_win32_error_message(GetLastError())=
;
> +        error_printf("error creating socket watch: %s", emsg);
> +        return NULL;
> +    }
>
>      source =3D g_source_new(&qio_channel_socket_source_funcs,
>                            sizeof(QIOChannelSocketSource));
> @@ -293,7 +300,7 @@ GSource *qio_channel_create_socket_watch(QIOChannel *=
ioc,
>      object_ref(OBJECT(ioc));
>
>      ssource->condition =3D condition;
> -    ssource->socket =3D socket;
> +    ssource->socket =3D s;
>      ssource->revents =3D 0;
>
>      ssource->fd.fd =3D (gintptr)ioc->event;
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 07ade41800..78fab521cf 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -180,7 +180,8 @@ static int socket_error(void)
>  void qemu_socket_set_block(int fd)
>  {
>      unsigned long opt =3D 0;
> -    WSAEventSelect(fd, NULL, 0);
> +    SOCKET s =3D _get_osfhandle(fd);
> +    WSAEventSelect(s, NULL, 0);
>      ioctlsocket(fd, FIONBIO, &opt);
>  }
>
> @@ -297,7 +298,13 @@ int qemu_connect_wrap(int sockfd, const struct socka=
ddr *addr,
>                        socklen_t addrlen)
>  {
>      int ret;
> -    ret =3D connect(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D connect(s, addr, addrlen);
>      if (ret < 0) {
>          if (WSAGetLastError() =3D=3D WSAEWOULDBLOCK) {
>              errno =3D EINPROGRESS;
> @@ -313,7 +320,13 @@ int qemu_connect_wrap(int sockfd, const struct socka=
ddr *addr,
>  int qemu_listen_wrap(int sockfd, int backlog)
>  {
>      int ret;
> -    ret =3D listen(sockfd, backlog);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D listen(s, backlog);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -326,7 +339,13 @@ int qemu_bind_wrap(int sockfd, const struct sockaddr=
 *addr,
>                     socklen_t addrlen)
>  {
>      int ret;
> -    ret =3D bind(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D bind(s, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -337,12 +356,22 @@ int qemu_bind_wrap(int sockfd, const struct sockadd=
r *addr,
>  #undef socket
>  int qemu_socket_wrap(int domain, int type, int protocol)
>  {
> -    int ret;
> -    ret =3D socket(domain, type, protocol);
> -    if (ret < 0) {
> +    SOCKET s;
> +    int fd;
> +
> +    s =3D socket(domain, type, protocol);
> +    if (s =3D=3D -1) {
>          errno =3D socket_error();
> +        return -1;
>      }
> -    return ret;
> +
> +    fd =3D _open_osfhandle(s, _O_BINARY);
> +    if (fd < 0) {
> +        closesocket(s);
> +        errno =3D ENOMEM;
> +    }
> +
> +    return fd;
>  }
>
>
> @@ -350,10 +379,22 @@ int qemu_socket_wrap(int domain, int type, int prot=
ocol)
>  int qemu_accept_wrap(int sockfd, struct sockaddr *addr,
>                       socklen_t *addrlen)
>  {
> -    int ret;
> -    ret =3D accept(sockfd, addr, addrlen);
> -    if (ret < 0) {
> +    int ret =3D -1;
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    s =3D accept(s, addr, addrlen);
> +    if (s =3D=3D -1) {
>          errno =3D socket_error();
> +    } else {
> +        ret =3D _open_osfhandle(s, _O_BINARY);
> +        if (ret < 0) {
> +            closesocket(s);
> +            errno =3D ENOMEM;
> +        }
>      }
>      return ret;
>  }
> @@ -363,7 +404,13 @@ int qemu_accept_wrap(int sockfd, struct sockaddr *ad=
dr,
>  int qemu_shutdown_wrap(int sockfd, int how)
>  {
>      int ret;
> -    ret =3D shutdown(sockfd, how);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D shutdown(s, how);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -375,7 +422,13 @@ int qemu_shutdown_wrap(int sockfd, int how)
>  int qemu_ioctlsocket_wrap(int fd, int req, void *val)
>  {
>      int ret;
> -    ret =3D ioctlsocket(fd, req, val);
> +    SOCKET s =3D _get_osfhandle(fd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D ioctlsocket(s, req, val);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -387,10 +440,28 @@ int qemu_ioctlsocket_wrap(int fd, int req, void *va=
l)
>  int qemu_closesocket_wrap(int fd)
>  {
>      int ret;
> -    ret =3D closesocket(fd);
> +    SOCKET s =3D _get_osfhandle(fd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +
> +    /*
> +     * close() must be called before closesocket(), otherwise close() re=
turns an
> +     * error and sets EBADF.
> +     */
> +    ret =3D close(fd);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* closesocket() is required, event after close()! */
> +    ret =3D closesocket(s);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> +
>      return ret;
>  }
>
> @@ -400,7 +471,14 @@ int qemu_getsockopt_wrap(int sockfd, int level, int =
optname,
>                           void *optval, socklen_t *optlen)
>  {
>      int ret;
> -    ret =3D getsockopt(sockfd, level, optname, optval, optlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +
> +    ret =3D getsockopt(s, level, optname, optval, optlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -413,7 +491,13 @@ int qemu_setsockopt_wrap(int sockfd, int level, int =
optname,
>                           const void *optval, socklen_t optlen)
>  {
>      int ret;
> -    ret =3D setsockopt(sockfd, level, optname, optval, optlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D setsockopt(s, level, optname, optval, optlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -426,7 +510,13 @@ int qemu_getpeername_wrap(int sockfd, struct sockadd=
r *addr,
>                            socklen_t *addrlen)
>  {
>      int ret;
> -    ret =3D getpeername(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D getpeername(s, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -439,7 +529,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockadd=
r *addr,
>                            socklen_t *addrlen)
>  {
>      int ret;
> -    ret =3D getsockname(sockfd, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D getsockname(s, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -451,7 +547,13 @@ int qemu_getsockname_wrap(int sockfd, struct sockadd=
r *addr,
>  ssize_t qemu_send_wrap(int sockfd, const void *buf, size_t len, int flag=
s)
>  {
>      int ret;
> -    ret =3D send(sockfd, buf, len, flags);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D send(s, buf, len, flags);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -464,7 +566,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf=
, size_t len, int flags,
>                           const struct sockaddr *addr, socklen_t addrlen)
>  {
>      int ret;
> -    ret =3D sendto(sockfd, buf, len, flags, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D sendto(s, buf, len, flags, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -476,7 +584,13 @@ ssize_t qemu_sendto_wrap(int sockfd, const void *buf=
, size_t len, int flags,
>  ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags)
>  {
>      int ret;
> -    ret =3D recv(sockfd, buf, len, flags);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D recv(s, buf, len, flags);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> @@ -489,7 +603,13 @@ ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, si=
ze_t len, int flags,
>                             struct sockaddr *addr, socklen_t *addrlen)
>  {
>      int ret;
> -    ret =3D recvfrom(sockfd, buf, len, flags, addr, addrlen);
> +    SOCKET s =3D _get_osfhandle(sockfd);
> +
> +    if (s =3D=3D -1) {
> +        errno =3D EINVAL;
> +        return -1;
> +    }
> +    ret =3D recvfrom(s, buf, len, flags, addr, addrlen);
>      if (ret < 0) {
>          errno =3D socket_error();
>      }
> --
> 2.39.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

