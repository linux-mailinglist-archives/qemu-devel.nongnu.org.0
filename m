Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23833D053
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:11:08 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5jH-0006Dc-6V
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lM5iS-0005lP-3S
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lM5iQ-0008EV-91
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 05:10:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615885813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbIYea7O3DrAxnmRQY7R4VwhOjl8rHHYGWpRqoIp9gI=;
 b=RkQqkkM5B/0kZg82LuHJs1cEHU6hHv466JXC6/CPkXLGZtRhGA4VniNG6ZsBASAQV7TxkL
 ZOo5H4CXgZsUstFEwP6/mpWPUUr5WGwFWKh5tTCKaeUQSiWps2OhU3gc/zTeBzkJvsnE02
 sr9IN8O5dowbok+XpF/y4iDvPl2qCLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-xK5WId0GPEydlRfpv16afg-1; Tue, 16 Mar 2021 05:10:11 -0400
X-MC-Unique: xK5WId0GPEydlRfpv16afg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DDB9100C664
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:10:10 +0000 (UTC)
Received: from localhost (ovpn-115-62.ams2.redhat.com [10.36.115.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAB291F469;
 Tue, 16 Mar 2021 09:10:06 +0000 (UTC)
Date: Tue, 16 Mar 2021 09:10:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kraxel@redhat.com, Daniel Berrange <berrange@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <YFB17aYnCZlyp8b4@stefanha-x1.localdomain>
References: <20210310173004.420190-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310173004.420190-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HanN3xENTWRnEyHv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HanN3xENTWRnEyHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
> socket_get_fd() fails with the error "socket_get_fd: too many
> connections" if the given listen backlog value is not 1.
>=20
> Not all callers set the backlog to 1. For example, commit
> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> socket listen() backlog") uses SOMAXCONN. This will always fail with in
> socket_get_fd().
>=20
> This patch calls listen(2) on the fd to update the backlog value. The
> socket may already be in the listen state. I have tested that this works
> on Linux 5.10 and macOS Catalina.
>=20
> As a bonus this allows us to detect when the fd cannot listen. Now we'll
> be able to catch unbound or connected fds in socket_listen().
>=20
> Drop the num argument from socket_get_fd() since this function is also
> called by socket_connect() where a listen backlog value does not make
> sense.
>=20
> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog par=
ameter to socket_listen")
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)

Dan and Gerd: Can this go via one of your trees?

Thanks,
Stefan

> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15..2463c49773 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1116,14 +1116,10 @@ fail:
>      return NULL;
>  }
> =20
> -static int socket_get_fd(const char *fdstr, int num, Error **errp)
> +static int socket_get_fd(const char *fdstr, Error **errp)
>  {
>      Monitor *cur_mon =3D monitor_cur();
>      int fd;
> -    if (num !=3D 1) {
> -        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connecti=
ons");
> -        return -1;
> -    }
>      if (cur_mon) {
>          fd =3D monitor_get_fd(cur_mon, fdstr, errp);
>          if (fd < 0) {
> @@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **err=
p)
>          break;
> =20
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd =3D socket_get_fd(addr->u.fd.str, 1, errp);
> +        fd =3D socket_get_fd(addr->u.fd.str, errp);
>          break;
> =20
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> @@ -1187,7 +1183,26 @@ int socket_listen(SocketAddress *addr, int num, Er=
ror **errp)
>          break;
> =20
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd =3D socket_get_fd(addr->u.fd.str, num, errp);
> +        fd =3D socket_get_fd(addr->u.fd.str, errp);
> +        if (fd < 0) {
> +            return -1;
> +        }
> +
> +        /*
> +         * If the socket is not yet in the listen state, then transition=
 it to
> +         * the listen state now.
> +         *
> +         * If it's already listening then this updates the backlog value=
 as
> +         * requested.
> +         *
> +         * If this socket cannot listen because it's already in another =
state
> +         * (e.g. unbound or connected) then we'll catch the error here.
> +         */
> +        if (listen(fd, num) !=3D 0) {
> +            error_setg_errno(errp, errno, "Failed to listen on fd socket=
");
> +            closesocket(fd);
> +            return -1;
> +        }
>          break;
> =20
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> --=20
> 2.29.2
>=20

--HanN3xENTWRnEyHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBQde0ACgkQnKSrs4Gr
c8ifZAf/SVt5X3zLLeiI8cGMkuve63UIEsdAa6975OC9Z8WgL7q/w4lQzf5RubwR
xunbcft5ySLty2aY5m/NnepFcTy+34W+Sh6j5Yyh/dAby3NJLnZpSgqtT6225zmA
KN8qzUuqT5+1ZbiARx1utLkXKeozBiTFwpAE1oB23PwEppaYrpqwFW7Q57SKW298
77q60s+ixfc/hMihaBONDDtY6IXBWINMdHnO8hE2NhwNKUh8trxj8MWj5fyFIpys
mPiXzsauMu91fNjWzeOry/uEp64j0me8VdI+J+rdw6/IB8z8wk+CECOMZkCNfCDE
uO0dKHp8n+JzKcez++T0DLDgV+gb9Q==
=/Cit
-----END PGP SIGNATURE-----

--HanN3xENTWRnEyHv--


