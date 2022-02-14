Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0854B54D8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:34:55 +0100 (CET)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdNO-0005Z3-E3
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:34:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcUb-00011W-RJ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJcUU-0001GP-Q6
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644849490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nRbNO+C4w/r8HXZ4+tBd6DDaNwIldgzDFkp209HYKmM=;
 b=Pu8EzykdKNv0y1bzB0cThM8Ae8wCvJ0bzsECWLFtBEsOjbfTI3rE/aHgzc4fr1CCCAdG02
 vqbDQyTovhPHn//EEuzVRrHx98b3ujeiNXe5iXbsJAs+fMajTIU+sTjbA7YgjxSRLfEm2b
 ViHOfIE3WX8QmOtiaoWlD8+ER/XCBi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-C-3KK2e4OSGe_xk8wyHiBQ-1; Mon, 14 Feb 2022 09:38:08 -0500
X-MC-Unique: C-3KK2e4OSGe_xk8wyHiBQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFDB81006AA4;
 Mon, 14 Feb 2022 14:38:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A80D752AC;
 Mon, 14 Feb 2022 14:37:22 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:37:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
Message-ID: <YgppIUOpkYUKwB5K@stefanha-x1.localdomain>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hfvLp3MDh+ICRtb0"
Content-Disposition: inline
In-Reply-To: <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hfvLp3MDh+ICRtb0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 11:22:18PM -0800, Elena Ufimtseva wrote:
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> ---
>  meson.build                    |  15 ++-
>  qapi/qom.json                  |  32 +++++-
>  include/hw/remote/ioregionfd.h |  40 +++++++
>  hw/remote/ioregionfd.c         | 196 +++++++++++++++++++++++++++++++++
>  Kconfig.host                   |   3 +
>  MAINTAINERS                    |   2 +
>  hw/remote/Kconfig              |   4 +
>  hw/remote/meson.build          |   1 +
>  meson_options.txt              |   2 +
>  scripts/meson-buildoptions.sh  |   3 +
>  10 files changed, 294 insertions(+), 4 deletions(-)
>  create mode 100644 include/hw/remote/ioregionfd.h
>  create mode 100644 hw/remote/ioregionfd.c
>=20
> diff --git a/meson.build b/meson.build
> index 96de1a6ef9..6483e754bd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -258,6 +258,17 @@ if targetos !=3D 'linux' and get_option('multiproces=
s').enabled()
>  endif
>  multiprocess_allowed =3D targetos =3D=3D 'linux' and not get_option('mul=
tiprocess').disabled()
> =20
> +# TODO: drop this limitation

What is the reason for the limitation?

> +if not multiprocess_allowed and not get_option('ioregionfd').disabled()
> +  error('To enable ioregiofd support, enable mutliprocess option.')

s/ioregiofd/ioregionfd/

--hfvLp3MDh+ICRtb0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIKaSEACgkQnKSrs4Gr
c8gHlgf+N4pxOMRCuGukU3vJc5DoPJorg6byiNyqbFDIt7xt2CxTm+hQ/xEphizG
TfaD2tHSNiNhZWwpkjcPHzD33EXCNje3Ov4VQMN2JyeieTvacNdYt4aZdm9XgPjq
u0AbvmT4d+UENU4zJ+qIxlG49gLWZuKKppog+Mm+9NFW6OTvV/M8aiU3zKRT4OgI
toKldX5YWajxELjkvGtRsEoU/aMu45IeynyGsFifhIlNowZO5+IT7B14wvOUznxE
q4dcc0ymOwvs0W3cfzL9jehwObn9kqQ0EEXjn9yD8OI2e9S59f8R+dFWcKUVqfGO
pH1PMA+ZnvspNG0KJmtkEsNkSvA+hA==
=8dfR
-----END PGP SIGNATURE-----

--hfvLp3MDh+ICRtb0--


