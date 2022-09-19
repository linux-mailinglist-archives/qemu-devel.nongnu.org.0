Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229A5BD665
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 23:34:25 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaOPI-0008Oz-9p
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 17:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaOMQ-0006nB-9o
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 17:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oaOML-0001ie-Jx
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 17:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663623080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rasjyEysGuzzAPFogv26eRAQKfPFRfw8aoTgQ+C3Szk=;
 b=cCu2kgJkp5CcoY4xsGbWrLgwlvK/apD0gvwaol/NrKFRKDCTIYv9RZmlnKHvRLWTK5rfaI
 Z+2UnB/eV2nbp5dEK4fOZ97Ccel/UNI8gqCwrBpwidkv9wBHUYHBFd+aMTZuukoR5cFE8/
 8kK+c42Kcjh3kk3+tkYESX2C3aZvhqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-nkMQkau6O0OjAjoRwCllMw-1; Mon, 19 Sep 2022 17:31:15 -0400
X-MC-Unique: nkMQkau6O0OjAjoRwCllMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6B88185A78B;
 Mon, 19 Sep 2022 21:31:14 +0000 (UTC)
Received: from localhost (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF2E492CA2;
 Mon, 19 Sep 2022 21:31:13 +0000 (UTC)
Date: Mon, 19 Sep 2022 17:25:23 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com
Subject: Re: [PATCH 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
Message-ID: <YyjeQ6yYALiUvBjO@fedora>
References: <20220910065057.35017-1-faithilikerun@gmail.com>
 <20220910065057.35017-2-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xqtoJt5WPCg6gSYd"
Content-Disposition: inline
In-Reply-To: <20220910065057.35017-2-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xqtoJt5WPCg6gSYd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2022 at 02:50:57PM +0800, Sam Li wrote:
> This patch extends virtio-blk emulation to handle zoned device commands
> by calling the new block layer APIs to perform zoned device I/O on
> behalf of the guest. It supports Report Zone, four zone oparations (open,
> close, finish, reset), and Append Zone.
>=20
> The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> support zoned block devices. Regular block devices(conventional zones)
> will not be set.
>=20
> The guest os having zoned device support can use blkzone(8) to test those
> commands. Furthermore, using zonefs to test zone append write is also
> supported.
>=20
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  hw/block/virtio-blk.c | 326 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 326 insertions(+)
>=20
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index e9ba752f6b..3ef74c01db 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -46,6 +46,8 @@ static const VirtIOFeature feature_sizes[] =3D {
>       .end =3D endof(struct virtio_blk_config, discard_sector_alignment)},
>      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
>       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap)},
> +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> +     .end =3D endof(struct virtio_blk_config, zoned)},
>      {}
>  };
> =20
> @@ -614,6 +616,273 @@ err:
>      return err_status;
>  }
> =20
> +typedef struct ZoneCmdData {
> +    VirtIOBlockReq *req;
> +    union {
> +        struct {
> +            unsigned int nr_zones;
> +            BlockZoneDescriptor *zones;
> +        } ZoneReportData;
> +        struct {
> +            int64_t append_sector;
> +        } ZoneAppendData;

Field names should be lowercase:

  struct {
      unsigned int nr_zones;
      BlockZoneDescriptor *zones;
  } zone_report_data;
  struct {
      int64_t append_sector;
  } zone_append_data;

> +    };
> +} ZoneCmdData;
> +
> +/*
> + * check zone_model: error checking before issuing requests. If all chec=
ks

Maybe rename it to check_zoned_request()? It does more than check the
model.

> + * passed, return true.
> + * append: true if only zone append request issued.
> + */
> +static bool check_zone_model(VirtIOBlock *s, int64_t sector, int64_t nr_=
sector,
> +                             bool append, uint8_t *status) {
> +    BlockDriverState *bs =3D blk_bs(s->blk);
> +    BlockZoneDescriptor *zone =3D &bs->bl.zones[sector / bs->bl.zone_sec=
tors];

Inputs from the guest driver are untrusted and must be validated before
using them. sector could have any value here, including invalid values.
Please check that sector is less than the device capacity and also that
it is positive.

> +    int64_t max_append_sector =3D bs->bl.max_append_sectors;
> +
> +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> +        *status =3D VIRTIO_BLK_S_UNSUPP;
> +        return false;
> +    }
> +
> +    if (zone->cond =3D=3D BLK_ZS_OFFLINE) {
> +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        return false;
> +    }
> +
> +    if (append) {
> +        if ((zone->type !=3D BLK_ZT_SWR) || (zone->cond =3D=3D BLK_ZS_RD=
ONLY) ||
> +            (sector + nr_sector > (*(zone + 1)).start)) {
> +            /* the end sector of the request exceeds to next zone */
> +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +            return false;
> +        }
> +
> +        if (nr_sector > max_append_sector) {
> +            if (max_append_sector =3D=3D 0) {
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
> +    int64_t zrp_size, nz, n, j =3D 0;
> +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    nz =3D data->ZoneReportData.nr_zones;
> +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zone_re=
port) {
> +            .nr_zones =3D cpu_to_le64(nz),
> +    };
> +
> +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
> +    if (n !=3D sizeof(zrp_hdr)) {
> +        virtio_error(vdev, "Driver provided intput buffer that is too sm=
all!");
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +
> +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size; i +=3D sizeof(struc=
t virtio_blk_zone_descriptor), ++j) {
> +        struct virtio_blk_zone_descriptor desc =3D
> +                (struct virtio_blk_zone_descriptor) {
> +                        .z_start =3D cpu_to_le64(data->ZoneReportData.zo=
nes[j].start),
> +                        .z_cap =3D cpu_to_le64(data->ZoneReportData.zone=
s[j].cap),
> +                        .z_wp =3D cpu_to_le64(data->ZoneReportData.zones=
[j].wp),

If the QEMU block layer uses byte constants it will be necessary to
convert the above fields to sectors. I think the code is correct right
now because the QEMU block layer patches still use sectors, but using
bytes would be consistent with the QEMU block layer conventions.

> +                        .z_type =3D data->ZoneReportData.zones[j].type,
> +                        .z_state =3D data->ZoneReportData.zones[j].cond,

The QEMU type and cond field constants might not match the virtio-blk
constants. Please convert them explicitly (e.g. with a switch
statement in a helper function) so there is no assumption about the
values of the constants.

> +                };
> +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));

This is O(n^2) time complexity since it's called from the loop, but
nevermind for now... Maybe add a TODO comment so anyone trying to
optimize this code will immediately see the expensive part.

> +        if (n !=3D sizeof(desc)) {
> +            virtio_error(vdev, "Driver provided input buffer "
> +                               "for descriptors that is too small!");
> +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +            goto out;
> +        }
> +    }
> +    goto out;
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    g_free(data->ZoneReportData.zones);
> +    g_free(data);
> +}
> +
> +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    unsigned int nr_zones;
> +    ZoneCmdData *data;
> +    int64_t zone_size, offset;
> +    uint8_t err_status;
> +
> +    if (req->in_len <=3D sizeof(struct virtio_blk_inhdr) +
> +                       sizeof(struct virtio_blk_zone_report)) {
> +        virtio_error(vdev, "in buffer too small for zone report");
> +        return -1;
> +    }
> +
> +    /* start byte offset of the zone report */
> +    offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> +    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
> +        goto out;
> +    }
> +
> +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> +                sizeof(struct virtio_blk_zone_report)) /
> +               sizeof(struct virtio_blk_zone_descriptor);
> +
> +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> +    data =3D g_malloc(sizeof(ZoneCmdData));
> +    data->req =3D req;
> +    data->ZoneReportData.nr_zones =3D nr_zones;
> +    data->ZoneReportData.zones =3D g_malloc(zone_size),

