Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3CF5B4C73
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 09:12:45 +0200 (CEST)
Received: from localhost ([::1]:50852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXH92-0001lI-JZ
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 03:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXH2D-0006p8-9a
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 03:05:42 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2461b4889=damien.lemoal@opensource.wdc.com>)
 id 1oXH2B-0001Ea-E9
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 03:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662879937; x=1694415937;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1pmUYLMTXcbmHYaROD1ZtVZcjMG3J0DLJ6y8w2MvHg4=;
 b=R/w20AK21bbioiukiMhiPeVM6RjyDYbjCTthJUNnrLeUjVuXCNFBQ47w
 HDH+5uLb/HuGhdUm1jxHnHYdIKCmRzGjRpYsmfH7/+tCNYxHXypbTb5rv
 wJ3LPZSfARTgRfZKar1iyaTJ386NwJruqHfIwYZ2PU10W2wkj/nMGYvSt
 YZVl5ZbppakT/lm9lYGNKzVYF2NVmCf0uFXddfnyHvNUO+fKegDB1oVWU
 tvMXwaQAHO2i3c5PFo8AxiWmv0msS4yoVugnR706Rgj/96zNDqAWKAZC6
 zvL+fn0Ahbiu4lUb/p2ImJHfHN96aSLlC9L9Z5WeKS1ML38wmpZYykjHS g==;
X-IronPort-AV: E=Sophos;i="5.93,307,1654531200"; d="scan'208";a="216206971"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2022 15:05:32 +0800
IronPort-SDR: VcjuJ4guoHsmuUMYOox9lF3v1/yfST80dvaJYLJpsggTZy1vDT22hmc4aSggneW59ZFD6X8hzn
 +Vkt5oRQcC2hbkIm0Z9LOhWCaQ42FkLgWi7zmk9YNTSG3tmplfbgvpjc8zlZmFWyohaALoheBk
 eNT/HZer+ByQ56+p/i19G235gc51kN5Jkvvx42JQsmCUepXN8BI/ghl7zFLj//6n0L/lyHUXTi
 VlTSALVEhhDKjs3mJxw1n3iG8xQ6E4rX4zxJrQty4yedG/RNQzu9avqvVBFhn0oXrUbfTPUbN+
 WY2B9g08vCKc0CQEyqCP34qt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Sep 2022 23:25:50 -0700
IronPort-SDR: K/bi5bZhFPRN9d+VILKYPEQIA/txp26SKMI2qHR6YiiuRjtYMDRb3ZCwWQAcHO0yXsE7TpFF8i
 1I4naAg8OuKPvq2byxDDXHRTgy5bcELNN3JLQJEU+7bx+fn8xxCGTCZBVu8Zwd2QLfyab/rnym
 gAHtMxbeUk6TK1MDud1kSet+VI5MHnA7dISCSjjEnegQpEuR3U2QMhg4V5hRqbF/SAmU5cH1wr
 Ql6jvlzXBUZBsEE6gNG8u13V19Ul+kfrtOnO53M3NF8CEeO7vQiNAf8Tw/3eztHisDEa92MU6Y
 k7s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2022 00:05:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MQLND2hTDz1RwvT
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 00:05:32 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1662879931; x=1665471932; bh=1pmUYLMTXcbmHYaROD1ZtVZcjMG3J0DLJ6y
 8w2MvHg4=; b=rOjhLo0IK/1UyNvcRWEokO01kKt8RXWYJyLKjoiGDbP+fyogkj0
 fkOW1v4i1Z+Z5ciOkYTss6/WYK3oworbwfxWhUbSbtYpYu7dPp5+7QDRsyt2TZDP
 OnLDSn2Ldgrp8FqITY46AaeHV0ql2lgpOz6+a+k93GAsDi4Vap0X+PkzpyLsvI6q
 VLLXlQKM97sbjTndfnhD8P0XjrL1Cm/JIsR2V+HdIjFbwclEhFUEGlBI2y2x1u1/
 wjlJ9UEF4vTEMD92y6ppDS/cSkxQ6Wq0skmX8WMFYGd0fjqk40DLG99QXmJoNV9P
 fGFfgRda1XHtaSeGD89+nkKc9EkgIIcLUJg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id aYepw1GIpZU7 for <qemu-devel@nongnu.org>;
 Sun, 11 Sep 2022 00:05:31 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MQLN86JXWz1RvLy;
 Sun, 11 Sep 2022 00:05:28 -0700 (PDT)
Message-ID: <1db0d6a2-9664-d5f5-14ec-a03fec9a54d2@opensource.wdc.com>
Date: Sun, 11 Sep 2022 16:05:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v9 5/7] config: add check to block layer
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu block <qemu-block@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.de>, Hanna Reitz <hreitz@redhat.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-6-faithilikerun@gmail.com>
 <99fd65d9-a44d-5ff6-f646-9121f1874480@opensource.wdc.com>
 <CAAAx-8KXM+PcAAktOaisNeqaq_0K6ntNupa_F-UL_NGg55_C2Q@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8KXM+PcAAktOaisNeqaq_0K6ntNupa_F-UL_NGg55_C2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2461b4889=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
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

