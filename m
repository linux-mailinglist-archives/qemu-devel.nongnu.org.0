Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B035C53417D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:27:04 +0200 (CEST)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttqh-0006Q4-PL
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttV3-00022k-OL
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nttUw-0004Pp-6L
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653494670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y7QgdGQdHKPkJwFgoue4J2A7RG3TmmlDyrbzo+wa/Io=;
 b=HGhAhCN71lsTb1s5NGLi3YLM+lWH79okRQmgL+zi3F0inBMB9tOeN65ozIB0HAoH4I67Bt
 fyKLzy2eyoz9+Ag4fp88/9q7skT7pHlj8Ku3Zorg3rRshBPhtos1yQCLu+t6o9y+rdK9VC
 ro26MvhlE5KUt/3A0vJuUNu/54cbG40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-2KZ2nVbwOmeclPb71SgY2A-1; Wed, 25 May 2022 12:04:29 -0400
X-MC-Unique: 2KZ2nVbwOmeclPb71SgY2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89A7101A54E;
 Wed, 25 May 2022 16:04:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D9691121315;
 Wed, 25 May 2022 16:04:28 +0000 (UTC)
Date: Wed, 25 May 2022 17:04:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH  v2 02/15] include/hw/virtio: more comment for
 VIRTIO_F_BAD_FEATURE
Message-ID: <Yo5Ti8dTjXL7nKKm@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
 <20220524154056.2896913-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g6nObnnOd3hZb55d"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g6nObnnOd3hZb55d
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:43PM +0100, Alex Benn=E9e wrote:
> When debugging a new vhost user you may be surprised to see
> VHOST_USER_F_PROTOCOL getting squashed in the maze of
> backend_features, acked_features and guest_features. Expand the
> description here to help the next poor soul trying to work through
> this.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> ---
>  include/hw/virtio/virtio.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index db1c0ddf6b..2b2587d324 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -24,7 +24,12 @@
>  #include "qom/object.h"
>  #include "hw/virtio/vhost.h"
> =20
> -/* A guest should never accept this.  It implies negotiation is broken. =
*/
> +/*
> + * A guest should never accept this.  It implies negotiation is
> + * broken between the driver frontend and the device. This bit is
> + * re-used for vhost to advertise VHOST_USER_F_PROTOCOL_FEATURES

s/vhost/vhost-user/

> + * between QEMU and a vhost backend.
> + */
>  #define VIRTIO_F_BAD_FEATURE		30
> =20
>  #define VIRTIO_LEGACY_FEATURES ((0x1ULL << VIRTIO_F_BAD_FEATURE) | \
> --=20
> 2.30.2
>=20

--g6nObnnOd3hZb55d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOU4sACgkQnKSrs4Gr
c8hfFwgAs/6fPKZfvgmT9w/tXapgcTBRkrDvFmkjGAMe0Krp4jeXpfygZ88Q3PAp
Lrl9LodZOSTCTEzKe3UbJazbyJ6hsF57wZSasVy4/xg+S9jD7YFb1DiGDi9n/bLg
d0xroNJNYTU5AXhBiqRw68c7bQ1B/hefxEb8cb1W0ewUhFxNtCKGfpMi7Tc+ejBI
W3rZEy67CWKrUciYlI+yUn2jlvHkcYTDYcZzFAR1z917IY7c1RrUg4CWgYb3WCo3
pdQsKLvKD7QCIf+uf9IKE+wOGj5ONCOEV6+Qd0s5ahDmb4X4Ar7hLi/l+Qgl1sq1
zQWR6/pS9XqSko67xVkuNXgp2YKNdQ==
=PnZH
-----END PGP SIGNATURE-----

--g6nObnnOd3hZb55d--


