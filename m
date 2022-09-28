Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5615ED556
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 08:49:04 +0200 (CEST)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQsR-00012i-3S
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 02:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWO-0007Dj-03
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWK-0000RA-B6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:15 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf5hcBz4xGl; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=TPFVw8Va92wzFYgsVf+WYp6ioqfUgXF9/l5MCLmJQ5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EFsOWn+8vJgv9862TFN0p+60oBzcXK7VY44+SpAftuIE+oV+2v1BL418siACr6dYI
 LqfQHkkOMvtF/i9TvaBsgy+tgo4Zyhzm4g+reusamI/YcAZg+5OD5d0729PIMyZzA7
 UP+WYjplA3jLb6pQrv2verkMTE/Ilp9+y9r+at1w=
Date: Wed, 28 Sep 2022 16:22:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 11/16] net: dgram: add unix socket
Message-ID: <YzPoPttNJ9SotMEm@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-12-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RbFiJSGVB2HjSfIH"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-12-lvivier@redhat.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--RbFiJSGVB2HjSfIH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:43PM +0200, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Although one note below.

> ---
>  net/dgram.c     | 65 ++++++++++++++++++++++++++++++++++++++++++++++---
>  qapi/net.json   |  2 +-
>  qemu-options.hx |  1 +
>  3 files changed, 64 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/dgram.c b/net/dgram.c
> index 9fb01410304e..db631f6e2270 100644
> --- a/net/dgram.c
> +++ b/net/dgram.c
> @@ -84,8 +84,15 @@ static ssize_t net_dgram_receive_dgram(NetClientState =
*nc,
> =20
>      do {
>          if (s->dgram_dst) {
> -            ret =3D sendto(s->fd, buf, size, 0, s->dgram_dst,
> -                         sizeof(struct sockaddr_in));
> +            socklen_t len;
> +
> +            if (s->dgram_dst->sa_family =3D=3D AF_INET) {
> +                len =3D sizeof(struct sockaddr_in);
> +            } else {
> +                len =3D sizeof(struct sockaddr_un);
> +            }

It really seems like you're going to want a common helper for getting
the socklet, if not now, then pretty soon.

> +            ret =3D sendto(s->fd, buf, size, 0, s->dgram_dst, len);
>          } else {
>              ret =3D send(s->fd, buf, size, 0);
>          }
> @@ -450,7 +457,7 @@ static int net_dgram_init(NetClientState *peer,
>          }
>      } else {
>          if (local->type !=3D SOCKET_ADDRESS_TYPE_FD) {
> -            error_setg(errp, "type=3Dinet requires remote parameter");
> +            error_setg(errp, "type=3Dinet or unix require remote paramet=
er");
>              return -1;
>          }
>      }
> @@ -500,6 +507,58 @@ static int net_dgram_init(NetClientState *peer,
> =20
>          break;
>      }
> +    case SOCKET_ADDRESS_TYPE_UNIX: {
> +        struct sockaddr_un laddr_un, raddr_un;
> +
> +        ret =3D unlink(local->u.q_unix.path);
> +        if (ret < 0 && errno !=3D ENOENT) {
> +            error_setg_errno(errp, errno, "failed to unlink socket %s",
> +                             local->u.q_unix.path);
> +            return -1;
> +        }
> +
> +        laddr_un.sun_family =3D PF_UNIX;
> +        ret =3D snprintf(laddr_un.sun_path, sizeof(laddr_un.sun_path), "=
%s",
> +                       local->u.q_unix.path);
> +        if (ret < 0 || ret >=3D sizeof(laddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       local->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(laddr_un.sun_path));
> +        }
> +
> +        raddr_un.sun_family =3D PF_UNIX;
> +        ret =3D snprintf(raddr_un.sun_path, sizeof(raddr_un.sun_path), "=
%s",
> +                       remote->u.q_unix.path);
> +        if (ret < 0 || ret >=3D sizeof(raddr_un.sun_path)) {
> +            error_setg(errp, "UNIX socket path '%s' is too long",
> +                       remote->u.q_unix.path);
> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
> +                              sizeof(raddr_un.sun_path));
> +        }
> +
> +        fd =3D qemu_socket(PF_UNIX, SOCK_DGRAM, 0);
> +        if (fd < 0) {
> +            error_setg_errno(errp, errno, "can't create datagram socket"=
);
> +            return -1;
> +        }
> +
> +        ret =3D bind(fd, (struct sockaddr *)&laddr_un, sizeof(laddr_un));
> +        if (ret < 0) {
> +            error_setg_errno(errp, errno, "can't bind unix=3D%s to socke=
t",
> +                             laddr_un.sun_path);
> +            closesocket(fd);
> +            return -1;
> +        }
> +        qemu_socket_set_nonblock(fd);
> +
> +        dgram_dst =3D g_malloc(sizeof(raddr_un));
> +        memcpy(dgram_dst, &raddr_un, sizeof(raddr_un));
> +
> +        info_str =3D g_strdup_printf("udp=3D%s:%s",
> +                                   laddr_un.sun_path, raddr_un.sun_path);
> +        break;
> +    }
>      case SOCKET_ADDRESS_TYPE_FD: {
>          SocketAddress *sa;
>          SocketAddressType sa_type;
> diff --git a/qapi/net.json b/qapi/net.json
> index bb96701a49a7..9cc4be7535bb 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -600,7 +600,7 @@
>  # @remote: remote address
>  # @local: local address
>  #
> -# Only SocketAddress types 'inet' and 'fd' are supported.
> +# Only SocketAddress types 'unix', 'inet' and 'fd' are supported.
>  #
>  # The code checks there is at least one of these options and reports an =
error
>  # if not. If remote address is present and it's a multicast address, loc=
al
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7a34022ac651..5adb2e688c73 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2744,6 +2744,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "                configure a network backend to connect to a multica=
st maddr and port\n"
>      "                use ``local.host=3Daddr`` to specify the host addre=
ss to send packets from\n"
>      "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Daddr,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Daddr,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dunix,local.path=3Dpath[,remote.=
type=3Dunix,remote.path=3Dpath]\n"
>      "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dh\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RbFiJSGVB2HjSfIH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz6DgACgkQgypY4gEw
YSK52Q//atsjyWp/oVxtxf1yotAtrbYA0xIR2zlqJ4d3MeWaAxYLzNOwrahDHKZ4
g0kRwxp/aMQJhXPLvo3NOA5dICBoRxP9JJ4cluJ3YaHOVGYeuJWfMPuUDpwyRr0O
OciSWs7v/7QNi38/5YfvSBEAvX+OLicIXF1jJINGvmncZbkFXelUmqiCE1BAUtWV
Rivhf75vEFrEmsaGIeINSqXO81ObmeviAoDEvaerGux5fjEnmamZisX7NR10f2E8
vMPHG0dISNOORcFVkLjt59MYIOYSlOVssBbA38zwqPz2CE4nmbZexlSyyMcO4Il1
8g9Wme52cBhJwWpjfQESn43cv4mdmGqfnAdym7x8aL255xv3mVXynO7VC0fGwumY
Kn9kzvRxniq/tGxXmBxW9mThGVN4U4sE8tAbkBjslRC/0TurBowOMLtyiAjMj9Qh
cwPzxXBYK4Sd2eJ+18WXWAR6LRcucbZBCrPpldQy9YgQIpS+wnZ18qiF5KFrJEXv
KtAk4oojnj+h9WvEjBO5GFQx6HWenndbjTSSKOQAg3HsfFPlMYQt2NHfiHBLtI7a
6uJqULMC+NSZF1+0lK9Yv+crIo4q+WsxQclofeScheijdLUYJAhKPD9Fjkt0pPXV
b+zqY0q+R67OBX/iiMarQ+CwTXf18QBmiTXWp8yyq6Z3dHtXdnA=
=+8v1
-----END PGP SIGNATURE-----

--RbFiJSGVB2HjSfIH--

