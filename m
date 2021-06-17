Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4EE3ABCC1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:30:20 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxiV-0002YL-GF
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxWN-0003po-Mb; Thu, 17 Jun 2021 15:17:47 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltxWL-0000Qt-QG; Thu, 17 Jun 2021 15:17:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 20AF25C00F2;
 Thu, 17 Jun 2021 15:17:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 17 Jun 2021 15:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=YJ5dEIFWXDLtIy+ylVmfEsaG0RF
 11qtxRBSDO58rZ8c=; b=d4MbUa1AXoEehySdZJF8tJ9jQGf29X1nI3s0I7b1Tkx
 vm5JhcsSumWRFRQApBZlsvaMsx1vmbkmRxPZuJMV6wiANc5YFeZFQLpy8gMUfgTb
 40BNe5hdVBCANWc96RG7imD/CR8lTRTfRvUU+1sWZqoDT+sdtEu2dmY/7cbb9GPj
 dPn0NX/1nLUFgN35/CBsTJqBN2NfYl8PubAfUhX+9RgWUUBn1KBC5rKW78nWaR7v
 ViieEqI2kmaVW8JE5t0b95VZEkakS8v39UGcHDBp8B/N2pINtrcccvRbGq0eKfue
 OxxgxkcrzgY+yxLwb/aFVjTzwJ94qUPSJP9orj9NBlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YJ5dEI
 FWXDLtIy+ylVmfEsaG0RF11qtxRBSDO58rZ8c=; b=LRhAHhpibBz0Xqnhkz+yJv
 u9OhLX2GNLCLoWmE7mRGGiY/t6vavDuXAl7PWKBLzs4W23bGN7ihcPTeHaCcoVmb
 Qr2CsHU6FuSPBc1UPW7i28rAwQ9Asz+VHJfXpLTS+N3fBCb/QXduGf5DHLzo3Edy
 rINgB5utKD+71Mk1MCRwezXa12WWayf8ZNd35q2LflaB8yOGJ7MNI0ykTdbCwQoc
 tjnPJwIE3Dsa9IxvvlIyNCCiR8sb+OboeJCwRshNYyJNhvew41Z0o3rOxvaodPPQ
 iA8R1qfbuG0eUxkvhlB6soitHMmxaWpm1pg4LgbJQdM0UTFbYvtI/D9MqgcSiJnw
 ==
X-ME-Sender: <xms:15_LYGgIR_OqvsZlvajhKYfhAquxLSG8Kn-c_qyaZH6qv-Sl1RkfDw>
 <xme:15_LYHAgop6v2b_ow2KRNBNw65Xk_pIV3yL836ueT06a2UB2mYoNiwmTvNIHia1q4
 Ydn7p2a_v44wZ8_1jo>
X-ME-Received: <xmr:15_LYOHHzDJTMbdIXDyjs9V10saaRGm49538wK8BZCAxEPYoKFlqTXnueTDpzobWHfcqueJgu8xE9hz6j5PFguWSScO64ElW0gabuUuf5SysxaQ6gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteduheeffefhgfeifeehgfetffffgeetveffgeduteetuedvjeevteeljefg
 fedunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:15_LYPSsFEOmAVHbVVtltD4-bceadavEz3Fmp0n-7sZzWvxO29UHbA>
 <xmx:15_LYDygZGi8u9vywY3qWlKxDQRbexwmFYGiThc-SsdwcB-jqLHt0w>
 <xmx:15_LYN69BBu7gyPzqFduSUyuMj6xwxlmFrFeix7FBmgSBtVXBvGJtA>
 <xmx:2J_LYFuB0-QaqzgPLpY3T6TuGt8sbT9dw-DmhfxRlCz3s_cDvRhoTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 15:17:42 -0400 (EDT)
Date: Thu, 17 Jun 2021 21:17:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix missing check for PMR capability
Message-ID: <YMuf1K7wvVlDUYLF@apples.localdomain>
References: <20210607094757.29661-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8TenWjsJsNOS1E3w"
Content-Disposition: inline
In-Reply-To: <20210607094757.29661-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8TenWjsJsNOS1E3w
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  7 11:47, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Qiang Liu reported that an access on an unknown address is triggered in
>memory_region_set_enabled because a check on CAP.PMRS is missing for the
>PMRCTL register write when no PMR is configured.
>
>Cc: qemu-stable@nongnu.org
>Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
>Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/nvme/ctrl.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f99..463772602c4e 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -5583,6 +5583,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offs=
et, uint64_t data,
>                        "invalid write to PMRCAP register, ignored");
>         return;
>     case 0xe04: /* PMRCTL */
>+        if (!NVME_CAP_PMRS(n->bar.cap)) {
>+            return;
>+        }
>+
>         n->bar.pmrctl =3D data;
>         if (NVME_PMRCTL_EN(data)) {
>             memory_region_set_enabled(&n->pmr.dev->mr, true);
>--=20
>2.31.1
>

Bump :)

--8TenWjsJsNOS1E3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDLn9IACgkQTeGvMW1P
DemWOAf/flJT8VmVtP7UJLPiwoK8hXpNjmPdYWAu7U2/+1TsHfyuoIKJqd5BswSa
hZBO/RT1Hec3cmWJtoPnXbLOtNMWIISAandNs4l+HoPRYGZV9FftAbfF+j697yJI
lNvoAvVKwbV5SDmExSXXAGXIXJ7iIQ/IF+rH8mSBWR5plsuaAvBjvAl0pzGLL10R
LmI2FwdmRDxU3kgQz4py82yvyL344AsjZb0Q3vPjtFF3qlGqbx5yDsfrKrOFNpxv
ioztEYZWhRx6ugRGpqZzZi9DLIhTid7ywNaSy+tjKdGRtbYJSRc+UEncjerrdfrt
YQwsJSWJ4tw9/B0if61SMQMZE+3KFQ==
=rlL+
-----END PGP SIGNATURE-----

--8TenWjsJsNOS1E3w--

