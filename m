Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EBE5ED54B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 08:48:57 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQsJ-0000qx-OR
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 02:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWM-00079z-DD
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:38761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWD-0000FY-N2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:14 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf5RmJz4xGh; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=6sLnWpqy4PhmcT6d3CWb2QvfAiw0mhe29Zq5ZryKqP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VlQWT+je8Cf4QiZZnc+RTQpkQ+O+QjiTGhK9rgC0KoVFELIVJTphtKvO2UuMPH+hD
 hag+RVooKo4Z/DpUaH6XgyVHY0CUktu69jNxLQNEs//W2dBhkKKMeI1yeBTQVnS09F
 e7UqotD1VHTdrEaQToCTIVq64SlMQOXdCWhwzg78=
Date: Wed, 28 Sep 2022 16:12:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 08/16] net: stream: add unix socket
Message-ID: <YzPlwbdw8uUbfyFL@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-9-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MRWm0+9q3wRIk1fn"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-9-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


--MRWm0+9q3wRIk1fn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:40PM +0200, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>  net/stream.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++---
>  qapi/net.json   |   2 +-
>  qemu-options.hx |   1 +
>  3 files changed, 105 insertions(+), 6 deletions(-)
>=20
> diff --git a/net/stream.c b/net/stream.c
> index 3fb899df5d2d..02967c284efc 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetC=
lientState *peer,
>  static void net_stream_accept(void *opaque)
>  {
>      NetStreamState *s =3D opaque;
> -    struct sockaddr_in saddr;
> +    struct sockaddr_storage saddr;
>      socklen_t len;
>      int fd;
> =20
> @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
>      s->fd =3D fd;
>      s->nc.link_down =3D false;
>      net_stream_connect(s);
> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> -             "connection from %s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +    switch (saddr.ss_family) {
> +    case AF_INET: {
> +        struct sockaddr_in *saddr_in =3D (struct sockaddr_in *)&saddr;
> +
> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +                 "connection from %s:%d",
> +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port=
));

So, here you print the address from which the connection has come -
the remote address.

> +        break;
> +    }
> +    case AF_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        len =3D sizeof(saddr_un);
> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +                 "connect from %s", saddr_un.sun_path);

Here you print the bound address - the local address.  Does that make
sense?  I mean, in almost every occasion the remote Unix socket will
be anonymous, so it probably doesn't make sense to display that, but
is the bound address actually a useful substitute?

Maybe it should just be "connect from Unix socket".

> +        break;
> +    }
> +    default:
> +        g_assert_not_reached();
> +    }
>  }
> =20
>  static int net_stream_server_init(NetClientState *peer,
> @@ -295,6 +313,43 @@ static int net_stream_server_init(NetClientState *pe=
er,
>          }
>          break;
>      }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        ret =3D unlink(addr->u.q_unix.path);
> +        if (ret < 0 && errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "failed to unlink socket %s",
> +                             addr->u.q_unix.path);
> +            return -1;
> +        }
> +
> +        saddr_un.sun_family =3D PF_UNIX;
> +        ret =3D snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "=
%s",
> +                       addr->u.q_unix.path);
> +        if (ret < 0 || ret >=3D sizeof(saddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       addr->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(saddr_un.sun_path));
> +            return -1;
> +        }

Not necessarily in scope here, but I do wonder if we want a common
helper to convert the QAPI SocketAddress to a struct sockaddr, which
supports both inet and Unix - and one day IPv6, one hopes - with all
the appropriate error handling.

