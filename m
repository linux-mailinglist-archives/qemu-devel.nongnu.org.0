Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4A6A58AE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyYp-0005Xu-8x; Tue, 28 Feb 2023 06:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pWyYn-0005XV-3q
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:54:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pWyYl-0000Sv-Hc
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677585258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLfze983Kz0hH4lLKIHX4U0se1aMmsK9klkwoQXLYZk=;
 b=e7Po8GJf2DDHCfE0piz8MMGnH/Deg4ZzSJvMM2zCWCWWwZZKpGLHVMttQXzpNhn7D1YSsl
 bR2N5xIuli8H/1HcwCNBBtEwFDZgy9wITElY0mrImQ+0Of2o89f3wniKf5S/WVNyPRQ81s
 aiPKLAHzHRxVRPjTKkra6sZiP7twHeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-vdhxV30pPPOYva3JsZkDZg-1; Tue, 28 Feb 2023 06:54:13 -0500
X-MC-Unique: vdhxV30pPPOYva3JsZkDZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17D41858F09;
 Tue, 28 Feb 2023 11:54:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EE3492B0E;
 Tue, 28 Feb 2023 11:54:10 +0000 (UTC)
Date: Tue, 28 Feb 2023 12:54:09 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
Message-ID: <Y/3rYd/yhMhziyHq@redhat.com>
References: <20230129102850.84731-1-faithilikerun@gmail.com>
 <20230129102850.84731-4-faithilikerun@gmail.com>
 <Y/z0Xl0qxUpJAXUl@redhat.com> <Y/0BDib2ww1XdIov@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="csyeyuFJNg++ECyJ"
Content-Disposition: inline
In-Reply-To: <Y/0BDib2ww1XdIov@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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


--csyeyuFJNg++ECyJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 27.02.2023 um 20:14 hat Stefan Hajnoczi geschrieben:
> On Mon, Feb 27, 2023 at 07:20:14PM +0100, Kevin Wolf wrote:
> > Am 29.01.2023 um 11:28 hat Sam Li geschrieben:
> > > Add zoned device option to host_device BlockDriver. It will be presen=
ted only
> > > for zoned host block devices. By adding zone management operations to=
 the
> > > host_block_device BlockDriver, users can use the new block layer APIs
> > > including Report Zone and four zone management operations
> > > (open, close, finish, reset, reset_all).
> > >=20
> > > Qemu-io uses the new APIs to perform zoned storage commands of the de=
vice:
> > > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > > zone_finish(zf).
> > >=20
> > > For example, to test zone_report, use following command:
> > > $ ./build/qemu-io --image-opts -n driver=3Dhost_device, filename=3D/d=
ev/nullb0
> > > -c "zrp offset nr_zones"
> > >=20
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  block/block-backend.c             | 147 ++++++++++++++
> > >  block/file-posix.c                | 323 ++++++++++++++++++++++++++++=
++
> > >  block/io.c                        |  41 ++++
> > >  include/block/block-io.h          |   7 +
> > >  include/block/block_int-common.h  |  21 ++
> > >  include/block/raw-aio.h           |   6 +-
> > >  include/sysemu/block-backend-io.h |  18 ++
> > >  meson.build                       |   4 +
> > >  qemu-io-cmds.c                    | 149 ++++++++++++++
> > >  9 files changed, 715 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > index ba7bf1d6bc..a4847b9131 100644
> > > --- a/block/block-backend.c
> > > +++ b/block/block-backend.c
> > > @@ -1451,6 +1451,15 @@ typedef struct BlkRwCo {
> > >      void *iobuf;
> > >      int ret;
> > >      BdrvRequestFlags flags;
> > > +    union {
> > > +        struct {
> > > +            unsigned int *nr_zones;
> > > +            BlockZoneDescriptor *zones;
> > > +        } zone_report;
> > > +        struct {
> > > +            unsigned long op;
> > > +        } zone_mgmt;
> > > +    };
> > >  } BlkRwCo;
> >=20
> > Should we use a different struct for blk_aio_zone_*() so that we don't
> > need to touch the one for the normal I/O path? My concern is that
> > increasing the size of the struct (currently 32 bytes) might negatively
> > impact the performance even of non-zoned devices. Maybe it turns out
> > that it wasn't really necessary in the end (have we done any
> > benchmarks?), but I don't think it can hurt anyway.
> >=20
> > With this changed, you can add to the series:
> > Acked-by: Kevin Wolf <kwolf@redhat.com>
>=20
> There are unused fields in BlkRwCo and BlkAioEmAIOCB, so changing the
> size of the struct isn't necessary. ioctl/flush/pdiscard already use
> BlkAioEmAIOCB/BlkRwCo for non-read/write operations, including using the
> iobuf field for different types, so it wouldn't be weird:
>=20
>   typedef struct BlkRwCo {
>       BlockBackend *blk;
>       int64_t offset;
>       void *iobuf;
>             ^^^^^ used for preadv/pwritev qiov, ioctl buf, and NULL for
>                   other request types. zone_report could put the
>                   BlockZoneDescriptor pointer here. zone_mgmt could put
>                   op here.
>       int ret;
>       BdrvRequestFlags flags;
>   } BlkRwCo;
>=20
>   typedef struct BlkAioEmAIOCB {
>       BlockAIOCB common;
>       BlkRwCo rwco;
>       int64_t bytes;
>               ^^^^^ zone_report could put the nr_zones pointer here
>       bool has_returned;
>   } BlkAioEmAIOCB;
>=20
> Does that sound okay?

Might not be great for readability, but good enough for me.

Kevin

--csyeyuFJNg++ECyJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmP962EACgkQfwmycsiP
L9aPzBAAjA9NFCOjpjpxG606QZ2PAZMFJjGMA0fHSMN8pWfZptRxRxT/AHssCM6K
evwti7EQ3u8wq0taPj+FRbSSm0IxiDateSlpoWHkImTKWxBv7VcS/waG8roiUK43
0kSEMQsFx/6AzUuHUf6grvkH7+T3aEZ6bgPwhuGf2o3r7VSmevUu18P+1BezFlrg
LlvDJky1R3hmtfVsGvJZsbQ8pE1ZrCVr5KMVdsnwO8xZJcyaMosiQkgAh6oYa01l
i80KVkQ50P/B6keH75XyB0OnuXeAvcO8+o+T/SV6CXYFR6rqxXscVGM88tNE/JpN
EFwPUUnREpxj+i164LyRF//UYcSaow/a4NUxEC3XPhqQ69F00t4IjzXaKYGJClmJ
bZBstd8BuW8IIsEvt753Cl3jR5skGoGmyuKwbI7wFPKXV3YF3IkPzJGdAzGpO+Hu
zhN8QD21pWLOaJNUkwC8iJMgyEvSnWcbmShi6j4YGfNmK/4X/XJbEdFmriFxPwcG
Y2l2s7D8helHTa9FQuDS4UvKagpP/tJMAPzQCF1A/FMeVi8LnFAvBSGQaXv1nLWu
cyA4IiAekyEdk57GNBmi4JKrrqr0z3CkXWpgh+Q8edLQNI2Lrypk32tf1Zmc3p6N
1pjaxPgXxr5OBsPmW5BVcSSs44VwuDpBbh+iVEh8luOEvwCuC9Y=
=5B5l
-----END PGP SIGNATURE-----

--csyeyuFJNg++ECyJ--


