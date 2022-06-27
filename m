Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982555B8A4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 10:34:38 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5kCa-0006mL-My
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 04:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5k9U-0005RB-A8; Mon, 27 Jun 2022 04:31:27 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1o5k9S-0001CS-9w; Mon, 27 Jun 2022 04:31:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id i15so15538377ybp.1;
 Mon, 27 Jun 2022 01:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GC/fV/XuSbr05y6i59JS2MpEoVaIfl7X1s06XBJwPTM=;
 b=hNzSX87L/BUeXV/j5iBKWM90E3wNiFveKb9Xb8xZAVLVI3ZPq3nCUzJMKa9xnBFajg
 xGW+dpjkWpfE8/IoN4aR/H5WCnkzhXOjJ1jmfcBbRV47u8Q+gJqxTvYq/kvNHMXQQYA7
 /LymQUDgVHz/gejjQDsIHFNiDcml6erYcCnhby8u76f/L+vhmN/j1Yg7vDTMrbK1i1KN
 kFRDJOrsSiQm5Ja/5P5iemPKeb9jn6ChGFI7u+j3noWpCVcnv/W/BluGZJdI3hEqnaXB
 fFhSNM4MP0jpEMygCwLBGEuxRS3R3ftaQnq3Pvt+3XIxr6jjm2FY7aBiaPqM+8nmwnwj
 Qa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GC/fV/XuSbr05y6i59JS2MpEoVaIfl7X1s06XBJwPTM=;
 b=yxzWsztAjtHRV1Fout79mV7IYyp/mCxOp87qXhAdDyTyj/quxGkxx4HtqzH0oYyoGg
 h0KNbVw7tp6z6SkqmSg8cLgnvl7oDJ2NtnlFxX/tUqcaJxSceNd7FtvhEhbPAYxumZa2
 Jstw3/9T3oYFRRQXJ/2kRdz4l0UU0zWtS0AGp4zdcyKhsChca7x3siJgCXfZHXPoKjZP
 DDXeYcQEwxHZsrsfsvXBlcw9FvshCWw0fbL0bhsSf/ZloRNDv0MpV+7BL69+On9K4+d/
 I0lehXJrepi8CjkGCiY5PXbuCdvHe9m1TRouMJ6Cdr7ibwG7cMgsfkPRF6vNbkau8X1T
 aonw==
X-Gm-Message-State: AJIora8VrXf8heZATQZ0wh7o+f4oI/XKz9uHNUEQBkqd88lUUcoC+i9P
 0DUO+iVHgbeT2QqYB39lJf/+GPjWUp/olUOrZWY=
X-Google-Smtp-Source: AGRyM1tE+RefofG2P0uIi069LfAXYVoIs8fqvH/bNasb9y8IVzF+S4wWK2L5S3AkYHbrNjCrE9WsJmMf30knj9HAJ5M=
X-Received: by 2002:a25:bf82:0:b0:669:b394:33c with SMTP id
 l2-20020a25bf82000000b00669b394033cmr11958207ybk.102.1656318680689; Mon, 27
 Jun 2022 01:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
 <4b283da3-8f9b-2064-95b0-e0e963e5044a@suse.de>
