Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15895BC4C4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 10:53:08 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaCWZ-0008Cx-My
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 04:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2546a2185=damien.lemoal@opensource.wdc.com>)
 id 1oaBlz-00083j-LH
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:05:00 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:20741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2546a2185=damien.lemoal@opensource.wdc.com>)
 id 1oaBlv-0006wR-Oy
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 04:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663574695; x=1695110695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RJIpYe3Z4LIpXfe2aEyisAXLENHiDLZvGKZaFQWcChY=;
 b=d2QZvDgCpwHwPyU0WBoqAv/KoBnCLkEgHf25IbGGyqaarw4eUC10H/le
 5a6wJxDtPAKbGqPfNodvZloShdjqSOcQpG+c/Ytm8pRuJD1wuUn0BQSFG
 j0Cs/Tsqj2xU5RF835fGpKdJJSVbaZd/aOTHnEiOwRfWFaWuoR4r0FRTC
 L/OvvKNpRXuYLdQ5SJB78vgWOqpna5tklAdNbHJlqUDys5r6J52ansVk4
 S5MhgUdlYSBWBa77E023s7E489JlHGf/EV7r3wJ7HgCFfGHM+Eie4oNsH
 l4AXvRKII6CQE5m+2adxsmznTwKq7OKN4UHx8cPRnwQyZt/YPBeswt4dT Q==;
X-IronPort-AV: E=Sophos;i="5.93,327,1654531200"; d="scan'208";a="212133377"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Sep 2022 16:04:46 +0800
IronPort-SDR: 3olrqA2WK9+l2q1hZilcDJUogq5HFdjJzEWpzjBWuo5MswCgyvxi3ryyN0IomBMHGwAY2jFdbO
 SfMnjLzzadN0C2dkA2FPPSEPTbrIjjTdA5LBqMp+0JBco6gvrXDdh670YwD7T/8CycWQCisbZl
 biSok8kwaIpMFvqKKnsMDph945T75m5PcJQHVx7wBRJFmaYhaWtLsSdx72FjIKnYsrFBDsalmI
 /GjWbsJj67uANh4bxLbhZ+gCp8H26AIJgQo7MvUwzZlOZNQ3ksUrRBiVCkTRowMzFCcqpYz956
 Ev7onfkjCbcnebwec50gpJxo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2022 00:19:24 -0700
IronPort-SDR: TbQgL0Ut59miGVL6I7V0A5Li4ac/oTHBIrc8IglRpPJzuUpsCzFmAsAEhuYey7Au1ErZZODrhE
 jruUkKep7nEJ+AkqUw6kyb70peLcpy+P10QpeKcvPEDAi3hmYUUaanl0e0csGZWpIfZPOAKixo
 7sq+JqP5KrQOiRdxHCxRpbHPqRCN2b1bAlUdnHIQAlEwf0+j8muGuP4YCXZSrhK5VQtMhUrBrQ
 nzSH8ZwA+pFnxwjeHfw0b/BGl4j6MKjItgYmI9a3618VGgm89EbaV+AzMUgxWf9149etySKRRJ
 4aY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2022 01:04:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MWHJt09gqz1Rwtm
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 01:04:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1663574684; x=1666166685; bh=RJIpYe3Z4LIpXfe2aEyisAXLENHiDLZvGKZ
 aFQWcChY=; b=F7FSV4Y3CsYTcBgfb2WH+MjQ+FSJK1sI25Oy4ohoC8Telw14dMn
 eVtHwaXpz5Cszf9JtB0E9GpSIS6SH5EL8RESjrsHqEt42UoJ+zsHr3TcSrOS2x+g
 GPY2CIftPUfl/HNTHo2vw0aT+AIYVDWlmEwPZFUbsnqEjT6NDVk7NuzABq56WayP
 cMkIiJGUFmR0/cM2koTzxnhficAwAmBUEGJ8Hv1V8oneVEEvdtLq4/6BFFhmHBuB
 IXcGj8IiiYPBOhBLTpRFpxC+6gsKpTYQUDj7QX0slpL0YAGqm7+XKobf4+WJ/0F1
 kVhPL6yBKZ4SOR3CGfCv8e+xHvvLIOAPkKw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WKc33ZYovB4C for <qemu-devel@nongnu.org>;
 Mon, 19 Sep 2022 01:04:44 -0700 (PDT)
