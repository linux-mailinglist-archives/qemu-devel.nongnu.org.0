Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B14371206
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 09:32:11 +0200 (CEST)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldT3o-00079Z-QY
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 03:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1ldSzM-0006hH-1X
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:27:32 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:45069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1ldSzJ-0008MQ-9v
 for qemu-devel@nongnu.org; Mon, 03 May 2021 03:27:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DD6431773;
 Mon,  3 May 2021 03:27:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 03 May 2021 03:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1+7RShAzWpuxBJPR8V187mHGajd
 E6wDZFKylAWp/reA=; b=q0VAaMPlQT9X3tHdIp9+uzgxyzeV+f+BNSrBf+LFSOF
 xcDXNrCl3HZ7fYtSRWh2y5zv0Qv1EaJsO7HmXAS20zJbVmCzy8njv1ALaqdzo+OJ
 A+dPuMSO8YQOkF/zv4RyXmIb6+xDFp7Ji5DyaVl87Sxi4Cna+Q2imKyNovXu3+zM
 JDzPG/y0d/zuJ87qDCugk0ju0bf/1RWxanLMgf9nzvyzFp/6FGlliP62tnNUy/bt
 gvLixpWiQ3qhDgU4juuW2+if/nFl8nCipNsbJ1B18jw04zXV/yFJSeuII237R0nw
 vzqBPj3ICmjDqMXeBAaXJCeKDEVId0NcKCgiT7FY7oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1+7RSh
 AzWpuxBJPR8V187mHGajdE6wDZFKylAWp/reA=; b=vp7+8YknjOCdOmQayoIBii
 RENWjrVWk5DaFfYDT+YvXdoQlcMDJ/mHS94qz6UCRBBfZ2pgIPgVLpVhqWa9ez7p
 3myJUOk1tw9eC7F8rSVtKU0OraZcjoiVTz5HuiE1yfJPZFJgeg6KUKhNylilQJSc
 x3gpERAZl6f6db4BbM8znZmRkM2Zvht0pp59SXA13zyC0QACJaAyNspJDtR3HPkG
 oqmd9cWdhO7mUZZ4qYsNcLIwuohsF8cHI/Kuy8TQXOGZSuMJcccGdWgDC9mp3ymQ
 IR1MvPOOwBOUZoTws2xYprkvpJJgL8vkG7jNdFHdwFY+zXyXNVh4TxF2UQuvV6vg
 ==
X-ME-Sender: <xms:26WPYHR7M-fSvuB-xgXw_GQlP4JeF_5fUBGeHApuPvvzTIJFOA0mAA>
 <xme:26WPYIzku2A8YHchsu0mSz5mML85_-eXyPg9cjtEDqwiK7F9w6RvmpdNcwC6pD5i-
 HGgzQ20AicNWNeLDuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeffedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:26WPYM1vxg85Xte0cn1d_799g_VgHbum_HjLUgKFL_cOxzxVZh86Gg>
 <xmx:26WPYHA0zxv3f-WO9SWalFlUD49LIMzyx2WpUiYowvuY6o1EI3uLDg>
 <xmx:26WPYAi42bOx3zyDFQPYW3uaDtosg6-aArZji1tsxtk0OiwUh1dK0g>
 <xmx:3KWPYDu-ULZCFjPvdQPVh2V169xZgorvWwQpoUK3bqfezsDFvYZEGw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 03:27:23 -0400 (EDT)
Date: Mon, 3 May 2021 09:27:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Bug 1925496] Re: nvme disk cannot be hotplugged after removal
Message-ID: <YI+l2X3jtvaZC6wv@apples.localdomain>
References: <161909487037.10022.905940620153099238.malonedeb@wampee.canonical.com>
 <161960231059.11681.2408216748859225156.malone@wampee.canonical.com>
 <YIk1KG4dgT6mwChA@apples.localdomain>
 <09273f4c-3ac6-1fc4-b26e-d6fd3bee9021@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KmiXkVv+aOCHwoNd"
