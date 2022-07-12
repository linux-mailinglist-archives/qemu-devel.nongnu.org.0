Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC0857124B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:35:11 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9UE-0005AT-Ez
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB9Cy-00021c-UZ; Tue, 12 Jul 2022 02:17:21 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oB9Cx-0001gD-6j; Tue, 12 Jul 2022 02:17:20 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31c89111f23so71234097b3.0; 
 Mon, 11 Jul 2022 23:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oIa5v0Pkx5Tv/6YEvdJ+Y3WkD1VGHg+Y06qQceSDtsg=;
 b=mDLvUueZoVquUZUqjIj9QKrc/m79nuxL6lzBIGmelZOkFy1nrNBuiuxCV+UDgkWoyg
 xRYHAeElal7nDahYzpW3oxux72XDXQbeVRQkF3k1SMfWx+2ynHR+Mm7MScckXiUWtoan
 Ctt8rsUdBT6nxQPMWgizqokMG96yuwDk1H9aUsna2cVaxA8YJGC7gzGPALHRtyPp70G0
 GXfIKnt9l0qtbkvTy0nbrg3eh5GdJaPIpqvRtVP7w7wxvUQrnx4BjTaoWqB2GXbwRxWJ
 qIj9YUitGQgD+n5HgU0+5BTpMa5HIOV3dlFwZUYJwWpxecwOOkigP5ATbJCrD0kVnC/C
 AFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oIa5v0Pkx5Tv/6YEvdJ+Y3WkD1VGHg+Y06qQceSDtsg=;
 b=3XTyFn0Q9uLOSKC56Ic4lLO/dz4pkNQB9O58zqt9gAwjtQbUvquTQN2sN1F+tRoIBH
 TPZs5iQQhQts/z3lUB7mdJTjHZrjYh7VKzQ+01Ui9OWwgwRfpMcGyjdldBWFSe5XauzV
 rV4x/Zz0/H5jJ9sc7yePkhQ1YdkYR/k1IaTZlLppHCldykyjHSwI1v1o3ljj+MEKS8lP
 BOh4ozna7g5FmU2A3PssMuX0leJuVhfdx7/agey/e36jf8OSaKTBXPKqC0fXC74uEccM
 XQ7SprF9pSIeAMus2djnm3czLwRlppzCQywip2jg6dL+6efDKFZIn+MjN+Tt0zs4BAVZ
 262w==
X-Gm-Message-State: AJIora87Jatp6CovFbizapjMp2Rgwx1E+oMdm2VmsrqraaZ6vQjPP8/T
 7Y3RmZLQ7ZrFYpUsS/u9gXM6dYGGvoOcBFUy8CI=
X-Google-Smtp-Source: AGRyM1um/Z84Yd8MilI5bQ6jkdCtd4o4VGEISnRTYIHucHUxM/vv+6mb5s5lhFg716Qwf63aPgnpO6wyOSKAqoPlcQY=
X-Received: by 2002:a0d:ca09:0:b0:31c:86b4:1e71 with SMTP id
 m9-20020a0dca09000000b0031c86b41e71mr23745664ywd.267.1657606637761; Mon, 11
 Jul 2022 23:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-2-faithilikerun@gmail.com>
 <f864ff9b-c8ed-2336-f5a8-d4819475dc0b@suse.de>
In-Reply-To: <f864ff9b-c8ed-2336-f5a8-d4819475dc0b@suse.de>
From: Sam Li <faithilikerun@gmail.com>
Date: Tue, 12 Jul 2022 14:17:21 +0800
Message-ID: <CAAAx-8Lk_aBd0SFSULszrRgA82Ecz3XMPayFQBcC0T=oBx_RaA@mail.gmail.com>
Subject: Re: [RFC v4 1/9] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
To: Hannes Reinecke <hare@suse.de>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=faithilikerun@gmail.com; helo=mail-yw1-x1132.google.com
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

Hannes Reinecke <hare@suse.de> =E4=BA=8E2022=E5=B9=B47=E6=9C=8812=E6=97=A5=
=E5=91=A8=E4=BA=8C 14:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On 7/12/22 04:13, Sam Li wrote:
> > By adding zone management operations in BlockDriver, storage
> > controller emulation can use the new block layer APIs including
> > zone_report and zone_mgmt(open, close, finish, reset).
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > ---
> >   block/block-backend.c            |  41 ++++++
> >   block/coroutines.h               |   5 +
> >   block/file-posix.c               | 236 ++++++++++++++++++++++++++++++=
+
> >   include/block/block-common.h     |  43 +++++-
> >   include/block/block_int-common.h |  20 +++
> >   5 files changed, 344 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index f425b00793..0a05247ae4 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1806,6 +1806,47 @@ int blk_flush(BlockBackend *blk)
> >       return ret;
> >   }
> >
> > +/*
> > + * Send a zone_report command.
> > + * offset can be any number within the zone size. No alignment for off=
set.
> > + * nr_zones represents IN maximum and OUT actual.
> > + */
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t *nr_zones,
> > +                                    BlockZoneDescriptor *zones)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk); /* increase before waiting */
> > +    blk_wait_while_drained(blk);
> > +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, nr_zones, zones=
);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> > +/*
> > + * Send a zone_management command.
> > + * Offset is the start of a zone and len is aligned to zones.
> > + */
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +        int64_t offset, int64_t len)
> > +{
> > +    int ret;
> > +    IO_CODE();
> > +
> > +    blk_inc_in_flight(blk);
> > +    blk_wait_while_drained(blk);
> > +    ret =3D blk_check_byte_request(blk, offset, len);
> > +    if (ret < 0) {
> > +        return ret;
> > +    }
> > +
> > +    ret =3D bdrv_co_zone_mgmt(blk->root->bs, op, offset, len);
> > +    blk_dec_in_flight(blk);
> > +    return ret;
> > +}
> > +
> >   void blk_drain(BlockBackend *blk)
> >   {
> >       BlockDriverState *bs =3D blk_bs(blk);
> > diff --git a/block/coroutines.h b/block/coroutines.h
> > index 830ecaa733..19aa96cc56 100644
> > --- a/block/coroutines.h
> > +++ b/block/coroutines.h
> > @@ -80,6 +80,11 @@ int coroutine_fn
> >   blk_co_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
> >
> >   int coroutine_fn blk_co_do_flush(BlockBackend *blk);
> > +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offset,
> > +                                    int64_t *nr_zones,
> > +                                    BlockZoneDescriptor *zones);
> > +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, enum zone_op op,
> > +                                  int64_t offset, int64_t len);
> >
> >
> >   /*
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 48cd096624..e7523ae2ed 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -67,6 +67,7 @@
> >   #include <sys/param.h>
> >   #include <sys/syscall.h>
> >   #include <sys/vfs.h>
> > +#include <linux/blkzoned.h>
> >   #include <linux/cdrom.h>
> >   #include <linux/fd.h>
> >   #include <linux/fs.h>
> > @@ -216,6 +217,13 @@ typedef struct RawPosixAIOData {
> >               PreallocMode prealloc;
> >               Error **errp;
> >           } truncate;
> > +        struct {
> > +            int64_t *nr_zones;
>
> Why is this a pointer?
> I'd rather use a number here, seeing that it's the number
> of zones in the *zones array ...

I see. The pointer is a little redundant. Will change it.

> But the remainder looks good.

Thanks for reviewing!

