Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FC849C812
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:53:16 +0100 (CET)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfvP-00075H-C3
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:53:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCfsM-0005e5-Qj
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCfsG-00047l-TO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643194200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ai0ZifZPRg3VYu9pJNbngYM2UiqWtEiH54NENUXR+Cc=;
 b=hWcH4UZume2i2DjAkbrHdoFQVnPmpqh/scpeQBHsnq7CyXhlRNUJWhIg+ZHC32dfGBrD2N
 OoZVHEZd+fMc/xHWsumUVf3fNq+jpcC5Jeznzvi/CvRLBZDe1lNDUt7titcqZBSvDzp4p2
 QZ+hWttKblQx9pnsGFZPtQn+GOXELFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-2_ptXxJFMp--8fu1ZWzkOA-1; Wed, 26 Jan 2022 05:49:57 -0500
X-MC-Unique: 2_ptXxJFMp--8fu1ZWzkOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB9493921;
 Wed, 26 Jan 2022 10:49:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EC21F308;
 Wed, 26 Jan 2022 10:49:53 +0000 (UTC)
Date: Wed, 26 Jan 2022 10:49:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 01/12] introduce BDRV_POLL_WHILE_UNLOCKED
Message-ID: <YfEnUG2m2AlvJqpE@stefanha-x1.localdomain>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PMkVlNM4KrKvBW1V"
Content-Disposition: inline
In-Reply-To: <20220118162738.1366281-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PMkVlNM4KrKvBW1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 18, 2022 at 11:27:27AM -0500, Emanuele Giuseppe Esposito wrote:
> Same as BDRV_POLL_WHILE, but uses AIO_WAIT_WHILE_UNLOCKED.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block-global-state.h | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/include/block/block-global-state.h b/include/block/block-glo=
bal-state.h
> index 419fe8427f..7ad9496f56 100644
> --- a/include/block/block-global-state.h
> +++ b/include/block/block-global-state.h
> @@ -158,6 +158,11 @@ void bdrv_drain_all(void);
>      AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
>                     cond); })
> =20
> +#define BDRV_POLL_WHILE_UNLOCKED(bs, cond) ({              \
> +    BlockDriverState *bs_ =3D (bs);                          \
> +    AIO_WAIT_WHILE_UNLOCKED(bdrv_get_aio_context(bs_),     \
> +                            cond); })

No doc comments? When and why is this API useful? Are there any
preconditions or assumptions (e.g. cond must be thread-safe)?

Stefan

--PMkVlNM4KrKvBW1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxJ1AACgkQnKSrs4Gr
c8gUHAgAglCxiPuBO4mjRHcoxXCXEzxg1aVT+8II709C1HzhWopV/G+ogbd1Mu+1
FJjPy74YCp3hznqTCjw8QRsrwsI01U+KE+fj99iV/u7jz2fVU5lpAhdtF0G0zUne
3lbrLcMM3kaAyUlxkOnTkCmewCORSugMuqVrTZC+PmCRaQLphyGTKV2RMeI5A7ow
8rCEGRmTEnMO2ekKJ4FU3bqQxuf0e6JHnTdy+RKqk8aEAc2HGmQx6V7XAxjhpGw+
XSUADjSeLxMdrwk2D4+KC6D4fVLmRXcSwAbBo8ot3BCb6wrvtaNCL3GD5YOq78fM
/OHDkx8fvr2BsxzPusKHV1OayalEbg==
=Pkxr
-----END PGP SIGNATURE-----

--PMkVlNM4KrKvBW1V--


