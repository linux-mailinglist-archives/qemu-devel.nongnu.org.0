Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE26099BE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:23:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omkIV-0000Jk-25
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1omREM-0007Gp-UU; Sat, 22 Oct 2022 23:00:54 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1omREJ-0007Z6-Qk; Sat, 22 Oct 2022 23:00:54 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id s28so4930488vsr.10;
 Sat, 22 Oct 2022 20:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8pd5v4N11sy9GuqzicFeX3pMX0/0As9+rI5MtfYgbQo=;
 b=lUDD7yfj5Q1j2dxbKk/3O/2HhX5SNpsvZL9Gk8cZTJnPK5EMcTWBEibOo9PdBeG9tT
 IdTLrchYSr/wK+Fchp3aN0UDnvC3HzIdiQ86pXqqbFQBcW4jXcizkUKZE07/v1JJsZ1T
 /qAFMusrE7PWGsW89VvhcNiG5BkeMF2ENZ8CZG9ttw1GrqAgfjsklc3OC+kXKr7BSgq4
 9H4SohVZikDz6hPoWAv5UeEIEZTUE2WdgzrZwFhpxrFocmF48a2wyExKIzc60Won0Fit
 4BB240fcHPhWvUvTNrlINpxymmM6QU/dZZnG8FK3VeZlFgx2j1TKtSqNosz3UnTvwaD7
 2Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pd5v4N11sy9GuqzicFeX3pMX0/0As9+rI5MtfYgbQo=;
 b=kxspynpWBpB1OcRkkCIxWuI2on4hTcD1lcRsPKXiA3TcFh/9wh5BAY5epwDG/d2Z7l
 tQW5bkRjY3G90qLzoroJJ7zNhny0CyOiXYy13caLWZm7QpdAvTbJ+cIPx2wxwZwbS9TR
 Tf6pxzPiKcfiead/Q3i2vWfGgY8HQ+O/OGlaOCU0pjsaITd1/oZ5tJ+NXNhja9Opmt+H
 PZaZBYRm9Diid0Sod1pkPdWUf4jlKuIZur1uzHFaqbsbP5j3CI0/3EjAnhglUOPpChPm
 6BLItzjR3huSXYAgWfdLhBMRw3me3pSMyAMJtFUzyINLPnJdhzFernU6EFbPiEnA2zKz
 +EcA==
X-Gm-Message-State: ACrzQf3NnaKEzL6QpMrCeQOfQGbuFCWgd4V0OPUg3tCE5skgITbCgz2g
 bdj9YVDukw7PnT4fBEpZg+stQHnDHk/vlhjQxUQ=
X-Google-Smtp-Source: AMsMyM5PW9bb177IEta0o7eympOc6cUmopaScfIdQ+pbFUzm//Bw+IAfEkijtRlWHHmwutKgbfZ1keM2Rw35ZAqP14I=
X-Received: by 2002:a67:d290:0:b0:3a7:6470:9cd with SMTP id
 z16-20020a67d290000000b003a7647009cdmr16463361vsi.17.1666494048577; Sat, 22
 Oct 2022 20:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221016150506.172675-1-faithilikerun@gmail.com>
 <20221016150506.172675-3-faithilikerun@gmail.com>
 <e9595acb7ba7adeb976f4cf6ea793316b8195470.camel@wdc.com>
 <CAAAx-8K52gf6di-tgaJgQB8rMnvgOJWdkBnwozGgN5_1AQ2=xw@mail.gmail.com>
 <2081b5f0718a2b70704ffc13418908cec77a2715.camel@wdc.com>
