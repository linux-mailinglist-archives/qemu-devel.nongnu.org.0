Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E15FD63A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:31:48 +0200 (CEST)
Received: from localhost ([::1]:36938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitd5-0008Ry-Jq
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oisfd-0003A3-GE
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 03:30:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oisfZ-0003wS-5g
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 03:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665646217; x=1697182217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y/wvG1YGYNKksD1F7jg1wYQW5+6O/Y44Kk9u5c1Cbbs=;
 b=N4WUaz6vuDqyV5rGwOGCrUXZXa510KUa85Upvaegcxaln/fWMFfLeCpG
 kKyvVzAXhkZtCGe7OvEYiRQs9CiiEn+BddaCjIKei8Cb+mAcTxfYISNzj
 +xEhNaWuOxtS2Lwv9Xfu5ojKgiMlpqbAfsvzyToM6KgOlEU1KILg7Ohky
 /UBC6s802U3NBV+vYuOgXAuEy0twwb9xIo26M3Im+QFR8rDXlaQLiC/dr
 L2Tjz2wfxqcZP+kSXDBIFQmfy1HmI8sa5y/+KztCxMLeRZ8dX9kbHWWNY
 7nte4h6nvc8gzydqCdb2IB0n0SsiW+2mezpODjdSoIlcWSjjbHmJTzyPr A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="218865071"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:30:13 +0800
IronPort-SDR: RG3RVi5Lvyamec129cnO84WDIwywclwPz0QC0EEl9nsGrnQX5gNoEZXGDuVpn/23OH0sZd3ID/
 xdxOOzfg3t7R57i/hhJ3HPQDv7Ea7Vo31DNhANMTbicetQiUhip2xaL87I7EwF9gouhoo8A9Qw
 XS1wK1rLpVOimo4feAy5TeKatDjsbZgdITpH5JKKv19yg8v7Jr8oLR8pP+yEYul7p8vBylOJF3
 qBB10sxEu4+ddsF5vWjMIyYFiDbizB0Y+9n9SpK52XLlAe8XCXDKVQLRQnsoQFn6DpLUjfWFG7
 BBqIJgZEoEqV10AKd6zvXlAm
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Oct 2022 23:44:13 -0700
IronPort-SDR: /u+FE5wkos7Cz8b1d63dV69rPdbeqdV+UG1fprnxgb56QrHxSN+rrcdlycVb3oSj+V8cgAFbPO
 9fnOGszNeOr9t0d/5AHkYnQSHoJpltubfsfgV6IOkY0OE4Td+dZLk4zwCPMel7+McR+lMaQTxr
 99Dg9IniXvc20bj7SBL3+K+BsVzFMdl7YlN/YTtvkGVumSP45ir7Rz4ye7haJ5dBaH2Ka7WCDC
 0V35++C6InpxeaZamvXv1qkIcc9gNnZNxyU+kQHAV1tJPLUhXqc//j5xs0uk/53xShjnlxPeWf
 qYw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:30:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp1Pw6LWyz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 00:30:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665646210; x=1668238211; bh=Y/wvG1YGYNKksD1F7jg1wYQW5+6O/Y44Kk9
 u5c1Cbbs=; b=SemuXIR345NCXWP2vl3A6otMzBHbaNdZr6G6XZDjK4qRfT1uaao
 o0K7yHVZGH2hA0151Mq5O7Kp6xmUdkEbHLw2LsV5z9+cx0+bbONpNjNe3TdYS3Va
 XC34B1V4sgQ222bU3TeksJMYdQpbTRW+b9/xNsNHCbFVcSZ3RyWr8c0NrbwmMPG/
 hf8u/MkplLOCeCqcC1tS/cMCljtyfywRKpFBNYi4qs0MsNvzQDhVlhWVx14YwQ6v
 M/IK5HsiNPizofR+t4HQa3Rgx01X+zZE8bBjb7aL9n//TbJUzZdj1JIB995ueVgO
 bE83wCJiw3cL+jdg2uW62okRl2Q1PmckA9A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id B70X8L7K7dZU for <qemu-devel@nongnu.org>;
 Thu, 13 Oct 2022 00:30:10 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.85.169])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp1Pr1mxVz1RvLy;
 Thu, 13 Oct 2022 00:30:08 -0700 (PDT)
