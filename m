Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21EA652875
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 22:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kIb-0005a5-GA; Tue, 20 Dec 2022 16:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7kIZ-0005Zf-Cg
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:37:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1p7kIW-0001YK-PR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 16:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671572235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dnmr8Y2FNy8MuBv3RcZZaRq1eAVsfgJP/quWC/+hrS4=;
 b=gZbuJXD4Qk3dPmD3rT0LBbONHM/FPoRV1GB8BRssNpOI1imFKM3tA5LxYuaIbqvxBH71ZZ
 1DBKsxdK1uMsoCwuvXvm+GpDjAUrvTLTJFAH4f+RufsQAuEb634RGE3sQ3ayl2ZuxCCGnm
 S5nzp4gtdnJuQmcjFH4sSQ+tt5r7I+U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-6Sz83v62OEKdY0HDm7YKUg-1; Tue, 20 Dec 2022 16:37:12 -0500
X-MC-Unique: 6Sz83v62OEKdY0HDm7YKUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E20381495B;
 Tue, 20 Dec 2022 21:37:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCF58C16027;
 Tue, 20 Dec 2022 21:37:09 +0000 (UTC)
Date: Tue, 20 Dec 2022 16:37:08 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, dmitry.fomichev@wdc.com
Subject: Re: [RFC v5 2/3] virtio-blk: add zoned storage emulation for zoned
 devices
Message-ID: <Y6IrBOzv45S66R1g@fedora>
References: <20221219081644.11790-1-faithilikerun@gmail.com>
 <20221219081644.11790-3-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hJem8UhNzgBimrwM"
Content-Disposition: inline
In-Reply-To: <20221219081644.11790-3-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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


