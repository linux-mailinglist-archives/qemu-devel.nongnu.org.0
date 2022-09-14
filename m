Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9A55B8106
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 07:34:49 +0200 (CEST)
Received: from localhost ([::1]:49746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYL2t-00034w-JU
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 01:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvI-0007Re-Hv
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:26:57 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:34141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvE-000462-Ek
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:26:56 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS82t70l8z4xGC; Wed, 14 Sep 2022 15:26:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663133206;
 bh=K95DaP7jYQkKdfb6RktE1P7xuRe5VTDk7g2bbLF+WMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SQRVnj8zIJrx+2MduqNVBQQDWc2m/vkLCCBgUuST1fpgDly0Cw18A6DDLHRIoGbnA
 nEDw/82Nr/QN5K3XxQ2av/UKYWwRCue57MecqQSzFTZbQSOX+NGI0St1gelo7q8tbo
 eHg5v3oU452UGx4T4aFfDH18gKNoXRm2+84t8zaI=
Date: Wed, 14 Sep 2022 15:16:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v8 07/14] net: stream: add unix socket
Message-ID: <YyFjmtyNd5mAlm9b@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-8-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lK0mBGFxUrUBQ1w8"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-8-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lK0mBGFxUrUBQ1w8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:53AM +0200, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>  net/stream.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++---
>  qapi/net.json   |   2 +-
>  qemu-options.hx |   1 +
>  3 files changed, 105 insertions(+), 6 deletions(-)
>=20
> diff --git a/net/stream.c b/net/stream.c
> index e8afbaca50b6..0f91ff20df61 100644
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
> +        break;
> +    }
> +    case AF_UNIX: {
> +        struct sockaddr_un saddr_un;
> +
> +        len =3D sizeof(saddr_un);
> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);

It seems like there's an asymmetry here in that we've gotten the
connection address outside the switch for inet sockets, but we need an
additional getsockname() for unix sockets.  Am I missing something?=20

> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
> +                 "connect from %s", saddr_un.sun_path);
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
> index bb16a61bae8e..8870bcce6bcd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2733,6 +2733,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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

--lK0mBGFxUrUBQ1w8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhY5QACgkQgypY4gEw
YSImMg/8D3n4ss0cgNXmutNAkyJN/qvsYLYXAGe20FHh4tNA8rhKnrtlNBIVlXp9
pmXNrDK/GF0NnadCnxExquwCjZGyiiWaqqf1Gs9rdan5gEWn2xmeajAFJHyCN8r7
R9hGCybR7vTgOkEpB4vN54EccJvFzsGBW8e0pqC5x4GOavF6uHRbMNhnajecL+5t
VejzT1AifG2xnJk9G/Rqy+sKNxpHy1T7tKpiFZpZhvsIw2UGGjePMdILZ7uHYIpl
J39ZfPkh59asm8YWWQjGU/41iiUItvdaXVQ1TqIjS4O96n8c4Bd8/J+HnIYO2x3Q
OLZKkTOqrA7Clg4Yn2tlUkjBRyvGcX2Rxh8OCgCsKYypN3YaTPt1ppKnT514LgmR
LgRenB/yyvVDZd71gwtLsLLbju9OZ1FTE0WQDOA18jJEc1mYmc2rTa7+JHtrWWOZ
0UVqY+g+iH8LJ/3j7q5cmuAwrGPo00jvsTz6/a7DBvftyoQePZqjPz7eSdbBYR8E
hY12pRAY8APy7jZT5PonYg73rjmPd3dUCm+2gJ68E+j37XfCnaAJQjwMkjDg5TRG
aDQ8/PPpv1l+QGVGPRjqMCGuLHzMSVRi8+Y8d17tVCIykPzhsO2CtO9djYGODy2q
gNqkuLkPO3J3sIGWARfabC9fwNKXbgpG0vX/vX2rrkaq/0qRelE=
=qeBb
-----END PGP SIGNATURE-----

--lK0mBGFxUrUBQ1w8--

