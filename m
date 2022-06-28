Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4155BFC1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:24:14 +0200 (CEST)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67S9-0008Sh-0d
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1714c2d51=damien.lemoal@opensource.wdc.com>)
 id 1o67AZ-0002zT-Kd
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:06:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1714c2d51=damien.lemoal@opensource.wdc.com>)
 id 1o67AX-0002DM-OM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656407160; x=1687943160;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cCa4B+rm4FKKCiewI+7mggT0Hl2RRIAc32zquz9+e00=;
 b=NZ6TpiO//hSJ3CSJplBdAOSYdGWTL+82ZlpVdQ78idEQCA4tIIMriQqx
 rh5MaZhUhiI80YQHAgEwEGFm87zkfZmX+OWVJlq+YzkE6kMrSZ34CdD67
 dc29JNgZEdtD8+0Dup3kCw7fJhByn2CHkwEjxg8l9fp52LcrqpSCDXaYD
 nE9vtJL4uGNiopzjz1Gm3Ql356UJTeHPYXqhcfZNxoJMNAgnNaTe7sqDG
 3t1cf61gZ/lrff42JCR9uOT+YKyt0PyxEk3A7jpdXgx1ihtmqgz+Qbw0V
 bei7apZroKRz+yX8LBEbzJzAAEuQ5ns5BrzyFqCzvppbhdkvnMUItsWSg Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; d="scan'208";a="209144367"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 17:05:48 +0800
IronPort-SDR: r7H16y1esS2UUVsxoNU49uHzgbEVMhhBCH1Rai9z00QEtkLeiVNwVY+ThMmbpJiUisCbP17XbQ
 tck/nzZbhJDQyJORMsU9FJDhgfOnbFlq9yFCDjhSIbPGjAdpdOOTJVgmIyT/W6VkEEl4bh/nFb
 Cr7tA5PUEJhP8IhhQQBmMwOpTZ1xlljolQKOgIuVhz4KWC0qzqnpk2OSTQFbGzCn+qLqRrJf94
 UAuvs15A0zqlak2g4CtGOmqLq+wiY2u0B/+twZLne6LckYNalDPIA0eprPUB1JiKNsFHZKo3VI
 qUAwHJdfJ9mN83hU9D9+Hgku
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 01:28:11 -0700
IronPort-SDR: avgRwiF2DbbqfBvj0B6k/AjrO6CQUQP2SIaa3LJjnN7aXyAYNIm31ZUznLHmAjfwGH569jeb7m
 6FsjFJUl0geyB3VkFi/1LXA91RUcwQUTdpwj4eIMZ/VDp2xgZ3dfHFvT15MusuKRa/xyo/RWcc
 wJAuDSkAyb9vxnxrN7gm7CMtRQjH98rI6y0E+VdlRwU7iP/mgQFmaxSXSBg2E3uzRD1QOsiU0y
 ptBYVODiFGgov1Zshhh9uHVOKPgXlZhC1UQtuBwTnTo5WGr3SUv8D1T1DOqs8YZNHPzGns/CGy
 uLs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 02:05:48 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXJbc3gtGz1Rws0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:05:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656407147; x=1658999148; bh=cCa4B+rm4FKKCiewI+7mggT0Hl2RRIAc32z
 quz9+e00=; b=L5ObAxUXivPaiskhTUtrTPrGerTdNziQbCW8LzAM+83fui9H2tU
 A2TDjgAm+fx6vlAsVy2eX0KbMHqFWuIwGMGzUDYjyHhOVL3JczRduMbmQKWnR87g
 GSnH6OmIkynWof5PaSlQtBPFr0Bmtm39NFr+eQkX8X27KdNpJ4X9pBxvSZ02Et9e
 XI3Hc7nPIIjlp5Q54dyV5io0i4WFS232RO/RjdXyoiUw3JQFIRUbP+FVE7fLLu7e
 BAwG/WHcvlKU2/3HsWYDTGEO73kEd+P/1DT6v1hFOgmyqNmfG8fhvMXeow9ORFFL
 vXUkQB36vnXmo9fK8FJFLPEoK+UU4CFlzgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id vtscS84hVUUf for <qemu-devel@nongnu.org>;
 Tue, 28 Jun 2022 02:05:47 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXJbY4yCFz1RtVk;
 Tue, 28 Jun 2022 02:05:45 -0700 (PDT)
