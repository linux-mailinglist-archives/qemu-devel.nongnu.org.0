Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554D25F62BB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:33:22 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMJl-0005br-8V
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2K-00013t-WF
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:21 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36227
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1ogM2G-00033e-Bn
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:15:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Mjkl31qKSz4xGn; Thu,  6 Oct 2022 19:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1665044111;
 bh=WtfyQadjhbdAzhznKpkuHh85DojvFARS9q3SQHsVpdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CVmPOZFhs8U5OZAl7b85r5BacPw5luUhcLH02998g8Iap0YWWkABP48lXOAQdX9ll
 vgl69s36T0xTSFuxwfnGzQgzDFB2HPNBwgqAeUoYF4VZpTVRR5BxEvx2I/LTaN5WvB
 H6xzISdKX4rjxwlY502raRNgsMIVBgJkwEHIw9Rc=
Date: Thu, 6 Oct 2022 19:13:51 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v10 07/17] net: socket: Don't ignore EINVAL on netdev
 socket connection
Message-ID: <Yz6OP3sBr9Toi9iS@yekko>
References: <20221005162051.1120041-1-lvivier@redhat.com>
 <20221005162051.1120041-8-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tPZSyIBM9WRd+fOf"
Content-Disposition: inline
In-Reply-To: <20221005162051.1120041-8-lvivier@redhat.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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


--tPZSyIBM9WRd+fOf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:20:41PM +0200, Laurent Vivier wrote:
> From: Stefano Brivio <sbrivio@redhat.com>
>=20
> Other errors are treated as failure by net_socket_connect_init(),
> but if connect() returns EINVAL, we'll fail silently. Remove the
> related exception.
>=20
> Signed-off-by: Stefano Brivio <sbrivio@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  net/socket.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/net/socket.c b/net/socket.c
> index ade1ecf38b87..4944bb70d580 100644
> --- a/net/socket.c
> +++ b/net/socket.c
> @@ -577,8 +577,7 @@ static int net_socket_connect_init(NetClientState *pe=
er,
>              if (errno =3D=3D EINTR || errno =3D=3D EWOULDBLOCK) {
>                  /* continue */
>              } else if (errno =3D=3D EINPROGRESS ||
> -                       errno =3D=3D EALREADY ||
> -                       errno =3D=3D EINVAL) {
> +                       errno =3D=3D EALREADY) {
>                  break;
>              } else {
>                  error_setg_errno(errp, errno, "can't connect socket");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tPZSyIBM9WRd+fOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmM+ji8ACgkQgypY4gEw
YSJ3BQ/9Hr2I9yNhOMNbQ4qoAq1XNw8uervrvRWral/six07PMfmqsy0M6QgeVij
cgNiqyc6uK56jQ+l1YmhuzrxwV3p02YRjKpg55Cf7sPbaX75k7GKz+Foxaeqir+3
fLjCpSUdl+im3w1qOh5bqvvxLr9u7MP9KPsIacVFMcO0ghaBoq87rYDsPxFpDLUh
goBGJmsEWmVFm/ovSLjAK9EXw1IbVLXObE5SObZ1b+/WH1PkQqMFLz9hbqhih1BB
3ch/bjvIacGLffv7LXaZDR3iUNx2zMBMKK8Uw7lo9Br/0zROB0rXcFcqW6D9sJE+
iGzbCLT7GvIbGQsatbIcyNG6uxhvkdjNNcwJ7NRW/4mI/eL6HxcOn5t0evq5oBJU
lmibIaTsnjjr+8omokow70t4LlYnNpNTuicvOCSE72QGHhCd2e/OwXHeOGCklm1l
fuSkCykWWHcI4ma7KvW8eD5CU8PVtfxov/wywvohytbyG1n9zwWhU2KBh5JkcRc7
RVqSlruUq7+lBz50WZZLantc1g93/PlKN5e97c2ATg7GRSgs8MN+ICfrfbulv4ST
Uazud/eRwwIYFTQwGw8NCCzfeCjTXEkpYC+QXLRAJnsNNjEu2xarZtd9lK2eoroO
DRG/dlLRil68Vjj6kznRyY+dzgyk3ug+NoHyqOSMBF1LHT5A6Gg=
=klwa
-----END PGP SIGNATURE-----

--tPZSyIBM9WRd+fOf--

