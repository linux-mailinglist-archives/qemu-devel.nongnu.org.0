Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE55906D9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 21:10:36 +0200 (CEST)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDZj-0003mn-Ey
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 15:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMDXu-0001zi-1K
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oMDXd-0000yq-0K
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660244903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pqsJD2bEuqTSOeca0+1OYecmPNoPA7Ii7a/h67uF54M=;
 b=YIJ3Xg1tescegTKEhhTs6e4z5Y24IHbnB2GkJpUKLGy+W46SoJpVHQ7S3OnHWfavN97Bz+
 7P+xIuk/X9VidQGXcqJc7cicfqod2g7/FsTbeGjB8QXOhTGAxlQDBTATi3t3NoG0InW42k
 EuWmeAxcsH7sanNFy1fgUWUaBoWjWlM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-6k5D4UByPBKBcw08PwMaFA-1; Thu, 11 Aug 2022 15:08:20 -0400
X-MC-Unique: 6k5D4UByPBKBcw08PwMaFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CAD985A59C;
 Thu, 11 Aug 2022 19:08:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D2292026D07;
 Thu, 11 Aug 2022 19:08:17 +0000 (UTC)
Date: Thu, 11 Aug 2022 15:08:16 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 sgarzare@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC v3 1/8] blkio: add io_uring block driver using libblkio
Message-ID: <YvVToEYNs2VqD6JM@fedora>
References: <20220708041737.1768521-1-stefanha@redhat.com>
 <20220708041737.1768521-2-stefanha@redhat.com>
 <a8535ef6-6c42-da31-44b6-ecbbeb0051c3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xTfEiBWuoIoXdyu0"
