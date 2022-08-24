Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E95A04D6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 01:49:40 +0200 (CEST)
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR07v-0002jU-5k
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 19:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2287b66a8=damien.lemoal@opensource.wdc.com>)
 id 1oR05l-0000c5-LK
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:47:25 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:21285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2287b66a8=damien.lemoal@opensource.wdc.com>)
 id 1oR05b-0002CF-D6
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661384835; x=1692920835;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8tXhZpdmFo/FoIMKmQwRt6RsFCnCGUoA8lv9CwYGBH8=;
 b=c30J+54MkwIyBs+ylsm5/jYsCxRoHIX9HQ3onhbLv/C6E3LE8ONWw/6e
 EcnAtHerL0v7qZa5SlS2/Nr+pfkaA9XHAlRubV4kQGTa2dYDl6dqAvmzE
 +H/jn0tF9KSuYWEOvlSmcRYEnxkv1pMBrgdmEqMLg/jW4VOQDFz+OPF+i
 r94ydmLI6QgdIbJSgv7KoPVexBfeQCiu1GYzB/Gxpn7tUJQupzs2CU3rZ
 xYJGrQ/u/OhmCAQ24u72wvtTdKHs4sktuSw8XZdsM0ynaprxfUf6MqjNY
 vPfE2tD8ZCpEXXaTibJItSgyx2IV+eGV4GAm2bj2s1tL98sbYJH1Nit9W A==;
X-IronPort-AV: E=Sophos;i="5.93,261,1654531200"; d="scan'208";a="313868316"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Aug 2022 07:47:02 +0800
IronPort-SDR: h2O+SkrnXOvYHZa+oSjQhtADwXNr6GfwP9NkXJPfMR4Jai+ZxZl6gXtfjZEJ0MlbRE7nvEHOL6
 5GGU5LMNUUhdxhCEjd2NyiJZfA86SiiC+/MtYW1gHuUz9no/qXeNRPeahAmNow/iTM/kzykrw7
 dI4cU0vg8Tb+hAbxhYSv6+j0ecdMFfH2e0w2VdOkjzhN1997XX019p9pwgVo3jxc1FDmusXrW8
 UHGqaiDiQkeiTcC9kPIsUPKdwvwrfKkW9yJEeBggFLp1cO/KmOwGBJtjzrVfpgmXccr4Y60xK2
 A5PRjlxLc9mwpQvwXUC+Zlxx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 16:07:40 -0700
IronPort-SDR: U9icv1GymCoOhGCtUsLx0sJnhHN7I1IC37wTllQt0yKXr1sWYBHHSdrBkyLAaRiO8LSaAq6piY
 oVANFJHWV891K59vqnZmvr0daT192UnpP0Pcmmxc4fEB5kz/VhYbAHZ3GoiuQLQEeo0gN0Tf4J
 FY7lGRJ5PbLunhSedvHHYrGWPqVWmYx8Vtvqa0AnoeEaaSHp08XxCc+CSVMXspRZaiIH+0Z35G
 8gI9HXG3g+yCaiABvI3eyqYju6lbZxCr/VPJB5793QB/EEbu83AlYuYdiEmF5pAMES5wnKhVvN
 6Y8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 16:47:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MCjS54fRRz1Rwry
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 16:47:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1661384817; x=1663976818; bh=8tXhZpdmFo/FoIMKmQwRt6RsFCnCGUoA8lv
 9CwYGBH8=; b=oMszdqX4Iw1SKNB/g6qb/KP0ZkghqerGKqAFbFLj2tXAZryC3k4
 +qInkeVSMVjUPfD1jiDLBRPcDBzyF80gbbEdyXs2d0MK95dN+piKHXs2XgTJ/bqi
 JeJnpEJO/eurC+by5jLmF17qPFEanf6HKrEt8FemewBNCUeamKSRzng8P/UtuY60
 04ZOiynCqoe5wrGR3MgbruTPza9Pgz1na9D6TdUBjAw+E6vigfChGaxgMYzsr4c9
 mM9rhscxiPcmFj1n9yJ7nJrUlcbA1fZ7OxkXLlSiO9LVaSDg7v7f+yeDWCCglY9Y
 Hisb6UVTEBx69Z+ShDc2ukrB8LoGjdztwxg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Dh5ntEKrICMe for <qemu-devel@nongnu.org>;
 Wed, 24 Aug 2022 16:46:57 -0700 (PDT)
Received: from [10.89.82.240] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.82.240])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MCjRy1XjGz1RtVk;
 Wed, 24 Aug 2022 16:46:53 -0700 (PDT)
Message-ID: <3869f149-3fd9-8885-7afe-f3e94050e52e@opensource.wdc.com>
Date: Wed, 24 Aug 2022 16:46:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 4/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 qemu block <qemu-block@nongnu.org>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-5-faithilikerun@gmail.com> <YwQkAs3+aUAvarMA@fedora>
 <CAAAx-8Jk1d4wO5bfNPOLb_XStOC8Bz07kxVbBC3f9-+u3ZxXqA@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8Jk1d4wO5bfNPOLb_XStOC8Bz07kxVbBC3f9-+u3ZxXqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2287b66a8=damien.lemoal@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

