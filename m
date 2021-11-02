Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FA4430BF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:47:23 +0100 (CET)
Received: from localhost ([::1]:45940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhv4K-0002Lz-RV
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhutI-0001ps-3k; Tue, 02 Nov 2021 10:35:56 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhutG-0007uP-Gk; Tue, 02 Nov 2021 10:35:55 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5A1703200E82;
 Tue,  2 Nov 2021 10:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Nov 2021 10:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=4d6lKOyiI273NfeTiqg6SnrzLp+
 xmhtvSeC3/k2558o=; b=HvFq85HXZgwLRXo/JT0S+vycdgFWcjoNwVnCnELfwWD
 Wc9iSIUxqdjUO1MKw4Kad9xi833LolOjl6egSUPCW3J89pcs6pkaM0KlywgV+Qhh
 LDpacGUUPAcz59rI4t61bLZzdJJVm+ip4aMH1pwXmRofJ4UcenwgaqGndZDceu+c
 DaOxI08Atrdylnq4rCWyOgCal/PwtsU+rANtArMUnyhZx3nfu0cucX7hSA9BCfNC
 q/UKRR6XiUTRCrTOxUeWLPKvYjeNQkUiwmMXI/yjLaH3tWwV6Jl4+13Hq/uk2Hnz
 KGcQfu6l2COUVBCK22hdZURGLa8s6mFr8mmdke5MSpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4d6lKO
 yiI273NfeTiqg6SnrzLp+xmhtvSeC3/k2558o=; b=cVy/BAxPb+8AJdU6dTz++R
 GjsKJNPxKNLyegBFGF/ZluyXGX71yTX9D0oHPEkXau3A+qalDJTZkNRPXXmXeBRl
 Pw7uR2S6YDhjsN14a25YHd8efGYFwxyUq78sB6KdZ4Pou9GttU6ZJPRdAlgd7dfU
 RLHTqb9VUc3aJVzK0hDrQkHMwwh8ToARDoIaoCo1bfTzKaK1SjKovS57EVBtQcwN
 gHcjKP9CRnO+JBCyJtHtC3TJtVDoJS5f48LShCPikn42CsNM8AYKclT9sgX6f35c
 fik8WQ7cC1K97cfyjaDn4gHmGNyQTppAwHkN0ub6moah1GighoQCphjylCCn1b6A
 ==
X-ME-Sender: <xms:xkyBYbH9fvWajI7Rhf0OMWsp0w6Uu7q-YeN_RcOBOJeeCseZKmSQXA>
 <xme:xkyBYYUmIUQMISQK0OdnC-GwH7s4kIafpYgjE4EixYKBsnfE5Sf2P2VBhQaCjeBTt
 howyZrOYjen7Z_xsOk>
X-ME-Received: <xmr:xkyBYdI8tZpBuYmgaU2aL7v-UTxGnm2p7jHgCEK6pY_FfLxtAWKaZmre-ve6gXO8tx-kbg9YTng5x3w-mHxbcAmCVtywwcYIexbgHdEMMXJa1apE5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:xkyBYZH9SiYnRA3xrX_MKtMSsjOH0LqEvALpMB_1iOBg2WDFbtqkYw>
 <xmx:xkyBYRUBrmkpblz3AmZtmf0bsTo5b9Y_8S80uERZpjXgxSmzPGpLwA>
 <xmx:xkyBYUPwUQpB1VjwLvwSu91QQ-n3pqCNfdoCoUu_Uc1OzXexsOL2MA>
 <xmx:xkyBYXyzDfQ2OYGeELpm9NZyR1AeuUx1FEDBo5Vd03sJRbgb6i4JRw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:35:49 -0400 (EDT)
Date: Tue, 2 Nov 2021 15:35:47 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 09/15] hw/nvme: Implement the Function Level Reset
Message-ID: <YYFMw0yYx1dFGd88@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-10-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sEIzPrjcEGbR8ZNc"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-10-lukasz.maniak@linux.intel.com>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sEIzPrjcEGbR8ZNc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:24, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> This patch implements the FLR, a feature currently not implemented for
> the Nvme device, while listed as a mandatory ("shall") in the 1.4 spec.
>=20
> The implementation reuses FLR-related building blocks defined for the
> pci-bridge module, and follows the same logic:
>     - FLR capability is advertised in the PCIE config,
>     - custom pci_write_config callback detects a write to the trigger
>       register and performs the PCI reset,
>     - which, eventually, calls the custom dc->reset handler.
>=20
> Depending on reset type, parts of the state should (or should not) be
> cleared. To distinguish the type of reset, an additional parameter is
> passed to the reset function.
>=20
> This patch also enables advertisement of the Power Management PCI
> capability. The main reason behind it is to announce the no_soft_reset=3D1
> bit, to signal SR/IOV support where each VF can be reset individually.
>=20
> The implementation purposedly ignores writes to the PMCS.PS register,
> as even such na=C3=AFve behavior is enough to correctly handle the D3->D0
> transition.
>=20
> It=E2=80=99s worth to note, that the power state transition back to to D3=
, with
> all the corresponding side effects, wasn't and stil isn't handled
> properly.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--sEIzPrjcEGbR8ZNc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGBTMIACgkQTeGvMW1P
DenHSgf/cUX/oJrC1SdGJSm0keuHuqFsBXipncP8oERH/TK5CI8KPFzlUod70cCR
8tY4BTHlq3JXONoOSrH/DVpKMTv/Adu9MY8jh+NG9C1jGAK2OcF/RRffGCY6Yawh
bU1usyTVsb8axrK5n2u6LXUiehjwJmiJvbg079k9glmiCGZy5z94Y/ExJVGfUEpX
0wHTboUkK/9Q5gAf5lwAII0rMuB1LozUm5v2lC6U9C/cQU8Fl6XA8Gz9jIchmZ2R
wfqgGzpaqu3BLGt8j5IWUEeDXhaYllAueLEbzqLxY5D5itEOeednirSvqTyyDd9d
FGE2TOwiNd+RguwtdMQYEPU5X6yynw==
=9yVB
-----END PGP SIGNATURE-----

--sEIzPrjcEGbR8ZNc--

