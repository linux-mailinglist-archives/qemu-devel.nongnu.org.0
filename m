Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDDC5FD682
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:58:03 +0200 (CEST)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiu2T-0008S6-MY
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oisuw-0004b5-QR
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 03:46:13 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:50700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2788b627a=damien.lemoal@opensource.wdc.com>)
 id 1oisus-0006GH-K1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 03:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665647166; x=1697183166;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uVy/8e8+El4/lJI+uZQjsR4rLOu8aD0HPAC7J6JRfv0=;
 b=ZgYUMue/dbcXTUahmtauc7pSEiqdUdjurHMjHuHUkbJuRiJ+nCuoIe2f
 qAOuaUW3MwWHM/5D4E/yBQtCy91+tU6pr1EhUUCLIPtNlPk6FnIXVqzi3
 g0pD98kYAlpgWvoNjKFeQo1Nx46+YfUlCDWYZpfk+yPN5OXEgxY+k5T0G
 KCBrJXX9HpK2Bf5Yh/KQ0FumtWAqhzuZYl3+RZOapmsOpb055cNf/1OBS
 dil28ye2Gez61V1hgYCgNM2mdLoSzks+iROoAETRIdMljD7mdv9NbiAHL
 wFp/sS0E1yz8akIAQqVDGc5EbS+HO06pkjB2cLtYTncq2GMAc+fHQqu2L w==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661788800"; d="scan'208";a="212014641"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 13 Oct 2022 15:46:01 +0800
IronPort-SDR: AkTSivKINupZRsGrJj00fmTjpr3BwrWbzhJCQgcDanfuBW+18BQroowAB/ITDz7qKCnyBBPDBX
 5qCTEgyEfwpK62wjE9nGfZqX573P6u6ymLGSv5Y+iRAaBEA/A7PyeG2waw6dPuSR6oMIGirgOz
 M1/hZe07hOtqggsgoJjN7mvytufBX6ARkbCaZmwzVh3fEfEsOiYArYAvdaefxpeVtu4vrpucLc
 W7N7g9mHpMeRZjHK41o9gH98cf1ktw9AmxUKilJKN6DIXV0K/XwiuRZt8S+O6Mw43ZDKeAxSTg
 6bs2tr/gUZqCPLi6+rU525+N
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:05:39 -0700
IronPort-SDR: f93EDexqSbb6EGdUxkmLojXheT/yZf//h3LP9sLM8K3xtnBBziB28iIOkUSJDT0Ou0sk+hJU9e
 OCivLp0DhMGgV90D6IOFCvTiR6epgnwSRxP1M09bAxJohzb+5ysXcKG+fFzxAMDHB/TJnsXSNM
 DuIdav+lUrP1vWHPyRX9uhCt2ObjU+IMGRpi/O2U17nBjuJ/S3OmLHk16oPZZpWlsKRwK5GtV3
 z9uI33iqiJPoWhzfBq3Hz93e+S6U9vVnm5GYj0o90eDAE4TV0KWSv38LM+ZI/575s597kqUEZD
 I6M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 00:46:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mp1m92Z2nz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 00:46:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1665647158; x=1668239159; bh=uVy/8e8+El4/lJI+uZQjsR4rLOu8aD0HPAC
 7J6JRfv0=; b=IO7FEbbSc8iDbMo0HLy5G8YW4jKIJ2WGqAqeBRU5SMu4oV1+U31
 +GjVC4ywG1M6GAVCOYa9QPpR5e3AuhmTlafWsz8i92xiONNUKFD968JAKgzml7Li
 +51TZUNFo8B7V4zbMEj+gvpJ4OfZH/ORYea1zZ/TEShQFcMDqSQBrvwxQH3lNa81
 0+kTrY6N3NXJVdQySQBtmOnN1CYiBLc8vXdfmx0FrXM6cSaLPKqpdOX7pVZfsFGX
 S5D8CqBl3AgyJ/fMGCWTeWAG5rloaG3F7GTBmJ6z5zSi74UdprMyeQukbafp22mE
 n7yWWeXFoBZNGz6r4H/XeEBIONkqIfz23qA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MSCDHgsgc5IC for <qemu-devel@nongnu.org>;
 Thu, 13 Oct 2022 00:45:58 -0700 (PDT)
Received: from [10.89.85.169] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.85.169])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mp1m51CnCz1RvLy;
 Thu, 13 Oct 2022 00:45:56 -0700 (PDT)