On 2022/08/22 21:12, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=882=
3=E6=97=A5=E5=91=A8=E4=BA=8C 08:49=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Tue, Aug 16, 2022 at 02:25:18PM +0800, Sam Li wrote:
>>> By adding zone management operations in BlockDriver, storage controll=
er
>>> emulation can use the new block layer APIs including Report Zone and
>>> four zone management operations (open, close, finish, reset).
>>>
>>> Add zoned storage commands of the device: zone_report(zrp), zone_open=
(zo),
>>> zone_close(zc), zone_reset(zrs), zone_finish(zf).
>>>
>>> For example, to test zone_report, use following command:
>>> $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filename=3D=
/dev/nullb0
>>> -c "zrp offset nr_zones"
>>>
>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>  block/block-backend.c             |  50 +++++
>>>  block/file-posix.c                | 341 ++++++++++++++++++++++++++++=
+-
>>>  block/io.c                        |  41 ++++
>>>  include/block/block-common.h      |   1 -
>>>  include/block/block-io.h          |  13 ++
>>>  include/block/block_int-common.h  |  22 +-
>>>  include/block/raw-aio.h           |   6 +-
>>>  include/sysemu/block-backend-io.h |   6 +
>>>  meson.build                       |   1 +
>>>  qapi/block-core.json              |   8 +-
>>>  qemu-io-cmds.c                    | 143 +++++++++++++
>>>  11 files changed, 625 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>> index d4a5df2ac2..fc639b0cd7 100644
>>> --- a/block/block-backend.c
>>> +++ b/block/block-backend.c
>>> @@ -1775,6 +1775,56 @@ int coroutine_fn blk_co_flush(BlockBackend *bl=
k)
>>>      return ret;
>>>  }
>>>
>>> +/*
>>> + * Send a zone_report command.
>>> + * offset is a byte offset from the start of the device. No alignmen=
t
>>> + * required for offset.
>>> + * nr_zones represents IN maximum and OUT actual.
>>> + */
>>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offse=
t,
>>> +                                    unsigned int *nr_zones,
>>> +                                    BlockZoneDescriptor *zones)
>>> +{
>>> +    int ret;
>>> +    IO_CODE();
>>> +
>>> +    blk_inc_in_flight(blk); /* increase before waiting */
>>> +    blk_wait_while_drained(blk);
>>> +    if (!blk_is_available(blk)) {
>>> +        blk_dec_in_flight(blk);
>>> +        return -ENOMEDIUM;
>>> +    }
>>> +    ret =3D bdrv_co_zone_report(blk_bs(blk), offset, nr_zones, zones=
);
>>> +    blk_dec_in_flight(blk);
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * Send a zone_management command.
>>> + * offset is the starting zone specified as a sector offset.
>>> + * len is the maximum number of sectors the command should operate o=
n.
>>> + */
>>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>>> +        int64_t offset, int64_t len)
>>> +{
>>> +    int ret;
>>> +    IO_CODE();
>>> +
>>> +    ret =3D blk_check_byte_request(blk, offset, len);
>>> +    if (ret < 0) {
>>> +        return ret;
>>> +    }
>>
>> blk_check_byte_request() calls blk_is_available() and returns -ENOMEDI=
UM
>> when it fails. You can therefore move this down and replace "if
>> (!blk_is_available(blk)) {".
>>
>>> +    blk_inc_in_flight(blk);
>>> +    blk_wait_while_drained(blk);
>>> +    if (!blk_is_available(blk)) {
>>> +        blk_dec_in_flight(blk);
>>> +        return -ENOMEDIUM;
>>> +    }
>>> +    ret =3D bdrv_co_zone_mgmt(blk_bs(blk), op, offset, len);
>>> +    blk_dec_in_flight(blk);
>>> +    return ret;
>>> +}
>>> +
>>>  void blk_drain(BlockBackend *blk)
>>>  {
>>>      BlockDriverState *bs =3D blk_bs(blk);
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index 727389488c..29f67082d9 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -67,6 +67,9 @@
>>>  #include <sys/param.h>
>>>  #include <sys/syscall.h>
>>>  #include <sys/vfs.h>
>>> +#if defined(CONFIG_BLKZONED)
>>> +#include <linux/blkzoned.h>
>>> +#endif
>>>  #include <linux/cdrom.h>
>>>  #include <linux/fd.h>
>>>  #include <linux/fs.h>
>>> @@ -216,6 +219,13 @@ typedef struct RawPosixAIOData {
>>>              PreallocMode prealloc;
>>>              Error **errp;
>>>          } truncate;
>>> +        struct {
>>> +            unsigned int *nr_zones;
>>> +            BlockZoneDescriptor *zones;
>>> +        } zone_report;
>>> +        struct {
>>> +            unsigned long ioctl_op;
>>> +        } zone_mgmt;
>>>      };
>>>  } RawPosixAIOData;
>>>
>>> @@ -1328,7 +1338,7 @@ static void raw_refresh_limits(BlockDriverState=
 *bs, Error **errp)
