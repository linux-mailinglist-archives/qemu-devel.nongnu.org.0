Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B35EE642
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:59:08 +0200 (CEST)
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddD1-00007I-JQ
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odd9Y-00064v-3j; Wed, 28 Sep 2022 15:55:32 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odd9V-0001AV-8l; Wed, 28 Sep 2022 15:55:31 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id 126so3828894vsi.10;
 Wed, 28 Sep 2022 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=udt8a7EVHNCXa1nufKNObAvuj2GEDzvXW5E3Q6CCfKM=;
 b=cpaDdM2FzjK0U352Az77bQjYTWkolAKgVzMaXAaRm3rflLpbva9J+7UVHt1wUUT0mW
 4XudLq7GzeJk2jzf6CObWVIneU2gW77sLsEBUgKMgA1qTcVlrHzcDIyc7J0OwkaXfFGR
 BuXBXr9hm+kMLKEnjCcqwHKZPZ5nNaGCyK9JMjuCJVWLbVNse9r9iG9HfFMBPiC7BNZ7
 R2iSoYKcAP4FWe+NkMn7HcM0Q3tlRqjoduqHRy63N9KcrAh9fMlV6nALTA67+SaFXRaW
 PcExyjz0I3CnFz4lO5Oss4nmjmz+tPEUejHjkJYi2wuuFADuPkJZiXG9ViNRJ01yxinS
 Me+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=udt8a7EVHNCXa1nufKNObAvuj2GEDzvXW5E3Q6CCfKM=;
 b=z3O4FueE2ijgHPYbbijpgPMiZZ7UbUBQek+s3dlk7gZsvJ3Mi6aEqpVdpip5IXR15R
 ctYo1xl+NNRHAJzBFTJdO9TdQiyrtQBiZAdTdgDLt4xjbGd9RMdXFq8aYg4Iytk2/NBM
 dQMxV7K/t6zYI/il9SkUXwqH/0+oc96BJDZz3lqvweWs3s6X6Dzt3WKjdL5JoVs72gib
 s9AToioQGZ8ePIxYuy6i2xQ6lWSQVXuFVY9ySX6Pgm+yvER0cDrM7OHcKoW2G2RxBFVD
 LXBS7+J6O/03DHI8i6GguF+PAT312vd/eZiYhSz1DtZHYO3hdtsvRpxYvAfplFNmjUP3
 dH2Q==
X-Gm-Message-State: ACrzQf1oHnwyPfi4V5I1Gj78jKIrka3k2Be1btaQHvkrzl4fA2SGOyHQ
 BwVckNM4dsX5fua7TcpDX3UE0VkGc5pE1XiNDZw=
X-Google-Smtp-Source: AMsMyM4dX28JFYdlmiMzcTnSlNT+1H1rS8EkJVmmtUOynueDauMmB0R2LGhV+p2+QyDYwSY7WoB/p6stRLLoZtwkra0=
X-Received: by 2002:a67:dd8c:0:b0:398:4a60:34d2 with SMTP id
 i12-20020a67dd8c000000b003984a6034d2mr16049848vsk.17.1664394926912; Wed, 28
 Sep 2022 12:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220910065057.35017-1-faithilikerun@gmail.com>
 <20220910065057.35017-2-faithilikerun@gmail.com> <YyjeQ6yYALiUvBjO@fedora>
