Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB19A3824C8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:52:18 +0200 (CEST)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liX6v-0001Hq-Gy
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liWz7-00021u-Nj; Mon, 17 May 2021 02:44:14 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liWz5-0001Lx-0y; Mon, 17 May 2021 02:44:13 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 207C1804;
 Mon, 17 May 2021 02:44:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 17 May 2021 02:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=kicVynH1trskSJ15SRkWoXPLsOM
 T7O38A76Li47eiVk=; b=eYhSyGWVUAubZ5mmL3JUyXmEfO81GmuWwjXfs1MVqER
 Xe53puR/frh8zOe5lyowSoILUiG5alm9ASJrFckZxWZ/ZJjrBBix7oTyCGhZnslF
 GtsLC2EYsL/zqeog6/zG8DKp3pVUfYLNnLIR9tKohvzQU86rCnv86M/AmlpNd2JP
 bc+uX0p4CKaD9jvyLPPYC5gM5EzTLv4tHcfXXhx4hGV2C1hUdiRW/HAmTBmD/FEK
 IkTwASAWNItyy4Pm5/qcYy3ZDZwDNGRmXHlZhrw4R91m5X5SAZv17RDSQV8vO4Rd
 c51lZNjMfRh/OIuod8LZM16qX43LeHpT1oVbxzfs7LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kicVyn
 H1trskSJ15SRkWoXPLsOMT7O38A76Li47eiVk=; b=QFTSm+1XHazWvFBGhleiBY
 jkuhgaodb7MTMaZtnqaEyb+pzEyVmWTGrt+CnACfdxOHtDlfgEPf++GmiJwCQNmq
 JGE7RKx+rYvY1OJru704MMFIRQV3fmg+PSkbfFXwWn0qw8HNTIskqWMAv28oVFWW
 gLGxlABR9EkXRDkIKvJ66+HHvbhW1TntZ9NTWEsMX05IARxpbnebjph8tDeOqOoE
 yF/MGRYzGQFUOjpK13WCHdOBiNQk2x5nPJV92RZ0H7eLRc1xnEAoxqz3mAYqiuc8
 rfducMcNasUyjAPQM9A5fgLYca0v41CHDJBUhXULE6b2ToNRQrgTZ8HWalto8N1A
 ==
X-ME-Sender: <xms:tBCiYC40HtySlaF6JHkexmCvYs6OWsZuDxQ8mArym3LNFZM6nI9PgA>
 <xme:tBCiYL6nGyK9PIDkUTgqhZHiUl9xXpynpugnwEChBSLcwpWIxMzkFjuNK_nudeui8
 q9KkJrCdvZDEUhMc_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:tBCiYBd4A71kIVUAlno0tbEO3ZQkghi-Z44q_rurhIsFZBJiFibjTQ>
 <xmx:tBCiYPI3doTZCoWPJXfW1vaE0Oyk6xwaB9QQviXNbr2WHgapTWyKbQ>
 <xmx:tBCiYGIC9Ufz3oBmMRCb-ta5IYqG7DhzuqceC_omESedTaqFirvBag>
 <xmx:tBCiYC0HijdKi6McmCu-ql_OpqFeUj4lpQBYnd0EPG8CGGlge2gJzg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 02:44:03 -0400 (EDT)