>>>  #endif
>>>
>>>      if (bs->sg || S_ISBLK(st.st_mode)) {
>>> -        int ret =3D hdev_get_max_hw_transfer(s->fd, &st);
>>> +        ret =3D hdev_get_max_hw_transfer(s->fd, &st);
>>>
>>>          if (ret > 0 && ret <=3D BDRV_REQUEST_MAX_BYTES) {
>>>              bs->bl.max_hw_transfer =3D ret;
>>> @@ -1340,11 +1350,32 @@ static void raw_refresh_limits(BlockDriverSta=
te *bs, Error **errp)
>>>          }
>>>      }
>>>
>>> -    ret =3D get_sysfs_zoned_model(s->fd, &st, &zoned);
>>> +    ret =3D get_sysfs_zoned_model(&st, &zoned);
>>>      if (ret < 0) {
>>>          zoned =3D BLK_Z_NONE;
>>>      }
>>>      bs->bl.zoned =3D zoned;
>>> +    if (zoned !=3D BLK_Z_NONE) {
>>> +        ret =3D get_sysfs_long_val(&st, "chunk_sectors");
>>> +        if (ret > 0) {
>>> +            bs->bl.zone_sectors =3D ret;
>>> +        }
>>> +
>>> +        ret =3D get_sysfs_long_val(&st, "zone_append_max_bytes");
>>> +        if (ret > 0) {
>>> +            bs->bl.zone_append_max_bytes =3D ret;
>>> +        }
>>> +
>>> +        ret =3D get_sysfs_long_val(&st, "max_open_zones");
>>> +        if (ret > 0) {
>>> +            bs->bl.max_open_zones =3D ret;
>>> +        }
>>> +
>>> +        ret =3D get_sysfs_long_val(&st, "max_active_zones");
>>> +        if (ret > 0) {
>>> +            bs->bl.max_active_zones =3D ret;
>>> +        }
>>> +    }
>>>  }
>>>
>>>  static int check_for_dasd(int fd)
>>> @@ -1839,6 +1870,134 @@ static off_t copy_file_range(int in_fd, off_t=
 *in_off, int out_fd,
>>>  }
>>>  #endif
>>>
>>> +/*
>>> + * parse_zone - Fill a zone descriptor
>>> + */
>>> +#if defined(CONFIG_BLKZONED)
>>> +static inline void parse_zone(struct BlockZoneDescriptor *zone,
>>> +                              struct blk_zone *blkz) {
>>
>> Declaring the second argument "const struct blk_zone *blkz" would make
>> it clear that this function converts from blk_zone to
>> BlockZoneDescriptor.
>>
>>> +    zone->start =3D blkz->start;
>>> +    zone->length =3D blkz->len;
>>> +    zone->cap =3D blkz->capacity;
>>> +    zone->wp =3D blkz->wp;
>>> +
>>> +    switch (blkz->type) {
>>> +    case BLK_ZONE_TYPE_SEQWRITE_REQ:
>>> +        zone->type =3D BLK_ZT_SWR;
>>> +        break;
>>> +    case BLK_ZONE_TYPE_SEQWRITE_PREF:
>>> +        zone->type =3D BLK_ZT_SWP;
>>> +        break;
>>> +    case BLK_ZONE_TYPE_CONVENTIONAL:
>>> +        zone->type =3D BLK_ZT_CONV;
>>> +        break;
>>> +    default:
>>> +        error_report("Invalid zone type: 0x%x", blkz->type);
>>
>> Or g_assert_not_reached() to indicate that this should never happen. I=
f
>> it does happen the process will call abort(3) and it will terminate wi=
th
>> a coredump file for debugging.
>>
>>> +    }
>>> +
>>> +    switch (blkz->cond) {
>>> +    case BLK_ZONE_COND_NOT_WP:
>>> +        zone->cond =3D BLK_ZS_NOT_WP;
>>> +        break;
>>> +    case BLK_ZONE_COND_EMPTY:
>>> +        zone->cond =3D BLK_ZS_EMPTY;
>>> +        break;
>>> +    case BLK_ZONE_COND_IMP_OPEN:
>>> +        zone->cond =3DBLK_ZS_IOPEN;
>>> +        break;
>>> +    case BLK_ZONE_COND_EXP_OPEN:
>>> +        zone->cond =3D BLK_ZS_EOPEN;
>>> +        break;
>>> +    case BLK_ZONE_COND_CLOSED:
>>> +        zone->cond =3D BLK_ZS_CLOSED;
>>> +        break;
>>> +    case BLK_ZONE_COND_READONLY:
>>> +        zone->cond =3D BLK_ZS_RDONLY;
>>> +        break;
>>> +    case BLK_ZONE_COND_FULL:
>>> +        zone->cond =3D BLK_ZS_FULL;
>>> +        break;
>>> +    case BLK_ZONE_COND_OFFLINE:
>>> +        zone->cond =3D BLK_ZS_OFFLINE;
>>> +        break;
>>> +    default:
>>> +        error_report("Invalid zone condition 0x%x", blkz->cond);
>>
>> Same here.
>>
>>> +    }
>>> +}
>>> +#endif
>>> +
>>> +static int handle_aiocb_zone_report(void *opaque) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +    RawPosixAIOData *aiocb =3D opaque;
>>> +    int fd =3D aiocb->aio_fildes;
>>> +    unsigned int *nr_zones =3D aiocb->zone_report.nr_zones;
>>> +    BlockZoneDescriptor *zones =3D aiocb->zone_report.zones;
>>> +    int64_t sector =3D aiocb->aio_offset;
>>> +
>>> +    struct blk_zone *blkz;
>>> +    int64_t rep_size;
>>> +    unsigned int nrz;
>>> +    int ret, n =3D 0, i =3D 0;
>>> +
>>> +    nrz =3D *nr_zones;
>>> +    rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struc=
t blk_zone);
>>> +    g_autofree struct blk_zone_report *rep =3D NULL;
>>> +    rep =3D g_malloc(rep_size);
>>> +
>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>> +    while (n < nrz) {
>>> +        memset(rep, 0, rep_size);
>>> +        rep->sector =3D sector;
>>> +        rep->nr_zones =3D nrz - n;
>>> +
>>> +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
>>
>> Does this ioctl() need "do { ... } while (ret =3D=3D -1 && errno =3D=3D=
 EINTR)"?
>=20
> No? We discussed this before. I guess even EINTR should be propagated
> back to the guest. Maybe Damien can talk more about why.

