Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3E37AE69
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:24:37 +0200 (CEST)
Received: from localhost ([::1]:50654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgX3c-00075D-46
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgWx7-00060Y-6N; Tue, 11 May 2021 14:17:56 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgWx3-00008c-IN; Tue, 11 May 2021 14:17:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1A8C21654;
 Tue, 11 May 2021 14:17:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 11 May 2021 14:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=fm3; bh=Ob2jRuxExbiLjsB6xJUDfJfu76At8YwpMg2WHYbl8Ek=; b=llu7q
 xl8drTJ9umU7IbWZPJ4dOLMMD6cJZO1tFdVOwMWPZEjjDVPiY7KLKxc0G2qPaN9X
 cVsAnjxyG8DR7wAWIP5pVVUAwobZOxMSLVS5MqHf5YbPTx+bIefs/+XISA39Ondi
 2FlWPTBVbkWc9lmqGm5KaArBxYuayEOLVu3oXQoLF1y+Q+80YNWaBe1Lp3bqTWMf
 fv8NIOLif9WFNOQav39sEB4ymF+cbMi2T3w+Mp3AmHKIogX40LVVHBhBles/3BWJ
 +DjUToWmd1HgEiTDOajT2jGv3OpCHHVpFnIk0Rh6lTpeKzxG6WL3LXCc2e9Cl1jY
 GuSQeKDJPmuFgCcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=Ob2jRuxExbiLjsB6xJUDfJfu76At8
 YwpMg2WHYbl8Ek=; b=KPEmKEW7RZB1wvHIAgIQ35/v3gMaZ0R9u4xDVx9Jcn66X
 mJMwKBUlWhts7j39fI6bcFC8XzT2BGgpTBSdLwcj3VJfa1qQtnyO+y8Q4RW4xcu4
 k7DAnAhOwfAcTu/dX3hJFCxmI7UKwhfou4STgoQiQK5LBU18xzYl+MZe9DzkwCTS
 +KfQ+wJ28W14XFUswxFQKz85cyiei9NQMXBuB44udrrwQCO6y4hiz7kARyfUeLwR
 UILJewhBjj4vjUXB8xv0sDQfRci/Tr2XoD7z7FUfqdHITQdbdbu/8EU18XG433L2
 1TiZ2GYEnJxjjx6OVHgI98jiINU3uabpn0OJzJq7Q==
X-ME-Sender: <xms:SsqaYBuWD-JJ8mj3xLqED2IYwVEXduhCEKJv3JeXsIAmjkmvF2ny7w>
 <xme:SsqaYKdHWVT-ycXCty6WXmsCdxb_HFHm86tGCyOuX58nl4kH17L8EqzXU0_gHg8s2
 ZgBX3RLH_uPNMtOaKM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderre
 dttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghv
 rghnthdrughkqeenucggtffrrghtthgvrhhnpedtudekfeffieffhfduuedtudekjedtff
 evkefghfeltefhtdegffeuhedvjeehhfenucfkphepkedtrdduieejrdelkedrudeltden
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SsqaYEzkt_fm_p2eqKNXRpEF8p2DjoliL0Rspdi3A09P-AZNmXM6vw>
 <xmx:SsqaYIPoW1MRItuqvIBKF2c0-46wddG0JMHK7sf4bkP0KL1vrlNJxA>
 <xmx:SsqaYB92D0CzaoMCgJfc-O5tTPcbDjPFs46iWGgFVDyZolQECkWQ1Q>
 <xmx:SsqaYDKIoezOrD5lRFmzSwPhPZDVkZqOIqPm0VK7UzNc0eNIVzjL1w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 14:17:45 -0400 (EDT)
Date: Tue, 11 May 2021 20:17:42 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: making a qdev bus available from a (non-qtree?) device
Message-ID: <YJrKRsF4/38QheKn@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QwdhJ+KyZnBY+cY5"
Content-Disposition: inline
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QwdhJ+KyZnBY+cY5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I need some help with grok'ing qdev busses. Stefan, Michael - David=20
suggested on IRC that I CC'ed you guys since you might have solved a=20
similar issue with virtio devices. I've tried to study how that works,=20
but I'm not exactly sure how to apply it to the issue I'm having.

Currently, to support multiple namespaces on the emulated nvme device,=20
one can do something like this:

   -device nvme,id=3Dnvme-ctrl-0,serial=3Dfoo,...
   -device nvme-ns,id=3Dnvme-ns-0,bus=3Dnvme-ctrl-0,...
   -device nvme-ns,id-nvme-ns-1,bus=3Dnvme-ctrl-0,...

The nvme device creates an 'nvme-bus' and the nvme-ns devices has=20
dc->bus_type =3D TYPE_NVME_BUS. This all works very well and provides a=20
nice overview in `info qtree`:

   bus: main-system-bus
   type System
     ...
     dev: q35-pcihost, id ""
       ..
       bus: pcie.0
	type PCIE
	..
	dev: nvme, id "nvme-ctrl-0"
	  ..
	  bus: nvme-ctrl-0
	    type nvme-bus
	    dev: nvme-ns, id "nvme-ns-0"
	      ..
	    dev: nvme-ns, id "nvme-ns-1"
	      ..


Nice and qdevy.

We have since introduced support for NVM Subsystems through an=20
nvme-subsys device. The nvme-subsys device is just a TYPE_DEVICE and=20
does not show in `info qtree` (I wonder if this should actually just=20
have been an -object?). Anyway. The nvme device has a 'subsys' link=20
parameter and we use this to manage the namespaces across the subsystem=20
that may contain several nvme devices (controllers). The problem is that=20
this doesnt work too well with unplugging since if the nvme device is=20
`device_del`'ed, the nvme-ns devices on the nvme-bus are unrealized=20
which is not what we want. We really want the namespaces to linger,=20
preferably on an nvme-bus of the nvme-subsys device so they can be=20
attached to other nvme devices that may show up (or already exist) in=20
the subsystem.

The core problem I'm having is that I can't seem to create an nvme-bus=20
=66rom the nvme-subsys device and make it available to the nvme-ns device=
=20
on the command line:

   -device nvme-subsys,id=3Dnvme-subsys-0,...
   -device nvme-ns,bus=3Dnvme-subsys-0

The above results in 'No 'nvme-bus' bus found for device 'nvme-ns', even=20
though I do `qbus_create_inplace()` just like the nvme device. However,=20
I *can* reparent the nvme-ns device in its realize() method, so if I=20
instead define it like so:

   -device nvme-subsys,id=3Dnvme-subsys-0,...
   -device nvme,id=3Dnvme-ctrl-0,subsys=3Dnvme-subsys-0
   -device nvme-ns,bus=3Dnvme-ctrl-0

I can then call `qdev_set_parent_bus()` and set the parent bus to the=20
bus creates in the nvme-subsys device. This solves the problem since the=20
namespaces are not "garbage collected" when the nvme device is removed,=20
but it just feels wrong you know? Also, if possible, I'd of course=20
really like to retain the nice entries in `info qtree`.


Thanks,
Klaus

--QwdhJ+KyZnBY+cY5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCaykUACgkQTeGvMW1P
DekVXwf/UWp8K4abY+sxUObAtG4PGsHTvERdCDXjZy5k0iRPFVf/jE9k8sfNR7sO
r8jd9aBiPsSW31fo4jyL8sUqDuFP2lS7ojGfcr9EWNgFzcLKv5KJ4FSHQXHm55II
qP4F5uGEMvsO2C6hgTipOSWSGyO9hGx22MZVVTfKhFkr5xbAKO9RD/Zcb9CGNYzk
n3KOAsPM8o3mdzd1TLTm9dJrPV4p3GOfgBi6oDDPu4R3i4divq7QtYRistS2Efga
GKX+Mp0mNhvZrIeu0GVI7FgPkwaA+c4bz4M04meAbCygdsQngCUBP+Yh88nW2m5R
PmT5pZAefytsTAhe1Ka/PPUHV+GqNQ==
=dWk9
-----END PGP SIGNATURE-----

--QwdhJ+KyZnBY+cY5--

