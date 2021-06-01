Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B835C397A7E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 21:13:01 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo9oy-0006bn-5D
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 15:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo9kE-0005gg-0l; Tue, 01 Jun 2021 15:08:06 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo9kA-0001OR-OD; Tue, 01 Jun 2021 15:08:05 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 78EA85C020B;
 Tue,  1 Jun 2021 15:08:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 01 Jun 2021 15:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GHYAwGtL/PR4nnEDDifK4Amq/T0
 qfQyEBoxYMAQuHe0=; b=SS4o6g9D5S7skQOh0EOsCUCDDJM31pBIw30ym5ACWOG
 gsFRiQhF8LFMy2CHpFmzAcWenSQ/cPvI/TfYia7WR2vc+RIYXvjbnk64dokH+mRj
 CVB5EyGl0M8I0uZKbuc9f7Jyfl+e2hPyFgv/mA12YQg6z2hV9RyGV3UP49NEpAxn
 0N34v69bCBqqV7QUijEHDsgMQ+0lLZ2wzHKDDAOEy+uK50NPJ23Y15S/UmI0xL9V
 3huJ+sKZsGK9xNZ7mSnqT3TPYjYWgp0CgCtYWxGOlrJrI023cALRigxAXcW4DkzU
 dUsl5p+KA7fJhBLCl0faPKnWyGxHvhUNPec1PNbL5Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GHYAwG
 tL/PR4nnEDDifK4Amq/T0qfQyEBoxYMAQuHe0=; b=XcHlL6XEhxxk6sl9K6wEUi
 34qka0vBaHJGXx0fVEojCpluyKu7+LWlSrId6F1jf1qUK3kZL9uxJ6t4p3xWV6B+
 WBLKpwDFwtgEyBlV/J0ww2NC1mAr4Zi4EsvaZEwHgvzGQ5mrPrR50JbmSayx+Brd
 ICidXdh0BV3SId0WT4wMjXXnbZL2812K9orJDqXMKBP7/mFnqxtCP64dwHGeifhg
 CfZ7xWKWtRlgFlb2UfYFcc4lv/fIk9R7yJ/WPkpTKUQMXmV6i6xRQxlst/n3u6YF
 5T2kKdYqgtBzbLx7+3c/MnchdQIHr6IY6uW6tUMoy0+YB9rKiPpDDZYIhk9NWhNQ
 ==
X-ME-Sender: <xms:kIW2YCdRi9XucE3NJMF8rYiP9SnJBTWFwLPVA7apF0OB-q3KC8aeEw>
 <xme:kIW2YMOzJAHeudbmHlUixCPDta6LFxpInQ32jgxTUromxkGLkofJPD7BHgPnyYml8
 QJlKjEbWd_73VOr9Tc>
X-ME-Received: <xmr:kIW2YDgURj_eyD3g-CrSxq4VHJFa0u4InwbAJu4XXu_jvFF3B29WRheahZGsXduFFQjy1I85rHc8meOQD9eelJfSzNoOpyLZ3B42IjW3JJ3CLCvdkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kIW2YP9XhF-8QRemMv_FVSZpyHyZOxQQzqG_kMzQHjXQv82dvjeiMw>
 <xmx:kIW2YOtVwA9-jshPBW2Jh7CkTaJG8RPjbI1pAE2q9CPjv9Lzrpev8w>
 <xmx:kIW2YGFToAFgp6zb5GuGx795Bbwyo72T2NOH09SAsdEdf6WQCE6vnQ>
 <xmx:kYW2YL-0fhqzJIIc_aI4xE-tUStbQwu3qjC-Jc-c6KU0BIwDTR69fA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 15:07:59 -0400 (EDT)
Date: Tue, 1 Jun 2021 21:07:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLaFjPPj4Bq+a0m7@apples.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
 <YLZxTlikAcJD98Ut@apples.localdomain>
 <20210601180724.GA4527@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iM/RGiHnvucTJudX"
Content-Disposition: inline
In-Reply-To: <20210601180724.GA4527@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iM/RGiHnvucTJudX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 11:07, Keith Busch wrote:
>On Tue, Jun 01, 2021 at 07:41:34PM +0200, Klaus Jensen wrote:
>> On Jun  1 10:19, Keith Busch wrote:
>> > On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
>> > > NVMe Boot Partitions provides an area that may be read by the host
>> > > without initializing queues or even enabling the controller. This
>> > > allows various platform initialization code to be stored on the NVMe
>> > > device instead of some separete medium.
>> > >
>> > > This patch adds the read support for such an area, as well as support
>> > > for updating the boot partition contents from the host through the
>> > > FW Download and Commit commands.
>> >
>> > Please provide some details on what platform initilization sequence
>> > running on QEMU is going to make use of this feature.
>> >
>>
>> I totally get your reluctance to accept useless features like device
>> self-test and ill-supported ones like write uncorrectable.
>>
>> But I think this feature qualifies just fine for the device. It is useful
>> for embedded development and while there might not be any qemu boards th=
at
>> wants to use this *right now*, it allows for experimentation. And this i=
s a
>> feature that actually *is* implemented by real products for embedded
>> systems.
>
>That wasn't my request, though. I am well aware of the feature and also
>have hardware that implements it. It just sounds like you haven't
>actually tested this feature under the protocol's intended use cases
>inside this environment. I think that type of testing and a high level
>description of it in the changelog ought to be part of acceptance
>criteria.
>

Alright, I see.

You'd like to see this tested by defining a new board that loads=20
firmware over PCIe from the device?

--iM/RGiHnvucTJudX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC2hYoACgkQTeGvMW1P
DekScAf+PzRvTQL0cNB8CS1wWU1W943lQDE6Nl0cA21Mwzc1k5F6gwpMC2akc5v6
tHo+W2beCAPbUnhEwOOxohTNJ5J5gT2I9oKUzNXmJRrN0RB6roOwObsFiaIh53TC
YfWWd4Dyb8fhWImS83+tzBWxxNdtenjULpSabYjhW0YtzHjlQ7A6eK1xQQRHd2jZ
Y6f++tg+8kmueMwZvG5bPzYi802tB6b/jixBv8YBM8LwRcbJpV3Xw78AD415kYop
i0PxINbcEiaWMrQT1H55DbRQqL/TVU4SEjxQBCv83fB0AbZtirG8TuaQjA8UcW6p
puPx8Z7I8WR4TJ2vfoj8WyI1hSA0Sg==
=zITx
-----END PGP SIGNATURE-----

--iM/RGiHnvucTJudX--

