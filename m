Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67CB4EBF58
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:58:22 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZW1t-0005w9-SD
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:58:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZVpM-00050u-T4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZVpJ-0002kE-7B
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648637119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uAnz5OTL9afX2H2UeXd4pQEKcfRf/sqQKmVXQRRgLA0=;
 b=iulbP7oIVrRJAgf2iCMwqGAiqKDKzz1qRw2DKRBgk4SoPiS1WVp59OYYWLHZ1ZPXqfPI3K
 RFp0hl8tqmHnlxB+sMf6FBv3ekTKk8zwq7iegeF7sZiOKchQRWUbgfnl5zIN8EC2x5j6jC
 6E/4Zp4pJ8OCLzVl1wMXARc/pRLlnWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-WpC07N9fM66NrVdCOBJTrA-1; Wed, 30 Mar 2022 06:45:14 -0400
X-MC-Unique: WpC07N9fM66NrVdCOBJTrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162EE811E76;
 Wed, 30 Mar 2022 10:45:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF66C202C8;
 Wed, 30 Mar 2022 10:45:12 +0000 (UTC)
Date: Wed, 30 Mar 2022 11:45:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC 7/8] blkio: implement BDRV_REQ_REGISTERED_BUF optimization
Message-ID: <YkQ0uPFfXB3NvjQu@stefanha-x1.localdomain>
References: <20220323111727.1100209-1-stefanha@redhat.com>
 <20220323111727.1100209-8-stefanha@redhat.com>
 <20220329152430.xhmhiq2l2cibzoio@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NcGqCjzGynsaE5GW"
