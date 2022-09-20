Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4D5BEB55
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 18:49:48 +0200 (CEST)
Received: from localhost ([::1]:51416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oagRP-0001Br-5Q
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 12:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oadBm-0006Vd-70; Tue, 20 Sep 2022 09:21:27 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oadBj-0002X1-CE; Tue, 20 Sep 2022 09:21:24 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id a129so3118989vsc.0;
 Tue, 20 Sep 2022 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=sHmP507Dk4FIh+DPbpEvgNxu1Vt0L+E3+2vt+iQzcA8=;
 b=ZAK7lJjnNVmODvcLJ16FbyvJSmbiiA1Vhxs5KGpKDIGVuQ/FC+8AT8nUqhiZhfx9DG
 75ULBjNNsorUh3wbhK6LZwETXE7g8Cws4o+4MA7w/4toD05305NDhKwPRKetx4MQxq72
 pX0/QSoSPNxfhtAOr1IbVVFYGEJ63BnOCMFSDmGdiWRyk9jwNjJgJyAeuq+F7GhrahdY
 MFW49Rb/1TsFHhCanDnTMiUlf7u1IUMJ7OOiz184Q0ozKevCYv+YtmShmpBczo/LbfTm
 v5TA7TTZ1qmClT2pRx1xgzwplYbM0V4wh/XvigCuSBv05C+DAm97Oqzjd+c86NTlen3v
 LtKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sHmP507Dk4FIh+DPbpEvgNxu1Vt0L+E3+2vt+iQzcA8=;
 b=1W53AiGkd6GJb53KRVvGw4fdna/XlNRtMfWvmPjJ+lF47z08INe5Yt+TMjM24e6FIt
 dZ6QBEPt0YnhFEG2yWuRIfE3z363u+7bDsc1A9svJknRsYYp9SodmiWXTXw5cbD0a2CT
 taropVwE/OZqT2mAyflDwJrjAsidai8BSAeTSw4rJE+TI6N/+iYiuzTtuubBRq3glWTS
 43L0BGoiNzFdQWBzlXaOyC16QDCvcMWxIgaThcVrFItzYpIh1RbA7Qnfp41sFyrPnEZx
 77g0QN510JYnX9UlBlYWukQrzEPQR2AdBuVWkLdffvvwWIbRoDy6Kp1qCnioiEwtp5dM
 QpAw==
X-Gm-Message-State: ACrzQf25qUaDXbLx7AqcbBygqIQjMkfXUCpkIy077y1Vca+9UyncE9Hn
 uugezTKdE/jn3sQbdHQjdshhId1YracD+ZtDoWA=
X-Google-Smtp-Source: AMsMyM5NJzyqkWylgqnvUCiQYEsweSsEJ/Kaw1fORn/YGM+7qJyWaOB5IGVD5wmy70hnS7RaoT2BOl83VPJoKxO4MIo=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr8229086vsh.54.1663680078696; Tue, 20
 Sep 2022 06:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com> <Yyl/AC9X7uHyeTCu@apples>
In-Reply-To: <Yyl/AC9X7uHyeTCu@apples>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 20 Sep 2022 21:21:31 +0800
Message-ID: <CAAAx-8JZWz_oQM3Bb7Seod9cT0vMXec40YsyA9Fmd3+5915aOQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
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

Klaus Jensen <its@irrelevant.dk> =E4=BA=8E2022=E5=B9=B49=E6=9C=8820=E6=97=
=A5=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sep 10 13:27, Sam Li wrote:
> > Add a new zoned_host_device BlockDriver. The zoned_host_device option
> > accepts only zoned host block devices. By adding zone management
> > operations in this new BlockDriver, users can use the new block
> > layer APIs including Report Zone and four zone management operations
> > (open, close, finish, reset).
> >
> > Qemu-io uses the new APIs to perform zoned storage commands of the devi=
ce:
> > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > zone_finish(zf).
> >
> > For example, to test zone_report, use following command:
> > $ ./build/qemu-io --image-opts -n driver=3Dzoned_host_device, filename=
=3D/dev/nullb0
> > -c "zrp offset nr_zones"
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  block/block-backend.c             | 145 ++++++++++++++
> >  block/file-posix.c                | 323 +++++++++++++++++++++++++++++-
> >  block/io.c                        |  41 ++++
> >  include/block/block-io.h          |   7 +
> >  include/block/block_int-common.h  |  21 ++
> >  include/block/raw-aio.h           |   6 +-
> >  include/sysemu/block-backend-io.h |  17 ++
> >  meson.build                       |   1 +
> >  qapi/block-core.json              |   8 +-
> >  qemu-io-cmds.c                    | 143 +++++++++++++
> >  10 files changed, 708 insertions(+), 4 deletions(-)
> >
> > +/*
> > + * zone management operations - Execute an operation on a zone
> > + */
> > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZo=
neOp op,
> > +        int64_t offset, int64_t len) {
> > +#if defined(CONFIG_BLKZONED)
> > +    BDRVRawState *s =3D bs->opaque;
> > +    RawPosixAIOData acb;
> > +    int64_t zone_sector, zone_sector_mask;
> > +    const char *zone_op_name;
> > +    unsigned long zone_op;
> > +    bool is_all =3D false;
> > +
> > +    zone_sector =3D bs->bl.zone_sectors;
> > +    zone_sector_mask =3D zone_sector - 1;
> > +    if (offset & zone_sector_mask) {
> > +        error_report("sector offset %" PRId64 " is not aligned to zone=
 size "
> > +                     "%" PRId64 "", offset, zone_sector);
> > +        return -EINVAL;
> > +    }
> > +
> > +    if (len & zone_sector_mask) {
> > +        error_report("number of sectors %" PRId64 " is not aligned to =
zone size"
> > +                      " %" PRId64 "", len, zone_sector);
> > +        return -EINVAL;
> > +    }
>
> These checks impose a power-of-two constraint on the zone size. Can they
> be changed to divisions to lift that constraint? I don't see anything in
> this patch set that relies on power of two zone sizes.

Yes, it can be changed when the kernel block layer has non-power-of-2
zone sizes support. For now, Dmitry's work on zoned device support on
the kernel side put the constraint on zone sectors to be po2. The
checks here follow this constraint.

Dmitry's patches can be found here:
https://lore.kernel.org/linux-block/20220919022921.946344-1-dmitry.fomichev=
@wdc.com/T/#m9b0b3c8220de1307e53235d1a73dab1e3a10f62b


Sam