Message-ID: <ea76ecc8-0dec-136e-1d94-7a1bbd20f4a6@opensource.wdc.com>
Date: Thu, 13 Oct 2022 16:30:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 1/3] file-posix:add the tracking of the zones write
 pointers
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org
References: <20221010023306.43610-1-faithilikerun@gmail.com>
 <20221010023306.43610-2-faithilikerun@gmail.com>
 <c9bfaecf-f97c-e7ad-da79-b2662137004b@opensource.wdc.com>
 <CAAAx-8JsFc6i9sCX_WiYERaAnoEgrHv5yhdjpF94sAu88kZc6A@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8JsFc6i9sCX_WiYERaAnoEgrHv5yhdjpF94sAu88kZc6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2788b627a=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.528,
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

On 2022/10/13 16:08, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
10=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 13:13=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 10/10/22 11:33, Sam Li wrote:
>>> Since Linux doesn't have a user API to issue zone append operations t=
o
>>> zoned devices from user space, the file-posix driver is modified to a=
dd
>>> zone append emulation using regular writes. To do this, the file-posi=
x
>>> driver tracks the wp location of all zones of the device. It uses an
>>> array of uint64_t. The most significant bit of each wp location indic=
ates
>>> if the zone type is conventional zones.
>>>
>>> The zones wp can be changed due to the following operations issued:
>>> - zone reset: change the wp to the start offset of that zone
>>> - zone finish: change to the end location of that zone
>>> - write to a zone
>>> - zone append
>>>
>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>> ---
>>>  block/file-posix.c               | 158 +++++++++++++++++++++++++++++=
++
>>>  include/block/block-common.h     |  14 +++
>>>  include/block/block_int-common.h |   5 +
>>>  3 files changed, 177 insertions(+)
>>>
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index a9d347292e..17c0b58158 100755
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -206,6 +206,7 @@ typedef struct RawPosixAIOData {
>>>          struct {
>>>              struct iovec *iov;
>>>              int niov;
>>> +            int64_t *append_sector;
>>
>> This should be added as part of patch 2. You do not need this to track
>> the wp of zones in this patch.
>>
>>>          } io;
>>>          struct {
>>>              uint64_t cmd;
>>> @@ -226,6 +227,7 @@ typedef struct RawPosixAIOData {
>>>          struct {
>>>              unsigned long zone_op;
>>>              const char *zone_op_name;
>>> +            bool all;
>>>          } zone_mgmt;
>>>      };
>>>  } RawPosixAIOData;
>>> @@ -1331,6 +1333,67 @@ static int hdev_get_max_segments(int fd, struc=
t stat *st) {
>>>  #endif
>>>  }
>>>
>>> +#if defined(CONFIG_BLKZONED)
>>> +static int get_zones_wp(int64_t offset, int fd, BlockZoneWps *wps,
>>
>> Nit: It would seem more natural to have the fd argument first...
>>
>>> +                        unsigned int nrz) {
>>> +    struct blk_zone *blkz;
>>> +    int64_t rep_size;
>>> +    int64_t sector =3D offset >> BDRV_SECTOR_BITS;
>>> +    int ret, n =3D 0, i =3D 0;
>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
>>> +    g_autofree struct blk_zone_report *rep =3D NULL;
>>> +
>>> +    rep =3D g_malloc(rep_size);
>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>> +    while (n < nrz) {
>>> +        memset(rep, 0, rep_size);
>>> +        rep->sector =3D sector;
>>> +        rep->nr_zones =3D nrz - n;
>>> +
>>> +        do {
>>> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
>>> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
>>> +        if (ret !=3D 0) {
>>> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " fai=
led %d",
>>> +                    fd, offset, errno);
>>> +            return -errno;
>>> +        }
>>> +
>>> +        if (!rep->nr_zones) {
>>> +            break;
>>> +        }
>>> +
>>> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
>>> +            /*
>>> +             * The wp tracking cares only about sequential writes re=
quired and
>>> +             * sequential write preferred zones so that the wp can a=
dvance to
>>> +             * the right location.
>>> +             * Use the most significant bit of the wp location to in=
dicate the
>>> +             * zone type: 0 for SWR/SWP zones and 1 for conventional=
 zones.
>>> +             */
>>> +            if (!(blkz[i].type !=3D BLK_ZONE_TYPE_CONVENTIONAL)) {
>>
>> Double negation... This can simply be:
>>
>> if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
>>
>>> +                wps->wp[i] +=3D 1ULL << 63;
>>
>> No need for the +=3D here. This can be "=3D".
>>
>>> +            } else {
>>> +                wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
>>> +            }
>>> +        }
>>> +        sector =3D blkz[i-1].start + blkz[i-1].len;
>>
>> spaces missing around the "-" in the "i-1" expressions.
>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void update_zones_wp(int64_t offset, int fd, BlockZoneWps *wp=
s,
>>
>> Same nit as above: fd being the first argument would be a little more
>> natural in my opinion.
>>
>>> +                            unsigned int nrz) {
>>> +    qemu_mutex_lock(&wps->lock);
>>> +    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
>>> +        error_report("report zone wp failed");
>>> +        return;
>>
>> You are leacking the lock here. Remove the return. Also, given that
>> get_zones_wp() already prints a message if report fails, I do not thin=
k
>> the message here is useful.
>>
>> Also, why is this function void typed ? How can the caller know if the
>> update succeeded or not ?
>=20
> Update failures mean get_zones_wp() fails and that will be reported by
> error_report. The error message indicates updates fail not reports
> fail. Maybe modifying the message suffices error checking?
>=20
> +    qemu_mutex_lock(&wps->lock);
> +    if (get_zones_wp(offset, fd, wps, nrz) < 0) {
> +        error_report("update zone wp failed");
> +    }
> +    qemu_mutex_unlock(&wps->lock);
>=20
>=20
>>
>>> +    }
>>> +    qemu_mutex_unlock(&wps->lock);
>>> +}
>>> +#endif
>>> +
>>>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>>  {
>>>      BDRVRawState *s =3D bs->opaque;
>>> @@ -1414,6 +1477,19 @@ static void raw_refresh_limits(BlockDriverStat=
e *bs, Error **errp)
>>>              error_report("Invalid device capacity %" PRId64 " bytes =
", bs->bl.capacity);
>>>              return;
>>>          }
>>> +
>>> +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
>>> +        if (ret >=3D 0) {
>>> +            bs->bl.write_granularity =3D ret;
>>> +        }
>>
>> Why is this change here ? Shouldn't this be part of the previous serie=
s
>> "Add support for zoned device" ?
>=20
> Because only zone append uses write_granularity to check the iovector
> size alignment. The previous series doesn't use this field.

Then move this to patch 2. This should not be in this patch since you are=
 not
dealing with zone append yet.

>=20
>>
>>> +
>>> +        bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) + sizeof(int64_=
t) * ret);
>>> +        if (get_zones_wp(0, s->fd, bs->bl.wps, ret) < 0){
>>> +            error_report("report wps failed");
>>> +            g_free(bs->bl.wps);
>>> +            return;
>>> +        }
>>> +        qemu_mutex_init(&bs->bl.wps->lock);
>>>      }
>>>  }
>>>
>>> @@ -1651,6 +1727,20 @@ static int handle_aiocb_rw(void *opaque)
>>>      ssize_t nbytes;
>>>      char *buf;
>>>
>>> +    /*
>>> +     * The offset of regular writes, append writes is the wp locatio=
n
>>> +     * of that zone.
>>> +     */
>>> +    if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +        if (aiocb->bs->bl.zone_size > 0) {
>>> +            BlockZoneWps *wps =3D aiocb->bs->bl.wps;
>>> +            qemu_mutex_lock(&wps->lock);
>>> +            aiocb->aio_offset =3D wps->wp[aiocb->aio_offset /
>>> +                                        aiocb->bs->bl.zone_size];
>>> +            qemu_mutex_unlock(&wps->lock);
>>> +        }
>>
>> I do not understand this hunk at all. What is this trying to do ? zone
>> append support goes into patch 2. You are overwritting the user
>> specified aio offset using the tracked wp value. That could result in =
a
>> successfull write even if the user sent an unaligned write command. Th=
at
>> is bad.
>=20
> Ok, regular writes and append writes got mixed up when I changed the
> offset to the wp of that zone.
>=20
>>
>> Here you should only be tracking the write pointer, so increment
>> wps->wp[index], which you do below.
>=20
> Understood. Will move it to the next patch.

