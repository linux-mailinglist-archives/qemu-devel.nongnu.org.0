Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBBC5ED54A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 08:48:26 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odQro-0000aP-ML
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 02:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWI-00073V-9o
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWD-0000FW-NT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:09 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf5bDcz4xGk; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=ZIxHcdWEO5litGasTbVy4qpvSbMJckHWQCw1Zy11Ndo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1nrzmXYuDS8dcrZH6GNeBLubYTnXdKxkpOVm4qFCR5MHTPXTo9rH9s5ML4XaINnE
 BrZ8pgsE4hNGE3d2AQnpLl6dOWxN8Bzqgv3/HpMt/EgKDW3n3pqSompuuuHwuELYjP
 QiKYo/5ygxCTA04d+xggF33WwlrkXkvyNmXkkqYs=
Date: Wed, 28 Sep 2022 16:17:44 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 09/16] net: dgram: make dgram_dst generic
Message-ID: <YzPnCBawLKLMMMAC@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-10-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0byvswQNcx/FTkMd"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-10-lvivier@redhat.com>
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


--0byvswQNcx/FTkMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:41PM +0200, Laurent Vivier wrote:
> dgram_dst is a sockaddr_in structure. To be able to use it with
> unix socket, use a pointer to a generic sockaddr structure.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

LGTM as far as it goes, but.. how can one actually use this pointer as
a generic sockaddr without also storing a socklen_t somewhere?

