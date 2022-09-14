Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2A5B8069
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:56:07 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKRS-0002JR-AL
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDr-00045q-G1
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:03 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oYKDl-0005tN-Vj
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:42:03 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MS72z4MGGz4xGC; Wed, 14 Sep 2022 14:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1663130507;
 bh=+iz76pSlP5xawfAju6RR3TzW8UgPa1nLw3+YCcPrlzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrHxYL8LVP7RTVVhZNd5c4Z8UV9WgJ+bZF2mPJMu8Uy/wo+ZO/VIydXnaehPrCfvn
 0lVQabigMvMYfCOk9SZiTquwsLc9cV5ULNtzdbVr2ATQvdCv5trbveIU3pb39wqidL
 +d8AIJDFvBKG+TABvp6JI+Zy6L2DYGzkZwSy2mPw=
Date: Wed, 14 Sep 2022 12:28:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 02/14] net: remove the @errp argument of
 net_client_inits()
Message-ID: <YyE8TRYC67W+36z1@yekko>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-3-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wWJ7mNMbDhV8DvBs"
Content-Disposition: inline
In-Reply-To: <20220913064000.79353-3-lvivier@redhat.com>
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


--wWJ7mNMbDhV8DvBs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2022 at 08:39:48AM +0200, Laurent Vivier wrote:
> The only caller passes &error_fatal, so use this directly in the function.
>=20
> It's what we do for -blockdev, -device, and -object.
>=20
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/net/net.h |  2 +-
>  net/net.c         | 20 +++++++-------------
>  softmmu/vl.c      |  2 +-
>  3 files changed, 9 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/net/net.h b/include/net/net.h
> index 81d0b21defce..c1c34a58f849 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -222,7 +222,7 @@ extern const char *host_net_devices[];
>  /* from net.c */
>  int net_client_parse(QemuOptsList *opts_list, const char *str);
>  void show_netdevs(void);
> -int net_init_clients(Error **errp);
> +void net_init_clients(void);
>  void net_check_clients(void);
>  void net_cleanup(void);
>  void hmp_host_net_add(Monitor *mon, const QDict *qdict);
> diff --git a/net/net.c b/net/net.c
> index d2288bd3a929..15958f881776 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1562,27 +1562,21 @@ out:
>      return ret;
>  }
> =20
> -int net_init_clients(Error **errp)
> +void net_init_clients(void)
>  {
>      net_change_state_entry =3D
>          qemu_add_vm_change_state_handler(net_vm_change_state_handler, NU=
LL);
> =20
>      QTAILQ_INIT(&net_clients);
> =20
> -    if (qemu_opts_foreach(qemu_find_opts("netdev"),
> -                          net_init_netdev, NULL, errp)) {
> -        return -1;
> -    }
> -
> -    if (qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL, er=
rp)) {
> -        return -1;
> -    }
> +    qemu_opts_foreach(qemu_find_opts("netdev"), net_init_netdev, NULL,
> +                      &error_fatal);
> =20
> -    if (qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL, =
errp)) {
> -        return -1;
> -    }
> +    qemu_opts_foreach(qemu_find_opts("nic"), net_param_nic, NULL,
> +                      &error_fatal);
> =20
> -    return 0;
> +    qemu_opts_foreach(qemu_find_opts("net"), net_init_client, NULL,
> +                      &error_fatal);
>  }
> =20
>  int net_client_parse(QemuOptsList *opts_list, const char *optarg)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index dea4005e4791..1fe8b5c5a120 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1906,7 +1906,7 @@ static void qemu_create_late_backends(void)
>          qtest_server_init(qtest_chrdev, qtest_log, &error_fatal);
>      }
> =20
> -    net_init_clients(&error_fatal);
> +    net_init_clients();
> =20
>      object_option_foreach_add(object_create_late);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wWJ7mNMbDhV8DvBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMhPDQACgkQgypY4gEw
YSLFPg/+Jt86DE523YNcc8fwlEUfY+gIZzuWuHICeohMAFs0jhYSBZ4WjSTIU9sd
Dez8ZOfyaunLfrJUfbQc6jeYNPtg4/EAE8Dytn3bv7PFdds9sxhGFoGZ1Z9A4cWq
uDQV6OjEK1Jmid8I4qp27U66ppe/XQ58ymY/ysAR7z7Gj1hooiSSy2wems9ZLC6n
HRuICedPKT5hEbUrnJwBQuiYhsdfLCIZKUm8HUHYHFmmnUF6L+EOr+h9WkOg6opp
DkVXR1hXAlw+AGllMeuwWCu+PYizAMaaKNnEwXvWbOphCHp+AVqV6i35Mh1/QOkZ
IeRHGeID0WgkbnOCTcinm98MuQzI9wTmcK5KfdE+X5EBc1C65Y81g5KsdHGjtkGp
qykjPIfTlJgWwAQ5NR8qPtjZiiLs9tevohSx5Hpa6jzWea9dpokazXiMqKTF6eSh
NJapKUat3iW3Vu77qSXUnEclszbCRaPAHH7ZLegMvE4YYEhY2aHUNlUEL3QagCIM
KmDzj/3F5rHTt2ZDqUSi24VFMu2ptISmWxTSr2jWdb2Eb7tjfgaLglsRrzFSfAA6
DSrLyr0RUfR0ifsex8v94dDrupGHQ2Lk+hsjqWSZg6PCKJPXeanTsy/r5iMBxj+K
rAlT6JBpc51V2i1lxLBt5BHwJnRvVFy2/9YtigwZqP5NKxBMjo8=
=OwGO
-----END PGP SIGNATURE-----

--wWJ7mNMbDhV8DvBs--

