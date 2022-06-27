Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11355BC71
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 01:16:07 +0200 (CEST)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xxe-000894-R0
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 19:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=170b2e668=damien.lemoal@opensource.wdc.com>)
 id 1o5xvh-0006j6-L7
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 19:14:05 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:39977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=170b2e668=damien.lemoal@opensource.wdc.com>)
 id 1o5xve-0003sD-1u
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 19:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656371640; x=1687907640;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SbTBWk2Nm7mjY+3rARzAUJUXG2/iEzqf82JXFfxidfk=;
 b=JSsHyQw2A+98O5tp4JTI+dKFzWfl5u5iZYfSGs8ePClFrR6YJANp1U3n
 VgMwz1PKn6JMycKWUhlJ6Wu6BjlTPqqcdRZ1bHT4vDuWJleCo+3qPLI1i
 2Bc5u+yacrAe7cNEZyjyRYDIlHSfmmPYrzK2V3AXKqPU7EK62OHqufqSh
 7m/JURI2xAar4161U//dje5sccQDUjrc+MBZG/ZNggEiwIY6sbK5IjTSb
 0Ff49JHK++oKEqL2jaozy1GYCTn8SXWo41mjv2jov7m6bC+jDzgJNQ3aJ
 CncdRHpbSTpYDVB8kK2UdUxJFgu3jh4HMbijpkdIDk+2bz8wId5ErAGMi Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; d="scan'208";a="209101698"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 07:13:56 +0800
IronPort-SDR: r5BmcUUkC7anh5U7yvqbrEYrkMxa7Kr1GNog7KqYXk0qVcSxNwJWbrOKjhtUEwVAZHUmPA8UAf
 jmYBTqU7TJnj6TmCenpqPATVN9+Kmkz6pqkH6DBzNCtBuGMYIutuWRraE33AWOmJJsf4lu69N9
 yqbjyZLt/PkIPpAWO+vNDl+sYkmQgsEh7yCJnP2t47gcB3M76mdl1Zomr/SMZjYXHPvJ2cyuJx
 7jQj4aWb0nfowwAL/Tw4NpFF8mfSlyMUxVN44rTymFsZQ7jciUpvL8XbLGJZbOYQEQIlJBwVtf
 dRnSpmFIlw1PBt5sQqhraHbx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 15:31:37 -0700
IronPort-SDR: 3vSWFOETHRu41htH3BklIw7Jjy6yywnPYoJWNkJwzvs7DGbKf9R7N7sdyvP/nVqLc2lUWMpxG7
 jLa2oI+E9iCgcsnsejuSc2Sxka0/gx3/S6v8yF8kgjISUaVB3LDm26iF3GyoNNIJiLKZBKxzBl
 r0+Z3VL/Hk+pFvZYcmJ3o6XWTUgyQWFpi8R+tAg8W8OdOQlBJ9vYV+P1Z4Kv5tdRC5r7si5Cvg
 QeUIRYv8qDMwT0k3aBhNQMDss7Il+caHk5c18YitJ+vko9P+DSXvjdVw1W5t+Xt6oeTuorVGwB
 NJI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 16:13:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LX3Sh563Xz1RwqM
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 16:13:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656371635; x=1658963636; bh=SbTBWk2Nm7mjY+3rARzAUJUXG2/iEzqf82J
 XFfxidfk=; b=hzn44E0YjEoCiCSeYY9niSJcO4PtL6WtnIT0V752/AC/He/rZRT
 DjY1C2oPWw/VV39zY6x/6Yrd4qxqogd3tuC/zIj3YImAtEPrH4f2g7O4OQONR4cp
 95vWnE4YOABZr6v2OTyVOUnHRJx8UZtB+eNt3A6lfGpwH/8E2c1ubb83giDoOqye
 Oh/X0XZ+rdVo6ia3lj3E5mLRv3RMXm9LbbjGoS8VyTVGQJJkP4nlN9nVt9P51qv1
 2k5MQHGkrOA2lenAMlU2V0GwWYI6nvr5TVNpzDSV1OwG/aW/HpLt7N+c/nJR5o+q
 PLkKXu+UQZIyFtyORH/LU044EZG59i9DMkg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7Ys3R2fCJ4_K for <qemu-devel@nongnu.org>;
 Mon, 27 Jun 2022 16:13:55 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LX3Sd3TQBz1RtVk;
 Mon, 27 Jun 2022 16:13:53 -0700 (PDT)
