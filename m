Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF21367249
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:10:44 +0200 (CEST)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHJA-000847-GR
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZHDL-0006aO-0h; Wed, 21 Apr 2021 14:04:39 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZHDE-0003Oz-M6; Wed, 21 Apr 2021 14:04:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B0145C015A;
 Wed, 21 Apr 2021 14:04:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Apr 2021 14:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Jqp+dWHnc8KFck8FUa8ME4YhZRS
 JStxs0C4ON+9Wddw=; b=lcc7jwoYQq6M9gRfhDeDQg82wY7RdSjXsbL1X9lzxH/
 tX+16CwPhlH0YZ9Y57DF4MslEYz/iFWMO6akdSzPY0fLOhrd812bewgbJo0janTK
 HteYEF5MMsdyixkAFiiBomWFqzesT+4VEASJg/iEEunQrElDIEoWuD65ZjVAHLna
 oBu2egLV4u11ecvhn3VWJgzUJ1sGvzzHZ/pgHlEb1/GFHxwMUm9pkIxdixxjdF6o
 3EF+ZXS2j4iClL/DqF50M2f1VN+yytGWp12TLZspCc3uMnXeD2hX7MdYlAmr6i9c
 Dwr83Br8VrGRPK5Qpsa1gP7F8A0AaQ3LO9p8CzBU83w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jqp+dW
 Hnc8KFck8FUa8ME4YhZRSJStxs0C4ON+9Wddw=; b=D6tNO2FH9UeSFJetx58wOy
 Qi16AxUcRJbpvVQtj5iIUHHApWOPqdP/uVVjh44Ioqa7qyKS1KW9m2dRBIRwH+t3
 kB86v3YQHwVHUn8T8jIeFQ4SmyC+hHj6DImThiWC9Ki/KybU6MGf+x/jVMvnBE5G
 GHiZdrw4pjkW2+jt25GzJvXOgl9wVwBjcfLJtk3q9yptgtFo9RhS7M1qBSCNBDQ7
 ned/zaGKkUYVX9wLa2UGNsEYXJh3Ymc05KCTMPsdG3AaxcW0ZGuoBMVXXPVPhUIV
 8knWsRu613fuD9NoKcoHl06Jb+XfQyJDxTvw/zy0wt7/umTZXyeVtlph5h3aLXSA
 ==
X-ME-Sender: <xms:KWmAYMKD57o2XNOKQxmACUZCpFAruAchUbSqZi5vb8PjBVmkVXgK3Q>
 <xme:KWmAYMKBwY9RehkDRegMIevqguvO0XieD8b4sFakdW6At8AYRYc28ml332DBOCDjn
 OkB-lTiu4AJ23aL1WI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtkedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KWmAYMvjMOLFoatR7nnVOX8ZnG2JkR6hNtLBIzp9sZfNtZchBiwybg>
 <xmx:KWmAYJbLgInYsSpYxdrBpPZM6wwo6O9tfoRFkeS2yBTSP4DrLVfItQ>
 <xmx:KWmAYDY3S0H_AssMjEQb210QDNasqqyHrNBq44mPz69iNvRaUXJXRg>
 <xmx:K2mAYOxIeEkgm90T8C6fQh4Gj2iZftRyoII1_N600Pb48qIaQpbaRQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85BD3240067;
 Wed, 21 Apr 2021 14:04:24 -0400 (EDT)
Date: Wed, 21 Apr 2021 20:04:22 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 14/14] hw/nvme: move nvme emulation out of hw/block
Message-ID: <YIBpJnNdKBECZSG1@apples.localdomain>
References: <20210419192801.62255-1-its@irrelevant.dk>
 <20210419192801.62255-15-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mmK09k8TaXpPp3cF"
Content-Disposition: inline
In-Reply-To: <20210419192801.62255-15-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mmK09k8TaXpPp3cF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 19 21:28, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>With the introduction of the nvme-subsystem device we are really
>cluttering up the hw/block directory.
>
>As suggested by Philippe previously, move the nvme emulation to hw/nvme.
>
>Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Hi Philippe,

You originally suggested this. Do you know if an Ack is required from=20
anyone "up in the food chain" before being PR'ed to Peter?


Cheers,
Klaus

--mmK09k8TaXpPp3cF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCAaSEACgkQTeGvMW1P
Demk5gf6AgmIot1Rujh9LLOU91fyCA6dr9M77E0RwM+kgfSq1LlkyV3EnWxUOHDW
8I87GW9eZKm8E0J8t3QTcowrlIBtdb+f98T0XIoZeGKxI4AM0hREKZcl297sCoOa
FUX9UFr10fSdBkf2ouVQ/bcIlrvD2mhvJn/aW+M3C2fkHp3Fl2mSkogP9SK85E0r
/R4U1ERH8Jfyl1IdOe3YbOqdO56cJQxyP+nC6LyCHuj45nBw7NrTTLz6dPTGhLDB
Ca/6sjZ2qIEx05YvVNK79aHju3J3WZkDjlhP1pMqJq7KtGYApMts++2D3IcBmR3c
NnabP3nzuxsXVq4i5wIntYuDNIZVuA==
=ycsO
-----END PGP SIGNATURE-----

--mmK09k8TaXpPp3cF--

