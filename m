Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C2F77F6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 16:44:28 +0100 (CET)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUBrf-00057s-Jl
	for lists+qemu-devel@lfdr.de; Mon, 11 Nov 2019 10:44:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@siemens.com>) id 1iUBqX-0004bu-KR
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:43:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@siemens.com>) id 1iUBqU-0000bC-6K
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:43:15 -0500
Received: from david.siemens.de ([192.35.17.14]:37934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
 id 1iUBqT-0000Wt-Sh
 for qemu-devel@nongnu.org; Mon, 11 Nov 2019 10:43:14 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xABFgraZ018869
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 16:42:53 +0100
Received: from [139.25.68.37] ([139.25.68.37])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xABFgqFU001458;
 Mon, 11 Nov 2019 16:42:52 +0100
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device
 revision 2
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
 <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
 <20191111084327-mutt-send-email-mst@kernel.org>
 <0b0475c1-2564-f433-46d8-ff1a06c13569@siemens.com>
 <20191111100607-mutt-send-email-mst@kernel.org>
 <20191111152743.GM814211@redhat.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <129c527c-1e61-8c0c-3ca1-fe93e26c8bd2@siemens.com>
Date: Mon, 11 Nov 2019 16:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191111152743.GM814211@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by david.siemens.de id
 xABFgraZ018869
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 192.35.17.14
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: liang yan <lyan@suse.com>, Jailhouse <jailhouse-dev@googlegroups.com>,
 Claudio Fontana <claudio.fontana@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hannes Reinecke <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.11.19 16:27, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Nov 11, 2019 at 10:08:20AM -0500, Michael S. Tsirkin wrote:
>> On Mon, Nov 11, 2019 at 02:59:07PM +0100, Jan Kiszka wrote:
>>> On 11.11.19 14:45, Michael S. Tsirkin wrote:
>>>> On Mon, Nov 11, 2019 at 01:57:11PM +0100, Jan Kiszka wrote:
>>>>> +| Offset | Register               | Content                       =
                       |
>>>>> +|-------:|:-----------------------|:------------------------------=
-----------------------|
>>>>> +|    00h | Vendor ID              | 1AF4h                         =
                       |
>>>>> +|    02h | Device ID              | 1110h                         =
                       |
>>>>
>>>> Given it's a virtio vendor ID, please reserve a device ID
>>>> with the virtio TC.
>>>
>>> Yeah, QEMU's IVSHMEM was always using that. I'm happy to make this fi=
nally
>>> official.
>>>
>>
>> And I guess we will just mark it reserved or something right?
>> Since at least IVSHMEM 1 isn't a virtio device.
>> And will you be reusing same ID for IVSHMEM 2 or a new one?
>=20
> 1110h isn't under either of the virtio PCI device ID allowed ranges
> according to the spec:
>=20
>    "Any PCI device with PCI Vendor ID 0x1AF4, and PCI Device
>     ID 0x1000 through 0x107F inclusive is a virtio device.
>     ...
>     Additionally, devices MAY utilize a Transitional PCI Device
>     ID range, 0x1000 to 0x103F depending on the device type. "
>=20
> So there's no need to reserve 0x1110h from the virtio spec POV.

Indeed.

>=20
> I have, however, ensured it is assigned to ivshmem from POV of
> Red Hat's own internal tracking of allocated device IDs, under
> its vendor ID.
>=20
> If ivshmem 2 is now a virtio device, then it is a good thing that
> it will get a new/different PCI device ID, to show that it is not
> compatible with the old device impl.

At this stage, it is just a PCI device that may be used in combination=20
with virtio (stacked on top), but it is not designed like a normal=20
virtio (PCI) device. That's because it lacks many properties of regular=20
virtio devices, like queues.

So, if such a device could be come part of the virtio spec, it would be=20
separate from the rest, and having an ID from the regular range would=20
likely not be helpful in this regard.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

