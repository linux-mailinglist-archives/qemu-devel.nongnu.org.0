Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2956539CCF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 07:52:40 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwHHb-0006A4-Ep
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 01:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144d26b56=damien.lemoal@opensource.wdc.com>)
 id 1nwHCm-00041G-Rm
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:47:41 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:25227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=144d26b56=damien.lemoal@opensource.wdc.com>)
 id 1nwHCk-0000X3-Tg
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 01:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1654062458; x=1685598458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MwhQuiZ0DqQlldP7YwmRQxH1ExI+IV75p+JxSGFEcDo=;
 b=ehycL5HZG4caLrruVsWM5CWRlKCjSaSD4w3qWhA4LgSvRHXC1tyfIrbH
 aXSnjU7RPeK4b8DdYU4FP1NbGfdxpFFk4uIVh73pxiSI/XfHEkE9bC5l5
 Xm/quMJ5zxHBn+ruD1XBzkL9/tnVaKJ9YbkPNJZDc+02iZ8gMIvMxpvTv
 HDTf4i4GAX63WKaCibZu709OfjTe7eo2GdjTY7qzHxCqRMCkjxrZfmG3t
 hhkcA0vypK42XNHiAeRs1m51itnKKaO3xnOMTxIdaLrFpQO5gktgyRCda
 peJNmAzfVap25ctI0K/kkfe9RxkfvKyMExaIc60O+X08wvh5pyTP5jhXI g==;
X-IronPort-AV: E=Sophos;i="5.91,266,1647273600"; d="scan'208";a="306204313"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jun 2022 13:47:26 +0800
IronPort-SDR: 6C8mnfNMVjyV/yr5tZL9mY6p/a1tksZRMpHyuUohp6A/qh5L3m7hycRLw/aHBSQEer29fIbyRS
 lzrkg6IsKdf1c6dKSmAOR7PTHE/F0EHl1mvC1SpC5OXXh/2C5A/i6d7d74gCa4RY5fXbii/SB7
 zwBfj/jI3Nq3XE+rcmqrBpCUGf3/gbTmw5yf3FouxxeA0EuPeRRliNFAuVEC4Bi+73um748+UT
 i3ZyVef6p7OaJ4QRdxQVxpXL2qcxhDf1BinMpyMY/uZ8iWV//Qv6Z9MswBfi9/9Z11fTXD3Opk
 N76r4qndTOBkdEXioTxyDZHj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 22:11:07 -0700
IronPort-SDR: HLQbb0Ic9FqahViymn/ATM/2FufbyWscncjh027IPLrPBlq3y8+ObnewOMjKyQhuS11ZQHMZwd
 Nhu9t05lFeIbacxm/ojumsHj3e+PPzIuNneWNKXjqQWEm9H9zwRxhgS7g0WmitexY60X+9VscH
 bTYvsz1hgJ0E37R3c5PFBdoDGMpoBzey7tcshusbO3bk7tMwrPVkFeCSfvFmfeTyCPMBfw0Uw6
 ZIOoosCP4B53rgccMKUm8RnYRfiP6gNQ39VeY0QdKIW7ljWhdHLr2ELLzjd/fVH+OFnqPXnk/R
 Neg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 22:47:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LCdT94tP4z1SVp0
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 22:47:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1654062444; x=1656654445; bh=MwhQuiZ0DqQlldP7YwmRQxH1ExI+IV75p+J
 xSGFEcDo=; b=LEi7IhyPe5D/DROk+CU4YLTFqo71sfYsRp9/i0/xdiELacN4Pu5
 4xPTd55RYzSe7riKKpN5Hx7yv2Be6x4bx7vppNQvsDC1cMVAlkgymaSlLWXq3rjQ
 OIwYjXGjlogWR9dAFbkqyJUq/rUzLxQYncZeDzTC+1/lKheEG8nH33QyK7BsWVq4
 8IgmPpMhJPzDkLYZpC9WIcOVfV6AiM7fm9sPJUfn+JOSDIqYt2GK5SSxhzkRGxhU
 WFtoHJ81QNdF0f56dFwqcYlIxSdyQh6dzecEQOcmbiGcPM7uGLCFecUZZ6J74eFX
 WcAww5x+O/1WY07iIwaOzKlpcsQGfwYMmCA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id EUVYRSK4jNBs for <qemu-devel@nongnu.org>;
 Tue, 31 May 2022 22:47:24 -0700 (PDT)
Received: from [10.225.163.63] (unknown [10.225.163.63])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LCdT76PnYz1Rvlc;
 Tue, 31 May 2022 22:47:23 -0700 (PDT)
Message-ID: <be663d15-6db3-1777-0830-60dcc6aa394e@opensource.wdc.com>
Date: Wed, 1 Jun 2022 14:47:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Outreachy project task: Adding QEMU block layer APIs resembling
 Linux ZBD ioctls.
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Hannes Reinecke
 <hare@suse.de>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>
References: <CAAAx-8+ECfznYPcJqPvP=7fzfgQobU1t+kGhGzWvArjm_Xs_yg@mail.gmail.com>
 <CAJSP0QURQOD79ixL2j__uBCuaJL19sytKpMr6QT2QY_+VnQPtg@mail.gmail.com>
 <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAAAx-8LsXQ=w7QTz0JHfGp6gbgY5najE0N7K0yBwhdqqH+E6Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=144d26b56=damien.lemoal@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