In-Reply-To: <4b283da3-8f9b-2064-95b0-e0e963e5044a@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 27 Jun 2022 16:31:20 +0800
Message-ID: <CAAAx-8KE_qnqq2vWuvZ_n5b7Ukh5x9VED3GgFXezk23DOhH1Dw@mail.gmail.com>
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
To: Hannes Reinecke <hare@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hannes Reinecke <hare@suse.de> =E4=BA=8E2022=E5=B9=B46=E6=9C=8827=E6=97=A5=
=E5=91=A8=E4=B8=80 15:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On 6/27/22 02:19, Sam Li wrote:
> > ---
>
> Good coding style would advise to add some text here what the patch does.
>
> >   block/io.c               |  21 +++++++
> >   include/block/block-io.h |  13 +++++
> >   qemu-io-cmds.c           | 121 ++++++++++++++++++++++++++++++++++++++=
+
> >   3 files changed, 155 insertions(+)
> >
> > diff --git a/block/io.c b/block/io.c
> > index 789e6373d5..656a1b7271 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -3258,6 +3258,27 @@ out:
> >       return co.ret;
> >   }
> >
> > +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> > +                        int64_t len, int64_t *nr_zones,
> > +                        BlockZoneDescriptor *zones)
> > +{
> > +    if (!bs->drv->bdrv_co_zone_report) {
> > +        return -ENOTSUP;
>
> ENOTSUP or EOPNOTSUP?
> Kevin?
>
> > +    }
> > +
> > +    return bs->drv->bdrv_co_zone_report(bs, offset, len, nr_zones, zon=
es);
> > +}
> > +
> > +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    if (!bs->drv->bdrv_co_zone_mgmt) {
> > +        return -ENOTSUP;
> > +    }
> > +
> > +    return bs->drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> > +}
> > +
> >   void *qemu_blockalign(BlockDriverState *bs, size_t size)
> >   {
> >       IO_CODE();
> > diff --git a/include/block/block-io.h b/include/block/block-io.h
> > index 62c84f0519..c85c174579 100644
> > --- a/include/block/block-io.h
> > +++ b/include/block/block-io.h
> > @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, voi=
d *buf);
> >   /* Ensure contents are flushed to disk.  */
> >   int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
> >
> > +/* Report zone information of zone block device. */
> > +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t off=
set,
> > +                                     int64_t len, int64_t *nr_zones,
> > +                                     BlockZoneDescriptor *zones);
> > +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> > +        int64_t offset, int64_t len);
> > +
>
> There's the thing with the intendation ... please make it consistent,
> and ideally follow with whatever the remaining prototypes do.
>
> >   int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes)=
;
> >   bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
> >   int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> > @@ -290,6 +297,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVec=
tor *qiov, int64_t pos);
> >   int generated_co_wrapper
> >   bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t=
 pos);
> >
> > +int generated_co_wrapper blk_zone_report(BlockBackend *blk, int64_t of=
fset,
> > +                                         int64_t len, int64_t *nr_zone=
s,
> > +                                         BlockZoneDescriptor *zones);
> > +int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, enum zone_op=
 op,
