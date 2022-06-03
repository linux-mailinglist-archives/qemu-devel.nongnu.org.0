Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E053D2CC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:26:43 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDsY-0004QG-CB
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDqu-0003WQ-VG; Fri, 03 Jun 2022 16:25:00 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:41235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDqt-0004aY-1p; Fri, 03 Jun 2022 16:25:00 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 38DF0320092A;
 Fri,  3 Jun 2022 16:24:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 16:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654287895; x=1654374295; bh=J1
 XNePiv2HwoCWOpooEGRFrVXBwJo9M8AS4Tb9xodWI=; b=ZUkvnGvuitKgngsPrp
 qnGr1UWEOyOBPmhbNmp+vPOaTnqfx3B4e9KVFuKRWICBR53ypSzHSJmPnYAgud1o
 9XlvudXwkAm9sLTrS5Zc1EpdE1q07smquzLXzYanQZS6dX4H4doOTOmVO2PLVYtc
 mfAmtfgb1KokHEzWrftf/hl2o8XNHyxVMPMImKK/W/6FvE9S/LMLYWAaqrSZL3E1
 UDeiTzeyurQgq6QvwjdRodzoSNY22hDEiN3RoQhKDSWqGOWOI29OR8BV+/rGf193
 7eM147Hlt4lAQwd12uZ1BvGt+XPuvG7attn95nAdHVG3CoSHHFtE1vQowORPyPtY
 c/lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654287895; x=1654374295; bh=J1XNePiv2HwoCWOpooEGRFrVXBwJ
 o9M8AS4Tb9xodWI=; b=rNOO4idBXLYP9O9uW3gwbn0EAiJJEsPlhJkcpN+74by6
 sQfMPRqyU8MsgjOq3JFS1pMZaIIQbck6lF8qPvh1sdWEGUBGhfxkNUvtXj8vWEGW
 4aL7klhUAtUlrjbVm4NYB0kA26wGyGqSRoogvu9whN3yPlU2oQqKybAdULS51OO3
 IXZSfwYuFq3MwhZxnByoOA87vToqQ2QyspDbt/wo+XKpNq0vh5yUWinSqxlDlLTA
 e+o3PmtH6ST+rjJJ3F9vA3wK74WocUuA1echiitrI+KGKEtrKvs6jDTv1LFQigx8
 lgeiz8Lh7GM7QQEXk/92rRhpOCsTaPtBo8HoZ3F0Ew==
X-ME-Sender: <xms:Fm6aYjqr0XV4TmfMaT-au9NmwHdwH-2LvtESyz7iixQ_R6ZmcK47MA>
 <xme:Fm6aYtofivfBaNeGmLv-zjdqCT7vUugp3iP1r9gFToT-yHmePsh4TwABvvdyxCogm
 fiRjOzUcNJ2JoiWdyY>
X-ME-Received: <xmr:Fm6aYgPExd6UDHnRs3I9CG71DqEjO1KHajV1pKzJzObx-fjdugfrzkt5C4dCgp_spaTm6oKiVzy9fvomIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Fm6aYm6T9hmEDhqZr2IP8ckgLw5KrfnMzSE3cQ7s6uEc2KVZ3pzRdg>
 <xmx:Fm6aYi5eHSCd0qkfZwjzYFV46nL_Rkv8Ugg53cebqiRCyzqTXrpK7A>
 <xmx:Fm6aYugJbUZ_ZGD32vPhBJi2kj-wA0ukC-npooqWB_85VHFL5FaOFw>
 <xmx:F26aYkQJo5mnhVsJlDHxEWsKa8bFagEHCFzRAVfxqxwodAq-H0lMYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 16:24:53 -0400 (EDT)
Date: Fri, 3 Jun 2022 22:24:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 lukasz.gieryk@linux.intel.com
Subject: Re: [PATCH v2] hw/nvme: clean up CC register write logic
Message-ID: <YppuEyXp/iL06z/C@apples>
References: <20220525073524.2227333-1-its@irrelevant.dk>
 <YpdpjLHhJDpTn7kP@kzawora-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B8XLn8dLjM/LZs+h"
Content-Disposition: inline
In-Reply-To: <YpdpjLHhJDpTn7kP@kzawora-mobl.ger.corp.intel.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--B8XLn8dLjM/LZs+h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  1 15:28, Lukasz Maniak wrote:
> On Wed, May 25, 2022 at 09:35:24AM +0200, Klaus Jensen wrote:
> >=20
> > +        stl_le_p(&n->bar.intms, 0);
> > +        stl_le_p(&n->bar.intmc, 0);
> > +        stl_le_p(&n->bar.cc, 0);
>=20
> Looks fine, though it seems the NVMe spec says the above registers
> should be cleared during each reset for VF as well.
>=20

Aren't the values of all other registers than CSTS just undefined? (NVMe
v2.0b, Section 8.26.3)

--B8XLn8dLjM/LZs+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKabhIACgkQTeGvMW1P
DenwzggAqezW8jqWSM5+nZjAlPrUJtN4oKQyNQu+xG6iaBBZeO7xLZBZ/pdAPlO9
YRhG/+TkkXZ+UaIfFAmFJKsRxMHeKRf5Fc9n5bjv5CaTtIOqI6p01rACJiATi8CD
1T0nk9DWqyhMGb4CFp74Cm/0XjhRwbHu1OKPjLa/7oWTs4cjC//0Il3aTTANuh84
/5UAHAHKYZPfVO+W/BHCqpqQUelw2RUlhzI/2Fzs9FC49+gz2X2+7XifMtVa+CJK
Uwtf1vGJudu0zRF7k0KKUNpBZKMqxZRRiyxb0eA/P3JSHw65ahrFC9p0t2emwdUm
wJYrSd5HVfg2dntfFOOGG6etoO/SZQ==
=l9hR
-----END PGP SIGNATURE-----

--B8XLn8dLjM/LZs+h--

