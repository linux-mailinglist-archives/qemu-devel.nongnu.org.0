Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220D5B4C66
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 08:57:52 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXGud-0002cm-Ff
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 02:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXGrG-0008QX-Da; Sun, 11 Sep 2022 02:54:22 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oXGrC-00087U-IP; Sun, 11 Sep 2022 02:54:22 -0400
Received: by mail-ua1-x92c.google.com with SMTP id bu4so1883519uab.6;
 Sat, 10 Sep 2022 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=qPCghuxvZYgq8Sg5ix11g/S8YZOuXjh3CEiaamvCIw4=;
 b=TUOnwsI7ZdK9GtaecFJ5SPkDtj7CVql8+f28ujFJJXRhwGJnB67xqK7XJNuv6NF00H
 e9klJ5EaHz3hHYfLztG8Sp0uu1dPlI8qDR/ebs3wfGsuvV5bWBtlU7kcqwfnIYqE743h
 hyZrHg1AeNH4ylJkSySXO6zjO/wGfWJouNhutPbodyOhlVh1clWU5glRtVUHPKARiyZK
 CpmfezFboTeYuEbSdrvbpOAUaoblkc8eoBh10i8w0bTD3f4QcZ9pNwPqVK3q1rLK0wmt
 oel7SU9v2HjJus/9jSmrmRKdJ+ycCUfBhFtIoulbkttMjEAalYTCqPHs51mFTgb8+94i
 DYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qPCghuxvZYgq8Sg5ix11g/S8YZOuXjh3CEiaamvCIw4=;
 b=2Ivo1lmODL/x7WhewCWK52o9/fGG/34i+PVh7fNMx2IUO2jocO+HztibDzsS5HiydH
 pgkl7y/r5oCWPVnbfFV0ideAjrmAaokBIaXFKWqC97csCgc6ADQQt50YWKDA5qtp16F5
 G00kEw3CcGnL61ofD/StOdHKMzWX70KgTtv/4eNi1OOFlOaibJFTfotARRf0eDI8N7vi
 8Fj7SL+FIoZ2sdA9L1G7ilmgNrmCXz5/Mb5s5u6QkMeJa6s/UrtE8ToU7+ILUHKaaNyz
 LA7ll5u39xTTmvj0jrXg7nyWbREVPGphoZOIMVAV1qgRb/BhQLc8s+GABmYm6AHIuu/e
 TJyg==
X-Gm-Message-State: ACgBeo2EKC8AptGAPXv51TK9s1C6SyOcXU1dgvrYXqR0+QmL0t136YmM
 5bItg6rBEkLs3q9Af00gq68NMBR0bY5zMznm+T8=
X-Google-Smtp-Source: AA6agR44X64HV9Q8bs1HXI/SoS0WLldyrZjtXwuDGj3kQi7FIsafinC79M7naV9+KcIrl3UMuyHDtENfRu1na7BXvA0=
X-Received: by 2002:ab0:373a:0:b0:3b5:5113:4adc with SMTP id
 s26-20020ab0373a000000b003b551134adcmr4465152uag.122.1662879256978; Sat, 10
 Sep 2022 23:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-6-faithilikerun@gmail.com>
 <99fd65d9-a44d-5ff6-f646-9121f1874480@opensource.wdc.com>
In-Reply-To: <99fd65d9-a44d-5ff6-f646-9121f1874480@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Sun, 11 Sep 2022 14:54:29 +0800
Message-ID: <CAAAx-8KXM+PcAAktOaisNeqaq_0K6ntNupa_F-UL_NGg55_C2Q@mail.gmail.com>
Subject: Re: [PATCH v9 5/7] config: add check to block layer
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=faithilikerun@gmail.com; helo=mail-ua1-x92c.google.com
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
=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 13:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2022/09/10 14:27, Sam Li wrote:
> > Putting zoned/non-zoned BlockDrivers on top of each other is not
> > allowed.
> >
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block.c                          | 14 ++++++++++++++
> >  block/file-posix.c               | 14 ++++++++++++++
> >  block/raw-format.c               |  1 +
> >  include/block/block_int-common.h |  5 +++++
> >  4 files changed, 34 insertions(+)
> >
> > diff --git a/block.c b/block.c
> > index bc85f46eed..dad2ed3959 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs,=
 BlockDriverState *child_bs,
