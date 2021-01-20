Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70D2FDCA1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:35:05 +0100 (CET)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2M48-00027C-Hg
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l2LzP-00018t-H6; Wed, 20 Jan 2021 17:30:11 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l2LzM-0004rO-Mn; Wed, 20 Jan 2021 17:30:11 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 37E7F5C0159;
 Wed, 20 Jan 2021 17:30:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 17:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=XiQyvhVzDCW1eQ9apibVeE1CDLd
 ZEacxcJ2mbAXvcR4=; b=JFCyKYuXAYcrfdSrnFCXghhyALFUsLhn/y2UbHOvAud
 bQypMe0SJ1qN9eE0BXOejj2A4lkEnSl/hyKXoHvscpB5c45zSKzu59ckFAzbUHSy
 h1qPapo8zVMXBMWJvrxMP9YBgNbkjrW5oc1fSS84XGRx8MCqdXmUzhncvrBA7WTO
 qK37M7qWbOX8JkRurS89744g7ibN8TlU/uMwDBvnP+waQJRTgtcVw+5JIZQQc20U
 o8t+URBWEGR+rnhpPicshLB9ZH5KsqN4bsezIxroMuBLeBTbY4tyZb/ThfHJ66uX
 aIt7/jRmuNG/VwsG1Vh9be8oB1geO9Nt86xLiyOC+Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XiQyvh
 VzDCW1eQ9apibVeE1CDLdZEacxcJ2mbAXvcR4=; b=r+nf1UWko0qm0ehHxECBHN
 H8U4FAwSRlq9xHLQPu7qqeiZBGiwNfgFV22aS7sVpOo0TfdgE3euFHoyzDHodt/M
 ciRsxKKsIsbGGzxeEd/8BR2zoWZLgX8WYJQ/AZH7eK6NyCCltLiyviG95YEkHGKu
 xU27LexlKZriDsJBQc1dieR0KanS8Auy9zloi0N1q6FJSiXEMIYQ61wB4T1UELps
 2oKGBVtU/C73GmdsaNurwK9Lm1tZTJK2yPM8kzGuB1lKVN7tPB02t0Gxs0OjwvIi
 obiJXLxT82KLuQbhOQbU24ywOVx+jdISVESHKRrvXGF4TKfG8kRZ9VT/DorvNwqw
 ==
X-ME-Sender: <xms:7q4IYHJt1GmXiO0uzNfGjggrzgeJwf7s53WahVpOEBL-WYk-tXNMEA>
 <xme:7q4IYLGGVBOhfOVMjZfX61xMBdGwzsIX5dtKAwePdfm3QpIMJtMHZXOZ5moTc48xb
 j4jkZdjtfeis3RqhjE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvgdduieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:7q4IYMlUUXbzisy_qBEdSPPPctTnTVGzV2HNUTpDHlnE91aB6mLzpQ>
 <xmx:7q4IYIKcxKu8cZNk5iljHxbyhybSx8OsqHsRNyt73DRW1To-E1weQQ>
 <xmx:7q4IYNZ4KtqdMLeU8OckKgKcA9h_sZkYmgh6uaaY2m8qGLmilZ0G_Q>
 <xmx:764IYBcwAN5QA-bDApfKK2q2XXyMY9yiQ_IWOROFZi0u37mcGj4UfA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 58247240064;
 Wed, 20 Jan 2021 17:30:03 -0500 (EST)
Date: Wed, 20 Jan 2021 23:29:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/12] hw/block/nvme: misc cmb/pmr patches and bump to
 v1.4
