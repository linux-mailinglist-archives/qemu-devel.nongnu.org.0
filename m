Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5853B674B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:08:02 +0200 (CEST)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxujp-0004L9-1Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxufY-0002g7-Nz; Mon, 28 Jun 2021 13:03:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxufW-00032I-VR; Mon, 28 Jun 2021 13:03:36 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A9E3F5C0046;
 Mon, 28 Jun 2021 13:03:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 13:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=yJTtWdXK5g0aGrjaM8cxqSWRVj6
 n6zkQkHyAl4VuTUg=; b=GkEslt//fxztdnwsKgMd5wVbxmZxNUyHYIfnH/Z537i
 s7T3eFqDBWC9aeKlNfX7dJSMtz5Ms4/sWht7zQdSqKo/DWZBXqyXfb2Y6s5lE25X
 XDvL1L0tfubKxeo6r/16sLEnPWq28wUpZOfaw4pVwhzGmVX6DxlwpcY0vdsYYw/B
 rOmN6VULo41Cb8HV776Ps9DpE2onJ42b+eNTyuUn7zWObZh9mF4nNwzKulYHfnpC
 2do44CyjceFH2gx6H3kOlJqo3IdTZ9AYPP6mmmBFeNhI0rPcF8wYAvTuypiB3hEE
 lc7hxS2fnMSk3QW5jmU4Dg+3GN34AvbYkUVbvNjmDFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yJTtWd
 XK5g0aGrjaM8cxqSWRVj6n6zkQkHyAl4VuTUg=; b=p60fgMBeMgk7YPpORFItPK
 NjdBnTWnwDiJP3VTWEhrGh7AXMHQ2SVE6C8YWJwIzBkJ3Igu0Ri43OsWdLhDkO1K
 VIHuz257kR52XWMlh8Cs+lydyiECzIv3zRSeAB4hes/B8XWv31uBxyPB3qxLA6Pu
 TY+10MBFlz9AjhVypBBxCMJnyScPUJWEh0XdHoZbsP5hpklSdzYeShD4GtnmulLr
 uQZm8V5Rn67cwfuodefEWjh/N/d/eM+cMr5OeJA6ejBg78O2jDO+Kj5wEzB6nySx
 bty2l7Cb90X4npYVkBbYGFghAklP+FY+1mZSnwe8zA6jWPY/dkUQK1gSfTBW/5mA
 ==
X-ME-Sender: <xms:5QDaYENxruUuWajOLZ24LqTFkWVyfN3f0gJEM5mytvOXcSwkVt709g>
 <xme:5QDaYK-HwlBSQmsXNidffHxYTiCVjoAdmG8pTFfjW5k2_6FLvxy2v8vGQtQW1nW1f
 oRN9TgETItxHYDW_kg>
X-ME-Received: <xmr:5QDaYLRXb_dho3xQeg9NYobJ7uCJxre95jWmp6gWMZD0TB5qyPIAlv7B2SS1lZ99dF5ufMvWniJ25rlnKDU1sfpVIiO8P0DQNIZaCQdbCzlmgfaWVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteduheeffefhgfeifeehgfetffffgeetveffgeduteetuedvjeevteeljefg
 fedunecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5QDaYMt7B5oARcJ3MCMuJtojDp3_aBzH4uMB7jmlXL1n5uYpdWvPqg>
 <xmx:5QDaYMfbz7NfEypCrlZRUALSqWPxue4jIqV3HJK3eaf3Q_C5kWVxQw>
 <xmx:5QDaYA36T_04DMO07R_b_oWYZpkbm4IM7Kgv4Iu_XsVNUQWRpH9P8Q>
 <xmx:5QDaYL549DqBo9VMVNtYgxX2L0WE0lRu4LNwv6EVeCZoriRVJxEv1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:03:31 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:03:29 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix missing check for PMR capability
Message-ID: <YNoA4ddaTiWlt83e@apples.localdomain>
References: <20210607094757.29661-1-its@irrelevant.dk>
 <YMuf1K7wvVlDUYLF@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZbSwbYTnt1ApPFNW"
Content-Disposition: inline
In-Reply-To: <YMuf1K7wvVlDUYLF@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 qemu-stable@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZbSwbYTnt1ApPFNW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 17 21:17, Klaus Jensen wrote:
>On Jun  7 11:47, Klaus Jensen wrote:
>>From: Klaus Jensen <k.jensen@samsung.com>
>>
>>Qiang Liu reported that an access on an unknown address is triggered in
>>memory_region_set_enabled because a check on CAP.PMRS is missing for the
>>PMRCTL register write when no PMR is configured.
>>
>>Cc: qemu-stable@nongnu.org
>>Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
>>Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>---
>>hw/nvme/ctrl.c | 4 ++++
>>1 file changed, 4 insertions(+)
>>
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 0bcaf7192f99..463772602c4e 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -5583,6 +5583,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr off=
set, uint64_t data,
>>                       "invalid write to PMRCAP register, ignored");
>>        return;
>>    case 0xe04: /* PMRCTL */
>>+        if (!NVME_CAP_PMRS(n->bar.cap)) {
>>+            return;
>>+        }
>>+
>>        n->bar.pmrctl =3D data;
>>        if (NVME_PMRCTL_EN(data)) {
>>            memory_region_set_enabled(&n->pmr.dev->mr, true);
>>--=20
>>2.31.1
>>
>
>Bump :)

Bump^2 :)

--ZbSwbYTnt1ApPFNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAOAACgkQTeGvMW1P
Deni7gf/bmO4ieC0rTGRogl2EMi3uoLHgDs+GSYeTB46J4pPdLe+vnfV/vsTeuSC
10lkkAnOCFeIb8HbX3szoL5MIMDtNTE5kz2B8EaGRsBDHOou9KqU4YikjomL3BaJ
uZdUb4b4emYhURAf4OlNBds2kTQDWN4q+QuZyJX4EkUjhbN0N5i8Nyw/kKuZVyn4
JFHu81FsKVncWsWYCY8nvK2uez/sNfe2WzrDdCVHACi+Z+2RIKEGOrhik2PqE8dL
w5g9WMQP6I37r/DVrwXCZZPtqd3M5g3oDTI6NmzyQSY0IyZNtjGfV4e9rwEFn614
bTC/N1c71XGEEqBefql2mzQnEyz1QA==
=WHSx
-----END PGP SIGNATURE-----

--ZbSwbYTnt1ApPFNW--

