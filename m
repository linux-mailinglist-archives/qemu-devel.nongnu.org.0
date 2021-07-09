Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7993C1F3A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:09:41 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jhk-0005Fr-MJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1jdW-0002m2-5U; Fri, 09 Jul 2021 02:05:18 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1jdO-0006s8-NE; Fri, 09 Jul 2021 02:05:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 625DD320090B;
 Fri,  9 Jul 2021 02:05:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 09 Jul 2021 02:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=z5Y6lN6pNtytfSXIhef1izt9m6Q
 pDt7MnI0fNV1bYHw=; b=QJGpWHauEIMTHKy4lvI+yLCBaRb3xxf4eJJYPLXCrJo
 t3kXk2Ry/aqalHg7QCL8zxcFePtdymmswxJMpMUYBOal45R6YtQkgr4FBG4T5Lx6
 2wotQxnIzUoliTJxB10sE+VlKAmpa9I1E3BrS3Gg2SUAkDkgqxfXfPgrbL2fZMYI
 yQFeck7ojXK38gH2AYO20zzUB+OtYuao0e0C3QRRp5rv2BXU/TOY5s65ZS12fnmu
 WyAE71SME8VNweJKv67Po1e7T/P1k8JvQWrWqYcg5e0rqF4f5yn47SDWJj3hWhfw
 KFTeCAWUB1PMV6Hfm65GDcfRpwRP4W/Yn8zGKtA4KLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z5Y6lN
 6pNtytfSXIhef1izt9m6QpDt7MnI0fNV1bYHw=; b=CrU32H/5EdwCY9pa9B1Fas
 8xBmpJ52RQp8cLRVjN6sA1zr6Cv0+8RzdQyWX/YIBclK4ouhXdM6BGU4SN6MMWot
 3hVXkWvmvKflB58CXF1Obayu4GtTKwaztRkYZkBRSjgURAQtysbPey0/5D+0VokD
 MexCpavy6rd9tEdIzV8k6O/ZWG7rSoaSTBfWyvvHr/QVOzi7mr6pMwfmp1nG4jEJ
 ydTDisckmvR7SmR++tskK0E2AAu1Ap+tsRHSty813J4HQRJOl28ZpXiKi7ODz0oU
 hxxucV3znrC197ehHQgrTdBy5Owf2ohk/IhHtp8irOwd1i1U3HZB8Yi83CrStI2A
 ==
X-ME-Sender: <xms:D-fnYGMmC0yOULwes5qSI9a2-iVWEbujo5MaZlMwojGGJmExU7bxQQ>
 <xme:D-fnYE9mduogYrT-Kipm8t9EifAizzUYZG_z4NuMaT65s-un59vtYeIo9uv53DUEA
 rNCCwJqzlZ4X7ogNV8>
X-ME-Received: <xmr:D-fnYNThiP7xGxAxafPI8rEVKs-XIuXsZxHFEFwAAHvem3oUM-H1k9PvmWCjjpkIi-ncU2LV4SLwovwZa3uQ9nkMRGg0KdIX6LVnqDdGOGlN9d_FKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:D-fnYGsLgKcMuw7tCvBcaO2jo_4fhRPKn3kyRXTOxlWfKf3IQjIBug>
 <xmx:D-fnYOfCrujnZxDrUlFlELJ3te64DmABckW9KABjasmn6_QzJmEfIQ>
 <xmx:D-fnYK0iX5Wqkh4wi9SC1_Moor8vhgsAqHxXCdqlcl4PepwozmnUdw>
 <xmx:EefnYN7oEY6qlZHJY6ljscwoD_o__N7Na4DelYAgSS9U_s9Mh2oCPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 02:05:02 -0400 (EDT)
Date: Fri, 9 Jul 2021 08:05:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
Message-ID: <YOfnDBwya58drDZk@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bV0+J7vUT0EEFVfi"
Content-Disposition: inline
In-Reply-To: <20210707154936.200166-1-its@irrelevant.dk>
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Hannes Reinecke <hare@suse.de>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bV0+J7vUT0EEFVfi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 17:49, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We
>discussed a bit back and fourth and I mentioned that the core issue was
>an artifact of the parent/child relationship stemming from the qdev
>setup we have with namespaces attaching to controller through a qdev
>bus.
>
>The gist of this series is the fourth patch "hw/nvme: fix controller hot
>unplugging" which basically causes namespaces to be reassigned to a bus
>owned by the subsystem if the parent controller is linked to one. This
>fixes `device_del/add nvme` in such settings.
>
>Note, that in the case that there is no subsystem involved, nvme devices
>can be removed from the system with `device_del`, but this *will* cause
>the namespaces to be removed as well since there is no place (i.e. no
>subsystem) for them to "linger". And since this series does not add
>support for hotplugging nvme-ns devices, while an nvme device can be
>readded, no namespaces can. Support for hotplugging nvme-ns devices is
>present in [1], but I'd rather not add that since I think '-device
>nvme-ns' is already a bad design choice.
>
>Now, I do realize that it is not "pretty" to explicitly change the
>parent bus, so I do have a an RFC patch in queue that replaces the
>subsystem and namespace devices with objects, but keeps -device shims
>available for backwards compatibility. This approach will solve the
>problems properly and should be a better model. However, I don't believe
>it will make it for 6.1 and I'd really like to at least fix the
>unplugging for 6.1 and this gets the job done.
>
>  [1]: 20210511073511.32511-1-hare@suse.de
>
>v2:
>- added R-b's by Hannes for patches 1 through 3
>- simplified "hw/nvme: fix controller hot unplugging"
>
>Klaus Jensen (4):
>  hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>  hw/nvme: mark nvme-subsys non-hotpluggable
>  hw/nvme: unregister controller with subsystem at exit
>  hw/nvme: fix controller hot unplugging
>
> hw/nvme/nvme.h   | 18 +++++++++-------
> hw/nvme/ctrl.c   | 14 ++++++------
> hw/nvme/ns.c     | 55 +++++++++++++++++++++++++++++++-----------------
> hw/nvme/subsys.c |  9 ++++++++
> 4 files changed, 63 insertions(+), 33 deletions(-)
>
>--=20
>2.32.0
>

Applied patches 1 through 3 to nvme-next.

--bV0+J7vUT0EEFVfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDn5wsACgkQTeGvMW1P
Den/JQf+NHL+7DotmJ4W2f595hR/RGA42en9tjdiKxs9S1pcfSLx1as9k3ZXo5SO
Y8/hgpYKXc84fRqB0aoRm3R+9Zql2f4oqCeacBuW/8XRaAyME8MkIRtwsRn6thTC
iv5f0I8WA3oIe7O49hWpWX3bIzlD2lb+g4BgP8bCRyRMTyeryOGdmvjVGAEW9Wce
oXBAHpYqpWDsumM7L9v6juVHkvED9hB7ay+52mqKRtL26nW613/ADT9jqKkUBbMe
oUcr57CAttmLYz2IapqQdwZMXtcEo/AfyCnWGAUPwSHg71hGmmlIby8x9bTP/Kse
zHIa486sFt9cvXwe9EspWLnD9jgMUQ==
=wvki
-----END PGP SIGNATURE-----

--bV0+J7vUT0EEFVfi--

