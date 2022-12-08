Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A448646A23
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BxE-0007Nr-2F; Thu, 08 Dec 2022 03:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p3Bx6-0007Nb-Ur
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:08:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p3Bx3-00016E-IA
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:08:20 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EE4F5C00C3;
 Thu,  8 Dec 2022 03:08:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Dec 2022 03:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1670486895; x=1670573295; bh=Wr
 i+IC9xKumNGHs0/hdokSJVJS0jlxA7LTkNti33x7s=; b=orbmZ83SOnaiPRuY5t
 3YlXFRoTwAemGeyhGa0u+zXBC6hTd2EfhExcAhXxaxqKJyiFDxbySt2hORgpjvDe
 QdNZTaTlqaa/hCeOrCCpBEh38hjUJBTnQ/nYcTZWNVXTzk+zl2tIMe56EkTbxCQc
 wHxn0SF65dzg4frIwm0Ck6mCr7WBzhQ6SJmmB1l80y5LPpK2wChM6pNg/OKL3EXk
 ElFyouCFmQGlT6QRXB0a7GGRA9Kag5z4KrT4Nj5iRMX2tlwFte3BswFu96pqZGvw
 IYmULrIgFJ1x2MswSrPr3fvLhuX5qWvtb84wEUq0gduf3guevhasA5xBKKzSovvm
 8QTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670486895; x=1670573295; bh=Wri+IC9xKumNGHs0/hdokSJVJS0j
 lxA7LTkNti33x7s=; b=ZB5o38BWFvMi8oGJdTwX0lzq+KyPXFfvvBcJ/pArp5sx
 bNnEsj8/O+7Po5E1WJn/pscctdQd973C9uXGELHG5/7YTGVQgAsmcE9B02pcDKGc
 zu42v3Nf0GLmpcYkIzo9t5sB0TWbtxpmhJkjxCni/UOT1K+uI9f2L8ZoMMSqgzC0
 eB4PgZ8xcccEppqJqASjv0tYYB/UH/qsAUN3+jC2JNpNkGizHUbopPyaYNXv4WDM
 9AYbpDlQRVBBeuhzFZJY7rXMmgXkOlQ4wamzn5jF67gqi2J7fjXs8su6qb592Ysp
 FkVSy8vA6+iBmCRoplroI0xyEaqfXMZm6K7rILYb2g==
X-ME-Sender: <xms:bpuRYxI3fMxdI-9rXFHyLWuK0BjEZ-bIW9apuSxjtuQEkpyNNvuGyQ>
 <xme:bpuRY9K661Jmn8yn9ZgHsx5-Xbb2eMVbJsSC0kTKRfircCL7b-09ZpeXEnxn8FlLd
 ky82v3QJd2D28NCcHk>
X-ME-Received: <xmr:bpuRY5uPL2WN7CjngY5CLgaeduPa0YGhYlzq7wPWGhqYCCh902wTTcPBquMzV6bV_E6COJ7U6_INQW6npbRw_DuaZhbqSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bpuRYybTDOKGuaKsBDcXhjTVUO3mGyHZo2t6HFUjBG3NZGBwx7wEPQ>
 <xmx:bpuRY4bPdZzidHK1dUYilp83YWGSdqvv9WzMkHYRykgbQrqdeHQXDA>
 <xmx:bpuRY2BcCntn_G-u6p_R69kDMFDHnVXvuQ6FGM9Sp5DfKGpcFQHreA>
 <xmx:b5uRYwHuPStvyrfyxWSYnviyGRJsIAI4sIK7Yur--CYrMbuNI8F9QQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:08:13 -0500 (EST)