In the kernel, completion of zone management IO requests are waited for u=
sing
wait_for_completion_io() which uses TASK_UNINTERRUPTIBLE. So a signal wil=
l not
abort anything. So I do not think that the do { } while() loop is necessa=
ry.

>=20
>>
>>> +        if (ret !=3D 0) {
>>> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " fai=
led %d",
>>> +                         fd, sector, errno);
>>> +            return -errno;
>>> +        }
>>> +
>>> +        if (!rep->nr_zones) {
>>> +            break;
>>> +        }
>>> +
>>> +        for (i =3D 0; i < rep->nr_zones; i++, n++) {
>>> +            parse_zone(&zones[n], &blkz[i]);
>>> +            /* The next report should start after the last zone repo=
rted */
>>> +            sector =3D blkz[i].start + blkz[i].len;
>>> +        }
>>> +    }
>>> +
>>> +    *nr_zones =3D n;
>>> +    return 0;
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}
>>> +
>>> +static int handle_aiocb_zone_mgmt(void *opaque) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +    RawPosixAIOData *aiocb =3D opaque;
>>> +    int fd =3D aiocb->aio_fildes;
>>> +    int64_t sector =3D aiocb->aio_offset;
>>> +    int64_t nr_sectors =3D aiocb->aio_nbytes;
>>> +    unsigned long ioctl_op =3D aiocb->zone_mgmt.ioctl_op;
>>> +    struct blk_zone_range range;
>>> +    int ret;
>>> +
>>> +    /* Execute the operation */
>>> +    range.sector =3D sector;
>>> +    range.nr_sectors =3D nr_sectors;
>>> +    do {
>>> +        ret =3D ioctl(fd, ioctl_op, &range);
>>> +    } while (ret !=3D 0 && errno =3D=3D EINTR);
>>> +
>>> +    return ret;
>>
>>   if (ret < 0) {
>>       return -errno;
>>   }
>>   return 0;
>>
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}
>>> +
>>>  static int handle_aiocb_copy_range(void *opaque)
>>>  {
>>>      RawPosixAIOData *aiocb =3D opaque;
>>> @@ -3011,6 +3170,124 @@ static void raw_account_discard(BDRVRawState =
*s, uint64_t nbytes, int ret)
>>>      }
>>>  }
>>>
>>> +/*
>>> + * zone report - Get a zone block device's information in the form
>>> + * of an array of zone descriptors.
>>> + *
>>> + * @param bs: passing zone block device file descriptor
>>> + * @param zones: an array of zone descriptors to hold zone
>>> + * information on reply
>>> + * @param offset: offset can be any byte within the zone size.
>>> + * @param len: (not sure yet.
>>> + * @return 0 on success, -1 on failure
>>> + */
>>> +static int coroutine_fn raw_co_zone_report(BlockDriverState *bs, int=
64_t offset,
>>> +                                           unsigned int *nr_zones,
>>> +                                           BlockZoneDescriptor *zone=
s) {
>>> +#if defined(CONFIG_BLKZONED)
>>> +    BDRVRawState *s =3D bs->opaque;
>>> +    RawPosixAIOData acb;
>>> +
>>> +    acb =3D (RawPosixAIOData) {
>>> +        .bs         =3D bs,
>>> +        .aio_fildes =3D s->fd,
>>> +        .aio_type   =3D QEMU_AIO_ZONE_REPORT,
>>> +        /* zoned block devices use 512-byte sectors */
>>> +        .aio_offset =3D offset / 512,
>>> +        .zone_report    =3D {
>>> +                .nr_zones       =3D nr_zones,
>>> +                .zones          =3D zones,
>>> +        },
>>> +    };
>>> +
>>> +    return raw_thread_pool_submit(bs, handle_aiocb_zone_report, &acb=
);
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}
>>> +
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
>>> +    const char *ioctl_name;
>>> +    unsigned long ioctl_op;
>>> +    int ret;
>>> +
>>> +    struct stat st;
>>> +    if (fstat(s->fd, &st) < 0) {
>>> +        ret =3D -errno;
>>> +        return ret;
>>> +    }
>>> +    zone_sector =3D get_sysfs_long_val(&st, "chunk_sectors");
>>> +    if (zone_sector < 0) {
>>> +        error_report("invalid zone sector size %" PRId64 "", zone_se=
ctor);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    zone_sector_mask =3D zone_sector - 1;
>>> +    if (offset & zone_sector_mask) {
>>> +        error_report("sector offset %" PRId64 " is not aligned to zo=
ne size "
>>> +                     "%" PRId64 "", offset, zone_sector);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (len & zone_sector_mask) {
>>> +        error_report("number of sectors %" PRId64 " is not aligned t=
o zone size"
>>> +                      " %" PRId64 "", len, zone_sector);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    switch (op) {
>>> +    case BLK_ZO_OPEN:
>>> +        ioctl_name =3D "BLKOPENZONE";
>>> +        ioctl_op =3D BLKOPENZONE;
>>> +        break;
>>> +    case BLK_ZO_CLOSE:
>>> +        ioctl_name =3D "BLKCLOSEZONE";
>>> +        ioctl_op =3D BLKCLOSEZONE;
>>> +        break;
>>> +    case BLK_ZO_FINISH:
>>> +        ioctl_name =3D "BLKFINISHZONE";
>>> +        ioctl_op =3D BLKFINISHZONE;
>>> +        break;
>>> +    case BLK_ZO_RESET:
>>> +        ioctl_name =3D "BLKRESETZONE";
>>> +        ioctl_op =3D BLKRESETZONE;
>>> +        break;
>>> +    default:
>>> +        error_report("Invalid zone operation 0x%x", op);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    acb =3D (RawPosixAIOData) {
>>> +        .bs             =3D bs,
>>> +        .aio_fildes     =3D s->fd,
>>> +        .aio_type       =3D QEMU_AIO_ZONE_MGMT,
>>> +        .aio_offset     =3D offset,
>>> +        .aio_nbytes     =3D len,
>>> +        .zone_mgmt  =3D {
>>> +                .ioctl_op =3D ioctl_op,
>>> +        },
>>> +    };
>>> +
>>> +    ret =3D raw_thread_pool_submit(bs, handle_aiocb_zone_mgmt, &acb)=
;
>>> +    if (ret !=3D 0) {
>>> +        error_report("ioctl %s failed %d", ioctl_name, errno);
>>> +        return -errno;
>>> +    }
>>> +
>>> +    return ret;
>>> +#else
>>> +    return -ENOTSUP;
>>> +#endif
>>> +}
>>> +
>>>  static coroutine_fn int
>>>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>>>                  bool blkdev)
>>> @@ -3511,6 +3788,14 @@ static void hdev_parse_filename(const char *fi=
lename, QDict *options,
>>>      bdrv_parse_filename_strip_prefix(filename, "host_device:", optio=
ns);
>>>  }
>>>
>>> +#if defined(CONFIG_BLKZONED)
>>> +static void zoned_host_device_parse_filename(const char *filename, Q=
Dict *options,
>>> +                                Error **errp)
>>> +{
>>> +    bdrv_parse_filename_strip_prefix(filename, "zoned_host_device:",=
 options);
>>> +}
>>> +#endif
>>
>> Sorry, I asked you to add this function but I've changed my mind and I
>> think it should not be present. .bdrv_parse_filename() helps legacy
>> drivers convert arguments into QDict *options. But this is a new drive=
r
>> that no one expects to work with string filenames. Therefore
>> .bdrv_parse_filename can be dropped.
>>
>>> +
>>>  static bool hdev_is_sg(BlockDriverState *bs)
>>>  {
>>>
>>> @@ -3741,6 +4026,55 @@ static BlockDriver bdrv_host_device =3D {
>>>  #endif
>>>  };
>>>
>>> +#if defined(CONFIG_BLKZONED)
>>> +static BlockDriver bdrv_zoned_host_device =3D {
>>> +        .format_name =3D "zoned_host_device",
>>> +        .protocol_name =3D "zoned_host_device",
>>> +        .instance_size =3D sizeof(BDRVRawState),
>>> +        .bdrv_needs_filename =3D true,
>>> +        .bdrv_probe_device  =3D hdev_probe_device,
>>> +        .bdrv_parse_filename =3D zoned_host_device_parse_filename,
>>> +        .bdrv_file_open     =3D hdev_open,
>>> +        .bdrv_close         =3D raw_close,
>>> +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
>>> +        .bdrv_reopen_commit  =3D raw_reopen_commit,
>>> +        .bdrv_reopen_abort   =3D raw_reopen_abort,
>>> +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
>>> +        .create_opts         =3D &bdrv_create_opts_simple,
>>> +        .mutable_opts        =3D mutable_opts,
>>> +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
>>> +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
>>> +
>>> +        .bdrv_co_preadv         =3D raw_co_preadv,
>>> +        .bdrv_co_pwritev        =3D raw_co_pwritev,
>>> +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
>>> +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
>>> +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
>>> +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
>>> +        .bdrv_refresh_limits =3D raw_refresh_limits,
>>> +        .bdrv_io_plug =3D raw_aio_plug,
>>> +        .bdrv_io_unplug =3D raw_aio_unplug,
>>> +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
>>> +
>>> +        .bdrv_co_truncate       =3D raw_co_truncate,
>>> +        .bdrv_getlength =3D raw_getlength,
>>> +        .bdrv_get_info =3D raw_get_info,
>>> +        .bdrv_get_allocated_file_size
>>> +                            =3D raw_get_allocated_file_size,
>>> +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
>>> +        .bdrv_check_perm =3D raw_check_perm,
>>> +        .bdrv_set_perm   =3D raw_set_perm,
>>> +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
>>> +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
>>> +        .bdrv_probe_geometry =3D hdev_probe_geometry,
>>> +        .bdrv_co_ioctl =3D hdev_co_ioctl,
>>> +
>>> +        /* zone management operations */
>>> +        .bdrv_co_zone_report =3D raw_co_zone_report,
>>> +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>>> +};
>>> +#endif
>>> +
>>>  #if defined(__linux__) || defined(__FreeBSD__) || defined(__FreeBSD_=
kernel__)
>>>  static void cdrom_parse_filename(const char *filename, QDict *option=
s,
>>>                                   Error **errp)
>>> @@ -4001,6 +4335,9 @@ static void bdrv_file_init(void)
>>>      bdrv_register(&bdrv_file);
>>>  #if defined(HAVE_HOST_BLOCK_DEVICE)
>>>      bdrv_register(&bdrv_host_device);
>>> +#if defined(CONFIG_BLKZONED)
>>> +    bdrv_register(&bdrv_zoned_host_device);
>>> +#endif
>>>  #ifdef __linux__
>>>      bdrv_register(&bdrv_host_cdrom);
>>>  #endif
>>> diff --git a/block/io.c b/block/io.c
>>> index 0a8cbefe86..de9ec1d740 100644
>>> --- a/block/io.c
>>> +++ b/block/io.c
>>> @@ -3198,6 +3198,47 @@ out:
>>>      return co.ret;
>>>  }
>>>
>>> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
>>> +                        unsigned int *nr_zones,
>>> +                        BlockZoneDescriptor *zones)
>>> +{
>>> +    BlockDriver *drv =3D bs->drv;
>>> +    CoroutineIOCompletion co =3D {
>>> +            .coroutine =3D qemu_coroutine_self(),
>>> +    };
>>> +    IO_CODE();
>>> +
>>> +    bdrv_inc_in_flight(bs);
>>> +    if (!drv || !drv->bdrv_co_zone_report) {
>>> +        co.ret =3D -ENOTSUP;
>>> +        goto out;
>>> +    }
>>> +    co.ret =3D drv->bdrv_co_zone_report(bs, offset, nr_zones, zones)=
;
>>> +out:
>>> +    bdrv_dec_in_flight(bs);
>>> +    return co.ret;
>>> +}
>>> +
>>> +int bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>>> +        int64_t offset, int64_t len)
>>> +{
>>> +    BlockDriver *drv =3D bs->drv;
>>> +    CoroutineIOCompletion co =3D {
>>> +            .coroutine =3D qemu_coroutine_self(),
>>> +    };
>>> +    IO_CODE();
>>> +
>>> +    bdrv_inc_in_flight(bs);
>>> +    if (!drv || !drv->bdrv_co_zone_mgmt) {
>>> +        co.ret =3D -ENOTSUP;
>>> +        goto out;
>>> +    }
>>> +    co.ret =3D drv->bdrv_co_zone_mgmt(bs, op, offset, len);
>>> +out:
>>> +    bdrv_dec_in_flight(bs);
>>> +    return co.ret;
>>> +}
>>> +
>>>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>>>  {
>>>      IO_CODE();
>>> diff --git a/include/block/block-common.h b/include/block/block-commo=
n.h
>>> index 36bd0e480e..5102fa6858 100644
>>> --- a/include/block/block-common.h
>>> +++ b/include/block/block-common.h
>>> @@ -23,7 +23,6 @@
>>>   */
>>>  #ifndef BLOCK_COMMON_H
>>>  #define BLOCK_COMMON_H
>>> -
>>>  #include "block/aio.h"
>>>  #include "block/aio-wait.h"
>>>  #include "qemu/iov.h"
>>
>> Unrelated whitespace change. Please drop this.
>>
>>> diff --git a/include/block/block-io.h b/include/block/block-io.h
>>> index fd25ffa9be..55ad261e16 100644
>>> --- a/include/block/block-io.h
>>> +++ b/include/block/block-io.h
>>> @@ -88,6 +88,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, v=
oid *buf);
>>>  /* Ensure contents are flushed to disk.  */
>>>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>>>
>>> +/* Report zone information of zone block device. */
>>> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t o=
ffset,
>>> +                                     unsigned int *nr_zones,
>>> +                                     BlockZoneDescriptor *zones);
>>> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp=
 op,
