Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E35BC0D0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 02:54:08 +0200 (CEST)
Received: from localhost ([::1]:58566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa52z-0007ZY-Tt
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 20:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oa4zo-00064T-9t; Sun, 18 Sep 2022 20:50:48 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oa4zm-000873-Do; Sun, 18 Sep 2022 20:50:47 -0400
Received: by mail-ua1-x931.google.com with SMTP id y20so6112646uao.8;
 Sun, 18 Sep 2022 17:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=fLa2bhzKj4yLgEBoF/q1FGBYpn+9FtcTe8M3S48e6GM=;
 b=PBeNGkmiML487O0igANBVM5BthUWU2JXZtgmZ2oN2LP+tp2Tc41uaekjdrje/Pds68
 OYvFQHKG9fuBZiuBdPTdzuUja0Vsiz6ReNM6OSf5SCRRXCOEwQQOY4faGwgGdMriEptt
 LiLxsER4gX9RBs0i7Z2pxQt+UjWd1YxIDEUr9GC0aej+SMXQmpQN5B2GTmuVLOkW/ebM
 Es2VT4TB4xnUmHqfSw7M14g0lpZXyLoJTGp7XsM+IB+VstOoiJ0Hj2OOtJbD1BRi2fFm
 ZYyc5XJRsyKreTFkpymxJGX1cayZRxxtyLT9KD/GLlA4SX2m5w1Li2YIa/jgTvGSYD6z
 K55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fLa2bhzKj4yLgEBoF/q1FGBYpn+9FtcTe8M3S48e6GM=;
 b=gtXs3UgOFoL7kpDgrw5oDquveY0nJxdGHy+ounNMdWWMux9sHfFKZD/WvfmN9JGpsE
 hNOXyVSO0fDKUxM+icerxtzSQlu9AdeNML46unqV3DS8/T7TKv/W5Xy53lNCD3HahYjK
 4K+FfdNYZo5ef5bxYdyfjlPH6jLR8LVtW23laZrExfMfuglYImkO0sDW9y1EgjqhvUgC
 +tn9O6ujfRbmL74AiEq+1lpmbPbiPZw9S/aA1sKTfUwMWGasgwHjg4n6qihBTDF3vIJF
 OshCZpJDJZkmA1psw+DstVEQ8/dqSvKF6U7hh7wVnNU+rVXrJ7sZl5N+pmj7D5IOKOKF
 njlg==
X-Gm-Message-State: ACrzQf17FBqemTDOd7qhEfNUC2Ik6fN234IfmIni1A7SF0rihhcL/kln
 3/SztaCmfbDVXtMDJvEkEYnpMLhJwCgNFFDeKrI=
X-Google-Smtp-Source: AMsMyM4FmjUkPBImkYmfKUnvAAVCGGrZGl66sDs3Dfkc8rvWD8IuXwoUbn+0oaGv2RCCUuM6EdVt/v9uzLqlX66vRU8=
X-Received: by 2002:ab0:474e:0:b0:3b0:5e66:bf47 with SMTP id
 i14-20020ab0474e000000b003b05e66bf47mr5218013uac.4.1663548644596; Sun, 18 Sep
 2022 17:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
 <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
 <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
 <YySTY9Y+/6IplNXm@fedora>
In-Reply-To: <YySTY9Y+/6IplNXm@fedora>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 19 Sep 2022 08:50:57 +0800
Message-ID: <CAAAx-8+Q5r974Hm51-5cL0qTp59mdHmLfptokLvbmGPKk7iz1w@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 qemu block <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=faithilikerun@gmail.com; helo=mail-ua1-x931.google.com
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

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8818=E6=
=97=A5=E5=91=A8=E6=97=A5 04:17=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Sep 15, 2022 at 06:06:38PM +0800, Sam Li wrote:
> > Eric Blake <eblake@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
> > > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > > > ---
> > > >  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 43 insertions(+)
> > > >
> > > > diff --git a/include/block/block-common.h b/include/block/block-com=
mon.h
> > > > index fdb7306e78..36bd0e480e 100644
> > > > --- a/include/block/block-common.h
> > > > +++ b/include/block/block-common.h
> > > > @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
> > > >  typedef struct BdrvChild BdrvChild;
> > > >  typedef struct BdrvChildClass BdrvChildClass;
> > > >
> > > > +typedef enum BlockZoneOp {
> > > > +    BLK_ZO_OPEN,
> > > > +    BLK_ZO_CLOSE,
> > > > +    BLK_ZO_FINISH,
> > > > +    BLK_ZO_RESET,
> > > > +} BlockZoneOp;
> > > > +
> > > > +typedef enum BlockZoneModel {
> > > > +    BLK_Z_NONE =3D 0x0, /* Regular block device */
> > > > +    BLK_Z_HM =3D 0x1, /* Host-managed zoned block device */
> > > > +    BLK_Z_HA =3D 0x2, /* Host-aware zoned block device */
> > > > +} BlockZoneModel;
> > > > +
> > > > +typedef enum BlockZoneCondition {
> > > > +    BLK_ZS_NOT_WP =3D 0x0,
> > > > +    BLK_ZS_EMPTY =3D 0x1,
> > > > +    BLK_ZS_IOPEN =3D 0x2,
> > > > +    BLK_ZS_EOPEN =3D 0x3,
> > > > +    BLK_ZS_CLOSED =3D 0x4,
> > > > +    BLK_ZS_RDONLY =3D 0xD,
> > > > +    BLK_ZS_FULL =3D 0xE,
> > > > +    BLK_ZS_OFFLINE =3D 0xF,
> > > > +} BlockZoneCondition;
> > > > +
> > > > +typedef enum BlockZoneType {
> > > > +    BLK_ZT_CONV =3D 0x1, /* Conventional random writes supported *=
/
> > > > +    BLK_ZT_SWR =3D 0x2, /* Sequential writes required */
> > > > +    BLK_ZT_SWP =3D 0x3, /* Sequential writes preferred */
> > > > +} BlockZoneType;
> > > > +
> > > > +/*
> > > > + * Zone descriptor data structure.
> > > > + * Provides information on a zone with all position and size value=
s in bytes.
> > >
> > > I'm glad that you chose bytes here for use in qemu.  But since the
> > > kernel struct blk_zone uses sectors instead of bytes, is it worth
> > > adding a sentence that we intentionally use bytes here, different fro=
m
> > > Linux, to make it easier for reviewers to realize that scaling when
> > > translating between qemu and kernel is necessary?
> >
> > Sorry about the unit mistake. The zone information is in sectors which
> > is the same as kernel struct blk_zone. I think adding a sentence to
> > inform the sector unit makes it clear what the zone descriptor is.
>
> I'd make the units bytes for consistency with the rest of the QEMU block
> layer. For example, the MapEntry structure that "qemu-img map" reports
> has names with similar fields and they are in bytes:
>
>   struct MapEntry {
>       int64_t start;
>       int64_t length;
>

I think the zone descriptor uses sector units because ioctl() will
report zones in sector units. Making blk_zone.offset =3D
zone_descriptor.offset is more convenient than using byte units where
it needs make conversions twice(sector -> byte -> sector in zone
descriptors and offset argument in bdrv_co_zone_report). The MapEntry
uses byte units because lseek() in bdrv_co_block_status suggests the
file offset is set to bytes and I think it may be why the rest of the
block layer uses bytes(not sure).

I do not object to using bytes here but it would require some
compromises. If I was wrong about anything, please let me know.


Sam

