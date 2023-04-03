Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2106D4EA8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 19:10:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjNgf-0002gT-8M; Mon, 03 Apr 2023 13:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNgd-0002g5-7V
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:09:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjNgb-0000kD-OC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 13:09:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680541777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UAn5fO/3J1SClsAcQ0JNLt/eeXrO8G1ppbF0KFyIYOE=;
 b=VVAWXwS0i6M3Tyqg0AI4yWhQzKTIhB7pibFo4BUqH478tHMcZHhiZl/uAmRFxWgBrSmJwv
 LfOqNdGHf1UzYbGw9obxn/wtSr9w0xwQcEDUYLFXhnJK9zNwkXtmKRoo26UpjaNnBvEtlU
 cygJOBDlVnYvZ0+dmu27zakVAkLf7Tk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-MEF5A_4gM06afGUCJmQiKQ-1; Mon, 03 Apr 2023 13:09:34 -0400
X-MC-Unique: MEF5A_4gM06afGUCJmQiKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0562E85530F;
 Mon,  3 Apr 2023 17:09:34 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65AE340C6EC4;
 Mon,  3 Apr 2023 17:09:33 +0000 (UTC)
Date: Mon, 3 Apr 2023 13:09:31 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, hare@suse.de,
 Fam Zheng <fam@euphon.net>, dmitry.fomichev@wdc.com,
 damien.lemoal@opensource.wdc.com, Julia Suvorova <jusual@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v7 2/4] block: introduce zone append write for zoned
 devices
Message-ID: <20230403170931.GC318024@fedora>
References: <20230323051907.5948-1-faithilikerun@gmail.com>
 <20230323051907.5948-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DYAvc6hnLg+T10qr"
Content-Disposition: inline
In-Reply-To: <20230323051907.5948-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--DYAvc6hnLg+T10qr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 01:19:05PM +0800, Sam Li wrote:
> diff --git a/block/io.c b/block/io.c
> index 5dbf1e50f2..fe9cabaaf6 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3152,6 +3152,27 @@ out:
>      return co.ret;
>  }
> =20
> +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *offs=
et,
> +                        QEMUIOVector *qiov,
> +                        BdrvRequestFlags flags)
> +{
> +    BlockDriver *drv =3D bs->drv;
> +    CoroutineIOCompletion co =3D {
> +            .coroutine =3D qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || !drv->bdrv_co_zone_append || bs->bl.zoned =3D=3D BLK_Z_N=
ONE) {
> +        co.ret =3D -ENOTSUP;
> +        goto out;
> +    }

No bdrv_check_qiov_request()? We need to validate inputs. For example,
code later on assumes that offset / bs.bl.zone_size < bs.bl.nr_zones.

> +    co.ret =3D drv->bdrv_co_zone_append(bs, offset, qiov, flags);
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}

--DYAvc6hnLg+T10qr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQrCEsACgkQnKSrs4Gr
c8hLYggAhBGR7GdVK26P6mt5Ho1TVly8361eSKN0Gga37s597LVHQR3zkNxMz7rI
M2vNHuhaGRbWvfZA/SJ18LFrtzHwhInLnXKSEY76NY74wEf6lx18rkRnph2j5EMS
2Knz18qRom1uMdvQakdTJ3WcZG2hSRGTWK6385cFCLG278OUxaxgtJgSeMNYxe9V
0GBitCT9CUsx6HvvTp/zoCF6DW8fwFze8IAko+IlQpre+jqBd/nXHkaF89yJYWWI
KMIfTovLRz6f8kGm4XK3mf+2vhqslIp1E9RgMb0J0XQxTzJ4dnwgF9pys0Zkplgf
Q4ue8hLMaqaWeOTzhnGeVvkEpTgZ+g==
=CeP9
-----END PGP SIGNATURE-----

--DYAvc6hnLg+T10qr--


