Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D395B4C87
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 09:37:05 +0200 (CEST)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXHWZ-00064t-V1
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 03:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXHPs-0004Gc-5h; Sun, 11 Sep 2022 03:30:08 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:42877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXHPq-0004Hv-Fx; Sun, 11 Sep 2022 03:30:07 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id i1so5934334vsc.9;
 Sun, 11 Sep 2022 00:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=aGsUAm5CkTcV2cnIs5F+4OEranOLO50dnIg5fe2Tso0=;
 b=JCWUOzcwCWulHH1IFfCPdH/8d98A+xJ6Qjv4+iU+3idAWM8SM/VPRpSyuG2nvnK9dO
 KzcqtvHEvcAr8oW/SeZAkO7qXGNCx8ihOeT5S9BbcM9ZBJ+knW3F8P9WwVLLzzn1fno5
 mDXCF+a7b60Y+yvtZ1dUsq7m8+I8oLYNFFdnAoiQA4RFNIp13kRmn3QYxStGOcJSr6zt
 3eyCOg/NSQ0238PNROqwBzM+xtkzNHEtMzG3g0fPXydw0q2RvJo9wY9ad82eDAEOTOhn
 bFaEM6281uUN4kUgCWs0/WTY9YxWbFS9yk0wfS/gD9TVDs2A9lqs5LQO+5yrtB4G0fa9
 dEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aGsUAm5CkTcV2cnIs5F+4OEranOLO50dnIg5fe2Tso0=;
 b=gOnXfPymyPGJGbHH1Mi/qhmFlaqiYokH4HOcOWwWUWvbtxMMnJAUnUzaD4UzysK+C6
 NO/Y3gEJPTSOX2ki5PhcGLkX+FGsQUcRILheLHSJADaXylWMU2yZZ/2Lu34HGkg6EdUj
 HUUMI4+NSKpzdeblil2vdpFstXHtyx03003mrwq+llg48itutUrkx8gsvoVYZc+S4SIC
 BD1c2QhmSQ7XSgrog0feyp/NfGC1chLS4wYkSlDOfxE8vlFhqb8Fb9P6U5xFGM2KUZ4w
 vmuYOB32+B1kXfU/k2v9911bEJXDTM8/R+isrLmOo/CEkMw9q1YkbtO/wh1IDiutXixc
 niLA==
X-Gm-Message-State: ACgBeo1iwxOP1Z5F8UyiFpqg6MrfA7Ay3GK7kPbIXmXTNX/jxkFwNnK1
 4udwCO6IAGLNAUtck2hFTGGjdTTDIbzWNvi1wHY=
X-Google-Smtp-Source: AA6agR44PkY1dmGd5O9BdJGBg7Leyk88Tut1qHm7qEwHcmv6POlvIWhCGyBivahYgYpf2sysmGPI+y0QGW/w9D7agi0=
X-Received: by 2002:a05:6102:390f:b0:398:2d10:262d with SMTP id
 e15-20020a056102390f00b003982d10262dmr6018941vsu.54.1662881404791; Sun, 11
 Sep 2022 00:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com>
 <1b6b36ef-0a2b-957e-843b-3c3bb2edc320@opensource.wdc.com>
 <CAAAx-8LvWtTGs0cJaQ_LQi9S5fhaLx827E_xfLs1VQbEp8v_Gw@mail.gmail.com>
 <27ff94db-fa64-a4d6-00fc-fb289a386337@opensource.wdc.com>
