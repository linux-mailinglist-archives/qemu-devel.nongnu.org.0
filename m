Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39A3F9427
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:01:35 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJUvl-0003vh-PS
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUoi-0000VS-91; Fri, 27 Aug 2021 01:54:17 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUog-0001hB-MU; Fri, 27 Aug 2021 01:54:16 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D0DC432009F5;
 Fri, 27 Aug 2021 01:54:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 27 Aug 2021 01:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=obe2NxmcFyl8ECgA5S12RMZNkHo
 JVhQLAcfzJOXDG3w=; b=VUNdny/RKbhxoipjOrgnBNGHohQAj50SrhP66XidamT
 9wdhTa8k9PpuA9T7yrf3YRLMllisz/GPalLuO2brJFljkBLZO1V6cXgxLThLzNsU
 9liPKg2N4aWB1ijZE7t8az7Jxl7ZPSPJTg6wEou40dZuAp0iJPdqmd28j0mdzcmP
 sD4Y42G+QLajbbNp8tF15kuLNopqcqPlgN96KP/21R+qAMjGZ1+qq0j0Pxd63KTk
 wBR/EydAmOVJoBaVsm7NmkZd97LTgmPMJDC6fqgy1CYQHR18fCefkcjaul5rk1JA
 Dr67jESc894lPik+XmsVqEjjq/3DWINFtvkeHD1t1pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=obe2Nx
 mcFyl8ECgA5S12RMZNkHoJVhQLAcfzJOXDG3w=; b=gXT4nLZ03j+96sZ9QAJPzB
 uN9+91CRiBffVVcRuunBBmJdDWbZkwgxX7YPWL9049stT4538kphIRawbcGrTQeY
 krYfZ5gypF0h/NfbaTmD6vxWeySAc+wef4XR3Bd6NOOAiVqriokrgHvuYk3sbQ75
 vh3ewymAPeZfkLrrmB5hrVo9EL7L8NlMszgSXDk+eVRhpYrmpk/DZSP4XxXXLqoX
 zVqSc6uePNZO5LZ5GNkZXkCqNZcgG594q4HPQzYYRj6M0+wPr32YN3/S+7H91wt/
 URS523t9BnsVl5JL0VyyYPa4JcNPe4f7lyP9XgmJQaNgmMg0DaPOaLxBq8QCjQtA
 ==
X-ME-Sender: <xms:AX4oYU6joC7S-SdYt6vlh4plveWHYMJe3EIsBf7kY44zPHaIbaBb_w>
 <xme:AX4oYV64-6S4eAe5NFYds1sbKQCx7t49DT1-dsCjYbKbijMTQoxUhqPhl7I9Z3uBD
 7P05oAqyONIXl7wkHE>
X-ME-Received: <xmr:AX4oYTdM2thzeBfpiW6JFhJYht9Hh-Ff29fb8qWL328uyM9uiZg_7mTc5o2DvNq78g5VzrwSo-QF2eNIUrfcMhZig3TgzVsCZ9zcoj1PRMHN9uM6iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AX4oYZJJA68As2JLIRnWYf_nBhxLB9NYV58skPJgL1ODlyBXhsGIWg>
 <xmx:AX4oYYJDWyP3OtY-Cdh0HAevmmVo3udnL_0o2xrIer4R3dExY8la-w>
 <xmx:AX4oYawmQYWA27rt6PTnNVtZ3IGaByuKxZdTNe3Ftt12k4usY2FGmg>
 <xmx:A34oYX-woCQvlCl-dMPqbqwk0yHU7p2nh0vvkyN0Fe9_lxzAyHjRew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:54:07 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:54:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 05/11] block/nvme: Have nvme_create_queue_pair()
 report errors consistently
Message-ID: <YSh9/QzjljVK1P3I@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-6-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y4muogdzNDdMGYZS"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-6-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--y4muogdzNDdMGYZS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> nvme_create_queue_pair() does not return a boolean value (indicating
> eventual error) but a pointer, and is inconsistent in how it fills the
> error handler. To fulfill callers expectations, always set an error
> message on failure.
>=20
> Reported-by: Auger Eric <eric.auger@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--y4muogdzNDdMGYZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEoffwACgkQTeGvMW1P
DelKMAgAlHzE2HF1lHvR1s2plaXjqkRarTQWoldzxdQ3GexXvSjLC5zK52Zibd92
6+nhb4Te0BsPkyFMKvidfqfoJ33pMC6oO/nJBeeQ2+WtW5k5x78qyQalslEdpQNs
QptISvOhk9MMYkrqnuTkda9ZXXOhse9z9mxg0g1QYAeV/9nlp/9+7PzVvigfUq9P
XGpY4yN+bXyX1RxCVCvKg12OKscpfaoug4yR0+9vyFjoQOkqB7iaRb6V0V9UeSdh
OBsNicUI1dIWFeymM5/0C/DLbr7VrrzafosNi8KULV3W33IHgZPFKLTm1CNN+Gmb
V1pmmJY4qJrazfVERixJ3s3AUQCgvg==
=59HR
-----END PGP SIGNATURE-----

--y4muogdzNDdMGYZS--

