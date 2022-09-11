Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BF5B4C64
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 08:52:08 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXGp5-0008HB-9W
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 02:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXGlZ-0006dL-I3
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 02:48:35 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXGlV-0007Vy-Ve
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 02:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662878904; x=1694414904;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jafy7K6B0zsPkvtlzzwTCssfoIERUGIS3hxIRFT64QA=;
 b=cke+cmL3nlCXAdAR3YNXDKRW5Vvg9Tdi3DRJPB7zhO4dEwUalEHrkNyd
 Tf9APYjOriHTukQ+vWBGdhUO4LtgfA8uzfYwZs4t1meyAxT1JKdVhVqXL
 Ip2hpHoTXiF+8PXswS8IoKAtdSYgDYbuffcZjZV/cht8jvG8NLjBZeesz
 LLhJzac/c7fEqi4YlkU3QCD59SEhKPaetK8VNUiik3i7ZIL7z9S5Su/SC
 GPCT98UCYjcyKIlv8gyuISgji+atJ7beGE9d4+3bSy79mhhwCnRrCWxT7
 MtIJPDo3E8e/W2xo/Hnr1kOQGVx5vHtf5+V/ZKGVZL3mL0+uDajwrUD/Q Q==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="211038531"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 14:48:20 +0800
IronPort-SDR: +PdPr0jX1uOr9rYi4fAYk4wi7hRRHyerAivOLMJipoZ4mc0kJ2dlh/ZH47bDCPHZ3E1kc1Xj8P
 OTXvgyl1LppQGvsGfTE9hKnXpw16u2jMf7AEH+y3ViJCmy3sp+buYKHfDV58KaO4Rt3HwijO3x
 wCnpbr7kNVwepJImdxFUzRuwJUadc4aZEiB1v6RBxUswr+kjI0m6a4Q9/LzWh1q2X73rPTnILL
 ACav5JnJZqR8wfvztUUW/IuRa9c5ZQzvRtFcCE6+Du6jywREQNnbV174xdHPiB+4T1Wb2kVcgI
 zU7wGp3eJZLLRlwEWCMFQVDq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 23:08:37 -0700
IronPort-SDR: Lk4xfkU3wrdQpthwvXTbmvH8S9/CYuFxcZeVVgpbH5SHLah5bHAjZK05SD+OJJU0pZeMGJFvsK
 3wfdA5V0SIbU0MF4CIlzdc0UmKpxU28Fxg4uM5FcsCQopjfn8UBz+IpPdRIrsVo1aB4rrvCwX1
 PxHiw3s3XPxleOQuf552JvOuMx5HyN3cd7+vmN65U+GPr6x78BTYkNHvb3BZjkFHjghWtVRywF
 Fl+oD1P37uB3iZPiVnrspglJA8PT1vVGB37vxV097l9LCm3tv4KIWwRruZ3JATp+hVce+3kF11
 nLQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 23:48:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQL0N4Nj0z1Rwtm
 for <qemu-devel@nongnu.org>; Sat, 10 Sep 2022 23:48:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662878900; x=1665470901; bh=Jafy7K6B0zsPkvtlzzwTCssfoIERUGIS3hx
 IRFT64QA=; b=uJ7Iw8uNCa+E0R7I8c+dyyD7sUYmjm3ensHXcHoNuFqdNjLuwzJ
 onWmBRsrFlLfm2FJcf7do7gtZpZUhH+1/2VdISxcHMg5VAwDG2d0ys1Q8h5FFMzb
 gBUzccEMKKoQsHFX+RFclbvIL/lOpASumCY+krLW+XTV+tCJ0odqR6pquxEpCgGF
 BbPwWzegtsC1xUbHfd7x/yvvntgvKhaVP4OC4uDjojNKG053QN0YA2iUgUqh2g2X
 GYDpamGatQqnCoy+7iSRqNZgbs+mM/kEFzftM2o/eUfPzdpY5oZW5gSeLDcy3yJm
 EWAuUHVHYpf5vZEtq/bSApoStkiU9AISK5A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id q5niq530muxS for <qemu-devel@nongnu.org>;
 Sat, 10 Sep 2022 23:48:20 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQL0K1wn2z1RvLy;
 Sat, 10 Sep 2022 23:48:16 -0700 (PDT)