In-Reply-To: <YyjeQ6yYALiUvBjO@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 29 Sep 2022 03:55:40 +0800
Message-ID: <CAAAx-8KzHkHA4uBM0HpwxjtTFMhVGPUte_k0HF7jHobwu5hLAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe2a.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=BA=8C 05:31=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Sep 10, 2022 at 02:50:57PM +0800, Sam Li wrote:
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
> > The guest os having zoned device support can use blkzone(8) to test tho=
se
> > commands. Furthermore, using zonefs to test zone append write is also
> > supported.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >  hw/block/virtio-blk.c | 326 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 326 insertions(+)
> >
> > diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> > index e9ba752f6b..3ef74c01db 100644
> > --- a/hw/block/virtio-blk.c
> > +++ b/hw/block/virtio-blk.c
> > @@ -46,6 +46,8 @@ static const VirtIOFeature feature_sizes[] =3D {
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
> > @@ -614,6 +616,273 @@ err:
> >      return err_status;
> >  }
> >
> > +typedef struct ZoneCmdData {
> > +    VirtIOBlockReq *req;
> > +    union {
> > +        struct {
> > +            unsigned int nr_zones;
> > +            BlockZoneDescriptor *zones;
> > +        } ZoneReportData;
> > +        struct {
> > +            int64_t append_sector;
> > +        } ZoneAppendData;
>
> Field names should be lowercase:
>
>   struct {
>       unsigned int nr_zones;
>       BlockZoneDescriptor *zones;
>   } zone_report_data;
>   struct {
>       int64_t append_sector;
>   } zone_append_data;
>
> > +    };
> > +} ZoneCmdData;
> > +
> > +/*
> > + * check zone_model: error checking before issuing requests. If all ch=
ecks
>
> Maybe rename it to check_zoned_request()? It does more than check the
> model.
>
> > + * passed, return true.
> > + * append: true if only zone append request issued.
> > + */
> > +static bool check_zone_model(VirtIOBlock *s, int64_t sector, int64_t n=
r_sector,
> > +                             bool append, uint8_t *status) {
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    BlockZoneDescriptor *zone =3D &bs->bl.zones[sector / bs->bl.zone_s=
ectors];
>
> Inputs from the guest driver are untrusted and must be validated before
> using them. sector could have any value here, including invalid values.
> Please check that sector is less than the device capacity and also that
> it is positive.
>
> > +    int64_t max_append_sector =3D bs->bl.max_append_sectors;
> > +
> > +    if (!virtio_has_feature(s->host_features, VIRTIO_BLK_F_ZONED)) {
> > +        *status =3D VIRTIO_BLK_S_UNSUPP;
> > +        return false;
> > +    }
> > +
> > +    if (zone->cond =3D=3D BLK_ZS_OFFLINE) {
> > +        *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        return false;
> > +    }
> > +
> > +    if (append) {
> > +        if ((zone->type !=3D BLK_ZT_SWR) || (zone->cond =3D=3D BLK_ZS_=
RDONLY) ||
> > +            (sector + nr_sector > (*(zone + 1)).start)) {
> > +            /* the end sector of the request exceeds to next zone */
> > +            *status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            return false;
> > +        }
> > +
> > +        if (nr_sector > max_append_sector) {
> > +            if (max_append_sector =3D=3D 0) {
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
> > +    nz =3D data->ZoneReportData.nr_zones;
> > +    struct virtio_blk_zone_report zrp_hdr =3D (struct virtio_blk_zone_=
report) {
> > +            .nr_zones =3D cpu_to_le64(nz),
> > +    };
> > +
> > +    zrp_size =3D sizeof(struct virtio_blk_zone_report)
> > +               + sizeof(struct virtio_blk_zone_descriptor) * nz;
> > +    n =3D iov_from_buf(in_iov, in_num, 0, &zrp_hdr, sizeof(zrp_hdr));
> > +    if (n !=3D sizeof(zrp_hdr)) {
> > +        virtio_error(vdev, "Driver provided intput buffer that is too =
small!");
> > +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +        goto out;
> > +    }
> > +
> > +    for (size_t i =3D sizeof(zrp_hdr); i < zrp_size; i +=3D sizeof(str=
uct virtio_blk_zone_descriptor), ++j) {
> > +        struct virtio_blk_zone_descriptor desc =3D
> > +                (struct virtio_blk_zone_descriptor) {
> > +                        .z_start =3D cpu_to_le64(data->ZoneReportData.=
zones[j].start),
> > +                        .z_cap =3D cpu_to_le64(data->ZoneReportData.zo=
nes[j].cap),
> > +                        .z_wp =3D cpu_to_le64(data->ZoneReportData.zon=
es[j].wp),
>
> If the QEMU block layer uses byte constants it will be necessary to
> convert the above fields to sectors. I think the code is correct right
> now because the QEMU block layer patches still use sectors, but using
> bytes would be consistent with the QEMU block layer conventions.
>
> > +                        .z_type =3D data->ZoneReportData.zones[j].type=
,
> > +                        .z_state =3D data->ZoneReportData.zones[j].con=
d,
>
> The QEMU type and cond field constants might not match the virtio-blk
> constants. Please convert them explicitly (e.g. with a switch
> statement in a helper function) so there is no assumption about the
> values of the constants.
>
> > +                };
> > +        n =3D iov_from_buf(in_iov, in_num, i, &desc, sizeof(desc));
>
> This is O(n^2) time complexity since it's called from the loop, but
> nevermind for now... Maybe add a TODO comment so anyone trying to
> optimize this code will immediately see the expensive part.
>
> > +        if (n !=3D sizeof(desc)) {
> > +            virtio_error(vdev, "Driver provided input buffer "
> > +                               "for descriptors that is too small!");
> > +            err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
> > +            goto out;
> > +        }
> > +    }
> > +    goto out;
> > +
> > +out:
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, err_status);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data->ZoneReportData.zones);
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_report(VirtIOBlockReq *req) {
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    unsigned int nr_zones;
> > +    ZoneCmdData *data;
> > +    int64_t zone_size, offset;
> > +    uint8_t err_status;
> > +
> > +    if (req->in_len <=3D sizeof(struct virtio_blk_inhdr) +
> > +                       sizeof(struct virtio_blk_zone_report)) {
> > +        virtio_error(vdev, "in buffer too small for zone report");
> > +        return -1;
> > +    }
> > +
> > +    /* start byte offset of the zone report */
> > +    offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
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
> > +    data->ZoneReportData.nr_zones =3D nr_zones;
> > +    data->ZoneReportData.zones =3D g_malloc(zone_size),
>
> nr_zones =3D 0 and zones =3D NULL is possible when in_len is sizeof(struc=
t
> virtio_blk_inhdr) + sizeof(struct virtio_blk_zone_report) + 1. Maybe the
> code handles it okay without dereferencing a NULL pointer, but it would
> be safer to change the check above like this:
>
>   if (req->in_len < sizeof(struct virtio_blk_inhdr) +
>                     sizeof(struct virtio_blk_zone_report) +
>                     sizeof(struct virtio_blk_zone_descriptor)) {
>       virtio_error(vdev, "in buffer too small for zone report");
>       return -1;
>   }
>
> > +
> > +    blk_aio_zone_report(s->blk, offset, &data->ZoneReportData.nr_zones=
,
> > +                        data->ZoneReportData.zones,
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
> > +static void virtio_blk_zone_mgmt_complete(void *opaque, int ret) {
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
>
> Missing ret < 0 error handling.
>
> > +
> > +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
> > +    virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
> > +    virtio_blk_free_request(req);
> > +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
> > +    g_free(data);
> > +}
> > +
> > +static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneO=
p op) {
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    BlockDriverState *bs =3D blk_bs(s->blk);
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    uint64_t len;
> > +    uint32_t type;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    if (!check_zone_model(s, offset / 512, 0, false, &err_status)) {
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +
> > +    type =3D virtio_ldl_p(vdev, &req->out.type);
> > +    if (type =3D=3D VIRTIO_BLK_T_ZONE_RESET_ALL) {
> > +        /* Entire drive capacity */
> > +        offset =3D 0;
> > +        blk_get_geometry(s->blk, &len);
> > +        len *=3D 512;
> > +    } else {
> > +        len =3D bs->bl.zone_sectors * 512;
>
> Is this correct when accessing the last zone of the device?
>
> > +    }
> > +
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
> > +static void virtio_blk_zone_append_complete(void *opaque, int ret) {
> > +    ZoneCmdData *data =3D opaque;
> > +    VirtIOBlockReq *req =3D data->req;
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
> > +    int64_t append_sector, n;
> > +    struct iovec *out_iov =3D req->elem.out_sg;
> > +    unsigned out_num =3D req->elem.out_num;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
>
> Error handling code for the ret < 0 case is missing.
>
> > +
> > +    append_sector =3D data->ZoneAppendData.append_sector;
> > +    int write_granularity =3D s->conf.conf.logical_block_size;
> > +    if ((append_sector * 512 % write_granularity) !=3D 0) {
> > +        err_status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
> > +        goto out;
> > +    }
>
> This looks like input validation. Why is it performed after the I/O
> request has completed?

UNALIGNED_WP should be checked in both input and output validation. By
checking if the starting/ending sector of the request data is aligned
with write_granularity(value of physical block size), the device sets
the UNALIGNED_WP bit and completes the request. According to spec
here:

+VIRTIO_BLK_S_ZONE_UNALIGNED_WP is set by the device when the request recei=
ved
+from the driver attempts to perform a write to an SWR zone and at least on=
e of
+the following conditions is met:
+
+\begin{itemize}
+\item the starting sector of the request is not equal to the current value=
 of
+    the zone write pointer.
+
+\item the ending sector of the request data multiplied by 512 is not a mul=
tiple
+    of the value reported by the device in the field \field{write_granular=
ity}
+    in the device configuration space.
+\end{itemize}

>
> I guess the intent is to check the value that the guest driver provided,
> not the value produced by the device after the I/O request completed?
>
> > +    n =3D iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(appen=
d_sector));
>
> Please use virtio_stq_p() on append_sector first to ensure that the
> endianness is correct.
>
> > +    if (n !=3D sizeof(append_sector)) {
> > +        virtio_error(vdev, "Driver provided input buffer less than siz=
e of "
> > +                     "append_sector");
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
> > +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {
>
> The return value is not used. Please change the return type to void.

The return type should be int actually. Otherwise, QEMU will terminate
when the zone_append request is issued from the guest. It is the one
cause that failed some of the zonefs tests. After coredump, backtrace
indicates address_space_unmap: Assertion `mr ! =3D NULL` failed rooted
from virtio_blk_zone_append_complete(). I haven't figured out exactly
why but my guess is virtio_blk_zone_op_complete() needs the return
value of virtio_blk_zone_op() ......

>
> > +    VirtIOBlock *s =3D req->dev;
> > +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
> > +    uint64_t niov =3D req->elem.out_num;
> > +    struct iovec *out_iov =3D req->elem.out_sg;
> > +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
> > +
> > +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
> > +    int64_t len =3D 0;
> > +    for (int i =3D 1; i < niov; ++i) {
> > +        len +=3D out_iov[i].iov_len;
> > +    }
>
> Why is the first iovec skipped?

Because the first iovec is normally headers, and the rest is buffer
that out_iov needs.

>
> > +
> > +    if (!check_zone_model(s, offset / 512, len / 512, true, &err_statu=
s)) {
> > +        goto out;
> > +    }
> > +
> > +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
> > +    data->req =3D req;
> > +    data->ZoneAppendData.append_sector =3D offset;
> > +    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
> > +    blk_aio_zone_append(s->blk, &data->ZoneAppendData.append_sector, &=
req->qiov, 0,
> > +                        virtio_blk_zone_append_complete, data);
> > +
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
> > @@ -700,6 +969,24 @@ static int virtio_blk_handle_request(VirtIOBlockRe=
q *req, MultiReqBuffer *mrb)
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
> > +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
> > +        break;
> >      case VIRTIO_BLK_T_SCSI_CMD:
> >          virtio_blk_handle_scsi(req);
> >          break;
> > @@ -718,6 +1005,9 @@ static int virtio_blk_handle_request(VirtIOBlockRe=
q *req, MultiReqBuffer *mrb)
> >          virtio_blk_free_request(req);
> >          break;
> >      }
> > +   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
> > +       virtio_blk_handle_zone_append(req);
> > +       break;
> >      /*
> >       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are defined =
with
> >       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch st=
atement,
> > @@ -917,6 +1207,7 @@ static void virtio_blk_update_config(VirtIODevice =
*vdev, uint8_t *config)
> >  {
> >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> >      BlockConf *conf =3D &s->conf.conf;
> > +    BlockDriverState *state =3D blk_bs(s->blk);
>
> Usually the variable is called "bs". Please use that name here and
> elsewhere in the patch.
>
> >      struct virtio_blk_config blkcfg;
> >      uint64_t capacity;
> >      int64_t length;
> > @@ -976,6 +1267,31 @@ static void virtio_blk_update_config(VirtIODevice=
 *vdev, uint8_t *config)
> >          blkcfg.write_zeroes_may_unmap =3D 1;
> >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> >      }
> > +#ifdef CONFIG_BLKZONED
>
> Is this ifdef appropriate? I think bs->bl.zoned should always be
> available, even when <blkzoned.h> is missing (e.g. non-Linux system). In
> the future there may be an emulated zoned BlockDriver. virtio-blk
> should be able to use the emulated zoned BlockDriver even on non-Linux
> systems.
>
Ok, you are right.

> I think CONFIG_BLKZONED should be limited to block/file-posix.c.

I'm not sure. There may be some places where virtio-blk needs this
config. Like in transforming blk_zone_descriptor to
virtio_blk_zone_descriptor, it needs to use Linux's constants to
ensure nothing go wrong here.

>
> > +    if (state->bl.zoned !=3D BLK_Z_NONE) {
> > +        switch (state->bl.zoned) {
> > +        case BLK_Z_HM:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
> > +            virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,

> > +                         state->bl.zone_sectors);
> > +            virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > +                         state->bl.max_active_zones);
> > +            virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > +                         state->bl.max_open_zones);
> > +            virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_si=
ze);
> > +            virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > +                         state->bl.max_append_sectors);
> > +            break;
> > +        case BLK_Z_HA:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
>
> The block limits aren't relevant to host-aware zoned devices?

Yes, the HA devices are seen as non-zoned device and the driver just
ignore all other fields in zoned.

+\item if the driver that can not support zoned devices reads
+    VIRTIO_BLK_Z_HA from the \field{model} field of \field{zoned}, the dri=
ver
+    MAY handle the device as a non-zoned device. In this case, the
+    driver SHOULD ignore all other fields in \field{zoned}.
+\end{itemize}

>
> > +            break;
> > +        default:
> > +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
> > +            virtio_error(vdev, "Invalid zoned model %x \n", (int)state=
->bl.zoned);
> > +            break;
> > +        }
> > +    }
> > +#endif
> >      memcpy(config, &blkcfg, s->config_size);
> >  }
> >
> > @@ -995,6 +1311,7 @@ static uint64_t virtio_blk_get_features(VirtIODevi=
ce *vdev, uint64_t features,
> >                                          Error **errp)
> >  {
> >      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
> > +    BlockDriverState *state =3D blk_bs(s->blk);
> >
> >      /* Firstly sync all virtio-blk possible supported features */
> >      features |=3D s->host_features;
> > @@ -1003,6 +1320,12 @@ static uint64_t virtio_blk_get_features(VirtIODe=
vice *vdev, uint64_t features,
> >      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
> >      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
> >      virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
> > +    if (state->bl.zoned !=3D BLK_Z_NONE) {
> > +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
> > +        if (state->bl.zoned =3D=3D BLK_Z_HM) {
> > +            virtio_clear_feature(&features, VIRTIO_BLK_F_DISCARD);
>
> Why is features modified here but s->host_features is modified in the
> line above?

Because F_DISCARD should not be offered by the driver when the device
offers F_ZONED with the HM model.

>
> > +        }
> > +    }
>
> This detects VIRTIO_BLK_F_ZONED based on the BlockDriverState...
(This part can be removed.)

>
> >      if (virtio_has_feature(features, VIRTIO_F_VERSION_1)) {
> >          if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_SCSI)) {
> >              error_setg(errp, "Please set scsi=3Doff for virtio-blk dev=
ices in order to use virtio 1.0");
> > @@ -1286,6 +1609,9 @@ static Property virtio_blk_properties[] =3D {
> >  #ifdef __linux__
> >      DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
> >                        VIRTIO_BLK_F_SCSI, false),
> > +#endif
> > +#ifdef CONFIG_BLKZONED
> > +    DEFINE_PROP_BIT64("zoned", VirtIOBlock, host_features, VIRTIO_BLK_=
F_ZONED, true),
> >  #endif
>
> ...but this allows users to enable/disable the flag from the
> command-line.
>
> I think DEFINE_PROP_BIT64() can be removed, but please check that the
> config space size is still correct. It may be necessary to move the
> bs->bl.zoned check into virtio_blk_device_realize() and set
> the VIRTIO_BLK_F_ZONED s->host_features bit there instead. That will
> allow the s->config_size calculation to work correctly.

Ok, it works. Thanks!

Additionally, the DEFINE_PROP_BIT here is to declare that the supports
zones. Then the virtio-blk driver will not need to look at that
feature. So the former part detecting the F_ZONED feature based on
BlockDriverState can be removed. If removing this macro, then the
virio-blk driver must set the F_ZONED feature by itself.