In-Reply-To: <2081b5f0718a2b70704ffc13418908cec77a2715.camel@wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 23 Oct 2022 11:01:07 +0800
Message-ID: <CAAAx-8LBH9XZmPob6GKvhdWbrqw8Pkm2t_iaD7aUFvEL+GDa4Q@mail.gmail.com>
Subject: Re: [RFC v3 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Cc: "hreitz@redhat.com" <hreitz@redhat.com>, "hare@suse.de" <hare@suse.de>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>, 
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "kwolf@redhat.com" <kwolf@redhat.com>, 
 "raphael.norwitz@nutanix.com" <raphael.norwitz@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, 
 "damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe2d.google.com
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
23=E6=97=A5=E5=91=A8=E6=97=A5 10:08=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 2022-10-18 at 16:56 +0800, Sam Li wrote:
> > Dmitry Fomichev <Dmitry.Fomichev@wdc.com> =E4=BA=8E2022=E5=B9=B410=E6=
=9C=8817=E6=97=A5=E5=91=A8=E4=B8=80 09:01=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sun, 2022-10-16 at 23:05 +0800, Sam Li wrote:
> > > > This patch extends virtio-blk emulation to handle zoned device comm=
ands
> > > > by calling the new block layer APIs to perform zoned device I/O on
> > > > behalf of the guest. It supports Report Zone, four zone oparations =
(open,
> > > > close, finish, reset), and Append Zone.
> > > >
> > > > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host doe=
s
> > > > support zoned block devices. Regular block devices(conventional zon=
es)
> > > > will not be set.
> > > >
> > > > Then the guest os can use blkzone(8) to test those commands on zone=
d
> > > > devices.
> > > > Furthermore, using zonefs to test zone append write is also support=
ed.
> > > >
> > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > ---
> > > >  hw/block/virtio-blk-common.c   |   2 +
> > > >  hw/block/virtio-blk.c          | 412 +++++++++++++++++++++++++++++=
+++-
> > > >  include/hw/virtio/virtio-blk.h |  11 +-
> > > >  3 files changed, 422 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-com=
mon.c
> > > > index ac52d7c176..e2f8e2f6da 100644
> > > > --- a/hw/block/virtio-blk-common.c
> > > > +++ b/hw/block/virtio-blk-common.c
> > > > @@ -29,6 +29,8 @@ static const VirtIOFeature feature_sizes[] =3D {
> > > >       .end =3D endof(struct virtio_blk_config, discard_sector_align=
ment)},
> > > >      {.flags =3D 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
> > > >       .end =3D endof(struct virtio_blk_config, write_zeroes_may_unm=
ap)},
> > > > +    {.flags =3D 1ULL << VIRTIO_BLK_F_ZONED,
> > > > +     .end =3D endof(struct virtio_blk_config, zoned)},
> > > >      {}
> > > >  };
> > > >
> > > > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > > > index 8131ec2dbc..58891aea31 100644
> > > > --- a/hw/block/virtio-blk.c
> > > > +++ b/hw/block/virtio-blk.c
> > > > @@ -26,6 +26,9 @@
> > > >  #include "hw/virtio/virtio-blk.h"
> > > >  #include "dataplane/virtio-blk.h"
> > > >  #include "scsi/constants.h"
> > > > +#if defined(CONFIG_BLKZONED)
> > > > +#include <linux/blkzoned.h>
> > > > +#endif
> > > >  #ifdef __linux__
> > > >  # include <scsi/sg.h>
> > > >  #endif
> > > > @@ -55,10 +58,29 @@ static void virtio_blk_req_complete(VirtIOBlock=
Req
> > > > *req,
> > > > unsigned char status)
> > > >  {
> > > >      VirtIOBlock *s =3D req->dev;
> > > >      VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > > +    int64_t inhdr_len, n;
> > > > +    void *buf;
> > > >
> > > >      trace_virtio_blk_req_complete(vdev, req, status);
> > > >
> > > > -    stb_p(&req->in->status, status);
> > > > +    iov_discard_undo(&req->inhdr_undo);
> > > > +    if (virtio_ldl_p(vdev, &req->out.type) =3D=3D VIRTIO_BLK_T_ZON=
E_APPEND) {
> > > > +        inhdr_len =3D sizeof(struct virtio_blk_zone_append_inhdr);
> > > > +        req->in.in_hdr->status =3D status;
> > > > +        buf =3D req->in.in_hdr;
> > > > +    } else {
> > > > +        inhdr_len =3D sizeof(struct virtio_blk_inhdr);
> > > > +        req->in.zone_append_inhdr->status =3D status;
> > > > +        buf =3D req->in.zone_append_inhdr;
> > > > +    }
> > > > +
> > > > +    n =3D iov_from_buf(req->elem.in_sg, req->elem.in_num,
> > > > +                     req->in_len - inhdr_len, buf, inhdr_len);
> > > > +    if (n !=3D inhdr_len) {
> > > > +        virtio_error(vdev, "Driver provided input buffer less than=
 size of
> > > > "
> > > > +                     "in header");
> > > > +    }
> > > > +
> > > >      iov_discard_undo(&req->inhdr_undo);
> > > >      iov_discard_undo(&req->outhdr_undo);
> > > >      virtqueue_push(req->vq, &req->elem, req->in_len);
> > > > @@ -592,6 +614,334 @@ err:
> > > >      return err_status;
> > > >  }
> > > >
> > > > +typedef struct ZoneCmdData {
> > > > +    VirtIOBlockReq *req;
> > > > +    union {
> > > > +        struct {
> > > > +            unsigned int nr_zones;
> > > > +            BlockZoneDescriptor *zones;
> > > > +        } zone_report_data;
> > > > +        struct {
> > > > +            int64_t offset;
> > > > +        } zone_append_data;
> > > > +    };
> > > > +} ZoneCmdData;
> > > > +
> > > > +/*
> > > > + * check zoned_request: error checking before issuing requests. If=
 all
> > > > checks
> > > > + * passed, return true.
> > > > + * append: true if only zone append requests issued.
> > > > + */
> > > > +static bool check_zoned_request(VirtIOBlock *s, int64_t offset, in=
t64_t
> > > > len,
> > > > +                             bool append, uint8_t *status) {
> > > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > > > +    int index =3D offset / bs->bl.zone_size;
> > > > +
> > > > +    if (offset < 0 || len < 0 || offset > bs->bl.capacity - len) {
> > > > +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED))=
 {
> > > > +        *status =3D VIRTIO_BLK_S_UNSUPP;
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    if (append) {
> > > > +        if ((offset % bs->bl.write_granularity) !=3D 0) {
> > > > +            *status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> > > > +            return false;
> > > > +        }
> > > > +
> > > > +        if (BDRV_ZT_IS_CONV(bs->bl.wps->wp[index])) {
> > > > +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +            return false;
> > > > +        }
> > > > +
> > > > +        if (len / 512 > bs->bl.max_append_sectors) {
> > > > +            if (bs->bl.max_append_sectors =3D=3D 0) {
> > > > +                *status =3D VIRTIO_BLK_S_UNSUPP;
> > > > +            } else {
> > > > +                *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +            }
> > > > +            return false;
> > > > +        }
> > > > +    }
> > > > +    return true;
> > > > +}
> > > > +
> > > > +static void virtio_blk_zone_report_complete(void *opaque, int ret)
> > > > +{
> > > > +    ZoneCmdData *data =3D opaque;
> > > > +    VirtIOBlockReq *req =3D data->req;
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > > > +    struct iovec *in_iov =3D req->elem.in_sg;
> > > > +    unsigned in_num =3D req->elem.in_num;
> > > > +    int64_t zrp_size, nz, n, j =3D 0;
> > > > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > > > +
> > > > +    if (ret) {
> > > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    nz =3D data->zone_report_data.nr_zones;
> > > > +    struct virtio_blk_zone_report zrp_hdr =3D (struct
> > > > virtio_blk_zone_report) {
> > > > +            .nr_zones =3D cpu_to_le64(nz),
> > > > +    };
> > > > +
> > > > +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> > > > +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> > > > +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr=
));
> > > > +    if (n !=3D sizeof(zrp_hdr)) {
> > > > +        virtio_error(vdev, "Driver provided intput buffer that is =
too
> > > > small!");
> > >
> > > s/intput/input
> > >
> > > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size;
> > > > +        i +=3D sizeof(struct virtio_blk_zone_descriptor), ++j) {
> > > > +        struct virtio_blk_zone_descriptor desc =3D
> > > > +            (struct virtio_blk_zone_descriptor) {
> > > > +                .z_start =3D cpu_to_le64(data-
> > > > >zone_report_data.zones[j].start)
> > > > +                    >> BDRV_SECTOR_BITS,
> > > > +                .z_cap =3D cpu_to_le64(data->zone_report_data.zone=
s[j].cap)
> > > > +                    >> BDRV_SECTOR_BITS,
> > > > +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones=
[j].wp)
> > > > +                    >> BDRV_SECTOR_BITS,
> > >
> > > I think these should be
> > >
> > > +                .z_start =3D cpu_to_le64(data->zone_report_data.zone=
s[j].start
> > > +                    >> BDRV_SECTOR_BITS),
> > > +                .z_cap =3D cpu_to_le64(data->zone_report_data.zones[=
j].cap
> > > +                    >> BDRV_SECTOR_BITS),
> > > +                .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j=
].wp
> > > +                    >> BDRV_SECTOR_BITS),
> > >
> > > > +        };
> > > > +
> > > > +        switch (data->zone_report_data.zones[j].type) {
> > > > +        case BLK_ZT_CONV:
> > > > +            desc.z_type =3D BLK_ZONE_TYPE_CONVENTIONAL;
> > > > +            break;
> > > > +        case BLK_ZT_SWR:
> > > > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_REQ;
> > > > +            break;
> > > > +        case BLK_ZT_SWP:
> > > > +            desc.z_type =3D BLK_ZONE_TYPE_SEQWRITE_PREF;
> > > > +            break;
> > > > +        default:
> > > > +            g_assert_not_reached();
> > > > +        }
> > >
> > > why do we need to convert these to system-defined values?
> > > The output of this function will be sent to the driver that
> > > uses the values defined in virtio-zbd spec. And the conversion
> > > to BLK_ZS_xxx/BLK_ZT_xxx has already been done in parse_zone()
> > > function in file-posix.c
> >
> > Because QEMU may use different macro values compared to Linux. It is
> > for avoiding passing wrong values to the guest. Parse_zone() converts
> > Linux macros to QEMU macros and QEMU macros will change back to
> > Linux's defined values here.
>
> You are not yet passing anything to the guest OS at this point. You are
> sending the zone report to the driver using the format defined in
> virtio-zbd spec. The driver then will have to convert the
> BLK_ZT_xxx/BLK_ZS_xxx values to the corresponding values defined in the
> driver environment which, in general, may be something else besides Linux=
.
>
> Perhaps you are being confused by the fact that virtblk_parse_zone()
> function in the current version of Linux virtio_blk driver patch does
> not perform the explicit conversion from VIRTIO_BLK_ZT_xxx to
> BLK_ZONE_TYPE_xxx and from VIRTIO_BLK_ZS_xxx to BLK_ZONE_COND_xxx
> values. It is an optimization that is possible because we know a priori
> that the actual integer values for the both sets of definitions are the
> same.
>
> But it is that function is the appropriate place to convert from
> virtio-defined zone types and states to the system values, not this part
> of your code. Perhaps I should add similar switch statements to the
> driver code for the sake of code clarity and robustness. It will add
> a bit of overhead for zone report processing, but these requests
> are rare and the overall performance should not be affected.