Message-ID: <27ff94db-fa64-a4d6-00fc-fb289a386337@opensource.wdc.com>
Date: Sun, 11 Sep 2022 15:48:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com>
 <1b6b36ef-0a2b-957e-843b-3c3bb2edc320@opensource.wdc.com>
 <CAAAx-8LvWtTGs0cJaQ_LQi9S5fhaLx827E_xfLs1VQbEp8v_Gw@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8LvWtTGs0cJaQ_LQi9S5fhaLx827E_xfLs1VQbEp8v_Gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 2022/09/11 15:33, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
9=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 13:31=E5=86=99=E9=81=93=EF=BC=9A
[...]
>>> +/*
>>> + * zone management operations - Execute an operation on a zone
>>> + */
>>> +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, Block=
ZoneOp op,
>>> +        int64_t offset, int64_t len) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +    BDRVRawState *s =3D bs->opaque;
>>> +    RawPosixAIOData acb;
>>> +    int64_t zone_sector, zone_sector_mask;
>>> +    const char *zone_op_name;
>>> +    unsigned long zone_op;
>>> +    bool is_all =3D false;
>>> +
>>> +    zone_sector =3D bs->bl.zone_sectors;
>>> +    zone_sector_mask =3D zone_sector - 1;
>>> +    if (offset & zone_sector_mask) {
>>> +        error_report("sector offset %" PRId64 " is not aligned to zo=
ne size "
>>> +                     "%" PRId64 "", offset, zone_sector);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (len & zone_sector_mask) {
>>
>> Linux allows SMR drives to have a smaller last zone. So this needs to =
be
>> accounted for here. Otherwise, a zone operation that includes the last=
 smaller
>> zone would always fail. Something like this would work:
>>
>>         if (((offset + len) < capacity &&
>>             len & zone_sector_mask) ||
>>             offset + len > capacity) {
>>
>=20
> I see. I think the offset can be removed, like:
> if (((len < capacity && len & zone_sector_mask) || len > capacity) {
> Then if we use the previous zone's len for the last smaller zone, it
> will be greater than its capacity.

Nope, you cannot remove the offset since the zone operation may be for th=
at last
zone only, that is, offset =3D=3D last zone start and len =3D=3D last zon=
e smaller size.
In that case, len is alwats smaller than capacity.

>=20
> I will also include "opening the last zone" as a test case later.

Note that you can create such smaller last zone on the host with null_blk=
 by
specifying a device capacity that is *not* a multiple of the zone size.

>=20
>>> +        error_report("number of sectors %" PRId64 " is not aligned t=
o zone size"
>>> +                      " %" PRId64 "", len, zone_sector);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    switch (op) {
>>> +    case BLK_ZO_OPEN:
>>> +        zone_op_name =3D "BLKOPENZONE";
>>> +        zone_op =3D BLKOPENZONE;
>>> +        break;
>>> +    case BLK_ZO_CLOSE:
>>> +        zone_op_name =3D "BLKCLOSEZONE";
>>> +        zone_op =3D BLKCLOSEZONE;
>>> +        break;
>>> +    case BLK_ZO_FINISH:
>>> +        zone_op_name =3D "BLKFINISHZONE";
>>> +        zone_op =3D BLKFINISHZONE;
>>> +        break;
>>> +    case BLK_ZO_RESET:
>>> +        zone_op_name =3D "BLKRESETZONE";
>>> +        zone_op =3D BLKRESETZONE;
>>> +        break;
>>> +    default:
>>> +        g_assert_not_reached();
>>> +    }
>>> +
>>> +    acb =3D (RawPosixAIOData) {
>>> +        .bs             =3D bs,
>>> +        .aio_fildes     =3D s->fd,
>>> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
>>> +        .aio_offset     =3D offset,
>>> +        .aio_nbytes     =3D len,
>>> +        .zone_mgmt  =3D {
>>> +                .zone_op =3D zone_op,
>>> +                .zone_op_name =3D zone_op_name,
>>> +                .all =3D is_all,
>>> +        },
>>> +    };
>>> +
>>> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb);
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}

--=20
Damien Le Moal
Western Digital Research