Message-ID: <YAiu52o5y8DYO3MH@apples.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kghWVF+wenh35Qei"
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kghWVF+wenh35Qei
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 11:14, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This is a resend of "hw/block/nvme: allow cmb and pmr to coexist" with
> some more PMR work added (PMR RDS/WDS support).
>=20
> This includes a resurrection of Andrzej's series[1] from back July.
>=20
> Andrzej's main patch basically moved the CMB from BAR 2 into an offset
> in BAR 4 (located after the MSI-X table and PBA). Having an offset on
> the CMB causes a bunch of calculations related to address mapping to
> change.
>=20
> So, since I couldn't get the patch to apply cleanly I took a stab at
> implementing the suggestion I originally came up with: simply move the
> MSI-X table and PBA from BAR 4 into BAR 0 (up-aligned to a 4 KiB
> boundary after the main NVMe controller registers). This way we can keep
> the CMB at offset zero in its own BAR and free up BAR 4 for use by PMR.
> This makes the patch simpler and does not impact any of the existing
> address mapping code.
>=20
>   [1]: https://lore.kernel.org/qemu-devel/20200729220107.37758-1-andrzej.=
jakowski@linux.intel.com/
>=20
> Changes for v3
> ~~~~~~~~~~~~~~
>=20
>   - Fix a masking bug in "hw/block/nvme: fix 64 bit register hi/lo split
>     writes" (Minwoo)
>   - Restore a deleted comment in "hw/block/nvme: remove redundant
>     zeroing of PMR registers" (Minwoo)
>   - Restore the 'legacy-cmb' parameter from v1 to allow the device to
>     exhibit the v1.3 CMB behavior.
>=20
> Changes for v2
> ~~~~~~~~~~~~~~
>=20
>   - Rebased on nvme-next
>   - Added a fix for 64 bit register hi/lo split writes
>   - Added the patches from "hw/block/nvme: cmb enhancements and bump to
>     v1.4" to the back of this.
>   - As suggested by Keith, I removed "legacy CMB" support - the patch
>     now exclusively bumps the support to the "v1.4 variant", so the
>     linux kernel nvme gang have to get their game on ;)
>=20
> Andrzej Jakowski (1):
>   hw/block/nvme: indicate CMB support through controller capabilities
>     register
>=20
> Klaus Jensen (9):
>   hw/block/nvme: add size to mmio read/write trace events
>   hw/block/nvme: fix 64 bit register hi/lo split writes
>   hw/block/nvme: move msix table and pba to BAR 0
>   hw/block/nvme: allow cmb and pmr to coexist
>   hw/block/nvme: rename PMR/CMB shift/mask fields
>   hw/block/nvme: remove redundant zeroing of PMR registers
>   hw/block/nvme: disable PMR at boot up
>   hw/block/nvme: bump to v1.4
>   hw/block/nvme: lift cmb restrictions
>=20
> Naveen Nagar (1):
>   hw/block/nvme: add PMR RDS/WDS support
>=20
> Padmakar Kalghatgi (1):
>   hw/block/nvme: move cmb logic to v1.4
>=20
>  hw/block/nvme.h       |  17 +-
>  include/block/nvme.h  | 125 +++++++++++++--
>  hw/block/nvme.c       | 350 +++++++++++++++++++++++++++---------------
>  hw/block/trace-events |   6 +-
>  4 files changed, 351 insertions(+), 147 deletions(-)
>=20

Thanks guys, your reviews are highly appreciated! :)

Applied to nvme-next.

--kghWVF+wenh35Qei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAIrt8ACgkQTeGvMW1P
DemI9Af+Oyg9U9ic2DtXDA9nKV6Y2dYHnjwa53hi0YsGt9oYkBkc5evpYGcV3fWU
XJr6BxrLRxKA4P4TZbza0EC63IQPkPZ/q0vJGoYAL7PSWkT0vvj7xOqZPiXCqcGc
BNqdd7YyxVIj9fbqWZZY1XMNLJsq3FnrUJ1vFF/0jq4sN2d2z98ByvbQb/CfJYA7
bD6mMiywcHbLqdrUxCmwYZ8LoYtqyEp2aAUFoPIS2WZAoAzythTJJ4cNx74WtqSH
ESbbuiBxiMjMphZQrZiMLW/ocDrh/7Q3PlZ0FAylXk9Xear7i4SQy3VVjTwpSxyP
z6rlCOeFPlEmz4C9rpg16QXvzODvvw==
=SQYt
-----END PGP SIGNATURE-----

--kghWVF+wenh35Qei--

