Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528A5FD62C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:27:04 +0200 (CEST)
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitYV-0003uS-Ds
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oisuz-0004bK-AK; Thu, 13 Oct 2022 03:46:13 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oisuv-0006HA-AI; Thu, 13 Oct 2022 03:46:12 -0400
Received: by mail-vs1-xe32.google.com with SMTP id p7so945841vsr.7;
 Thu, 13 Oct 2022 00:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kWVOkzbu8ryZHg/T9Ui1RZP02vbsGQ8dUvaXqOkuN24=;
 b=Tfzd7BVPCP86d0e8tzLqeYzk/ESUMaVSO+XfCOOzbEKx3IoibjC0lbNmEp+axaQGIF
 rMv7Oikh6EsKqj7qDtURxu+Tb7N53CJqL8Nq/VCEbbSJrdAvB5EFe4XQMpsWTUaTLR8X
 18JjKzqOlQrrJb0hIY539UieC88QjLwlAONcQ2Nmd9Z8yvDfmYriFqvh3aZZQW3sLQ9s
 E3Uj3pFCIZWXKUmDYJgu4jIy2cTRS5CsXkVxo/Q6KN8QgaQmjbiS33fnVCJ2kbK96p+G
 +RpHSwpHvsTpLgEKAENpRSGWTkUcfxMz222qFaFQcu5MNsxD+irCo8vsqhLZJCizVrvQ
 nvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWVOkzbu8ryZHg/T9Ui1RZP02vbsGQ8dUvaXqOkuN24=;
 b=F2Z9fSWlar2lYgBaon33KlpXNBipItXuTcuHNzxKKSBnH+NnnPLtJuPLFgT3uNvIPj
 G7GByjjnESCiVLJgdVPUiR5pGzd6ojH+BEpsZ1HFLZkyjMQD5Je35Hpe+tsJZYw47Fiy
 qP1efC0AxgZr6rMVb6I80clF/WAzOaoKS3S++e800kwD0Roi/pLjUAMLDymMxyjColQo
 WKaC5IP3NCI55FTfQ/QVjEey5R+qUt17yFr28vUT0nAL0goJZTocJNCGpEN/BvjMU+Ar
 czAVNtEuV8OCAXGpCdhJcB0r/nuR5bY42QtigXFR371nrqZwhNldUakmWLoerezWPggS
 06CQ==
X-Gm-Message-State: ACrzQf2yr3YYUcp1KdSVgIvkw8ygLWoKAT4KEHpd+38LfFvIcY6w/mtk
 p9ekinLUP37GRXlV620/1NciyiUOobIm0evD8P4=
X-Google-Smtp-Source: AMsMyM4ecvRneBZFjKPFhqhhM49A9YtzrWz+vpQrBMtON8qfBk30hoS+P06KHT5wcnu2xkTTkor4CGa0Afb43dexO14=
X-Received: by 2002:a67:d290:0:b0:3a7:6470:9cd with SMTP id
 z16-20020a67d290000000b003a7647009cdmr12177635vsi.17.1665647166843; Thu, 13
 Oct 2022 00:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221010023306.43610-1-faithilikerun@gmail.com>
 <20221010023306.43610-2-faithilikerun@gmail.com>
 <c9bfaecf-f97c-e7ad-da79-b2662137004b@opensource.wdc.com>
 <CAAAx-8JsFc6i9sCX_WiYERaAnoEgrHv5yhdjpF94sAu88kZc6A@mail.gmail.com>
 <ea76ecc8-0dec-136e-1d94-7a1bbd20f4a6@opensource.wdc.com>
In-Reply-To: <ea76ecc8-0dec-136e-1d94-7a1bbd20f4a6@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 13 Oct 2022 15:46:23 +0800
Message-ID: <CAAAx-8Jt6bu-MRAwF4HXFhZfaey3JQ8x6qSwguBLuR=3ZE2pbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] file-posix:add the tracking of the zones write
 pointers
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, 
 hare@suse.de, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe32.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B410=