I see. The switch cases are in order to avoid the assumption that the
QEMU type and state fields may not match virtio-blk constants. If
there is an optimization that avoids it, I'll change back to no switch
version and add corresponding documents.

>
> DF
>
> >
> > >
> > > > +
> > > > +        switch (data->zone_report_data.zones[j].cond) {
> > > > +        case BLK_ZS_RDONLY:
> > > > +            desc.z_state =3D BLK_ZONE_COND_READONLY;
> > > > +            break;
> > > > +        case BLK_ZS_OFFLINE:
> > > > +            desc.z_state =3D BLK_ZONE_COND_OFFLINE;
> > > > +            break;
> > > > +        case BLK_ZS_EMPTY:
> > > > +            desc.z_state =3D BLK_ZONE_COND_EMPTY;
> > > > +            break;
> > > > +        case BLK_ZS_CLOSED:
> > > > +            desc.z_state =3D BLK_ZONE_COND_CLOSED;
> > > > +            break;
> > > > +        case BLK_ZS_FULL:
> > > > +            desc.z_state =3D BLK_ZONE_COND_FULL;
> > > > +            break;
> > > > +        case BLK_ZS_EOPEN:
> > > > +            desc.z_state =3D BLK_ZONE_COND_EXP_OPEN;
> > > > +            break;
> > > > +        case BLK_ZS_IOPEN:
> > > > +            desc.z_state =3D BLK_ZONE_COND_IMP_OPEN;
> > > > +            break;
> > > > +        case BLK_ZS_NOT_WP:
> > > > +            desc.z_state =3D BLK_ZONE_COND_NOT_WP;
> > > > +            break;
> > > > +        default:
> > > > +            g_assert_not_reached();
> > > > +        }
> > >
> > > same here. I think the code to form the descriptor can be reduced to
> > >
> > > +        struct virtio_blk_zone_descriptor desc =3D (struct
> > > virtio_blk_zone_descriptor) {
> > > +            .z_start =3D cpu_to_le64(data->zone_report_data.zones[j]=
.start >>
> > > BDRV_SECTOR_BITS),
> > > +            .z_cap =3D cpu_to_le64(data->zone_report_data.zones[j].c=
ap >>
> > > BDRV_SECTOR_BITS),
> > > +            .z_wp =3D cpu_to_le64(data->zone_report_data.zones[j].wp=
 >>
> > > BDRV_SECTOR_BITS),
> > > +            .z_type =3D data->zone_report_data.zones[j].type,
> > > +            .z_state =3D data->zone_report_data.zones[j].state,
> > > +        };
> > >
> > > > +
> > > > +        /* TODO: it takes O(n^2) time complexity. Optimizations re=
quired.
> > > > */
> > > > +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc))=
;
> > > > +        if (n !=3D sizeof(desc)) {
> > > > +            virtio_error(vdev, "Driver provided input buffer "
> > > > +                               "for descriptors that is too small!=
");
> > > > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +            goto out;
> > > > +        }
> > > > +    }
> > > > +    goto out;
> > >
> > > this goto is not needed.
> > >
> > > > +
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    g_free(data->zone_report_data.zones);
> > > > +    g_free(data);
> > > > +}
> > > > +
> > > > +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req)
> > > > +{
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > > +    unsigned int nr_zones;
> > > > +    ZoneCmdData *data;
> > > > +    int64_t zone_size, offset;
> > > > +    uint8_t err_status;
> > > > +
> > > > +    if (req->in_len < sizeof(struct virtio_blk_inhdr) +
> > > > +            sizeof(struct virtio_blk_zone_report) +
> > > > +            sizeof(struct virtio_blk_zone_descriptor)) {
> > > > +        virtio_error(vdev, "in buffer too small for zone report");
> > > > +        return -1;
> > > > +    }
> > > > +
> > > > +    /* start byte offset of the zone report */
> > > > +    offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    nr_zones =3D (req->in_len - sizeof(struct virtio_blk_inhdr) -
> > > > +                sizeof(struct virtio_blk_zone_report)) /
> > > > +               sizeof(struct virtio_blk_zone_descriptor);
> > > > +
> > > > +    zone_size =3D sizeof(BlockZoneDescriptor) * nr_zones;
> > > > +    data =3D g_malloc(sizeof(ZoneCmdData));
> > > > +    data->req =3D req;
> > > > +    data->zone_report_data.nr_zones =3D nr_zones;
> > > > +    data->zone_report_data.zones =3D g_malloc(zone_size),
> > > > +
> > > > +    blk_aio_zone_report(s->blk, offset, &data->zone_report_data.nr=
_zones,
> > > > +                        data->zone_report_data.zones,
> > > > +                        virtio_blk_zone_report_complete, data);
> > > > +    return 0;
> > > > +
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    return err_status;
> > > > +}
> > > > +
> > > > +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
> > > > +{
> > > > +    ZoneCmdData *data =3D opaque;
> > > > +    VirtIOBlockReq *req =3D data->req;
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    int8_t err_status =3D VIRTIO_BLK_S_OK;
> > > > +
> > > > +    if (ret) {
> > > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +        goto out;
> > > > +    }
> > > > +    goto out;
> > > > +
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    g_free(data);
> > > > +}
> > > > +
> > > > +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZ=
oneOp
> > > > op)
> > > > +{
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > > > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > > +    uint64_t len;
> > > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > > +
> > > > +    uint32_t type =3D virtio_ldl_p(vdev, &req->out.type);
> > > > +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> > > > +        /* Entire drive capacity */
> > > > +        offset =3D 0;
> > > > +        len =3D bs->bl.capacity;
> > > > +    } else {
> > > > +        if (bs->bl.zone_size > bs->bl.capacity - offset) {
> > > > +            /* The zoned device allows the last smaller zone. */
> > > > +            len =3D bs->bl.capacity - bs->bl.zone_size * (bs->bl.n=
r_zones -
> > > > 1);
> > > > +        } else {
> > > > +            len =3D bs->bl.zone_size;
> > > > +        }
> > > > +    }
> > > > +
> > > > +    if (!check_zoned_request(s, offset, 0, false, &err_status)) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > > > +    data->req =3D req;
> > > > +    blk_aio_zone_mgmt(s->blk, op, offset, len,
> > > > +                      virtio_blk_zone_mgmt_complete, data);
> > > > +
> > > > +    return 0;
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    return err_status;
> > > > +}
> > > > +
> > > > +static void virtio_blk_zone_append_complete(void *opaque, int ret)
> > > > +{
> > > > +    ZoneCmdData *data =3D opaque;
> > > > +    VirtIOBlockReq *req =3D data->req;
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    struct iovec *in_iov =3D req->elem.in_sg;
> > > > +    unsigned in_num =3D req->elem.in_num;
> > > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > > +
> > > > +    if (ret) {
> > > > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    struct virtio_blk_zone_append_inhdr zap_hdr =3D
> > > > +        (struct virtio_blk_zone_append_inhdr) {
> > > > +        .append_sector =3D cpu_to_le64(data->zone_append_data.offs=
et
> > > > +            >> BDRV_SECTOR_BITS),
> > > > +    };
> > > > +    iov_from_buf(in_iov, in_num, 0, &zap_hdr, sizeof(zap_hdr));
> > > > +    goto out;
> > > > +
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    g_free(data);
> > > > +}
> > > > +
> > > > +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
> > > > +                                         struct iovec *out_iov,
> > > > +                                         uint64_t niov) {
> > > > +    VirtIOBlock *s =3D req->dev;
> > > > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > > > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > > > +
> > > > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > > > +    int64_t len =3D iov_size(out_iov, niov);
> > > > +
> > > > +    if (!check_zoned_request(s, offset, len, true, &err_status)) {
> > > > +        goto out;
> > > > +    }
> > > > +
> > > > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > > > +    data->req =3D req;
> > > > +    data->zone_append_data.offset =3D offset;
> > > > +    qemu_iovec_init_external(&req->qiov, out_iov, niov);
> > > > +    blk_aio_zone_append(s->blk, &data->zone_append_data.offset, &r=
eq-
> > > > >qiov, 0,
> > > > +                        virtio_blk_zone_append_complete, data);
> > > > +    return 0;
> > > > +
> > > > +out:
> > > > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > > > +    virtio_blk_req_complete(req, err_status);
> > > > +    virtio_blk_free_request(req);
> > > > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > > > +    return err_status;
> > > > +}
> > > > +
> > > >  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReq=
Buffer
> > > > *mrb)
> > > >  {
> > > >      uint32_t type;
> > > > @@ -624,7 +974,7 @@ static int virtio_blk_handle_request(VirtIOBloc=
kReq
> > > > *req,
> > > > MultiReqBuffer *mrb)
> > > >
> > > >      /* We always touch the last byte, so just see how big in_iov i=
s.  */
> > > >      req->in_len =3D iov_size(in_iov, in_num);
> > > > -    req->in =3D (void *)in_iov[in_num - 1].iov_base
> > > > +    req->in.in_hdr =3D (void *)in_iov[in_num - 1].iov_base
> > > >                + in_iov[in_num - 1].iov_len
> > > >                - sizeof(struct virtio_blk_inhdr);
> > > >      iov_discard_back_undoable(in_iov, &in_num, sizeof(struct
> > > > virtio_blk_inhdr),
> > > > @@ -678,6 +1028,24 @@ static int virtio_blk_handle_request(VirtIOBl=
ockReq
> > > > *req,
> > > > MultiReqBuffer *mrb)
> > > >      case VIRTIO_BLK_T_FLUSH:
> > > >          virtio_blk_handle_flush(req, mrb);
> > > >          break;
> > > > +    case VIRTIO_BLK_T_ZONE_REPORT:
> > > > +        virtio_blk_handle_zone_report(req);
> > > > +        break;
> > > > +    case VIRTIO_BLK_T_ZONE_OPEN:
> > > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
> > > > +        break;
> > > > +    case VIRTIO_BLK_T_ZONE_CLOSE:
> > > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
> > > > +        break;
> > > > +    case VIRTIO_BLK_T_ZONE_FINISH:
> > > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
> > > > +        break;
> > > > +    case VIRTIO_BLK_T_ZONE_RESET:
> > > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > > > +        break;
> > > > +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
> > > > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
> > > > +        break;
> > > >      case VIRTIO_BLK_T_SCSI_CMD:
> > > >          virtio_blk_handle_scsi(req);
> > > >          break;
> > > > @@ -696,6 +1064,13 @@ static int virtio_blk_handle_request(VirtIOBl=
ockReq
> > > > *req,
> > > > MultiReqBuffer *mrb)
> > > >          virtio_blk_free_request(req);
> > > >          break;
> > > >      }
> > > > +    case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> > > > +        /*
> > > > +         * It is not safe to access req->elem.out_sg directly beca=
use it
> > > > +         * may be modified by virtio_blk_handle_request().
> > > > +         */
> > > > +        virtio_blk_handle_zone_append(req, out_iov, out_num);
> > > > +        break;
> > > >      /*
> > > >       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defi=
ned with
> > > >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switc=
h
> > > > statement,
> > > > @@ -895,6 +1270,7 @@ static void virtio_blk_update_config(VirtIODev=
ice
> > > > *vdev,
> > > > uint8_t *config)
> > > >  {
> > > >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> > > >      BlockConf *conf =3D &s->conf.conf;
> > > > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > > >      struct virtio_blk_config blkcfg;
> > > >      uint64_t capacity;
> > > >      int64_t length;
> > > > @@ -954,6 +1330,30 @@ static void virtio_blk_update_config(VirtIODe=
vice
> > > > *vdev,
> > > > uint8_t *config)
> > > >          blkcfg.write_zeroes_may_unmap =3D 1;
> > > >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> > > >      }
> > > > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > > > +        switch (bs->bl.zoned) {
> > > > +        case BLK_Z_HM:
> > > > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > > > +            break;
> > > > +        case BLK_Z_HA:
> > > > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
> > > > +            break;
> > > > +        default:
> > > > +            g_assert_not_reached();
> > > > +        }
> > > > +
> > > > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > > > +                     bs->bl.zone_size / 512);
> > > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > > > +                     bs->bl.max_active_zones);
> > > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > > > +                     bs->bl.max_open_zones);
> > > > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_si=
ze);
> > > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > > > +                     bs->bl.max_append_sectors);
> > > > +    } else {
> > > > +        blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> > > > +    }
> > > >      memcpy(config, &blkcfg, s->config_size);
> > > >  }
> > > >
> > > > @@ -1118,6 +1518,7 @@ static void virtio_blk_device_realize(DeviceS=
tate
> > > > *dev,
> > > > Error **errp)
> > > >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > >      VirtIOBlock *s =3D VIRTIO_BLK(dev);
> > > >      VirtIOBlkConf *conf =3D &s->conf;
> > > > +    BlockDriverState *bs =3D blk_bs(conf->conf.blk);
> > > >      Error *err =3D NULL;
> > > >      unsigned i;
> > > >
> > > > @@ -1163,6 +1564,13 @@ static void virtio_blk_device_realize(Device=
State
> > > > *dev,
> > > > Error **errp)
> > > >          return;
> > > >      }
> > > >
> > > > +    if (bs->bl.zoned !=3D BLK_Z_NONE) {
> > > > +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> > > > +        if (bs->bl.zoned =3D=3D BLK_Z_HM) {
> > > > +            virtio_clear_feature(&s->host_features, VIRTIO_BLK_F_D=
ISCARD);
> > > > +        }
> > > > +    }
> > > > +
> > > >      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD)=
 &&
> > > >          (!conf->max_discard_sectors ||
> > > >           conf->max_discard_sectors > BDRV_REQUEST_MAX_SECTORS)) {
> > > > diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/vir=
tio-
> > > > blk.h
> > > > index d311c57cca..88901a9f55 100644
> > > > --- a/include/hw/virtio/virtio-blk.h
> > > > +++ b/include/hw/virtio/virtio-blk.h
> > > > @@ -30,6 +30,12 @@ struct virtio_blk_inhdr
> > > >      unsigned char status;
> > > >  };
> > > >
> > > > +struct virtio_blk_zone_append_inhdr {
> > > > +    unsigned char status;
> > > > +    uint8_t reserved[7];
> > > > +    int64_t append_sector;
> > > > +};
> > > > +
> > > >  #define VIRTIO_BLK_AUTO_NUM_QUEUES UINT16_MAX
> > > >
> > > >  struct VirtIOBlkConf
> > > > @@ -73,7 +79,10 @@ typedef struct VirtIOBlockReq {
> > > >      VirtQueue *vq;
> > > >      IOVDiscardUndo inhdr_undo;
> > > >      IOVDiscardUndo outhdr_undo;
> > > > -    struct virtio_blk_inhdr *in;
> > > > +    union {
> > > > +        struct virtio_blk_inhdr *in_hdr;
> > > > +        struct virtio_blk_zone_append_inhdr *zone_append_inhdr;
> > > > +    } in;
> > > >      struct virtio_blk_outhdr out;
> > > >      QEMUIOVector qiov;
> > > >      size_t in_len;
> > >
>