> > +        int64_t offset, int64_t len);
> > +
>
> Again here.
>
> >   /**
> >    * bdrv_parent_drained_begin_single:
> >    *
> > diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> > index 2f0d8ac25a..3f2592b9f5 100644
> > --- a/qemu-io-cmds.c
> > +++ b/qemu-io-cmds.c
> > @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd =3D {
> >       .oneline    =3D "flush all in-core file state to disk",
> >   };
> >
> > +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int ret;
> > +    int64_t offset, len, nr_zones;
> > +    int i =3D 0;
> > +
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    nr_zones =3D cvtnum(argv[optind]);
> > +
> And 'optind' is set where?

optind is declared in getopt_core.h.

> Plus do check for 'argv' overflow; before increasing 'optind' and using
> 'argv[optind]' you have to validate that 'argv[optind]' is a valid pointe=
r.
>

Maybe we can check if argc is bigger than what we want?


> > +    g_autofree BlockZoneDescriptor *zones =3D g_new(BlockZoneDescripto=
r, nr_zones);
> > +    ret =3D blk_zone_report(blk, offset, len, &nr_zones, zones);
> > +    while (i < nr_zones) {
> > +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%l=
x, "
> > +                        "zcond:%u, [type: %u]\n",
> > +                zones[i].start, zones[i].length, zones[i].cap, zones[i=
].wp,
> > +                zones[i].cond, zones[i].type);
> > +        ++i;
> As 'i' is a simple iterator maybe use a 'for' loop here.
> But that really is a matter of preference :-)
>
Ok!

> > +    }
> > +    return ret;
> > +}
> > +
> > +static const cmdinfo_t zone_report_cmd =3D {
> > +        .name =3D "zone_report",
> > +        .altname =3D "f",
>
> altname 'f'?
> Is that correct?
>
No, it's not. I misunderstood altname's meaning. Changed it now.

> > +        .cfunc =3D zone_report_f,
> > +        .argmin =3D 3,
> > +        .argmax =3D 3,
> > +        .args =3D "offset [offset..] len [len..] number [num..]",
> > +        .oneline =3D "report a number of zones",
> > +};
> > +
> > +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
>
> Same here: please check for 'argv' overflow.
>
> > +    return blk_zone_mgmt(blk, zone_open, offset, len);
> > +}
> > +
> > +static const cmdinfo_t zone_open_cmd =3D {
> > +        .name =3D "zone_open",
> > +        .altname =3D "f",
>
> Same here; shouldn't 'altname' be different for each function?
> 'zo', maybe?
>
> > +        .cfunc =3D zone_open_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset [offset..] len [len..]",
> > +        .oneline =3D "explicit open a range of zones in zone block dev=
ice",
> > +};
> > +
> > +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
>
> argv checking.
>
> > +    return blk_zone_mgmt(blk, zone_close, offset, len);
> > +}
> > +
> > +static const cmdinfo_t zone_close_cmd =3D {
> > +        .name =3D "zone_close",
> > +        .altname =3D "f",
>
> altname 'zc'
>
> > +        .cfunc =3D zone_close_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset [offset..] len [len..]",
> > +        .oneline =3D "close a range of zones in zone block device",
> > +};
> > +
> > +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
>
> Argv checking.
>
> > +    return blk_zone_mgmt(blk, zone_finish, offset, len);
> > +}
> > +
> > +static const cmdinfo_t zone_finish_cmd =3D {
> > +        .name =3D "zone_finish",
> > +        .altname =3D "f",
>
> altname 'zf'
>
> > +        .cfunc =3D zone_finish_f,
> > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset [offset..] len [len..]",
> > +        .oneline =3D "finish a range of zones in zone block device",
> > +};
> > +
> > +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
> > +{
> > +    int64_t offset, len;
> > +    ++optind;
> > +    offset =3D cvtnum(argv[optind]);
> > +    ++optind;
> > +    len =3D cvtnum(argv[optind]);
>
> Argv checking.
>
> > +    return blk_zone_mgmt(blk, zone_reset, offset, len);
> > +}
> > +
> > +static const cmdinfo_t zone_reset_cmd =3D {
> > +        .name =3D "zone_reset",
> > +        .altname =3D "f",
>
> altname 'zf'
>
> > +        .cfunc =3D zone_reset_f, > +        .argmin =3D 2,
> > +        .argmax =3D 2,
> > +        .args =3D "offset [offset..] len [len..]",
> > +        .oneline =3D "reset a zone write pointer in zone block device"=
,
> > +};
> > +
> > +
> >   static int truncate_f(BlockBackend *blk, int argc, char **argv);
> >   static const cmdinfo_t truncate_cmd =3D {
> >       .name       =3D "truncate",
> > @@ -2498,6 +2614,11 @@ static void __attribute((constructor)) init_qemu=
io_commands(void)
> >       qemuio_add_command(&aio_write_cmd);
> >       qemuio_add_command(&aio_flush_cmd);
> >       qemuio_add_command(&flush_cmd);
> > +    qemuio_add_command(&zone_report_cmd);
> > +    qemuio_add_command(&zone_open_cmd);
> > +    qemuio_add_command(&zone_close_cmd);
> > +    qemuio_add_command(&zone_finish_cmd);
> > +    qemuio_add_command(&zone_reset_cmd);
> >       qemuio_add_command(&truncate_cmd);
> >       qemuio_add_command(&length_cmd);
> >       qemuio_add_command(&info_cmd);
>
> Otherwise looks okay.
>
Thanks!

> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                        Kernel Storage Architect
> hare@suse.de                                      +49 911 74053 688
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: Felix Imend=C3=B6rffer

