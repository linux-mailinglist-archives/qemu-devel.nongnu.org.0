Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E86A4AA6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 20:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWixG-0004lt-7B; Mon, 27 Feb 2023 14:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pWixE-0004lW-AI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pWixC-0007lN-Pp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 14:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677525269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IdkWxOFYr+x8DwOBIYfcZ0I9ImrdlutHyynwl1OkOMA=;
 b=faywaynZ0FZJ1vnhQX/SQ7nM4ED2mVob4oDzV31bhdiSd9b0qZJYlL+fPsenukMBmNsxTR
 x8zRmGt7AaZ2U241wTA2EoPVcHcIB1KCtyenG+Q6TzkpjUSnBDxBZMDvmLmXQmFUPGLABe
 RhV+qM78PVbfX6dzJS0/mTHd/ddNvuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-0xxA6cqeMEyfmSmmfn-25w-1; Mon, 27 Feb 2023 14:14:26 -0500
X-MC-Unique: 0xxA6cqeMEyfmSmmfn-25w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52474857A93;
 Mon, 27 Feb 2023 19:14:25 +0000 (UTC)
Received: from localhost (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9026C2026D4B;
 Mon, 27 Feb 2023 19:14:24 +0000 (UTC)
Date: Mon, 27 Feb 2023 14:14:22 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v15 3/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <Y/0BDib2ww1XdIov@fedora>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-4-faithilikerun@gmail.com>
 <Y/z0Xl0qxUpJAXUl@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QvfxJT8yRO7FHEtz"
Content-Disposition: inline
In-Reply-To: <Y/z0Xl0qxUpJAXUl@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--QvfxJT8yRO7FHEtz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 07:20:14PM +0100, Kevin Wolf wrote:
> Am 29.01.2023 um 11:28 hat Sam Li geschrieben:
> > Add zoned device option to host_device BlockDriver. It will be presente=
d only
> > for zoned host block devices. By adding zone management operations to t=
he
> > host_block_device BlockDriver, users can use the new block layer APIs
> > including Report Zone and four zone management operations
> > (open, close, finish, reset, reset_all).
> >=20
> > Qemu-io uses the new APIs to perform zoned storage commands of the devi=
ce:
> > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > zone_finish(zf).
> >=20
> > For example, to test zone_report, use following command:
> > $ ./build/qemu-io --image-opts -n driver=3Dhost_device, filename=3D/dev=
/nullb0
> > -c "zrp offset nr_zones"
> >=20
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/block-backend.c             | 147 ++++++++++++++
> >  block/file-posix.c                | 323 ++++++++++++++++++++++++++++++
> >  block/io.c                        |  41 ++++
> >  include/block/block-io.h          |   7 +
> >  include/block/block_int-common.h  |  21 ++
> >  include/block/raw-aio.h           |   6 +-
> >  include/sysemu/block-backend-io.h |  18 ++
> >  meson.build                       |   4 +
> >  qemu-io-cmds.c                    | 149 ++++++++++++++
> >  9 files changed, 715 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index ba7bf1d6bc..a4847b9131 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1451,6 +1451,15 @@ typedef struct BlkRwCo {
> >      void *iobuf;
> >      int ret;
> >      BdrvRequestFlags flags;
> > +    union {
> > +        struct {
> > +            unsigned int *nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report;
> > +        struct {
> > +            unsigned long op;
> > +        } zone_mgmt;
> > +    };
> >  } BlkRwCo;
>=20
> Should we use a different struct for blk_aio_zone_*() so that we don't
> need to touch the one for the normal I/O path? My concern is that
> increasing the size of the struct (currently 32 bytes) might negatively
> impact the performance even of non-zoned devices. Maybe it turns out
> that it wasn't really necessary in the end (have we done any
> benchmarks?), but I don't think it can hurt anyway.
>=20
> With this changed, you can add to the series:
> Acked-by: Kevin Wolf <kwolf@redhat.com>

There are unused fields in BlkRwCo and BlkAioEmAIOCB, so changing the
size of the struct isn't necessary. ioctl/flush/pdiscard already use
BlkAioEmAIOCB/BlkRwCo for non-read/write operations, including using the
iobuf field for different types, so it wouldn't be weird:

  typedef struct BlkRwCo {
      BlockBackend *blk;
      int64_t offset;
      void *iobuf;
            ^^^^^ used for preadv/pwritev qiov, ioctl buf, and NULL for
                  other request types. zone_report could put the
                  BlockZoneDescriptor pointer here. zone_mgmt could put
                  op here.
      int ret;
      BdrvRequestFlags flags;
  } BlkRwCo;

  typedef struct BlkAioEmAIOCB {
      BlockAIOCB common;
      BlkRwCo rwco;
      int64_t bytes;
              ^^^^^ zone_report could put the nr_zones pointer here
      bool has_returned;
  } BlkAioEmAIOCB;

Does that sound okay?

Stefan

--QvfxJT8yRO7FHEtz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP9AQ4ACgkQnKSrs4Gr
c8g2Fwf9EMFkLT8O/kdjsm0flMV1/+xutRbawiGK+uJZW6NkoQyJtb7QubSwBAA6
UfmAN2k68PB3IFaD/2YcyJqRmrsWgAUin8stQ69GJuijIWUqEDxOrI4BhGxnTiln
kQoj37GTnsZ0XOpd7MlPK750nUHTMw8oaKse7BTiZyKNj37Dt4Zz8unWZpUG0Tex
39dbchWKTrEh5kSdYljPbbiyc4pZvh+y1MQ1oYhhjxtBPBrDN7q4z0tHUu+4/NIw
7TLoknQYRv0+r1n4xhQPxqqXirKoMudbUGYDLwajcKyPXcLaZ0+srWF8r9kHT642
Rcz80JCZbTvxFNstEroeNnA35HhEyg==
=GXO+
-----END PGP SIGNATURE-----

--QvfxJT8yRO7FHEtz--