Content-Disposition: inline
In-Reply-To: <a8535ef6-6c42-da31-44b6-ecbbeb0051c3@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--xTfEiBWuoIoXdyu0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2022 at 02:05:18PM +0200, Hanna Reitz wrote:
> On 08.07.22 06:17, Stefan Hajnoczi wrote:
> > libblkio (https://gitlab.com/libblkio/libblkio/) is a library for
> > high-performance disk I/O. It currently supports io_uring and
> > virtio-blk-vhost-vdpa with additional drivers under development.
> >=20
> > One of the reasons for developing libblkio is that other applications
> > besides QEMU can use it. This will be particularly useful for
> > vhost-user-blk which applications may wish to use for connecting to
> > qemu-storage-daemon.
> >=20
> > libblkio also gives us an opportunity to develop in Rust behind a C API
> > that is easy to consume from QEMU.
> >=20
> > This commit adds io_uring and virtio-blk-vhost-vdpa BlockDrivers to QEMU
> > using libblkio. It will be easy to add other libblkio drivers since they
> > will share the majority of code.
> >=20
> > For now I/O buffers are copied through bounce buffers if the libblkio
> > driver requires it. Later commits add an optimization for
> > pre-registering guest RAM to avoid bounce buffers.
> >=20
> > The syntax is:
> >=20
> >    --blockdev io_uring,node-name=3Ddrive0,filename=3Dtest.img,readonly=
=3Don|off,cache.direct=3Don|off
> >=20
> > and:
> >=20
> >    --blockdev virtio-blk-vhost-vdpa,node-name=3Ddrive0,path=3D/dev/vdpa=
=2E..,readonly=3Don|off
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   MAINTAINERS                   |   6 +
> >   meson_options.txt             |   2 +
> >   qapi/block-core.json          |  37 +-
> >   meson.build                   |   9 +
> >   block/blkio.c                 | 659 ++++++++++++++++++++++++++++++++++
> >   tests/qtest/modules-test.c    |   3 +
> >   block/meson.build             |   1 +
> >   scripts/meson-buildoptions.sh |   3 +
> >   8 files changed, 718 insertions(+), 2 deletions(-)
> >   create mode 100644 block/blkio.c
>=20
> [...]
>=20
> > diff --git a/block/blkio.c b/block/blkio.c
> > new file mode 100644
> > index 0000000000..7fbdbd7fae
> > --- /dev/null
> > +++ b/block/blkio.c
> > @@ -0,0 +1,659 @@
>=20
> Not sure whether it=E2=80=99s necessary, but I would have expected a copy=
right
> header here.

Thanks for reminding me, I will add a header.

>=20
> > +#include "qemu/osdep.h"
> > +#include <blkio.h>
> > +#include "block/block_int.h"
> > +#include "qapi/error.h"
> > +#include "qapi/qmp/qdict.h"
> > +#include "qemu/module.h"
> > +
> > +typedef struct BlkAIOCB {
> > +    BlockAIOCB common;
> > +    struct blkio_mem_region mem_region;
> > +    QEMUIOVector qiov;
> > +    struct iovec bounce_iov;
> > +} BlkioAIOCB;
> > +
> > +typedef struct {
> > +    /* Protects ->blkio and request submission on ->blkioq */
> > +    QemuMutex lock;
> > +
> > +    struct blkio *blkio;
> > +    struct blkioq *blkioq; /* this could be multi-queue in the future =
*/
> > +    int completion_fd;
> > +
> > +    /* Polling fetches the next completion into this field */
> > +    struct blkio_completion poll_completion;
> > +
> > +    /* The value of the "mem-region-alignment" property */
> > +    size_t mem_region_alignment;
> > +
> > +    /* Can we skip adding/deleting blkio_mem_regions? */
> > +    bool needs_mem_regions;
> > +} BDRVBlkioState;
> > +
> > +static void blkio_aiocb_complete(BlkioAIOCB *acb, int ret)
> > +{
> > +    /* Copy bounce buffer back to qiov */
> > +    if (acb->qiov.niov > 0) {
> > +        qemu_iovec_from_buf(&acb->qiov, 0,
> > +                acb->bounce_iov.iov_base,
> > +                acb->bounce_iov.iov_len);
> > +        qemu_iovec_destroy(&acb->qiov);
> > +    }
> > +
> > +    acb->common.cb(acb->common.opaque, ret);
> > +
> > +    if (acb->mem_region.len > 0) {
> > +        BDRVBlkioState *s =3D acb->common.bs->opaque;
> > +
> > +        WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +            blkio_free_mem_region(s->blkio, &acb->mem_region);
> > +        }
> > +    }
> > +
> > +    qemu_aio_unref(&acb->common);
> > +}
> > +
> > +/*
> > + * Only the thread that calls aio_poll() invokes fd and poll handlers.
> > + * Therefore locks are not necessary except when accessing s->blkio.
> > + *
> > + * No locking is performed around blkioq_get_completions() although ot=
her
> > + * threads may submit I/O requests on s->blkioq. We're assuming there =
is no
> > + * inteference between blkioq_get_completions() and other s->blkioq AP=
Is.
> > + */
> > +
> > +static void blkio_completion_fd_read(void *opaque)
> > +{
> > +    BlockDriverState *bs =3D opaque;
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    struct blkio_completion completion;
> > +    uint64_t val;
> > +    ssize_t ret __attribute__((unused));
>=20
> I=E2=80=99d prefer a `(void)ret;` over this attribute, not least because =
that line
> would give a nice opportunity to explain in a short comment why we ignore
> this return value that the compiler tells us not to ignore, but if you
> don=E2=80=99t, then this=E2=80=99ll be fine.

Okay, I'll use (void)ret; and add a comment.

>=20
> > +
> > +    /* Polling may have already fetched a completion */
> > +    if (s->poll_completion.user_data !=3D NULL) {
> > +        completion =3D s->poll_completion;
> > +
> > +        /* Clear it in case blkio_aiocb_complete() has a nested event =
loop */
> > +        s->poll_completion.user_data =3D NULL;
> > +
> > +        blkio_aiocb_complete(completion.user_data, completion.ret);
> > +    }
> > +
> > +    /* Reset completion fd status */
> > +    ret =3D read(s->completion_fd, &val, sizeof(val));
> > +
> > +    /*
> > +     * Reading one completion at a time makes nested event loop re-ent=
rancy
> > +     * simple. Change this loop to get multiple completions in one go =
if it
> > +     * becomes a performance bottleneck.
> > +     */
> > +    while (blkioq_do_io(s->blkioq, &completion, 0, 1, NULL) =3D=3D 1) {
> > +        blkio_aiocb_complete(completion.user_data, completion.ret);
> > +    }
> > +}
> > +
> > +static bool blkio_completion_fd_poll(void *opaque)
> > +{
> > +    BlockDriverState *bs =3D opaque;
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +
> > +    /* Just in case we already fetched a completion */
> > +    if (s->poll_completion.user_data !=3D NULL) {
> > +        return true;
> > +    }
> > +
> > +    return blkioq_do_io(s->blkioq, &s->poll_completion, 0, 1, NULL) =
=3D=3D 1;
> > +}
> > +
> > +static void blkio_completion_fd_poll_ready(void *opaque)
> > +{
> > +    blkio_completion_fd_read(opaque);
> > +}
> > +
> > +static void blkio_attach_aio_context(BlockDriverState *bs,
> > +                                     AioContext *new_context)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +
> > +    aio_set_fd_handler(new_context,
> > +                       s->completion_fd,
> > +                       false,
> > +                       blkio_completion_fd_read,
> > +                       NULL,
> > +                       blkio_completion_fd_poll,
> > +                       blkio_completion_fd_poll_ready,
> > +                       bs);
> > +}
> > +
> > +static void blkio_detach_aio_context(BlockDriverState *bs)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +
> > +    aio_set_fd_handler(bdrv_get_aio_context(bs),
> > +                       s->completion_fd,
> > +                       false, NULL, NULL, NULL, NULL, NULL);
> > +}
> > +
> > +static const AIOCBInfo blkio_aiocb_info =3D {
> > +    .aiocb_size =3D sizeof(BlkioAIOCB),
> > +};
> > +
> > +/* Create a BlkioAIOCB */
> > +static BlkioAIOCB *blkio_aiocb_get(BlockDriverState *bs,
> > +                                   BlockCompletionFunc *cb,
> > +                                   void *opaque)
> > +{
> > +    BlkioAIOCB *acb =3D qemu_aio_get(&blkio_aiocb_info, bs, cb, opaque=
);
> > +
> > +    /* A few fields need to be initialized, leave the rest... */
> > +    acb->qiov.niov =3D 0;
> > +    acb->mem_region.len =3D 0;
> > +    return acb;
> > +}
> > +
> > +/* s->lock must be held */
> > +static int blkio_aiocb_init_mem_region_locked(BlkioAIOCB *acb, size_t =
len)
> > +{
> > +    BDRVBlkioState *s =3D acb->common.bs->opaque;
> > +    size_t mem_region_len =3D QEMU_ALIGN_UP(len, s->mem_region_alignme=
nt);
> > +    int ret;
> > +
> > +    ret =3D blkio_alloc_mem_region(s->blkio, &acb->mem_region, mem_reg=
ion_len);
>=20
> I don=E2=80=99t find the blkio doc clear on whether this function is suff=
iciently
> fast to be used in an I/O path.=C2=A0 Is it?
>=20
> (Or is this perhaps addressed in a later function in this series?)

It can be used from the I/O path but it may add overhead (depending on
the libblkio driver).

The later patches use .bdrv_register_buf() to avoid calling
blkio_alloc_mem_region() from the I/O path.

>=20
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    acb->bounce_iov.iov_base =3D acb->mem_region.addr;
> > +    acb->bounce_iov.iov_len =3D len;
> > +    return 0;
> > +}
> > +
> > +/* Call this to submit I/O after enqueuing a new request */
> > +static void blkio_submit_io(BlockDriverState *bs)
> > +{
> > +    if (qatomic_read(&bs->io_plugged) =3D=3D 0) {
> > +        BDRVBlkioState *s =3D bs->opaque;
> > +
> > +        blkioq_do_io(s->blkioq, NULL, 0, 0, NULL);
> > +    }
> > +}
> > +
> > +static BlockAIOCB *blkio_aio_pdiscard(BlockDriverState *bs, int64_t of=
fset,
> > +        int bytes, BlockCompletionFunc *cb, void *opaque)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    BlkioAIOCB *acb;
> > +
> > +    QEMU_LOCK_GUARD(&s->lock);
> > +
> > +    acb =3D blkio_aiocb_get(bs, cb, opaque);
> > +    blkioq_discard(s->blkioq, offset, bytes, acb, 0);
> > +    blkio_submit_io(bs);
> > +    return &acb->common;
> > +}
> > +
> > +static BlockAIOCB *blkio_aio_preadv(BlockDriverState *bs, int64_t offs=
et,
> > +        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
> > +        BlockCompletionFunc *cb, void *opaque)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    struct iovec *iov =3D qiov->iov;
> > +    int iovcnt =3D qiov->niov;
> > +    BlkioAIOCB *acb;
> > +
> > +    QEMU_LOCK_GUARD(&s->lock);
> > +
> > +    acb =3D blkio_aiocb_get(bs, cb, opaque);
> > +
> > +    if (s->needs_mem_regions) {
> > +        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> > +            qemu_aio_unref(&acb->common);
> > +            return NULL;
> > +        }
> > +
> > +        /* Copy qiov because we'll call qemu_iovec_from_buf() on compl=
etion */
> > +        qemu_iovec_init_slice(&acb->qiov, qiov, 0, qiov->size);
> > +
> > +        iov =3D &acb->bounce_iov;
> > +        iovcnt =3D 1;
> > +    }
> > +
> > +    blkioq_readv(s->blkioq, offset, iov, iovcnt, acb, 0);
> > +    blkio_submit_io(bs);
> > +    return &acb->common;
> > +}
> > +
> > +static BlockAIOCB *blkio_aio_pwritev(BlockDriverState *bs, int64_t off=
set,
> > +        int64_t bytes, QEMUIOVector *qiov, BdrvRequestFlags flags,
> > +        BlockCompletionFunc *cb, void *opaque)
> > +{
> > +    uint32_t blkio_flags =3D (flags & BDRV_REQ_FUA) ? BLKIO_REQ_FUA : =
0;
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    struct iovec *iov =3D qiov->iov;
> > +    int iovcnt =3D qiov->niov;
> > +    BlkioAIOCB *acb;
> > +
> > +    QEMU_LOCK_GUARD(&s->lock);
> > +
> > +    acb =3D blkio_aiocb_get(bs, cb, opaque);
> > +
> > +    if (s->needs_mem_regions) {
> > +        if (blkio_aiocb_init_mem_region_locked(acb, bytes) < 0) {
> > +            qemu_aio_unref(&acb->common);
> > +            return NULL;
> > +        }
> > +
> > +        qemu_iovec_to_buf(qiov, 0, acb->bounce_iov.iov_base, bytes);
> > +
> > +        iov =3D &acb->bounce_iov;
> > +        iovcnt =3D 1;
> > +    }
> > +
> > +    blkioq_writev(s->blkioq, offset, iov, iovcnt, acb, blkio_flags);
> > +    blkio_submit_io(bs);
> > +    return &acb->common;
> > +}
> > +
> > +static BlockAIOCB *blkio_aio_flush(BlockDriverState *bs,
> > +                                   BlockCompletionFunc *cb,
> > +                                   void *opaque)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    BlkioAIOCB *acb;
> > +
> > +    QEMU_LOCK_GUARD(&s->lock);
> > +
> > +    acb =3D blkio_aiocb_get(bs, cb, opaque);
> > +
> > +    blkioq_flush(s->blkioq, acb, 0);
> > +    blkio_submit_io(bs);
> > +    return &acb->common;
> > +}
> > +
> > +/* For async to .bdrv_co_*() conversion */
> > +typedef struct {
> > +    Coroutine *coroutine;
> > +    int ret;
> > +} BlkioCoData;
> > +
> > +static void blkio_co_pwrite_zeroes_complete(void *opaque, int ret)
> > +{
> > +    BlkioCoData *data =3D opaque;
> > +
> > +    data->ret =3D ret;
> > +    aio_co_wake(data->coroutine);
> > +}
> > +
> > +static int coroutine_fn blkio_co_pwrite_zeroes(BlockDriverState *bs,
> > +    int64_t offset, int64_t bytes, BdrvRequestFlags flags)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    BlkioCoData data =3D {
> > +        .coroutine =3D qemu_coroutine_self(),
> > +    };
> > +    uint32_t blkio_flags =3D 0;
> > +
> > +    if (flags & BDRV_REQ_FUA) {
> > +        blkio_flags |=3D BLKIO_REQ_FUA;
> > +    }
> > +    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
> > +        blkio_flags |=3D BLKIO_REQ_NO_UNMAP;
> > +    }
> > +    if (flags & BDRV_REQ_NO_FALLBACK) {
> > +        blkio_flags |=3D BLKIO_REQ_NO_FALLBACK;
> > +    }
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        BlkioAIOCB *acb =3D
> > +            blkio_aiocb_get(bs, blkio_co_pwrite_zeroes_complete, &data=
);
> > +        blkioq_write_zeroes(s->blkioq, offset, bytes, acb, blkio_flags=
);
> > +        blkio_submit_io(bs);
> > +    }
> > +
> > +    qemu_coroutine_yield();
> > +    return data.ret;
> > +}
> > +
> > +static void blkio_io_unplug(BlockDriverState *bs)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        blkio_submit_io(bs);
> > +    }
> > +}
> > +
> > +static void blkio_parse_filename_io_uring(const char *filename, QDict =
*options,
> > +                                          Error **errp)
> > +{
> > +    bdrv_parse_filename_strip_prefix(filename, "io_uring:", options);
> > +}
> > +
> > +static void blkio_parse_filename_virtio_blk_vhost_vdpa(
> > +        const char *filename,
> > +        QDict *options,
> > +        Error **errp)
> > +{
> > +    bdrv_parse_filename_strip_prefix(filename, "virtio-blk-vhost-vdpa:=
", options);
> > +}
>=20
> Besides the fact that this doesn=E2=80=99t work for virtio-blk-vhost-vdpa=
 (because
> it provides a @filename option, but that driver expects a @path option), =
is
> it really worth implementing these, or should we just expect users to use
> -blockdev (or -drive with blockdev-like options)?

Yes, I think you're right. .bdrv_parse_filename() is for legacy
BlockDrivers and we don't need it. I'll remove it.

>=20
> > +
> > +static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, i=
nt flags,
> > +                               Error **errp)
> > +{
> > +    const char *filename =3D qdict_get_try_str(options, "filename");
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    ret =3D blkio_set_str(s->blkio, "path", filename);
>=20
> You don=E2=80=99t check that @filename is non-NULL, and I don=E2=80=99t t=
hink that libblkio
> would accept a NULL here.=C2=A0 Admittedly, I can=E2=80=99t produce a cas=
e where it would
> be NULL (because -blockdev checks the QAPI schema, and -drive expects a
> @filename parameter thanks to .bdrv_needs_filename), but I think it=E2=80=
=99s still
> isn=E2=80=99t ideal.

Due to .bdrv_needs_filename we always have a "filename" QDict entry.
I'll change qdict_get_try_str() to qdict_get_str() so it's clearer that
this is always non-NULL.

>=20
> > +    qdict_del(options, "filename");
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to set path: %s",
> > +                         blkio_get_error_msg());
> > +        return ret;
> > +    }
> > +
> > +    if (flags & BDRV_O_NOCACHE) {
> > +        ret =3D blkio_set_bool(s->blkio, "direct", true);
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "failed to set direct: %s",
> > +                             blkio_get_error_msg());
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> > +        QDict *options, int flags, Error **errp)
> > +{
> > +    const char *path =3D qdict_get_try_str(options, "path");
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    ret =3D blkio_set_str(s->blkio, "path", path);
>=20
> In contrast to the above, I can make @path NULL here, because
> .bdrv_needs_filename only ensures that there=E2=80=99s a @filename parame=
ter, and
> so:
>=20
> $ ./qemu-system-x86_64 -drive
> if=3Dnone,driver=3Dvirtio-blk-vhost-vdpa,id=3Dnode0,filename=3Dfoo
> [1]=C2=A0=C2=A0=C2=A0 49946 segmentation fault (core dumped)=C2=A0 ./qemu=
-system-x86_64 -drive

Thanks, I will add a check.

>=20
> > +    qdict_del(options, "path");
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to set path: %s",
> > +                         blkio_get_error_msg());
> > +        return ret;
> > +    }
> > +
> > +    if (flags & BDRV_O_NOCACHE) {
> > +        error_setg(errp, "cache.direct=3Doff is not supported");
>=20
> The condition is the opposite of that, though, isn=E2=80=99t it?
>=20
> I.e.:
>=20
> $ ./qemu-system-x86_64 -drive if=3Dnone,driver=3Dvirtio-blk-vhost-vdpa,id=
=3Dnode0,filename=3Dfoo,path=3Dfoo,cache.direct=3Don
>=20
> qemu-system-x86_64: -drive if=3Dnone,driver=3Dvirtio-blk-vhost-vdpa,id=3D=
node0,filename=3Dfoo,path=3Dfoo,cache.direct=3Don:
> cache.direct=3Doff is not supported

Will fix, thanks!

>=20
> > +        return -EINVAL;
> > +    }
> > +    return 0;
> > +}
> > +
> > +static int blkio_file_open(BlockDriverState *bs, QDict *options, int f=
lags,
> > +                           Error **errp)
> > +{
> > +    const char *blkio_driver =3D bs->drv->protocol_name;
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int ret;
> > +
> > +    ret =3D blkio_create(blkio_driver, &s->blkio);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "blkio_create failed: %s",
> > +                         blkio_get_error_msg());
> > +        return ret;
> > +    }
> > +
> > +    if (strcmp(blkio_driver, "io_uring") =3D=3D 0) {
> > +        ret =3D blkio_io_uring_open(bs, options, flags, errp);
> > +    } else if (strcmp(blkio_driver, "virtio-blk-vhost-vdpa") =3D=3D 0)=
 {
> > +        ret =3D blkio_virtio_blk_vhost_vdpa_open(bs, options, flags, e=
rrp);
> > +    }
>=20
> First, I=E2=80=99d like to suggest using macros for the driver names (and=
 use them
> here and below for format_name/protocol_name).