> +
> +        fd =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        ret =3D bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "can't create socket with path=
: %s",
> +                             saddr_un.sun_path);
> +            closesocket(fd);
> +            return -1;
> +        }
> +        break;
> +    }
>      case SOCKET_ADDRESS_TYPE_FD:
>          fd =3D monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>          if (fd =3D=3D -1) {
> @@ -380,6 +435,49 @@ static int net_stream_client_init(NetClientState *pe=
er,
>                                     ntohs(saddr_in.sin_port));
>          break;
>      }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        saddr_un.sun_family =3D PF_UNIX;
> +        ret =3D snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "=
%s",
> +                       addr->u.q_unix.path);
> +        if (ret < 0 || ret >=3D sizeof(saddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       addr->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(saddr_un.sun_path));
> +            return -1;
> +        }
> +
> +        fd =3D qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create stream socket");
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        connected =3D 0;
> +        for (;;) {
> +            ret =3D connect(fd, (struct sockaddr *)&saddr_un, sizeof(sad=
dr_un));
> +            if (ret < 0) {
> +                if (errno =3D=3D EINTR || errno =3D=3D EWOULDBLOCK) {
> +                    /* continue */
> +                } else if (errno =3D=3D EAGAIN ||
> +                           errno =3D=3D EALREADY) {
> +                    break;
> +                } else {
> +                    error_setg_errno(errp, errno, "can't connect socket"=
);
> +                    closesocket(fd);
> +                    return -1;
> +                }
> +            } else {
> +                connected =3D 1;
> +                break;
> +            }
> +        }
> +        info_str =3D g_strdup_printf(" connect to %s", saddr_un.sun_path=
);
> +        break;
> +    }
>      case SOCKET_ADDRESS_TYPE_FD:
>          fd =3D monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>          if (fd =3D=3D -1) {
> @@ -395,7 +493,7 @@ static int net_stream_client_init(NetClientState *pee=
r,
>          info_str =3D g_strdup_printf("connect to fd %d", fd);
>          break;
>      default:
> -        error_setg(errp, "only support inet or fd type");
> +        error_setg(errp, "only support inet, unix or fd type");
>          return -1;
>      }
> =20
> diff --git a/qapi/net.json b/qapi/net.json
> index e02e8001a000..bb96701a49a7 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -583,7 +583,7 @@
>  #        or connect to (server=3Dfalse)
>  # @server: create server socket (default: true)
>  #
> -# Only SocketAddress types 'inet' and 'fd' are supported.
> +# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>  #
>  # Since: 7.1
>  ##
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 8c765f345da8..7a34022ac651 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2735,6 +2735,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"
>      "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dinet,addr.hos=
t=3Dhost,addr.port=3Dport\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dunix,addr.pat=
h=3Dpath\n"
>      "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dfd,addr.str=
=3Dh\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using a socket connection in stream mode.\n"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MRWm0+9q3wRIk1fn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz5boACgkQgypY4gEw
YSJKORAAkpABCQAxPHM4He9K2ArA0UGR7qSdIAopWPrKLLOyistR1a/qs6bYt2Q7
x2S4IbECc8JIPowBjCHsV2Imv5pHVU6YZ+gfLxH0isTrJMIfYNhzV8QAcNHISJda
d3fI//3Y2Vn358YpbkPxFNdV3VnmK697p//GzrxzrJWmTiWBTYmxeHT7ZauNaiTj
JAivf57jqOZaCXXagRcTQSAEPW2OcGHga2ZjRYyAFunyRpxqnsVXmBOaIfD+aFh9
6S7BlU9PdSmHwZ1Fg5pZ470tLIxF+oxL5gXrRwt/IwyAxot6lfBdYWUDhE9mRzLZ
fzHvl/U9BW/AzpRKIDBgVrwFcpQ5FWb5L52nOkVBctLu5Zq+xL0lUWts6OZhityK
zQTOqxcwZiwXUREEBHG/bJSQFHqDEDZtjb8ZxFnnrOlIk7sgiMGHHc2ISoCEDcgF
rV6Xxi1p2pDMqrHApRYdNf69ggwnXwo+TeEVA/pylrk1AEfMdnt4aCO9ltR4coBk
8NG14HLL7xiwWS5Vv2xRymX3FzGVkNKVY0hAFelSrcONg7RQc6CkCcL3GlsqSCt3
c2DbNNpZYIPHPjMbuypiEOc8Js5XqBK3Incz4+lfnR4z14f/JM68vEz3j5uACucI
TnqBvHPggJi60qe6G5fkTuPuAuP4QweK1sJqWepBAvBNtr94Ezs=
=xz6/
-----END PGP SIGNATURE-----

--MRWm0+9q3wRIk1fn--