Message-ID: <c5a1443b-428e-26eb-63f9-08ad4afad1a4@opensource.wdc.com>
Date: Thu, 13 Oct 2022 16:45:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 2/3] block: introduce zone append write for zoned
 devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 dmitry.fomichev@wdc.com, hare@suse.de, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org
References: <20221010023306.43610-1-faithilikerun@gmail.com>
 <20221010023306.43610-3-faithilikerun@gmail.com>
 <0e1aecaf-6957-2592-c541-444cf58394ba@opensource.wdc.com>
 <CAAAx-8Kw9JbF+28Tom6NoCwZjk6Q3nSvw6JtsM9XUJjZSH8fJQ@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8Kw9JbF+28Tom6NoCwZjk6Q3nSvw6JtsM9XUJjZSH8fJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2788b627a=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

On 2022/10/13 16:27, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
10=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 13:55=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 10/10/22 11:33, Sam Li wrote:
>>> A zone append command is a write operation that specifies the first
>>> logical block of a zone as the write position. When writing to a zone=
d
>>> block device using zone append, the byte offset of writes is pointing
>>> to the write pointer of that zone. Upon completion the device will
>>> respond with the position the data has been written in the zone.
>>>
>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>> ---
>>>  block/block-backend.c             | 64 +++++++++++++++++++++++++++++=
++
>>>  block/file-posix.c                | 64 ++++++++++++++++++++++++++++-=
--
>>>  block/io.c                        | 21 ++++++++++
>>>  block/raw-format.c                |  7 ++++
>>>  include/block/block-io.h          |  3 ++
>>>  include/block/block_int-common.h  |  3 ++
>>>  include/block/raw-aio.h           |  4 +-
>>>  include/sysemu/block-backend-io.h |  9 +++++
>>>  8 files changed, 168 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>> index ddc569e3ac..bfdb719bc8 100644
>>> --- a/block/block-backend.c
>>> +++ b/block/block-backend.c
>>> @@ -1439,6 +1439,9 @@ typedef struct BlkRwCo {
>>>          struct {
>>>              BlockZoneOp op;
>>>          } zone_mgmt;
>>> +        struct {
>>> +            int64_t *append_sector;
>>
>> I would call this "sector", since it will always be referenced as
>> "->zone_append.sector", you get the "append" for free :)
>>
>> That said, shouldn't this be a byte value, so called "offset" ? Not
>> entirely sure...
>=20
> Yes, it can be changed to "offset"(byte) following QEMU's convention.
> Just need to add conversions to virtio_blk_zone_append/*_complete,
> which is easily done.
>=20
>>
>>> +        } zone_append;
>>>      };
>>>  } BlkRwCo;
>>>
>>> @@ -1869,6 +1872,46 @@ BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *bl=
k, BlockZoneOp op,
>>>      return &acb->common;
>>>  }
>>>
>>> +static void coroutine_fn blk_aio_zone_append_entry(void *opaque) {
>>> +    BlkAioEmAIOCB *acb =3D opaque;
>>> +    BlkRwCo *rwco =3D &acb->rwco;
>>> +
>>> +    rwco->ret =3D blk_co_zone_append(rwco->blk, rwco->zone_append.ap=
pend_sector,
>>> +                                   rwco->iobuf, rwco->flags);
>>> +    blk_aio_complete(acb);
>>> +}
>>> +
>>> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
>>> +                                QEMUIOVector *qiov, BdrvRequestFlags=
 flags,
>>> +                                BlockCompletionFunc *cb, void *opaqu=
e) {
>>> +    BlkAioEmAIOCB *acb;
>>> +    Coroutine *co;
>>> +    IO_CODE();
>>> +
>>> +    blk_inc_in_flight(blk);
>>> +    acb =3D blk_aio_get(&blk_aio_em_aiocb_info, blk, cb, opaque);
>>> +    acb->rwco =3D (BlkRwCo) {
>>> +            .blk    =3D blk,
>>> +            .ret    =3D NOT_DONE,
>>> +            .flags  =3D flags,
>>> +            .iobuf  =3D qiov,
>>> +            .zone_append =3D {
>>> +                    .append_sector =3D offset,
>>
>> See above comment. So since this is a byte value, this needs to be
>> called "offset", no ?
>=20
> Yes, same answers above.
>=20
>>
>>> +            },
>>> +    };
>>> +    acb->has_returned =3D false;
>>> +
>>> +    co =3D qemu_coroutine_create(blk_aio_zone_append_entry, acb);
>>> +    bdrv_coroutine_enter(blk_bs(blk), co);
>>> +    acb->has_returned =3D true;
>>> +    if (acb->rwco.ret !=3D NOT_DONE) {
>>> +        replay_bh_schedule_oneshot_event(blk_get_aio_context(blk),
>>> +                                         blk_aio_complete_bh, acb);
>>> +    }
>>> +
>>> +    return &acb->common;
>>> +}
>>> +
>>>  /*
>>>   * Send a zone_report command.
>>>   * offset is a byte offset from the start of the device. No alignmen=
t
>>> @@ -1921,6 +1964,27 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend=
 *blk, BlockZoneOp op,
>>>      return ret;
>>>  }
>>>
>>> +/*
>>> + * Send a zone_append command.
>>> + */
>>> +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offs=
et,
>>> +        QEMUIOVector *qiov, BdrvRequestFlags flags)
>>> +{
>>> +    int ret;
>>> +    IO_CODE();
>>> +
>>> +    blk_inc_in_flight(blk);
>>> +    blk_wait_while_drained(blk);
>>> +    if (!blk_is_available(blk)) {
>>> +        blk_dec_in_flight(blk);
>>> +        return -ENOMEDIUM;
>>> +    }
>>> +
>>> +    ret =3D bdrv_co_zone_append(blk_bs(blk), offset, qiov, flags);
>>> +    blk_dec_in_flight(blk);
>>> +    return ret;
>>> +}
>>> +
>>>  void blk_drain(BlockBackend *blk)
>>>  {
>>>      BlockDriverState *bs =3D blk_bs(blk);
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index 17c0b58158..08ab164df4 100755
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -1657,7 +1657,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixA=
IOData *aiocb)
>>>      ssize_t len;
>>>
>>>      do {
>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND=
))
>>>              len =3D qemu_pwritev(aiocb->aio_fildes,
>>>                                 aiocb->io.iov,
>>>                                 aiocb->io.niov,
>>
>> Hu... You are issuing the io for a zone append without first changing
>> the aiocb offset to be equal to the zone write pointer ? And you are
>=20
> It changed in the last patch. But it should be in this patch and make
> it specific to zone_append case, like:
> if ( type =3D=3D & QEMU_AIO_ZONE_APPEND) {
>     /* change offset here */
> }

yes.

>=20
>> calling this without the wps->lock held... Changing the aio offset to =
be
>> equal to the wp && issuing the io must be atomic.
>=20
> Does this mean puttling locks around pwritev()? Like:
> lock(wp);
> len =3D pwritev();
> unlock(wp);

You need the aio offset change, aio issuing (or IO execution depending on=
 the
host system call used) and wp update all atomic:

BlockZoneWps *wps =3D aiocb->bs->bl.wps;
int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_size;

lock(wp);

if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
    aiocb->aio_offset =3D wps->wp[index];
}