=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 15:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/10/13 16:08, Sam Li wrote:
> > Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=
=B410=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 13:13=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 10/10/22 11:33, Sam Li wrote:
> >>> Since Linux doesn't have a user API to issue zone append operations t=
o
> >>> zoned devices from user space, the file-posix driver is modified to a=
dd
> >>> zone append emulation using regular writes. To do this, the file-posi=
x
> >>> driver tracks the wp location of all zones of the device. It uses an
> >>> array of uint64_t. The most significant bit of each wp location indic=
ates
> >>> if the zone type is conventional zones.
> >>>
> >>> The zones wp can be changed due to the following operations issued:
> >>> - zone reset: change the wp to the start offset of that zone
> >>> - zone finish: change to the end location of that zone
> >>> - write to a zone
> >>> - zone append
> >>>
> >>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> >>> ---
> >>>  block/file-posix.c               | 158 +++++++++++++++++++++++++++++=
++
> >>>  include/block/block-common.h     |  14 +++
> >>>  include/block/block_int-common.h |   5 +
> >>>  3 files changed, 177 insertions(+)
> >>>
> >>> diff --git a/block/file-posix.c b/block/file-posix.c
> >>> index a9d347292e..17c0b58158 100755
> >>> --- a/block/file-posix.c
> >>> +++ b/block/file-posix.c
> >>> @@ -206,6 +206,7 @@ typedef struct RawPosixAIOData {
> >>>          struct {
> >>>              struct iovec *iov;
> >>>              int niov;
> >>> +            int64_t *append_sector;
> >>
> >> This should be added as part of patch 2. You do not need this to track
> >> the wp of zones in this patch.
> >>
> >>>          } io;
> >>>          struct {
> >>>              uint64_t cmd;
> >>> @@ -226,6 +227,7 @@ typedef struct RawPosixAIOData {
> >>>          struct {
> >>>              unsigned long zone_op;
> >>>              const char *zone_op_name;
> >>> +            bool all;
> >>>          } zone_mgmt;
> >>>      };
> >>>  } RawPosixAIOData;
> >>> @@ -1331,6 +1333,67 @@ static int hdev_get_max_segments(int fd, struc=
t stat *st) {
> >>>  #endif
> >>>  }
> >>>
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +static int get_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,
> >>
> >> Nit: It would seem more natural to have the fd argument first...
> >>
> >>> +                        unsigned int nrz) {
> >>> +    struct blk_zone *blkz;
> >>> +    int64_t rep_size;
> >>> +    int64_t sector =3D offset >> BDRV_SECTOR_BITS;
> >>> +    int ret, n =3D 0, i =3D 0;
> >>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
> >>> +    g_autofree struct blk_zone_report *rep =3D NULL;
> >>> +
> >>> +    rep =3D g_malloc(rep_size);
> >>> +    blkz =3D (struct blk_zone *)(rep + 1);
> >>> +    while (n < nrz) {
> >>> +        memset(rep, 0, rep_size);
> >>> +        rep->sector =3D sector;
> >>> +        rep->nr_zones =3D nrz - n;
> >>> +
> >>> +        do {
> >>> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
> >>> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
> >>> +        if (ret !=3D 0) {
> >>> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " fai=
led %d",
> >>> +                    fd, offset, errno);
> >>> +            return -errno;
> >>> +        }
> >>> +
> >>> +        if (!rep->nr_zones) {
> >>> +            break;
> >>> +        }
> >>> +
> >>> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
> >>> +            /*
> >>> +             * The wp tracking cares only about sequential writes re=
quired and
> >>> +             * sequential write preferred zones so that the wp can a=
dvance to
> >>> +             * the right location.
> >>> +             * Use the most significant bit of the wp location to in=
dicate the
> >>> +             * zone type: 0 for SWR/SWP zones and 1 for conventional=
 zones.
> >>> +             */
> >>> +            if (!(blkz[i].type !=3D BLK_ZONE_TYPE_CONVENTIONAL)) {
> >>
> >> Double negation... This can simply be:
> >>
> >> if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
> >>
> >>> +                wps->wp[i] +=3D 1ULL << 63;
> >>
> >> No need for the +=3D here. This can be "=3D".
> >>
> >>> +            } else {
> >>> +                wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
> >>> +            }
> >>> +        }
> >>> +        sector =3D blkz[i-1].start + blkz[i-1].len;
> >>
> >> spaces missing around the "-" in the "i-1" expressions.
> >>
> >>> +    }
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static void update_zones_wp(int64_t offset, int fd, BlockZoneWps *wp=
s,
> >>
> >> Same nit as above: fd being the first argument would be a little more
> >> natural in my opinion.
> >>
> >>> +                            unsigned int nrz) {
> >>> +    qemu_mutex_lock(&wps->lock);
> >>> +    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
> >>> +        error_report("report zone wp failed");
> >>> +        return;
> >>
> >> You are leacking the lock here. Remove the return. Also, given that
> >> get_zones_wp() already prints a message if report fails, I do not thin=
k
> >> the message here is useful.
> >>
> >> Also, why is this function void typed ? How can the caller know if the
> >> update succeeded or not ?
> >
> > Update failures mean get_zones_wp() fails and that will be reported by
> > error_report. The error message indicates updates fail not reports
> > fail. Maybe modifying the message suffices error checking?
> >
> > +    qemu_mutex_lock(&wps->lock);
> > +    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
> > +        error_report("update zone wp failed");
> > +    }
> > +    qemu_mutex_unlock(&wps->lock);
> >
> >
> >>
> >>> +    }
> >>> +    qemu_mutex_unlock(&wps->lock);
> >>> +}
> >>> +#endif
> >>> +
> >>>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
> >>>  {
> >>>      BDRVRawState *s =3D bs->opaque;
> >>> @@ -1414,6 +1477,19 @@ static void raw_refresh_limits(BlockDriverStat=
e *bs, Error **errp)
> >>>              error_report("Invalid device capacity %" PRId64 " bytes =
", bs->bl.capacity);
> >>>              return;
> >>>          }
> >>> +
> >>> +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
> >>> +        if (ret >=3D 0) {
> >>> +            bs->bl.write_granularity =3D ret;
> >>> +        }
> >>
> >> Why is this change here ? Shouldn't this be part of the previous serie=
s
> >> "Add support for zoned device" ?
> >
> > Because only zone append uses write_granularity to check the iovector
> > size alignment. The previous series doesn't use this field.
>
> Then move this to patch 2. This should not be in this patch since you are=
 not
> dealing with zone append yet.
>
> >
> >>
> >>> +
> >>> +        bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) + sizeof(int64_=
t) * ret);
> >>> +        if (get_zones_wp(0, s->fd, bs->bl.wps, ret) < 0){
> >>> +            error_report("report wps failed");
> >>> +            g_free(bs->bl.wps);
> >>> +            return;
> >>> +        }
> >>> +        qemu_mutex_init(&bs->bl.wps->lock);
> >>>      }
> >>>  }
> >>>
> >>> @@ -1651,6 +1727,20 @@ static int handle_aiocb_rw(void *opaque)
> >>>      ssize_t nbytes;
> >>>      char *buf;
> >>>
> >>> +    /*
> >>> +     * The offset of regular writes, append writes is the wp locatio=
n
> >>> +     * of that zone.
> >>> +     */
> >>> +    if (aiocb->aio_type & QEMU_AIO_WRITE) {
> >>> +        if (aiocb->bs->bl.zone_size > 0) {
> >>> +            BlockZoneWps *wps =3D aiocb->bs->bl.wps;
> >>> +            qemu_mutex_lock(&wps->lock);
> >>> +            aiocb->aio_offset =3D wps->wp[aiocb->aio_offset /
> >>> +                                        aiocb->bs->bl.zone_size];
> >>> +            qemu_mutex_unlock(&wps->lock);
> >>> +        }
> >>
> >> I do not understand this hunk at all. What is this trying to do ? zone
> >> append support goes into patch 2. You are overwritting the user
> >> specified aio offset using the tracked wp value. That could result in =
a
> >> successfull write even if the user sent an unaligned write command. Th=
at
> >> is bad.
> >
> > Ok, regular writes and append writes got mixed up when I changed the
> > offset to the wp of that zone.
> >
> >>
> >> Here you should only be tracking the write pointer, so increment
> >> wps->wp[index], which you do below.
> >
> > Understood. Will move it to the next patch.
>
> No ! You should not change the aio offset for regular writes. Otherwise y=
ou may
> hide errors for bad commands from the guest by having them succeed :)
> aio offset change should be done ONLY for zone append, not for regular wr=
ites.
>
> >
> >>
> >>> +    }
> >>> +
> >>>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
> >>>          /*
> >>>           * If there is just a single buffer, and it is properly alig=
ned
> >>> @@ -1725,6 +1815,24 @@ static int handle_aiocb_rw(void *opaque)
> >>>
> >>>  out:
> >>>      if (nbytes =3D=3D aiocb->aio_nbytes) {
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> >>> +            BlockZoneWps *wps =3D aiocb->bs->bl.wps;
> >>> +            int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_siz=
e;
> >>> +            if (wps) {
> >>> +                qemu_mutex_lock(&wps->lock);
> >>> +                if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> >>> +                    uint64_t wend_offset =3D
> >>> +                            aiocb->aio_offset + aiocb->aio_nbytes;
> >>> +                    /* Advance the wp if needed */
> >>> +                    if (wend_offset > wps->wp[index]){
> >>> +                        wps->wp[index] =3D wend_offset;
> >>> +                    }
> >>> +                }
> >>> +                qemu_mutex_unlock(&wps->lock);
> >>> +            }
> >>> +        }
> >>> +#endif
> >>>          return 0;
> >>>      } else if (nbytes >=3D 0 && nbytes < aiocb->aio_nbytes) {
> >>>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
> >>> @@ -1736,6 +1844,12 @@ out:
> >>>          }
> >>>      } else {
> >>>          assert(nbytes < 0);
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> >>> +            update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
> >>> +                            aiocb->bs->bl.nr_zones);
> >>
> >> You only need to update the target zone of the aio, not all zones.
> >> Updating all zones is actually a bug as wp[] entries for other zones m=
ay
> >> be larger than the device reported wp if there are other write aios in
> >> flight. So the last argument must be "1" here.
> >
> > Ok, I understood now.
> >
> >>
> >>> +        }
> >>> +#endif
> >>>          return nbytes;
> >>>      }
> >>>  }
> >>> @@ -2022,12 +2136,17 @@ static int handle_aiocb_zone_report(void *opa=
que) {
> >>>  #if defined(CONFIG_BLKZONED)
> >>>  static int handle_aiocb_zone_mgmt(void *opaque) {
> >>>      RawPosixAIOData *aiocb =3D opaque;
> >>> +    BlockDriverState *bs =3D aiocb->bs;
> >>>      int fd =3D aiocb->aio_fildes;
> >>>      int64_t sector =3D aiocb->aio_offset / 512;
> >>>      int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
> >>> +    uint64_t wend_offset;
> >>>      struct blk_zone_range range;
> >>>      int ret;
> >>>
> >>
> >> Why the blank line here ?
> >
> > For readability, separate it from the execution part.
>
> But the following lines are variable declarations. I personally prefer
> declarations to stay together before the code :)

Ok, will change it.

>
> >
> >>
> >>> +    BlockZoneWps *wps =3D bs->bl.wps;
> >>> +    int index =3D aiocb->aio_offset / bs->bl.zone_size;
> >>> +
> >>>      /* Execute the operation */
> >>>      range.sector =3D sector;
> >>>      range.nr_sectors =3D nr_sectors;
> >>> @@ -2035,11 +2154,41 @@ static int handle_aiocb_zone_mgmt(void *opaqu=
e) {
> >>>          ret =3D ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
> >>>      } while (ret !=3D 0 && errno =3D=3D EINTR);
> >>>      if (ret !=3D 0) {
> >>> +        update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
> >>> +                        aiocb->bs->bl.nr_zones);
> >>
> >> You need only to update the range of zones that was specified for the
> >> management option, not all zones. So you must specify the zone
> >> management aio offset and size/zone_size here.
> >>
> >>>          ret =3D -errno;
> >>>          error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_=
name,
> >>>                       ret);
> >>>          return ret;
> >>>      }
> >>> +
> >>> +    qemu_mutex_lock(&wps->lock);
> >>> +    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
> >>> +         /*
> >>> +         * The zoned device allows the last zone smaller that the zo=
ne size.
> >>> +         */
> >>
> >> comment indentation is off.
> >>
> >>> +        if (aiocb->aio_nbytes < bs->bl.zone_size) {
> >>> +            wend_offset =3D aiocb->aio_offset + aiocb->aio_nbytes;
> >>> +        } else {
> >>> +            wend_offset =3D aiocb->aio_offset + bs->bl.zone_size;
> >>> +        }
> >>> +
> >>> +        if (aiocb->aio_offset !=3D wps->wp[index] &&
> >>> +            aiocb->zone_mgmt.zone_op =3D=3D BLKRESETZONE) {
> >>
> >> I do not understand the condition here. Why do you have
> >> "aiocb->aio_offset !=3D wps->wp[index]" ?
> >
> > It is intended for zone state checks. aio_offset (=3D start byte of tha=
t
> > zone) =3D wp means this zone is empty. Only non-empty zones will be
> > reset.
>
> That is not very natural to use an input from the user (the guest) to che=
ck the
> state of something that you (qemu) maintains internally and hides to the =
user.
> You should do such test with a small helpers like this:
>
> static bool zone_is_empty(bl, index)
> {
>         return bl->wps.wp[index} =3D=3D index * bl->zone_size;
> }

Ok.

>
> And note that this will ALWAYS return false for conventional zones.
> You are not checking for conventional zones either. Any zone management f=
unction
> should be immediately failed if addressed to a conventional zone. That is
> missing. You need a:
>
> if (BDRV_ZT_IS_CONV(wps->wp[index] && "this is not a zone reset all op")
>         return -EIO; /* or similar... */
>
> at the beginning of handle_aiocb_zone_mgmt().

(Just add an additional note: )
Though this check should be in the block layer API patches, it is
possible when wps[] is introduced.

>
> >
> >>
> >>> +            if (aiocb->zone_mgmt.all) {
> >>
> >> This is the only place where you use this all boolean field. For
> >> simplicity, I would drop this field completely and test that
> >> aiocb->aio_offset =3D=3D 0 && aiocb->aio_nbytes =3D=3D bs->bl.capacity=
 to detect
> >> a reset all zones operation.
> >
> > Right, the capacity field makes it possible. I'll drop it.
> >
> >>
> >>> +                for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
> >>> +                    wps->wp[i] =3D i * bs->bl.zone_size;
> >>
> >> You are not handling conventional zones here. For conventional zones,
> >> you should not change the value. Otherwise, BDRV_ZT_IS_CONV() will
> >> always return false after this.
> >
> > Right, will add a condition line here:
> > + if (! BDRV_ZT_IS_CONV(wps->wp[i]))
>
> You need:
>
> if (BDRV_ZT_IS_CONV(wps->wp[i]))
>     continue;
>
> as the first lines inside the for loop.

Trivial: looks like the same behavior:
 if (! BDRV_ZT_IS_CONV(wps->wp[i])) {
    /* change pointers */
}

if (BDRV_ZT_IS_CONV(wps->wp[i]))
    continue;
/* change pointers */

>
>
> >
> >>
> >>> +                }
> >>> +            } else {
> >>> +                wps->wp[index] =3D aiocb->aio_offset;
> >>> +            }
> >>> +        } else if (aiocb->aio_offset !=3D wps->wp[index] &&
> >>> +            aiocb->zone_mgmt.zone_op =3D=3D BLKFINISHZONE) {
> >>
> >> Same comment here. Why do you have "aiocb->aio_offset !=3D wps->wp[ind=
ex]" ?
> >
> > This should be wend_offset !=3D wps->wp[index]. It means if this zone i=
s
> > full, no need to finish it.
>
> Nope, this does not mean the zone is full. Full condition would be:
>
> wps->wp[index] >=3D index * bl->zone_size + zone_cap
>
> But you do not have zone cap per zone (remember that zone capacity is per=
 zone
> and may differ between zones)... You could add it to the wp array, but th=
at will
> make it larger for not much benefits. Since finishing a zone that is alre=
ady
> full is a very rare case, optimizing for it is not valuable. So simply is=
sue the
> zone finish operation. It will be a no-op on the host device if the zone =
is
> already full. No big deal !