--hJem8UhNzgBimrwM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 04:16:43PM +0800, Sam Li wrote:
> This patch extends virtio-blk emulation to handle zoned device commands
> by calling the new block layer APIs to perform zoned device I/O on
> behalf of the guest. It supports Report Zone, four zone oparations (open,
> close, finish, reset), and Append Zone.
>=20
> The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> support zoned block devices. Regular block devices(conventional zones)
> will not be set.
>=20
> The guest os can use blktests, fio to test those commands on zoned device=
s.
> Furthermore, using zonefs to test zone append write is also supported.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  hw/block/virtio-blk-common.c |   2 +
>  hw/block/virtio-blk.c        | 383 +++++++++++++++++++++++++++++++++++
>  2 files changed, 385 insertions(+)
>=20
> diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.c
> index ac52d7c176..e2f8e2f6da 100644
> --- a/hw/block/virtio-blk-common.c
> +++ b/hw/block/virtio-blk-common.c
> @@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] =3D {
>       .end =3D endof(struct virtio_blk_config, discard_sector_alignment)},
>      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
>       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap)},
> +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> +     .end =3D endof(struct virtio_blk_config, zoned)},
>      {}
>  };
> =20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f717550fdc..2157157e7d 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -601,6 +601,331 @@ err:
>      return err_status;
>  }
> =20
> +typedef struct ZoneCmdData {
> +    VirtIOBlockReq *req;
> +    union {
> +        struct {
> +            unsigned int nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } zone_report_data;
> +        struct {
> +            int64_t offset;
> +        } zone_append_data;
> +    };
> +} ZoneCmdData;
> +
> +/*
> + * check zoned_request: error checking before issuing requests. If all c=
hecks
> + * passed, return true.
> + * append: true if only zone append requests issued.
> + */
> +static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int64_t =
len,
> +                             bool append, uint8_t *status) {
> +    BlockDriverState *bs =3D blk_bs(s->blk);
> +    int index =3D offset / bs->bl.zone_size;

Is bs->bl.zone_size 0 when !virtio_has_feature(s->host_features,
VIRTIO_BLK_F_ZONED)?

In that case there is a division by zero and the QEMU process crashes
with a SIGFPE signal.

The VIRTIO_BLK_F_ZONED check needs to be performed before calculating
index.

> +
> +    if (offset < 0 || len < 0 || len > (bs->total_sectors << BDRV_SECTOR=
_BITS)
> +        || offset > (bs->total_sectors << BDRV_SECTOR_BITS) - len) {
> +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        return false;
> +    }
> +
> +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> +        *status =3D VIRTIO_BLK_S_UNSUPP;
> +        return false;
> +    }
> +
> +    if (append) {
> +        if (bs->bl.write_granularity) {
> +            if ((offset % bs->bl.write_granularity) !=3D 0) {
> +                *status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> +                return false;
> +            }
> +        }
> +
> +        if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
> +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +            return false;
> +        }
> +
> +        if (len / 512 > bs->bl.max_append_sectors) {
> +            if (bs->bl.max_append_sectors =3D=3D 0) {
> +                *status =3D VIRTIO_BLK_S_UNSUPP;
> +            } else {
> +                *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +            }
> +            return false;
> +        }
> +    }
> +    return true;
> +}
> +
> +static void virtio_blk_zone_report_complete(void *opaque, int ret)
> +{
> +    ZoneCmdData *data =3D opaque;
> +    VirtIOBlockReq *req =3D data->req;
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> +    struct iovec *in_iov =3D req->elem.in_sg;
> +    unsigned in_num =3D req->elem.in_num;

in_iov/in_num must be passed in from virtio_blk_handle_request() (e.g.
via ZoneCmdData). req->elem.in_num is incorrect after
iov_discard_back_undoable() when the guest driver submits a single-byte
iovec as the final element.

> +    int64_t zrp_size, n, j =3D 0;
> +    int64_t nz =3D data->zone_report_data.nr_zones;
> +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    if (ret) {
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +
> +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zone_re=
port) {
> +            .nr_zones =3D cpu_to_le64(nz),
> +    };
> +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
> +    if (n !=3D sizeof(zrp_hdr)) {
> +        virtio_error(vdev, "Driver provided intput buffer that is too sm=
all!");

s/intput/input/

> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +
> +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size;
> +        i +=3D sizeof(struct virtio_blk_zone_descriptor), ++j) {
> +        struct virtio_blk_zone_descriptor desc =3D
> +            (struct virtio_blk_zone_descriptor) {
> +                .z_start =3D cpu_to_le64(data->zone_report_data.zones[j]=
=2Estart
> +                    >> BDRV_SECTOR_BITS),
> +                .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j].c=
ap
> +                    >> BDRV_SECTOR_BITS),
> +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].wp
> +                    >> BDRV_SECTOR_BITS),
> +        };
> +
> +        switch (data->zone_report_data.zones[j].type) {
> +        case BLK_ZT_CONV:
> +            desc.z_type =3D VIRTIO_BLK_ZT_CONV;
> +            break;
> +        case BLK_ZT_SWR:
> +            desc.z_type =3D VIRTIO_BLK_ZT_SWR;
> +            break;
> +        case BLK_ZT_SWP:
> +            desc.z_type =3D VIRTIO_BLK_ZT_SWP;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        switch (data->zone_report_data.zones[j].state) {
> +        case BLK_ZS_RDONLY:
> +            desc.z_state =3D VIRTIO_BLK_ZS_RDONLY;
> +            break;
> +        case BLK_ZS_OFFLINE:
> +            desc.z_state =3D VIRTIO_BLK_ZS_OFFLINE;
> +            break;
> +        case BLK_ZS_EMPTY:
> +            desc.z_state =3D VIRTIO_BLK_ZS_EMPTY;
> +            break;
> +        case BLK_ZS_CLOSED:
> +            desc.z_state =3D VIRTIO_BLK_ZS_CLOSED;
> +            break;
> +        case BLK_ZS_FULL:
> +            desc.z_state =3D VIRTIO_BLK_ZS_FULL;
> +            break;
> +        case BLK_ZS_EOPEN:
> +            desc.z_state =3D VIRTIO_BLK_ZS_EOPEN;
> +            break;
> +        case BLK_ZS_IOPEN:
> +            desc.z_state =3D VIRTIO_BLK_ZS_IOPEN;
> +            break;
> +        case BLK_ZS_NOT_WP:
> +            desc.z_state =3D VIRTIO_BLK_ZS_NOT_WP;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        /* TODO: it takes O(n^2) time complexity. Optimizations required=
=2E */
> +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
> +        if (n !=3D sizeof(desc)) {
> +            virtio_error(vdev, "Driver provided input buffer "
> +                               "for descriptors that is too small!");
> +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        }
> +    }
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    g_free(data->zone_report_data.zones);
> +    g_free(data);
> +}
> +
> +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
> +{
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    unsigned int nr_zones;
> +    ZoneCmdData *data;
> +    int64_t zone_size, offset;
> +    uint8_t err_status;
> +
> +    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
> +            sizeof(struct virtio_blk_zone_report) +
> +            sizeof(struct virtio_blk_zone_descriptor)) {
> +        virtio_error(vdev, "in buffer too small for zone report");
> +        return -1;
> +    }
> +
> +    /* start byte offset of the zone report */
> +    offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECTOR_BITS;
> +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> +        goto out;
> +    }
> +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> +                sizeof(struct virtio_blk_zone_report)) /
> +               sizeof(struct virtio_blk_zone_descriptor);
> +
> +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> +    data =3D g_malloc(sizeof(ZoneCmdData));
> +    data->req =3D req;
> +    data->zone_report_data.nr_zones =3D nr_zones;
> +    data->zone_report_data.zones =3D g_malloc(zone_size),
> +
> +    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_zones,
> +                        data->zone_report_data.zones,
> +                        virtio_blk_zone_report_complete, data);
> +    return 0;
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    return err_status;
> +}
> +
> +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
> +{
> +    VirtIOBlockReq *req =3D opaque;
> +    VirtIOBlock *s =3D req->dev;
> +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    if (ret) {
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +    }
> +
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +}
> +
> +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp =
op)
> +{
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    BlockDriverState *bs =3D blk_bs(s->blk);
> +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECT=
OR_BITS;
> +    uint64_t len;
> +    uint64_t capacity =3D bs->total_sectors << BDRV_SECTOR_BITS;
> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    uint32_t type =3D virtio_ldl_p(vdev, &req->out.type);
> +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> +        /* Entire drive capacity */
> +        offset =3D 0;
> +        len =3D capacity;
> +    } else {
> +        if (bs->bl.zone_size > capacity - offset) {
> +            /* The zoned device allows the last smaller zone. */
> +            len =3D capacity - bs->bl.zone_size * (bs->bl.nr_zones - 1);
> +        } else {
> +            len =3D bs->bl.zone_size;
> +        }
> +    }
> +
> +    if (!check_zoned_request(s, offset, len, false, &err_status)) {
> +        goto out;
> +    }
> +
> +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> +                      virtio_blk_zone_mgmt_complete, req);
> +
> +    return 0;
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    return err_status;
> +}
> +
> +static void virtio_blk_zone_append_complete(void *opaque, int ret)
> +{
> +    ZoneCmdData *data =3D opaque;
> +    VirtIOBlockReq *req =3D data->req;
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> +    int64_t append_sector, n;
> +    struct iovec *in_iov =3D req->elem.in_sg;
> +    unsigned in_num =3D req->elem.in_num;

Same as for report zones. in_iov/in_num must be passed in from
virtio_blk_handle_request().

> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    if (ret) {
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +
> +    virtio_stl_p(vdev, &append_sector,
> +                 data->zone_append_data.offset >> BDRV_SECTOR_BITS);

This must be stq because offset is 64 bits.

> +    n =3D iov_from_buf(in_iov, in_num, 0, &append_sector, sizeof(append_=
sector));
> +    if (n !=3D sizeof(append_sector)) {
> +        virtio_error(vdev, "Driver provided input buffer less than size =
of "
> +                           "append_sector");
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    g_free(data);
> +}
> +
> +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
> +                                         struct iovec *out_iov,
> +                                         uint64_t niov) {
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) << BDRV_SECT=
OR_BITS;
> +    int64_t len =3D iov_size(out_iov, niov);
> +
> +    if (!check_zoned_request(s, offset, len, true, &err_status)) {
> +        goto out;
> +    }
> +
> +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> +    data->req =3D req;
> +    data->zone_append_data.offset =3D offset;
> +    qemu_iovec_init_external(&req->qiov, out_iov, niov);
> +    blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &req->qi=
ov, 0,
> +                        virtio_blk_zone_append_complete, data);

