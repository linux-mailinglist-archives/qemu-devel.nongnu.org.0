Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B855F2EE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 03:44:56 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6MlC-0004RB-NC
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 21:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1728850ad=damien.lemoal@opensource.wdc.com>)
 id 1o6Mjo-0003cK-Ax
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 21:43:28 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1728850ad=damien.lemoal@opensource.wdc.com>)
 id 1o6Mjk-00060l-A1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 21:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656467002; x=1688003002;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R76lvQ5/cABZ78NNCHFmLfAFwo83Qo4yeVCpjst4U+M=;
 b=WMJxmSuZO5QX0gBjiI1a42y1/gb6geKBEY4Dip7Ies6pWcUozyMzO6PL
 zz9i2DvrpGIXyuxuUgiAnSZGoIGW5ByfN4oDM9XpSwii7ghQcPJd7N/Gx
 LEzgVBCgLJ4YVLOEtrNl+hLlrgVNgCfXRzqQz4+rExMfTwpJGxFR8PXX/
 noc2Ib7g+Ef9uYMEUJp2WN86awwGJNeeBgnIm3nO4t86fcFCdoPkmjcWA
 iD5MhhmxtdfVYtXxa3+4rmnLYYKUAV7K7qcX/zuwECtkcW90XdpLpKb7t
 r5sjetymnhYeIi3AFhIbu35+gA9l36Kl94AFP15UbyyLG3E96N0lBTLg6 Q==;
X-IronPort-AV: E=Sophos;i="5.92,230,1650902400"; d="scan'208";a="204343461"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jun 2022 09:43:17 +0800
IronPort-SDR: VwLLMiNhKozYCwY6TNNgLc7CngRWEWxbymDueKE0EQxZDIL6uAxLOebPxu+XkICPo8GNAll2aQ
 eIuETMbE2awDMHOkHGQPKIS6QqT/agyKsQaPYARKLIl6JMNQlOCzMuj61uhJCnfx+7jNQZxTn1
 imv3GN8mXV8DcleLj6AnK2Byirsuedv7z8z7ifzGC7rymiOUSryi6iRH+iG/5m89IOyqJL7BwX
 oGxTbIaWnvAe49M676WKVLF0rkdnK/faeZQdm/OO/QYsXxZJ6IIubAdYUDji9NjhsMjTb6jtdg
 2OUYS3Oyv8xfxDgnxWJNzijr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 18:00:57 -0700
IronPort-SDR: GBGbc8tDAI3dcVA+K5+/WQ3S/GbOsHYlzG4se578kLmZ4PlwXH59l1wIdiZ6nsrPfXSqtPGpZ3
 6wN/4sxvKTL1BrHLVgIEa7CqbKBN8bxDZwoyWH8XYzB0Zk1EZ/z05y2QuE5sbFYE62WVMRh6uq
 z5jmbXXhQDiKKSfho3nxuh7lr8uB8mbCUSArIHaoBSXaZHOmbxTfjjtLT3I58CeZfUEgtcHJwB
 x/pLZD0C6YTxtVcFPK47am8wzt+ZtS+j+y/tSxfZstNUo6UqIHVWKsKcq8LEptRqle4EXCmCbQ
 w6k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 18:43:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXkkZ2crFz1Rws0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 18:43:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656466997; x=1659058998; bh=R76lvQ5/cABZ78NNCHFmLfAFwo83Qo4yeVC
 pjst4U+M=; b=gCopuW8lj4tWuREYcK8IgpR1H5CSko++v1if33UFR5cWV79zWmv
 zscfgEqXu0Ygc3qpDq0R21RERc/KXm7TQWZWl/pF80q0DUi1ILcIAR4bR39y0bqh
 NSHaEBiesYOxbj2q4a5RUvxfVu2SZPhlEyksGdxqQIH2mpd2qpCL012H2xFJXIaM
 Ufj19/Yz/cmzMRub9xqhR1qKzUaSEuDLSQcLW1G33MNHAlETAFvb6nDkAbeD+qEd
 dEjAmyQfjq7c6wzZevL1I4/kMZowf+RRX22Cxe+HCUK1I1+EjpbbEbfI01fy9nra
 fjvLRRmD+9NzCRgfSWcleiArVngsiFor+sg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iLtVYlYD0EOS for <qemu-devel@nongnu.org>;
 Tue, 28 Jun 2022 18:43:17 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXkkV6znKz1RtVk;
 Tue, 28 Jun 2022 18:43:14 -0700 (PDT)
Message-ID: <20a3234d-eb6b-ee21-95d5-5ce18aa6c822@opensource.wdc.com>
Date: Wed, 29 Jun 2022 10:43:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel
 <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
 <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
 <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
 <CAAAx-8+6q9zLGO2Xzi9JaNFgkpHn0-eQyB8GijGx53zbFtsDCQ@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8+6q9zLGO2Xzi9JaNFgkpHn0-eQyB8GijGx53zbFtsDCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=1728850ad=damien.lemoal@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/28/22 19:23, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
