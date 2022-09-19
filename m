Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E545BC44E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 10:29:17 +0200 (CEST)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaC9T-0006b6-Da
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 04:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oaBnR-0008SO-EB; Mon, 19 Sep 2022 04:06:29 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oaBnP-0007P4-8z; Mon, 19 Sep 2022 04:06:29 -0400
Received: by mail-vs1-xe30.google.com with SMTP id j17so21673449vsp.5;
 Mon, 19 Sep 2022 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=nV4dpzpz3xW4iicXqXBHZ36GeLc1gCge1wY3PP3KArU=;
 b=aFv3dVz6vO/RnNSVU6/ZVqsgCxkwWwZV22Lpy9TtnEZdPIfX9mLAUtrSJir66v4NqV
 Elk4HV18TfFFxhG2sjvTFRHJ2aSzMKu93UjUhO7A+Wy22WYqfBgHc4PAWJx/e/YXyatm
 4/3zm4KWjzEq4BB5yF7Y5yOxlCiyjfbNracwwiVtu+njI0BP6NGlo3TH+leUx0tFg5vv
 cu1NX3u+77mEWhe8TZ76CWtEWXYxHpIp8cDM6gTJ2FCoqL1B67iOnxxg8OxeKG3boFG4
 jgRcYXuiSi5+GuqLYRJ07jkkXpdin/XdisNvjBv218cS9AhtVCmxtFZKzOoVZRtfICor
 wioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nV4dpzpz3xW4iicXqXBHZ36GeLc1gCge1wY3PP3KArU=;
 b=S8L/z6n8zuKewjbPHckNOKBXho08tMnelwZuETqVTGeiMMgJm0KDu9RYCXT6gz1/iy
 ZUBXa0ktqfp53eWgRf3Urj3DW2o2Sl6XEdOIzXJmsdUaH+BJpQ+N5N1bbpOlLyMUz+a+
 58kAK2ZLe9FLIr7ahhwi67tKZKGZ9ZzOdlxAeHRj1dx4ws1deYQ4IPFIGwoQ/OdTtkaD
 PJhB20RFvNX2y3azYC+GjFFiIqmeWaU4A39thWMMd+CtrfwUWMJ4GY41gWO9Sft4TOTZ
 zlJ7p9wROaYDpADI/s8pSX4to895wcy4n9TxUbEKGTNA3+91h06MQmAqd+uMikD1/pZZ
 NtKg==
X-Gm-Message-State: ACrzQf1snIcAb+DDVHZI/9hwQG4rnqae/Auo1KazWvvffQaBiqEuCWOq
 JItZX2i+UxZzZHh9Bqp2zvnEuWp4rMGhCH0KZ+U=
X-Google-Smtp-Source: AMsMyM5BKxZHLTQIR/Jb54VPV2yXnG6N0HP+0B11oJKYYt19vNLPkgf6MyLdtyV38fi/VV2rIhLXQQyn5baZ52oy230=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr5719749vsh.54.1663574783242; Mon, 19
 Sep 2022 01:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
 <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
 <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
 <YySTY9Y+/6IplNXm@fedora>
 <CAAAx-8+Q5r974Hm51-5cL0qTp59mdHmLfptokLvbmGPKk7iz1w@mail.gmail.com>
 <c29ee6e2-4646-6db9-50a1-c441961a3d00@opensource.wdc.com>
In-Reply-To: <c29ee6e2-4646-6db9-50a1-c441961a3d00@opensource.wdc.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 19 Sep 2022 16:06:12 +0800
Message-ID: <CAAAx-8KOQRVdgmHoj_CFvSg2husA=4uiHNPo8aKNh_pi108QwQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Eric Blake <eblake@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 Hannes Reinecke <hare@suse.de>, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000336a605e9033099"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=faithilikerun@gmail.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000000336a605e9033099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Damien Le Moal <damien.lemoal@opensource.wdc.com>=E4=BA=8E2022=E5=B9=B49=E6=
=9C=8819=E6=97=A5 =E5=91=A8=E4=B8=8016:04=E5=86=99=E9=81=93=EF=BC=9A