In-Reply-To: <27ff94db-fa64-a4d6-00fc-fb289a386337@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 11 Sep 2022 15:30:17 +0800
Message-ID: <CAAAx-8LrBS3+Vtab-2UiDfjzTo_pAeK9gCd_NUx2+LuQT-3EwA@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe2f.google.com
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

Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B49=
=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 14:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/09/11 15:33, Sam Li wrote:
> > Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=
=B49=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 13:31=E5=86=99=E9=81=93=EF=BC=9A
> [...]
> >>> +/*
> >>> + * zone management operations - Execute an operation on a zone
> >>> + */
> >>> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, Block=
ZoneOp op,
> >>> +        int64_t offset, int64_t len) {
> >>> +#if defined(CONFIG_BLKZONED)
> >>> +    BDRVRawState *s =3D bs->opaque;
> >>> +    RawPosixAIOData acb;
> >>> +    int64_t zone_sector, zone_sector_mask;
> >>> +    const char *zone_op_name;
> >>> +    unsigned long zone_op;
> >>> +    bool is_all =3D false;
> >>> +
> >>> +    zone_sector =3D bs->bl.zone_sectors;
> >>> +    zone_sector_mask =3D zone_sector - 1;
> >>> +    if (offset & zone_sector_mask) {
> >>> +        error_report("sector offset %" PRId64 " is not aligned to zo=
ne size "
> >>> +                     "%" PRId64 "", offset, zone_sector);
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    if (len & zone_sector_mask) {
> >>
> >> Linux allows SMR drives to have a smaller last zone. So this needs to =
be
> >> accounted for here. Otherwise, a zone operation that includes the last=
 smaller
> >> zone would always fail. Something like this would work:
> >>
> >>         if (((offset + len) < capacity &&
> >>             len & zone_sector_mask) ||
> >>             offset + len > capacity) {
> >>
> >
> > I see. I think the offset can be removed, like:
> > if (((len < capacity && len & zone_sector_mask) || len > capacity) {
> > Then if we use the previous zone's len for the last smaller zone, it
> > will be greater than its capacity.
>
> Nope, you cannot remove the offset since the zone operation may be for th=
at last
> zone only, that is, offset =3D=3D last zone start and len =3D=3D last zon=
e smaller size.
> In that case, len is alwats smaller than capacity.

Ok, I was mixing opening one zone with opening several zones.

>
> >
> > I will also include "opening the last zone" as a test case later.
>
> Note that you can create such smaller last zone on the host with null_blk=
 by
> specifying a device capacity that is *not* a multiple of the zone size.
>
> >
> >>> +        error_report("number of sectors %" PRId64 " is not aligned t=
o zone size"
> >>> +                      " %" PRId64 "", len, zone_sector);
> >>> +        return -EINVAL;
> >>> +    }
> >>> +
> >>> +    switch (op) {
> >>> +    case BLK_ZO_OPEN:
> >>> +        zone_op_name =3D "BLKOPENZONE";
> >>> +        zone_op =3D BLKOPENZONE;
> >>> +        break;
> >>> +    case BLK_ZO_CLOSE:
> >>> +        zone_op_name =3D "BLKCLOSEZONE";
> >>> +        zone_op =3D BLKCLOSEZONE;
> >>> +        break;
> >>> +    case BLK_ZO_FINISH:
> >>> +        zone_op_name =3D "BLKFINISHZONE";
> >>> +        zone_op =3D BLKFINISHZONE;
> >>> +        break;
> >>> +    case BLK_ZO_RESET:
> >>> +        zone_op_name =3D "BLKRESETZONE";
> >>> +        zone_op =3D BLKRESETZONE;
> >>> +        break;
> >>> +    default:
> >>> +        g_assert_not_reached();
> >>> +    }
> >>> +
> >>> +    acb =3D (RawPosixAIOData) {
> >>> +        .bs             =3D bs,
> >>> +        .aio_fildes     =3D s->fd,
> >>> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
> >>> +        .aio_offset     =3D offset,
> >>> +        .aio_nbytes     =3D len,
> >>> +        .zone_mgmt  =3D {
> >>> +                .zone_op =3D zone_op,
> >>> +                .zone_op_name =3D zone_op_name,
> >>> +                .all =3D is_all,
> >>> +        },
> >>> +    };
> >>> +
> >>> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
> >>> +#else
> >>> +    return -ENOTSUP;
> >>> +#endif
> >>> +}
>
> --
> Damien Le Moal
> Western Digital Research
>

