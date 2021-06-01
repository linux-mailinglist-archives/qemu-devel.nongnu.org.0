Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E1397971
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:46:11 +0200 (CEST)
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8Sv-0004vt-Jc
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8Oh-0002Jl-59; Tue, 01 Jun 2021 13:41:47 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8Oc-0002fB-Vf; Tue, 01 Jun 2021 13:41:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 850AEEB8;
 Tue,  1 Jun 2021 13:41:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Jun 2021 13:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WWAPQ+9LK4c3FAyMG8cUfmuO3ql
 1Fc8GiZmpbbaP4Rs=; b=ZYL9MmzOJJ9QUPtqz/WDAbTM4ebjwCvCZky9IxpWS/g
 BwOfjxEECMccDD+btKuqAS3rr8KjWEEk03IQ3Go3ZucF4fnfVqyLeTgiTuDgX/p6
 Y1cksofoQnLiIb4EJXS7jGhCijy+ykboscSSQs2Xcz0RZ8cylBo083/mfLvPwlcC
 MHeDFv0iFYhs9fZIXs92LuI0RJ56MNiBh0T2Az5Hl4ScVhy7SNoOTfgyXim8BePW
 Dc5O4YtAoUwiIT00HhB6nimo0S6JDTEZ3qsUYTjDd4VgIhxdbGzW+J1jZaBdvM2X
 BlCWAJyc4vF8M4hofnBSiw2gRl8RjZpgeOfRLKDmM5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WWAPQ+
 9LK4c3FAyMG8cUfmuO3ql1Fc8GiZmpbbaP4Rs=; b=V5Y4XfRnaAptI9Yca+cmNx
 RlT2ly8iVyKJTAlbNBlcEd/8/OwbZeLwbY1u2QvZZC/B/ObR1P4UHOOeTl9/bGHg
 QPWKFpoVwoRJ1UrUuSy0ihWhPv1Vzcs+jQYQvKrwViaBH0muWNp+CK35k2Nta/2E
 dvVkfYt/w3smIQ6w42II5GUkV1grHwVAJWU9fGbvty5y9qHUe8Wi45E8YuYwf5df
 IGrarRmiL18qboBFOPK58eBgbOBidQbEvLEyBw9RZ4E4ElvuGxjKi1NV4XlSKk2O
 Aqfu6GVbZMZ0Q28bqXxTY9geuIDawUIbpud4sd/O1dDpY0FCtieBM1PWECbfP70A
 ==
X-ME-Sender: <xms:UnG2YBF9g1vNwiBvIYaQNzZ99XzLRjlOQIiTrVdPDM-deRiFIKcS2Q>
 <xme:UnG2YGWi-2r4vLe0lZ5L-GqvbHcPaexF6Ep6MIttTQLdfI9PCkR3sllyTHGM4UpgO
 BYuLx5m6tm-xM3CvWk>
X-ME-Received: <xmr:UnG2YDI7h-PxLdyh0S2CNZhvH_G0QCCjGopOUj61kcYi_fGWl-KpLpYVWNwpr7JXWEaWES-MqGbT5Or4hGDYbQgLO4f3WfjuY7A3sD8u87DD29IdJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:UnG2YHGMvpJyTjD6rCmvN3EAXxo210ANz4FNMZiYT8thK81s4LuNoA>
 <xmx:UnG2YHUWv1-Seez-KOhB6dmqjyAfe2NJVRjKzIIiln4CeeWtU-MWXw>
 <xmx:UnG2YCNKTB1MikS9eik0vgAozFScbAIUBu6R3JIKC6wPKCpghx1Mxw>
 <xmx:U3G2YOGPVolfAoAuwneJ_lmyzWhOlqm99W5gCAS8AZq5FO6mBImrBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 13:41:36 -0400 (EDT)
Date: Tue, 1 Jun 2021 19:41:34 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLZxTlikAcJD98Ut@apples.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oYvOjOjWru5amq8h"
Content-Disposition: inline
In-Reply-To: <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--oYvOjOjWru5amq8h
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 10:19, Keith Busch wrote:
>On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
>> NVMe Boot Partitions provides an area that may be read by the host
>> without initializing queues or even enabling the controller. This
>> allows various platform initialization code to be stored on the NVMe
>> device instead of some separete medium.
>>
>> This patch adds the read support for such an area, as well as support
>> for updating the boot partition contents from the host through the
>> FW Download and Commit commands.
>
>Please provide some details on what platform initilization sequence
>running on QEMU is going to make use of this feature.
>

I totally get your reluctance to accept useless features like device=20
self-test and ill-supported ones like write uncorrectable.

But I think this feature qualifies just fine for the device. It is=20
useful for embedded development and while there might not be any qemu=20
boards that wants to use this *right now*, it allows for=20
experimentation. And this is a feature that actually *is* implemented by=20
real products for embedded systems.

--oYvOjOjWru5amq8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC2cUwACgkQTeGvMW1P
DenzawgAoV99QV6X9QrXsevghJvMWKgzSqyuwRdBZKnQLdAMilI9KHvR7NdIhb7U
2xf4XfFOlO9ESYpCguiMfI4MAX5WbOtctqFbCnwFGaice7kp2lSa6aElR5+oT7ZN
xdNUz6rYeHiCQfRqDWqGE4B8AocU6AFlilzCd8unddv9oRFR/9OnWmbV8xyFCOcS
NmCXQ67G3UowVK9MDoJl36STSuav+x4Z075CH92afAP9tJ4YMwy6p7bupFATpBOC
XKpO0qF1Q2pfK34EKiKvyEw7lfVdm0jFERX2xhqx0Cggbk7gf0aZjsSUCy0Hs6Ht
m0oy00VK+nC/t9hyEaARPo42d2eroA==
=6dn9
-----END PGP SIGNATURE-----

--oYvOjOjWru5amq8h--