Message-ID: <c74ebf91-1af0-8e29-28e0-9b4ee4580ae8@opensource.wdc.com>
Date: Tue, 28 Jun 2022 18:05:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 1/5] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu block <qemu-block@nongnu.org>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-2-faithilikerun@gmail.com>
 <Yrm7iNLdIJjOjQmR@stefanha-x1.localdomain>
 <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8LcxzKYsq1isvqaWEtF1JdUBp0wL8axLCm_eLR79jS_Dw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=1714c2d51=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/28/22 17:05, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=882=
8=E6=97=A5=E5=91=A8=E4=BA=8C 14:52=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Mon, Jun 27, 2022 at 08:19:13AM +0800, Sam Li wrote:
>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>> index e0e1aff4b1..786f964d02 100644
>>> --- a/block/block-backend.c
>>> +++ b/block/block-backend.c
>>> @@ -1810,6 +1810,62 @@ int blk_flush(BlockBackend *blk)
>>>      return ret;
>>>  }
>>>
>>> +/*
>>> + * Return zone_report from BlockDriver. Offset can be any number wit=
hin
>>> + * the zone size. No alignment for offset and len.
>>
>> What is the purpose of len? Is it the maximum number of zones to retur=
n
>> in nr_zones[]?
>=20
> len is actually not used in bdrv_co_zone_report. It is needed by
> blk_check_byte_request.

There is no IO buffer being passed. Only an array of zone descriptors and
an in-out number of zones. len is definitely not needed. Not sure what
blk_check_byte_request() is intended to check though.

>=20
>> How does the caller know how many zones were returned?
>=20
> nr_zones represents IN maximum and OUT actual. The caller will know by
> nr_zones which is changed in bdrv_co_zone_report. I'll add it in the
> comments.
>=20
>>
>>> + */
>>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offse=
t,
>>> +                       int64_t len, int64_t *nr_zones,
>>> +                       BlockZoneDescriptor *zones)
>>> +{
>>> +    int ret;
>>> +    BlockDriverState *bs;
>>> +    IO_CODE();
>>> +
>>> +    blk_inc_in_flight(blk); /* increase before waiting */
>>> +    blk_wait_while_drained(blk);
>>> +    bs =3D blk_bs(blk);
>>> +
>>> +    ret =3D blk_check_byte_request(blk, offset, len);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>> +
>>> +    bdrv_inc_in_flight(bs);
>>
>> The bdrv_inc/dec_in_flight() call should be inside
>> bdrv_co_zone_report(). See bdrv_co_ioctl() for an example.
>>
>>> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len,
>>> +                              nr_zones, zones);
>>> +    bdrv_dec_in_flight(bs);
>>> +    blk_dec_in_flight(blk);
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * Return zone_mgmt from BlockDriver.
>>
>> Maybe this should be:
>>
>>   Send a zone management command.
>=20
> Yes, it's more accurate.
>=20
>>
>>> @@ -216,6 +217,11 @@ typedef struct RawPosixAIOData {
>>>              PreallocMode prealloc;
>>>              Error **errp;
>>>          } truncate;
>>> +        struct {
>>> +            int64_t *nr_zones;
>>> +            BlockZoneDescriptor *zones;
>>> +        } zone_report;
>>> +        zone_op op;
>>
>> It's cleaner to put op inside a struct zone_mgmt so its purpose is
>> self-explanatory:
>>
>>   struct {
>>       zone_op op;
>>   } zone_mgmt;
>>
>>> +static int handle_aiocb_zone_report(void *opaque) {
>>> +    RawPosixAIOData *aiocb =3D opaque;
>>> +    int fd =3D aiocb->aio_fildes;
>>> +    int64_t *nr_zones =3D aiocb->zone_report.nr_zones;
>>> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
>>> +    int64_t offset =3D aiocb->aio_offset;
>>> +    int64_t len =3D aiocb->aio_nbytes;

Since you have the zone array and number of zones (size of that array) I
really do not see why you need len.

>>> +
>>> +    struct blk_zone *blkz;
>>> +    int64_t rep_size, nrz;
>>> +    int ret, n =3D 0, i =3D 0;
>>> +
>>> +    nrz =3D *nr_zones;
>>> +    if (len =3D=3D -1) {
>>> +        return -errno;
>>
>> Where is errno set? Should this be an errno constant instead like
>> -EINVAL?
>=20
> That's right! Noted.
>=20
>>
>>> +    }
>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
>>> +    g_autofree struct blk_zone_report *rep =3D g_new(struct blk_zone=
_report, nrz);
>>
>> g_new() looks incorrect. There should be 1 struct blk_zone_report
>> followed by nrz struct blk_zone structs. Please use g_malloc(rep_size)
>> instead.
>=20
> Yes! However, it still has a memory leak error when using g_autofree
> && g_malloc.

That may be because you are changing the value of the rep pointer while
parsing the report ?

>=20
>>
>>> +    offset =3D offset / 512; /* get the unit of the start sector: se=
ctor size is 512 bytes. */
>>> +    printf("start to report zone with offset: 0x%lx\n", offset);
>>> +
>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>> +    while (n < nrz) {
>>> +        memset(rep, 0, rep_size);
>>> +        rep->sector =3D offset;
>>> +        rep->nr_zones =3D nrz;
>>
>> What prevents zones[] overflowing? nrz isn't being reduced in the loop=
,
>> so maybe the rep->nr_zones return value will eventually exceed the
>> number of elements still available in zones[n..]?
>=20
> I suppose the number of zones[] is restricted in the subsequent for
> loop where zones[] copy one zone at a time as n increases. Even if
> rep->zones exceeds the available room in zones[], the extra zone will
> not be copied.
>=20
>>
>>> +static int handle_aiocb_zone_mgmt(void *opaque) {
>>> +    RawPosixAIOData *aiocb =3D opaque;
>>> +    int fd =3D aiocb->aio_fildes;
>>> +    int64_t offset =3D aiocb->aio_offset;
>>> +    int64_t len =3D aiocb->aio_nbytes;
>>> +    zone_op op =3D aiocb->op;
>>> +
>>> +    struct blk_zone_range range;
>>> +    const char *ioctl_name;
>>> +    unsigned long ioctl_op;
>>> +    int64_t zone_size;
>>> +    int64_t zone_size_mask;
>>> +    int ret;
>>> +
>>> +    ret =3D ioctl(fd, BLKGETZONESZ, &zone_size);
>>
>> Can this value be stored in bs (maybe in BlockLimits) to avoid calling
>> ioctl(BLKGETZONESZ) each time?
>=20
> Yes, zone_size is in the zbd_dev field. I'll update BlockLimits after
> I think through the configurations. In addition, it's a temporary
> approach. It is substituted by get_sysfs_long_val now.
>=20
>>
>>> +    if (ret) {
>>> +        return -1;
>>
>> The return value should be a negative errno. -1 is -EPERM but it's
>> probably not that error code you wanted. This should be:
>>
>>   return -errno;
>>
>>> +    }
>>> +
>>> +    zone_size_mask =3D zone_size - 1;
>>> +    if (offset & zone_size_mask) {
>>> +        error_report("offset is not the start of a zone");
>>> +        return -1;
>>
>> return -EINVAL;
>>
>>> +    }
>>> +
>>> +    if (len & zone_size_mask) {
>>> +        error_report("len is not aligned to zones");
>>> +        return -1;
>>
>> return -EINVAL;
>>
>>> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int=
64_t offset,
>>> +        int64_t len, int64_t *nr_zones,
>>> +        BlockZoneDescriptor *zones) {
>>> +    BDRVRawState *s =3D bs->opaque;
>>> +    RawPosixAIOData acb;
>>> +
>>> +    acb =3D (RawPosixAIOData) {
>>> +        .bs         =3D bs,
>>> +        .aio_fildes =3D s->fd,
>>> +        .aio_type   =3D QEMU_AIO_IOCTL,
>>> +        .aio_offset =3D offset,
>>> +        .aio_nbytes =3D len,
>>> +        .zone_report    =3D {
>>> +                .nr_zones       =3D nr_zones,
>>> +                .zones          =3D zones,
>>> +                },
>>
>> Indentation is off here. Please use 4-space indentation.
> Noted!
>=20
> Thanks for reviewing!
>=20
> Sam


--=20
Damien Le Moal
Western Digital Research

