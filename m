Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95665302CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 21:37:02 +0100 (CET)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l48bd-0004Jh-2S
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 15:37:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l48Ux-0003Qm-AK; Mon, 25 Jan 2021 15:30:07 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:47403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l48Uv-0002ZD-0N; Mon, 25 Jan 2021 15:30:06 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2BD44F68;
 Mon, 25 Jan 2021 15:30:02 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 25 Jan 2021 15:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=I1rLunNvf30NgKMAifS6VuNDRd6
 uNAK2zjY/eI2TJV8=; b=sYBo3AWe+aMrnyzKjQqnGZd5G66YLihgRLd8YUxu6ed
 kKZGxxdKZrLY0ceL85rZ85jx9rSERqdAe8Q7c+s0dT2sF6GdO1DAX6w+Cr/1rOrH
 VH1eJL48W3E9edX7pzHgShHjoTGpn9jGZ+7zhk9yWMkml2/3EVlbD0GxsKrWjryx
 /JSCG7JLVvr4Pj7EQ3RGIekMmXTS4rmW8hyubqn6J/BIC21pnL3rrA+pjRDSToWv
 D74jiVfZo/ezc8qaUztb/1WLb2YCINr1ZL1PIJfcIwGcjqmJ/xFU+5WzD796w59z
 YW+rfnysetOj1jglJ5mGrb95I8R3Hk2fzfMuMiQCLWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=I1rLun
 Nvf30NgKMAifS6VuNDRd6uNAK2zjY/eI2TJV8=; b=IB1CIZg03gHX+o+lG3p+gf
 3xyaQLX+oiQBsHqxu1Cr+lVwKmZHY6acN1e9BDrFgyPu/PMwJRP8M+BEcpORNOZy
 SkToHNsprTNpuxBfxPHMqU9871HeZXTmYMtkznsJ/PTwhKMx044HlG98MGFhuHYJ
 jjAzbpT/mLryJoIC7CCSYrzks+gD51jUI8lIFC1bOQ2EpRcDKAYOY8QFgZup7Sbq
 rqg/XzbuvR7G6faKk9XiZifxMssbzNF2UeYHlwvMvTwM2SxxPuzPtOA1XABtQOGh
 2AvatbYNzK3wbbM7Wu9gKT39hCQLDuucYJkor0Z9qsTiyw+Y5vTYHK5AIm1TZkMQ
 ==
X-ME-Sender: <xms:SSoPYC0SB9VZ_9WO9kGl-_LXuAKPX7yw6ycFjJ52d5fykpKAl3Oybw>
 <xme:SSoPYPo4vUMktTQyAylFtApOvhcnOrMnReH4Q8REb6-YzWIDeluA7wnTnaoF_dIBy
 _fuRsX1dYziqkEeb3M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SSoPYHfsWQThIb1Gio7aL1CFZOUm0uHJHGcBb7hGxrBKOQcrXxol7g>
 <xmx:SSoPYGrOsYFO8Qlkgl08W7XMFSSQcbYsktpbBPdGuS8n3P_d5_l-_w>
 <xmx:SSoPYAFtdnxc3khcxSFkv1bNVdeYloAGxlRw51IzWn--LOCp10no8g>
 <xmx:SSoPYGxxlIaG1qrv0NqDrDTpw55t9dEfnXW8P-0F1tIM9x6Wx_deJw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3F37F108005F;
 Mon, 25 Jan 2021 15:30:00 -0500 (EST)
Date: Mon, 25 Jan 2021 21:29:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 0/6] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YA8qRozbWUr37dI3@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NH9EKUynFz14L5Lb"
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NH9EKUynFz14L5Lb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 24 11:54, Minwoo Im wrote:
> Hello,
>=20
> This is sixth patch series for the support of NVMe subsystem scheme with
> multi-controller and namespace sharing in a subsystem.
>=20
> This version has a fix in nvme_init_ctrl() when 'cntlid' is set to the
> Identify Controller data structure by making it by cpu_to_le16() as
> Keith reviewed.
>=20
> Here's test result with a simple 'nvme list -v' command from this model:
>=20
>   -device nvme-subsys,id=3Dsubsys0 \
>   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0 \
>   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0 \
>   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0 \
>   -device nvme-ns,id=3Dns1,drive=3Ddrv10,nsid=3D1,subsys=3Dsubsys0 \
>   -device nvme-ns,id=3Dns2,drive=3Ddrv11,nsid=3D2,bus=3Dnvme2 \
>   \
>   -device nvme,serial=3Dqux,id=3Dnvme3 \
>   -device nvme-ns,id=3Dns3,drive=3Ddrv12,nsid=3D3,bus=3Dnvme3 \
>   \
>   -device nvme-subsys,id=3Dsubsys1 \
>   -device nvme,serial=3Dquux,id=3Dnvme4,subsys=3Dsubsys1 \
>   -device nvme-ns,id=3Dns4,drive=3Ddrv13,nsid=3D1,subsys=3Dsubsys1,zoned=
=3Dtrue \
>=20
>   root@vm:~/work# nvme list -v
>   NVM Express Subsystems
>=20
>   Subsystem        Subsystem-NQN                                         =
                                           Controllers