On 2022/09/11 15:54, Sam Li wrote:
> Damien Le Moal <damien.lemoal@opensource.wdc.com> =E4=BA=8E2022=E5=B9=B4=
9=E6=9C=8811=E6=97=A5=E5=91=A8=E6=97=A5 13:34=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On 2022/09/10 14:27, Sam Li wrote:
>>> Putting zoned/non-zoned BlockDrivers on top of each other is not
>>> allowed.
>>>
>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>  block.c                          | 14 ++++++++++++++
>>>  block/file-posix.c               | 14 ++++++++++++++
>>>  block/raw-format.c               |  1 +
>>>  include/block/block_int-common.h |  5 +++++
>>>  4 files changed, 34 insertions(+)
>>>
>>> diff --git a/block.c b/block.c
>>> index bc85f46eed..dad2ed3959 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_b=
s, BlockDriverState *child_bs,
>>>          return;
>>>      }
>>>
>>> +    /*
>>> +     * Non-zoned block drivers do not follow zoned storage constrain=
ts
>>> +     * (i.e. sequential writes to zones). Refuse mixing zoned and no=
n-zoned
>>> +     * drivers in a graph.
>>> +     */
>>> +    if (!parent_bs->drv->supports_zoned_children &&
>>> +        child_bs->bl.zoned =3D=3D BLK_Z_HM) {
>>
>> Shouldn't this be "child_bs->bl.zoned !=3D BLK_Z_NONE" ?
>=20
> The host-aware model allows zoned storage constraints(sequentially
> write) and random write. Is mixing HA and non-zoned drivers allowed?
> What's the difference?

Yes, HA devices can be used as regular devices too. If you are allowing t=
his
here, then add a comment explaining it. It may also be good to add a mess=
age
like "Using host-aware device as a regular device" here for the HA case.
>=20
>>
>>> +        error_setg(errp, "Cannot add a %s child to a %s parent",
>>> +                   child_bs->bl.zoned =3D=3D BLK_Z_HM ? "zoned" : "n=
on-zoned",
>>> +                   parent_bs->drv->supports_zoned_children ?
>>> +                   "support zoned children" : "not support zoned chi=
ldren");
>>> +        return;
>>> +    }
>>> +
>>>      if (!QLIST_EMPTY(&child_bs->parents)) {
>>>          error_setg(errp, "The node %s already has a parent",
>>>                     child_bs->node_name);
>>> diff --git a/block/file-posix.c b/block/file-posix.c
>>> index 4edfa25d04..354de22860 100644
>>> --- a/block/file-posix.c
>>> +++ b/block/file-posix.c
>>> @@ -779,6 +779,20 @@ static int raw_open_common(BlockDriverState *bs,=
 QDict *options,
>>>              goto fail;
>>>          }
>>>      }
>>> +#ifdef CONFIG_BLKZONED
>>> +    /*
>>> +     * The kernel page chache does not reliably work for writes to S=
WR zones
>>> +     * of zoned block device because it can not guarantee the order =
of writes.
>>> +     */
>>> +    if (strcmp(bs->drv->format_name, "zoned_host_device") =3D=3D 0) =
{
>>> +        if (!(s->open_flags & O_DIRECT)) {
>>> +            error_setg(errp, "driver=3Dzoned_host_device was specifi=
ed, but it "
>>> +                             "requires cache.direct=3Don, which was =
not specified.");
>>> +            ret =3D -EINVAL;
>>
>> This line is not needed. Simply "return -EINVAL;".
>>
>>> +            return ret; /* No host kernel page cache */
>>> +        }
>>> +    }
>>> +#endif
>>>
>>>      if (S_ISBLK(st.st_mode)) {
>>>  #ifdef BLKDISCARDZEROES
>>> diff --git a/block/raw-format.c b/block/raw-format.c
>>> index 6b20bd22ef..9441536819 100644
>>> --- a/block/raw-format.c
>>> +++ b/block/raw-format.c
>>> @@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, =
BdrvChild *c,
>>>  BlockDriver bdrv_raw =3D {
>>>      .format_name          =3D "raw",
>>>      .instance_size        =3D sizeof(BDRVRawState),
>>> +    .supports_zoned_children =3D true,
>>>      .bdrv_probe           =3D &raw_probe,
>>>      .bdrv_reopen_prepare  =3D &raw_reopen_prepare,
>>>      .bdrv_reopen_commit   =3D &raw_reopen_commit,
>>> diff --git a/include/block/block_int-common.h b/include/block/block_i=
nt-common.h
>>> index 078ddd7e67..043aa161a0 100644
>>> --- a/include/block/block_int-common.h
>>> +++ b/include/block/block_int-common.h
>>> @@ -127,6 +127,11 @@ struct BlockDriver {
>>>       */
>>>      bool is_format;
>>>
>>> +    /*
>>> +     * Set to true if the BlockDriver supports zoned children.
>>> +     */
>>> +    bool supports_zoned_children;
>>> +
>>>      /*
>>>       * Drivers not implementing bdrv_parse_filename nor bdrv_open sh=
ould have
>>>       * this field set to true, except ones that are defined only by =
their
>>
>> --
>> Damien Le Moal
>> Western Digital Research
>>

--=20
Damien Le Moal
Western Digital Research


