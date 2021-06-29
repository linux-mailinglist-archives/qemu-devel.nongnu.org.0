Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9185C3B6DEC
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:24:25 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly6ES-0002hS-Bb
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ly69o-0000uu-VJ; Tue, 29 Jun 2021 01:19:37 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ly69m-0005TG-Lh; Tue, 29 Jun 2021 01:19:36 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 701AD5C02E4;
 Tue, 29 Jun 2021 01:19:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 29 Jun 2021 01:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=G1I2gCyW1TZau40qSU8r7bokyB0
 Gl8AHG6GtZBJx2Hk=; b=YARqudrI4rPeaNqb4Q7toc1vHXBIDXxQC+FVC+61c0b
 fWdb+pF2QMhPV7pCtmy9MovXKZjjqIlHZsrB6TvUSH7JmUAmE7nb9nMpXljgWuBR
 vr9LYIBZ8Jh7sHxHzrxtxzZHM+TKIj6XE2/Uuwh1J05hcmpukrjm+FfoK0ysDH10
 o8I7Sd4622cwghVfCcsTMSYqzu/skR9iFpZTLHbKnG/n2a/QwbrphA8cxcdTSGVT
 Fo6kMl2cuW3WvGxKcZuLk8/EIhU7aSSA0G40qCbL1Lin3Pr2WYUvpFLWBAbAtsX8
 djGQVhmltZRytyV4bLIQttiSen8UVOSo8qhn2r9+0uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G1I2gC
 yW1TZau40qSU8r7bokyB0Gl8AHG6GtZBJx2Hk=; b=qmKrm4ad7l0SF3sqBsZx69
 sIby5B70Z3Yt9P8y1CI1rBWPbr4kJuaoxag1b7ycRTB6TaYJlfWEDr/6vshIDxUv
 h6JmklbN2veMW/1ItOFACcrjjO6hlHthfR4wApNhc3AaQYFm8AvatBCA9Jyonvio
 6usWnQkeHCXCGa/wuMiFAMO5PEWnsZEgndr3A9dwG9q1H+/7vuTl+ehmpyAvn6mT
 raIAcbZJzmKVMTRCavZ/xs4PIHuMG2dr4TnzAUmndwb6nw4xH/xn72VBqe6NDyrg
 WFrUp7C1caJ3eoRX2kmqDTsZYnyfgPDSQemy73fQ+N9QmPV43O14/1ViveqttBhA
 ==
X-ME-Sender: <xms:Y63aYKV06wp1m7Dua9-cKl7KznNkg9H5GapzNymGLW6q2yZrN1LwOg>
 <xme:Y63aYGkEHxegzOT5OnmVlH18kMiEB5z6NCf4dsjBNrKAtcYRNi_JVFBWh4HncgCW-
 NtPmIQqA8gW30E1YFM>
X-ME-Received: <xmr:Y63aYOaOV8zcnl5X6r5E7uj0WXzdOlvQqxJHWn30kJOebauOZAeLFFCeeHhdXY8xn0IVcFtPKspVC9mIWPs3q5RauQ1qqonUBguPwtKeGKOiIfOTmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehhedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetudehfeefhffgieefhefgteffffegteevffegudetteeuvdejveetleejgfef
 udenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Y63aYBXolSBTahmtnBpdYdRz9oSNa4oaRoN9AjH8KBclIw_mCLP7Og>
 <xmx:Y63aYElz9vPYat2oTSJaTDpDh5MYSbIVy5sZ61Gj-8Lovot7b4dpIw>
 <xmx:Y63aYGdItWF0WCuUB5FqXEjavYmasa_um9vWPkw_tYupj-SeBSTc-Q>
 <xmx:ZK3aYFCpL6vpdlZvEUpmcKLaU_1jynjw86a-m-dEZxIesWw3oLwukw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 01:19:30 -0400 (EDT)
Date: Tue, 29 Jun 2021 07:19:28 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix missing check for PMR capability
Message-ID: <YNqtYA5FZOBpFj5V@apples.localdomain>
References: <20210607094757.29661-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4LWarcxG3tbXVfuc"
Content-Disposition: inline
In-Reply-To: <20210607094757.29661-1-its@irrelevant.dk>
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


--4LWarcxG3tbXVfuc
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

Applied to nvme-next!

--4LWarcxG3tbXVfuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDarVsACgkQTeGvMW1P
DelMHAf+NbtV4VpVNdordPcMlYmx68vwmpE1K1UtwAQ9covOFn/XKwZ+ZhkTij9x
pY0IjhLXbGel1Y9jwQ/+8kItuVXojPcg+nlIqdfg9j79aOG/lVwUhedB/RAj5EB6
SoAcQ3E3cegrsjydDnP6AuOcVDBqRaVm0HfsDvDHem/v5AKZ0dYSbYB9kl0F4ydE
wfhCA03s5pxj90krYESDHEpf4TVcgDQ5e8+Y2eN7ggjrDd3O1ReEbW62hHBk/CQn
ATnMxYMz5mCepkez/pDhejcDaL3hwBNoKLRrniNuGEgPpcu1Qo1xMUfGaLDJSWvL
1WVtQ/JgY5LDuN4L0TsLklrOdNmOjg==
=ZSnj
-----END PGP SIGNATURE-----

--4LWarcxG3tbXVfuc--