> ---
>  net/dgram.c | 73 ++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 44 insertions(+), 29 deletions(-)
>=20
> diff --git a/net/dgram.c b/net/dgram.c
> index 45d869efc844..57933bfbd1c1 100644
> --- a/net/dgram.c
> +++ b/net/dgram.c
> @@ -39,7 +39,7 @@ typedef struct NetDgramState {
>      NetClientState nc;
>      int fd;
>      SocketReadState rs;
> -    struct sockaddr_in dgram_dst; /* contains destination iff connection=
less */
> +    struct sockaddr *dgram_dst; /* contains destination iff connectionle=
ss */
>      bool read_poll;               /* waiting to receive data? */
>      bool write_poll;              /* waiting to transmit data? */
>  } NetDgramState;
> @@ -83,10 +83,9 @@ static ssize_t net_dgram_receive_dgram(NetClientState =
*nc,
>      ssize_t ret;
> =20
>      do {
> -        if (s->dgram_dst.sin_family !=3D AF_UNIX) {
> -            ret =3D sendto(s->fd, buf, size, 0,
> -                         (struct sockaddr *)&s->dgram_dst,
> -                         sizeof(s->dgram_dst));
> +        if (s->dgram_dst) {
> +            ret =3D sendto(s->fd, buf, size, 0, s->dgram_dst,
> +                         sizeof(struct sockaddr_in));
>          } else {
>              ret =3D send(s->fd, buf, size, 0);
>          }
> @@ -243,6 +242,8 @@ static void net_dgram_cleanup(NetClientState *nc)
>          close(s->fd);
>          s->fd =3D -1;
>      }
> +    g_free(s->dgram_dst);
> +    s->dgram_dst =3D NULL;
>  }
> =20
>  static NetClientInfo net_dgram_socket_info =3D {
> @@ -259,7 +260,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClie=
ntState *peer,
>                                                SocketAddress *mcast,
>                                                Error **errp)
>  {
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr =3D NULL;
>      int newfd;
>      NetClientState *nc;
>      NetDgramState *s;
> @@ -281,24 +282,25 @@ static NetDgramState *net_dgram_fd_init_dgram(NetCl=
ientState *peer,
>       */
> =20
>      if (is_fd && mcast !=3D NULL) {
> -            if (convert_host_port(&saddr, mcast->u.inet.host,
> -                                  mcast->u.inet.port, errp) < 0) {
> +            saddr =3D g_new(struct sockaddr_in, 1);
> +
> +            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.in=
et.port,
> +                                  errp) < 0) {
>                  goto err;
>              }
>              /* must be bound */
> -            if (saddr.sin_addr.s_addr =3D=3D 0) {
> +            if (saddr->sin_addr.s_addr =3D=3D 0) {
>                  error_setg(errp, "can't setup multicast destination addr=
ess");
>                  goto err;
>              }
>              /* clone dgram socket */
> -            newfd =3D net_dgram_mcast_create(&saddr, NULL, errp);
> +            newfd =3D net_dgram_mcast_create(saddr, NULL, errp);
>              if (newfd < 0) {
>                  goto err;
>              }
>              /* clone newfd to fd, close newfd */
>              dup2(newfd, fd);
>              close(newfd);
> -
>      }
> =20
>      nc =3D qemu_new_net_client(&net_dgram_socket_info, peer, model, name=
);
> @@ -310,16 +312,13 @@ static NetDgramState *net_dgram_fd_init_dgram(NetCl=
ientState *peer,
>      net_dgram_read_poll(s, true);
> =20
>      /* mcast: save bound address as dst */
> -    if (is_fd && mcast !=3D NULL) {
> -        s->dgram_dst =3D saddr;
> +    if (saddr) {
> +        g_assert(s->dgram_dst =3D=3D NULL);
> +        s->dgram_dst =3D (struct sockaddr *)saddr;
>          snprintf(nc->info_str, sizeof(nc->info_str),
>                   "fd=3D%d (cloned mcast=3D%s:%d)",
> -                 fd, inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +                 fd, inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
>      } else {
> -        if (sa_type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {
> -            s->dgram_dst.sin_family =3D AF_UNIX;
> -        }
> -
>          snprintf(nc->info_str, sizeof(nc->info_str), "fd=3D%d %s", fd,
>                   SocketAddressType_str(sa_type));
>      }
> @@ -327,6 +326,7 @@ static NetDgramState *net_dgram_fd_init_dgram(NetClie=
ntState *peer,
>      return s;
> =20
>  err:
> +    g_free(saddr);
>      closesocket(fd);
>      return NULL;
>  }
> @@ -340,21 +340,24 @@ static int net_dgram_mcast_init(NetClientState *pee=
r,
>  {
>      NetDgramState *s;
>      int fd, ret;
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr;
> =20
>      if (remote->type !=3D SOCKET_ADDRESS_TYPE_INET) {
>          error_setg(errp, "multicast only support inet type");
>          return -1;
>      }
> =20
> -    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.po=
rt,
> +    saddr =3D g_new(struct sockaddr_in, 1);
> +    if (convert_host_port(saddr, remote->u.inet.host, remote->u.inet.por=
t,
>                            errp) < 0) {
> +        g_free(saddr);
>          return -1;
>      }
> =20
>      if (!local) {
> -        fd =3D net_dgram_mcast_create(&saddr, NULL, errp);
> +        fd =3D net_dgram_mcast_create(saddr, NULL, errp);
>          if (fd < 0) {
> +            g_free(saddr);
>              return -1;
>          }
>      } else {
> @@ -363,13 +366,15 @@ static int net_dgram_mcast_init(NetClientState *pee=
r,
>              struct in_addr localaddr;
> =20
>              if (inet_aton(local->u.inet.host, &localaddr) =3D=3D 0) {
> +                g_free(saddr);
>                  error_setg(errp, "localaddr '%s' is not a valid IPv4 add=
ress",
>                             local->u.inet.host);
>                  return -1;
>              }
> =20
> -            fd =3D net_dgram_mcast_create(&saddr, &localaddr, errp);
> +            fd =3D net_dgram_mcast_create(saddr, &localaddr, errp);
>              if (fd < 0) {
> +                g_free(saddr);
>                  return -1;
>              }
>              break;
> @@ -377,16 +382,19 @@ static int net_dgram_mcast_init(NetClientState *pee=
r,
>          case SOCKET_ADDRESS_TYPE_FD:
>              fd =3D monitor_fd_param(monitor_cur(), local->u.fd.str, errp=
);
>              if (fd =3D=3D -1) {
> +                g_free(saddr);
>                  return -1;
>              }
>              ret =3D qemu_socket_try_set_nonblock(fd);
>              if (ret < 0) {
> +                g_free(saddr);
>                  error_setg_errno(errp, -ret, "%s: Can't use file descrip=
tor %d",
>                                   name, fd);
>                  return -1;
>              }
>              break;
>          default:
> +            g_free(saddr);
>              error_setg(errp, "only support inet or fd type for local");
>              return -1;
>          }
> @@ -396,13 +404,16 @@ static int net_dgram_mcast_init(NetClientState *pee=
r,
>                                   local->type =3D=3D SOCKET_ADDRESS_TYPE_=
FD,
>                                   remote, errp);
>      if (!s) {
> +        g_free(saddr);
>          return -1;
>      }
> =20
> -    s->dgram_dst =3D saddr;
> +    g_assert(s->dgram_dst =3D=3D NULL);
> +    s->dgram_dst =3D (struct sockaddr *)saddr;
> =20
>      snprintf(s->nc.info_str, sizeof(s->nc.info_str), "mcast=3D%s:%d",
> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +             inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
> +
>      return 0;
> =20
>  }
> @@ -416,8 +427,8 @@ static int net_dgram_init(NetClientState *peer,
>  {
>      NetDgramState *s;
>      int fd, ret;
> -    struct sockaddr_in raddr_in;
>      gchar *info_str;
> +    struct sockaddr *dgram_dst;
> =20
>      /* detect multicast address */
>      if (remote && remote->type =3D=3D SOCKET_ADDRESS_TYPE_INET) {
> @@ -458,7 +469,7 @@ static int net_dgram_init(NetClientState *peer,
> =20
>      switch (local->type) {
>      case SOCKET_ADDRESS_TYPE_INET: {
> -        struct sockaddr_in laddr_in;
> +        struct sockaddr_in laddr_in, raddr_in;
> =20
>          if (convert_host_port(&laddr_in, local->u.inet.host, local->u.in=
et.port,
>                                errp) < 0) {
> @@ -492,9 +503,12 @@ static int net_dgram_init(NetClientState *peer,
>          }
>          qemu_socket_set_nonblock(fd);
> =20
> +        dgram_dst =3D g_malloc(sizeof(raddr_in));
> +        memcpy(dgram_dst, &raddr_in, sizeof(raddr_in));
> +
>          info_str =3D g_strdup_printf("udp=3D%s:%d/%s:%d",
> -                 inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin_port),
> -                 inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin_port));
> +                        inet_ntoa(laddr_in.sin_addr), ntohs(laddr_in.sin=
_port),
> +                        inet_ntoa(raddr_in.sin_addr), ntohs(raddr_in.sin=
_port));
> =20
>          break;
>      }
> @@ -521,7 +535,8 @@ static int net_dgram_init(NetClientState *peer,
>      }
> =20
>      if (remote) {
> -        s->dgram_dst =3D raddr_in;
> +        g_assert(s->dgram_dst =3D=3D NULL);
> +        s->dgram_dst =3D dgram_dst;
> =20
>          pstrcpy(s->nc.info_str, sizeof(s->nc.info_str), info_str);
>          g_free(info_str);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0byvswQNcx/FTkMd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz5wEACgkQgypY4gEw
YSLaGg//VNvrvMuby7eeS5Yv2dS7pOO/r8b58As9tKC/oSUGlQhjtqXiOBHZJjHN
v85Uw6USqAqmf+5Sb1uqKnsSuBFY97hGmQadDiC5VTXMqw4+hTQt+pynsfbzJjAF
0yNRPL26tHLFxuDD/XDP1bVZKio8yru7roJ+xkUsPfkvj9eanbIQqzHaiXb8F5nv
poLiW2ESvm9ODva1Aua/ubcEFc5hZkBk1U2Id9mcpT7gCMFKC6DSMN70Ks0x8Wag
QM1CsGuI5obJDGfyMiQ+XUBiyOqt8PG2cqHHUCdiwX2XBgR8bvwPp/QOdP+2AZyY
X0LGBFfgkuNg5VPyuX1/or9qfEsdOOxDO2luypdXs6lb4rb2/YUt3qcyZYMcRqbo
eaKT4Br4MhG1Q7Km8V5QBvx72G8TuNVDGTcWfVI0bb2jEPvb2ajGCfgbGtBXcE80
weSyhCeIYU/0HGatskCYLbfw+PTQhI8uo3sc1QT2vUnkGtTexDQNQxMO/6+vExfN
3eyPqGqjhdTbUDqOIpO5NdGiMBFcLVeRPAsZVje9MjG0WH89cnP02VoBen7iUcKE
fEv3R4cHZl22Vk2OOIYW0Xs6Kpq6BudBbIBOqYMpeBWbYwT2jN8n9uKLyOA6tUN1
jkzW0ZgBRGDObzaQdIf5xYE9JQMwVM4GaKP1Zq99v6L19QWuKLM=
=4cc5
-----END PGP SIGNATURE-----

--0byvswQNcx/FTkMd--

