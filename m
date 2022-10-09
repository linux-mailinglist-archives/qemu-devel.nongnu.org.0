Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE05F88F1
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 04:40:22 +0200 (CEST)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohMEm-0002in-UL
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 22:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohMCu-0001Cc-Lc; Sat, 08 Oct 2022 22:38:24 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohMCr-00084O-LZ; Sat, 08 Oct 2022 22:38:24 -0400
Received: by mail-vs1-xe29.google.com with SMTP id l127so8430524vsc.3;
 Sat, 08 Oct 2022 19:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOkr2qbPXk0FRpNj7n69fIRWB4IfKOeGNXg/1aGLZbU=;
 b=PAlGsLYopwQ0nsSramjZCeMNvHpJGfFyoxIgTdpwCuDjcQe4vOI0KXDjUOF5ji6eck
 ggr2vfu3N5Kvq36ynLTY+yFKXLmFcASjieTkwiklQ19JKNRlMMeFPPFXlSVyrJBg8GIh
 Ptbt1kMRpL5thMuI6JCJKNNms0NQSygm8dilNB/V9psyaIlYrslzhOif36mnilK8rEh0
 WQ/wVUWAFt97AbOvRZ9IVaZTaeNnfL5KDU2gU5lKLD6H92Zr82G5KQMNxB0bEP+EHO4h
 y43JrYfMDF7kSAM6BO5kA0S8GgQoQ27hzt95pxF7OqKDeudBHQYLO7VlHB1B1YKQGJuD
 Guvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOkr2qbPXk0FRpNj7n69fIRWB4IfKOeGNXg/1aGLZbU=;
 b=bFnUiCjqh+jfY6l6S/M8W7iFYWFCCCVbei/8WDn5Bz0SW9DPW20NToR5rUHx2hlA+c
 jsUV+tFBH3t+hjdHRsP5INzY1wi6u/fXNhL//j5+b/+8gz7P/+h1ou5B3/oT5ck/YdQ7
 CWGlM/VTbdVtBwsosNeWVDMFW5sXLd6TyckciVZxZ87pK3Qj5XBNAygo4D+Vm+2ZiZh5
 8IYbroQOJf4Dkd71cXofv9kOLRtj9Pq3fxWkTzOhCxHbHzQoncYou8A2uY2wh1YKciMT
 V91t+VmQssF/YjqxI5P5UTEPH7qYI8K5jTatW5vXj1VXrASmwGKif6ZPXDZ7dvlImxc9
 3bvQ==
X-Gm-Message-State: ACrzQf2YNdDCSS7T2vkRMTp3R9zgsk/EVCuhn1iR7ojvNUDnuJiqsWag
 lUQB/qTHKv9TNquYRkDDqDZ9Rg7mBQqBgKf37zqLszVMO6Wn3RqtVIE=
X-Google-Smtp-Source: AMsMyM5Q7uYSiLaFdtwT+dU7hvU/EbmDYOm35liU7qVBGX5USoC5SXoFV7GIAH9VDkYET8FxXFzVE8iXFuTyIaqvNYI=
X-Received: by 2002:a67:6e47:0:b0:3a7:646f:e9bc with SMTP id
 j68-20020a676e47000000b003a7646fe9bcmr1630683vsc.42.1665283099348; Sat, 08
 Oct 2022 19:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220929094821.78596-1-faithilikerun@gmail.com>
 <20220929094821.78596-3-faithilikerun@gmail.com> <Yz7udH9Ab2axs3sT@fedora>
 <CAAAx-8LiH5Rz-4Bu+7OGeU4BKmxcMm0tG9gYLb3CNEZkYN_0vQ@mail.gmail.com>