6=E6=9C=8828=E6=97=A5=E5=91=A8=E4=BA=8C 17:05=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 6/28/22 17:05, Sam Li wrote:
>>> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=BA=8C 14:52=E5=86=99=E9=81=93=EF=BC=9A
>>>>
>>>> On Mon, Jun 27, 2022 at 08:19:13AM +0800, Sam Li wrote:
>>>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>>>> index e0e1aff4b1..786f964d02 100644
>>>>> --- a/block/block-backend.c
>>>>> +++ b/block/block-backend.c
>>>>> @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
>>>>>      return ret;
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * Return zone_report from BlockDriver. Offset can be any number w=
ithin
>>>>> + * the zone size. No alignment for offset and len.
>>>>
>>>> What is the purpose of len? Is it the maximum number of zones to ret=
urn
>>>> in nr_zones[]?
>>>
>>> len is actually not used in bdrv_co_zone_report. It is needed by
>>> blk_check_byte_request.
>>
>> There is no IO buffer being passed. Only an array of zone descriptors =
and
>> an in-out number of zones. len is definitely not needed. Not sure what
>> blk_check_byte_request() is intended to check though.
>=20
> Can I just remove len argument and blk_check_byte_request() if it's not=
 used?

If it is unused, yes, you must remove it.

>=20
>>
>>>
>>>> How does the caller know how many zones were returned?
>>>
>>> nr_zones represents IN maximum and OUT actual. The caller will know b=
y
>>> nr_zones which is changed in bdrv_co_zone_report. I'll add it in the
>>> comments.
>>>
>>>>
>>>>> + */
>>>>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t off=
set,
>>>>> +                       int64_t len, int64_t *nr_zones,
>>>>> +                       BlockZoneDescriptor *zones)
>>>>> +{
>>>>> +    int ret;
>>>>> +    BlockDriverState *bs;
>>>>> +    IO_CODE();
>>>>> +
>>>>> +    blk_inc_in_flight(blk); /* increase before waiting */
>>>>> +    blk_wait_while_drained(blk);
>>>>> +    bs =3D blk_bs(blk);
>>>>> +
>>>>> +    ret =3D blk_check_byte_request(blk, offset, len);
>>>>> +    if (ret < 0) {
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    bdrv_inc_in_flight(bs);
>>>>
>>>> The bdrv_inc/dec_in_flight() call should be inside
>>>> bdrv_co_zone_report(). See bdrv_co_ioctl() for an example.
>>>>
>>>>> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
>>>>> +                              nr_zones, zones);
>>>>> +    bdrv_dec_in_flight(bs);
>>>>> +    blk_dec_in_flight(blk);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Return zone_mgmt from BlockDriver.
>>>>
>>>> Maybe this should be:
>>>>
>>>>   Send a zone management command.
>>>
>>> Yes, it's more accurate.
>>>
>>>>
>>>>> @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
>>>>>              PreallocMode prealloc;
>>>>>              Error **errp;
>>>>>          } truncate;
>>>>> +        struct {
>>>>> +            int64_t *nr_zones;
>>>>> +            BlockZoneDescriptor *zones;
>>>>> +        } zone_report;
>>>>> +        zone_op op;
>>>>
>>>> It's cleaner to put op inside a struct zone_mgmt so its purpose is
>>>> self-explanatory:
>>>>
>>>>   struct {
>>>>       zone_op op;
>>>>   } zone_mgmt;
>>>>
>>>>> +static int handle_aiocb_zone_report(void *opaque) {
>>>>> +    RawPosixAIOData *aiocb =3D opaque;
>>>>> +    int fd =3D aiocb->aio_fildes;
>>>>> +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
>>>>> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
>>>>> +    int64_t offset =3D aiocb->aio_offset;
>>>>> +    int64_t len =3D aiocb->aio_nbytes;
>>
>> Since you have the zone array and number of zones (size of that array)=
 I
>> really do not see why you need len.
>>
>>>>> +
>>>>> +    struct blk_zone *blkz;
>>>>> +    int64_t rep_size, nrz;
>>>>> +    int ret, n =3D 0, i =3D 0;
>>>>> +
>>>>> +    nrz =3D *nr_zones;
>>>>> +    if (len =3D=3D -1) {
>>>>> +        return -errno;
>>>>
>>>> Where is errno set? Should this be an errno constant instead like
>>>> -EINVAL?
>>>
>>> That's right! Noted.
>>>
>>>>
>>>>> +    }
>>>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(str=
uct blk_zone);
>>>>> +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zo=
ne_report, nrz);
>>>>
>>>> g_new() looks incorrect. There should be 1 struct blk_zone_report
>>>> followed by nrz struct blk_zone structs. Please use g_malloc(rep_siz=
e)
>>>> instead.
>>>
>>> Yes! However, it still has a memory leak error when using g_autofree
>>> && g_malloc.
>>
>> That may be because you are changing the value of the rep pointer whil=
e
>> parsing the report ?
>=20
> I am not sure it is the case. Can you show me some way to find the prob=
lem?

