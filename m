Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4B5F5BC0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:32:44 +0200 (CEST)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogC0R-0007E5-Ob
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1ogBp6-0006dy-71
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:21:00 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:4108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1ogBp0-0002us-7E
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665004854; x=1696540854;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GLQAhJb4381PJJ245VEnkEkp9/UiOx2go6sKcZqRe+I=;
 b=WI7TnmqK2dtZTt69Y+EsYkrGZJ1a1P83BIX4UC9Jq7JJcZl3ARmxqWj9
 fumQ+pdlC9LURUqkngsKaerp0JVfHk0erQN4KKRpe2V7bFmj7Ffte+7MA
 ZGhdagbSXeg78hOF6MLuBjfd9bAMzVz8+16GksG6NSzXUsiageWJxs55q
 /UVeaFFdnnNYhOtPbiWF5b9+qe7DE8707f5BNo1aSFMSBNhrmRVzsPcs0
 5slm1QO/czVrxh0lcDGaoaxwPYpnSL8zlZ+qZDZFgee6bYUuv6PnbgK0n
 TzTu91FXrVRPDl+6rQw4VUwnxwfy4nqjvlWeGS09SIEDmX8G2T5p8tw7K Q==;
X-IronPort-AV: E=Sophos;i="5.95,162,1661788800"; d="scan'208";a="213480336"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Oct 2022 05:20:44 +0800
IronPort-SDR: 4jGVF5ZE03E+pTCqfgnQtqIETEeGNm9OLO3ZqrvStlpiLC0Tv4SU+WDJQVL9wCrZOwUXt1uRuZ
 XTbpmndnmEfM+Igkg8lUE0iHBb8thq0fnk6S3dKGh/vbqD8uUB63k3fZbl1HLi1YRoPPp2Ll3O
 CZ4rriBEhTgpWiMdB9J9wsP8F2SpV8d514LSmMSD6dPmumwbZsfI650IPqeFILwY2X2fMe8B9z
 1ueSJglLOWs8YcGzoB5PR4p9Uy9I2sKpeiwgkpLgFp8/n3u8vcSZdByIlhFrdAjYq8myy3nIZH
 uTLnG+2Xmw5pAkShFdKFqkbz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 13:40:31 -0700
IronPort-SDR: kwx8HaVCwV5cf//qIhvjwRHe7YG9Th+A4XgVkdJDzgtUiEDBqs1xrafaSZQbynpZxnKeG03Ft5
 bTCguEShlovMGTDViFnp5Ou/kIPN0B8ZntnN8vXwssYk9h5ats7jzP4XkakL04wccd/WaauNji
 65NavgaAGnOxM0KUbn4Zb792765MsG9nZ+Zs606im96kC/hbT9vHavVqXuX5UZRwNjwJGd5I4q
 VVjPUyuSngQkyTHkN11I1Pkg7ZYTYhCP+TIBYBFzQrSanfbF+E7SXcHxpV3ze7hfLipMItTHRt
 0e0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 14:20:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MjSCw1ltgz1RwvL
 for <qemu-devel@nongnu.org>; Wed,  5 Oct 2022 14:20:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665004841; x=1667596842; bh=GLQAhJb4381PJJ245VEnkEkp9/UiOx2go6s
 KcZqRe+I=; b=K8PcejD7B4wyJ3GBe1QcxzYZGyT+LQArG+AHdaJGM4UL9Mbw3WL
 mPhpLg1nmIYasFlRDeAD9pD3I8pajBsj5xdvY1afFgRhuBe6QGE4F2+NhSJWbxKa
 r5rny23+y8ONFyQuMZo5tpRB0LWX+8dhvPMQ4k+k1kCl5Nv4PPfPGcPordyphm4v
 ebsVjjXJAu9V7Bod/vii3ctfXmXKV1vd2ws8edVfaNXtDpiwrOueSXOE+8wGpkSb
 AVEJCqwbMG0YldS1rsxDQLWYvTf/fBaASOsom50pmMfrnFbESmcBE/cb05M9MXC6
 FwuISthh1s/R+uZ9xyTQR6P74u95PBEM6AQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HA95kfklE_3g for <qemu-devel@nongnu.org>;
 Wed,  5 Oct 2022 14:20:41 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MjSCq0bvNz1RvLy;
 Wed,  5 Oct 2022 14:20:38 -0700 (PDT)