nr_zones =3D 0 and zones =3D NULL is possible when in_len is sizeof(struct
virtio_blk_inhdr) + sizeof(struct virtio_blk_zone_report) + 1. Maybe the
code handles it okay without dereferencing a NULL pointer, but it would
be safer to change the check above like this:

  if (req->in_len < sizeof(struct virtio_blk_inhdr) +
                    sizeof(struct virtio_blk_zone_report) +
                    sizeof(struct virtio_blk_zone_descriptor)) {
      virtio_error(vdev, "in buffer too small for zone report");
      return -1;
  }

> +
> +    blk_aio_zone_report(s->blk, offset, &data->ZoneReportData.nr_zones,
> +                        data->ZoneReportData.zones,
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
> +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
> +    ZoneCmdData *data =3D opaque;
> +    VirtIOBlockReq *req =3D data->req;
> +    VirtIOBlock *s =3D req->dev;

Missing ret < 0 error handling.

> +
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    g_free(data);
> +}
> +
> +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp =
op) {
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    BlockDriverState *bs =3D blk_bs(s->blk);
> +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> +    uint64_t len;
> +    uint32_t type;
> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
> +        goto out;
> +    }
> +
> +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> +    data->req =3D req;
> +
> +    type =3D virtio_ldl_p(vdev, &req->out.type);
> +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> +        /* Entire drive capacity */
> +        offset =3D 0;
> +        blk_get_geometry(s->blk, &len);
> +        len *=3D 512;
> +    } else {
> +        len =3D bs->bl.zone_sectors * 512;

Is this correct when accessing the last zone of the device?

> +    }
> +
> +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> +                      virtio_blk_zone_mgmt_complete, data);
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
> +static void virtio_blk_zone_append_complete(void *opaque, int ret) {
> +    ZoneCmdData *data =3D opaque;
> +    VirtIOBlockReq *req =3D data->req;
> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> +    int64_t append_sector, n;
> +    struct iovec *out_iov =3D req->elem.out_sg;
> +    unsigned out_num =3D req->elem.out_num;
> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;

Error handling code for the ret < 0 case is missing.

> +
> +    append_sector =3D data->ZoneAppendData.append_sector;
> +    int write_granularity =3D s->conf.conf.logical_block_size;
> +    if ((append_sector * 512 % write_granularity) !=3D 0) {
> +        err_status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> +        goto out;
> +    }

This looks like input validation. Why is it performed after the I/O
request has completed?

I guess the intent is to check the value that the guest driver provided,
not the value produced by the device after the I/O request completed?

> +    n =3D iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(append_=
sector));

