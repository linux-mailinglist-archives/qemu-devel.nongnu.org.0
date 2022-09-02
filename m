Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE65AA580
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 04:15:54 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTwDp-0005nP-6c
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 22:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2374b1b37=damien.lemoal@opensource.wdc.com>)
 id 1oTwBR-0003y4-Ub
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:13:25 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:57525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2374b1b37=damien.lemoal@opensource.wdc.com>)
 id 1oTwBN-0000h8-VD
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662084801; x=1693620801;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9aWLJWZYCmZnLcooU+otLEP8WYP9Ova8JRW4w8/E29k=;
 b=ht2cce7pDzcsB9qq5reodb0i5QNHNjMLHJU2Q7ccgDs3Ivx9h0Yb7jD6
 PGxCZaT+fr3bvJUk8tg9Eh3T755HYao7FNDSOPz8V7w+YFZAUfOkQV8h4
 9MZVH2kCT5/+AGhDKBAE/mbqBQ/+ZdBqhhHjki8PI4g8oBylgtQDj993U
 j0z60zelPJubVchw7Mavz10/xfDGQeskWDan5ArNvvEMgPW2AG2zftFRs
 iYcBFO12LJ+LsEuJzwNZAR9CGt7ufoKC4NoGkmmtx14asVW9z3nIqvGMZ
 0E1yIUxmr3injg2iB7ss2QtfFgTdN2VhWbWXiYKwxkhPN9Ev7EbFQgkCa A==;
X-IronPort-AV: E=Sophos;i="5.93,281,1654531200"; d="scan'208";a="208717485"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2022 10:13:16 +0800
IronPort-SDR: 4peuVrj63Oh6cxdHTTwT+Ff91QjmTMKMTRS8TZ+eUNCgynjiTTfGrhaVGbsqaGUkgpSklb3A2L
 p+uejXfyA5YGQhZBttlzKLX66LY8Fjey+CTf++++MqG0FHZcEChM11Xjkfpyz9IjoR0aUw/Je7
 EO/huKgmmCVBM7ibclo3wGnynNwkfno4jU0X4V1/dmiL2C1Q6OFDX7RhOO2iy3mOb9aMQ9vFw4
 L9v1AqUL0CaVtfipptG48/nMykH/T7erNYzhHoORv7ejRUwYG8dAU6AJu8MwjxB0jhxhABcwCl
 0jPJQJT9ij3j9cKV/FEe+JDP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Sep 2022 18:28:21 -0700
IronPort-SDR: U6DXR5xrABM42/Su/nkvBKUbVyQBg20neddWfs71Yawz5ijwUmtIRjr3y5FuGdxBISirrKsCug
 sFZ2eBGuZMiMnJy/dhIBZU9aGXQD6zZcxJQNYaxUSbKo7fOr5EkOesVIp3rgh7jho/ek4URLLF
 HKY1ZZ+Pcq8EyeHDwdXCHB3Yo3UyusumQtkUmS8Zfz9G+6UVBeosDVE7j4M0JP+WMsHVIim/Eb
 LwJcu9LR7eWdljv78OSLIYWtNMJjegoRgpIErIl8qc/IeH3bhRz3co8s49cZqTCN+JcozA5Ged
 pFo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Sep 2022 19:13:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MJhK74fNQz1RwtC
 for <qemu-devel@nongnu.org>; Thu,  1 Sep 2022 19:13:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662084794; x=1664676795; bh=9aWLJWZYCmZnLcooU+otLEP8WYP9Ova8JRW
 4w8/E29k=; b=DzjPKUDfA7SwvMYeDtYNIh+7jx/mIMKFzzrxv2YtDQVgzWp16Rb
 hvCTlibspWi4wJiLsU/zRPUhSyuxuPDQ3GPyDd2tOWRHditwg88KwQNvForFIlTT
 2qJ+IFTprvqVxbYZ0mtvMjkIDLvzctYp/zlBdKbdy/cC3VFmeYESVjSeO8wq/0QC
 rOtjG69n8QcHkUwrRZhlPHe8LFX/827UiqFrxDQY3DvzzfwAPfd9tFT1GX/zG6SR
 mn4wFjcKXdFlUWd26Tn7Lv5cWnig3zt1if/y41An9jJWxYvWz7EZJUTqvpsIgpjS
 bu/Df6dUnJ9TTx4yTHQdLQSQeDGHsW1/WIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id VhUC2beAlC5I for <qemu-devel@nongnu.org>;
 Thu,  1 Sep 2022 19:13:14 -0700 (PDT)
Received: from [10.225.163.56] (unknown [10.225.163.56])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MJhK41W4gz1RvLy;
 Thu,  1 Sep 2022 19:13:11 -0700 (PDT)
Message-ID: <2537ba13-e915-1378-4414-ed999dc93a9e@opensource.wdc.com>
Date: Fri, 2 Sep 2022 11:13:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi
 <stefanha@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Hannes Reinecke <hare@suse.de>, qemu block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>