In-Reply-To: <CAAAx-8LiH5Rz-4Bu+7OGeU4BKmxcMm0tG9gYLb3CNEZkYN_0vQ@mail.gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 9 Oct 2022 10:38:34 +0800
Message-ID: <CAAAx-8J77kGzSVMGQ6jwAtUZDV8q0T1MuJyjYLFAhYEo0FRtiQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, dmitry.fomichev@wdc.com, 
 damien.lemoal@opensource.wdc.com, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe29.google.com
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

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=889=E6=97=
=A5=E5=91=A8=E6=97=A5 09:54=E5=86=99=E9=81=93=EF=BC=9A
>
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=886=
=E6=97=A5=E5=91=A8=E5=9B=9B 23:04=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, Sep 29, 2022 at 05:48:21PM +0800, Sam Li wrote:
> > > This patch extends virtio-blk emulation to handle zoned device comman=
ds
> > > by calling the new block layer APIs to perform zoned device I/O on
> > > behalf of the guest. It supports Report Zone, four zone oparations (o=
pen,
> > > close, finish, reset), and Append Zone.
> > >
> > > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > > support zoned block devices. Regular block devices(conventional zones=
)
> > > will not be set.
> > >
> > > The guest os having zoned device support can use blkzone(8) to test t=
hose
> > > commands. Furthermore, using zonefs to test zone append write is also
> > > supported.
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  hw/block/virtio-blk.c | 393 ++++++++++++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 393 insertions(+)
> > >
> > > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > > index e9ba752f6b..1c2535bfeb 100644
> > > --- a/hw/block/virtio-blk.c
> > > +++ b/hw/block/virtio-blk.c
> > > @@ -26,6 +26,9 @@
> > >  #include "hw/virtio/virtio-blk.h"
> > >  #include "dataplane/virtio-blk.h"
> > >  #include "scsi/constants.h"
> > > +#if defined(CONFIG_BLKZONED)
> > > +#include <linux/blkzoned.h>
> > > +#endif
> >
> > Why is this Linux-specific header file included? The virtio-blk
> > emulation code should only use QEMU block layer APIs, not Linux APIs.
> >
> > >  #ifdef __linux__
> > >  # include <scsi/sg.h>
> > >  #endif
> > > @@ -46,6 +49,8 @@ static const VirtIOFeature feature_sizes[] =3D {
> > >       .end =3D endof(struct virtio_blk_config, discard_sector_alignme=
nt)},
> > >      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
> > >       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unmap=
)},
> > > +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> > > +     .end =3D endof(struct virtio_blk_config, zoned)},
> > >      {}
> > >  };
> > >
> > > @@ -614,6 +619,340 @@ err:
> > >      return err_status;
> > >  }
> > >
> > > +typedef struct ZoneCmdData {
> > > +    VirtIOBlockReq *req;
> > > +    union {
> > > +        struct {
> > > +            unsigned int nr_zones;
> > > +            BlockZoneDescriptor *zones;
> > > +        } zone_report_data;
> > > +        struct {
> > > +            int64_t append_sector;
> > > +        } zone_append_data;
> > > +    };
> > > +} ZoneCmdData;
> > > +
> > > +/*
> > > + * check zoned_request: error checking before issuing requests. If a=
ll checks
> > > + * passed, return true.
> > > + * append: true if only zone append requests issued.
> > > + */
> > > +static bool check_zoned_request(VirtIOBlock *s, int64_t offset, int6=
4_t len,
> > > +                             bool append, uint8_t *status) {
> > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > > +    int index =3D offset / bs->bl.zone_size;
> >
> > This function doesn't check that offset+len is in the same zone as
> > offset. Maybe that's correct because some request types allow [offset,
> > offset+len) to cross zones?
>
> Yes, zone_mgmt requests should allow that.
>
> >
> > > +
> > > +    if (offset < 0 || offset + len > bs->bl.capacity) {
> >
> > Other cases that are not checked:
> > 1. len < 0
> > 2. offset >=3D bs->bl.capacity
> > 3. len > bs->bl.capacity - offset (catches integer overflow)
> >
> > It may be possible to combine these cases, but be careful about integer
> > overflow.
>
> Right. Combining above cases:
>
> if (offset < 0 || len < 0 || offset > cap - len)
>
> offset > cap - len can cover for  #2, #3 cases because any offset that
> is greater than cap-len is invalid must be also invalid when it's
> greater than cap.
>
> >
> > > +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        return false;
> > > +    }
> > > +
> > > +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> > > +        *status =3D VIRTIO_BLK_S_UNSUPP;
> > > +        return false;
> > > +    }
> > > +
> > > +    if (append) {
> > > +        if ((offset % bs->bl.write_granularity) !=3D 0) {
> > > +            *status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> > > +            return false;
> > > +        }
> > > +
> > > +        if (!BDRV_ZT_IS_SWR(bs->bl.wps->wp[index])) {
> > > +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +            return false;
> > > +        }
> >
> > Where does the virtio-blk zone spec say that only SWR zones allow zone
> > append commands? Should it work for SWP zones too?
>
> The spec says not. But it should work for SWP zones too. I'll change
> this to check conventional zones instead.
>
> +If the zone specified by the VIRTIO_BLK_T_ZONE_APPEND request is not
> a SWR zone,
> +then the request SHALL be completed with VIRTIO_BLK_S_ZONE_INVALID_CMD
> +\field{status}.
>
> >
> > > +
> > > +        if (len / 512 > bs->bl.max_append_sectors) {
> > > +            if (bs->bl.max_append_sectors =3D=3D 0) {
> > > +                *status =3D VIRTIO_BLK_S_UNSUPP;
> > > +            } else {
> > > +                *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +            }
> > > +            return false;
> > > +        }
> > > +    }
> > > +    return true;
> > > +}
> > > +
> > > +static void virtio_blk_zone_report_complete(void *opaque, int ret)
> > > +{
> > > +    ZoneCmdData *data =3D opaque;
> > > +    VirtIOBlockReq *req =3D data->req;
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > > +    struct iovec *in_iov =3D req->elem.in_sg;
> > > +    unsigned in_num =3D req->elem.in_num;
> > > +    int64_t zrp_size, nz, n, j =3D 0;
> > > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > > +
> > > +    if (ret) {
> > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        goto out;
> > > +    }
> > > +
> > > +    nz =3D data->zone_report_data.nr_zones;
> > > +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zon=
e_report) {
> > > +            .nr_zones =3D cpu_to_le64(nz),
> > > +    };
> > > +
> > > +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> > > +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> > > +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr))=
;
> > > +    if (n !=3D sizeof(zrp_hdr)) {
> > > +        virtio_error(vdev, "Driver provided intput buffer that is to=
o small!");
> > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        goto out;
> > > +    }
> > > +
> > > +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size; i +=3D sizeof(s=
truct virtio_blk_zone_descriptor), ++j) {
> > > +        struct virtio_blk_zone_descriptor desc =3D
> > > +                (struct virtio_blk_zone_descriptor) {
> > > +                        .z_start =3D cpu_to_le64(data->zone_report_d=
ata.zones[j].start) >> BDRV_SECTOR_BITS,
> > > +                        .z_cap =3D cpu_to_le64(data->zone_report_dat=
a.zones[j].cap) >> BDRV_SECTOR_BITS,
> > > +                        .z_wp =3D cpu_to_le64(data->zone_report_data=
.zones[j].wp) >> BDRV_SECTOR_BITS,
> > > +                };
> > > +
> > > +        switch (data->zone_report_data.zones[j].type) {
> > > +        case BLK_ZT_CONV:
> > > +            desc.z_type =3D BLK_ZONE_TYPE_CONVENTIONAL;
> > > +            break;
> > > +        case BLK_ZT_SWR:
> > > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_REQ;
> > > +            break;
> > > +        case BLK_ZT_SWP:
> > > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_PREF;
> > > +            break;
> > > +        default:
> > > +            g_assert_not_reached();
> > > +        }
> > > +
> > > +        switch (data->zone_report_data.zones[j].cond) {
> > > +        case BLK_ZS_RDONLY:
> > > +            desc.z_state =3D BLK_ZONE_COND_READONLY;
> > > +            break;
> > > +        case BLK_ZS_OFFLINE:
> > > +            desc.z_state =3D BLK_ZONE_COND_OFFLINE;
> > > +            break;
> > > +        case BLK_ZS_EMPTY:
> > > +            desc.z_state =3D BLK_ZONE_COND_EMPTY;
> > > +            break;
> > > +        case BLK_ZS_CLOSED:
> > > +            desc.z_state =3D BLK_ZONE_COND_CLOSED;
> > > +            break;
> > > +        case BLK_ZS_FULL:
> > > +            desc.z_state =3D BLK_ZONE_COND_FULL;
> > > +            break;
> > > +        case BLK_ZS_EOPEN:
> > > +            desc.z_state =3D BLK_ZONE_COND_EXP_OPEN;
> > > +            break;
> > > +        case BLK_ZS_IOPEN:
> > > +            desc.z_state =3D BLK_ZONE_COND_IMP_OPEN;
> > > +            break;
> > > +        case BLK_ZS_NOT_WP:
> > > +            desc.z_state =3D BLK_ZONE_COND_NOT_WP;
> > > +            break;
> > > +        default:
> > > +            g_assert_not_reached();
> > > +            break;
> > > +        }
> > > +
> > > +        /* TODO: it takes O(n^2) time complexity. Optimizations requ=
ired here. */
> > > +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
> > > +        if (n !=3D sizeof(desc)) {
> > > +            virtio_error(vdev, "Driver provided input buffer "
> > > +                               "for descriptors that is too small!")=
;
> > > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +            goto out;
> > > +        }
> > > +    }
> > > +    goto out;
> > > +
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    g_free(data->zone_report_data.zones);
> > > +    g_free(data);
> > > +}
> > > +
> > > +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > +    unsigned int nr_zones;
> > > +    ZoneCmdData *data;
> > > +    int64_t zone_size, offset;
> > > +    uint8_t err_status;
> > > +
> > > +    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
> > > +            sizeof(struct virtio_blk_zone_report) +
> > > +            sizeof(struct virtio_blk_zone_descriptor)) {
> > > +        virtio_error(vdev, "in buffer too small for zone report");
> > > +        return -1;
> > > +    }
> > > +
> > > +    /* start byte offset of the zone report */
> > > +    offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> > > +                sizeof(struct virtio_blk_zone_report)) /
> > > +               sizeof(struct virtio_blk_zone_descriptor);
> > > +
> > > +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> > > +    data =3D g_malloc(sizeof(ZoneCmdData));
> > > +    data->req =3D req;
> > > +    data->zone_report_data.nr_zones =3D nr_zones;
> > > +    data->zone_report_data.zones =3D g_malloc(zone_size),
> > > +
> > > +    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr_z=
ones,
> > > +                        data->zone_report_data.zones,
> > > +                        virtio_blk_zone_report_complete, data);
> > > +    return 0;
> > > +
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    return err_status;
> > > +}
> > > +
> > > +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
> > > +    ZoneCmdData *data =3D opaque;
> > > +    VirtIOBlockReq *req =3D data->req;
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > > +
> > > +    if (ret) {
> > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        goto out;
> > > +    }
> > > +    goto out;
> > > +
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    g_free(data);
> > > +}
> > > +
> > > +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZon=
eOp op) {
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > +    uint64_t len;
> > > +    uint32_t type;
> > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > +
> > > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > > +    data->req =3D req;
> > > +
> > > +    type =3D virtio_ldl_p(vdev, &req->out.type);
> > > +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> > > +        /* Entire drive capacity */
> > > +        offset =3D 0;
> > > +        len =3D bs->bl.capacity;
> > > +    } else {
> > > +        if (bs->bl.zone_size * bs->bl.nr_zones =3D=3D bs->bl.capacit=
y) {
> > > +            len =3D bs->bl.zone_size;
> > > +        } else {
> > > +            /* when the SWR drive has one last small zone, calculate=
 its len */
> > > +            len =3D bs->bl.capacity - bs->bl.zone_size * (bs->bl.nr_=
zones - 1);
> > > +        }
> > > +        if (offset + len > bs->bl.capacity) {
> > > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +            goto out;
> >
> > data is leaked here.
>
> Move the len part before check_zoned_request so data is not malloced
> until it passes checks. Avoid freeing memory here.
>
> >
> > > +        }
> > > +    }
> > > +
> > > +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> > > +                      virtio_blk_zone_mgmt_complete, data);
> > > +
> > > +    return 0;
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    return err_status;
> > > +}
> > > +
> > > +static void virtio_blk_zone_append_complete(void *opaque, int ret) {
> > > +    ZoneCmdData *data =3D opaque;
> > > +    VirtIOBlockReq *req =3D data->req;
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > > +    int64_t append_sector, n;
> > > +    struct iovec *out_iov =3D req->elem.out_sg;
> > > +    unsigned out_num =3D req->elem.out_num;
> > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > +
> > > +    if (ret) {
> > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        goto out;
> > > +    }
> > > +
> > > +    virtio_stl_p(vdev, &append_sector, data->zone_append_data.append=
_sector);
> > > +    n =3D iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(app=
end_sector));
> >
> > out_iov contains the driver->device buffers. The device is only allowed
> > to read from out_iov, not write to it.
> >
> > The device->driver buffers are in in_iov.
> >
> > According to the spec the zone append in hdr looks like this:
> >
> >   struct {
> >       u8 status;
> >       u8 reserved[7];
> >       le64 append_sector;
> >   } virtio_blk_zone_append_inhdr;
> >
> > In virtio_blk_handle_request() we used iov_discard_back_undoable() to
> > take the last byte (the status field for non-zone append requests) from
> > in_iov[]. This is incorrect for zone append requests because they have
> > the larger struct zone_append_inhdr instead of struct
> > virtio_blk_inhdr.
> >
> > I think it might be time to stop using req->in in virtio-blk.c and
> > instead use iov_from_buf() to write the status byte. For zone append
> > requests we also need to write reserved[] and append_sector:
> >
> >   iov_discard_undo(&req->inhdr_undo);
> >   inhdr_len =3D is_zone_append ?
> >                sizeof(struct virtio_blk_zone_append_inhdr) :
> >                sizeof(struct virtio_blk_inhdr);
> >   iov_from_buf(req->elem.in_sg, req->elem.in_num,
> >                req->in_len - inhdr_len,
> >                &req->in, inhdr_len);
> >
> > where req->in changes to:
> >
> >   union {
> >       struct virtio_blk_inhdr inhdr;
> >       struct virtio_blk_zone_append_inhdr zone_append_inhdr;
> >   } in;
> >
> > Most requests will just use in.inhdr but zone append will fill out the
> > full in.zone_append_inhdr struct.
>
> I did some changes according to that but it didn't work for
> zone_append requests and broke other zonefs-tests too. I wonder how
> zone_append requests fill the status bit. I used the original way as
> virtio_blk_inhdr here because attempts to remove it failed :)
>
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index 1c2535bfeb..3ecabc7fb3 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -54,6 +54,12 @@ static const VirtIOFeature feature_sizes[] =3D {
>      {}
>  };
>
> +typedef struct virtio_blk_zone_append_inhdr {
> +    uint8_t status;
> +    uint8_t reserved[7];
> +    int64_t append_sector;
> +} virtio_blk_zone_append_inhdr;
> +
>  static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_fea=
tures)
>  {
>      s->config_size =3D MAX(VIRTIO_BLK_CFG_SIZE,
> @@ -82,11 +88,16 @@ static void virtio_blk_req_complete(VirtIOBlockReq
> *req, unsigned char status)
>  {
>      VirtIOBlock *s =3D req->dev;
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> +    uint32_t type =3D virtio_ldl_p(vdev, &req->out.type);
>
>      trace_virtio_blk_req_complete(vdev, req, status);
>
> -    stb_p(&req->in->status, status);
>      iov_discard_undo(&req->inhdr_undo);
> +    size_t inhdr_len =3D (type =3D=3D VIRTIO_BLK_T_ZONE_APPEND) ?
> +
> sizeof(virtio_blk_zone_append_inhdr):sizeof(struct virtio_blk_inhdr);
> +    iov_from_buf(req->elem.in_sg, req->elem.in_num,
> +                 req->in_len - inhdr_len, &req->in, inhdr_len);
> +    stb_p(&req->in->status, status);
> +
>      iov_discard_undo(&req->outhdr_undo);
>      virtqueue_push(req->vq, &req->elem, req->in_len);
>      if (s->dataplane_started && !s->dataplane_disabled) {
>
> >
> > > +    if (n !=3D sizeof(append_sector)) {
> > > +        virtio_error(vdev, "Driver provided input buffer less than s=
ize of "
> > > +                     "append_sector");
> > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > +        goto out;
> > > +    }
> > > +    goto out;
> > > +
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    g_free(data);
> > > +}
> > > +
> > > +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {
> > > +    VirtIOBlock *s =3D req->dev;
> > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > +    uint64_t niov =3D req->elem.out_num;
> > > +    struct iovec *out_iov =3D req->elem.out_sg;
> > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > +
> > > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > +    int64_t len =3D 0;
> > > +    for (int i =3D 1; i < niov; ++i) {
> > > +        len +=3D out_iov[i].iov_len;
> >
> > Please pass in out_iov and out_num instead of using req->elem.out_sg an=
d
> > req->elem.out_num. virtio_blk_handle_request() modifies the iovecs
> > pointed to by req->elem.out_sg using iov_discard_front_undoable() and i=
t
> > is not safe to access req->elem.out_sg directly.
> >
> > Also, VIRTIO devices are not allowed to make assumptions about the iove=
c
> > layout. That means skipping the first iovec in the for loop violates th=
e
> > spec. The driver could send struct virtio_blk_req as two or more iovecs
> > instead of putting it into just 1 iovec. This is why the device is not
> > allowed to assume out_iov[0] is struct virtio_blk_req.

When VIRTIO devices can't make such assumptions, zone_append in the
block layer should still make the assumption about struct
virtio_blk_req. Because the iovecs with headers may not be aligned to
block size in most cases and zone_append writes need to skip those
iovecs. So the problem becomes how many iovecs would it take to
contain struct virtio_blk_req. Can we just skip the first N iovecs
whose size is less than/not aligned to one block size and write the
following iovecs?

> >
> > The for loop can be replaced with:
> >
> >   len =3D iov_size(out_iov, out_num);
> >
> > and out_iov[1]/niov-1 can be replaced with just out_iov and out_num (if
> > you pass them in from virtio_blk_handle_request()).
>
> Thanks!
>
> >
> > > +    }
> > > +
> > > +    if (!check_zoned_request(s, offset, len, true, &err_status)) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > > +    data->req =3D req;
> > > +    data->zone_append_data.append_sector =3D offset;
> > > +    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
> > > +    blk_aio_zone_append(s->blk, &data->zone_append_data.append_secto=
r, &req->qiov, 0,
> > > +                        virtio_blk_zone_append_complete, data);
> > > +    return 0;
> > > +
> > > +out:
> > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > +    virtio_blk_req_complete(req, err_status);
> > > +    virtio_blk_free_request(req);
> > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > +    return err_status;
> > > +}
> > > +
> > >  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBu=
ffer *mrb)
> > >  {
> > >      uint32_t type;
> > > @@ -700,6 +1039,24 @@ static int virtio_blk_handle_request(VirtIOBloc=
kReq *req, MultiReqBuffer *mrb)
> > >      case VIRTIO_BLK_T_FLUSH:
> > >          virtio_blk_handle_flush(req, mrb);
> > >          break;
> > > +    case VIRTIO_BLK_T_ZONE_REPORT:
> > > +        virtio_blk_handle_zone_report(req);
> > > +        break;
> > > +    case VIRTIO_BLK_T_ZONE_OPEN:
> > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
> > > +        break;
> > > +    case VIRTIO_BLK_T_ZONE_CLOSE:
> > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
> > > +        break;
> > > +    case VIRTIO_BLK_T_ZONE_FINISH:
> > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
> > > +        break;
> > > +    case VIRTIO_BLK_T_ZONE_RESET:
> > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > > +        break;
> > > +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
> > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
> > > +        break;
> > >      case VIRTIO_BLK_T_SCSI_CMD:
> > >          virtio_blk_handle_scsi(req);
> > >          break;
> > > @@ -718,6 +1075,9 @@ static int virtio_blk_handle_request(VirtIOBlock=
Req *req, MultiReqBuffer *mrb)
> > >          virtio_blk_free_request(req);
> > >          break;
> > >      }
> > > +   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> >
> > Indentation is off. QEMU uses 4-space indentation.
> >
> > > +       virtio_blk_handle_zone_append(req);
> > > +       break;
> > >      /*
> > >       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are define=
d with
> > >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch =
statement,
> > > @@ -917,6 +1277,7 @@ static void virtio_blk_update_config(VirtIODevic=
e *vdev, uint8_t *config)
> > >  {
> > >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> > >      BlockConf *conf =3D &s->conf.conf;
> > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > >      struct virtio_blk_config blkcfg;
> > >      uint64_t capacity;
> > >      int64_t length;
> > > @@ -976,6 +1337,30 @@ static void virtio_blk_update_config(VirtIODevi=
ce *vdev, uint8_t *config)
> > >          blkcfg.write_zeroes_may_unmap =3D 1;
> > >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> > >      }
> > > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > > +        switch (bs->bl.zoned) {
> > > +        case BLK_Z_HM:
> > > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > > +            break;
> > > +        case BLK_Z_HA:
> > > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> > > +            break;
> > > +        default:
> > > +            g_assert_not_reached();
> > > +        }
> > > +
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > > +                     bs->bl.zone_size / 512);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > > +                     bs->bl.max_active_zones);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > > +                     bs->bl.max_open_zones);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size=
);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > > +                     bs->bl.max_append_sectors);
> > > +    } else {
> > > +        blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> > > +    }
> > >      memcpy(config, &blkcfg, s->config_size);
> > >  }
> > >
> > > @@ -1140,6 +1525,7 @@ static void virtio_blk_device_realize(DeviceSta=
te *dev, Error **errp)
> > >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > >      VirtIOBlock *s =3D VIRTIO_BLK(dev);
> > >      VirtIOBlkConf *conf =3D &s->conf;
> > > +    BlockDriverState *bs =3D blk_bs(conf->conf.blk);
> > >      Error *err =3D NULL;
> > >      unsigned i;
> > >
> > > @@ -1185,6 +1571,13 @@ static void virtio_blk_device_realize(DeviceSt=
ate *dev, Error **errp)
> > >          return;
> > >      }
> > >
> > > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > > +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> > > +        if (bs->bl.zoned =3D=3D BLK_Z_HM) {
> > > +            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_DIS=
CARD);
> > > +        }
> > > +    }
> > > +
> > >      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD) &=
&
> > >          (!conf->max_discard_sectors ||
> > >           conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> > > --
> > > 2.37.3
> > >

