Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D3602818
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:17:36 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiiw-00034k-DM
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1okiOA-0003dN-5h; Tue, 18 Oct 2022 04:55:56 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1okiO6-0006Um-OQ; Tue, 18 Oct 2022 04:55:53 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id q83so6560365vkb.2;
 Tue, 18 Oct 2022 01:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqS/3EBAOEjdy92PKVOiREIg5AUGYZKTV9lQIo5FZzs=;
 b=UayT5ShAaP6+v3IMjyaUEOx66Ga8GyP+JUGOGA5A4yQQR4VFLxDrZ1YlPHGLGGcBJ8
 RHzo6BPrt1byt5aG0/mK6/f8wM+U5BW5exXeWc9UVWHnjvwiUb1FdPVtd1EC7jLb55U/
 dMI8099XytIXUFUNLCchbs262DYcqJphp3Z03okirgOZIc0aijTGH9HiDTlJZGOA/pwi
 aXM3yOtJ3pYG7Rr0LXRFuigGjdGjoRCS8sdmzFbqNKU0epk/4xkHaYnWkWKYAMKPvnTW
 8JSQ91HiQ9s5YC2sn/Tlldj1aTh9V2lbnckn7FuV7x0dSVFHe+mE7DPS5XjX98qWi+G7
 gnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqS/3EBAOEjdy92PKVOiREIg5AUGYZKTV9lQIo5FZzs=;
 b=fEtbStIFHs1YOk8VBg9fBr/Rg2QYgv1EZkGWxFFiP0QkQ9bWpdvnYEMpVa+LLG+OOj
 ee2WTjXfXN2AJrlvyZSlgd3T72ozkyz82BN8qTde37g54SnTuWQWNshcjpvWXFNIGTBL
 qH3tgbfYxoDrwSD6SKKUHFvgMu9Aod7vDr+Q/O1Yglu7QRUaWYxMOXcLG4txyLJeo1VT
 7Hekwjp7JkFISsegDzDcDLPG8qQtLisylzZT7LVkZciaMdvk6jRAkSHydGeNq5YVRwSk
 1eqiDCQZVRWSKoztjsCv4Gqry6oRsUt59syDwZGEN8ldmPJklPj8NjJ6tkuR8oOsQBHZ
 vgpw==
X-Gm-Message-State: ACrzQf1jVXsVYvWbZT5nR3nomEdfYqiBgU6YWIdpnzcS+qVCnZEjH/Sc
 KvAnOIDtRAe0siyVCvfY/EO/ICd2J82gwqmeexY=
X-Google-Smtp-Source: AMsMyM6ZCK4l9BqpaLyyKO481TRWfiRZF79KcIXITyHeQQzg00BN7sOTpgMb7Ye6vLqpLp+ockJ7Myq6KsfVsvLmRgo=
X-Received: by 2002:a05:6122:208b:b0:3ae:e137:f25 with SMTP id
 i11-20020a056122208b00b003aee1370f25mr771269vkd.38.1666083346845; Tue, 18 Oct
 2022 01:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221016150506.172675-1-faithilikerun@gmail.com>
 <20221016150506.172675-3-faithilikerun@gmail.com>
 <e9595acb7ba7adeb976f4cf6ea793316b8195470.camel@wdc.com>
