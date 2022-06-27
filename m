Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BC55B7E3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:03:28 +0200 (CEST)
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5hqI-0003gl-V8
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o5hnl-0002Mh-Uv
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:00:50 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:34901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o5hnL-0004oc-Re
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:00:45 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 5EED4320084E;
 Mon, 27 Jun 2022 02:00:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 27 Jun 2022 02:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656309616; x=1656396016; bh=1p
 dChQV7l3azc1irc87om8wDjynXx2U0fLY8WrZvLzE=; b=bohGGFQGANSpkdbenM
 0WSgEAmoFT9u/1hYeVepg50u7kQeIFKtsLUwDYTmhlpyQ9CX19SqSjUtAd767lgo
 QoOo4Q/KIPAuogqaCU/YgA551o7fikBwdjTR9xpss9QIv3vFftT0bvAeQr2Qx7e6
 DElZ8L8Wr+7reWet+5vfz7fFggBvZQGvbOZV4CFK7V1njj9BBVhZC9qhrTMDkJuC
 VEMed6yX2VYYgHGmf/MjHT+kwYOemyFCCkCcDEj9zuURdf7tG5FAZ8xUS7cmL5XM
 9AgCQ3vTbIAUBkjaJT3muRBU3Vd9ls3u/D/ep7WgPRdFM7BIAjLaGX86S9exWH7v
 m6aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656309616; x=1656396016; bh=1pdChQV7l3azc1irc87om8wDjynX
 x2U0fLY8WrZvLzE=; b=a0NDPvsKuoW/oGRp29iFwT5l8/4QULoqGefq0eiryCpe
 iilQXryh1iJ0U3aou3JBNy3dRWonIF3IRHN8MJmdRJR7DioCUK7jDe3OQMxPwtLz
 f9HT3h+knboiPWwak3BYwpjuV+BvkPPS/6s+rOjflQs7J5Vf9L8CFPSok/wr9FcV
 Poiya6JXLdjwY2KMhZFVjbF+YxoyVSyL6CVBbGFODtQvy97mFpOS5Wfv20RNY+sz
 yH5l1WO/2ym5/dwgnqkJhlDbVtR53Hrb2t7HWLmLM9nHdkkaa4sZZIpg1jlbNJxz
 AkkrlGeJ3wcMT+1n21LRUc+cPAYx35ffL7pgLUbN+Q==
X-ME-Sender: <xms:b0e5YlB88a0Spb_IqcUW63y3-rwOZeEkc0XhtUR5rK5veQ5mUnZFxg>
 <xme:b0e5YjjqN0dRO6llnsl9g7LbA8fSa-I-i6kXGaNr9CTrxr9Vy10jDUK_A3H_Da2Lj
 mmIRQdBvyeJSsc9NqE>
X-ME-Received: <xmr:b0e5YgliPQKfYGlrfUW7_WzxgRpFJNbncA9rEaBTj2aVU0soDEvF4-DuIzjtot0XJPsBtx_xyARCG2_fVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeffuddvhfehjedugfeijeeuieelge
 evuddvlefhkefhgfettefftddvkeevieelfeenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:b0e5Yvw_Zo3rWS68MTIhYD5DuggB2ROrmt7Er5g1Mj8Yx7QesLLOjg>
 <xmx:b0e5YqRqmdKAN35KCOB12-1m8p4TJIrCJYT98HWLqEhey39Ae8KgqQ>
 <xmx:b0e5YiZcOInbVJKDjwAYeGHxGriSm9eSoBT688C9rgOgKm1f7b5nxw>
 <xmx:cEe5YleogXHPZ-T1sRyGw_U1FbcO_8Lb5Ih3ySRWDkWVdhyaxb2foA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 02:00:14 -0400 (EDT)
Date: Mon, 27 Jun 2022 08:00:13 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
Message-ID: <YrlHbYVI3rP0SMc8@apples>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pSt+WDwaioybXmRs"
Content-Disposition: inline
In-Reply-To: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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


--pSt+WDwaioybXmRs
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
>=20

Jinhao,

Thanks, applied to nvme-next!

--pSt+WDwaioybXmRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK5R2sACgkQTeGvMW1P
DeknZggApcBMrVee2iuIPQUrzjTKp/rz5U//ItVmuo1+S7Ue+yRg8zJ5Cr+XeYtf
ZA9jkSXoPmIvqs/+Cq4l1Un7ns0b4cmyN12e6XoZoJpNU5e0B937W3egtPALGP9H
QxTYeCcomlrL2zxq34v9V6fR1/D14MRY5jaf9UMQSiM8o+Bi3xc1aN/KpdU64A7Y
M13+MWZ8dp+CIUIBlkm6aqyWdh26/IxXLztOS9LWLOo98MZiqMI6GRpEuEGlDys9
5IyoijnuD9rRuM6vVPS/5U5Wbnn6hG4/381kWoIOle8rbJOOa7meJlTnwKbnw6gc
n2UW32T9m1nkKqyprObkvAlRuMCkCg==
=EajH
-----END PGP SIGNATURE-----

--pSt+WDwaioybXmRs--