Date: Mon, 17 May 2021 08:44:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: making a qdev bus available from a (non-qtree?) device
Message-ID: <YKIQsI4F49R4hEmd@apples.localdomain>
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2PCoMo5qw9v+9QqZ"
Content-Disposition: inline
In-Reply-To: <87im3o2m8l.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2PCoMo5qw9v+9QqZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 12 14:02, Markus Armbruster wrote:
>Klaus Jensen <its@irrelevant.dk> writes:
>
>> Hi all,
>>
>> I need some help with grok'ing qdev busses. Stefan, Michael - David
>> suggested on IRC that I CC'ed you guys since you might have solved a
>> similar issue with virtio devices. I've tried to study how that works,
>> but I'm not exactly sure how to apply it to the issue I'm having.
>>
>> Currently, to support multiple namespaces on the emulated nvme device,
>> one can do something like this:
>>
>>   -device nvme,id=3Dnvme-ctrl-0,serial=3Dfoo,...
>>   -device nvme-ns,id=3Dnvme-ns-0,bus=3Dnvme-ctrl-0,...
>>   -device nvme-ns,id-nvme-ns-1,bus=3Dnvme-ctrl-0,...
>>
>> The nvme device creates an 'nvme-bus' and the nvme-ns devices has
>> dc->bus_type =3D TYPE_NVME_BUS. This all works very well and provides a
>> nice overview in `info qtree`:
>>
>>   bus: main-system-bus
>>   type System
>>     ...
>>     dev: q35-pcihost, id ""
>>       ..
>>       bus: pcie.0
>> 	type PCIE
>> 	..
>> 	dev: nvme, id "nvme-ctrl-0"
>> 	  ..
>> 	  bus: nvme-ctrl-0
>> 	    type nvme-bus
>> 	    dev: nvme-ns, id "nvme-ns-0"
>> 	      ..
>> 	    dev: nvme-ns, id "nvme-ns-1"
>> 	      ..
>>
>>
>> Nice and qdevy.
>>
>> We have since introduced support for NVM Subsystems through an
>> nvme-subsys device. The nvme-subsys device is just a TYPE_DEVICE and
>> does not show in `info qtree`
>
>Yes.
>
>Most devices plug into a bus.  DeviceClass member @bus_type specifies
>the type of bus they plug into, and DeviceState member @parent_bus
>points to the actual BusState.  Example: PCI devices plug into a PCI
>bus, and have ->bus_type =3D TYPE_PCI_BUS.
>
>Some devices don't.  @bus_type and @parent_bus are NULL then.
>
>Most buses are provided by a device.  BusState member @parent points to
>the device.
>
>The main-system-bus isn't.  Its @parent is null.
>
>"info qtree" only shows the qtree rooted at main-system-bus.  It doesn't
>show qtrees rooted at bus-less devices or device-less buses other than
>main-system-bus.  I doubt such buses exist.
>

Makes sense.

>>                               (I wonder if this should actually just
>> have been an -object?).
>
>Does nvme-subsys expose virtual hardware to the guest?  Memory, IRQs,
>...
>
>If yes, it needs to be a device.
>
>If no, object may be more appropriate.  Tell us more about what it does.
>

It does not expose any virtual hardware. See below.

>
>>                         Anyway. The nvme device has a 'subsys' link
>> parameter and we use this to manage the namespaces across the
>> subsystem that may contain several nvme devices (controllers). The
>> problem is that this doesnt work too well with unplugging since if the
>> nvme device is `device_del`'ed, the nvme-ns devices on the nvme-bus
>> are unrealized which is not what we want. We really want the
>> namespaces to linger, preferably on an nvme-bus of the nvme-subsys
>> device so they can be attached to other nvme devices that may show up
>> (or already exist) in the subsystem.
>>
>> The core problem I'm having is that I can't seem to create an nvme-bus
>> from the nvme-subsys device and make it available to the nvme-ns
>> device on the command line:
>>
>>   -device nvme-subsys,id=3Dnvme-subsys-0,...
>>   -device nvme-ns,bus=3Dnvme-subsys-0
>>
>> The above results in 'No 'nvme-bus' bus found for device 'nvme-ns',
>> even though I do `qbus_create_inplace()` just like the nvme
>> device. However, I *can* reparent the nvme-ns device in its realize()
>> method, so if I instead define it like so:
>>
>>   -device nvme-subsys,id=3Dnvme-subsys-0,...
>>   -device nvme,id=3Dnvme-ctrl-0,subsys=3Dnvme-subsys-0
>>   -device nvme-ns,bus=3Dnvme-ctrl-0
>>
>> I can then call `qdev_set_parent_bus()` and set the parent bus to the
>> bus creates in the nvme-subsys device. This solves the problem since
>> the namespaces are not "garbage collected" when the nvme device is
>> removed, but it just feels wrong you know? Also, if possible, I'd of
>> course really like to retain the nice entries in `info qtree`.
>
>I'm afraid I'm too ignorant on NVME to give useful advice.
>
>Can you give us a brief primer on the aspects of physical NVME devices
>you'd like to model in QEMU?  What are "controllers", "namespaces", and
>"subsystems", and how do they work together?
>
>Once we understand the relevant aspects of physical devices, we can
>discuss how to best model them in QEMU.
>