Message-ID: <1b8eeb70-8068-da8b-191a-fd603cd2d08b@opensource.wdc.com>
Date: Tue, 28 Jun 2022 08:13:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v2] Adding block layer APIs resembling Linux ZoneBlockDevice
 ioctls.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Hannes Reinecke <hare@suse.de>
References: <20220620033611.82166-1-faithilikerun@gmail.com>
 <YrAn2f4ORFziZ8vk@stefanha-x1.localdomain>
 <CAAAx-8JdYAKfoS_xBxx5g2iAJFoAHLMqDkz5QA6jhw2QH1L0=w@mail.gmail.com>
 <YrXdJQe+KiRcM5RN@stefanha-x1.localdomain>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <YrXdJQe+KiRcM5RN@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=170b2e668=damien.lemoal@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

On 6/25/22 00:49, Stefan Hajnoczi wrote:
> On Fri, Jun 24, 2022 at 11:14:32AM +0800, Sam Li wrote:
>> Hi Stefan,
>>
>> Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2022=E5=B9=B46=E6=9C=88=
20=E6=97=A5=E5=91=A8=E4=B8=80 15:55=E5=86=99=E9=81=93=EF=BC=9A
>>>
>>> On Mon, Jun 20, 2022 at 11:36:11AM +0800, Sam Li wrote:
>>>
>>> Hi Sam,
>>> Is this version 2 of "[RFC v1] Add support for zoned device"? Please
>>> keep the email subject line the same (except for "v2", "v3", etc) so
>>> that it's clear which patch series this new version replaces.
>>>
>>>> Fix some mistakes before. It can report a range of zones now.
>>>
>>> This looks like the description of what changed compared to v1. Pleas=
e
>>> put the changelog below "---" in the future. When patch emails are
>>> merged by git-am(1) it keeps the text above "---" and discards the te=
xt
>>> below "---". The changelog is usually no longer useful once the patch=
es
>>> are merged, so it should be located below the "---" line.
>>>
>>> The text above the "---" is the commit description (an explanation of
>>> why this commit is necessary). In this case the commit description
>>> should explain that this patch adds .bdrv_co_zone_report() and
>>> .bdrv_co_zone_mgmt() to BlockDriver so that zoned block devices can b=
e
>>> supported.
>>>
>>>>
>>>> Signed-off-by: Sam Li <faithilikerun@gmail.com>
>>>> ---
>>>>  block/block-backend.c             |  22 ++++
>>>>  block/coroutines.h                |   5 +
>>>>  block/file-posix.c                | 182 +++++++++++++++++++++++++++=
+++
>>>>  block/io.c                        |  23 ++++
>>>>  include/block/block-common.h      |  43 ++++++-
>>>>  include/block/block-io.h          |  13 +++
>>>>  include/block/block_int-common.h  |  20 ++++
>>>>  qemu-io-cmds.c                    | 118 +++++++++++++++++++
>>>>  tests/qemu-iotests/tests/zoned.sh |  52 +++++++++
>>>>  9 files changed, 477 insertions(+), 1 deletion(-)
>>>>  create mode 100644 tests/qemu-iotests/tests/zoned.sh
>>>>
>>>> diff --git a/block/block-backend.c b/block/block-backend.c
>>>> index e0e1aff4b1..20248e4a35 100644
>>>> --- a/block/block-backend.c
>>>> +++ b/block/block-backend.c
>>>> @@ -104,6 +104,8 @@ typedef struct BlockBackendAIOCB {
>>>>      int ret;
>>>>  } BlockBackendAIOCB;
>>>>
>>>> +
>>>> +
>>>
>>> Please avoid whitespace changes in code that is otherwise untouched b=
y
>>> your patch. Code changes can cause merge conflicts and they make it
>>> harder to use git-annotate(1), so only changes that are necessary sho=
uld
>>> be included in a patch.
>>>
>>>>  static const AIOCBInfo block_backend_aiocb_info =3D {
>>>>      .get_aio_context =3D blk_aiocb_get_aio_context,
>>>>      .aiocb_size =3D sizeof(BlockBackendAIOCB),
>>>> @@ -1810,6 +1812,25 @@ int blk_flush(BlockBackend *blk)
>>>>      return ret;
>>>>  }
>>>>
>>>
>>> Please add a documentation comment for blk_co_zone_report() that
>>> explains how to use the functions and the purpose of the arguments. F=
or
>>> example, does offset have to be the first byte in a zone or can it be
>>> any byte offset? What are the alignment requirements of offset and le=
n?
>>> Why is nr_zones a pointer?
>>>
>>>> +int blk_co_zone_report(BlockBackend *blk, int64_t offset, int64_t l=
en,
>>>
>>> Functions that run in coroutine context must be labeled with
>>> coroutine_fn:
>>>
>>>     int coroutine_fn blk_co_zone_report(...)
>>>
>>> This tells humans and tools that the function can only be called from=
 a
>>> coroutine. There is a blog post about coroutines in QEMU here:
>>> https://blog.vmsplice.net/2014/01/coroutines-in-qemu-basics.html
>>>
>>>> +                       int64_t *nr_zones,
>>>> +                       struct BlockZoneDescriptor *zones)
>>>
>>> QEMU coding style uses typedefs when defining structs, so "struct
>>> BlockZoneDescriptor *zones" should be written as "BlockZoneDescriptor
>>> *zones".
>>>
>>>> +{
>>>> +    int ret;
>>>
>>> This function is called from the I/O code path, please mark it with:
>>>
>>>   IO_CODE();
>>>
>>> From include/block/block-io.h:
>>>
>>>   * I/O API functions. These functions are thread-safe, and therefore
>>>   * can run in any thread as long as the thread has called
>>>   * aio_context_acquire/release().
>>>   *
>>>   * These functions can only call functions from I/O and Common categ=
ories,
>>>   * but can be invoked by GS, "I/O or GS" and I/O APIs.
>>>   *
>>>   * All functions in this category must use the macro
>>>   * IO_CODE();
>>>   * to catch when they are accidentally called by the wrong API.
>>>
>>>> +    ret =3D bdrv_co_zone_report(blk->root->bs, offset, len, nr_zone=
s, zones);
>>>
>>> Please add blk_inc_in_flight(blk) and blk_dec_in_flight(blk) around t=
his
>>> function call to ensure that zone report requests finish before I/O i=
s
>>> drained (see bdrv_drained_begin()). This is necessary so that it's
>>> possible to wait for I/O requests, including zone report, to complete=
.
>>>
>>> Similar to blk_co_do_preadv() we need blk_wait_while_drained(blk),
>>> blk_check_byte_request(), and bdrv_inc_in_flight(bs) before calling
>>> bdrv_co_zone_report(). bdrv_dec_in_flight(bs) needs to be called afte=
r
>>> bdrv_co_zone_report() returns.
>>>
>> After adding similar structure to blk_co_do_preadv(), zone operation
>> command will always fail at blk_wait_while_drained(blk) because
>> blk->inflight <=3D 0. Would it be ok to just remove
>> blk_wait_while_drained?
>=20
> Are you hitting the assertion in
> block/block-backend.c:blk_wait_while_drained()?
>=20
>   assert(blk->in_flight > 0);
>=20
> If yes, then there is a bug in the code. You need to make sure that
> blk_inc_in_flight() is called before blk_wait_while_drained().
>=20
>>>> +    BLK_ZT_CONV =3D BLK_ZONE_TYPE_CONVENTIONAL,
>>>> +    BLK_ZT_SWR =3D BLK_ZONE_TYPE_SEQWRITE_REQ,
>>>> +    BLK_ZT_SWP =3D BLK_ZONE_TYPE_SEQWRITE_PREF,
>>>> +};
>>>> +
>>>> +enum zone_cond {
>>>> +    BLK_ZS_NOT_WP =3D BLK_ZONE_COND_NOT_WP,
>>>> +    BLK_ZS_EMPTY =3D BLK_ZONE_COND_EMPTY,
>>>> +    BLK_ZS_IOPEN =3D BLK_ZONE_COND_IMP_OPEN,
>>>> +    BLK_ZS_EOPEN =3D BLK_ZONE_COND_EXP_OPEN,
>>>> +    BLK_ZS_CLOSED =3D BLK_ZONE_COND_CLOSED,
>>>> +    BLK_ZS_RDONLY =3D BLK_ZONE_COND_READONLY,
>>>> +    BLK_ZS_FULL =3D BLK_ZONE_COND_FULL,
>>>> +    BLK_ZS_OFFLINE =3D BLK_ZONE_COND_OFFLINE,
>>>> +};
>>>
>>> This 1:1 correspondence with Linux constants could make the code a
>>> little harder to port.
>>>
>>> Maybe QEMU's block layer should define its own numeric constants so t=
he
>>> code doesn't rely on operating system-specific headers.
>>> block/file-posix.c #ifdef __linux__ code can be responsible for
>>> converting Linux-specific constants to QEMU constants (and the 1:1
>>> mapping can be used there).
>>>
>> Can we define those constants in block-common.h? Because
>> BlockZoneDescriptor requires zone_condition, zone_type defined and
>> BlockZoneDesicriptor are used in header files and qemu-io
>> sub-commands. If we use #ifdef __linux__ in block-common.h, it can be
>> responsible for converting Linux constants instead.
>>
>> Thanks for reviewing! If there is any problem, please let me know.
>=20
> I suggest defining the constants in block-common.h. #ifdef __linux__ is
> not necessary in block-common.h because the constants should just be an
> enum with BLK_ZS_NOT_WP =3D 0 and so on (no need for Linux headers).
>=20
> In block/file-posix.c you can define a helper function inside #ifdef
> __linux__ that does something like:
>=20
>   BlkZoneCond zone_cond_from_linux(enum blk_zone_cond val)
>   {
>       switch (val) {
>       case BLK_ZONE_COND_NOT_WP:
>           return BLK_ZS_NOT_WP;
>       ...
>   }
>=20
> The code in block/file-posix.c should call this helper to convert from
> Linux values to QEMU values.

Given that the entire zone API is Linux specific (as far as I know), we d=
o
not need to have these helpers: the entire code for zones needs to be
under a #ifdef __linux__.

But the conversion from Linux struct blk_zone to qemu zone descriptor
still needs to be done. And the perfect place to do this is the
parse_zone() function. There, we can add:

	switch (blkz->cond) {
	case BLK_ZONE_COND_NOT_WP:
		zone->cond =3D BLK_ZS_NOT_WP;
		break;
	...
	}

And same for zone type. That will also allow checking the values returned
by Linux. ZBC-2 defines more zone types and zone conditions than currentl=
y
defined in /usr/include/linux/blkzoned.h. If these new zone
types/conditions ever get supported by Linux, qemu can catch the values i=
t
does not support and reject the drive.

>=20
> This way the QEMU block layer does not use Linux constants and compiles
> on non-Linux machines.
>=20
> Stefan


--=20
Damien Le Moal
Western Digital Research