len =3D pwritev();
if (len > 0) {
    wps->wp[index] =3D wend_offset;
    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
        *aiocb->io.append_sector =3D wps->wp[index] >> BDRV_SECTOR_BITS;
    }
}

unlock(wp);

Note that you must also take the lock for regular writes to avoid reorder=
ing of
pwritev() calls if multiple qemu worker threads are simultaneously handli=
ng
write requests for the same zone... I am not sure if this can happen thou=
gh.
-> Stefan ?

If the write request is processed using a host AIOs (e.g. linux native ai=
o with
io_submit() & io_getevents()), you do not need to hold the lock until the=
 linux
AIO completes. You only need the lock until io_submit() returns. But I am=
 not
sure how linux native aios are handled in qemu code...

> Because it is accessing wps[] by offset, which is a wp location. And
> when pwritev()  executes, the offset should not be changed by other
> ios in flight.

yes, otherwise you may get reversed pwritev() execution order if multiple=
 worker
threads are handling write commands for the same zone. You must serialize=
 them
using the wp lock.

>=20
>>
>>> @@ -1687,7 +1687,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixA=
IOData *aiocb, char *buf)
>>>      ssize_t len;
>>>
>>>      while (offset < aiocb->aio_nbytes) {
>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND=
)) {
>>>              len =3D pwrite(aiocb->aio_fildes,
>>>                           (const char *)buf + offset,
>>>                           aiocb->aio_nbytes - offset,
>>
>> Same comment here.
>>
>>> @@ -1731,7 +1731,7 @@ static int handle_aiocb_rw(void *opaque)
>>>       * The offset of regular writes, append writes is the wp locatio=
n
>>>       * of that zone.
>>>       */
>>> -    if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +    if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>>>          if (aiocb->bs->bl.zone_size > 0) {
>>>              BlockZoneWps *wps =3D aiocb->bs->bl.wps;
>>>              qemu_mutex_lock(&wps->lock);
>>> @@ -1794,7 +1794,7 @@ static int handle_aiocb_rw(void *opaque)
>>>      }
>>>
>>>      nbytes =3D handle_aiocb_rw_linear(aiocb, buf);
>>> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
>>> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))=
) {
>>>          char *p =3D buf;
>>>          size_t count =3D aiocb->aio_nbytes, copy;
>>>          int i;
>>> @@ -1816,7 +1816,7 @@ static int handle_aiocb_rw(void *opaque)
>>>  out:
>>>      if (nbytes =3D=3D aiocb->aio_nbytes) {
>>>  #if defined(CONFIG_BLKZONED)
>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND=
)) {
>>>              BlockZoneWps *wps =3D aiocb->bs->bl.wps;
>>>              int index =3D aiocb->aio_offset / aiocb->bs->bl.zone_siz=
e;
>>>              if (wps) {
>>> @@ -1828,6 +1828,11 @@ out:
>>>                      if (wend_offset > wps->wp[index]){
>>>                          wps->wp[index] =3D wend_offset;
>>>                      }
>>> +
>>> +                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
>>> +                        *aiocb->io.append_sector =3D
>>> +                                wps->wp[index] >> BDRV_SECTOR_BITS;
>>> +                    }
>>
>> Same comment as last time. You must do this BEFORE the previous hunk
>> that updates the wp. Otherwise, you are NOT returning the position of
>> the written data, but the position that follows the written data...
>>
>> If you do a zone append to an empty zone, the append sector you return
>> must be the zone start sector. You can see here that this will never b=
e
>> the case unless you reverse the 2 hunks above.
>=20
> You are right. I mistook the append sector should be the end sector loc=
ation.
>=20
> +Upon a successful completion of a VIRTIO_BLK_T_ZONE_APPEND request, th=
e driver
> +MAY read the starting sector location of the written data from the req=
uest
> +field \field{append_sector}.
>=20
>>
>>>                  }
>>>                  qemu_mutex_unlock(&wps->lock);
>>>              }
>>> @@ -1845,7 +1850,7 @@ out:
>>>      } else {
>>>          assert(nbytes < 0);
>>>  #if defined(CONFIG_BLKZONED)
>>> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
>>> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND=
)) {
>>>              update_zones_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
>>>                              aiocb->bs->bl.nr_zones);
>>>          }
>>> @@ -3493,6 +3498,52 @@ static int coroutine_fn raw_co_zone_mgmt(Block=
DriverState *bs, BlockZoneOp op,
>>>  }
>>>  #endif
>>>
>>> +#if defined(CONFIG_BLKZONED)
>>> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs,
>>> +                                           int64_t *offset,
>>> +                                           QEMUIOVector *qiov,
>>> +                                           BdrvRequestFlags flags) {
>>> +    BDRVRawState *s =3D bs->opaque;
>>> +    int64_t zone_size_mask =3D bs->bl.zone_size - 1;
>>> +    int64_t iov_len =3D 0;
>>> +    int64_t len =3D 0;
>>> +    RawPosixAIOData acb;
>>> +
>>> +    if (*offset & zone_size_mask) {
>>> +        error_report("sector offset %" PRId64 " is not aligned to zo=
ne size "
>>> +                     "%" PRId32 "", *offset / 512, bs->bl.zone_size =
/ 512);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    int64_t wg =3D bs->bl.write_granularity;
>>> +    int64_t wg_mask =3D wg - 1;
>>> +    for (int i =3D 0; i < qiov->niov; i++) {
>>> +       iov_len =3D qiov->iov[i].iov_len;
>>> +       if (iov_len & wg_mask) {
>>> +           error_report("len of IOVector[%d] %" PRId64 " is not alig=
ned to block "
>>> +                        "size %" PRId64 "", i, iov_len, wg);
>>> +           return -EINVAL;
>>> +       }
>>> +       len +=3D iov_len;
>>> +    }
>>> +
>>> +    acb =3D (RawPosixAIOData) {
>>> +        .bs =3D bs,
>>> +        .aio_fildes =3D s->fd,
>>> +        .aio_type =3D QEMU_AIO_ZONE_APPEND,
>>> +        .aio_offset =3D *offset,
>>> +        .aio_nbytes =3D len,
>>> +        .io =3D {
>>> +                .iov =3D qiov->iov,
>>> +                .niov =3D qiov->niov,
>>> +                .append_sector =3D offset,
>>> +        },
>>> +    };
>>> +
>>> +    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>>> +}
>>> +#endif
>>> +
>>>  static coroutine_fn int
>>>  raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>>>                  bool blkdev)
>>> @@ -4268,6 +4319,7 @@ static BlockDriver bdrv_zoned_host_device =3D {
>>>      /* zone management operations */
>>>      .bdrv_co_zone_report =3D raw_co_zone_report,
>>>      .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>>> +    .bdrv_co_zone_append =3D raw_co_zone_append,
>>>  };
>>>  #endif
>>>
>>> diff --git a/block/io.c b/block/io.c
>>> index e5aaa64e17..935abf2ed4 100644
>>> --- a/block/io.c
>>> +++ b/block/io.c
>>> @@ -3230,6 +3230,27 @@ out:
>>>      return co.ret;
>>>  }
>>>
>>> +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *=
offset,
>>> +                        QEMUIOVector *qiov,
>>> +                        BdrvRequestFlags flags)
>>> +{
>>> +    BlockDriver *drv =3D bs->drv;
>>> +    CoroutineIOCompletion co =3D {
>>> +            .coroutine =3D qemu_coroutine_self(),
>>> +    };
>>> +    IO_CODE();
>>> +
>>> +    bdrv_inc_in_flight(bs);
>>> +    if (!drv || !drv->bdrv_co_zone_append) {
>>> +        co.ret =3D -ENOTSUP;
>>> +        goto out;
>>> +    }
>>> +    co.ret =3D drv->bdrv_co_zone_append(bs, offset, qiov, flags);
>>> +out:
>>> +    bdrv_dec_in_flight(bs);
>>> +    return co.ret;
>>> +}
>>> +
>>>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>>>  {
>>>      IO_CODE();
>>> diff --git a/block/raw-format.c b/block/raw-format.c
>>> index b885688434..f132880c85 100644
>>> --- a/block/raw-format.c
>>> +++ b/block/raw-format.c
>>> @@ -325,6 +325,12 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDr=
iverState *bs, BlockZoneOp op,
>>>      return bdrv_co_zone_mgmt(bs->file->bs, op, offset, len);
>>>  }
>>>
>>> +static int coroutine_fn raw_co_zone_append(BlockDriverState *bs, int=
64_t *offset,
>>> +                                           QEMUIOVector *qiov,
>>> +                                           BdrvRequestFlags flags) {
>>> +    return bdrv_co_zone_append(bs->file->bs, offset, qiov, flags);
>>> +}
>>> +
>>>  static int64_t raw_getlength(BlockDriverState *bs)
>>>  {
>>>      int64_t len;
>>> @@ -628,6 +634,7 @@ BlockDriver bdrv_raw =3D {
>>>      .bdrv_co_pdiscard     =3D &raw_co_pdiscard,
>>>      .bdrv_co_zone_report  =3D &raw_co_zone_report,
>>>      .bdrv_co_zone_mgmt  =3D &raw_co_zone_mgmt,
>>> +    .bdrv_co_zone_append =3D &raw_co_zone_append,
>>>      .bdrv_co_block_status =3D &raw_co_block_status,
>>>      .bdrv_co_copy_range_from =3D &raw_co_copy_range_from,
>>>      .bdrv_co_copy_range_to  =3D &raw_co_copy_range_to,
>>> diff --git a/include/block/block-io.h b/include/block/block-io.h
>>> index f0cdf67d33..6a54453578 100644
>>> --- a/include/block/block-io.h
>>> +++ b/include/block/block-io.h
>>> @@ -94,6 +94,9 @@ int coroutine_fn bdrv_co_zone_report(BlockDriverSta=
te *bs, int64_t offset,
>>>                                       BlockZoneDescriptor *zones);
>>>  int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp=
 op,
>>>                                     int64_t offset, int64_t len);
>>> +int coroutine_fn bdrv_co_zone_append(BlockDriverState *bs, int64_t *=
offset,
>>> +                                     QEMUIOVector *qiov,
>>> +                                     BdrvRequestFlags flags);
>>>
>>>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes=
);
>>>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>>> diff --git a/include/block/block_int-common.h b/include/block/block_i=
nt-common.h
>>> index 59c2d1316d..a7e7db5646 100644
>>> --- a/include/block/block_int-common.h
>>> +++ b/include/block/block_int-common.h
>>> @@ -701,6 +701,9 @@ struct BlockDriver {
>>>              BlockZoneDescriptor *zones);
>>>      int coroutine_fn (*bdrv_co_zone_mgmt)(BlockDriverState *bs, Bloc=
kZoneOp op,
>>>              int64_t offset, int64_t len);
>>> +    int coroutine_fn (*bdrv_co_zone_append)(BlockDriverState *bs,
>>> +            int64_t *offset, QEMUIOVector *qiov,
>>> +            BdrvRequestFlags flags);
>>>
>>>      /* removable device specific */
>>>      bool (*bdrv_is_inserted)(BlockDriverState *bs);
>>> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
>>> index 3d26929cdd..f13cc1887b 100644
>>> --- a/include/block/raw-aio.h
>>> +++ b/include/block/raw-aio.h
>>> @@ -31,6 +31,7 @@
>>>  #define QEMU_AIO_TRUNCATE     0x0080
>>>  #define QEMU_AIO_ZONE_REPORT  0x0100
>>>  #define QEMU_AIO_ZONE_MGMT    0x0200
>>> +#define QEMU_AIO_ZONE_APPEND  0x0400
>>>  #define QEMU_AIO_TYPE_MASK \
>>>          (QEMU_AIO_READ | \
>>>           QEMU_AIO_WRITE | \
>>> @@ -41,7 +42,8 @@
>>>           QEMU_AIO_COPY_RANGE | \
>>>           QEMU_AIO_TRUNCATE  | \
>>>           QEMU_AIO_ZONE_REPORT | \
>>> -         QEMU_AIO_ZONE_MGMT)
>>> +         QEMU_AIO_ZONE_MGMT | \
>>> +         QEMU_AIO_ZONE_APPEND)
>>>
>>>  /* AIO flags */
>>>  #define QEMU_AIO_MISALIGNED   0x1000
>>> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block=
-backend-io.h
>>> index 6835525582..33e35ae5d7 100644
>>> --- a/include/sysemu/block-backend-io.h
>>> +++ b/include/sysemu/block-backend-io.h
>>> @@ -51,6 +51,9 @@ BlockAIOCB *blk_aio_zone_report(BlockBackend *blk, =
int64_t offset,
>>>  BlockAIOCB *blk_aio_zone_mgmt(BlockBackend *blk, BlockZoneOp op,
>>>                                int64_t offset, int64_t len,
>>>                                BlockCompletionFunc *cb, void *opaque)=
;
>>> +BlockAIOCB *blk_aio_zone_append(BlockBackend *blk, int64_t *offset,
>>> +                                QEMUIOVector *qiov, BdrvRequestFlags=
 flags,
>>> +                                BlockCompletionFunc *cb, void *opaqu=
e);
>>>  BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk, int64_t offset, int6=
4_t bytes,
>>>                               BlockCompletionFunc *cb, void *opaque);
>>>  void blk_aio_cancel_async(BlockAIOCB *acb);
>>> @@ -172,6 +175,12 @@ int coroutine_fn blk_co_zone_mgmt(BlockBackend *=
blk, BlockZoneOp op,
>>>                                    int64_t offset, int64_t len);
>>>  int generated_co_wrapper blk_zone_mgmt(BlockBackend *blk, BlockZoneO=
p op,
>>>                                         int64_t offset, int64_t len);
>>> +int coroutine_fn blk_co_zone_append(BlockBackend *blk, int64_t *offs=
et,
>>> +                                    QEMUIOVector *qiov,
>>> +                                    BdrvRequestFlags flags);
>>> +int generated_co_wrapper blk_zone_append(BlockBackend *blk, int64_t =
*offset,
>>> +                                         QEMUIOVector *qiov,
>>> +                                         BdrvRequestFlags flags);
>>>
>>>  int generated_co_wrapper blk_pdiscard(BlockBackend *blk, int64_t off=
set,
>>>                                        int64_t bytes);
>>
>> --
>> Damien Le Moal
>> Western Digital Research
>>

--=20
Damien Le Moal
Western Digital Research


