Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EA5ED597
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:01:22 +0200 (CEST)
Received: from localhost ([::1]:42832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odR4L-0008Qs-2E
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWP-0007HE-Ci
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36067
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1odQWK-0000RB-KE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:26:17 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mcmhf5pjZz4xGm; Wed, 28 Sep 2022 16:25:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1664346354;
 bh=UlcnUqLwokDudYaYzjjAetNiOLd2wxVq0LKfeyYpmsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mgn5OAhawLEKfphHYdKOK0+6jmceug/AseAonQBhRTggXkiMHjenNST8uXbNB2oLb
 7rq2aPcdKWMsLyu8M7sBy7dgmWHQVuPpEh/z2tRhlc0gSZ2i8EXl/C3zrI68g3Pn60
 gUV9wMfstUemE12sjQMUH+csYKI11/lOzqmmMZEo=
Date: Wed, 28 Sep 2022 16:23:54 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v9 13/16] qemu-sockets: update socket_uri() and
 socket_parse() to be consistent
Message-ID: <YzPoeq99KNl0XNGJ@yekko>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-14-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QyhGhURBFlL+1/8J"
Content-Disposition: inline
In-Reply-To: <20220926195048.487915-14-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


--QyhGhURBFlL+1/8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 09:50:45PM +0200, Laurent Vivier wrote:
> To be consistent with socket_uri(), add 'tcp:' prefix for inet type in
> socket_parse(), by default socket_parse() use tcp when no prefix is
> provided (format is host:port).
>=20
> In socket_uri(), use 'vsock:' prefix for vsock type rather than 'tcp:'
> because it makes a vsock address look like an inet address with CID
> misinterpreted as host.
> Goes back to commit 9aca82ba31 "migration: Create socket-address paramete=
r"
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  util/qemu-sockets.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9f6f655fd526..a9926af714c4 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1090,7 +1090,7 @@ char *socket_uri(SocketAddress *addr)
>      case SOCKET_ADDRESS_TYPE_FD:
>          return g_strdup_printf("fd:%s", addr->u.fd.str);
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> +        return g_strdup_printf("vsock:%s:%s",
>                                 addr->u.vsock.cid,
>                                 addr->u.vsock.port);
>      default:
> @@ -1124,6 +1124,11 @@ SocketAddress *socket_parse(const char *str, Error=
 **errp)
>          if (vsock_parse(&addr->u.vsock, str + strlen("vsock:"), errp)) {
>              goto fail;
>          }
> +    } else if (strstart(str, "tcp:", NULL)) {
> +        addr->type =3D SOCKET_ADDRESS_TYPE_INET;
> +        if (inet_parse(&addr->u.inet, str + strlen("tcp:"), errp)) {
> +            goto fail;
> +        }
>      } else {
>          addr->type =3D SOCKET_ADDRESS_TYPE_INET;
>          if (inet_parse(&addr->u.inet, str, errp)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QyhGhURBFlL+1/8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMz6HQACgkQgypY4gEw
YSJ8Kg//avqU3g5IvFORMrJU6VGvKwtnO8V4swoipAvz06PPemRT9vK1i0V1qguK
ExnC+PvEEiH1wNQCMqLBG3yqZE8PABOUtoWdrxUsH7WDYRCYXIqjrPBvfyFtLOK1
tcXU67Ui2fII0C96sfk3s5Vwx97YwS2Ffwp1IDfbWj2UyLhJ4X1Rytk4zg6E1yQQ
zRnyQtQcW+E+TCBEDwuDuASvO4YZmaZuGuglMX/l/NaWhxF2gXSrhSJUnnk02caA
dxFGy1g8ODgVt31Yt2L+rzmqKSMsE1VwFzDsum8J0q5XOEtojW8PfNEMMa2gSZIt
mmzwLuNlzvMQ9CTq1zdSrEVflvHCNK3hoUHnGGMRKZGeYoll691ePBLDWNk+7MWA
MExyRhRU/ZK2sS9oHPExBsOQ2f7ZWmbi3jHLI+ZuH9LX8ZgtAAv92gb+7b1rQcrn
jxQydaXFArANu1nIfYuZ00oOjVgXtt3/8mk0Giu/DNJAEu7WgTvfqqt0BzvD4h7Q
6kIuCgGwJ3qN2bVkIZxNuL2Y7sKtVJSxmWxWFsQbBOm7+vYfbnIFVYLn8PJ3gCDl
4TUI8H4US7AaKmOams9VOQnKh9hCiOuQkeVV6bEmRADzs3bE5cv2LrpqDwi5wSrx
kqCqxF7xQijUgmqglUbbEmGrnLrxDlhfrNh+XneqzZr2QoT/aVE=
=q52E
-----END PGP SIGNATURE-----

--QyhGhURBFlL+1/8J--

