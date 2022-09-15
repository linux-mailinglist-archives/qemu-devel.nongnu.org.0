Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9FE5B988B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 12:11:15 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYlpy-0004kY-QW
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 06:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oYllO-0000af-5B; Thu, 15 Sep 2022 06:06:30 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oYllM-0001ew-BJ; Thu, 15 Sep 2022 06:06:29 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id s12so2102996vkn.11;
 Thu, 15 Sep 2022 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Hy3NxFpzcShYaewzsiWWH2YXi7bJ4X1l7RDBzrPiHv8=;
 b=PevTZyabkQ4lUu46hvXTsdAJ42Bxj13uUFNAK7L5pIFJginEQ3q/i9KHreQcue2zRR
 pX6gi4C8kRRA08DJO3tXfUCbUWLzL0hck+hVeE+JoFMaBo3sPB/a3BQR9ol0sm8FO2Tx
 yXTfmb2mz8AdxkQl9J2+G3M1CejyiktrD9jyXRg+xVJbFkZ7yq/WaqEKHfQ8XWBqbZsd
 4XpVTuaug167Jq3dzKZ14r/bAT320oJ6mYwFC+K+9iC+xIe0PB2TR7Oe/F1+j7OUF28l
 aBGjrzkgueGClACfD/pEDeqTN8FhRI0duX6fLusQ8Jqgs9bOyMymzg6Wi4ZIaIGQ5O7M
 rVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Hy3NxFpzcShYaewzsiWWH2YXi7bJ4X1l7RDBzrPiHv8=;
 b=2hmUNrFA7FDtD26tBCRriA35qqFZ9p5eQwXmwvNqXhE4y2CVBXytJyYyihMddXOKi9
 bmjGKVvpXw9a/FoMF1W8zYiMhqthJHdCNjXLj8FizDZGiXeF2J815eTxVY8+UVgqS/3q
 hk//7bNhc1fKbrcsyDGaFjnNMKoACQRJ1Xx1YHvEJsb4c30FkCgnQTfpPVQmiiuk6ZNT
 dw1cLEStZw5sPgkzIOfxX6JTc3K5vnOQmxOe0ldy4cNe9WBBbvE+7kW99b60FhYAZ++G
 7H1GdEz9T200f5GX4/JgoI0dZ4w4QSZmbTqDBL+gAn5A1YuYRemZUkvZdUkJtEwSHw5t
 lPeQ==
X-Gm-Message-State: ACrzQf0v5kXvtuzj9wuoYmjHMqlxzyLXDUkMxrfZ8043eLRvKcl/1BqK
 /ptkBCGIGDWgi2PwwNZaa43Xlr498TpwcWhUiH4=
X-Google-Smtp-Source: AMsMyM7sa6GGKR5lwUQ11IFUwpJW2r4+ea4xex6PM3JMZhcauKbZFwlP6ZgMkH/H/i9WecOR5uqa+iiuF8y8r7Qe6sQ=
X-Received: by 2002:a1f:e0c5:0:b0:3a2:f287:87e2 with SMTP id
 x188-20020a1fe0c5000000b003a2f28787e2mr227276vkg.38.1663236386480; Thu, 15
 Sep 2022 03:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
 <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
In-Reply-To: <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Thu, 15 Sep 2022 18:06:38 +0800
Message-ID: <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=faithilikerun@gmail.com; helo=mail-vk1-xa2d.google.com
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

Eric Blake <eblake@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=97=A5=
=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
> > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > ---
> >  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/include/block/block-common.h b/include/block/block-common.=
h
> > index fdb7306e78..36bd0e480e 100644
> > --- a/include/block/block-common.h
> > +++ b/include/block/block-common.h
> > @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
> >  typedef struct BdrvChild BdrvChild;
> >  typedef struct BdrvChildClass BdrvChildClass;
> >
> > +typedef enum BlockZoneOp {
> > +    BLK_ZO_OPEN,
> > +    BLK_ZO_CLOSE,
> > +    BLK_ZO_FINISH,
> > +    BLK_ZO_RESET,
> > +} BlockZoneOp;
> > +
> > +typedef enum BlockZoneModel {
> > +    BLK_Z_NONE =3D 0x0, /* Regular block device */
> > +    BLK_Z_HM =3D 0x1, /* Host-managed zoned block device */
> > +    BLK_Z_HA =3D 0x2, /* Host-aware zoned block device */
> > +} BlockZoneModel;
> > +
> > +typedef enum BlockZoneCondition {
> > +    BLK_ZS_NOT_WP =3D 0x0,
> > +    BLK_ZS_EMPTY =3D 0x1,
> > +    BLK_ZS_IOPEN =3D 0x2,
> > +    BLK_ZS_EOPEN =3D 0x3,
> > +    BLK_ZS_CLOSED =3D 0x4,
> > +    BLK_ZS_RDONLY =3D 0xD,
> > +    BLK_ZS_FULL =3D 0xE,
> > +    BLK_ZS_OFFLINE =3D 0xF,
> > +} BlockZoneCondition;
> > +
> > +typedef enum BlockZoneType {
> > +    BLK_ZT_CONV =3D 0x1, /* Conventional random writes supported */
> > +    BLK_ZT_SWR =3D 0x2, /* Sequential writes required */
> > +    BLK_ZT_SWP =3D 0x3, /* Sequential writes preferred */
> > +} BlockZoneType;
> > +
> > +/*
> > + * Zone descriptor data structure.
> > + * Provides information on a zone with all position and size values in=
 bytes.
>
> I'm glad that you chose bytes here for use in qemu.  But since the
> kernel struct blk_zone uses sectors instead of bytes, is it worth
> adding a sentence that we intentionally use bytes here, different from
> Linux, to make it easier for reviewers to realize that scaling when
> translating between qemu and kernel is necessary?

Sorry about the unit mistake. The zone information is in sectors which
is the same as kernel struct blk_zone. I think adding a sentence to
inform the sector unit makes it clear what the zone descriptor is.

>
> > + */
> > +typedef struct BlockZoneDescriptor {
> > +    uint64_t start;
> > +    uint64_t length;
> > +    uint64_t cap;
> > +    uint64_t wp;
> > +    BlockZoneType type;
> > +    BlockZoneCondition cond;
> > +} BlockZoneDescriptor;
> > +
> >  typedef struct BlockDriverInfo {
> >      /* in bytes, 0 if irrelevant */
> >      int cluster_size;
> > --
> > 2.37.3
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