No ! You should not change the aio offset for regular writes. Otherwise y=
ou may
hide errors for bad commands from the guest by having them succeed :)
aio offset change should be done ONLY for zone append, not for regular wr=
ites.

>=20
>>
>>> +    }
>>> +
>>>      if (!(aiocb->aio_type & QEMU_AIO_MISALIGNED)) {
>>>          /*
>>>           * If there is just a single buffer, and it is properly alig=
ned
>>> @@ -1725,6 +1815,24 @@ static int handle_aiocb_rw(void *opaque)
>>>
>>>  out:
>>>      if (nbytes =3D=3D aiocb->aio_nbytes) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +            BlockZoneWps *wps =3D aiocb->bs->bl.wps;
>>> +            int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_siz=
e;
>>> +            if (wps) {
>>> +                qemu_mutex_lock(&wps->lock);
>>> +                if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
>>> +                    uint64_t wend_offset =3D
>>> +                            aiocb->aio_offset + aiocb->aio_nbytes;
>>> +                    /* Advance the wp if needed */
>>> +                    if (wend_offset > wps->wp[index]){
>>> +                        wps->wp[index] =3D wend_offset;
>>> +                    }
>>> +                }
>>> +                qemu_mutex_unlock(&wps->lock);
>>> +            }
>>> +        }
>>> +#endif
>>>          return 0;
>>>      } else if (nbytes >=3D 0 && nbytes < aiocb->aio_nbytes) {
>>>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> @@ -1736,6 +1844,12 @@ out:
>>>          }
>>>      } else {
>>>          assert(nbytes < 0);
>>> +#if defined(CONFIG_BLKZONED)
>>> +        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +            update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
>>> +                            aiocb->bs->bl.nr_zones);
>>
>> You only need to update the target zone of the aio, not all zones.
>> Updating all zones is actually a bug as wp[] entries for other zones m=
ay
>> be larger than the device reported wp if there are other write aios in
>> flight. So the last argument must be "1" here.
>=20
> Ok, I understood now.
>=20
>>
>>> +        }
>>> +#endif
>>>          return nbytes;
>>>      }
>>>  }
>>> @@ -2022,12 +2136,17 @@ static int handle_aiocb_zone_report(void *opa=
que) {
>>>  #if defined(CONFIG_BLKZONED)
>>>  static int handle_aiocb_zone_mgmt(void *opaque) {
>>>      RawPosixAIOData *aiocb =3D opaque;
>>> +    BlockDriverState *bs =3D aiocb->bs;
>>>      int fd =3D aiocb->aio_fildes;
>>>      int64_t sector =3D aiocb->aio_offset / 512;
>>>      int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
>>> +    uint64_t wend_offset;
>>>      struct blk_zone_range range;
>>>      int ret;
>>>
>>
>> Why the blank line here ?
>=20
> For readability, separate it from the execution part.

But the following lines are variable declarations. I personally prefer
declarations to stay together before the code :)

>=20
>>
>>> +    BlockZoneWps *wps =3D bs->bl.wps;
>>> +    int index =3D aiocb->aio_offset / bs->bl.zone_size;
>>> +
>>>      /* Execute the operation */
>>>      range.sector =3D sector;
>>>      range.nr_sectors =3D nr_sectors;
>>> @@ -2035,11 +2154,41 @@ static int handle_aiocb_zone_mgmt(void *opaqu=
e) {
>>>          ret =3D ioctl(fd, aiocb->zone_mgmt.zone_op, &range);
>>>      } while (ret !=3D 0 && errno =3D=3D EINTR);
>>>      if (ret !=3D 0) {
>>> +        update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
>>> +                        aiocb->bs->bl.nr_zones);
>>
>> You need only to update the range of zones that was specified for the
>> management option, not all zones. So you must specify the zone
>> management aio offset and size/zone_size here.
>>
>>>          ret =3D -errno;
>>>          error_report("ioctl %s failed %d", aiocb->zone_mgmt.zone_op_=
name,
>>>                       ret);
>>>          return ret;
>>>      }
>>> +
>>> +    qemu_mutex_lock(&wps->lock);
>>> +    if (!BDRV_ZT_IS_CONV(wps->wp[index])) {
>>> +         /*
>>> +         * The zoned device allows the last zone smaller that the zo=
ne size.
>>> +         */
>>
>> comment indentation is off.
>>
>>> +        if (aiocb->aio_nbytes < bs->bl.zone_size) {
>>> +            wend_offset =3D aiocb->aio_offset + aiocb->aio_nbytes;
>>> +        } else {
>>> +            wend_offset =3D aiocb->aio_offset + bs->bl.zone_size;
>>> +        }
>>> +
>>> +        if (aiocb->aio_offset !=3D wps->wp[index] &&
>>> +            aiocb->zone_mgmt.zone_op =3D=3D BLKRESETZONE) {
>>
>> I do not understand the condition here. Why do you have
>> "aiocb->aio_offset !=3D wps->wp[index]" ?
>=20
> It is intended for zone state checks. aio_offset (=3D start byte of tha=
t
> zone) =3D wp means this zone is empty. Only non-empty zones will be
> reset.

That is not very natural to use an input from the user (the guest) to che=
ck the
state of something that you (qemu) maintains internally and hides to the =
user.
You should do such test with a small helpers like this:

static bool zone_is_empty(bl, index)
{
	return bl->wps.wp[index} =3D=3D index * bl->zone_size;
}

And note that this will ALWAYS return false for conventional zones.
You are not checking for conventional zones either. Any zone management f=
unction
should be immediately failed if addressed to a conventional zone. That is
missing. You need a:

if (BDRV_ZT_IS_CONV(wps->wp[index] && "this is not a zone reset all op")
	return -EIO; /* or similar... */

at the beginning of handle_aiocb_zone_mgmt().

>=20
>>
>>> +            if (aiocb->zone_mgmt.all) {
>>
>> This is the only place where you use this all boolean field. For
>> simplicity, I would drop this field completely and test that
>> aiocb->aio_offset =3D=3D 0 && aiocb->aio_nbytes =3D=3D bs->bl.capacity=
 to detect
>> a reset all zones operation.
>=20
> Right, the capacity field makes it possible. I'll drop it.
>=20
>>
>>> +                for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
>>> +                    wps->wp[i] =3D i * bs->bl.zone_size;
>>
>> You are not handling conventional zones here. For conventional zones,
>> you should not change the value. Otherwise, BDRV_ZT_IS_CONV() will
>> always return false after this.
>=20
> Right, will add a condition line here:
> + if (! BDRV_ZT_IS_CONV(wps->wp[i]))

You need:

if (BDRV_ZT_IS_CONV(wps->wp[i]))
    continue;

as the first lines inside the for loop.


>=20
>>
>>> +                }
>>> +            } else {
>>> +                wps->wp[index] =3D aiocb->aio_offset;
>>> +            }
>>> +        } else if (aiocb->aio_offset !=3D wps->wp[index] &&
>>> +            aiocb->zone_mgmt.zone_op =3D=3D BLKFINISHZONE) {
>>
>> Same comment here. Why do you have "aiocb->aio_offset !=3D wps->wp[ind=
ex]" ?
>=20
> This should be wend_offset !=3D wps->wp[index]. It means if this zone i=
s
> full, no need to finish it.

Nope, this does not mean the zone is full. Full condition would be:

wps->wp[index] >=3D index * bl->zone_size + zone_cap

But you do not have zone cap per zone (remember that zone capacity is per=
 zone
and may differ between zones)... You could add it to the wp array, but th=
at will
make it larger for not much benefits. Since finishing a zone that is alre=
ady
full is a very rare case, optimizing for it is not valuable. So simply is=
sue the
zone finish operation. It will be a no-op on the host device if the zone =
is
already full. No big deal !

>=20
>>
>>> +            wps->wp[index] =3D wend_offset;
>>> +        }
>>> +    }
>>> +    qemu_mutex_unlock(&wps->lock);
>>> +
>>>      return ret;
>>>  }
>>>  #endif
>>> @@ -2480,6 +2629,12 @@ static void raw_close(BlockDriverState *bs)
>>>      BDRVRawState *s =3D bs->opaque;
>>>
>>>      if (s->fd >=3D 0) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +        if (bs->bl.wps) {
>>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
>>> +            g_free(bs->bl.wps);
>>> +        }
>>> +#endif
>>>          qemu_close(s->fd);
>>>          s->fd =3D -1;
>>>      }
>>> @@ -3278,6 +3433,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
>>>      int64_t zone_size, zone_size_mask;
>>>      const char *zone_op_name;
>>>      unsigned long zone_op;
>>> +    bool is_all =3D false;
>>>
>>>      zone_size =3D bs->bl.zone_size;
>>>      zone_size_mask =3D zone_size - 1;
>>> @@ -3314,6 +3470,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
>>>      case BLK_ZO_RESET_ALL:
>>>          zone_op_name =3D "BLKRESETZONE";
>>>          zone_op =3D BLKRESETZONE;
>>> +        is_all =3D true;
>>>          break;
>>>      default:
>>>          g_assert_not_reached();
>>> @@ -3328,6 +3485,7 @@ static int coroutine_fn raw_co_zone_mgmt(BlockD=
riverState *bs, BlockZoneOp op,
>>>          .zone_mgmt  =3D {
>>>              .zone_op =3D zone_op,
>>>              .zone_op_name =3D zone_op_name,
>>> +            .all =3D is_all,
>>>          },
>>>      };
>>>
>>> diff --git a/include/block/block-common.h b/include/block/block-commo=
n.h
>>> index 882de6825e..b8b2dba64a 100644
>>> --- a/include/block/block-common.h
>>> +++ b/include/block/block-common.h
>>> @@ -93,6 +93,14 @@ typedef struct BlockZoneDescriptor {
>>>      BlockZoneCondition cond;
>>>  } BlockZoneDescriptor;
>>>
>>> +/*
>>> + * Track write pointers of a zone in bytes.
>>> + */
>>> +typedef struct BlockZoneWps {
>>> +    QemuMutex lock;
>>> +    uint64_t wp[];
>>> +} BlockZoneWps;
>>> +
>>>  typedef struct BlockDriverInfo {
>>>      /* in bytes, 0 if irrelevant */
>>>      int cluster_size;
>>> @@ -206,6 +214,12 @@ typedef enum {
>>>  #define BDRV_SECTOR_BITS   9
>>>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>>>
>>> +/*
>>> + * Get the first most significant bit of wp. If it is zero, then
>>> + * the zone type is SWR.
>>> + */
>>> +#define BDRV_ZT_IS_CONV(wp)    (wp & (1ULL << 63))
>>> +
>>>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_B=
ITS, \
>>>                                             INT_MAX >> BDRV_SECTOR_BI=
TS)
>>>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SEC=
TOR_BITS)
>>> diff --git a/include/block/block_int-common.h b/include/block/block_i=
nt-common.h
>>> index 37dddc603c..59c2d1316d 100644
>>> --- a/include/block/block_int-common.h
>>> +++ b/include/block/block_int-common.h
>>> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
>>>
>>>      /* device capacity expressed in bytes */
>>>      int64_t capacity;
>>> +
>>> +    /* array of write pointers' location of each zone in the zoned d=
evice. */
>>> +    BlockZoneWps *wps;
>>> +
>>> +    int64_t write_granularity;
>>>  } BlockLimits;
>>>
>>>  typedef struct BdrvOpBlocker BdrvOpBlocker;
>>
>> --
>> Damien Le Moal
>> Western Digital Research
>>

--=20
Damien Le Moal
Western Digital Research