An "NVM Subsystem" is basically just a term to talk about a collection=20
of controllers and namespaces. A namespace is just a quantity of=20
non-volatile memory that the controller can use to store stuff on.

Only the controller is a piece of virtual hardware. An example subsystem=20
looks like this:


           +------------------+     +-----------------+
           |   controller A   |     |   controller B  |
           +------------------+     +-----------------+
           +--------++--------+     +--------++-------+
           | NSID 1 || NSID 2 |     | NSID 3 | NSID 2 |
           +--------++--------+     +--------++-------+
           +--------+    |          +--------+    |
           |  NS A  |    |          |  NS C  |    |
           +--------+    |          +--------+    |
                         |                        |
                         +------------------------+
                                      |
                                  +--------+
                                  |  NS B  |
                                  +--------+


This is the example in Figure 5 in the NVMe v1.4 specification. Here, we=20
have two controllers (that we model with the 'nvme' pci-based device).=20
Each controller has one "private" namespace (NS A and NS C) and shares=20
one namespace (NS B). The namespace IDs are unique across the subsystem=20
and are assigned by the controller when attached to a namespace.

We use the 'nvme-ns' device (TYPE_DEVICE) to model the namespaces, and I=20
guess this should could also just have been an -object, not sure if we=20
can change that now. The 'nvme-ns' device mostly exist to hold the block=20
backend configuration and related namespace only parameters. Prior to=20
the introduction of subsystem, while we could have multiple controllers=20
on the PCI bus, they could not share namespaces. To support this we=20
introduced the 'nvme-subsys' device to allow the namespaces to be=20
shared. This support is considered experimental, so I think we can get=20
away with changing this to be an object.

As I explained in my first mail, we attach namespaces to controllers=20
through a bus. This means that even in the absence of an explicit=20
"bus=3D..." parameter on the nvme-ns device, it will "connect" on the most=
=20
recently defined "nvme-bus" (of the most recently defined controller).=20
With subsystems we would also like to model "unattached" namespaces that=20
exists solely in the subsystem (i.e. NOT attached to any controllers).=20
That is why I was trying to get the nvme-ns devices to attach to a bus=20
created by the "non-bus-attached" subsystem device. And that is what I=20
can't do. We could add a link property to the nvme-ns device instead,=20
but then the bus magic in qemu would still happen and the namespace=20
would end up "attached" (in qemu terms) to a controller anyway - and it=20
would complain if we defined the namespace device prior to defining any=20
controller devices since no usable bus exist.

Thanks for helping out with this!

--2PCoMo5qw9v+9QqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCiEKoACgkQTeGvMW1P
Demy7QgAwV1BUJtt8GKvxne5KPmXZgRpH5IjLgQ8DmsasqjTn9y99rUT8fajC7Hp
gsPXA9dYsinv+hTMj9Wbnr8qTYVT4cHn6pU0IhbD3ZkfPXHr88MsDGoWUxphqV38
1Svfacp1/798qS5bveImG4uhPaoGJwBUrqh2NQoncAOrzBzW4Szbas0sGN7njmS1
i4jRqmQkfK7cJUY2JNWZ7Ju4HVT+STnSCG3fR/bLQLq6rESCY6JRgQigtsqDjaHP
UdHIO+AKa+vcXOUz6x7SYVUAf0VuWA9T3PVIhQTxEYWjx0ZwU72hlkhxBD7X3dvb
wQvbAXoXCP2pVD0CUMpyHpSpf/LzMA==
=mAu0
-----END PGP SIGNATURE-----

--2PCoMo5qw9v+9QqZ--