> On 9/19/22 09:50, Sam Li wrote:
> > Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=881=
8=E6=97=A5=E5=91=A8=E6=97=A5 04:17=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Thu, Sep 15, 2022 at 06:06:38PM +0800, Sam Li wrote:
> >>> Eric Blake <eblake@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=
=97=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
> >>>>
> >>>> On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
> >>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> >>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>>>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> >>>>> ---
> >>>>>  include/block/block-common.h | 43
> ++++++++++++++++++++++++++++++++++++
> >>>>>  1 file changed, 43 insertions(+)
> >>>>>
> >>>>> diff --git a/include/block/block-common.h
> b/include/block/block-common.h
> >>>>> index fdb7306e78..36bd0e480e 100644
> >>>>> --- a/include/block/block-common.h
> >>>>> +++ b/include/block/block-common.h
> >>>>> @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
> >>>>>  typedef struct BdrvChild BdrvChild;
> >>>>>  typedef struct BdrvChildClass BdrvChildClass;
> >>>>>
> >>>>> +typedef enum BlockZoneOp {
> >>>>> +    BLK_ZO_OPEN,
> >>>>> +    BLK_ZO_CLOSE,
> >>>>> +    BLK_ZO_FINISH,
> >>>>> +    BLK_ZO_RESET,
> >>>>> +} BlockZoneOp;
> >>>>> +
> >>>>> +typedef enum BlockZoneModel {
> >>>>> +    BLK_Z_NONE =3D 0x0, /* Regular block device */
> >>>>> +    BLK_Z_HM =3D 0x1, /* Host-managed zoned block device */
> >>>>> +    BLK_Z_HA =3D 0x2, /* Host-aware zoned block device */
> >>>>> +} BlockZoneModel;
> >>>>> +
> >>>>> +typedef enum BlockZoneCondition {
> >>>>> +    BLK_ZS_NOT_WP =3D 0x0,
> >>>>> +    BLK_ZS_EMPTY =3D 0x1,
> >>>>> +    BLK_ZS_IOPEN =3D 0x2,
> >>>>> +    BLK_ZS_EOPEN =3D 0x3,
> >>>>> +    BLK_ZS_CLOSED =3D 0x4,
> >>>>> +    BLK_ZS_RDONLY =3D 0xD,
> >>>>> +    BLK_ZS_FULL =3D 0xE,
> >>>>> +    BLK_ZS_OFFLINE =3D 0xF,
> >>>>> +} BlockZoneCondition;
> >>>>> +
> >>>>> +typedef enum BlockZoneType {
> >>>>> +    BLK_ZT_CONV =3D 0x1, /* Conventional random writes supported *=
/
> >>>>> +    BLK_ZT_SWR =3D 0x2, /* Sequential writes required */
> >>>>> +    BLK_ZT_SWP =3D 0x3, /* Sequential writes preferred */
> >>>>> +} BlockZoneType;
> >>>>> +
> >>>>> +/*
> >>>>> + * Zone descriptor data structure.
> >>>>> + * Provides information on a zone with all position and size value=
s
> in bytes.
> >>>>
> >>>> I'm glad that you chose bytes here for use in qemu.  But since the
> >>>> kernel struct blk_zone uses sectors instead of bytes, is it worth
> >>>> adding a sentence that we intentionally use bytes here, different fr=
om
> >>>> Linux, to make it easier for reviewers to realize that scaling when
> >>>> translating between qemu and kernel is necessary?
> >>>
> >>> Sorry about the unit mistake. The zone information is in sectors whic=
h
> >>> is the same as kernel struct blk_zone. I think adding a sentence to
> >>> inform the sector unit makes it clear what the zone descriptor is.
> >>
> >> I'd make the units bytes for consistency with the rest of the QEMU blo=
ck
> >> layer. For example, the MapEntry structure that "qemu-img map" reports
> >> has names with similar fields and they are in bytes:
> >>
> >>   struct MapEntry {
> >>       int64_t start;
> >>       int64_t length;
> >>
> >
> > I think the zone descriptor uses sector units because ioctl() will
> > report zones in sector units. Making blk_zone.offset =3D
> > zone_descriptor.offset is more convenient than using byte units where
> > it needs make conversions twice(sector -> byte -> sector in zone
> > descriptors and offset argument in bdrv_co_zone_report). The MapEntry
> > uses byte units because lseek() in bdrv_co_block_status suggests the
> > file offset is set to bytes and I think it may be why the rest of the
> > block layer uses bytes(not sure).
> >
> > I do not object to using bytes here but it would require some
> > compromises. If I was wrong about anything, please let me know.
>
> The conversion can be done using 9-bits left and right shifts, which are
> cheap to do. I think it is important to be consistent with qemu block API=
,
> so using for the API bytes is preferred. That will avoid confusions.


Ok, will change it. Thanks!


>
> >
> >
> > Sam
>
> --
> Damien Le Moal
> Western Digital Research
>
>

--0000000000000336a605e9033099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Damien Le Moal &lt;<a href=3D"mailto:damien.lemoal@opensource.wdc.com"=
>damien.lemoal@opensource.wdc.com</a>&gt;=E4=BA=8E2022=E5=B9=B49=E6=9C=8819=
=E6=97=A5 =E5=91=A8=E4=B8=8016:04=E5=86=99=E9=81=93=EF=BC=9A<br></div><div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 9/19/22 09:50,=
 Sam Li wrote:<br>
&gt; Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"_=
blank">stefanha@redhat.com</a>&gt; =E4=BA=8E2022=E5=B9=B49=E6=9C=8818=E6=97=
=A5=E5=91=A8=E6=97=A5 04:17=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Sep 15, 2022 at 06:06:38PM +0800, Sam Li wrote:<br>
&gt;&gt;&gt; Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt; =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:<br=
>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Sam Li &lt;<a href=3D"mailto:faithilike=
run@gmail.com" target=3D"_blank">faithilikerun@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:ste=
fanha@redhat.com" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; Reviewed-by: Damien Le Moal &lt;<a href=3D"mailto:dami=
en.lemoal@opensource.wdc.com" target=3D"_blank">damien.lemoal@opensource.wd=
c.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 include/block/block-common.h | 43 ++++++++++++++=
++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 43 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; diff --git a/include/block/block-common.h b/include/bl=
ock/block-common.h<br>
&gt;&gt;&gt;&gt;&gt; index fdb7306e78..36bd0e480e 100644<br>
&gt;&gt;&gt;&gt;&gt; --- a/include/block/block-common.h<br>
&gt;&gt;&gt;&gt;&gt; +++ b/include/block/block-common.h<br>
&gt;&gt;&gt;&gt;&gt; @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDri=
ver;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 typedef struct BdrvChild BdrvChild;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 typedef struct BdrvChildClass BdrvChildClass;<br=
>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; +typedef enum BlockZoneOp {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZO_OPEN,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZO_CLOSE,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZO_FINISH,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZO_RESET,<br>
&gt;&gt;&gt;&gt;&gt; +} BlockZoneOp;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +typedef enum BlockZoneModel {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_Z_NONE =3D 0x0, /* Regular block de=
vice */<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_Z_HM =3D 0x1, /* Host-managed zoned=
 block device */<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_Z_HA =3D 0x2, /* Host-aware zoned b=
lock device */<br>
&gt;&gt;&gt;&gt;&gt; +} BlockZoneModel;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +typedef enum BlockZoneCondition {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_NOT_WP =3D 0x0,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_EMPTY =3D 0x1,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_IOPEN =3D 0x2,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_EOPEN =3D 0x3,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_CLOSED =3D 0x4,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_RDONLY =3D 0xD,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_FULL =3D 0xE,<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZS_OFFLINE =3D 0xF,<br>
&gt;&gt;&gt;&gt;&gt; +} BlockZoneCondition;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +typedef enum BlockZoneType {<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZT_CONV =3D 0x1, /* Conventional ra=
ndom writes supported */<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZT_SWR =3D 0x2, /* Sequential write=
s required */<br>
&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 BLK_ZT_SWP =3D 0x3, /* Sequential write=
s preferred */<br>
&gt;&gt;&gt;&gt;&gt; +} BlockZoneType;<br>
&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; +/*<br>
&gt;&gt;&gt;&gt;&gt; + * Zone descriptor data structure.<br>
&gt;&gt;&gt;&gt;&gt; + * Provides information on a zone with all position a=
nd size values in bytes.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m glad that you chose bytes here for use in qemu.=C2=
=A0 But since the<br>
&gt;&gt;&gt;&gt; kernel struct blk_zone uses sectors instead of bytes, is i=
t worth<br>
&gt;&gt;&gt;&gt; adding a sentence that we intentionally use bytes here, di=
fferent from<br>
&gt;&gt;&gt;&gt; Linux, to make it easier for reviewers to realize that sca=
ling when<br>
&gt;&gt;&gt;&gt; translating between qemu and kernel is necessary?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sorry about the unit mistake. The zone information is in secto=
rs which<br>
&gt;&gt;&gt; is the same as kernel struct blk_zone. I think adding a senten=
ce to<br>
&gt;&gt;&gt; inform the sector unit makes it clear what the zone descriptor=
 is.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d make the units bytes for consistency with the rest of the =
QEMU block<br>
&gt;&gt; layer. For example, the MapEntry structure that &quot;qemu-img map=
&quot; reports<br>
&gt;&gt; has names with similar fields and they are in bytes:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0struct MapEntry {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t start;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int64_t length;<br>
&gt;&gt;<br>
&gt; <br>
&gt; I think the zone descriptor uses sector units because ioctl() will<br>
&gt; report zones in sector units. Making blk_zone.offset =3D<br>
&gt; zone_descriptor.offset is more convenient than using byte units where<=
br>
&gt; it needs make conversions twice(sector -&gt; byte -&gt; sector in zone=
<br>
&gt; descriptors and offset argument in bdrv_co_zone_report). The MapEntry<=
br>
&gt; uses byte units because lseek() in bdrv_co_block_status suggests the<b=
r>
&gt; file offset is set to bytes and I think it may be why the rest of the<=
br>
&gt; block layer uses bytes(not sure).<br>
&gt; <br>
&gt; I do not object to using bytes here but it would require some<br>
&gt; compromises. If I was wrong about anything, please let me know.<br>
<br>
The conversion can be done using 9-bits left and right shifts, which are<br=
>
cheap to do. I think it is important to be consistent with qemu block API,<=
br>
so using for the API bytes is preferred. That will avoid confusions.</block=
quote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok, will change it. Tha=
nks!</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D=
"auto"><br>
<br>
&gt; <br>
&gt; <br>
&gt; Sam<br>
<br>
-- <br>
Damien Le Moal<br>
Western Digital Research<br>
<br>
</blockquote></div></div>

--0000000000000336a605e9033099--

