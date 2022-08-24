Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA825A04DC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 01:54:50 +0200 (CEST)
Received: from localhost ([::1]:33002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0Cw-0004dM-2N
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 19:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2287b66a8=damien.lemoal@opensource.wdc.com>)
 id 1oR0Bf-000381-QH
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:53:31 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:57168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2287b66a8=damien.lemoal@opensource.wdc.com>)
 id 1oR0BX-00033k-PV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661385203; x=1692921203;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=uYg+KXYrt8OAQIM5YDzJiwYrcVa8Kz1VHZTOcyBwsmY=;
 b=o1BqnwZ6hfI2w/5zaCSjgIPhWOgKQqJx5hjt5Mfag2k0TApXOHaXPV1m
 855yU9kYOQUSoldx6MH3GhiZOhcX0ygiMW3XMY3b/KU7PcGIfaSqmwsCh
 ilL4vtcLIXenVa37AJQA7dOsBLZUD7oaDvzG1Aquj7GVl23kOKGSpg8J4
 XsmMT3xWQqK5qSK8Up8HHDmPl+1GFLHRJei25JFBlJMfKq7ABDrj5EjG2
 qzrCJD/KDHZflYn7HXwiSf+mm/xun3pXdoJl0TeBqq/pd3p7RO5dG34Gn
 wVRkENErMZxsbzD76+2ptszctoY5kyQ3ywTQAQg3C+yZeEJTKW/iIKHWv w==;
X-IronPort-AV: E=Sophos;i="5.93,261,1654531200"; d="scan'208";a="321685233"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Aug 2022 07:53:21 +0800
IronPort-SDR: FcJ16lOEKakLR2BrcccvnhTY3kutvRvC6vlv4Vhn0Nh+phw+CdXFIrRcf7k8I9dcYBLqLIn2zo
 hbuI14fxL+fb5eVP85GQQqt4s1AByBRZEVORrecNT8prIi/d/oJNmCvOKDiPxmkuhWCqtmbFjz
 z3kB+WQaNNwxGOKObDBr2GjCuwaiieCT4IYqDSfMNxRExfZ+jdigWTp+I3QCc0P3Q1K0zey7jg
 2ekUYQOW9aSKleWw5TXdi5EPh1El3CozcAKO07jwvGwR9O+dAJcrfJ/7JXnba4bf2x9wz7dUZs
 RXl2jx8B7hZLpZA3xGezqv0g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 16:13:59 -0700
IronPort-SDR: i5YXkwTVMBecyu6aCgHbESletqvVCrumIA9v0HID9c0NFdAwTt+3lt3A+HxRT7Mj6P90JH8s4L
 UTwTpUw562QO19nwx29XXVfYr8QVAVCVCwgON4VC0LtHbf5wzGESBHianPbAsplE4J4WHJpLz4
 lEoFhllkkTp0K7QQpSPA4kDMamC4ivKxe+SFR3E6gunhBDPk8Meg9b46VLfTC0YW1Mg61mEuhf
 woaah6UeoGKxYtALriR9abnUECZQRhnJ5lUZ7BwJoCRqQGqs4u6XcivUnWPniY/l2OtRuJdQDT
 9cU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2022 16:53:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MCjbN2Xg9z1Rws0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 16:53:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:references:to:from:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1661385199; x=1663977200; bh=uYg+KXYrt8OAQIM5YDzJiwYrcVa8Kz1VHZT
 OcyBwsmY=; b=Y9s4RcKHLUyaglk1vn233G00qU6+XyWtnW/3k1gHVam/m9tJQy1
 7RMFUVBUySOERxeIHcR2TUWwf3+LuHdLN8h5PsyRAftHtE2/8EOzq6Jr0L4dGtsK
 Za51nvyz/p9Ck5dnFMJRe9ZS5jaHxaT/qx+/dz1g8FyhVS40zqF7PQ8D/h1bPfuK
 yVhWwEml1Pi7wuQgBpROsn3R6FBcdXNtXwVgQiJQbF/Upb+M9htNk1+MTyad/xHr
 h58OPNJoYxHS+LX8pE2MIIBFAcrNI8W8MsjNtVG8BMNDsbC6oL2RD+6rX1GR1CNb
 SRNfHga1Sh2XM5E02eUALnwZ0Z0yq0CyT2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7zVJBJ_1xqyG for <qemu-devel@nongnu.org>;
 Wed, 24 Aug 2022 16:53:19 -0700 (PDT)
Received: from [10.89.82.240] (c02drav6md6t.dhcp.fujisawa.hgst.com
 [10.89.82.240])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MCjbK6KKGz1RtVk;
 Wed, 24 Aug 2022 16:53:17 -0700 (PDT)
Message-ID: <a12667a1-2660-fe9e-558d-59bcbcb434d9@opensource.wdc.com>
Date: Wed, 24 Aug 2022 16:53:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v7 4/8] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hannes Reinecke <hare@suse.de>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 qemu block <qemu-block@nongnu.org>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
 <20220816062522.85714-5-faithilikerun@gmail.com> <YwQkAs3+aUAvarMA@fedora>
 <CAAAx-8Jk1d4wO5bfNPOLb_XStOC8Bz07kxVbBC3f9-+u3ZxXqA@mail.gmail.com>
 <3869f149-3fd9-8885-7afe-f3e94050e52e@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <3869f149-3fd9-8885-7afe-f3e94050e52e@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2287b66a8=damien.lemoal@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

On 2022/08/24 16:46, Damien Le Moal wrote:
> On 2022/08/22 21:12, Sam Li wrote:
>> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B48=E6=9C=88=
23=E6=97=A5=E5=91=A8=E4=BA=8C 08:49=E5=86=99=E9=81=93=EF=BC=9A
>>>
>>> On Tue, Aug 16, 2022 at 02:25:18PM +0800, Sam Li wrote:
[...]>>>> +    blkz =3D (struct blk_zone *)(rep + 1);
>>>> +    while (n < nrz) {
>>>> +        memset(rep, 0, rep_size);
>>>> +        rep->sector =3D sector;
>>>> +        rep->nr_zones =3D nrz - n;
>>>> +
>>>> +        ret =3D ioctl(fd, BLKREPORTZONE, rep);
>>>
>>> Does this ioctl() need "do { ... } while (ret =3D=3D -1 && errno =3D=3D=
 EINTR)"?
>>
>> No? We discussed this before. I guess even EINTR should be propagated
>> back to the guest. Maybe Damien can talk more about why.
>=20
> In the kernel, completion of zone management IO requests are waited for=
 using
> wait_for_completion_io() which uses TASK_UNINTERRUPTIBLE. So a signal w=
ill not
> abort anything. So I do not think that the do { } while() loop is neces=
sary.

Note: I do not think the loop to be necessary, but it will not hurt :)

--=20
Damien Le Moal
Western Digital Research