Good idea.

> Second, what do you think about adding an `else` branch with
> `g_assert_not_reached()` (or just abort)?

Good idea.

>=20
> > +    if (ret < 0) {
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> > +    if (!(flags & BDRV_O_RDWR)) {
> > +        ret =3D blkio_set_bool(s->blkio, "readonly", true);
>=20
> The libblkio doc says it=E2=80=99s =E2=80=9Cread-only=E2=80=9D, and when =
I try to set this option, I
> get an error:
>=20
> $ ./qemu-system-x86_64 -blockdev
> io_uring,node-name=3Dnode0,filename=3D/dev/null,read-only=3Don
> qemu-system-x86_64: -blockdev
> io_uring,node-name=3Dnode0,filename=3D/dev/null,read-only=3Don: failed to=
 set
> readonly: Unknown property name: No such file or directory

Thanks, this property was renamed in libblkio commit 3b6771d1b049
("Rename property "readonly" to "read-only"") and this patch is
outdated.

Will fix.

>=20
> > +        if (ret < 0) {
> > +            error_setg_errno(errp, -ret, "failed to set readonly: %s",
> > +                             blkio_get_error_msg());
> > +            blkio_destroy(&s->blkio);
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    ret =3D blkio_connect(s->blkio);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "blkio_connect failed: %s",
> > +                         blkio_get_error_msg());
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D blkio_get_bool(s->blkio,
> > +                         "needs-mem-regions",
> > +                         &s->needs_mem_regions);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret,
> > +                         "failed to get needs-mem-regions: %s",
> > +                         blkio_get_error_msg());
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D blkio_get_uint64(s->blkio,
> > +                           "mem-region-alignment",
> > +                           &s->mem_region_alignment);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret,
> > +                         "failed to get mem-region-alignment: %s",
> > +                         blkio_get_error_msg());
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> > +    ret =3D blkio_start(s->blkio);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "blkio_start failed: %s",
> > +                         blkio_get_error_msg());
> > +        blkio_destroy(&s->blkio);
> > +        return ret;
> > +    }
> > +
> > +    bs->supported_write_flags =3D BDRV_REQ_FUA;
> > +    bs->supported_zero_flags =3D BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP |
> > +                               BDRV_REQ_NO_FALLBACK;
> > +
> > +    qemu_mutex_init(&s->lock);
> > +    s->blkioq =3D blkio_get_queue(s->blkio, 0);
> > +    s->completion_fd =3D blkioq_get_completion_fd(s->blkioq);
> > +
> > +    blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
> > +    return 0;
> > +}
> > +
> > +static void blkio_close(BlockDriverState *bs)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +
> > +    qemu_mutex_destroy(&s->lock);
> > +    blkio_destroy(&s->blkio);
>=20
> Should we call blkio_detach_aio_context() here?

