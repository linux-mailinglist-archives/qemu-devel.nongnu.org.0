Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAFB39798A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:55:25 +0200 (CEST)
Received: from localhost ([::1]:44814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo8br-0005U3-7q
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8TI-0006XV-Sq; Tue, 01 Jun 2021 13:46:32 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lo8TH-0005ox-Ce; Tue, 01 Jun 2021 13:46:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BA4B510A3;
 Tue,  1 Jun 2021 13:46:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Jun 2021 13:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nBxz7STIe7aCWhYqSRpcWbSr3MD
 NNzhtdZ47GeKMPvU=; b=H4gwSm6qLWTP7KHkh76gtU8c+jY6TL4MxLQulmP32Ip
 3Rci6NOATdwSdu7fjqx6KFGf03mM6HnIsjcNrnRlIYgZAXeUH/76+a/cSz7eC1Ze
 PIbwEC82lEI/5BwuFfCCziuY5QI8n9Y0cnJzEQMJO5hum7TNKUhw6Ke5AJR07C71
 8vbtuhAPwYk27GDNrboSt44dIB7ZczoVFFgKfNG+RODgEovw3wrl0vus439bcjbk
 UGodrZ/B0LxPuBLExGFEmDMhAR5mNTVTyFLh0tIMvAXWSpOgz4xFZVTJVE8DABK2
 V1gi3vpGfhtXEsmJW9mlFm6LxS5cRglUdpUSq49CMgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nBxz7S
 TIe7aCWhYqSRpcWbSr3MDNNzhtdZ47GeKMPvU=; b=jyj3RDqvlssu5/OB/Vi+jn
 rp7nP4BndWMxpj/Bfr5mX6DSt/+1lHDLrkARkXQrWzPvyxC4G3PVPK/2MQVhVyGA
 65y0oQdKuQIuxXUWdt8gjrtvW85w99ZZgw43RYDypFlGm0Cqapw2+pV+UNOdQjzt
 AX4PFsC2fLvYi00AUUiClhQrerV8vKBMkE4DimEYhm86aFBdCkXhuL61gHJG5jli
 kyiel3d8qncAOhmKrdmI9VI0lIfPcSuQlB+cNMWP2PMTRfhnFMkkCotjz28dMfXE
 CRUnsgrQxVPjU02c+HdPallxLiTDO79ud9cy+L3mTWM9yxwfkQGfhacEBr5/KfkQ
 ==
X-ME-Sender: <xms:c3K2YEl2p97AiAV74nzMJMMnPHrpEukC7O0O19Glmq6rcu-PrdUIIw>
 <xme:c3K2YD0P1eJ-tKjK7jvFuPR0Zk2Iy85aJgs-Qz-37KnekKlKxL-jKbFmViw_xFxMR
 yBJKAMY_sf2rfWMgUA>
X-ME-Received: <xmr:c3K2YCqjBOpuv8YH1Dq_BnIVjxtaxxIiASpZadhA2eAXykdvljY9ggSsY8tAp4eeFGHnwlQ5mpzutHmm154gEhB4D-uOJiNPMsRUoFgBD7fdAY160A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelhedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:c3K2YAmhLOpG615FIpit8ucwXMi7p9Bfh-ydojnsgSPmwdTkT8-LeA>
 <xmx:c3K2YC1rPkygTKMQn4oN88o90RBgi8gDBcwmYGDxHFxwaDEEbVCq2A>
 <xmx:c3K2YHusQN9e3Y655VedR17iPLxX0RcVdf63Nd08lfz9uXCQDWoq1Q>
 <xmx:dHK2YLniRPyDm_HE_Y5hfgJF_G1Rxwd8wu4npYreTzya4LhO5SUAQA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Jun 2021 13:46:26 -0400 (EDT)
Date: Tue, 1 Jun 2021 19:46:24 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Message-ID: <YLZycMzZpGE56+o5@apples.localdomain>
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
 <20210601143749.1669-2-anaidu.gollu@samsung.com>
 <20210601171936.GB4506@dhcp-10-100-145-180.wdc.com>
 <YLZxTlikAcJD98Ut@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QmqN+miqbF0CmzzE"
Content-Disposition: inline
In-Reply-To: <YLZxTlikAcJD98Ut@apples.localdomain>
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


--QmqN+miqbF0CmzzE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 19:41, Klaus Jensen wrote:
>On Jun  1 10:19, Keith Busch wrote:
>>On Tue, Jun 01, 2021 at 08:07:48PM +0530, Gollu Appalanaidu wrote:
>>>NVMe Boot Partitions provides an area that may be read by the host
>>>without initializing queues or even enabling the controller. This
>>>allows various platform initialization code to be stored on the NVMe
>>>device instead of some separete medium.
>>>
>>>This patch adds the read support for such an area, as well as support
>>>for updating the boot partition contents from the host through the
>>>FW Download and Commit commands.
>>
>>Please provide some details on what platform initilization sequence
>>running on QEMU is going to make use of this feature.
>>
>
>I totally get your reluctance to accept useless features like device=20
>self-test and ill-supported ones like write uncorrectable.
>
>But I think this feature qualifies just fine for the device. It is=20
>useful for embedded development and while there might not be any qemu=20
>boards that wants to use this *right now*, it allows for=20
>experimentation. And this is a feature that actually *is* implemented=20
>by real products for embedded systems.

And while the test-case does need more work, there actually *is* a test=20
accompanying this. That's a higher standard than 98% of the features we=20
have in this device :P

--QmqN+miqbF0CmzzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC2cm4ACgkQTeGvMW1P
DelFZAgArCkju3JTp1MrGx9mAwVkGvpPAxgmP3DzcoJFN8CIJ8upENB556p879sN
dMoUSPgswS1hdbC3LGKXMbvd3q/8GO8K7I/Kv81EYa8LXhzNOIsHwc/bwjLDJuL7
S0KftkxcuKM9jFG4mEeil3X0bCWHiHdoZ61oCf6JsIEEvSCa9mCmF9GPGv4zFL8k
0lPW56ubz96a1rBKmUtAnOM9x2MWc8iyfi0gc/JrFXUhqVomg96kXAvCv9TnvgCZ
mWhmEn7Kn7gblQv7J1yg2bLcBZY+kzfq9XAPXo6Y18ZIvPRiKYB5GCIz02UxnOtF
GDyrbJXWUaDzpLEAvvnNGEmHS58jpw==
=qMsS
-----END PGP SIGNATURE-----

--QmqN+miqbF0CmzzE--