Accounting is missing. Other I/O request types (read, write, flush) are
tracked (see BLOCK_ACCT_*). I think a new BLOCK_ACCT_APPEND enum
constant should be introduced.

This reminds me that QEMU's I/O throttling code doesn't know about
append operations either. Guests can bypass I/O throttling by submitting
append operations instead of writes. I think this can be left as a
separate task though. It's not directly related to the virtio-blk
emulation code.

> +    return 0;
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    return err_status;
> +}
> +
>  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer=
 *mrb)
>  {
>      uint32_t type;
> @@ -687,6 +1012,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq=
 *req, MultiReqBuffer *mrb)
>      case VIRTIO_BLK_T_FLUSH:
>          virtio_blk_handle_flush(req, mrb);
>          break;
> +    case VIRTIO_BLK_T_ZONE_REPORT:
> +        virtio_blk_handle_zone_report(req);
> +        break;
> +    case VIRTIO_BLK_T_ZONE_OPEN:
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
> +        break;
> +    case VIRTIO_BLK_T_ZONE_CLOSE:
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
> +        break;
> +    case VIRTIO_BLK_T_ZONE_FINISH:
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
> +        break;
> +    case VIRTIO_BLK_T_ZONE_RESET:
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> +        break;
> +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> +        break;
>      case VIRTIO_BLK_T_SCSI_CMD:
>          virtio_blk_handle_scsi(req);
>          break;
> @@ -705,6 +1048,13 @@ static int virtio_blk_handle_request(VirtIOBlockReq=
 *req, MultiReqBuffer *mrb)
