Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B959CD6B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:56:24 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQIDO-0005xp-Jh
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQIBr-0004LY-5f
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 20:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oQIBo-0003eC-Oo
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 20:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661216083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LZlILwL28xYDDKwLls5ENdCht/tEGQ+IhrU3XcKwhno=;
 b=JPsb7WNRYXrub/+IhyDjZB/JFy7uIc22syRirbdlD2DuSGqi0PU7+cQZ5s9CfRX6uO8dCf
 Q4Z/DWW+N8CZnFuqz3EHqC/iSqMakw9R3wd6qpzT6QoHZ0GKw4nBgVsQHUqDm1+/wLzKpj
 enAbL/lqa1bYWpk9NrY2HWLeZwDXWq8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-qGrrKaWHMAyY9FgWV_DzZQ-1; Mon, 22 Aug 2022 20:54:39 -0400
X-MC-Unique: qGrrKaWHMAyY9FgWV_DzZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEDBD38149AA;
 Tue, 23 Aug 2022 00:54:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 596C540D2830;
 Tue, 23 Aug 2022 00:54:38 +0000 (UTC)
Date: Mon, 22 Aug 2022 20:54:36 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com
Subject: Re: [PATCH v7 6/8] config: add check to block layer
Message-ID: <YwQlTFHqKqjurCgb@fedora>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-7-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9I9Db+DCRcTJQze6"
Content-Disposition: inline
In-Reply-To: <20220816062522.85714-7-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--9I9Db+DCRcTJQze6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 02:25:20PM +0800, Sam Li wrote:
> Putting zoned/non-zoned BlockDrivers on top of each other is not
> allowed.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block.c                          | 14 ++++++++++++++
>  block/raw-format.c               |  1 +
>  include/block/block_int-common.h |  5 +++++
>  3 files changed, 20 insertions(+)
>=20
> diff --git a/block.c b/block.c
> index bc85f46eed..affe6c597e 100644
> --- a/block.c
> +++ b/block.c
> @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs, B=
lockDriverState *child_bs,
>          return;
>      }
> =20
> +    /*
> +     * Non-zoned block drivers do not follow zoned storage constraints
> +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zo=
ned
> +     * drivers in a graph.
> +     */
> +    if (!parent_bs->drv->supports_zoned_children &&
> +        child_bs->bl.zoned !=3D BLK_Z_HM) {

Is this logical expression correct:

  If the parent does not support zoned children and the child is not
  zoned, fail with an error.

?

> +        error_setg(errp, "Cannot add a %s child to a %s parent",
> +                   child_bs->bl.zoned =3D=3D BLK_Z_HM ? "zoned" : "non-z=
oned",
> +                   parent_bs->drv->supports_zoned_children ?
> +                   "support zoned children" : "not support zoned childre=
n");
> +        return;
> +    }
> +
>      if (!QLIST_EMPTY(&child_bs->parents)) {
>          error_setg(errp, "The node %s already has a parent",
>                     child_bs->node_name);
> diff --git a/block/raw-format.c b/block/raw-format.c
> index 6b20bd22ef..9441536819 100644
> --- a/block/raw-format.c
> +++ b/block/raw-format.c
> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, Bdrv=
Child *c,
>  BlockDriver bdrv_raw =3D {
>      .format_name          =3D "raw",
>      .instance_size        =3D sizeof(BDRVRawState),
> +    .supports_zoned_children =3D true,
>      .bdrv_probe           =3D &raw_probe,
>      .bdrv_reopen_prepare  =3D &raw_reopen_prepare,
>      .bdrv_reopen_commit   =3D &raw_reopen_commit,
> diff --git a/include/block/block_int-common.h b/include/block/block_int-c=
ommon.h
> index de44c7b6f4..4c44592b59 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -126,6 +126,11 @@ struct BlockDriver {
>       */
>      bool is_format;
> =20
> +    /*
> +     * Set to true if the BlockDriver supports zoned children.
> +     */
> +    bool supports_zoned_children;
> +
>      /*
>       * Drivers not implementing bdrv_parse_filename nor bdrv_open should=
 have
>       * this field set to true, except ones that are defined only by their
> --=20
> 2.37.1
>=20

--9I9Db+DCRcTJQze6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMEJUwACgkQnKSrs4Gr
c8hecQf+Ode+yfkiUe8LvYTeAEhdvi0YcfuhXXXhRPHkCTuFZpwLaDoEL8uS2Dvo
GNGkL2My71zFcitJ5r0g6gJ+aR6NYKiTeM/Up2d3wScISvXySz61guY2rFqT2tE5
oMEeo6TLT1ryvCWWpEalcB9Usoc0o3xRdKQCo4mqdz8Oa6DwVYylTF8JTnFIQ2VS
oamgti4sG2cnuan7LCq2QYaEFeeYYILmPpfTOxiCudEiIOUc8MwY2yqucOA1zBDG
UV0BMAwDuHLHTyDi1axVSjChPMbdrgZ78SzsUdFhrM8seOUJs4E1vG6FwJUXZmPS
B57wsSjbCcKZTBAmq2fAskpHNo49RA==
=VIkN
-----END PGP SIGNATURE-----

--9I9Db+DCRcTJQze6--