I see.

Thanks!

>
> >
> >>
> >>> +            wps->wp[index] =3D wend_offset;
> >>> +        }
> >>> +    }
> >>> +    qemu_mutex_unlock(&wps->lock);
> >>> +
> >>>      return ret;
> >>>  }
> >>>  #endif
> >>> @@ -2480,6 +2629,12 @@ static void raw_close(BlockDriverState *bs)
> >>>      BDRVRawState *s =3D bs->opaque;
> >>>
> >>>      if (s->fd >=3D 0) {
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +        if (bs->bl.wps) {
> >>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
> >>> +            g_free(bs->bl.wps);
> >>> +        }
> >>> +#endif
> >>>          qemu_close(s->fd);
> >>>          s->fd =3D -1;
> >>>      }
> >>> @@ -3278,6 +3433,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
> >>>      int64_t zone_size, zone_size_mask;
> >>>      const char *zone_op_name;
> >>>      unsigned long zone_op;
> >>> +    bool is_all =3D false;
> >>>
> >>>      zone_size =3D bs->bl.zone_size;
> >>>      zone_size_mask =3D zone_size - 1;
> >>> @@ -3314,6 +3470,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
> >>>      case BLK_ZO_RESET_ALL:
> >>>          zone_op_name =3D "BLKRESETZONE";
> >>>          zone_op =3D BLKRESETZONE;
> >>> +        is_all =3D true;
> >>>          break;
> >>>      default:
> >>>          g_assert_not_reached();
> >>> @@ -3328,6 +3485,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
> >>>          .zone_mgmt  =3D {
> >>>              .zone_op =3D zone_op,
> >>>              .zone_op_name =3D zone_op_name,
> >>> +            .all =3D is_all,
> >>>          },
> >>>      };
> >>>
> >>> diff --git a/include/block/block-common.h b/include/block/block-commo=
n.h
> >>> index 882de6825e..b8b2dba64a 100644
> >>> --- a/include/block/block-common.h
> >>> +++ b/include/block/block-common.h
> >>> @@ -93,6 +93,14 @@ typedef struct BlockZoneDescriptor {
> >>>      BlockZoneCondition cond;
> >>>  } BlockZoneDescriptor;
> >>>
> >>> +/*
> >>> + * Track write pointers of a zone in bytes.
> >>> + */
> >>> +typedef struct BlockZoneWps {
> >>> +    QemuMutex lock;
> >>> +    uint64_t wp[];
> >>> +} BlockZoneWps;
> >>> +
> >>>  typedef struct BlockDriverInfo {
> >>>      /* in bytes, 0 if irrelevant */
> >>>      int cluster_size;
> >>> @@ -206,6 +214,12 @@ typedef enum {
> >>>  #define BDRV_SECTOR_BITS   9
> >>>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
> >>>
> >>> +/*
> >>> + * Get the first most significant bit of wp. If it is zero, then
> >>> + * the zone type is SWR.
> >>> + */
> >>> +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
> >>> +
> >>>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_B=
ITS, \
> >>>                                             INT_MAX >> BDRV_SECTOR_BI=
TS)
> >>>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SEC=
TOR_BITS)
> >>> diff --git a/include/block/block_int-common.h b/include/block/block_i=
nt-common.h
> >>> index 37dddc603c..59c2d1316d 100644
> >>> --- a/include/block/block_int-common.h
> >>> +++ b/include/block/block_int-common.h
> >>> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
> >>>
> >>>      /* device capacity expressed in bytes */
> >>>      int64_t capacity;
> >>> +
> >>> +    /* array of write pointers' location of each zone in the zoned d=
evice. */
> >>> +    BlockZoneWps *wps;
> >>> +
> >>> +    int64_t write_granularity;
> >>>  } BlockLimits;
> >>>
> >>>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> >>
> >> --
> >> Damien Le Moal
> >> Western Digital Research
> >>
>
> --
> Damien Le Moal
> Western Digital Research
>

