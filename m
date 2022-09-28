Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9365ED594
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:01:12 +0200 (CEST)
Received: from localhost ([::1]:47116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odR4A-0008DM-31
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWV-0007Qu-6W
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:24 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:34385
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWD-0000Fd-NH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:21 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf4s2Bz4xGH; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=gcv0pixq8VKkqLgGxV9Ru8ppJNtrsbke2IVNGXEFEJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dLJt9KkdxSmZP+mk6GlfHFowaGTpzizScipZKplk5/DF3K+GMVG9SiZSro95wy9rc
 0i89dFi7RJrV2W9py4UkkBJDLCHfgF+Lot8bGIDHWT5CeK+63smz6gDyFlV2WssdZc
 gM7lDBT0mO7wjD72UP1I0Hb3KyS9mel51wR0M1rk=
Date: Wed, 28 Sep 2022 14:55:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v9 01/16] net: introduce convert_host_port()
Message-ID: <YzPTwahVuzXmu71B@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-2-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GCI677W8+NhjmYAa"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-2-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
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


--GCI677W8+NhjmYAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:33PM +0200, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/qemu/sockets.h |  2 ++
>  net/net.c              | 62 ++++++++++++++++++++++--------------------
>  2 files changed, 34 insertions(+), 30 deletions(-)
>=20
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 038faa157f59..47194b9732f8 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -47,6 +47,8 @@ void socket_listen_cleanup(int fd, Error **errp);
>  int socket_dgram(SocketAddress *remote, SocketAddress *local, Error **er=
rp);
> =20
>  /* Old, ipv4 only bits.  Don't use for new code. */
> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
> +                      const char *port, Error **errp);
>  int parse_host_port(struct sockaddr_in *saddr, const char *str,
>                      Error **errp);
>  int socket_init(void);
> diff --git a/net/net.c b/net/net.c
> index 2db160e0634d..d2288bd3a929 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -66,55 +66,57 @@ static QTAILQ_HEAD(, NetClientState) net_clients;
>  /***********************************************************/
>  /* network device redirectors */
> =20
> -int parse_host_port(struct sockaddr_in *saddr, const char *str,
> -                    Error **errp)
> +int convert_host_port(struct sockaddr_in *saddr, const char *host,
> +                      const char *port, Error **errp)
>  {
> -    gchar **substrings;
>      struct hostent *he;
> -    const char *addr, *p, *r;
> -    int port, ret =3D 0;
> +    const char *r;
> +    long p;
> =20
>      memset(saddr, 0, sizeof(*saddr));
> =20
> -    substrings =3D g_strsplit(str, ":", 2);
> -    if (!substrings || !substrings[0] || !substrings[1]) {
> -        error_setg(errp, "host address '%s' doesn't contain ':' "
> -                   "separating host from port", str);
> -        ret =3D -1;
> -        goto out;
> -    }
> -
> -    addr =3D substrings[0];
> -    p =3D substrings[1];
> -
>      saddr->sin_family =3D AF_INET;
> -    if (addr[0] =3D=3D '\0') {
> +    if (host[0] =3D=3D '\0') {
>          saddr->sin_addr.s_addr =3D 0;
>      } else {
> -        if (qemu_isdigit(addr[0])) {
> -            if (!inet_aton(addr, &saddr->sin_addr)) {
> +        if (qemu_isdigit(host[0])) {
> +            if (!inet_aton(host, &saddr->sin_addr)) {
>                  error_setg(errp, "host address '%s' is not a valid "
> -                           "IPv4 address", addr);
> -                ret =3D -1;
> -                goto out;
> +                           "IPv4 address", host);
> +                return -1;
>              }
>          } else {
> -            he =3D gethostbyname(addr);
> +            he =3D gethostbyname(host);
>              if (he =3D=3D NULL) {
> -                error_setg(errp, "can't resolve host address '%s'", addr=
);
> -                ret =3D -1;
> -                goto out;
> +                error_setg(errp, "can't resolve host address '%s'", host=
);
> +                return -1;
>              }
>              saddr->sin_addr =3D *(struct in_addr *)he->h_addr;
>          }
>      }
> -    port =3D strtol(p, (char **)&r, 0);
> -    if (r =3D=3D p) {
> -        error_setg(errp, "port number '%s' is invalid", p);
> +    if (qemu_strtol(port, &r, 0, &p) !=3D 0) {
> +        error_setg(errp, "port number '%s' is invalid", port);
> +        return -1;
> +    }
> +    saddr->sin_port =3D htons(p);
> +    return 0;
> +}
> +
> +int parse_host_port(struct sockaddr_in *saddr, const char *str,
> +                    Error **errp)
> +{
> +    gchar **substrings;
> +    int ret;
> +
> +    substrings =3D g_strsplit(str, ":", 2);
> +    if (!substrings || !substrings[0] || !substrings[1]) {
> +        error_setg(errp, "host address '%s' doesn't contain ':' "
> +                   "separating host from port", str);
>          ret =3D -1;
>          goto out;
>      }
> -    saddr->sin_port =3D htons(port);
> +
> +    ret =3D convert_host_port(saddr, substrings[0], substrings[1], errp);
> =20
>  out:
>      g_strfreev(substrings);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GCI677W8+NhjmYAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz06UACgkQgypY4gEw
YSLn7Q/9F8AG3Y6YwHndP6Ze0wrUqzOcDqOLM4U+w/NVY/Eixj0zmsY0hdpMQdCp
vijP/MoZIJycF42XRGT4zd5F0R19ytj/VyklpNVP/1PFl2kCmpPmI3AmRiZobAZF
QZF/ytxEtTN5NxWRU3X+51KpYcju3sS8lxkhUlCDwfjMuqShhv5v4jhRPhJXpIkS
Tbo8HjUtmVJzY/HUeWJHwrMsgN4H1LVLFujaqk1+ievcQ5gnqLQGjxrqBbY0Lpsy
w/bTnhm3kj6Zt0QgqUPdAgQ6kiEs/NmfvA2KZgZLzelFXYFhh7ic3CVJknAIsjtg
Md2RaiLtO/CJAAd0h2su5EcBFSskt2w/GL1YEa6LW8VG+dH7XQZBCobJElJ1MIXA
FQXTioI56Gd1XVF8Na0GDvPhskCFNMqB5JsOba4gOFkVrXebpZiEM4TqvDPt9OW8
Me/A5mvVEh7M4JauuJETn3reHlG00hWP9hBndipX3x880CVQ41pdQL90Z/c/NAkj
QHIuPwWRBTW/zsKoCBHfvsCMmwFCCfruzcXO2ZRXzUgrlbBqw5swPGYXJ05GI02G
AJ+vl8kA6fkIbVVBplfRPyidA8F2KMMRFA7OCKBI+3xR1WyWyGNJqa/kIwujsd+U
Seh7NN1Ap8WfIkCP9nFx49x2tpqPgO2OoBoQjtVXciANj2EUyVM=
=uUfY
-----END PGP SIGNATURE-----

--GCI677W8+NhjmYAa--