Not sure. I never used this g_malloc()/g_autofree() before so not sure ho=
w
it works. It may be that g_autofree() work only with g_new() ?
Could you try separating the declaration and allocation ? e.g.

Declare at the beginning of the function:
g_autofree struct blk_zone_report *rep =3D NULL;

And then when needed do:

rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zon=
e);
rep =3D g_malloc(rep_size);

>=20
> Thanks for reviewing!
>=20
>=20
>>
>>>
>>>>
>>>>> +    offset =3D offset / 512; /* get the unit of the start sector: =
sector size is 512 bytes. */
>>>>> +    printf("start to report zone with offset: 0x%lx\n", offset);
>>>>> +
>>>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>>>> +    while (n < nrz) {
>>>>> +        memset(rep, 0, rep_size);
>>>>> +        rep->sector =3D offset;
>>>>> +        rep->nr_zones =3D nrz;
>>>>
>>>> What prevents zones[] overflowing? nrz isn't being reduced in the lo=
op,
>>>> so maybe the rep->nr_zones return value will eventually exceed the
>>>> number of elements still available in zones[n..]?
>>>
>>> I suppose the number of zones[] is restricted in the subsequent for
>>> loop where zones[] copy one zone at a time as n increases. Even if
>>> rep->zones exceeds the available room in zones[], the extra zone will
>>> not be copied.
>>>
>>>>
>>>>> +static int handle_aiocb_zone_mgmt(void *opaque) {
>>>>> +    RawPosixAIOData *aiocb =3D opaque;
>>>>> +    int fd =3D aiocb->aio_fildes;
>>>>> +    int64_t offset =3D aiocb->aio_offset;
>>>>> +    int64_t len =3D aiocb->aio_nbytes;
>>>>> +    zone_op op =3D aiocb->op;
>>>>> +
>>>>> +    struct blk_zone_range range;
>>>>> +    const char *ioctl_name;
>>>>> +    unsigned long ioctl_op;
>>>>> +    int64_t zone_size;
>>>>> +    int64_t zone_size_mask;
>>>>> +    int ret;
>>>>> +
>>>>> +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
>>>>
>>>> Can this value be stored in bs (maybe in BlockLimits) to avoid calli=
ng
>>>> ioctl(BLKGETZONESZ) each time?
>>>
>>> Yes, zone_size is in the zbd_dev field. I'll update BlockLimits after
>>> I think through the configurations. In addition, it's a temporary
>>> approach. It is substituted by get_sysfs_long_val now.
>>>
>>>>
>>>>> +    if (ret) {
>>>>> +        return -1;
>>>>
>>>> The return value should be a negative errno. -1 is -EPERM but it's
>>>> probably not that error code you wanted. This should be:
>>>>
>>>>   return -errno;
>>>>
>>>>> +    }
>>>>> +
>>>>> +    zone_size_mask =3D zone_size - 1;
>>>>> +    if (offset & zone_size_mask) {
>>>>> +        error_report("offset is not the start of a zone");
>>>>> +        return -1;
>>>>
>>>> return -EINVAL;
>>>>
>>>>> +    }
>>>>> +
>>>>> +    if (len & zone_size_mask) {
>>>>> +        error_report("len is not aligned to zones");
>>>>> +        return -1;
>>>>
>>>> return -EINVAL;
>>>>
>>>>> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, i=
nt64_t offset,
>>>>> +        int64_t len, int64_t *nr_zones,
>>>>> +        BlockZoneDescriptor *zones) {
>>>>> +    BDRVRawState *s =3D bs->opaque;
>>>>> +    RawPosixAIOData acb;
>>>>> +
>>>>> +    acb =3D (RawPosixAIOData) {
>>>>> +        .bs         =3D bs,
>>>>> +        .aio_fildes =3D s->fd,
>>>>> +        .aio_type   =3D QEMU_AIO_IOCTL,
>>>>> +        .aio_offset =3D offset,
>>>>> +        .aio_nbytes =3D len,
>>>>> +        .zone_report    =3D {
>>>>> +                .nr_zones       =3D nr_zones,
>>>>> +                .zones          =3D zones,
>>>>> +                },
>>>>
>>>> Indentation is off here. Please use 4-space indentation.
>>> Noted!
>>>
>>> Thanks for reviewing!
>>>
>>> Sam
>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research


--=20
Damien Le Moal
Western Digital Research

