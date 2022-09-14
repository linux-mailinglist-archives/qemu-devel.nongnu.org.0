Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C95B8060
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:45:56 +0200 (CEST)
Received: from localhost ([::1]:35632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKHa-0006tU-US
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDq-00042v-21
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:02 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:51139
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDl-0005tO-Um
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:01 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS72z4F0nz4xG9; Wed, 14 Sep 2022 14:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663130507;
 bh=FkZfnP7Sc4iu/qUuXSDfnbtaVzbpGrAXHG1hQXbcAgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GZ5cQQEQILhpMKSAI1q9qyOkhSIrfcAuHSFEzZbf3QLXSjIE3TNinBaR/X+aEBhqW
 dSslzeNXux23LAgHJdx0COV+HxOqq0z48ycEAC/q3kuRyynxdDzNGJR4i++eC8BAGE
 iklQ/TJwN1L/nLQBwY9EGV9J8P+VVcg8CCqmF918=
Date: Wed, 14 Sep 2022 12:26:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v8 01/14] net: introduce convert_host_port()
Message-ID: <YyE78xSXHOQQXjwJ@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-2-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jTRY+3M858BTYHGd"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-2-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--jTRY+3M858BTYHGd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:47AM +0200, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Although, if you do respin, an actual commit message would be nice to
have.


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

--jTRY+3M858BTYHGd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhO80ACgkQgypY4gEw
YSJ7Ng/9HmezCDk+j2q05Cz1ojAN+YCjhIA9TczPUypiRIPua8yEqueC594IqNPJ
KbdOiD69onRobwTWPOAP19hblgTNdqj9czjtVq+lHH12H5lMC8uXJK+0oDtgW5Xv
+F/gIGY7DdV1xzkAnxoElRnuckDX5Tr1nTRQoh4D/25SWQllOWjnvlzfz7AJWbeH
T7GUEDvoB8jeR/9W5KEXiCq2bZDlHOiOhcxJScn6keWEmi98DbNIOZl0iMG3PC+o
tnNzImfy3In3usmDEwn6FHdaWjzD1y9Q0M5HCwQFnf044L6isniZ+tbIbkPespIy
6QjtJvcjfHP2nUdyk1W1exAElqgM8vrIMfWQhEBKQ7rWGPbiiUCGAMLZWYIWTVkQ
xLJfbdmaPz7Y14JRGpI7Ns6QhRLB/aAp8ei1Y5iVkis8KRCMH9sr0/swbaTPQOX0
E4A0IyW5x+8gUSyEn96xdLGd3TRNK5vRq5575H34JXTO8tlKbcRQI1s7gapXqXs4
mnxalNpuYwV/3VL/ugLZ+sBYO0cCjbgUe8P8xclh2MFItLeHNsP4W0RKyauCJpjq
3zszZYM5ybAmbe/x6W2kOLeYOuaEgv7Df02cLG7V9uC40kPB5L8KTHIz3lkCzTEB
fNJ0Mf+urHVx10riojTJaY/43bga6WUTfZzHsxv16PUkmOQCT3Q=
=Jszz
-----END PGP SIGNATURE-----

--jTRY+3M858BTYHGd--