>   ---------------- ------------------------------------------------------=
------------------------------------------ ----------------
>   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                          =
                                           nvme0, nvme1, nvme2
>   nvme-subsys3     nqn.2019-08.org.qemu:qux                              =
                                           nvme3
>   nvme-subsys4     nqn.2019-08.org.qemu:subsys1                          =
                                           nvme4
>=20
>   NVM Express Controllers
>=20
>   Device   SN                   MN                                       =
FR       TxPort Address        Subsystem    Namespaces
>   -------- -------------------- ---------------------------------------- =
-------- ------ -------------- ------------ ----------------
>   nvme0    foo                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1c0n1
>   nvme1    bar                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1c1n1
>   nvme2    baz                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1c2n1, nvme1c2n2
>   nvme3    qux                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:09.0   nvme-subsys3 nvme3n1
>   nvme4    quux                 QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:0a.0   nvme-subsys4 nvme4c4n1
>=20
>   NVM Express Namespaces
>=20
>   Device       NSID     Usage                      Format           Contr=
ollers
>   ------------ -------- -------------------------- ---------------- -----=
-----------
>   nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0=
, nvme1, nvme2
>   nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
>   nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
>   nvme4n1      1        268.44  MB / 268.44  MB    512   B +  0 B   nvme4
>=20
> Thanks,
>=20
> Since V5:
>   - Fix endianness for 'cntlid' in Identify Controller data structure.
>     (Keith)
>=20
> Since V4:
>   - Code clean-up to snprintf rather than duplicating it and copy.
>     (Keith)
>   - Documentation for 'subsys' clean-up.  (Keith)
>   - Remove 'cntlid' param from nvme_init_ctrl().  (Keith)
>   - Put error_propagate() in nvme_realize().  (Keith)
>=20
> Since RFC V3:
>   - Exclude 'deatched' scheme from this series.  This will be covered in
>     the next series by covering all the ns-related admin commands
>     including ZNS and ns-mgmt. (Niklas)
>   - Rebased on nvme-next.
>   - Remove RFC tag from this V4.
>=20
> Since RFC V2:
>   - Rebased on nvme-next branch with trivial patches from the previous
>     version(V2) applied. (Klaus)
>   - Fix enumeration type name convention with NvmeIdNs prefix. (Klaus)
>   - Put 'cntlid' to NvmeCtrl instance in nvme_init_ctrl() which was
>     missed in V2.
>   - Added 'detached' parameter to nvme-ns device to decide whether to
>     attach or not to controller(s) in the subsystem. (Klaus)
>   - Implemented Identify Active Namespace ID List aprt from Identify
>     Allocated Namespace ID List by removing fall-thru statement.
>=20
> Since RFC V1:
>   - Updated namespace sharing scheme to be based on nvme-subsys
>     hierarchy.
>=20
> Minwoo Im (6):
>   hw/block/nvme: introduce nvme-subsys device
>   hw/block/nvme: support to map controller to a subsystem
>   hw/block/nvme: add CMIC enum value for Identify Controller
>   hw/block/nvme: support for multi-controller in subsystem
>   hw/block/nvme: add NMIC enum value for Identify Namespace
>   hw/block/nvme: support for shared namespace in subsystem
>=20
>  hw/block/meson.build   |   2 +-
>  hw/block/nvme-ns.c     |  23 +++++++--
>  hw/block/nvme-ns.h     |   7 +++
>  hw/block/nvme-subsys.c | 106 +++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme-subsys.h |  32 +++++++++++++
>  hw/block/nvme.c        |  72 +++++++++++++++++++++++++---
>  hw/block/nvme.h        |   4 ++
>  include/block/nvme.h   |   8 ++++
>  8 files changed, 242 insertions(+), 12 deletions(-)
>  create mode 100644 hw/block/nvme-subsys.c
>  create mode 100644 hw/block/nvme-subsys.h
>=20

Thanks Minwoo! This really is great stuff.

Notwithstanding the nitpicks I've pointed out for [1/6] and [6/6] (no
need to v7 for those), take my

Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--NH9EKUynFz14L5Lb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPKkQACgkQTeGvMW1P
DelUOAf9FqgN176OFc/hIbp6x0mI9/mwYUgbQzO/yCEvcOujmWMGuvnfI/h08A/t
F+6kzub2COo4MmxydyxPWh3PB8uae3m6kMsyR3bR8yzLqBCwrzej0ZZLrigVXuUE
ZxDQ8OfXr1sW1ctg5n/E1pyLLnLRxV1+GXm+L0CXuBclZ8+0IFHMpKBd5K8vLmO6
pRlCaEhrkI2r5qyg1AxkE3mzdIKIu5RS+uv2ZvDGD9f0kI5MB3pGo9V5QDtANuOc
8MHtLNC021DB1juocC+KDRd0N4us5WeiktF+BD/x2XztYmaAB/EoeoTdxmCP5Nrc
ADXIf1Z9VQnRitJE/WNvItN6xnF0Cw==
=tH70
-----END PGP SIGNATURE-----

--NH9EKUynFz14L5Lb--