Please use virtio_stq_p() on append_sector first to ensure that the
endianness is correct.

> +    if (n !=3D sizeof(append_sector)) {
> +        virtio_error(vdev, "Driver provided input buffer less than size =
of "
> +                     "append_sector");
> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> +        goto out;
> +    }
> +    goto out;
> +
> +out:
> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> +    virtio_blk_req_complete(req, err_status);
> +    virtio_blk_free_request(req);
> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> +    g_free(data);
> +}
> +
> +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {

The return value is not used. Please change the return type to void.

> +    VirtIOBlock *s =3D req->dev;
> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    uint64_t niov =3D req->elem.out_num;
> +    struct iovec *out_iov =3D req->elem.out_sg;
> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> +
> +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> +    int64_t len =3D 0;
> +    for (int i =3D 1; i < niov; ++i) {
> +        len +=3D out_iov[i].iov_len;
> +    }

Why is the first iovec skipped?

> +
> +    if (!check_zone_model(s, offset / 512, len / 512, true, &err_status)=
) {
> +        goto out;
> +    }
> +
> +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> +    data->req =3D req;
> +    data->ZoneAppendData.append_sector =3D offset;
> +    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
> +    blk_aio_zone_append(s->blk, &data->ZoneAppendData.append_sector, &re=
q->qiov, 0,
> +                        virtio_blk_zone_append_complete, data);
> +
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
> @@ -700,6 +969,24 @@ static int virtio_blk_handle_request(VirtIOBlockReq =
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
> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
> +        break;
>      case VIRTIO_BLK_T_SCSI_CMD:
>          virtio_blk_handle_scsi(req);
>          break;
> @@ -718,6 +1005,9 @@ static int virtio_blk_handle_request(VirtIOBlockReq =
*req, MultiReqBuffer *mrb)
>          virtio_blk_free_request(req);
>          break;
>      }
> +   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> +       virtio_blk_handle_zone_append(req);
> +       break;
>      /*
>       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined wi=
th
>       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch stat=
ement,
> @@ -917,6 +1207,7 @@ static void virtio_blk_update_config(VirtIODevice *v=
dev, uint8_t *config)
>  {
>      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
>      BlockConf *conf =3D &s->conf.conf;
> +    BlockDriverState *state =3D blk_bs(s->blk);

Usually the variable is called "bs". Please use that name here and
elsewhere in the patch.

>      struct virtio_blk_config blkcfg;
>      uint64_t capacity;
>      int64_t length;
> @@ -976,6 +1267,31 @@ static void virtio_blk_update_config(VirtIODevice *=
vdev, uint8_t *config)
>          blkcfg.write_zeroes_may_unmap =3D 1;
>          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
>      }
> +#ifdef CONFIG_BLKZONED

Is this ifdef appropriate? I think bs->bl.zoned should always be
available, even when <blkzoned.h> is missing (e.g. non-Linux system). In
the future there may be an emulated zoned BlockDriver. virtio-blk
should be able to use the emulated zoned BlockDriver even on non-Linux
systems.

I think CONFIG_BLKZONED should be limited to block/file-posix.c.

> +    if (state->bl.zoned !=3D BLK_Z_NONE) {
> +        switch (state->bl.zoned) {
> +        case BLK_Z_HM:
> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> +            virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> +                         state->bl.zone_sectors);
> +            virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> +                         state->bl.max_active_zones);
> +            virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> +                         state->bl.max_open_zones);
> +            virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size=
);
> +            virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> +                         state->bl.max_append_sectors);
> +            break;
> +        case BLK_Z_HA:
> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;

The block limits aren't relevant to host-aware zoned devices?

> +            break;
> +        default:
> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> +            virtio_error(vdev, "Invalid zoned model %x \n", (int)state->=
bl.zoned);
> +            break;
> +        }
> +    }
> +#endif
>      memcpy(config, &blkcfg, s->config_size);
>  }
> =20
> @@ -995,6 +1311,7 @@ static uint64_t virtio_blk_get_features(VirtIODevice=
 *vdev, uint64_t features,
>                                          Error **errp)
>  {
>      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> +    BlockDriverState *state =3D blk_bs(s->blk);
> =20
>      /* Firstly sync all virtio-blk possible supported features */
>      features |=3D s->host_features;
> @@ -1003,6 +1320,12 @@ static uint64_t virtio_blk_get_features(VirtIODevi=
ce *vdev, uint64_t features,
>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
>      virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> +    if (state->bl.zoned !=3D BLK_Z_NONE) {
> +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> +        if (state->bl.zoned =3D=3D BLK_Z_HM) {
> +            virtio_clear_feature(&features, VIRTIO_BLK_F_DISCARD);

Why is features modified here but s->host_features is modified in the
line above?

> +        }
> +    }

This detects VIRTIO_BLK_F_ZONED based on the BlockDriverState...

>      if (virtio_has_feature(features, VIRTIO_F_VERSION_1)) {
>          if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_SCSI)) {
>              error_setg(errp, "Please set scsi=3Doff for virtio-blk devic=
es in order to use virtio 1.0");
> @@ -1286,6 +1609,9 @@ static Property virtio_blk_properties[] =3D {
>  #ifdef __linux__
>      DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
>                        VIRTIO_BLK_F_SCSI, false),
> +#endif
> +#ifdef CONFIG_BLKZONED
> +    DEFINE_PROP_BIT64("zoned", VirtIOBlock, host_features, VIRTIO_BLK_F_=
ZONED, true),
>  #endif

=2E..but this allows users to enable/disable the flag from the
command-line.

I think DEFINE_PROP_BIT64() can be removed, but please check that the
config space size is still correct. It may be necessary to move the
bs->bl.zoned check into virtio_blk_device_realize() and set
the VIRTIO_BLK_F_ZONED s->host_features bit there instead. That will
allow the s->config_size calculation to work correctly.

--xqtoJt5WPCg6gSYd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMo3kIACgkQnKSrs4Gr
c8jXyAgAit/kSjNCjXqe5xerwXXzD8DM9cuS6fb4B8ALA9OC8RLqRsTkXxyzkrdV
gCsekXpSsrZmOQD6Lo0/5LH1IKPQUuBAYMud8whzBy0FkHOFF55lxhC2pPG9qpBu
Ny7dwb9ca1dMeDfHUPrwrSCzzlkKu39cmOWXix5EbxJ2nlQDJudiubRQB+oX6vZP
2oz54gAISuBef4pHFXNX6TIUfCa2VRuDxE5h0d0zt519AhrVyxtkl6EQi0jSa1pc
qfx+bFgXHxrzt8qlTWozu/1BtZggdUaEE94BpuJHN8T0e0LhswQUShC+C6abg/pu
9A208gGoCkMDCZdXzSqisADVaC/Dfg==
=vhEW
-----END PGP SIGNATURE-----

--xqtoJt5WPCg6gSYd--