References: <20220826161704.8076-1-faithilikerun@gmail.com>
 <87h71ugczz.fsf@pond.sub.org>
 <CAAAx-8Kc0UQDVXCTdFWz1E1K1xJTnUoGDko_khxEnHrPH6MYxw@mail.gmail.com>
 <87fshcdd4x.fsf@pond.sub.org>
 <CAAAx-8LN6tK+VkPVDNHM-hCkbpNE2iHZojCK1aO5GKtme1iRNQ@mail.gmail.com>
 <87r10vywg3.fsf@pond.sub.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <87r10vywg3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2374b1b37=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

On 9/1/22 23:57, Markus Armbruster wrote:
> Sam Li <faithilikerun@gmail.com> writes:
>=20
>> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=88=
31=E6=97=A5=E5=91=A8=E4=B8=89 16:35=E5=86=99=E9=81=93=EF=BC=9A
>>>
>>> Sam Li <faithilikerun@gmail.com> writes:
>>>
>>>> Markus Armbruster <armbru@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=88=
30=E6=97=A5=E5=91=A8=E4=BA=8C 19:57=E5=86=99=E9=81=93=EF=BC=9A
>>>>>
>>>>> Sam Li <faithilikerun@gmail.com> writes:
>>>>>
>>>>>> By adding zone management operations in BlockDriver, storage contr=
oller
>>>>>> emulation can use the new block layer APIs including Report Zone a=
nd
>>>>>> four zone management operations (open, close, finish, reset).
>>>>>>
>>>>>> Add zoned storage commands of the device: zone_report(zrp), zone_o=
pen(zo),
>>>>>> zone_close(zc), zone_reset(zrs), zone_finish(zf).
>>>>>>
>>>>>> For example, to test zone_report, use following command:
>>>>>> $ ./build/qemu-io --image-opts driver=3Dzoned_host_device, filenam=
e=3D/dev/nullb0
>>>>>> -c "zrp offset nr_zones"
>>>>>>
>>>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>>>>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>>>>> index 0a8b4b426e..e3efba6db7 100644
>>>>>> --- a/block/file-posix.c
>>>>>> +++ b/block/file-posix.c
>>>>>
>>>>> [...]
>>>>>
>>>>>> @@ -3752,6 +4025,54 @@ static BlockDriver bdrv_host_device =3D {
>>>>>>  #endif
>>>>>>  };
>>>>>>
>>>>>> +#if defined(CONFIG_BLKZONED)
>>>>>> +static BlockDriver bdrv_zoned_host_device =3D {
>>>>>> +        .format_name =3D "zoned_host_device",
>>>>>
>>>>> Indentation should be 4, not 8.
>>>>>
>>>>>> +        .protocol_name =3D "zoned_host_device",
>>>>>> +        .instance_size =3D sizeof(BDRVRawState),
>>>>>> +        .bdrv_needs_filename =3D true,
>>>>>> +        .bdrv_probe_device  =3D hdev_probe_device,
>>>>>> +        .bdrv_file_open     =3D hdev_open,
>>>>>> +        .bdrv_close         =3D raw_close,
>>>>>> +        .bdrv_reopen_prepare =3D raw_reopen_prepare,
>>>>>> +        .bdrv_reopen_commit  =3D raw_reopen_commit,
>>>>>> +        .bdrv_reopen_abort   =3D raw_reopen_abort,
>>>>>> +        .bdrv_co_create_opts =3D bdrv_co_create_opts_simple,
>>>>>> +        .create_opts         =3D &bdrv_create_opts_simple,
>>>>>> +        .mutable_opts        =3D mutable_opts,
>>>>>> +        .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
>>>>>> +        .bdrv_co_pwrite_zeroes =3D hdev_co_pwrite_zeroes,
>>>>>> +
>>>>>> +        .bdrv_co_preadv         =3D raw_co_preadv,
>>>>>> +        .bdrv_co_pwritev        =3D raw_co_pwritev,
>>>>>> +        .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
>>>>>> +        .bdrv_co_pdiscard       =3D hdev_co_pdiscard,
>>>>>> +        .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
>>>>>> +        .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
>>>>>> +        .bdrv_refresh_limits =3D raw_refresh_limits,
>>>>>> +        .bdrv_io_plug =3D raw_aio_plug,
>>>>>> +        .bdrv_io_unplug =3D raw_aio_unplug,
>>>>>> +        .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
>>>>>> +
>>>>>> +        .bdrv_co_truncate       =3D raw_co_truncate,
>>>>>> +        .bdrv_getlength =3D raw_getlength,
>>>>>> +        .bdrv_get_info =3D raw_get_info,
>>>>>> +        .bdrv_get_allocated_file_size
>>>>>> +                            =3D raw_get_allocated_file_size,
>>>>>> +        .bdrv_get_specific_stats =3D hdev_get_specific_stats,
>>>>>> +        .bdrv_check_perm =3D raw_check_perm,
>>>>>> +        .bdrv_set_perm   =3D raw_set_perm,
>>>>>> +        .bdrv_abort_perm_update =3D raw_abort_perm_update,
>>>>>> +        .bdrv_probe_blocksizes =3D hdev_probe_blocksizes,
>>>>>> +        .bdrv_probe_geometry =3D hdev_probe_geometry,
>>>>>> +        .bdrv_co_ioctl =3D hdev_co_ioctl,
>>>>>> +
>>>>>> +        /* zone management operations */
>>>>>> +        .bdrv_co_zone_report =3D raw_co_zone_report,
>>>>>> +        .bdrv_co_zone_mgmt =3D raw_co_zone_mgmt,
>>>>>> +};
>>>>>
>>>>> Differences to bdrv_host_device:
>>>>>
>>>>> * .bdrv_parse_filename is not set
>>>>>
>>>>> * .bdrv_co_ioctl is not set
>>>>>
>>>>> * .bdrv_co_zone_report and .bdrv_co_zone_mgmt are set
>>>>
>>>> As Stefan mentioned, zoned_host_device is a new driver that doesn't
>>>> work with string filenames. .bdrv_parse_filename() helps legacy
>>>> drivers strip the optional protocol prefix off the filename and no u=
se
>>>> here. Therefore it can be dropped.
>>>
>>> Makes sense.
>>>
>>>> .bdrv_co_ioctl is set actually.
>>>
>>> You're right; I diffed the two and misread the result.
>>>
>>>> Zoned_host_device is basically host_device + zone operations. It
>>>> serves for a simple purpose: if the host device is zoned, register
>>>> zoned_host_device driver; else, register host_device.
>>>
>>> Why would I ever want to use host_device instead of zoned_host_device=
?
>>>
>>> To answer this question, we need to understand how their behavior
>>> differs.
>>>
>>> We can ignore the legacy protocol prefix / string filename part.
>>>
>>> All that's left seems to be "if the host device is zoned, then using =
the
>>> zoned_host_device driver gets you the zoned features, whereas using t=
he
>>> host_device driver doesn't".  What am I missing?
>>
>> I think that's basically what users need to know about.
>=20
> Now answer my previous question, please: why would I ever want to use
> host_device instead of zoned_host_device?
>=20
> Or in other words, why would I ever want to present a zoned host device
> to a guest as non-zoned device?
>=20
>>>>> Notably common is .bdrv_file_open =3D hdev_open.  What happens when=
 you
