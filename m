Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD954F712
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:58:07 +0200 (CEST)
Received: from localhost ([::1]:42592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Ac2-00029V-En
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o2AYJ-0000S5-Qz
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:54:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o2AYH-00015D-Dn
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:54:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B379E5C013B;
 Fri, 17 Jun 2022 07:54:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 17 Jun 2022 07:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655466850; x=1655553250; bh=cx
 m4C1tFPSnBNtewu7E/3/f7JCj0qYtvdXvcO+AFc/c=; b=jg3/20z3vJP4jP52x9
 7miH77R9a49jH3X+p+0Zd0RuqyrbnhDzGwy9VQ+36vLLsjqkaX1qRWv8AI1cUnW9
 uDJtJQqfR3U/cWsTUSjBnDfqlu/GHrCZkjsL8jmvvTd+qlMpchlGTPQP89A7E3+w
 KE6mzxcGmHBJCPbRyVw3PK8ub96X6P68mZtbo8tE5zGhyVOad1rjMhya0BoQ06mT
 KR5gVJXiUp11+OZVLHitW3LWW4yZOhPo72ee4kh84IpCXPRWfPbrFDWsRdp9BvFe
 9pO8MfH3RBFgbGn7nydOO/OWEwuMc5g2uEUL/j6LlgbSL+2Wkdin9ODuabYx0kVJ
 4yjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655466850; x=1655553250; bh=cxm4C1tFPSnBNtewu7E/3/f7JCj0
 qYtvdXvcO+AFc/c=; b=E/DNNwN+8fMWW9i8LF6i5p7EJFZa0Jx7j3QUFbjyQNwy
 WykJhe68hK3NOdofgM+2rnv6IgCmTl0hpClEKmkT13AnFzmGR64LbqrcLN+5s9qc
 dXu5QI+Ylp0jFzLbtm8ODgQrLNsUaolHvflSbYuENESqd7YAU3m8PS5Nydr40EP/
 923XNPs0hXcLW994D2vvPmEtyoc4TfavCeN96ziV/qAwYcMhLlqCLhbirW+kmocs
 ehsY7JYH/K6Elp1HArz4JFrShwxicC4iug5NSJV6gexeEYTsKV41O7LxqHcaM27W
 MlG7JTWKuGTlrt04kDsTyAHz+Ufqm6FkMU7DJa2hDw==
X-ME-Sender: <xms:YWusYozdM79WlOMyJ_ttgEHvgTukv7axNB_WLShNh9lB6vp7AHJxiw>
 <xme:YWusYsQ4J-8OALdK39bpyOWJa_OuGAH8PNyfR4CguFiIWgFjyvFpT5VWjD_4bMc5C
 DXPdPRoSHREioq7bqc>
X-ME-Received: <xmr:YWusYqWbw1RPf9QXLSA6G7-97IMJHsHL7mD4SIQ3I6d0LBeczykhhmxI4FGiIkXEPixEJ19D6JZqAgMByg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvhedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeffuddvhfehjedugfeijeeuieelge
 evuddvlefhkefhgfettefftddvkeevieelfeenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:YWusYmjvHqydv7lmKkKPJYLjsZgzP0m1w2F58_CWUYRmxAxWmesIhw>
 <xmx:YWusYqAjZzSnumROO0B0qV7xMXmpF5FQkDHZjThw1sKRz9GwIrxfSQ>
 <xmx:YWusYnKHUhJ1MvnT9tRyCHZ9sY-Z8IJlin2WE3Pt2X82svI1RPjOvQ>
 <xmx:YmusYtMEVxOLMMjQ-ncIxmDzpsThtiYVUxKfCnHudWoXioRvyskkbA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 07:54:08 -0400 (EDT)
Date: Fri, 17 Jun 2022 13:54:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
Message-ID: <YqxrXgLeMdVKFQ4P@apples>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C/I5kYNI38KLMxlr"
Content-Disposition: inline
In-Reply-To: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--C/I5kYNI38KLMxlr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 16 20:34, Jinhao Fan wrote:
> This patch adds shadow doorbell buffer support in NVMe 1.3 to QEMU
> NVMe. The Doorbell Buffer Config admin command is implemented for the
> guest to enable shadow doobell buffer. When this feature is enabled, each
> SQ/CQ is associated with two buffers, i.e., Shadow Doorbell buffer and
> EventIdx buffer. According to the Spec, each queue's doorbell register
> is only updated when the Shadow Doorbell buffer value changes from being
> less than or equal to the value of the corresponding EventIdx buffer
> entry to being greater than that value. Therefore, the number of MMIO's
> on the doorbell registers is greatly reduced.
>=20
> This patch is adapted from Huaicheng Li's patch[1] in 2018.
>=20
> [1] https://patchwork.kernel.org/project/qemu-devel/patch/20180305194906.=
GA3630@gmail.com/
>=20
> IOPS comparison with FIO:
>=20
> iodepth    1      2      4      8
>   QEMU   25.1k  25.9k  24.5k  24.0k
>  +dbbuf  29.1k  60.1k  99.8k  82.5k
>=20
> MMIO's per IO measured by perf-kvm:
>=20
> iodepth    1      2      4      8
>   QEMU   2.01   1.99   1.99   1.99
>  +dbbuf  1.00   0.52   0.27   0.46
>=20
> The tests are done on Ubuntu 22.04 with 5.15.0-33 kernel with Intel(R)=20
> Xeon(R) Gold 6248R CPU @ 3.00GHz.
>=20
> QEMU set up:
>=20
> bin/x86_64-softmmu/qemu-system-x86_64 \
>     -name "nvme-test" \
>     -machine accel=3Dkvm \
>     -cpu host \
>     -smp 4 \
>     -m 8G \
>     -daemonize \
>     -device virtio-scsi-pci,id=3Dscsi0 \
>     -device scsi-hd,drive=3Dhd0 \
>     -drive file=3D$OSIMGF,if=3Dnone,aio=3Dnative,cache=3Dnone,format=3Dqc=
ow2,id=3Dhd0,snapshot=3Don \
>     -drive "id=3Dnvm,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,fo=
rmat=3Draw" \
>     -device nvme,serial=3Ddeadbeef,drive=3Dnvm \
>     -net user,hostfwd=3Dtcp::8080-:22 \
>     -net nic,model=3Dvirtio
>=20
> FIO configuration:
>=20
> [global]
> ioengine=3Dlibaio
> filename=3D/dev/nvme0n1
> thread=3D1
> group_reporting=3D1
> direct=3D1
> verify=3D0
> time_based=3D1
> ramp_time=3D0
> runtime=3D30
> ;size=3D1G
> ;iodepth=3D1
> rw=3Drandread
> bs=3D4k
>=20
> [test]
> numjobs=3D1
>=20
> Changes since v2:
>   - Do not ignore admin queue updates in nvme_process_db and nvme_post_cq=
es
>   - Calculate db_addr and ei_addr in hard-coded way
>=20
> Changes since v1:
>   - Add compatibility with hosts that do not use admin queue shadow doorb=
ell
>=20
> Jinhao Fan (2):
>   hw/nvme: Implement shadow doorbell buffer support
>   hw/nvme: Add trace events for shadow doorbell buffer
>=20
>  hw/nvme/ctrl.c       | 118 ++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h       |   8 +++
>  hw/nvme/trace-events |   5 ++
>  include/block/nvme.h |   2 +
>  4 files changed, 132 insertions(+), 1 deletion(-)
>=20
> --=20
> 2.25.1
>=20

LGTM,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--C/I5kYNI38KLMxlr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKsa10ACgkQTeGvMW1P
DenKiAgAs47nXb32r5aPIIfpDycwGx0tI96KO+A0HjUj/4sIIxFkjGmf6otEDEDV
eE3J8ozCw1HZEoSMU2p4jifOGTuga5guBUJcIa77AbgyqK6HOkXmymIaAbfHBLlZ
MuHt1bIy01YGlwNtINiIbgZPiJdpPDspvXcfO0ilbXil7GNaWgzzeVq/F8iiD5qf
Iw9Yd6wRp9bfHxdseMdUz0myyu3euhOwqtOiY1NqKpT420ESbV3vivzInF67sGBL
Yu1Vc9MvmcPt3UqMmSx/9/8DbRsfXZfS2vRDvgMpsvm/LMk9Nnk+IEivDHIJrByF
jflPLXIuGdwwj7FfVeX15hBK5QIi0w==
=Ij1e
-----END PGP SIGNATURE-----

--C/I5kYNI38KLMxlr--