> >          return;
> >      }
> >
> > +    /*
> > +     * Non-zoned block drivers do not follow zoned storage constraints
> > +     * (i.e. sequential writes to zones). Refuse mixing zoned and non-=
zoned
> > +     * drivers in a graph.
> > +     */
> > +    if (!parent_bs->drv->supports_zoned_children &&
> > +        child_bs->bl.zoned =3D=3D BLK_Z_HM) {
>
> Shouldn't this be "child_bs->bl.zoned !=3D BLK_Z_NONE" ?

The host-aware model allows zoned storage constraints(sequentially
write) and random write. Is mixing HA and non-zoned drivers allowed?
What's the difference?

>
> > +        error_setg(errp, "Cannot add a %s child to a %s parent",
> > +                   child_bs->bl.zoned =3D=3D BLK_Z_HM ? "zoned" : "non=
-zoned",
> > +                   parent_bs->drv->supports_zoned_children ?
> > +                   "support zoned children" : "not support zoned child=
ren");
> > +        return;
> > +    }
> > +
> >      if (!QLIST_EMPTY(&child_bs->parents)) {
> >          error_setg(errp, "The node %s already has a parent",
> >                     child_bs->node_name);
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 4edfa25d04..354de22860 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -779,6 +779,20 @@ static int raw_open_common(BlockDriverState *bs, Q=
Dict *options,
> >              goto fail;
> >          }
> >      }
> > +#ifdef CONFIG_BLKZONED
> > +    /*
> > +     * The kernel page chache does not reliably work for writes to SWR=
 zones
> > +     * of zoned block device because it can not guarantee the order of=
 writes.
> > +     */
> > +    if (strcmp(bs->drv->format_name, "zoned_host_device") =3D=3D 0) {
> > +        if (!(s->open_flags & O_DIRECT)) {
> > +            error_setg(errp, "driver=3Dzoned_host_device was specified=
, but it "
> > +                             "requires cache.direct=3Don, which was no=
t specified.");
> > +            ret =3D -EINVAL;
>
> This line is not needed. Simply "return -EINVAL;".
>
> > +            return ret; /* No host kernel page cache */
> > +        }
> > +    }
> > +#endif
> >
> >      if (S_ISBLK(st.st_mode)) {
> >  #ifdef BLKDISCARDZEROES
> > diff --git a/block/raw-format.c b/block/raw-format.c
> > index 6b20bd22ef..9441536819 100644
> > --- a/block/raw-format.c
> > +++ b/block/raw-format.c
> > @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, Bd=
rvChild *c,
> >  BlockDriver bdrv_raw =3D {
> >      .format_name          =3D "raw",
> >      .instance_size        =3D sizeof(BDRVRawState),
> > +    .supports_zoned_children =3D true,
> >      .bdrv_probe           =3D &raw_probe,
> >      .bdrv_reopen_prepare  =3D &raw_reopen_prepare,
> >      .bdrv_reopen_commit   =3D &raw_reopen_commit,
> > diff --git a/include/block/block_int-common.h b/include/block/block_int=
-common.h
> > index 078ddd7e67..043aa161a0 100644
> > --- a/include/block/block_int-common.h
> > +++ b/include/block/block_int-common.h
> > @@ -127,6 +127,11 @@ struct BlockDriver {
> >       */
> >      bool is_format;
> >
> > +    /*
> > +     * Set to true if the BlockDriver supports zoned children.
> > +     */
> > +    bool supports_zoned_children;
> > +
> >      /*
> >       * Drivers not implementing bdrv_parse_filename nor bdrv_open shou=
ld have
> >       * this field set to true, except ones that are defined only by th=
eir
>
> --
> Damien Le Moal
> Western Digital Research
>