Message-ID: <772cdb79-0536-2670-fabd-cc94042e9887@opensource.wdc.com>
Date: Thu, 6 Oct 2022 06:20:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] file-posix: add the tracking of the zones wp
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, stefanha@redhat.com, dmitry.fomichev@wdc.com,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220929093134.73974-1-faithilikerun@gmail.com>
 <20220929093134.73974-2-faithilikerun@gmail.com>
 <a91dc1d7-1d1f-9137-8ad0-bac01fad3ee7@opensource.wdc.com>
 <4157f45e-b198-717f-891e-1087dfe00a88@opensource.wdc.com>
 <CAAAx-8KLoeZ62+nCYU_-qmPFRh3yQxZuMZuUyKD-hF20JHgDOQ@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8KLoeZ62+nCYU_-qmPFRh3yQxZuMZuUyKD-hF20JHgDOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=27087a391=damien.lemoal@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.435,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/5/22 17:30, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
10=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 15:34=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 10/5/22 10:44, Damien Le Moal wrote:
>>> On 9/29/22 18:31, Sam Li wrote:
>>>> Since Linux doesn't have a user API to issue zone append operations =
to
>>>> zoned devices from user space, the file-posix driver is modified to =
add
>>>> zone append emulation using regular writes. To do this, the file-pos=
ix
>>>> driver tracks the wp location of all zones of the device. It uses an
>>>> array of uint64_t. The most significant bit of each wp location indi=
cates
>>>> if the zone type is sequential write required.
>>>>
>>>> The zones wp can be changed due to the following operations issued:
>>>> - zone reset: change the wp to the start offset of that zone
>>>> - zone finish: change to the end location of that zone
>>>> - write to a zone
>>>> - zone append
>>>>
>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>
>> Replying to myself to add some comments that I forgot.
>>
>>>> ---
>>>>  block/file-posix.c               | 138 ++++++++++++++++++++++++++++=
++-
>>>>  include/block/block-common.h     |  16 ++++
>>>>  include/block/block_int-common.h |   5 ++
>>>>  include/block/raw-aio.h          |   4 +-
>>>>  4 files changed, 159 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>> index 73656d87f2..33e81ac112 100755
>>>> --- a/block/file-posix.c
>>>> +++ b/block/file-posix.c
>>>> @@ -206,6 +206,8 @@ typedef struct RawPosixAIOData {
>>>>          struct {
>>>>              struct iovec *iov;
>>>>              int niov;
>>>> +            int64_t *append_sector;
>>>> +            BlockZoneWps *wps;
>>>>          } io;
>>>>          struct {
>>>>              uint64_t cmd;
>>>> @@ -1332,6 +1334,59 @@ static int hdev_get_max_segments(int fd, stru=
ct stat *st) {
>>>>  #endif
>>>>  }
>>>>
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +static int report_zone_wp(int64_t offset, int fd, BlockZoneWps *wps=
,
>>>> +                          unsigned int nrz) {
>>>
>>> Maybe rename this to get_zones_wp() ?
>>>
>>>> +    struct blk_zone *blkz;
>>>> +    int64_t rep_size;
>>>> +    int64_t sector =3D offset >> BDRV_SECTOR_BITS;
>>>> +    int ret, n =3D 0, i =3D 0;
>>>> +
>>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(stru=
ct blk_zone);
>>>> +    g_autofree struct blk_zone_report *rep =3D NULL;
>>>
>>> To be cleaner, move this declaration above with the others ?
>>>
>>>> +    rep =3D g_malloc(rep_size);
>>>> +
>>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>>> +    while (n < nrz) {
>>>> +        memset(rep, 0, rep_size);
>>>> +        rep->sector =3D sector;
>>>> +        rep->nr_zones =3D nrz - n;
>>>> +
>>>> +        do {
>>>> +            ret =3D ioctl(fd, BLKREPORTZONE, rep);
>>>> +        } while (ret !=3D 0 && errno =3D=3D EINTR);
>>>> +        if (ret !=3D 0) {
>>>> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " fa=
iled %d",
>>>> +                    fd, offset, errno);
>>>> +            return -errno;
>>>> +        }
>>>> +
>>>> +        if (!rep->nr_zones) {
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
>>>> +            wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
>>>> +            sector =3D blkz[i].start + blkz[i].len;
>>>> +
>>>> +            /*
>>>> +             * In the wp tracking, it only cares if the zone type i=
s sequential
>>>> +             * writes required so that the wp can advance to the ri=
ght location.
>>>
>>> Or sequential write preferred (host aware case)
>>>
>>>> +             * Instead of the type of zone_type which is an 8-bit u=
nsigned
>>>> +             * integer, use the first most significant bits of the =
wp location
>>>> +             * to indicate the zone type: 0 for SWR zones and 1 for=
 the
>>>> +             * others.
>>>> +             */
>>>> +            if (!(blkz[i].type & BLK_ZONE_TYPE_SEQWRITE_REQ)) {
>>>
>>> This should be:
>>>
>>>               if (blkz[i].type !=3D BLK_ZONE_TYPE_CONVENTIONAL) {
>>>
>>> Note that the type field is not a bit-field. So you must compare valu=
es
>>> instead of doing bit operations.
>>>
>>>> +                wps->wp[i] +=3D (uint64_t)1 << 63;
>>>
>>> You can simplify this:
>>>
>>>                  wps->wp[i] |=3D 1ULL << 63;
>>>
>>> Overall, I would rewrite this like this:
>>>
>>> for (i =3D 0; i < rep->nr_zones; i++, n++) {
>>>     /*
>>>      * The wp tracking cares only about sequential write required
>>>      * and sequential write preferred zones so that the wp can
>>>      * advance to the right location.
>>>      * Use the most significant bit of the wp location
>>>      * to indicate the zone type: 0 for SWR zones and 1 for
>>>      * conventional zones.
>>>      */
>>>     if (blkz[i].type =3D=3D BLK_ZONE_TYPE_CONVENTIONAL) {
>>>         wps->wp[i] =3D 1ULL << 63;
>>>     else
>>>         wps->wp[i] =3D blkz[i].wp << BDRV_SECTOR_BITS;
>>> }
>>> sector =3D blkz[i - 1].start + blkz[i - 1].len;
>>>
>>> Which I think is a lot simpler.
>>>
>>>> +            }
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +#endif
>>>> +
>>>>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>>>>  {
>>>>      BDRVRawState *s =3D bs->opaque;
>>>> @@ -1415,6 +1470,20 @@ static void raw_refresh_limits(BlockDriverSta=
te *bs, Error **errp)
>>>>              error_report("Invalid device capacity %" PRId64 " bytes=
 ", bs->bl.capacity);
>>>>              return;
>>>>          }
>>>> +
>>>> +        ret =3D get_sysfs_long_val(&st, "physical_block_size");
>>>> +        if (ret >=3D 0) {
>>>> +            bs->bl.write_granularity =3D ret;
>>>> +        }
>>>
>>> This change seems unrelated to the wp tracking. Should this be moved =
to a
>>> different patch ?
>>>
>>>> +
>>>> +        bs->bl.wps =3D g_malloc(sizeof(BlockZoneWps) + sizeof(int64=
_t) * ret);
>>>> +        qemu_mutex_init(&bs->bl.wps->lock);
>>>
>>> Move this initialization after the if block. Doing so, you do not nee=
d to
>>> call mutex destroy in case of error.
>>>
>>>> +        if (report_zone_wp(0, s->fd, bs->bl.wps, ret) < 0 ) {
>>>> +            error_report("report wps failed");
>>>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
>>>> +            g_free(bs->bl.wps);
>>>> +            return;
>>>> +        }
>>>>      }
>>>>  }
>>>>
>>>> @@ -1582,7 +1651,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosix=
AIOData *aiocb)
>>>>      ssize_t len;
>>>>
>>>>      do {
>>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
>>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEN=
D))
>>>>              len =3D qemu_pwritev(aiocb->aio_fildes,
>>>>                                 aiocb->io.iov,
>>>>                                 aiocb->io.niov,
>>>> @@ -1612,7 +1681,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosix=
AIOData *aiocb, char *buf)
>>>>      ssize_t len;
>>>>
>>>>      while (offset < aiocb->aio_nbytes) {
>>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEN=
D)) {
>>>>              len =3D pwrite(aiocb->aio_fildes,
>>>>                           (const char *)buf + offset,
>>>>                           aiocb->aio_nbytes - offset,
>>>> @@ -1705,7 +1774,7 @@ static int handle_aiocb_rw(void *opaque)
>>>>      }
>>>>
>>>>      nbytes =3D handle_aiocb_rw_linear(aiocb, buf);
>>>> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
>>>> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)=
)) {
>>>>          char *p =3D buf;
>>>>          size_t count =3D aiocb->aio_nbytes, copy;
>>>>          int i;
>>>> @@ -1726,6 +1795,23 @@ static int handle_aiocb_rw(void *opaque)
>>>>
>>>>  out:
>>>>      if (nbytes =3D=3D aiocb->aio_nbytes) {
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEN=
D)) {
>>>> +            BlockZoneWps *wps =3D aiocb->io.wps;
>>>
>>> Why adding this pointer to the aiocb struct ? You can get the array f=
rom
>>> aiocb->bs->bl.wps, no ?
>>>
>>>> +            int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_si=
ze;
>>>> +            if (wps) {
>>>> +               if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>>>> +                    qemu_mutex_lock(&wps->lock);
>>>> +                    wps->wp[index] +=3D aiocb->aio_nbytes;
>>>> +                    qemu_mutex_unlock(&wps->lock);
>>>> +                }
>>>> +
>>>> +                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>>>> +                    *aiocb->io.append_sector =3D wps->wp[index] >> =
BDRV_SECTOR_BITS;
>>>
>>> Bug: the append sector must be the first sector written, not the wp
>>> (sector following the last written sector). So this must be done *bef=
ore*
>>> advancing the wp.
>>>
>>> You need to have wps->lock held here too since you are reading
>>> wps->wp[index]. So the mutex lock/unlock needs to be around the 2 hun=
ks
>>> under "if (wps) {". Also, given that there cannot be any zone append
>>> issued to conventional zones (they will fail), you can simplify:
>>>
>>>             if (wps) {
>>>                 qemu_mutex_lock(&wps->lock);
>>>                 if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>>>                     if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>>>                         *aiocb->io.append_sector =3D
>>>                            wps->wp[index] >> BDRV_SECTOR_BITS;
>>>                     }
>>>                     wps->wp[index] +=3D aiocb->aio_nbytes;
>>>                 }
>>>                 qemu_mutex_unlock(&wps->lock);
>>>             }
>>>
>>> Now the last problem with this code is sequential write preferred zon=
es.
>>> For these, the write may actually be overwriting sectors that have al=
ready
>>> been written, meaning that the wp may not necessarilly need to be
>>> advanced. You can handle that case together with SWR case simply like=
 this:
>>>
>>>             if (wps) {
>>>                 qemu_mutex_lock(&wps->lock);
>>>                 if (BDRV_ZT_IS_SWR(wps->wp[index])) {
>>>                     uint64_t wend_offset =3D
>>>                          aiocb->aio_offset + aiocb->aio_nbytes;
>>>
>>>                     if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>>>                         *aiocb->io.append_sector =3D
>>>                            wps->wp[index] >> BDRV_SECTOR_BITS;
>>>                     }
>>>
>>>                     /* Advance the wp if needed */
>>>                     if (wend_offset > wps->wp[index])
>>>                         wps->wp[index] =3D wend_offset;
>>>                 }
>>>                 qemu_mutex_unlock(&wps->lock);
>>>             }
>>>
>>
>> Note that you should not increment the wp if the zone is already full.=
 But
>> for such case, since write and zone append commands will fail, you can
>> fail them immediately.
>>
>>>> +                }
>>>> +            }
>>>> +        }
>>>> +#endif
>>>>          return 0;
>>>>      } else if (nbytes >=3D 0 && nbytes < aiocb->aio_nbytes) {
>>>>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>>> @@ -1737,6 +1823,19 @@ out:
>>>>          }
>>>>      } else {
>>>>          assert(nbytes < 0);
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +        if (aiocb->aio_type =3D=3D QEMU_AIO_ZONE_APPEND) {
>>>
>>> Why do this only for zone append ? Regular write error also need a re=
fresh
>>> of the zone wp.
>>>
>>>> +            qemu_mutex_lock(&aiocb->bs->bl.wps->lock);
>>>> +            if (report_zone_wp(0, aiocb->aio_fildes, aiocb->bs->bl.=
wps,
>>>> +                           aiocb->bs->bl.nr_zones) < 0) {
>>>> +                error_report("report zone wp failed");
>>>> +                qemu_mutex_destroy(&aiocb->bs->bl.wps->lock);
>>>> +                g_free(aiocb->bs->bl.wps);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +            qemu_mutex_unlock(&aiocb->bs->bl.wps->lock);
>>>
>>> This really needs to be a helper function, e.g. update_zone_wp() or
>>> something like this. Aslo, why nuke the entire zone array if the refr=
esh
>>> for this zone fails ? You could simply leave it as is. The next write=
 may
>>> again fail and another attempt at refreshing it done.
>>>
>>>> +        }
>>>> +#endif
>>>>          return nbytes;
>>>>      }
>>>>  }
>>>> @@ -2027,12 +2126,16 @@ static int handle_aiocb_zone_report(void *op=
aque) {
>>>>  static int handle_aiocb_zone_mgmt(void *opaque) {
>>>>  #if defined(CONFIG_BLKZONED)
>>>>      RawPosixAIOData *aiocb =3D opaque;
>>>> +    BlockDriverState *bs =3D aiocb->bs;
>>>>      int fd =3D aiocb->aio_fildes;
>>>>      int64_t sector =3D aiocb->aio_offset / 512;
>>>>      int64_t nr_sectors =3D aiocb->aio_nbytes / 512;
>>>>      struct blk_zone_range range;
>>>>      int ret;
>>>>
>>>> +    BlockZoneWps *wps =3D bs->bl.wps;
>>>> +    int index =3D aiocb->aio_offset / bs->bl.zone_size;
>>>> +
>>>>      /* Execute the operation */
>>>>      range.sector =3D sector;
>>>>      range.nr_sectors =3D nr_sectors;
>>>> @@ -2045,6 +2148,22 @@ static int handle_aiocb_zone_mgmt(void *opaqu=
e) {
>>>>                       errno);
>>>>          return -errno;
>>>>      }
>>>> +
>>>> +    if (aiocb->zone_mgmt.all) {
>>
>> This case should be integrated into the
>> if (aiocb->zone_mgmt.zone_op =3D=3D BLKRESETZONE)
>=20
> The purpose of this all flag is to pass down the RESET_ALL request to
> the file-posix so that it can reset t write pointers of all zones.

I understand. My point was that you check this flag without checking that
the op is BLKRESETZONE. You need to check that to ensure that the caller
is issuing a valid request. And since you need to check that the operatio=
n
is reset and you already have that check below, merging the on-zone-reset
and all-zones-reset cases under the same "if (aiocb->zone_mgmt.zone_op =3D=
=3D
BLKRESETZONE)" condition will make things clear.

>=20
>>
>>>> +        for (int i =3D 0; i < bs->bl.nr_zones; ++i) {
>>>> +            qemu_mutex_lock(&wps->lock);
>>>> +            wps->wp[i] =3D i * bs->bl.zone_size;
>>
>> You need to test the zone type bit and only change SWR or SWP zones.
>>
>>>> +            qemu_mutex_unlock(&wps->lock);
>>>> +        }
>>>> +    } else if (aiocb->zone_mgmt.zone_op =3D=3D BLKRESETZONE) {
>>>> +        qemu_mutex_lock(&wps->lock);
>>>> +        wps->wp[index] =3D aiocb->aio_offset;
>>>> +        qemu_mutex_unlock(&wps->lock);
>>>> +    } else if (aiocb->zone_mgmt.zone_op =3D=3D BLKFINISHZONE) {
>>>> +        qemu_mutex_lock(&wps->lock);
>>>> +        wps->wp[index] =3D aiocb->aio_offset + bs->bl.zone_size;
>>>
>>> This may be the last zone of the device, which may be smaller. So you=
 need
>>> to check that here. Same for the first case for reset all: you need t=
o
>>> handle the smaller last zone if there is one.
>>
>> You should fail any zone management commnand targetting a conventional
>> zone. You are not checking that.
>>
>> Also, you can avoid issuing commands by testing if a zone is already f=
ull
>> (no need to issue finish command) or empty (no need to do a reset).
>=20
> Maybe the type check can be done before issuing the request and the
> device can return VIRTIO_BLK_S_ZONE_INVALID_CMD to finish it.
>=20
> The simplest way to do the state check I think is to compare the wp to
> the start/end sector which can tell us if the zone is empty or full.
> Therefore it should be done in the raw_co_zone_mgmt().

Nope. You cannot do that there since you can only read the wp array
holding the lock. And you must not release the lock until you issue the
command to the drive. So you should check the zone condition here.

>=20
> Thanks for reviewing! I can send the revision very soon.
>=20
>>
>>>
>>>> +        qemu_mutex_unlock(&wps->lock);
>>>> +    }
>>>
>>> Instead of the lock/unlock for each case here, take the mutex lock be=
fore
>>> the if () and unlock it after it. Less lines :)
>>>
>>> Also, if the zone management command fails, you need to do a report z=
ones
>>> and refresh the wps array.
>>>
>>>>      return ret;
>>>>  #else
>>>>      return -ENOTSUP;
>>>> @@ -2355,6 +2474,8 @@ static int coroutine_fn raw_co_prw(BlockDriver=
State *bs, uint64_t offset,
>>>>          },
>>>>      };
>>>>
>>>> +    BlockZoneWps *wps =3D bs->bl.wps;
>>>> +    acb.io.wps =3D wps;
>>>
>>> You do not need the pws variable. Simply do:
>>>
>>>        acb.io.wps =3D bs->bl.wps;
>>>
>>>>      assert(qiov->size =3D=3D bytes);
>>>>      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>>>>  }
>>>> @@ -2465,6 +2586,12 @@ static void raw_close(BlockDriverState *bs)
>>>>      BDRVRawState *s =3D bs->opaque;
>>>>
>>>>      if (s->fd >=3D 0) {
>>>> +#if defined(CONFIG_BLKZONED)
>>>> +        if (bs->bl.wps) {
>>>> +            qemu_mutex_destroy(&bs->bl.wps->lock);
>>>> +            g_free(bs->bl.wps);
>>>> +        }
>>>> +#endif
>>>>          qemu_close(s->fd);
>>>>          s->fd =3D -1;
>>>>      }
>>>> @@ -3299,6 +3426,11 @@ static int coroutine_fn raw_co_zone_mgmt(Bloc=
kDriverState *bs, BlockZoneOp op,
>>>>          zone_op_name =3D "BLKRESETZONE";
>>>>          zone_op =3D BLKRESETZONE;
>>>>          break;
>>>> +    case BLK_ZO_RESET_ALL:
>>>> +        zone_op_name =3D "BLKRESETZONE";
>>>> +        zone_op =3D BLKRESETZONE;
>>>> +        is_all =3D true;
>>>> +        break;
>>>
>>> This change seems unrelated to the wp tracking. Different patch ?
>>>
>>>>      default:
>>>>          g_assert_not_reached();
>>>>      }
>>>> diff --git a/include/block/block-common.h b/include/block/block-comm=
on.h
>>>> index 8efb6b0c43..43bfc484eb 100644
>>>> --- a/include/block/block-common.h
>>>> +++ b/include/block/block-common.h
>>>> @@ -58,6 +58,7 @@ typedef enum BlockZoneOp {
>>>>      BLK_ZO_CLOSE,
>>>>      BLK_ZO_FINISH,
>>>>      BLK_ZO_RESET,
>>>> +    BLK_ZO_RESET_ALL,
>>>
>>> same here. Adding reset all support should be a different patch.
>>>>  } BlockZoneOp;
>>>>
>>>>  typedef enum BlockZoneModel {
>>>> @@ -96,6 +97,14 @@ typedef struct BlockZoneDescriptor {
>>>>      BlockZoneCondition cond;
>>>>  } BlockZoneDescriptor;
>>>>
>>>> +/*
>>>> + * Track write pointers of a zone in bytes.
>>>> + */
>>>> +typedef struct BlockZoneWps {
>>>> +    QemuMutex lock;
>>>> +    uint64_t wp[];
>>>> +} BlockZoneWps;
>>>> +
>>>>  typedef struct BlockDriverInfo {
>>>>      /* in bytes, 0 if irrelevant */
>>>>      int cluster_size;
>>>> @@ -209,6 +218,13 @@ typedef enum {
>>>>  #define BDRV_SECTOR_BITS   9
>>>>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>>>>
>>>> +/*
>>>> + * Get the first most significant bit of WP. If it is zero, then
>>>> + * the zone type is SWR.
>>>> + */
>>>> +#define BDRV_ZT_IS_SWR(WP)    ((WP & 0x8000000000000000) =3D=3D 0) =
? (true) : \
>>>> +                              (false)
>>>
>>> Simplify:
>>>
>>> #define BDRV_ZT_IS_SWR(wp)    (!((wp) & (1ULL << 63))
>>>
>>> But since this must be used for both SWR and SWP zones, I would rever=
se
>>> this into:
>>>
>>> #define BDRV_ZONE_IS_CONV(wp) ((wp) & (1ULL << 63))
>>>
>>> Which is a lot simpler.
>>>
>>>> +
>>>>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_=
BITS, \
>>>>                                             INT_MAX >> BDRV_SECTOR_B=
ITS)
>>>>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SE=
CTOR_BITS)
>>>> diff --git a/include/block/block_int-common.h b/include/block/block_=
int-common.h
>>>> index 37dddc603c..59c2d1316d 100644
>>>> --- a/include/block/block_int-common.h
>>>> +++ b/include/block/block_int-common.h
>>>> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
>>>>
>>>>      /* device capacity expressed in bytes */
>>>>      int64_t capacity;
>>>> +
>>>> +    /* array of write pointers' location of each zone in the zoned =
device. */
>>>> +    BlockZoneWps *wps;
>>>> +
>>>> +    int64_t write_granularity;
>>>>  } BlockLimits;
>>>>
>>>>  typedef struct BdrvOpBlocker BdrvOpBlocker;
>>>> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>>>> index 3d26929cdd..f13cc1887b 100644
>>>> --- a/include/block/raw-aio.h
>>>> +++ b/include/block/raw-aio.h
>>>> @@ -31,6 +31,7 @@
>>>>  #define QEMU_AIO_TRUNCATE     0x0080
>>>>  #define QEMU_AIO_ZONE_REPORT  0x0100
>>>>  #define QEMU_AIO_ZONE_MGMT    0x0200
>>>> +#define QEMU_AIO_ZONE_APPEND  0x0400
>>>>  #define QEMU_AIO_TYPE_MASK \
>>>>          (QEMU_AIO_READ | \
>>>>           QEMU_AIO_WRITE | \
>>>> @@ -41,7 +42,8 @@
>>>>           QEMU_AIO_COPY_RANGE | \
>>>>           QEMU_AIO_TRUNCATE  | \
>>>>           QEMU_AIO_ZONE_REPORT | \
>>>> -         QEMU_AIO_ZONE_MGMT)
>>>> +         QEMU_AIO_ZONE_MGMT | \
>>>> +         QEMU_AIO_ZONE_APPEND)
>>>
>>> This should be introduced in patch 2. This patch should be only about=
 zone
>>> wp tracking with regular writes and zone management ops. The second p=
atch
>>> can implement zone append emulation thanks to this patch. So separate=
.
>>>
>>>>
>>>>  /* AIO flags */
>>>>  #define QEMU_AIO_MISALIGNED   0x1000
>>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research
>>

--=20
Damien Le Moal
Western Digital Research