Good catch. I thought that would be called automatically, but I don't
see a .bdrv_detach_aio_context() call in block.c:bdrv_close().

>=20
> > +}
> > +
> > +static int64_t blkio_getlength(BlockDriverState *bs)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    uint64_t capacity;
> > +    int ret;
> > +
> > +    WITH_QEMU_LOCK_GUARD(&s->lock) {
> > +        ret =3D blkio_get_uint64(s->blkio, "capacity", &capacity);
> > +    }
> > +    if (ret < 0) {
> > +        return -ret;
> > +    }
> > +
> > +    return capacity;
> > +}
> > +
> > +static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
> > +{
> > +    return 0;
> > +}
> > +
> > +static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
> > +{
> > +    BDRVBlkioState *s =3D bs->opaque;
> > +    int value;
> > +    int ret;
> > +
> > +    ret =3D blkio_get_int(s->blkio,
> > +                        "request-alignment",
> > +                        (int *)&bs->bl.request_alignment);
>=20
> I find this pointer cast and the ones below quite questionable. Admittedl=
y,
> I can=E2=80=99t think of a reasonably common system (nowadays) where this=
 would
> actually cause problems, but I=E2=80=99d prefer just reading all ints int=
o `value`
> and then assigning the respective limit from it.

Okay, let's do that. It's safer.

>=20
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"request-alignmen=
t\": %s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (bs->bl.request_alignment < 1 ||
> > +        bs->bl.request_alignment >=3D INT_MAX ||
> > +        !is_power_of_2(bs->bl.request_alignment)) {
> > +        error_setg(errp, "invalid \"request-alignment\" value %d, must=
 be "
> > +                   "power of 2 less than INT_MAX", bs->bl.request_alig=
nment);
>=20
> Minor (because auto-checked by the compiler anyway), but I=E2=80=99d pref=
er `%"
> PRIu32 "` instead of `%d` (same for other limits below).

Okay.

>=20
> > +        return;
> > +    }
> > +
> > +    ret =3D blkio_get_int(s->blkio,
> > +                        "optimal-io-size",
> > +                        (int *)&bs->bl.opt_transfer);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\":=
 %s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (bs->bl.opt_transfer > INT_MAX ||
> > +        (bs->bl.opt_transfer % bs->bl.request_alignment)) {
> > +        error_setg(errp, "invalid \"buf-alignment\" value %d, must be =
a "
> > +                   "multiple of %d", bs->bl.opt_transfer,
> > +                   bs->bl.request_alignment);
>=20
> Both error messages call it buf-alignment, but here we=E2=80=99re actuall=
y querying
> optimal-io-size.
>=20
> Second, is it really fatal if we fail to query it?=C2=A0 It was my impres=
sion
> that this is optional anyway, so why don=E2=80=99t we just ignore `ret < =
0` and make
> it zero then?

The property always exists and blkio_get_int() should never fail.

>=20
> > +        return;
> > +    }
> > +
> > +    ret =3D blkio_get_int(s->blkio,
> > +                        "max-transfer",
> > +                        (int *)&bs->bl.max_transfer);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"max-transfer\": =
%s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if ((bs->bl.max_transfer % bs->bl.request_alignment) ||
> > +        (bs->bl.opt_transfer && (bs->bl.max_transfer % bs->bl.opt_tran=
sfer))) {
> > +        error_setg(errp, "invalid \"max-transfer\" value %d, must be a=
 "
> > +                   "multiple of %d and %d (if non-zero)",
> > +                   bs->bl.max_transfer, bs->bl.request_alignment,
> > +                   bs->bl.opt_transfer);
> > +        return;
> > +    }
> > +
> > +    ret =3D blkio_get_int(s->blkio, "buf-alignment", &value);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"buf-alignment\":=
 %s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (value < 1) {
> > +        error_setg(errp, "invalid \"buf-alignment\" value %d, must be "
> > +                   "positive", value);
> > +        return;
> > +    }
> > +    bs->bl.min_mem_alignment =3D value;
> > +
> > +    ret =3D blkio_get_int(s->blkio, "optimal-buf-alignment", &value);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret,
> > +                         "failed to get \"optimal-buf-alignment\": %s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (value < 1) {
> > +        error_setg(errp, "invalid \"optimal-buf-alignment\" value %d, "
> > +                   "must be positive", value);
> > +        return;
> > +    }
> > +    bs->bl.opt_mem_alignment =3D value;
> > +
> > +    ret =3D blkio_get_int(s->blkio, "max-segments", &bs->bl.max_iov);
> > +    if (ret < 0) {
> > +        error_setg_errno(errp, -ret, "failed to get \"max-segments\": =
%s",
> > +                         blkio_get_error_msg());
> > +        return;
> > +    }
> > +    if (value < 1) {
> > +        error_setg(errp, "invalid \"max-segments\" value %d, must be p=
ositive",
> > +                   bs->bl.max_iov);
> > +        return;
> > +    }
> > +}
> > +
> > +/*
> > + * TODO
> > + * Missing libblkio APIs:
> > + * - write zeroes
> > + * - discard
>=20
> But you=E2=80=99ve added functionality for both here, haven=E2=80=99t you?

Yes, will fix!

>=20
> > + * - block_status
> > + * - co_invalidate_cache
> > + *
> > + * Out of scope?
> > + * - create
> > + * - truncate
>=20
> I don=E2=80=99t know why truncate would be out of scope, we even have tru=
ncate
> support for block devices so that users can signal size changes to qemu.
>=20
> I can see that it isn=E2=80=99t important right now, but I don=E2=80=99t =
think that makes it
> out of scope.
>=20
> (Creation seems out of scope, because you can just create regular files v=
ia
> the =E2=80=9Cfile=E2=80=9D driver.)

You're right, we need to do something for truncate. I have filed an
issue with libblkio, which currently does not support device capacity
changes:
https://gitlab.com/libblkio/libblkio/-/issues/39

Stefan

--xTfEiBWuoIoXdyu0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmL1U6AACgkQnKSrs4Gr
c8hQ3gf/WIwpKyOQVb4m4sAsAhOZnk3ddVOVgiX3G6F5O3tooY10RdqXR5gF6aOO
IfMbesGiKc/vwa0nu/48+o5ZrxeGb/U+Y1XvkTpMCPIKKrnaF/iDVnu43AvXakEp
aOaxq9qUtxpKfpxqBWcRO3QyhLJkOA7++l1YdlkyZFJehzkkFMDzEqX/kF4xdwhk
Czr4RnkCZL7BEJIcTU6VtFSqwQ92Tg4peEXGFrSYveGxu6RlbXjks7NjQb2EVTSP
mzXnfkhFix7KlDZc1eF5LTvwPp4Pqu501TKkImepZYSTGFPtzN7DVvOIRQy/gRC3
S7kjp6oLATGMDZPlHci/kqB1wPn9bg==
=s7Mo
-----END PGP SIGNATURE-----

--xTfEiBWuoIoXdyu0--