>>>>> try to create a zoned_host_device where the @filename argument is n=
ot in
>>>>> fact a zoned device?
>>>>
>>>> If the device is a regular block device, QEMU will still open the
>>>> device. For instance, I use a loopback device to test zone_report in
>>>> qemu-io. It returns ENOTTY which indicates Inappropriate ioctl for t=
he
>>>> device. Meanwhile, if using a regular block device when emulation a
>>>> zoned device on a guest os, the best case is that the guest can boot
>>>> but has no emulated block device. In some cases, QEMU just terminate=
s
>>>> because the block device has not met the alignment requirements.
>>>
>>> I'm not sure I understand all of this.  I'm also not sure I have to :=
)
>>
>> Maybe I didn't explain it very well. Which part would you like to know
>> more about?
>=20
> Let's try more specific questions.  Say I configure a zoned_host_device
> backed by a host device that isn't zoned.
>=20
> 1. Is this configuration accepted?

If we assume we have the special zoned_host_device driver, with the
associated command line zoned_host_device option explicitly calling for
it, then no, I do not think this should be allowed at all and an error
should be returned on startup. That would be consistent with the fact tha=
t
the options zoned_host_device and host_device are different to make sure
we can check that the user knows what he/she/them is doing.

If we have only host_device as a setup option and driver, the driver
methods can be trivially adjusted to do the right thing based on the
device type (i.e. zoned vs regular/not zoned). However, that would preven=
t
an interesting future extension of this work to implement a full zone
emulation on top of a regular (not zoned) host block device.

With this in mind, we currently have the following:

1) host_device option -> accept only regular non-zoned host block devices
2) zoned_host_device option -> accept only zoned host block devices

And in the future, we can have:

1) host_device option -> accept only regular non-zoned host block devices
2) zoned_host_device option -> accept any host block device type
	a) Use native zone kernel API for zoned host block devices
	b) Use full zone emulation for regular host block devices

But sure, internally, we could have a single driver structure with method=
s
adjusted to do the correct thing based on the device type and option
specified. Having a 1:1 mapping between the driver name and driver
structure does clarify things I think (even though there are indeed a lot
of methods that are identical).

>=20
> 2. Would a guest work as long as it doesn't touch this device?
>=20
> 3. Would a guest using this device work as long as it uses no zoned
>    features?
>=20
> 4. What happens when a guest tries to use zoned features?
>=20
> [...]
>=20

--=20
Damien Le Moal
Western Digital Research


