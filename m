Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14E96E485
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 12:49:26 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoQS5-0000i4-SL
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 06:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58466)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wrfsh@yandex-team.ru>) id 1hoQRq-0000BW-TA
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 06:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wrfsh@yandex-team.ru>) id 1hoQRp-0001Os-MS
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 06:49:10 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:55410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wrfsh@yandex-team.ru>)
 id 1hoQRh-0000I7-Kx; Fri, 19 Jul 2019 06:49:02 -0400
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 4440D2E14F9;
 Fri, 19 Jul 2019 13:48:10 +0300 (MSK)
Received: from smtpcorp1p.mail.yandex.net (smtpcorp1p.mail.yandex.net
 [2a02:6b8:0:1472:2741:0:8b6:10])
 by mxbackcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 Hjudyt7ELw-m9BWQXCt; Fri, 19 Jul 2019 13:48:10 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1563533290; bh=ifcbJ5mCnRTc9HPTtjguN2q7pIUHbvFkIUvRVNI7duE=;
 h=In-Reply-To:Message-ID:From:Date:References:To:Subject:Cc;
 b=PlHyvZLeZb5BpHmgBqXkGiSnS1GVFHHxCUJHQcPQa/Zk8CuZ4L9OZSMMIRizWVED3
 8NdIQe+KfYEPhhxXW8pCpeTKpSIHxwpOfssN1JJGO0r7jJ8pVASEqtyDSwvmkn5anw
 aArrq6bozqGyJOXgSbZGe50xNHN22IIN9berPbyg=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:40c:f68c:50ff:fee9:44bd])
 by smtpcorp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 DhWMkB8CPG-m96SYqK7; Fri, 19 Jul 2019 13:48:09 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <8146312c-8a9c-3c4e-ab80-a3f42cc1d6ce@yandex-team.ru>
 <20190719101757.GF18585@stefanha-x1.localdomain>
From: Evgeny Yakovlev <wrfsh@yandex-team.ru>
Message-ID: <77df2959-c5d1-5cf6-304a-7f9ad6af8a51@yandex-team.ru>
Date: Fri, 19 Jul 2019 13:48:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719101757.GF18585@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
Subject: Re: [Qemu-devel] BDRV request fragmentation and vitio-blk write
 submission guarantees
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.07.2019 13:17, Stefan Hajnoczi wrote:
> On Thu, Jul 18, 2019 at 04:44:17PM +0300, =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=
=D0=B8=D0=B9 =D0=AF=D0=BA=D0=BE=D0=B2=D0=BB=D0=B5=D0=B2 wrote:
>> Hi everyone,
>>
>> We're currently working on implementing a qemu BDRV format driver whic=
h we
>> are using with virtio-blk devices.
>>
>> I have a question concerning BDRV request fragmentation and virtio-blk=
 write
>> request submission which is not entirely clear to me by only reading v=
irtio
>> spec. Could you please consider the following case and give some addit=
ional
>> guidance?
>>
>> 1. Our BDRV format driver has a notion of max supported transfer size.=
 So we
>> implement BlockDriver::bdrv_refresh_limits where we fill out
>> BlockLimits::max_transfer and opt_transfer fields.
>>
>> 2. virtio-blk exposes max_transfer as a virtio_blk_config::opt_io_size
>> field, which (according to spec 1.1) is a **suggested** maximum. We re=
ad
>> "suggested" as "guest driver may still send requests that don't fit in=
to
>> opt_io_size and we should handle those"...
>>
>> 3. ... and judging by code in block/io.c qemu block layer handles such
>> requests by fragmenting them into several BDRV requests if request siz=
e is >
>> max_transfer
>>
>> 4. Guest will see request completion only after all fragments are hand=
led.
>> However each fragment submission path can call qemu_coroutine_yield an=
d move
>> on to submitting next request available in virtq before completely
>> submitting the rest of the fragments. Which means the following situat=
ion is
>> possible where BDRV sees 2 write requests in virtq, both of which are =
larger
>> than max_transfer:
>>
>> ||
>>
>> |Blocks: |-------------------------------------> Write1: xxxxxxxx Writ=
e2:
>> yyyyyyyy Write1Chunk1: xxxx Write2Chunk1: yyyy Write2Chunk2: yyyy
>> Write1Chunk1: xxxx Blocks: |------------yyyyxxxx----------------->|
>>
>> ||
>>
>> |In above scenario guest virtio-blk driver decided to submit 2 interse=
cting
>> write requests, both of which are larger than ||max_transfer, and then=
 call
>> hypervisor.|
>>
>> |I understand that virtio-blk may handle requests out of order, so gue=
st
>> must not make any assumptions on relative order in which those request=
s will
>> be handled.|
>>
>> |However, can guest driver expect that whatever the submission order w=
ill
>> be, the actual intersecting writes will be atomic?|
>>
>> |In other words, will it be correct for conforming virtio-blk driver t=
o
>> expect only "|||xxxxxxxx" or "||||yyyyyyyy" but not anything else in
>> between, after both requests are reported as completed?||
>>
>> ||Because i think that is something that may happen in qemu right now,=
 if i
>> understood correctly. ||
> Write requests are not atomic in general.  Specific storage technologie=
s
> support atomic writes via special commands with certain restrictions bu=
t
> applications using this feature aren't portable.
>
> Portable applications either don't submit intersecting write requests o=
r
> they do not depend on atomicity.
>
> Out of curiousity I took a quick look at Linux device-mapper.  The same
> issue applies in device-mapper when intersecting write requests cross
> device-mapper targets.  I think Linux submits split bios in parallel an=
d
> without serialization.
>
> Stefan


Thanks, Stefan!

(By the way, there is a v2 of this message without all the formatting bug=
s)


Evgeny



