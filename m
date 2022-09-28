Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C85EE97C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:37:23 +0200 (CEST)
Received: from localhost ([::1]:42746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfgA-00046O-DA
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=263616193=damien.lemoal@opensource.wdc.com>)
 id 1odfcc-0000gX-EH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:33:43 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:8665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=263616193=damien.lemoal@opensource.wdc.com>)
 id 1odfcZ-000272-9g
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664404419; x=1695940419;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WNZN+F0PkRAssW0XwGqvYjeriKmX7w9mEbXdcomkmE0=;
 b=YUpAjPqhnqQga9JMxmti4PbIvXGxJ1QhT3XOn6oRH357mESy0KZfW5N8
 i3qQiRD+zyn8uF7jGxSrWfOo375/JAIBTWorE52ekwMKWISkhWUvTLv0E
 CEKezFUhmZ1sQGcAAQRzo6bKaw2ko4Px67sUNImF5sK/d/8SMMH5/vv6b
 pmjsTYvUxR7F55hMZKIRxjZDlGsPVbODt2cNxoWFgFfGzmCTt7hyzTSmQ
 yxNC4r7VwHG8GYuhTwwioLaUoTq4iwY0/4mYCwGRGQ42MnPfOw+Pg9xVN
 ZzKlXTJJssiXYHC2QhcZN8Ge9KmeXrhq6hp3qg+QkKE8BENLJEGdIG29E w==;
X-IronPort-AV: E=Sophos;i="5.93,353,1654531200"; d="scan'208";a="217702327"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Sep 2022 06:33:28 +0800
IronPort-SDR: +sQIkxMym2sQ7CnkMpvEHKMO1qYU9d7kEdbB+BxxL0GeVb5kDVJh1B/eKxRXG3kYkZpMw3Mk+C
 YAN8hz98LassVxg8r/RV+sWBrzQFG7cvaOfz4O3McQkgUi9waJoy9D8VkKXHPUXdLoLJfwlYG2
 n0VDCoBKB4uDVvhPkBp1TdT6ZFJAi/pitDwlibq0t8GQr1zOz1Oh9u8+htgRva4WREOuXGJ7tW
 7wdVFRIlnG7xFUrkx62naa0LRn6QzQm7y1d7Q/SQSQSiCV5lUgQy0n4pJpmtR620oWSchd8oZG
 uFEvh88FjZ1mpzfah258zF2B
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 14:53:23 -0700
IronPort-SDR: k9fbzXJ+gFLj5xxMJBMwgoZBuUfS6gJl2wAOsCw5tHkA1faU3btJoTMEFSADfDXwHLMa/JI9/R
 dUlqMVjw/S7x/f8bUvCZThTovuOMfsvVooT2ZywhJdpBAKEwR8fXFH032hDrD47ZP4RPavRFFV
 RxJR1EilB9HwoPL3ogOzFUOmciTYDtzZyECBiSPhtnTTF8SdZq3Acd+FyeFmjXADsg8gTVb7cE
 ucD2RR2/4h5nN4y873oKNB6ZrFW+W0sgbwD4mmd9LquR/CR7YF8QI1Ijqzz3boOKHtVAgNHvMB
 mRQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2022 15:33:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MdB935Zgvz1Rwrq
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 15:33:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1664404406; x=1666996407; bh=WNZN+F0PkRAssW0XwGqvYjeriKmX7w9mEbX
 dcomkmE0=; b=MsVOmWG+O+H5VCmvHVsa2fN7XeyndPZ6vjr2ujNPKP42Sb8yH2g
 wQyrqnH9BEb9WEGnHIXlxh1P9EY9+n3zeL8137uLxHO+H8KFdOufabj760o7+Ka8
 xJweafnwILdEa2y90P2CZWhZe3UBfz33RTWLWDKjVJfPeWeGoo4WD/6Idm2TzTo2
 WLbh18tvZHkgF61hHYOY31jWeJSWqNvVm8vCfys4cu/C4pohxPhWAq0aNcHYdFle
 Bi0fQOQpC8U23k5ODmCTorAyNJNnpZUBMtQ5gfiJcYytlVASzmDgueEsT7mA8i2J
 TQTpxEYTrWyORxAxYRg0KF93zpKvZvHU3tw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BP2Jm1SVQRbT for <qemu-devel@nongnu.org>;
 Wed, 28 Sep 2022 15:33:26 -0700 (PDT)
