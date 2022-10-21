Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998160704E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:46:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollnH-0007O2-AI
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:46:11 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olljG-0003hV-EQ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1ollj0-0002xy-GQ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:41:48 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1olliy-000476-Mr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:41:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 165DE5C0064;
 Fri, 21 Oct 2022 02:41:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Oct 2022 02:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666334491; x=1666420891; bh=6M
 IvltKW2o9stoEATY99GoPr6ZBwFaxsY5jf0IaiA8E=; b=zUFXtnnXZpy1kbp8Ei
 uQfI7bSAW7/coU9/qN2qnP51XuRiUQFWdWsCwWWt3Rs4++9I4BHUF0ULTsyvZ3mk
 XBAA2vkDshXJN+8lEOZoLdUhfmfYqnkg/KjYZkUU3yUS9iYVrUnhDQWdxN3fXGxH
 j0pi6HA6jrBdAZfeXHbPl0IL2WqHxR5yQND/47HLHri5u6gbryvgjqEZvD3QjRR/
 GoCLOEGAadupCpTC8leGdzA66GiL+tFPUfRWr47bbuxXAMaxYLSdnjvOWuoEVZ/H
 lSppqH4bFjHuCDxwiyXRRcuYXOkDshchayqq7h1ljqHWhJikj4OCJ35B/u3XFaq3
 GKyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666334491; x=1666420891; bh=6MIvltKW2o9stoEATY99GoPr6ZBw
 FaxsY5jf0IaiA8E=; b=jTsscFlMqrBwoS4Qy2g3UDW12dxItS5DT2YeL3ozS2bG
 Pwf3EXC2QVcVROP4f1WK2wmcA0d0PS9jw2A627lufM2RStkuUvSqKrhVM8gv27S3
 p4I1ce1zl4wiibKoOzoGN9ApyDzMQekDwAoSB96S76AW4rDhAAfQRaLOa5ohCzWL
 5H0fpwLb9ppLe4PKVyOswmHUDPi21ZY/lqYmmpgBox6PZXVuyZJCvU66QV5cEtj1
 6w9hAvftmkrF02WXFma4bKxcKNdjgtonh6BDV9exXS2Cm7wPDbD23blKE19qeGII
 8yrA6FBZjQ+8uZcHEWiDtdGRyK/AyzyGqBbMlXQb8Q==
X-ME-Sender: <xms:Gj9SYxmY8Mta8_TIPntO1vKKeBdVHfnkWRXy_rcPHnMMB8DuqcygIQ>
 <xme:Gj9SY81UGSs0JC77WonWi9Zx01Yqqwmrfe4HhZIb_9HPdpbx13GGTpPWIxqnqZend
 Gma2Gez4ONwtkmiDvo>
X-ME-Received: <xmr:Gj9SY3qhVQapC2rTNOPoXMDnzWB3E5aqiFTCqLUTa0erUevv3_3iPh2bB16qobiasGGG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Gj9SYxnJ5I5t4ag8WivivqjmCaTvMPoYBCEVzOZJOapRFASGfdBSxg>
 <xmx:Gj9SY_3ZZbESzdL9-uFyW2qwgVLsf9rY-9NJxkOI0VUbKD7i1Xrc6g>
 <xmx:Gj9SYwu7WeZ_PbKEdHTwj8T7DiseZxEFr_7RNtfUJ7uGcnHEd0QE9Q>
 <xmx:Gz9SY6R3SaRTYorjUBLFPrDIftP98oLmIyj6ZRncGj2vCRODERYYRA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 02:41:29 -0400 (EDT)
Date: Fri, 21 Oct 2022 08:41:27 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/4] hw/block/nvme: add zone descriptor changed AEN
Message-ID: <Y1I/F1Q6IjL5rLRH@cormorant.local>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-5-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vGGvmf2T7Ye0p5LB"
Content-Disposition: inline
In-Reply-To: <20221021001835.942642-5-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--vGGvmf2T7Ye0p5LB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 20 17:18, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> If a namespace's param.zoned.finish_time is non-zero,
> controllers register with the namespace to be notified
> when entries are added to its zone-descriptor-changed
> log page.  If the zone-descriptor-changed aen is enabled,
> this will cause an AEN to be sent from that controller.
>=20
> Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
> ---
>  hw/nvme/ctrl.c       | 62 +++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/ns.c         |  1 +
>  hw/nvme/nvme.h       |  9 +++++++
>  include/block/nvme.h |  2 ++
>  4 files changed, 73 insertions(+), 1 deletion(-)
>=20

If the controller is hotplugged (device_del'ed), you need to remove the
controller from the watch list as well. I think in nvme_exit().

Otherwise, looks good!

--vGGvmf2T7Ye0p5LB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSPxcACgkQTeGvMW1P
DekZ+AgAuBHYiWOBcriu6PPZ4mMu7gfDH31U9HXYRkENuDUKna50jfLtofu2llJo
5LQM08lFv0P376QABM0auxEdIas9H3FlcbodWx95vUS+BzEddJzh7vCV8Qo5eI0f
J4Ejy40ByubLaHYaCdJXw1Eovy1WBwcG48Ckeld0LYlmfNYY+KC0Wynij+0xtf2W
kEEwlqj4ncDzbqsIlU7YvHOEW8AMRymyqzAYXPiXf81Qq5f36P+Ueg2zPcANHZWl
a1kIjQ2tbhIU2Hl2ia+WQDur4liB/iCDbOQqSRwfoCO9hdpT71UWGs04i2aM/EqT
AOvJkCa8jWiSPEqnltxcKGbpGw8/Ww==
=V2nf
-----END PGP SIGNATURE-----

--vGGvmf2T7Ye0p5LB--