Content-Disposition: inline
In-Reply-To: <09273f4c-3ac6-1fc4-b26e-d6fd3bee9021@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bug 1925496 <1925496@bugs.launchpad.net>, kwolf@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KmiXkVv+aOCHwoNd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 28 15:00, Max Reitz wrote:
>On 28.04.21 12:12, Klaus Jensen wrote:
>>On Apr 28 09:31, Oguz Bektas wrote:
>>>>My understanding is that this is the expected behavior. The reason is
>>>>that the drive cannot be deleted immediately when the device is
>>>>hot-unplugged, since it might not be safe (other parts of QEMU could
>>>>be using it, like background block jobs).
>>>>
>>>>On the other hand, the fact that if the drive is removed explicitly
>>>>through QMP (or in the monitor with drive_del), the drive id is
>>>>remains "in use". This might be a completely different bug that is
>>>>unrelated to the nvme device.
>>>
>>>using the same commands I can hot-plug and hot-unplug a scsi disk like
>>>this without issue - this behavior only appeared on nvme devices.
>>>
>>
>>Kevin, Max, can you shed any light on this?
>>
>>Specifically what the expected behavior is wrt. to the drive when=20
>>unplugging a device that has one attached?
>>
>>If the scsi disk is capable of "cleaning up" immediately, then I=20
>>suppose that some steps are missing in the nvme unrealization.
>

Hi Max,

Thanks for your help!

>I=E2=80=99m not very strong when it comes to question for guest devices, b=
ut=20
>looking into the QAPI documentation, it says that when DEVICE_DELETED=20
>is emitted, it=E2=80=99s safe to reuse the device ID.  Before then, it isn=
=E2=80=99t,=20
>because the guest may yet need to release the device.
>

This is specifically related to releasing the "drive", not the device.=20
Problem is that when the device is deleted (using device_del), the pci=20
device goes away rapidly, but the drive (as shown in `info block`)=20
lingers for a couple of seconds before going into the "unlocked" state.=20

If the drive is then deleted (`drive_del`) everything is good, but if=20
the drive is deleted within those couple of seconds, the drive_del=20
completes successfully, but the drive id never becomes available again.

>So the questions that come to my mind are:
>- Do nvme guest devices have a release protocol with the guest, so=20
>that it just may take some time for the guest to release the device? =20
>I.e. that this would be perfectly normal and documented behavior?
>(Perhaps this just isn=E2=80=99t the case for scsi, or the guest just rele=
ases=20
>those devices much quicker)
>

The NVMe device is a PCIDevice, I wonder if that is what adds some delay=20
on this?

>- Did Oguz always wait for the DEVICE_DELETED event before reusing the=20
>ID?  Sounds like it would be a bug if reusing the ID after getting=20
>that event failed.
>

 From the bug report, it does not look like anything like that is done.

I basically dont understand the deletion protocol here and why the drive=20
is not released immediately. Even if I add a call to=20
blockdev_mark_auto_del() there is a delay, but the drive does get=20
automatically deleted.

--KmiXkVv+aOCHwoNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCPpdUACgkQTeGvMW1P
Delvugf+IiBpOE6F+wlv/g6IF/PMckDY6NjZk2cxsX0MxQtlRq9e5tttCMzmVwVg
1YjDc4b3uWU8+P4eqKCtaqod0AszO/Ky+e13eVL7VwVUPCY2IOWg0y1+duqkFTRW
o+x9I4XcaTdMlXRbJcrcIyxoTd8kHG7gjGoXpFGp2jTfvnDe+0NMpGk3MbKsaGV4
NYbCZ6pr6bw06c/9AGEZnbReRQu+NqbKuszesVzK5VUBs4svwovVsj2cyctmVcmI
DhodpaKoTxaNTTnlcG6g4DBpuHpDUG/cLlS/sD4fuxFIhHJZ5aXiZlpUyT4rxj/j
wF5ld/mW2QQ2Xn41SCRtCjjy6slspg==
=gVFT
-----END PGP SIGNATURE-----

--KmiXkVv+aOCHwoNd--

