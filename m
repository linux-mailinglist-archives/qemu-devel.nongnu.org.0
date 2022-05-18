Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0252052BB67
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:17:26 +0200 (CEST)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJYK-0005rs-Su
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJV3-0002Z9-CA
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrJV1-0007nk-KH
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652879638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0rWT0a/snYWIeW0hq267RFKCulAVKaFD4+0A9LQSkN8=;
 b=hHB9xfQZhYaa5ul1DotIJbjUg3m7NHPpZGexfnf9GgBOPuZtsmfANwqXBqqDF5NsdEb2YA
 iRqRQ2Qc9PSJ15aWcX8erAqndG8p7JeepWFn3fWYJDAPWGbMCbUW7+v3q1liq9gqoUqQMR
 QCC/ZD/mh5RAhJMf/37rEBS4SDY0VEM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-o8GxebBDM6G6Bjr5tjfiPw-1; Wed, 18 May 2022 09:13:55 -0400
X-MC-Unique: o8GxebBDM6G6Bjr5tjfiPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17304395AFF1;
 Wed, 18 May 2022 13:13:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0ADB400E118;
 Wed, 18 May 2022 13:13:54 +0000 (UTC)
Date: Wed, 18 May 2022 14:13:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 3/8] block/export: Abstract out the logic of
 virtio-blk I/O process
Message-ID: <YoTxEbiG3i0SZx7e@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-4-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aEa3FGLJprIAySfx"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-4-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--aEa3FGLJprIAySfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2022 at 03:40:46PM +0800, Xie Yongji wrote:
> -static void vu_blk_req_complete(VuBlkReq *req)
> +static void vu_blk_req_complete(VuBlkReq *req, size_t in_len)
>  {
>      VuDev *vu_dev =3D &req->server->vu_dev;
> =20
> -    /* IO size with 1 extra status byte */
> -    vu_queue_push(vu_dev, req->vq, &req->elem, req->size + 1);
> +    vu_queue_push(vu_dev, req->vq, &req->elem, in_len);

I think this silently fixes a bug: now the correct len value is
calculated. Before the I/O buffer wasn't counted in read requests.
Please mention this in the commit description.

> +static bool virtio_blk_sect_range_ok(BlockBackend *blk,
> +                                     uint64_t sector, size_t size)
> +{
> +    uint64_t nb_sectors;
> +    uint64_t total_sectors;
> +
> +    if (size % VIRTIO_BLK_SECTOR_SIZE) {
> +        return false;
> +    }
> +
> +    nb_sectors =3D size >> VIRTIO_BLK_SECTOR_BITS;
> +
> +    QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE !=3D VIRTIO_BLK_SECTOR_SIZE);
> +    if (nb_sectors > BDRV_REQUEST_MAX_SECTORS) {
> +        return false;
> +    }
> +    if ((sector << VIRTIO_BLK_SECTOR_BITS) % blk_get_guest_block_size(bl=
k)) {

Please use VirtioBlkHandler->logical_block_size instead (see below).

> +int coroutine_fn virtio_blk_process_req(BlockBackend *blk, bool writable,
> +                                        const char *serial,

I suggest defining a struct instead of passing individual arguments:

  typedef struct {
      BlockBackend *blk;
      const char *serial;
      uint32_t logical_block_size;
      bool writable;
  } VirtioBlkHandler;

--aEa3FGLJprIAySfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE8REACgkQnKSrs4Gr
c8jtxQgApMw+LrvHLoe9M3QiViujXSJhz3tniyvSCFHQDBPiuuxH6Ug8XqWqek7g
jrc14xAO84/TxGLZu2cvj0rx82zwH8r6iMChTyeK2auNza/Ir0NQMReTazJ6UGME
VkeNtDhI0TT6yWOY2XA2bDrg7Re6B0ate/lDZIcrxLYTyBEu4H74nC4Ejdmtuxsi
dF5qfNvus7kN1v+lRp+JDFjsS+qj5yEHoht5jACODFroMtbyD3UBmuhCyM5J8cU/
7eu55zqxC0Vazt1Y1VjRo0pgRCyX9huxLL8iFOlJ7R7K/0bcY3bUuF5vBSxzzXcY
AkHYBx0U7A8cCTg4FSLYFI6btu9LXA==
=GZ2x
-----END PGP SIGNATURE-----

--aEa3FGLJprIAySfx--