>          virtio_blk_free_request(req);
>          break;
>      }
> +    case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> +        /*
> +         * It is not safe to access req->elem.out_sg directly because it
> +         * may be modified by virtio_blk_handle_request().
> +         */
> +        virtio_blk_handle_zone_append(req, out_iov, out_num);
> +        break;
>      /*
>       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined wi=
th
>       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch stat=
ement,
> @@ -904,6 +1254,7 @@ static void virtio_blk_update_config(VirtIODevice *v=
dev, uint8_t *config)
>  {
>      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
>      BlockConf *conf =3D &s->conf.conf;
> +    BlockDriverState *bs =3D blk_bs(s->blk);
>      struct virtio_blk_config blkcfg;
>      uint64_t capacity;
>      int64_t length;
> @@ -963,6 +1314,30 @@ static void virtio_blk_update_config(VirtIODevice *=
vdev, uint8_t *config)
>          blkcfg.write_zeroes_may_unmap =3D 1;
>          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
>      }
> +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> +        switch (bs->bl.zoned) {
> +        case BLK_Z_HM:
> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> +            break;
> +        case BLK_Z_HA:
> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> +                     bs->bl.zone_size / 512);
> +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> +                     bs->bl.max_active_zones);
> +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> +                     bs->bl.max_open_zones);
> +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
> +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> +                     bs->bl.max_append_sectors);
> +    } else {
> +        blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> +    }
>      memcpy(config, &blkcfg, s->config_size);
>  }
> =20
> @@ -1127,6 +1502,7 @@ static void virtio_blk_device_realize(DeviceState *=
dev, Error **errp)
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VirtIOBlock *s =3D VIRTIO_BLK(dev);
>      VirtIOBlkConf *conf =3D &s->conf;
> +    BlockDriverState *bs =3D blk_bs(conf->conf.blk);
>      Error *err =3D NULL;
>      unsigned i;
> =20
> @@ -1172,6 +1548,13 @@ static void virtio_blk_device_realize(DeviceState =
*dev, Error **errp)
>          return;
>      }
> =20
> +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> +        if (bs->bl.zoned =3D=3D BLK_Z_HM) {
> +            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DISCARD=
);
> +        }
> +    }
> +
>      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &&
>          (!conf->max_discard_sectors ||
>           conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> --=20
> 2.38.1
>=20

--hJem8UhNzgBimrwM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmOiKwQACgkQnKSrs4Gr
c8gC/QgAlf9tsAsp9G81Olq+Y7JSt6gbzozfTgI8CfndF+ffw90tsCAs+aUqCAEF
OQ03CUiy+QPGIbAyjLyOPLRnAY0cqBZwuEm78fxZKWgLhY9xxBKyDJ16RoNM1WRY
Yq9plyQwnHxn0XlOEckgoHUpaiV8l/H1VlusJRtVU7oXeXcouvLycpow86e+Bd6Y
NZQy1AY8i3LtyK3QuEKwMzI/O2LFzAmKJszwEF8k5pp7hpVNrXKDNJAu3ZP9LAiQ
CG3OHetRsRTwkeIvyz7beUQXBdVw7XKP5gUSvcLPYu3SDTxgxbWHTPspycLHnzpZ
o1pyWx3hKwfQPZtYB0OSfCkykkwAcw==
=O3HG
-----END PGP SIGNATURE-----

--hJem8UhNzgBimrwM--


