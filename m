Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9107330900
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:55:54 +0100 (CET)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJAk5-00046G-NW
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lJAii-0003Zt-Tn
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:54:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1lJAih-00031V-68
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615190065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AIpvswgW7d6PBJKGKulZ/r+ntCDlOKxtaGOHbSwAd/Q=;
 b=SF22uTJroVoS5VyK81oTNRlz1OLYR0NSyTajzueo5/24imKr8kG9J3DhS3T9rQR7KKx1Km
 lVhVzwlbdQkY8QzkVdgv/RA0S12/SY/kv5yAMnN+heyKOdy7XclQpXD330DYkddF7VWArl
 hMc6uHs0GPYRdQXzcoYEtSjd7jwfLkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Osk1gkCGNaaUvAzySRDBkg-1; Mon, 08 Mar 2021 02:54:23 -0500
X-MC-Unique: Osk1gkCGNaaUvAzySRDBkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB39881280;
 Mon,  8 Mar 2021 07:54:22 +0000 (UTC)
Received: from localhost (ovpn-112-77.rdu2.redhat.com [10.10.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E16019CB1;
 Mon,  8 Mar 2021 07:54:18 +0000 (UTC)
Date: Mon, 8 Mar 2021 08:54:17 +0100
From: Sergio Lopez <slp@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Add qemu version and copyright info
Message-ID: <20210308075351.f27qzek6nqmbfcwi@mhamilton>
References: <20210303195339.GB3793@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210303195339.GB3793@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6vu3aumytw2is7vc"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, eric.g.ernst@gmail.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--6vu3aumytw2is7vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 02:53:39PM -0500, Vivek Goyal wrote:
> Option "-V" currently displays the fuse protocol version virtiofsd is
> using. For example, I see this.
>=20
> $ ./virtiofsd -V
> "using FUSE kernel interface version 7.33"
>=20
> People also want to know software version of virtiofsd so that they can
> figure out if a certain fix is part of currently running virtiofsd or
> not. Eric Ernst ran into this issue.
>=20
> David Gilbert thinks that it probably is best that we simply carry the
> qemu version and display that information given we are part of qemu
> tree.=20
>=20
> So this patch enhances version information and also adds qemu version
> and copyright info. Not sure if copyright information is supposed
> to be displayed along with version info. Given qemu-storage-daemon
> and other utilities are doing it, so I continued with same pattern.
> This is how now output looks like.
>=20
> $ ./virtiofsd -V
> virtiofsd version 5.2.50 (v5.2.0-2357-gcbcf09872a-dirty)
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
> using FUSE kernel interface version 7.33
>=20
> Reported-by: Eric Ernst <eric.g.ernst@gmail.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c |    8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>

> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c=092021-03-03 14:2=
8:04.893672524 -0500
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c=092021-03-03 14:37:29.=
381712706 -0500
> @@ -37,6 +37,8 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
> +#include "qemu-version.h"
> +#include "qemu-common.h"
>  #include "fuse_virtio.h"
>  #include "fuse_log.h"
>  #include "fuse_lowlevel.h"
> @@ -3591,6 +3593,11 @@ static void fuse_lo_data_cleanup(struct
>      free(lo->source);
>  }
> =20
> +static void qemu_version(void)
> +{
> +    printf("virtiofsd version " QEMU_FULL_VERSION "\n" QEMU_COPYRIGHT "\=
n");
> +}
> +
>  int main(int argc, char *argv[])
>  {
>      struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
> @@ -3662,6 +3669,7 @@ int main(int argc, char *argv[])
>          ret =3D 0;
>          goto err_out1;
>      } else if (opts.show_version) {
> +        qemu_version();
>          fuse_lowlevel_version();
>          ret =3D 0;
>          goto err_out1;
>=20
>=20

--6vu3aumytw2is7vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmBF2CgACgkQ9GknjS8M
AjWnYBAAhTrft37VvzPpmwhUEvRe5FjCJxn6RpHmMPH05QuDEIF8RktS3upDfxVj
UD68Aa/XZTVMfW4fpjPYxsQhtr85Fb1cqfISAK8awnYpozLlPbBO2H7tTg79oXsS
Kiuf0GfO3Q7W0fIZLtUc1CW3GPVVeK44nRc5gRDOc5bAqpWxw50p2qIZs+u2ol+O
97LlNPR2krVC3ZftkBRx0fI9h3mTDLhkdAtl+EtBNtx4+WeHi1Yw1Xl1nn3sqNdj
XXGQzsnaSdmu7FqNzOlXd2EEutjBxr1CEP+CxiMWobcQiH52ejCP8t8V0gqAeTgp
ghZAT9VEsvY0+srlcqv1jo9Uk4Mm0pvQtQmpDQXBgr0z75pppQC1Ko7lnLQnWpaq
Gp7KRLbUNuq5lx1Dszhfle9y7ekNqwn34B8ifq2wVXhCj+c8n5K8F3h2CtLp4Ji4
wKDVKvlXDtkrAHbB1N45vFGU/B0Wc0e03RsRlbdNwuq2DDsE2ustOg6yDTkIVlpi
lyKVAbT6uBrk6qi9K5Ku9r50mVc8b2sRjoqmaM1WffmeQqRAcYYXI176q0bKFf+N
5kvGhEQIwGUqpkp846kPbooTpkp9dX2GW1csIxQis0dZdG4lTYeRfQX+j7NVIgkt
t+HhfCyZd5kWKZjxoywbvgOK58ekBwff0aJmnniJLRrmsR9kcx0=
=e5r9
-----END PGP SIGNATURE-----

--6vu3aumytw2is7vc--


