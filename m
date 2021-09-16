Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609340E1AF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:46:01 +0200 (CEST)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQuWN-0001eL-SD
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQuIu-0002bB-91; Thu, 16 Sep 2021 12:32:07 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mQuIs-0002qG-Av; Thu, 16 Sep 2021 12:32:04 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 11947320093F;
 Thu, 16 Sep 2021 12:32:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 16 Sep 2021 12:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=2Bvr7qCuD9toDam9A2fJAHrUE/b
 l0bKoeB0cLwbHj/M=; b=Semi3eeLs4rVSB32bV1tOgxwOGwubHQ+dRQdIfjIfdx
 uSw7wtHQsES5XseYzQw7JxnQVoXn6H0KuMSDU/pQ1ax98MfBO5dh3nynZTUZJivC
 pSCUBDnK9fhqX8MpkPdZH2HNm89xJyluGDuXyfBCRKe6MlL1ZgbEGAjcx1VwM0+e
 o9ZEP39CgpaR2T3TpaY+Y6Zq/5XfE6o1yyBMCAZAkF2Yabiy8rNNE63WTN65Tp3X
 AwnQ49tVA0oC++9bn8tnoWr55me09+2MoIj5xd+v457Lhrk1EjZUJxhYMndy1uax
 +5ZUnbpZToSfzluafXzwYORoPcGkOXzv6a1zar/stiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2Bvr7q
 CuD9toDam9A2fJAHrUE/bl0bKoeB0cLwbHj/M=; b=NVadQpBmXMNv0ckHXXVvZS
 wMvSC2YGCl42WtyODFpb3y3EXzxWCLMPrHSRSXvSIsbFkJIOpt4y3tft2Sn1kHhr
 WX+8nLPol2E+flDbPmgMDdNZdH8cXCAfMqWBobfJczgup1+On0kaOymXElxg6Svz
 0M3CKWw7lWuXt6C24U30ZqavwwMQNVo3Ah/qyak5h5xJja99V/54vH9fY8rMT8ca
 tUqkA+SvTxS6YiiKtgIDG0cIiQLquSCsEeJfSmKj98C90SZxLIbPUtr7/vgyYCVD
 eiXat3+28/dYZin3U3smpPtm4UmgZj6FI3KyV9KCKA5nX4+E7qrmQUiYVOaiRjZw
 ==
X-ME-Sender: <xms:fnFDYawcDwto-x8IYywAD7TfUYx1HaL6hpesEg72_uu7vL78Mwis-g>
 <xme:fnFDYWTZtydKLFQR7dOJgPiSAgsX_I_HEl7DpF4KK8LRqaPWi8HayJRvEyJZxLKLd
 66gw5PDrpO_wNI870A>
X-ME-Received: <xmr:fnFDYcW_Jy4WA5xCG7CzU0kCh-KsAHTilvdonDXQ9KZm0JAS16LNaB1IhAlOW5GBjN0LdLUWE846YNJX55Z3H-nzpm-2YNZQLi1XS9yb_ISdSR_lHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fnFDYQgRt0G6SER4fv5yK_Q-rATi19Z7nLrhHrhcnGWuGq0Jc3zOsw>
 <xmx:fnFDYcA041NFeQ0ClBa_qh0PJFMGpxS6Ucg-5riGLYOYvAPmdRWMXw>
 <xmx:fnFDYRKSCHtDto_-Ddsu978TpYIBn0eic37DhBn0aR48zKDFjfIQWA>
 <xmx:f3FDYY0jigQ6OjsvNUoD3Ayvwn7MlBxrmRK2TP8Y2SxRXn4AN50V4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 12:31:57 -0400 (EDT)
Date: Thu, 16 Sep 2021 18:31:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC 02/13] hw/nvme: move zns helpers and types into zoned.h
Message-ID: <YUNxe9l5SlTngX39@apples.localdomain>
References: <20210914203737.182571-1-its@irrelevant.dk>
 <20210914203737.182571-3-its@irrelevant.dk>
 <20210916160605.GA3908552@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g4Kyf0b2/j86ovoq"
Content-Disposition: inline
In-Reply-To: <20210916160605.GA3908552@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g4Kyf0b2/j86ovoq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 16 09:06, Keith Busch wrote:
> On Tue, Sep 14, 2021 at 10:37:26PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Move ZNS related helpers and types into zoned.h. Use a common prefix
> > (nvme_zoned or nvme_ns_zoned) for zns related functions.
>=20
> Just a nitpicks on the naming, you can feel free to ignore.
>=20
> Since we're within NVMe specific protocol here, using that terminology
> should be fine. I prefer "nvme_zns_" for the prefix.
>=20
> And for function names like "nvme_zoned_zs()", the "zs" abbreviation
> expands to "zone_state", so "zone" is redunant. I think
> "nvme_zns_state()" is a good name for that one.

Naming is hard, so nitpicks are appreciated! I see your points, I'll fix
it up :)

--g4Kyf0b2/j86ovoq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFDcXoACgkQTeGvMW1P
DelvMQf/dX50lQ4bX0ljGFDftJVlWd0XajezrRoq8aepDc+k+T0tVt1tCjhNdYYX
M0ukuaqtF/LerupNKxZxmWVAlLSJ0cvEQa5QRxcNCWSgu9mdCzY5qKyYUW2ENGoH
z8rIALa3B8EAZ4Z7QBViGy625dH1ZmbOLl34vWDj1KvfNmBLMz15HhFHklExP3/Z
oZXw6DMEPu3ZNSQV5mzKJAA5eZ0tBMobte+30Nf4PoItAqhnX53ZeRdE2n5ioShL
ruHjvqir19eSgg7DTrPMSa/W2mK/ASKKnKAeuGpAiMId+QN96aa+GWledxlC42fV
cRzunMi0efZgwcgykhoRwzZzqB5E6Q==
=dm4m
-----END PGP SIGNATURE-----

--g4Kyf0b2/j86ovoq--