On 6/1/22 11:57, Sam Li wrote:
> Hi Stefan,
>=20
> Stefan Hajnoczi <stefanha@gmail.com> =E4=BA=8E2022=E5=B9=B45=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=B8=80 19:19=E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>>
>> On Mon, 30 May 2022 at 06:09, Sam Li <faithilikerun@gmail.com> wrote:
>>>
>>> Hi everyone,
>>> I'm Sam Li, working on the Outreachy project which is to add zoned
>>> device support to QEMU's virtio-blk emulation.
>>>
>>> For the first goal, adding QEMU block layer APIs resembling Linux ZBD
>>> ioctls, I think the naive approach would be to introduce a new stable
>>> struct zbd_zone descriptor for the library function interface. More
>>> specifically, what I'd like to add to the BlockDriver struct are:
>>> 1. zbd_info as zone block device information: includes numbers of
>>> zones, size of logical blocks, and physical blocks.
>>> 2. zbd_zone_type and zbd_zone_state
>>> 3. zbd_dev_model: host-managed zbd, host-aware zbd
>>> With those basic structs, we can start to implement new functions as
>>> bdrv*() APIs for BLOCK*ZONE ioctls.
>>>
>>> I'll start to finish this task based on the above description. If
>>> there is any problem or something I may miss in the design, please le=
t
>>> me know.
>>
>> Hi Sam,
>> Can you propose function prototypes for the new BlockDriver callbacks
>> needed for zoned devices?
>=20
> I have made some modifications based on Damien's device in design part
> 1 and added the function prototypes in design part 2. If there is any
> problem or part I missed, please let me know.
>=20
> Design of Block Layer APIs in BlockDriver:
> 1. introduce a new stable struct zbd_zone descriptor for the library
> function interface.
>   a. zbd_info as zone block device information: includes numbers of
> zones, size of blocks, write granularity in byte(minimal write size
> and alignment
>     - write granularity: 512e SMRs: writes in units of physical block
> size, 4096 bytes; NVMe ZNS write granularity is equal to the block
> size.
>     - zone descriptor: start, length, capacity, write pointer, zone typ=
e
>   b. zbd_zone_type
>     - zone type: conventional, sequential write required, sequential
> write preferred
>   c. zbd_dev_model: host-managed zbd, host-aware zbd

This explanation is a little hard to understand. It seems to be mixing up
device level information and per-zone information. I think it would be a
lot simpler to write a struct definition to directly illustrate what you
are planning.

It is something like this ?

struct zbd_zone {
	enum zone_type	type;
	enum zone_cond	cond;
	uint64_t	start;
	uint32_t	length;
	uint32_t	cap;
	uint64_t	wp;
};

strcut zbd_dev {
	enum zone_model	model;
	uint32_t	block_size;
	uint32_t	write_granularity;
	uint32_t	nr_zones
	struct zbd_zone	*zones;	/* array of zones */
};

If yes, then my comments are as follows.

For the device struct: It may be good to have also the maximum number of
open zones and the maximum number of active zones.

For the zone struct: You may need to add a read-write lock per zone to be
able to write lock zones to ensure a sequential write pattern (virtio
devices can be multi-queue and so writes may be coming in from different
contexts) and to correctly emulate zone append operations with an atomic
update of the wp field.

These need to be integrated into the generic block driver interface in
include/block/block_int-common.h or include/block/block-common.h.

>=20
>  2. implement new functions as bdrv*() APIs for BLK*ZONE ioctls
>    a. support basic operations: get the APIs working when executing
> the zone operations from a guest
>     - zone information access: report
>     - zone manipulation: reset,open,close,finish

These operations are generally referred to as "zone management" operation=
s.

>   b. support zone append operation: zone capacity, write pointer
> positions of all zones(excluded for now)
>     - can track the zone state we need: zone is full or not.
>=20
> More specifically, the function prototypes for 2a are as follows:
>=20
> int zbd_report_zones(int fd, off_t offset, off_t len, enum
> zbd_report_opetion ro, struct zbd_zone *zones, unsigned int
> *nr_zones);

The current virtio zone specification draft does not have a reporting
option field for the report zones command. However, it has a "partial"
field that will need to be passed to this function so that the correct
report zones reply can be built by the driver.

> int zbd_reset_zones(int fd, off_t offset, off_t len);
> int zbd_open_zones(int fd, off_t offset, off_t len);
> int zbd_close_zones(int fd, off_t offset, off_t len);
> int zbd_finish_zones(int fd, off_t offset, off_t len);

These 4 functions have the exact same signature, modulo the function name=
.
So we should simplify here to reduce the number of functions. Something l=
ike:

int zbd_zone_mgmt(int fd, enum zone_op op, off_t offset, off_t len);

where op can be BDRV_ZONE_RESET, BDRV_ZONE_OPEN, etc can aggregate all 4
functions into one.

In any case, if you look at how block drivers are defined (an example is
the one for raw files in qemu/block/file-posix.c) using the BlockDriver
data type (defined as a struct in qemu/include/block/block_int-common.h),
you will see that the driver callback functions do not use a file
descriptor (fd) but a pointer to some data structure (most of the time a
BlockDriverState pointer).

Another thing: you will need one more callback to get the device
information related to zones: maximum number of open and active zones at
least (the number of zones can be discovered with a report zones call).

Cheers.

--=20
Damien Le Moal
Western Digital Research