Received: from [10.225.163.80] (unknown [10.225.163.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MWHJm5RzWz1RvLy;
 Mon, 19 Sep 2022 01:04:40 -0700 (PDT)
Message-ID: <c29ee6e2-4646-6db9-50a1-c441961a3d00@opensource.wdc.com>
Date: Mon, 19 Sep 2022 17:04:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 1/7] include: add zoned device structs
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Markus Armbruster <armbru@redhat.com>, qemu block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-2-faithilikerun@gmail.com>
 <20220915080447.nti5wdhwgwtwv4ft@redhat.com>
 <CAAAx-8KFxizaM7o82S_Zza6QjHB-mFf7hB_B-UbZ2E1Uq-sd7g@mail.gmail.com>
 <YySTY9Y+/6IplNXm@fedora>
 <CAAAx-8+Q5r974Hm51-5cL0qTp59mdHmLfptokLvbmGPKk7iz1w@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8+Q5r974Hm51-5cL0qTp59mdHmLfptokLvbmGPKk7iz1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2546a2185=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.657,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

On 9/19/22 09:50, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=881=
8=E6=97=A5=E5=91=A8=E6=97=A5 04:17=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Thu, Sep 15, 2022 at 06:06:38PM +0800, Sam Li wrote:
>>> Eric Blake <eblake@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=8815=E6=97=
=A5=E5=91=A8=E5=9B=9B 16:05=E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>> On Sat, Sep 10, 2022 at 01:27:53PM +0800, Sam Li wrote:
>>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>>>>> ---
>>>>>  include/block/block-common.h | 43 ++++++++++++++++++++++++++++++++=
++++
>>>>>  1 file changed, 43 insertions(+)
>>>>>
>>>>> diff --git a/include/block/block-common.h b/include/block/block-com=
mon.h
>>>>> index fdb7306e78..36bd0e480e 100644
>>>>> --- a/include/block/block-common.h
>>>>> +++ b/include/block/block-common.h
>>>>> @@ -49,6 +49,49 @@ typedef struct BlockDriver BlockDriver;
>>>>>  typedef struct BdrvChild BdrvChild;
>>>>>  typedef struct BdrvChildClass BdrvChildClass;
>>>>>
>>>>> +typedef enum BlockZoneOp {
>>>>> +    BLK_ZO_OPEN,
>>>>> +    BLK_ZO_CLOSE,
>>>>> +    BLK_ZO_FINISH,
>>>>> +    BLK_ZO_RESET,
>>>>> +} BlockZoneOp;
>>>>> +
>>>>> +typedef enum BlockZoneModel {
>>>>> +    BLK_Z_NONE =3D 0x0, /* Regular block device */
>>>>> +    BLK_Z_HM =3D 0x1, /* Host-managed zoned block device */
>>>>> +    BLK_Z_HA =3D 0x2, /* Host-aware zoned block device */
>>>>> +} BlockZoneModel;
>>>>> +
>>>>> +typedef enum BlockZoneCondition {
>>>>> +    BLK_ZS_NOT_WP =3D 0x0,
>>>>> +    BLK_ZS_EMPTY =3D 0x1,
>>>>> +    BLK_ZS_IOPEN =3D 0x2,
>>>>> +    BLK_ZS_EOPEN =3D 0x3,
>>>>> +    BLK_ZS_CLOSED =3D 0x4,
>>>>> +    BLK_ZS_RDONLY =3D 0xD,
>>>>> +    BLK_ZS_FULL =3D 0xE,
>>>>> +    BLK_ZS_OFFLINE =3D 0xF,
>>>>> +} BlockZoneCondition;
>>>>> +
>>>>> +typedef enum BlockZoneType {
>>>>> +    BLK_ZT_CONV =3D 0x1, /* Conventional random writes supported *=
/
>>>>> +    BLK_ZT_SWR =3D 0x2, /* Sequential writes required */
>>>>> +    BLK_ZT_SWP =3D 0x3, /* Sequential writes preferred */
>>>>> +} BlockZoneType;
>>>>> +
>>>>> +/*
>>>>> + * Zone descriptor data structure.
>>>>> + * Provides information on a zone with all position and size value=
s in bytes.
>>>>
>>>> I'm glad that you chose bytes here for use in qemu.  But since the
>>>> kernel struct blk_zone uses sectors instead of bytes, is it worth
>>>> adding a sentence that we intentionally use bytes here, different fr=
om
>>>> Linux, to make it easier for reviewers to realize that scaling when
>>>> translating between qemu and kernel is necessary?
>>>
>>> Sorry about the unit mistake. The zone information is in sectors whic=
h
>>> is the same as kernel struct blk_zone. I think adding a sentence to
>>> inform the sector unit makes it clear what the zone descriptor is.
>>
>> I'd make the units bytes for consistency with the rest of the QEMU blo=
ck
>> layer. For example, the MapEntry structure that "qemu-img map" reports
>> has names with similar fields and they are in bytes:
>>
>>   struct MapEntry {
>>       int64_t start;
>>       int64_t length;
>>
>=20
> I think the zone descriptor uses sector units because ioctl() will
> report zones in sector units. Making blk_zone.offset =3D
> zone_descriptor.offset is more convenient than using byte units where
> it needs make conversions twice(sector -> byte -> sector in zone
> descriptors and offset argument in bdrv_co_zone_report). The MapEntry
> uses byte units because lseek() in bdrv_co_block_status suggests the
> file offset is set to bytes and I think it may be why the rest of the
> block layer uses bytes(not sure).
>=20
> I do not object to using bytes here but it would require some
> compromises. If I was wrong about anything, please let me know.

The conversion can be done using 9-bits left and right shifts, which are
cheap to do. I think it is important to be consistent with qemu block API=
,
so using for the API bytes is preferred. That will avoid confusions.

>=20
>=20
> Sam

--=20
Damien Le Moal
Western Digital Research