Received: from [10.89.80.74] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.80.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MdB903DYZz1RvLy;
 Wed, 28 Sep 2022 15:33:24 -0700 (PDT)
Message-ID: <77cfb03f-4402-0024-83ef-c23cf4f1758e@opensource.wdc.com>
Date: Thu, 29 Sep 2022 07:33:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] virtio-blk: add zoned storage emulation for zoned
 devices
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, dmitry.fomichev@wdc.com
References: <20220910065057.35017-1-faithilikerun@gmail.com>
 <20220910065057.35017-2-faithilikerun@gmail.com> <YyjeQ6yYALiUvBjO@fedora>
 <CAAAx-8KzHkHA4uBM0HpwxjtTFMhVGPUte_k0HF7jHobwu5hLAw@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8KzHkHA4uBM0HpwxjtTFMhVGPUte_k0HF7jHobwu5hLAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=263616193=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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

On 2022/09/29 4:55, Sam Li wrote:
> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B49=E6=9C=882=
0=E6=97=A5=E5=91=A8=E4=BA=8C 05:31=E5=86=99=E9=81=93=EF=BC=9A
[...]
>>> +static void virtio_blk_zone_append_complete(void *opaque, int ret) {
>>> +    ZoneCmdData *data =3D opaque;
>>> +    VirtIOBlockReq *req =3D data->req;
>>> +    VirtIOBlock *s =3D req->dev;
>>> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(req->dev);
>>> +    int64_t append_sector, n;
>>> +    struct iovec *out_iov =3D req->elem.out_sg;
>>> +    unsigned out_num =3D req->elem.out_num;
>>> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
>>
>> Error handling code for the ret < 0 case is missing.
>>
>>> +
>>> +    append_sector =3D data->ZoneAppendData.append_sector;
>>> +    int write_granularity =3D s->conf.conf.logical_block_size;
>>> +    if ((append_sector * 512 % write_granularity) !=3D 0) {
>>> +        err_status =3D VIRTIO_BLK_S_ZONE_UNALIGNED_WP;
>>> +        goto out;
>>> +    }
>>
>> This looks like input validation. Why is it performed after the I/O
>> request has completed?
>=20
> UNALIGNED_WP should be checked in both input and output validation. By
> checking if the starting/ending sector of the request data is aligned
> with write_granularity(value of physical block size), the device sets
> the UNALIGNED_WP bit and completes the request. According to spec
> here:

No, you only need input validation. You should not do this in the complet=
ion
path, simply because it will NEVER trigger. If it does, then the IO was t=
otally
botched (by the host kernel or the drive itself) and then you are going t=
o be in
a lot more troubles than not reporting an error... So I do not think this=
 is
useful at all.

> +VIRTIO_BLK_S_ZONE_UNALIGNED_WP is set by the device when the request r=
eceived
> +from the driver attempts to perform a write to an SWR zone and at leas=
t one of
> +the following conditions is met:

The text is clear here: this is for a write command, not a zone append co=
mmand.
So your emulation of zone append cannot return an unaligned wp error. Tha=
t would
is undefined in the specs.

> +
> +\begin{itemize}
> +\item the starting sector of the request is not equal to the current v=
alue of
> +    the zone write pointer.
> +
> +\item the ending sector of the request data multiplied by 512 is not a=
 multiple
> +    of the value reported by the device in the field \field{write_gran=
ularity}
> +    in the device configuration space.
> +\end{itemize}
>=20
>>
>> I guess the intent is to check the value that the guest driver provide=
d,
>> not the value produced by the device after the I/O request completed?
>>
>>> +    n =3D iov_to_buf(out_iov, out_num, 0, &append_sector, sizeof(app=
end_sector));
>>
>> Please use virtio_stq_p() on append_sector first to ensure that the
>> endianness is correct.
>>
>>> +    if (n !=3D sizeof(append_sector)) {
>>> +        virtio_error(vdev, "Driver provided input buffer less than s=
ize of "
>>> +                     "append_sector");
>>> +        err_status =3D VIRTIO_BLK_S_ZONE_INVALID_CMD;
>>> +        goto out;
>>> +    }
>>> +    goto out;
>>> +
>>> +out:
>>> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
>>> +    virtio_blk_req_complete(req, err_status);
>>> +    virtio_blk_free_request(req);
>>> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
>>> +    g_free(data);
>>> +}
>>> +
>>> +static int virtio_blk_handle_zone_append(VirtIOBlockReq *req) {
>>
>> The return value is not used. Please change the return type to void.
>=20
> The return type should be int actually. Otherwise, QEMU will terminate
> when the zone_append request is issued from the guest. It is the one
> cause that failed some of the zonefs tests. After coredump, backtrace
> indicates address_space_unmap: Assertion `mr ! =3D NULL` failed rooted
> from virtio_blk_zone_append_complete(). I haven't figured out exactly
> why but my guess is virtio_blk_zone_op_complete() needs the return
> value of virtio_blk_zone_op() ......
>=20
>>
>>> +    VirtIOBlock *s =3D req->dev;
>>> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(s);
>>> +    uint64_t niov =3D req->elem.out_num;
>>> +    struct iovec *out_iov =3D req->elem.out_sg;
>>> +    uint8_t err_status =3D VIRTIO_BLK_S_OK;
>>> +
>>> +    int64_t offset =3D virtio_ldq_p(vdev, &req->out.sector) * 512;
>>> +    int64_t len =3D 0;
>>> +    for (int i =3D 1; i < niov; ++i) {
>>> +        len +=3D out_iov[i].iov_len;
>>> +    }
>>
>> Why is the first iovec skipped?
>=20
> Because the first iovec is normally headers, and the rest is buffer
> that out_iov needs.
>=20
>>
>>> +
>>> +    if (!check_zone_model(s, offset / 512, len / 512, true, &err_sta=
tus)) {
>>> +        goto out;
>>> +    }
>>> +
>>> +    ZoneCmdData *data =3D g_malloc(sizeof(ZoneCmdData));
>>> +    data->req =3D req;
>>> +    data->ZoneAppendData.append_sector =3D offset;
>>> +    qemu_iovec_init_external(&req->qiov, &out_iov[1], niov-1);
>>> +    blk_aio_zone_append(s->blk, &data->ZoneAppendData.append_sector,=
 &req->qiov, 0,
>>> +                        virtio_blk_zone_append_complete, data);
>>> +
>>> +    return 0;
>>> +
>>> +out:
>>> +    aio_context_acquire(blk_get_aio_context(s->conf.conf.blk));
>>> +    virtio_blk_req_complete(req, err_status);
>>> +    virtio_blk_free_request(req);
>>> +    aio_context_release(blk_get_aio_context(s->conf.conf.blk));
>>> +    return err_status;
>>> +}
>>> +
>>>  static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBu=
ffer *mrb)
>>>  {
>>>      uint32_t type;
>>> @@ -700,6 +969,24 @@ static int virtio_blk_handle_request(VirtIOBlock=
Req *req, MultiReqBuffer *mrb)
>>>      case VIRTIO_BLK_T_FLUSH:
>>>          virtio_blk_handle_flush(req, mrb);
>>>          break;
>>> +    case VIRTIO_BLK_T_ZONE_REPORT:
>>> +        virtio_blk_handle_zone_report(req);
>>> +        break;
>>> +    case VIRTIO_BLK_T_ZONE_OPEN:
>>> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_OPEN);
>>> +        break;
>>> +    case VIRTIO_BLK_T_ZONE_CLOSE:
>>> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_CLOSE);
>>> +        break;
>>> +    case VIRTIO_BLK_T_ZONE_FINISH:
>>> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_FINISH);
>>> +        break;
>>> +    case VIRTIO_BLK_T_ZONE_RESET:
>>> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET);
>>> +        break;
>>> +    case VIRTIO_BLK_T_ZONE_RESET_ALL:
>>> +        virtio_blk_handle_zone_mgmt(req, BLK_ZO_RESET_ALL);
>>> +        break;
>>>      case VIRTIO_BLK_T_SCSI_CMD:
>>>          virtio_blk_handle_scsi(req);
>>>          break;
>>> @@ -718,6 +1005,9 @@ static int virtio_blk_handle_request(VirtIOBlock=
Req *req, MultiReqBuffer *mrb)
>>>          virtio_blk_free_request(req);
>>>          break;
>>>      }
>>> +   case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
>>> +       virtio_blk_handle_zone_append(req);
>>> +       break;
>>>      /*
>>>       * VIRTIO_BLK_T_DISCARD and VIRTIO_BLK_T_WRITE_ZEROES are define=
d with
>>>       * VIRTIO_BLK_T_OUT flag set. We masked this flag in the switch =
statement,
>>> @@ -917,6 +1207,7 @@ static void virtio_blk_update_config(VirtIODevic=
e *vdev, uint8_t *config)
>>>  {
>>>      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
>>>      BlockConf *conf =3D &s->conf.conf;
>>> +    BlockDriverState *state =3D blk_bs(s->blk);
>>
>> Usually the variable is called "bs". Please use that name here and
>> elsewhere in the patch.
>>
>>>      struct virtio_blk_config blkcfg;
>>>      uint64_t capacity;
>>>      int64_t length;
>>> @@ -976,6 +1267,31 @@ static void virtio_blk_update_config(VirtIODevi=
ce *vdev, uint8_t *config)
>>>          blkcfg.write_zeroes_may_unmap =3D 1;
>>>          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
>>>      }
>>> +#ifdef CONFIG_BLKZONED
>>
>> Is this ifdef appropriate? I think bs->bl.zoned should always be
>> available, even when <blkzoned.h> is missing (e.g. non-Linux system). =
In
>> the future there may be an emulated zoned BlockDriver. virtio-blk
>> should be able to use the emulated zoned BlockDriver even on non-Linux
>> systems.
>>
> Ok, you are right.
>=20
>> I think CONFIG_BLKZONED should be limited to block/file-posix.c.
>=20
> I'm not sure. There may be some places where virtio-blk needs this
> config. Like in transforming blk_zone_descriptor to
> virtio_blk_zone_descriptor, it needs to use Linux's constants to
> ensure nothing go wrong here.
>=20
>>
>>> +    if (state->bl.zoned !=3D BLK_Z_NONE) {
>>> +        switch (state->bl.zoned) {
>>> +        case BLK_Z_HM:
>>> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HM;
>>> +            virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
>=20
>>> +                         state->bl.zone_sectors);
>>> +            virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
>>> +                         state->bl.max_active_zones);
>>> +            virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
>>> +                         state->bl.max_open_zones);
>>> +            virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_=
size);
>>> +            virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
>>> +                         state->bl.max_append_sectors);
>>> +            break;
>>> +        case BLK_Z_HA:
>>> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_HA;
>>
>> The block limits aren't relevant to host-aware zoned devices?
>=20
> Yes, the HA devices are seen as non-zoned device and the driver just
> ignore all other fields in zoned.

This is incorrect. HA devices may be used as regular block devices (not z=
oned)
by the guest, but that is the guest decision to make. qemu handling of th=
e
device should still have the proper zone information for the drive and be=
 ready
to accept any zone operation for it.

>=20
> +\item if the driver that can not support zoned devices reads
> +    VIRTIO_BLK_Z_HA from the \field{model} field of \field{zoned}, the=
 driver
> +    MAY handle the device as a non-zoned device. In this case, the
> +    driver SHOULD ignore all other fields in \field{zoned}.
> +\end{itemize}

The driver here refers to the guest virtio driver. In the spec, qemu zone=
 block
emulation/handling is called "the device". Confusing :)

>=20
>>
>>> +            break;
>>> +        default:
>>> +            blkcfg.zoned.model =3D VIRTIO_BLK_Z_NONE;
>>> +            virtio_error(vdev, "Invalid zoned model %x \n", (int)sta=
te->bl.zoned);
>>> +            break;
>>> +        }
>>> +    }
>>> +#endif
>>>      memcpy(config, &blkcfg, s->config_size);
>>>  }
>>>
>>> @@ -995,6 +1311,7 @@ static uint64_t virtio_blk_get_features(VirtIODe=
vice *vdev, uint64_t features,
>>>                                          Error **errp)
>>>  {
>>>      VirtIOBlock *s =3D VIRTIO_BLK(vdev);
>>> +    BlockDriverState *state =3D blk_bs(s->blk);
>>>
>>>      /* Firstly sync all virtio-blk possible supported features */
>>>      features |=3D s->host_features;
>>> @@ -1003,6 +1320,12 @@ static uint64_t virtio_blk_get_features(VirtIO=
Device *vdev, uint64_t features,
>>>      virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
>>>      virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
>>>      virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
>>> +    if (state->bl.zoned !=3D BLK_Z_NONE) {
>>> +        virtio_add_feature(&s->host_features, VIRTIO_BLK_F_ZONED);
>>> +        if (state->bl.zoned =3D=3D BLK_Z_HM) {
>>> +            virtio_clear_feature(&features, VIRTIO_BLK_F_DISCARD);
>>
>> Why is features modified here but s->host_features is modified in the
>> line above?
>=20
> Because F_DISCARD should not be offered by the driver when the device
> offers F_ZONED with the HM model.
>=20
>>
>>> +        }
>>> +    }
>>
>> This detects VIRTIO_BLK_F_ZONED based on the BlockDriverState...
> (This part can be removed.)
>=20
>>
>>>      if (virtio_has_feature(features, VIRTIO_F_VERSION_1)) {
>>>          if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_SCSI))=
 {
>>>              error_setg(errp, "Please set scsi=3Doff for virtio-blk d=
evices in order to use virtio 1.0");
>>> @@ -1286,6 +1609,9 @@ static Property virtio_blk_properties[] =3D {
>>>  #ifdef __linux__
>>>      DEFINE_PROP_BIT64("scsi", VirtIOBlock, host_features,
>>>                        VIRTIO_BLK_F_SCSI, false),
>>> +#endif
>>> +#ifdef CONFIG_BLKZONED
>>> +    DEFINE_PROP_BIT64("zoned", VirtIOBlock, host_features, VIRTIO_BL=
K_F_ZONED, true),
>>>  #endif
>>
>> ...but this allows users to enable/disable the flag from the
>> command-line.
>>
>> I think DEFINE_PROP_BIT64() can be removed, but please check that the
>> config space size is still correct. It may be necessary to move the
>> bs->bl.zoned check into virtio_blk_device_realize() and set
>> the VIRTIO_BLK_F_ZONED s->host_features bit there instead. That will
>> allow the s->config_size calculation to work correctly.
>=20
> Ok, it works. Thanks!
>=20
> Additionally, the DEFINE_PROP_BIT here is to declare that the supports
> zones. Then the virtio-blk driver will not need to look at that
> feature. So the former part detecting the F_ZONED feature based on
> BlockDriverState can be removed. If removing this macro, then the
> virio-blk driver must set the F_ZONED feature by itself.

--=20
Damien Le Moal
Western Digital Research