Content-Disposition: inline
In-Reply-To: <20220329152430.xhmhiq2l2cibzoio@sgarzare-redhat>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NcGqCjzGynsaE5GW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 05:24:30PM +0200, Stefano Garzarella wrote:
> On Wed, Mar 23, 2022 at 11:17:26AM +0000, Stefan Hajnoczi wrote:
> > Avoid bounce buffers when QEMUIOVector elements are within previously
> > registered bdrv_register_buf() buffers.
> >=20
> > The idea is that emulated storage controllers will register guest RAM
> > using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
> > requests. Therefore no blkio_add_mem_region() calls are necessary in the
> > performance-critical I/O code path.
> >=20
> > This optimization doesn't apply if the I/O buffer is internally
> > allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
> > path because BDRV_REQ_REGISTERED_BUF is not set.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > block/blkio.c | 108 ++++++++++++++++++++++++++++++++++++++++++++++++--
> > 1 file changed, 104 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/block/blkio.c b/block/blkio.c
> > index dd2308b967..78f4ca5f49 100644
> > --- a/block/blkio.c
> > +++ b/block/blkio.c
> > @@ -1,7 +1,9 @@
> > #include "qemu/osdep.h"
> > #include <blkio.h>
> > #include "block/block_int.h"
> > +#include "exec/memory.h"
> > #include "qapi/error.h"
> > +#include "qemu/error-report.h"
> > #include "qapi/qmp/qdict.h"
> > #include "qemu/module.h"
> >=20
> > @@ -26,6 +28,9 @@ typedef struct {
> >     /* Can we skip adding/deleting blkio_mem_regions? */
> >     bool needs_mem_regions;
> >=20
> > +    /* Are file descriptors necessary for blkio_mem_regions? */
> > +    bool needs_mem_region_fd;
> > +
> >     /*
> >      * blkio_completion_fd_poll() stashes the next completion for
> >      * blkio_completion_fd_poll_ready().
> > @@ -170,6 +175,8 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >         BlockCompletionFunc *cb, void *opaque)
> > {
> >     BDRVBlkioState *s =3D bs->opaque;
> > +    bool needs_mem_regions =3D
> > +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
> >     struct iovec *iov =3D qiov->iov;
> >     int iovcnt =3D qiov->niov;
> >     BlkioAIOCB *acb;
> > @@ -179,7 +186,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >=20
> >     acb =3D blkio_aiocb_get(bs, cb, opaque);
> >=20
> > -    if (s->needs_mem_regions) {
> > +    if (needs_mem_regions) {
> >         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> >             qemu_aio_unref(&acb->common);
> >             return NULL;
> > @@ -194,7 +201,7 @@ static BlockAIOCB *blkio_aio_preadv(BlockDriverStat=
e *bs, int64_t offset,
> >=20
> >     ret =3D blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
> >     if (ret < 0) {
> > -        if (s->needs_mem_regions) {
> > +        if (needs_mem_regions) {
> >             blkio_free_mem_region(s->blkio, &acb->mem_region);
> >             qemu_iovec_destroy(&acb->qiov);
> >         }
> > @@ -215,6 +222,8 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> > {
> >     uint32_t blkio_flags =3D (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : 0;
> >     BDRVBlkioState *s =3D bs->opaque;
> > +    bool needs_mem_regions =3D
> > +        s->needs_mem_regions && !(flags & BDRV_REQ_REGISTERED_BUF);
> >     struct iovec *iov =3D qiov->iov;
> >     int iovcnt =3D qiov->niov;
> >     BlkioAIOCB *acb;
> > @@ -224,7 +233,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> >=20
> >     acb =3D blkio_aiocb_get(bs, cb, opaque);
> >=20
> > -    if (s->needs_mem_regions) {
> > +    if (needs_mem_regions) {
> >         if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> >             qemu_aio_unref(&acb->common);
> >             return NULL;
> > @@ -238,7 +247,7 @@ static BlockAIOCB *blkio_aio_pwritev(BlockDriverSta=
te *bs, int64_t offset,
> >=20
> >     ret =3D blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_fl=
ags);
> >     if (ret < 0) {
> > -        if (s->needs_mem_regions) {
> > +        if (needs_mem_regions) {
> >             blkio_free_mem_region(s->blkio, &acb->mem_region);
> >         }
> >         qemu_aio_unref(&acb->common);
> > @@ -286,6 +295,83 @@ static void blkio_io_unplug(BlockDriverState *bs)
> >     }
> > }
> >=20
> > +static void blkio_register_buf(BlockDriverState *bs, void *host, size_=
t size)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    char *errmsg;
> > +    int ret;
> > +    struct blkio_mem_region region =3D (struct blkio_mem_region){
> > +        .addr =3D host,
> > +        .len =3D size,
> > +        .fd =3D -1,
> > +    };
> > +
> > +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> > +        error_report_once("%s: skipping unaligned buf %p with size %zu=
",
> > +                          __func__, host, size);
> > +        return; /* skip unaligned */
> > +    }
> > +
> > +    /* Attempt to find the fd for a MemoryRegion */
> > +    if (s->needs_mem_region_fd) {
> > +        int fd =3D -1;
> > +        ram_addr_t offset;
> > +        MemoryRegion *mr;
> > +
> > +        /*
> > +         * bdrv_register_buf() is called with the BQL held so mr lives=
 at least
> > +         * until this function returns.
> > +         */
> > +        mr =3D memory_region_from_host(host, &offset);
> > +        if (mr) {
> > +            fd =3D memory_region_get_fd(mr);
> > +        }
> > +        if (fd =3D=3D -1) {
> > +            error_report_once("%s: skipping fd-less buf %p with size %=
zu",
> > +                              __func__, host, size);
> > +            return; /* skip if there is no fd */
> > +        }
> > +
> > +        region.fd =3D fd;
> > +        region.fd_offset =3D offset;
> > +    }
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        ret =3D blkio_add_mem_region(s->blkio, &region, &errmsg);
> > +    }
> > +
> > +    if (ret < 0) {
> > +        error_report_once("Failed to add blkio mem region %p with size=
 %zu: %s",
> > +                          host, size, errmsg);
> > +        free(errmsg);
> > +    }
> > +}
> > +
> > +static void blkio_unregister_buf(BlockDriverState *bs, void *host, siz=
e_t size)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    char *errmsg;
> > +    int ret;
> > +    struct blkio_mem_region region =3D (struct blkio_mem_region){
> > +        .addr =3D host,
> > +        .len =3D size,
> > +    };
> > +
> > +    if (((uintptr_t)host | size) % s->mem_region_alignment) {
> > +        return; /* skip unaligned */
> > +    }
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        ret =3D blkio_del_mem_region(s->blkio, &region, &errmsg);
> > +    }
> > +
> > +    if (ret < 0) {
> > +        error_report_once("Failed to delete blkio mem region %p with s=
ize %zu: %s",
> > +                          host, size, errmsg);
> > +        free(errmsg);
> > +    }
> > +}
> > +
> > static void blkio_parse_filename_io_uring(const char *filename, QDict *=
options,
> >                                           Error **errp)
> > {
> > @@ -356,6 +442,18 @@ static int blkio_file_open(BlockDriverState *bs, Q=
Dict *options, int flags,
> >         return ret;
> >     }
> >=20
> > +    ret =3D blkio_get_bool(s->blkio,
> > +                         "needs-mem-region-fd",
> > +                         &s->needs_mem_region_fd,
> > +                         &errmsg);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret,
> > +                         "failed to get needs-mem-region-fd: %s", errm=
sg);
> > +        free(errmsg);
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> >     ret =3D blkio_get_uint64(s->blkio,
> >                            "mem-region-alignment",
> >                            &s->mem_region_alignment,
>=20
> I already mentioned on IRC while testing the series, but I'm writing it h=
ere
> so we don't forget ;-)
>=20
> To prevent bdrv_driver_pwritev() from removing the BDRV_REQ_REGISTERED_BUF
> flag from requests, we should add this:
>=20
> @@ -474,7 +474,7 @@ static int blkio_file_open(BlockDriverState *bs, QDic=
t *options, int flags,
>          return ret;
>      }
>=20
> -    bs->supported_write_flags =3D BDRV_REQ_FUA;
> +    bs->supported_write_flags =3D BDRV_REQ_FUA | BDRV_REQ_REGISTERED_BUF;
>=20
>      qemu_mutex_init(&s->lock);
>      s->blkioq =3D blkio_get_queue(s->blkio, 0);

Thanks, will fix.

Stefan

--NcGqCjzGynsaE5GW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJENLcACgkQnKSrs4Gr
c8jq7wf/a09k6JB0ZJPFeE2dgpYDJrAwJbDBICxanlV++BId2jn9vuDMMzMf7P+A
uBW9XGuWOxcTyVSmPl471WAEE03aCT8bDA7kpYMstt76wPTm87Px/bKv4N9KV4Vh
vWTIWEFw8hKrd4qQ0pkE/mOB9PJm9hu9CTMy96Xrcwc9jwA7s5GfuW8/Z8ngLVME
TP+ni/myK1z838bhotN6e8qboBlLLw3rUML81xJdWfmdXTnGmXZEcIMkxitbeM4d
7I1XJ7GdV3a9dlCsIc44xfA9dVWgdJgpJyRx6GFDHjDa99BMPCAua7WjhNKZpBmM
X05G+uoPx52lX67FQWW6CRLrxziUbw==
=+7eu
-----END PGP SIGNATURE-----

--NcGqCjzGynsaE5GW--


