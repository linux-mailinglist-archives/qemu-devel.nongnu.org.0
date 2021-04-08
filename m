Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEB235827B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:53:44 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUTEF-0000yt-5q
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUT9P-0000B8-NN; Thu, 08 Apr 2021 07:48:43 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUT9K-0006ae-Q8; Thu, 08 Apr 2021 07:48:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2C81010B2;
 Thu,  8 Apr 2021 07:48:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 07:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/b6rH2GEzMbD+bD7cZIfc3jQ8su
 oVyytiEbHM9Y4UK4=; b=VqMAw76f9zOiazcNGGJtiZfdf8mLIjhOSCKt4gIYCLu
 MZJOJHQFEgmHbm/KSC6cCDgtcxGBwtcZAsAgpbZwBs4r4erwJdezuroLO276ueep
 9jjA24vYVbcvA4CusbZLejABLxWEZ3Mi72OWm9nzpwzhauStV0aO8oxLkehTcsoq
 w3zG4VmHSl6QKr3qcYgjtAK65gsZzVY2D/2Dop9TwzW45l99oGzCXzElp2usUZPW
 GJerFCghwMqhXPh9Fulmh9SidHtiUKzCBf6G9HhBH0SvQNuzaPto4NV3gJp7dGaE
 Js8xtYb3yFPuVNeVLqx9zjAm5YDcmxp/Iw1IQZ94eIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/b6rH2
 GEzMbD+bD7cZIfc3jQ8suoVyytiEbHM9Y4UK4=; b=V0Kdup3ZzZ/yPTaREf2hMa
 rt222jSwpqPf03QAxkdNuGXoJwKezz8ZcU5u2gAWLeA1GGQSSrWNph9Tk5k6BUCI
 kK4/e1NufexIYZXM3msMRdELQMo0fB+dlmKRqmVuI9nhQtG20OL0xIX114TbX5cS
 sWrtwYWaWceVFFAI5fP7Z0Y8uC5kLpY78KcnR7UAlvQkyfvScMMQgLxnytwAZmzT
 FEcWb81rjCvnFtOJVgjXphb8Sg3x86s/jCIHxmSfl4Cv86Ml/OCwl1sEjb29h+0x
 ynZpaB4vgghfY8FNY6JfWSeln4810yNBIgWeYSfz6q9Ibut63SXSkd6thYELxL7A
 ==
X-ME-Sender: <xms:k-1uYGn2wNqce37YPBg3WalMfZLVQ19LV5V2WrDKWDva9o3V_k1m0w>
 <xme:k-1uYN1cTQBj897wnEIvI4iWD37hK_i28KmeUKUBuSyZVlzHSgkrGvsA-vni6LOgG
 8lXGr1RkrEOLo4YD2o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:k-1uYEpwe9tBx8LIf9k5VET65hrlFBoSZLjxBlFJg30tyLNRmnwiBw>
 <xmx:k-1uYKm3jE8PKpCTpnNUdfHIJE6M0qJML2PVRt2cauQhU7QotSXBew>
 <xmx:k-1uYE3N-2XtfPeZ-vbVVCT9weaZDRZnv2Rql5OPpg7iBW-u2YqCdA>
 <xmx:k-1uYBzi_oiOvtH-8atoUlHZE_ezrB80BNU4GRDPsI5xrzMAnGo65w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32B7A24005B;
 Thu,  8 Apr 2021 07:48:34 -0400 (EDT)
Date: Thu, 8 Apr 2021 13:48:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] docs: add nvme emulation documentation
Message-ID: <YG7tkGAJQhsLrqln@apples.localdomain>
References: <20210408095028.382751-1-its@irrelevant.dk>
 <177d588e-f423-69f8-2b47-b7bbf9ef701d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2cBZwWc+R6b5aGID"
Content-Disposition: inline
In-Reply-To: <177d588e-f423-69f8-2b47-b7bbf9ef701d@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2cBZwWc+R6b5aGID
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  8 12:17, Philippe Mathieu-Daud=C3=A9 wrote:
>On 4/8/21 11:50 AM, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Remove the docs/specs/nvme.txt and replace it with proper documentation
>> in docs/system/nvme.rst.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  docs/specs/nvme.txt   |  23 -----
>>  docs/system/index.rst |   1 +
>>  docs/system/nvme.rst  | 212 ++++++++++++++++++++++++++++++++++++++++++
>>  MAINTAINERS           |   2 +-
>>  4 files changed, 214 insertions(+), 24 deletions(-)
>>  delete mode 100644 docs/specs/nvme.txt
>>  create mode 100644 docs/system/nvme.rst
>
>> +Simple Copy
>> +-----------
>> +
>> +The device includes support for TP 4065 ("Simple Copy Command"). Copy c=
ommand
>> +limits may be set with the ``mssrl``, ``mcl`` and ``msrc=3DUINT8`` ``nv=
me-ns``
>> +device parameters.
>
>All parameters are described except mssrl/mcl/msrc.
>Any particular reason?
>

Not really, missed them. I'll add them :)

>Otherwise:
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

Thanks!

--2cBZwWc+R6b5aGID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBu7Y8ACgkQTeGvMW1P
Denu0gf9GjjKPuS9Ee44/DYhKZ5cJ2s5h56ucOEAziXfzJg1Xgr1mGSVhSsJVPLG
5As0NMd9lxJdMT6jRlQbnHXUO6+1uSFxHnMM4lV2kk3SvNSEwp0PHoTHdf/hs59o
XO2jNCyj9WNVzgNtKS7TdmxyD1eX0M4hcmd45G/JoFXVqccv77XJq+c+m+HtuTw0
bJKj0ZQx/U6o9IHS+niOq/EYISteEkhz8t5Ih7pVTAdyTbMVTQnmP3W2+cDnHy3L
nxRUw8+GANc0tU28a20OpBWkwtavGzIOuztprePW/nMbub3y/BWhkIzGCUTxrfgN
TAKVKQ+7Ux+36TbU+/bDIKO3d8oDGw==
=SG+k
-----END PGP SIGNATURE-----

--2cBZwWc+R6b5aGID--