Date: Thu, 8 Dec 2022 09:08:12 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Y5GbbF68N5ZiYNdv@cormorant.local>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QoDliDj+0r9hY1MQ"
Content-Disposition: inline
In-Reply-To: <Y5GPRiO0g2mgA3FS@cormorant.local>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--QoDliDj+0r9hY1MQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  8 08:16, Klaus Jensen wrote:
> On Dec  7 09:49, Guenter Roeck wrote:
> > Hi,
> >=20
> > On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
> > > Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
> > > and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7=
=2E13
> > > in NVMe Spec 1.3). For queues created before the Doorbell Buffer Conf=
ig
> > > command, the nvme_dbbuf_config function tries to associate each exist=
ing
> > > SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
> > > Queues created after the Doorbell Buffer Config command will have the
> > > doorbell buffers associated with them when they are initialized.
> > >=20
> > > In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
> > > Doorbell buffer changes instead of wait for doorbell register changes.
> > > This reduces the number of MMIOs.
> > >=20
> > > In nvme_process_db(), update the shadow doorbell buffer value with
> > > the doorbell register value if it is the admin queue. This is a hack
> > > since hosts like Linux NVMe driver and SPDK do not use shadow
> > > doorbell buffer for the admin queue. Copying the doorbell register
> > > value to the shadow doorbell buffer allows us to support these hosts
> > > as well as spec-compliant hosts that use shadow doorbell buffer for
> > > the admin queue.
> > >=20
> > > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> >=20
> > I noticed that I can no longer boot Linux kernels from nvme on riscv64
> > systems. The problem is seen with qemu v7.1 and qemu v7.2-rc4.
> > The log shows:
> >=20
> > [   35.904128] nvme nvme0: I/O 642 (I/O Cmd) QID 1 timeout, aborting
> > [   35.905000] EXT4-fs (nvme0n1): mounting ext2 file system using the e=
xt4 subsystem
> > [   66.623863] nvme nvme0: I/O 643 (I/O Cmd) QID 1 timeout, aborting
> > [   97.343989] nvme nvme0: Abort status: 0x0
> > [   97.344355] nvme nvme0: Abort status: 0x0
> > [   97.344647] nvme nvme0: I/O 7 QID 0 timeout, reset controller
> > [   97.350568] nvme nvme0: I/O 644 (I/O Cmd) QID 1 timeout, aborting
> >=20
> > This is with the mainline Linux kernel (v6.1-rc8).
> >=20
> > Bisect points to this patch. Reverting this patch and a number of assoc=
iated
> > patches (to fix conflicts) fixes the problem.
> >=20
> > 06143d8771 Revert "hw/nvme: Implement shadow doorbell buffer support"
> > acb4443e3a Revert "hw/nvme: Use ioeventfd to handle doorbell updates"
> > d5fd309feb Revert "hw/nvme: do not enable ioeventfd by default"
> > 1ca1e6c47c Revert "hw/nvme: unregister the event notifier handler on th=
e main loop"
> > 2d26abd51e Revert "hw/nvme: skip queue processing if notifier is cleare=
d"
> > 99d411b5a5 Revert "hw/nvme: reenable cqe batching"
> > 2293d3ca6c Revert "hw/nvme: Add trace events for shadow doorbell buffer"
> >=20
> > Qemu command line:
> >=20
> > qemu-system-riscv64 -M virt -m 512M \
> >      -kernel arch/riscv/boot/Image -snapshot \
> >      -device nvme,serial=3Dfoo,drive=3Dd0 \
> >      -drive file=3Drootfs.ext2,if=3Dnone,format=3Draw,id=3Dd0 \
> >      -bios default \
> >      -append "root=3D/dev/nvme0n1 console=3DttyS0,115200 earlycon=3Duar=
t8250,mmio,0x10000000,115200" \
> >      -nographic -monitor none
> >=20
> > Guenter
>=20
> Hi Guenter,
>=20
> Thanks for the bisect.
>=20
> The shadow doorbell is also an obvious candidate for this regression. I
> wonder if this could be a kernel bug, since we are not observing this on
> other architectures. The memory barriers required are super finicky, but
> in QEMU all the operations are associated with full memory barriers. The
> barriers are more fine grained in the kernel though.
>=20
> I will dig into this together with Keith.

A cq head doorbell mmio is skipped... And it is not the fault of the
kernel. The kernel is in it's good right to skip the mmio since the cq
eventidx is not properly updated.

Adding that and it boots properly on riscv. But I'm perplexed as to why
this didnt show up on our regularly tested platforms.

Gonna try to get this in for 7.2!

--QoDliDj+0r9hY1MQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmORm2sACgkQTeGvMW1P
Dek9FQf+KRaW4kzHxQpXY0qZ+O8FsKwcQJYXF66CKUwrBKg5akTHFq9TaGi2cbl0
InCvU9llsnvVfHWJDH4tnGWTE3qTNBVEwHl4P3UsZ90ObxYlb6NKp+n0Fpatxq0L
hE8jvuRPqkUKMfCSIRv3/3ieuJ9fd2XFKnZMnQzZajihLLfRKoeZZYfdu1aZwlJ0
dvwAxu/tF+Qi8IERX1ecB+7jNZ/plLi4tohldNh7tYW9MQq16tNQ4WyiWZcEkKeZ
JGFvmDmy6lszgelhQmmqglje/pj8gXTaZEovWRQbCdoKfoO06z8kniZV4ZgKjuaw
ZiLpaIcmsbhu4q59kFTlAjxTZ1MCDA==
=qRFA
-----END PGP SIGNATURE-----

--QoDliDj+0r9hY1MQ--

