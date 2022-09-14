Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD315B810D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 07:42:40 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYLAS-0006Is-Un
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 01:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvM-0007Rn-06
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:27:00 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39331
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKvF-00045z-Qg
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 01:26:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS82t6vhbz4xG8; Wed, 14 Sep 2022 15:26:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663133206;
 bh=ilBm4FzSX0xhZKyuTUT3kJ2gYf8gNiJnEA1ZdyE2CGU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QytehEdqMgsCgTMSh4NIPgsXQN7rfCiidLPsOsu5wl42EcE59d4jjZfvCRab4+ZIT
 kClXROpIFOI8Vs3d2Q8iefykPDhc8uz/Sf5xUm5e44/D9UdfCREfW2CSotQohcs2XM
 wiPoI5VLXkqWglG0nFQOgug/HIMV0GPSlz3LGe4I=
Date: Wed, 14 Sep 2022 15:23:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 11/14] qemu-sockets: move and rename
 SocketAddress_to_str()
Message-ID: <YyFlXjN/4Bu8CblG@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-12-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iAG5jWlSMzEwnqoo"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-12-lvivier@redhat.com>
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


--iAG5jWlSMzEwnqoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:57AM +0200, Laurent Vivier wrote:
> Rename SocketAddress_to_str() to socket_uri() and move it to
> util/qemu-sockets.c close to socket_parse().
>=20
> socket_uri() generates a string from a SocketAddress while
> socket_parse() generates a SocketAddress from a string.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/qemu/sockets.h |  2 +-
>  monitor/hmp-cmds.c     | 23 +----------------------
>  util/qemu-sockets.c    | 20 ++++++++++++++++++++
>  3 files changed, 22 insertions(+), 23 deletions(-)
>=20
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 47194b9732f8..e5a06d2e3729 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -40,6 +40,7 @@ NetworkAddressFamily inet_netfamily(int family);
>  int unix_listen(const char *path, Error **errp);
>  int unix_connect(const char *path, Error **errp);
> =20
> +char *socket_uri(SocketAddress *addr);
>  SocketAddress *socket_parse(const char *str, Error **errp);
>  int socket_connect(SocketAddress *addr, Error **errp);
>  int socket_listen(SocketAddress *addr, int num, Error **errp);
> @@ -123,5 +124,4 @@ SocketAddress *socket_address_flatten(SocketAddressLe=
gacy *addr);
>   * Return 0 on success.
>   */
>  int socket_address_parse_named_fd(SocketAddress *addr, Error **errp);
> -
>  #endif /* QEMU_SOCKETS_H */
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c6cd6f91dde6..cb35059c2d45 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -197,27 +197,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict)
>      qapi_free_MouseInfoList(mice_list);
>  }
> =20
> -static char *SocketAddress_to_str(SocketAddress *addr)
> -{
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.inet.host,
> -                               addr->u.inet.port);
> -    case SOCKET_ADDRESS_TYPE_UNIX:
> -        return g_strdup_printf("unix:%s",
> -                               addr->u.q_unix.path);
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        return g_strdup_printf("fd:%s", addr->u.fd.str);
> -    case SOCKET_ADDRESS_TYPE_VSOCK:
> -        return g_strdup_printf("tcp:%s:%s",
> -                               addr->u.vsock.cid,
> -                               addr->u.vsock.port);
> -    default:
> -        return g_strdup("unknown address type");
> -    }
> -}
> -
>  void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>  {
>      MigrationInfo *info;
> @@ -380,7 +359,7 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdic=
t)
>          monitor_printf(mon, "socket address: [\n");
> =20
>          for (addr =3D info->socket_address; addr; addr =3D addr->next) {
> -            char *s =3D SocketAddress_to_str(addr->value);
> +            char *s =3D socket_uri(addr->value);
>              monitor_printf(mon, "\t%s\n", s);
>              g_free(s);
>          }
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 83f4bd6fd211..9f6f655fd526 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1077,6 +1077,26 @@ int unix_connect(const char *path, Error **errp)
>      return sock;
>  }
> =20
> +char *socket_uri(SocketAddress *addr)
> +{
> +    switch (addr->type) {
> +    case SOCKET_ADDRESS_TYPE_INET:
> +        return g_strdup_printf("tcp:%s:%s",
> +                               addr->u.inet.host,
> +                               addr->u.inet.port);
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        return g_strdup_printf("unix:%s",
> +                               addr->u.q_unix.path);
> +    case SOCKET_ADDRESS_TYPE_FD:
> +        return g_strdup_printf("fd:%s", addr->u.fd.str);
> +    case SOCKET_ADDRESS_TYPE_VSOCK:
> +        return g_strdup_printf("tcp:%s:%s",
> +                               addr->u.vsock.cid,
> +                               addr->u.vsock.port);
> +    default:
> +        return g_strdup("unknown address type");
> +    }
> +}
> =20
>  SocketAddress *socket_parse(const char *str, Error **errp)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--iAG5jWlSMzEwnqoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhZVcACgkQgypY4gEw
YSIMbQ/+P9KeDG7ygkbWFDva9lupH2rOoMzAec3bBd0SMdxt711q1/BVUCh4Tvta
md/zBIZ9mNDlGiJA0IKv71z4VowcUzTDfFdUwGTaINwXbBiIZZbDKr2OeuYwVBvB
49fAfxDYfZc2YC6Te9fhBdpxY9u1zri1G2W/+pG9WqalKI5QV8zezmdPTIqQoluu
YBaAZ+SvAJRwNPwAcdx6rCLVT2XNo+MWpa8JNLRLG9RkQXyIYL9Y+5VNWTxLEi96
3EmETI7Z2VxjX708fUgIqpDI/29/wf9TCrm8R5mOHfJcbDb1B06gbK6tCHamDisz
7d/Qzo1l69Dsq2mQzsEPaRKtlSPKQmJ9KNXLhx72lilimfvnQFYsdZhUMWhs0haY
X0VdcdupMVTJV6KfcTZbMb+PJTMmpFTHdh53kLBvyWXHCgohBPB7yz6SVhE5Scq2
6r3vbplYCTOfyB4OSKfH8pNpgoyxOv+qnyOcvrjN8vAPAMbn3awhoF1dLzgVDJuz
Zuzu0rhyL3M2FINv+2G1jpfCFovqny5Ddufo3EXyVO5J0hky5rfhjI2PgX21svHQ
MDa+cXClK8kscxXnlYRUDwEcsDC2oT1AW01SNa5bXaoJ40EcJq+FJAw3iNn5ODpX
Ckfx13FrUwdfGEC8ar8TFwHN++++eSRBRW48i2FfSsImDUGjs14=
=Izbt
-----END PGP SIGNATURE-----

--iAG5jWlSMzEwnqoo--