In-Reply-To: <e9595acb7ba7adeb976f4cf6ea793316b8195470.camel@wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 18 Oct 2022 16:56:04 +0800
Message-ID: <CAAAx-8K52gf6di-tgaJgQB8rMnvgOJWdkBnwozGgN5_1AQ2=xw@mail.gmail.com>
Subject: Re: [RFC v3 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "hreitz@redhat.com" <hreitz@redhat.com>, 
 "hare@suse.de" <hare@suse.de>, "stefanha@redhat.com" <stefanha@redhat.com>, 
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>, 
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dmitry Fomichev <Dmitry.Fomichev@wdc.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=88=
17=E6=97=A5=E5=91=A8=E4=B8=80 09:01=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, 2022-10-16 at 23:05 +0800, Sam Li wrote:
> > This patch extends virtio-blk emulation to handle zoned device commands
> > by calling the new block layer APIs to perform zoned device I/O on
> > behalf of the guest. It supports Report Zone, four zone oparations (ope=
n,
> > close, finish, reset), and Append Zone.
> >
> > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > support zoned block devices. Regular block devices(conventional zones)
> > will not be set.
> >
> > Then the guest os can use blkzone(8) to test those commands on zoned de=
vices.
> > Furthermore, using zonefs to test zone append write is also supported.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  hw/block/virtio-blk-common.c   |   2 +
> >  hw/block/virtio-blk.c          | 412 ++++++++++++++++++++++++++++++++-
> >  include/hw/virtio/virtio-blk.h |  11 +-
> >  3 files changed, 422 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.=
c
> > index ac52d7c176..e2f8e2f6da 100644
> > --- a/hw/block/virtio-blk-common.c
> > +++ b/hw/block/virtio-blk-common.c
> > @@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] =3D {
> >       .end =3D endof(struct virtio_blk_config, discard_sector_alignment=
)},
> >      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
> >       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap)}=
,
> > +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> > +     .end =3D endof(struct virtio_blk_config, zoned)},
> >      {}
> >  };
> >
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index 8131ec2dbc..58891aea31 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -26,6 +26,9 @@
> >  #include "hw/virtio/virtio-blk.h"
> >  #include "dataplane/virtio-blk.h"
> >  #include "scsi/constants.h"
> > +#if defined(CONFIG_BLKZONED)
> > +#include <linux/blkzoned.h>
> > +#endif
> >  #ifdef __linux__
> >  # include <scsi/sg.h>
> >  #endif
> > @@ -55,10 +58,29 @@ static void virtio_blk_req_complete(VirtIOBlockReq =
*req,
> > unsigned char status)
> >  {
> >      VirtIOBlock *s =3D req->dev;
> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    int64_t inhdr_len, n;
> > +    void *buf;
> >
> >      trace_virtio_blk_req_complete(vdev, req, status);
> >
> > -    stb_p(&req->in->status, status);
> > +    iov_discard_undo(&req->inhdr_undo);
> > +    if (virtio_ldl_p(vdev, &req->out.type) =3D=3D VIRTIO_BLK_T_ZONE_AP=
PEND) {
> > +        inhdr_len =3D sizeof(struct virtio_blk_zone_append_inhdr);
> > +        req->in.in_hdr->status =3D status;
> > +        buf =3D req->in.in_hdr;
> > +    } else {
> > +        inhdr_len =3D sizeof(struct virtio_blk_inhdr);
> > +        req->in.zone_append_inhdr->status =3D status;
> > +        buf =3D req->in.zone_append_inhdr;
> > +    }
> > +
> > +    n =3D iov_from_buf(req->elem.in_sg, req->elem.in_num,
> > +                     req->in_len - inhdr_len, buf, inhdr_len);
> > +    if (n !=3D inhdr_len) {
> > +        virtio_error(vdev, "Driver provided input buffer less than siz=
e of "
> > +                     "in header");
> > +    }
> > +
> >      iov_discard_undo(&req->inhdr_undo);
> >      iov_discard_undo(&req->outhdr_undo);
> >      virtqueue_push(req->vq, &req->elem, req->in_len);
> > @@ -592,6 +614,334 @@ err:
> >      return err_status;
> >  }
> >
> > +typedef struct ZoneCmdData {
> > +    VirtIOBlockReq *req;
> > +    union {
> > +        struct {
> > +            unsigned int nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } zone_report_data;
> > +        struct {
> > +            int64_t offset;
> > +        } zone_append_data;
> > +    };
> > +} ZoneCmdData;
> > +
> > +/*
> > + * check zoned_request: error checking before issuing requests. If all=
 checks
> > + * passed, return true.
> > + * append: true if only zone append requests issued.
> > + */
> > +static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int64_=
t len,
> > +                             bool append, uint8_t *status) {
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    int index =3D offset / bs->bl.zone_size;
> > +
> > +    if (offset < 0 || len < 0 || offset > bs->bl.capacity - len) {
> > +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        return false;
> > +    }
> > +
> > +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> > +        *status =3D VIRTIO_BLK_S_UNSUPP;
> > +        return false;
> > +    }
> > +
> > +    if (append) {
> > +        if ((offset % bs->bl.write_granularity) !=3D 0) {
> > +            *status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> > +            return false;
> > +        }
> > +
> > +        if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
> > +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            return false;
> > +        }
> > +
> > +        if (len / 512 > bs->bl.max_append_sectors) {
> > +            if (bs->bl.max_append_sectors =3D=3D 0) {
> > +                *status =3D VIRTIO_BLK_S_UNSUPP;
> > +            } else {
> > +                *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            }
> > +            return false;
> > +        }
> > +    }
> > +    return true;
> > +}
> > +
> > +static void virtio_blk_zone_report_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > +    struct iovec *in_iov =3D req->elem.in_sg;
> > +    unsigned in_num =3D req->elem.in_num;
> > +    int64_t zrp_size, nz, n, j =3D 0;
> > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    nz =3D data->zone_report_data.nr_zones;
> > +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zone_=
report) {
> > +            .nr_zones =3D cpu_to_le64(nz),
> > +    };
> > +
> > +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> > +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> > +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
> > +    if (n !=3D sizeof(zrp_hdr)) {
> > +        virtio_error(vdev, "Driver provided intput buffer that is too
> > small!");
>
> s/intput/input
>
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size;
> > +        i +=3D sizeof(struct virtio_blk_zone_descriptor), ++j) {
> > +        struct virtio_blk_zone_descriptor desc =3D
> > +            (struct virtio_blk_zone_descriptor) {
> > +                .z_start =3D cpu_to_le64(data->zone_report_data.zones[=
j].start)
> > +                    >> BDRV_SECTOR_BITS,
> > +                .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j]=
.cap)
> > +                    >> BDRV_SECTOR_BITS,
> > +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].=
wp)
> > +                    >> BDRV_SECTOR_BITS,
>
> I think these should be
>
> +                .z_start =3D cpu_to_le64(data->zone_report_data.zones[j]=
.start
> +                    >> BDRV_SECTOR_BITS),
> +                .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j].c=
ap
> +                    >> BDRV_SECTOR_BITS),
> +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].wp
> +                    >> BDRV_SECTOR_BITS),
>
> > +        };
> > +
> > +        switch (data->zone_report_data.zones[j].type) {
> > +        case BLK_ZT_CONV:
> > +            desc.z_type =3D BLK_ZONE_TYPE_CONVENTIONAL;
> > +            break;
> > +        case BLK_ZT_SWR:
> > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_REQ;
> > +            break;
> > +        case BLK_ZT_SWP:
> > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_PREF;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
>
> why do we need to convert these to system-defined values?
> The output of this function will be sent to the driver that
> uses the values defined in virtio-zbd spec. And the conversion
> to BLK_ZS_xxx/BLK_ZT_xxx has already been done in parse_zone()
> function in file-posix.c

Because QEMU may use different macro values compared to Linux. It is
for avoiding passing wrong values to the guest. Parse_zone() converts
Linux macros to QEMU macros and QEMU macros will change back to
Linux's defined values here.

>
> > +
> > +        switch (data->zone_report_data.zones[j].cond) {
> > +        case BLK_ZS_RDONLY:
> > +            desc.z_state =3D BLK_ZONE_COND_READONLY;
> > +            break;
> > +        case BLK_ZS_OFFLINE:
> > +            desc.z_state =3D BLK_ZONE_COND_OFFLINE;
> > +            break;
> > +        case BLK_ZS_EMPTY:
> > +            desc.z_state =3D BLK_ZONE_COND_EMPTY;
> > +            break;
> > +        case BLK_ZS_CLOSED:
> > +            desc.z_state =3D BLK_ZONE_COND_CLOSED;
> > +            break;
> > +        case BLK_ZS_FULL:
> > +            desc.z_state =3D BLK_ZONE_COND_FULL;
> > +            break;
> > +        case BLK_ZS_EOPEN:
> > +            desc.z_state =3D BLK_ZONE_COND_EXP_OPEN;
> > +            break;
> > +        case BLK_ZS_IOPEN:
> > +            desc.z_state =3D BLK_ZONE_COND_IMP_OPEN;
> > +            break;
> > +        case BLK_ZS_NOT_WP:
> > +            desc.z_state =3D BLK_ZONE_COND_NOT_WP;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
>
> same here. I think the code to form the descriptor can be reduced to
>
> +        struct virtio_blk_zone_descriptor desc =3D (struct
> virtio_blk_zone_descriptor) {
> +            .z_start =3D cpu_to_le64(data->zone_report_data.zones[j].sta=
rt >>
> BDRV_SECTOR_BITS),
> +            .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j].cap >=
>
> BDRV_SECTOR_BITS),
> +            .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].wp >>
> BDRV_SECTOR_BITS),
> +            .z_type =3D data->zone_report_data.zones[j].type,
> +            .z_state =3D data->zone_report_data.zones[j].state,
> +        };
>
> > +
> > +        /* TODO: it takes O(n^2) time complexity. Optimizations requir=
ed. */
> > +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
> > +        if (n !=3D sizeof(desc)) {
> > +            virtio_error(vdev, "Driver provided input buffer "
> > +                               "for descriptors that is too small!");
> > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            goto out;
> > +        }
> > +    }
> > +    goto out;
>
> this goto is not needed.
>
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data->zone_report_data.zones);
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
> > +{
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    unsigned int nr_zones;
> > +    ZoneCmdData *data;
> > +    int64_t zone_size, offset;
> > +    uint8_t err_status;
> > +
> > +    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
> > +            sizeof(struct virtio_blk_zone_report) +
> > +            sizeof(struct virtio_blk_zone_descriptor)) {
> > +        virtio_error(vdev, "in buffer too small for zone report");
> > +        return -1;
> > +    }
> > +
> > +    /* start byte offset of the zone report */
> > +    offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > +        goto out;
> > +    }
> > +
> > +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> > +                sizeof(struct virtio_blk_zone_report)) /
> > +               sizeof(struct virtio_blk_zone_descriptor);
> > +
> > +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> > +    data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    data->zone_report_data.nr_zones =3D nr_zones;
> > +    data->zone_report_data.zones =3D g_malloc(zone_size),
> > +
> > +    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_zon=
es,
> > +                        data->zone_report_data.zones,
> > +                        virtio_blk_zone_report_complete, data);
> > +    return 0;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> > +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +    goto out;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneO=
p op)
> > +{
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    uint64_t len;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    uint32_t type =3D virtio_ldl_p(vdev, &req->out.type);
> > +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> > +        /* Entire drive capacity */
> > +        offset =3D 0;
> > +        len =3D bs->bl.capacity;
> > +    } else {
> > +        if (bs->bl.zone_size > bs->bl.capacity - offset) {
> > +            /* The zoned device allows the last smaller zone. */
> > +            len =3D bs->bl.capacity - bs->bl.zone_size * (bs->bl.nr_zo=
nes - 1);
> > +        } else {
> > +            len =3D bs->bl.zone_size;
> > +        }
> > +    }
> > +
> > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> > +                      virtio_blk_zone_mgmt_complete, data);
> > +
> > +    return 0;
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> > +static void virtio_blk_zone_append_complete(void *opaque, int ret)
> > +{
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    struct iovec *in_iov =3D req->elem.in_sg;
> > +    unsigned in_num =3D req->elem.in_num;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (ret) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    struct virtio_blk_zone_append_inhdr zap_hdr =3D
> > +        (struct virtio_blk_zone_append_inhdr) {
> > +        .append_sector =3D cpu_to_le64(data->zone_append_data.offset
> > +            >> BDRV_SECTOR_BITS),
> > +    };
> > +    iov_from_buf(in_iov, in_num, 0, &zap_hdr, sizeof(zap_hdr));
> > +    goto out;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
> > +                                         struct iovec *out_iov,
> > +                                         uint64_t niov) {
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    int64_t len =3D iov_size(out_iov, niov);
> > +
> > +    if (!check_zoned_request(s, offset, len, true, &err_status)) {
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    data->zone_append_data.offset =3D offset;
> > +    qemu_iovec_init_external(&req->qiov, out_iov, niov);
> > +    blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &req->=
qiov, 0,
> > +                        virtio_blk_zone_append_complete, data);
> > +    return 0;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    return err_status;
> > +}
> > +
> >  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuff=
er *mrb)
> >  {
> >      uint32_t type;
> > @@ -624,7 +974,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq=
 *req,
> > MultiReqBuffer *mrb)
> >
> >      /* We always touch the last byte, so just see how big in_iov is.  =
*/
> >      req->in_len =3D iov_size(in_iov, in_num);
> > -    req->in =3D (void *)in_iov[in_num - 1].iov_base
> > +    req->in.in_hdr =3D (void *)in_iov[in_num - 1].iov_base
> >                + in_iov[in_num - 1].iov_len
> >                - sizeof(struct virtio_blk_inhdr);
> >      iov_discard_back_undoable(in_iov, &in_num, sizeof(struct
> > virtio_blk_inhdr),
> > @@ -678,6 +1028,24 @@ static int virtio_blk_handle_request(VirtIOBlockR=
eq *req,
> > MultiReqBuffer *mrb)
> >      case VIRTIO_BLK_T_FLUSH:
> >          virtio_blk_handle_flush(req, mrb);
> >          break;
> > +    case VIRTIO_BLK_T_ZONE_REPORT:
> > +        virtio_blk_handle_zone_report(req);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_OPEN:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_CLOSE:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_FINISH:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_RESET:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > +        break;
> > +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > +        break;
> >      case VIRTIO_BLK_T_SCSI_CMD:
> >          virtio_blk_handle_scsi(req);
> >          break;
> > @@ -696,6 +1064,13 @@ static int virtio_blk_handle_request(VirtIOBlockR=
eq *req,
> > MultiReqBuffer *mrb)
> >          virtio_blk_free_request(req);
> >          break;
> >      }
> > +    case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> > +        /*
> > +         * It is not safe to access req->elem.out_sg directly because =
it
> > +         * may be modified by virtio_blk_handle_request().
> > +         */
> > +        virtio_blk_handle_zone_append(req, out_iov, out_num);
> > +        break;
> >      /*
> >       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined =
with
> >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch st=
atement,
> > @@ -895,6 +1270,7 @@ static void virtio_blk_update_config(VirtIODevice =
*vdev,
> > uint8_t *config)
> >  {
> >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> >      BlockConf *conf =3D &s->conf.conf;
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> >      struct virtio_blk_config blkcfg;
> >      uint64_t capacity;
> >      int64_t length;
> > @@ -954,6 +1330,30 @@ static void virtio_blk_update_config(VirtIODevice=
 *vdev,
> > uint8_t *config)
> >          blkcfg.write_zeroes_may_unmap =3D 1;
> >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> >      }
> > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > +        switch (bs->bl.zoned) {
> > +        case BLK_Z_HM:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > +            break;
> > +        case BLK_Z_HA:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> > +            break;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +
> > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > +                     bs->bl.zone_size / 512);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > +                     bs->bl.max_active_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > +                     bs->bl.max_open_zones);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
> > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > +                     bs->bl.max_append_sectors);
> > +    } else {
> > +        blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> > +    }
> >      memcpy(config, &blkcfg, s->config_size);
> >  }
> >
> > @@ -1118,6 +1518,7 @@ static void virtio_blk_device_realize(DeviceState=
 *dev,
> > Error **errp)
> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >      VirtIOBlock *s =3D VIRTIO_BLK(dev);
> >      VirtIOBlkConf *conf =3D &s->conf;
> > +    BlockDriverState *bs =3D blk_bs(conf->conf.blk);
> >      Error *err =3D NULL;
> >      unsigned i;
> >
> > @@ -1163,6 +1564,13 @@ static void virtio_blk_device_realize(DeviceStat=
e *dev,
> > Error **errp)
> >          return;
> >      }
> >
> > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> > +        if (bs->bl.zoned =3D=3D BLK_Z_HM) {
> > +            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DISCA=
RD);
> > +        }
> > +    }
> > +
> >      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &&
> >          (!conf->max_discard_sectors ||
> >           conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> > diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-=
blk.h
> > index d311c57cca..88901a9f55 100644
> > --- a/include/hw/virtio/virtio-blk.h
> > +++ b/include/hw/virtio/virtio-blk.h
> > @@ -30,6 +30,12 @@ struct virtio_blk_inhdr
> >      unsigned char status;
> >  };
> >
> > +struct virtio_blk_zone_append_inhdr {
> > +    unsigned char status;
> > +    uint8_t reserved[7];
> > +    int64_t append_sector;
> > +};
> > +
> >  #define VIRTIO_BLK_AUTO_NUM_QUEUES UINT16_MAX
> >
> >  struct VirtIOBlkConf
> > @@ -73,7 +79,10 @@ typedef struct VirtIOBlockReq {
> >      VirtQueue *vq;
> >      IOVDiscardUndo inhdr_undo;
> >      IOVDiscardUndo outhdr_undo;
> > -    struct virtio_blk_inhdr *in;
> > +    union {
> > +        struct virtio_blk_inhdr *in_hdr;
> > +        struct virtio_blk_zone_append_inhdr *zone_append_inhdr;
> > +    } in;
> >      struct virtio_blk_outhdr out;
> >      QEMUIOVector qiov;
> >      size_t in_len;
>