>>> +                                   int64_t offset, int64_t len);
>>> +
>>>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes=
);
>>>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>>>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
>>> @@ -297,6 +304,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOV=
ector *qiov, int64_t pos);
>>>  int generated_co_wrapper
>>>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_=
t pos);
>>>
>>> +int generated_co_wrapper
>>> +blk_zone_report(BlockBackend *blk, int64_t offset, unsigned int *nr_=
zones,
>>> +                BlockZoneDescriptor *zones);
>>> +int generated_co_wrapper
>>> +blk_zone_mgmt(BlockBackend *blk, BlockZoneOp op, int64_t offset, int=
64_t len);
>>> +
>>>  /**
>>>   * bdrv_parent_drained_begin_single:
>>>   *
>>> diff --git a/include/block/block_int-common.h b/include/block/block_i=
nt-common.h
>>> index 7f7863cc9e..de44c7b6f4 100644
>>> --- a/include/block/block_int-common.h
>>> +++ b/include/block/block_int-common.h
>>> @@ -94,7 +94,6 @@ typedef struct BdrvTrackedRequest {
>>>      struct BdrvTrackedRequest *waiting_for;
>>>  } BdrvTrackedRequest;
>>>
>>> -
>>>  struct BlockDriver {
>>>      /*
>>>       * These fields are initialized when this object is created,
>>
>> Unrelated whitespace change. Please drop this.
>>
>>> @@ -691,6 +690,12 @@ struct BlockDriver {
>>>                                            QEMUIOVector *qiov,
>>>                                            int64_t pos);
>>>
>>> +    int coroutine_fn (*bdrv_co_zone_report)(BlockDriverState *bs,
>>> +            int64_t offset, unsigned int *nr_zones,
>>> +            BlockZoneDescriptor *zones);
>>> +    int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, Bloc=
kZoneOp op,
>>> +            int64_t offset, int64_t len);
>>> +
>>>      /* removable device specific */
>>>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>>>      void (*bdrv_eject)(BlockDriverState *bs, bool eject_flag);
>>> @@ -828,6 +833,21 @@ typedef struct BlockLimits {
>>>
>>>      /* device zone model */
>>>      BlockZoneModel zoned;
>>> +
>>> +    /* zone size expressed in 512-byte sectors */
>>> +    uint32_t zone_sectors;
>>> +
>>> +    /* total number of zones */
>>> +    unsigned int nr_zones;
>>> +
>>> +    /* maximum size in bytes of a zone append write operation */
>>> +    int64_t zone_append_max_bytes;
>>> +
>>> +    /* maximum number of open zones */
>>> +    int64_t max_open_zones;
>>> +
>>> +    /* maximum number of active zones */
>>> +    int64_t max_active_zones;
>>>  } BlockLimits;
>>>
>>>  typedef struct BdrvOpBlocker BdrvOpBlocker;
>>> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>>> index 21fc10c4c9..3d26929cdd 100644
>>> --- a/include/block/raw-aio.h
>>> +++ b/include/block/raw-aio.h
>>> @@ -29,6 +29,8 @@
>>>  #define QEMU_AIO_WRITE_ZEROES 0x0020
>>>  #define QEMU_AIO_COPY_RANGE   0x0040
>>>  #define QEMU_AIO_TRUNCATE     0x0080
>>> +#define QEMU_AIO_ZONE_REPORT  0x0100
>>> +#define QEMU_AIO_ZONE_MGMT    0x0200
>>>  #define QEMU_AIO_TYPE_MASK \
>>>          (QEMU_AIO_READ | \
>>>           QEMU_AIO_WRITE | \
>>> @@ -37,7 +39,9 @@
>>>           QEMU_AIO_DISCARD | \
>>>           QEMU_AIO_WRITE_ZEROES | \
>>>           QEMU_AIO_COPY_RANGE | \
>>> -         QEMU_AIO_TRUNCATE)
>>> +         QEMU_AIO_TRUNCATE  | \
>>> +         QEMU_AIO_ZONE_REPORT | \
>>> +         QEMU_AIO_ZONE_MGMT)
>>>
>>>  /* AIO flags */
>>>  #define QEMU_AIO_MISALIGNED   0x1000
>>> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block=
-backend-io.h
>>> index 50f5aa2e07..6e7df1d93b 100644
>>> --- a/include/sysemu/block-backend-io.h
>>> +++ b/include/sysemu/block-backend-io.h
>>> @@ -156,6 +156,12 @@ int generated_co_wrapper blk_pwrite_zeroes(Block=
Backend *blk, int64_t offset,
>>>  int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t off=
set,
>>>                                        int64_t bytes, BdrvRequestFlag=
s flags);
>>>
>>> +int coroutine_fn blk_co_zone_report(BlockBackend *blk, int64_t offse=
t,
>>> +                                    unsigned int *nr_zones,
>>> +                                    BlockZoneDescriptor *zones);
>>> +int coroutine_fn blk_co_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>>> +                                  int64_t offset, int64_t len);
>>> +
>>>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t off=
set,
>>>                                        int64_t bytes);
>>>  int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
>>> diff --git a/meson.build b/meson.build
>>> index 294e9a8f32..c3219b0e87 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -1883,6 +1883,7 @@ config_host_data.set('CONFIG_REPLICATION', get_=
option('live_block_migration').al
>>>  # has_header
>>>  config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
>>>  config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/ma=
gic.h'))
>>> +config_host_data.set('CONFIG_BLKZONED', cc.has_header('linux/blkzone=
d.h'))
>>>  config_host_data.set('CONFIG_VALGRIND_H', cc.has_header('valgrind/va=
lgrind.h'))
>>>  config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>>>  config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 2173e7734a..c6bbb7a037 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -2942,6 +2942,7 @@
>>>  # @compress: Since 5.0
>>>  # @copy-before-write: Since 6.2
>>>  # @snapshot-access: Since 7.0
>>> +# @zoned_host_device: Since 7.2
>>>  #
>>>  # Since: 2.9
>>>  ##
>>> @@ -2955,7 +2956,8 @@
>>>              'luks', 'nbd', 'nfs', 'null-aio', 'null-co', 'nvme', 'pa=
rallels',
>>>              'preallocate', 'qcow', 'qcow2', 'qed', 'quorum', 'raw', =
'rbd',
>>>              { 'name': 'replication', 'if': 'CONFIG_REPLICATION' },
>>> -            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat'=
 ] }
>>> +            'ssh', 'throttle', 'vdi', 'vhdx', 'vmdk', 'vpc', 'vvfat'=
,
>>> +            { 'name': 'zoned_host_device', 'if': 'CONFIG_BLKZONED' }=
 ] }
>>>
>>>  ##
>>>  # @BlockdevOptionsFile:
>>> @@ -4329,7 +4331,9 @@
>>>        'vhdx':       'BlockdevOptionsGenericFormat',
>>>        'vmdk':       'BlockdevOptionsGenericCOWFormat',
>>>        'vpc':        'BlockdevOptionsGenericFormat',
>>> -      'vvfat':      'BlockdevOptionsVVFAT'
>>> +      'vvfat':      'BlockdevOptionsVVFAT',
>>> +      'zoned_host_device': { 'type': 'BlockdevOptionsFile',
>>> +                             'if': 'CONFIG_BLKZONED' }
>>>    } }
>>>
>>>  ##
>>> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
>>> index 952dc940f1..687c3a624c 100644
>>> --- a/qemu-io-cmds.c
>>> +++ b/qemu-io-cmds.c
>>> @@ -1712,6 +1712,144 @@ static const cmdinfo_t flush_cmd =3D {
>>>      .oneline    =3D "flush all in-core file state to disk",
>>>  };
>>>
>>> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    int64_t offset;
>>> +    unsigned int nr_zones;
>>> +
>>> +    ++optind;
>>> +    offset =3D cvtnum(argv[optind]);
>>> +    ++optind;
>>> +    nr_zones =3D cvtnum(argv[optind]);
>>> +
>>> +    g_autofree BlockZoneDescriptor *zones =3D NULL;
>>> +    zones =3D g_new(BlockZoneDescriptor, nr_zones);
>>> +    ret =3D blk_zone_report(blk, offset, &nr_zones, zones);
>>> +    if (ret < 0) {
>>> +        printf("zone report failed: %s\n", strerror(-ret));
>>> +    } else {
>>> +        for (int i =3D 0; i < nr_zones; ++i) {
>>> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
>>> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
>>> +                   "zcond:%u, [type: %u]\n",
>>> +                   zones[i].start, zones[i].length, zones[i].cap, zo=
nes[i].wp,
>>> +                   zones[i].cond, zones[i].type);
>>> +        }
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static const cmdinfo_t zone_report_cmd =3D {
>>> +        .name =3D "zone_report",
>>> +        .altname =3D "zrp",
>>> +        .cfunc =3D zone_report_f,
>>> +        .argmin =3D 2,
>>> +        .argmax =3D 2,
>>> +        .args =3D "offset number",
>>> +        .oneline =3D "report zone information",
>>> +};
>>> +
>>> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    int64_t offset, len;
>>> +    ++optind;
>>> +    offset =3D cvtnum(argv[optind]);
>>> +    ++optind;
>>> +    len =3D cvtnum(argv[optind]);
>>> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_OPEN, offset, len);
>>> +    if (ret < 0) {
>>> +        printf("zone open failed: %s\n", strerror(-ret));
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static const cmdinfo_t zone_open_cmd =3D {
>>> +        .name =3D "zone_open",
>>> +        .altname =3D "zo",
>>> +        .cfunc =3D zone_open_f,
>>> +        .argmin =3D 2,
>>> +        .argmax =3D 2,
>>> +        .args =3D "offset len",
>>> +        .oneline =3D "explicit open a range of zones in zone block d=
evice",
>>> +};
>>> +
>>> +static int zone_close_f(BlockBackend *blk, int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    int64_t offset, len;
>>> +    ++optind;
>>> +    offset =3D cvtnum(argv[optind]);
>>> +    ++optind;
>>> +    len =3D cvtnum(argv[optind]);
>>> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_CLOSE, offset, len);
>>> +    if (ret < 0) {
>>> +        printf("zone close failed: %s\n", strerror(-ret));
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static const cmdinfo_t zone_close_cmd =3D {
>>> +        .name =3D "zone_close",
>>> +        .altname =3D "zc",
>>> +        .cfunc =3D zone_close_f,
>>> +        .argmin =3D 2,
>>> +        .argmax =3D 2,
>>> +        .args =3D "offset len",
>>> +        .oneline =3D "close a range of zones in zone block device",
>>> +};
>>> +
>>> +static int zone_finish_f(BlockBackend *blk, int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    int64_t offset, len;
>>> +    ++optind;
>>> +    offset =3D cvtnum(argv[optind]);
>>> +    ++optind;
>>> +    len =3D cvtnum(argv[optind]);
>>> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_FINISH, offset, len);
>>> +    if (ret < 0) {
>>> +        printf("zone finish failed: %s\n", strerror(-ret));
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static const cmdinfo_t zone_finish_cmd =3D {
>>> +        .name =3D "zone_finish",
>>> +        .altname =3D "zf",
>>> +        .cfunc =3D zone_finish_f,
>>> +        .argmin =3D 2,
>>> +        .argmax =3D 2,
>>> +        .args =3D "offset len",
>>> +        .oneline =3D "finish a range of zones in zone block device",
>>> +};
>>> +
>>> +static int zone_reset_f(BlockBackend *blk, int argc, char **argv)
>>> +{
>>> +    int ret;
>>> +    int64_t offset, len;
>>> +    ++optind;
>>> +    offset =3D cvtnum(argv[optind]);
>>> +    ++optind;
>>> +    len =3D cvtnum(argv[optind]);
>>> +    ret =3D blk_zone_mgmt(blk, BLK_ZO_RESET, offset, len);
>>> +    if (ret < 0) {
>>> +        printf("zone reset failed: %s\n", strerror(-ret));
>>> +    }
>>> +    return ret;
>>> +}
>>> +
>>> +static const cmdinfo_t zone_reset_cmd =3D {
>>> +        .name =3D "zone_reset",
>>> +        .altname =3D "zrs",
>>> +        .cfunc =3D zone_reset_f,
>>> +        .argmin =3D 2,
>>> +        .argmax =3D 2,
>>> +        .args =3D "offset len",
>>> +        .oneline =3D "reset a zone write pointer in zone block devic=
e",
>>> +};
>>> +
>>>  static int truncate_f(BlockBackend *blk, int argc, char **argv);
>>>  static const cmdinfo_t truncate_cmd =3D {
>>>      .name       =3D "truncate",
>>> @@ -2504,6 +2642,11 @@ static void __attribute((constructor)) init_qe=
muio_commands(void)
>>>      qemuio_add_command(&aio_write_cmd);
>>>      qemuio_add_command(&aio_flush_cmd);
>>>      qemuio_add_command(&flush_cmd);
>>> +    qemuio_add_command(&zone_report_cmd);
>>> +    qemuio_add_command(&zone_open_cmd);
>>> +    qemuio_add_command(&zone_close_cmd);
>>> +    qemuio_add_command(&zone_finish_cmd);
>>> +    qemuio_add_command(&zone_reset_cmd);
>>>      qemuio_add_command(&truncate_cmd);
>>>      qemuio_add_command(&length_cmd);
>>>      qemuio_add_command(&info_cmd);
>>> --
>>> 2.37.1
>>>


--=20
Damien Le Moal
Western Digital Research

