Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E1F6691EB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:55:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFpm-0006Zh-EX; Fri, 13 Jan 2023 03:54:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGFpS-0006RU-Kd; Fri, 13 Jan 2023 03:54:28 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pGFpO-00077i-Vn; Fri, 13 Jan 2023 03:54:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E8A4A5C003F;
 Fri, 13 Jan 2023 03:54:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 13 Jan 2023 03:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1673600060; x=1673686460; bh=E6
 PuJ8chHaUubmtA83EYSBQx8C+N/N8RHiNHhgUeAB0=; b=WzrxC7BOG8rLWAlYki
 +ThPpEzb5UljGbRkhoMYuBdlWp8K1nODY7xSDNUq/zcA38y7/8gg5aShuvEU+4X0
 I9VmmeBoG6EpFFesRHa4+RLJY+uIXlrpCZbuh0Jz9CNsGWuvgWv8po7qVz/MG9Qc
 BFbyiCyUr7xt+BQUiDY7HpeEeOlyJuyNSq+Z5Sdk4G+wmScEdk+u8xwA64VHnOo6
 pi+2o40koDdhuPCwfZTnHe0bj3/hJiABqzwG+k+OQBfRxb/tuG73oJI+OFK26ROA
 wnxB4cxfWEmj1z+/pmXUGNtrfr0j0g5fPuCdzVDgDLVuReqnmCgibeKC9DURyDDR
 v6PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673600060; x=1673686460; bh=E6PuJ8chHaUubmtA83EYSBQx8C+N
 /N8RHiNHhgUeAB0=; b=emgOfIimPn1zQN6/rXBoAibhpGMBp0AupvMQRH8K+ccJ
 agxFHNCqIATejRH9P6UvUKFuToc7WTklrloikmAyZLwJL81h46rxgDjB+WDTdRjI
 1cS3ncloYYEWhGQP0Xshbo/uji4cQNlO/EajmNrG8MAAVgy+AtgdYnOt8WUeCnZJ
 pPVbDdUdjH9+Gwrdjf17gXU18Ahqjd5RmqOsjV3udgrGrXWq/hY4ydHzBlkkTwky
 iYDT1nGsRr7dCtT4cADCJ7Psp4+hui8WJeuOTgbkhofUVEi+xg38Yvh9EJYDHedI
 DqRou5ZEbAZkW3hrBZQFW0mqQ2oaZ8dnsm509IqmCA==
X-ME-Sender: <xms:PBzBY0rNKIG5NuSAPhPeZ0KpH_7wVw2vExnFq-cIwfIBKMzWbftvgg>
 <xme:PBzBY6oA_loX8HToX5eFdP3eiPW0tewyjxyHv_4mXY58pMKDHRZ-eK2Fv0FXAViAM
 UiUHU9VbRIoQeRE4n4>
X-ME-Received: <xmr:PBzBY5Nc1_LwqodTU5N9-RtIvDRq68OnwwY9MPf84zKeJAKvVVatYXuYtQfxSInIFgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleejgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PBzBY77oRfnRq6cz3ccVbDlo0RCliLWGqGvNLf9Jv3_KaycjEeGnSQ>
 <xmx:PBzBYz6RSoEgazq8brBWl3WWLsYj0XBDSv5XfgEvmAY9s-vREHw4bA>
 <xmx:PBzBY7gnTDXMcha_umi19rGhcHm6eD5ESS_qGH9gf7cEpXWvJM0zlA>
 <xmx:PBzBYwG1vqnkQ966lvRr6CXBR2E3Ihu0jMXXTExcxeBcIGiwlS6SKA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jan 2023 03:54:18 -0500 (EST)
Date: Fri, 13 Jan 2023 09:54:16 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8EcOFE52X5KbzO7@cormorant.local>
References: <Y8AG21o/9/3eUMIg@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tnXpPrNANPllFBCL"
Content-Disposition: inline
In-Reply-To: <Y8AG21o/9/3eUMIg@cormorant.local>
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


--tnXpPrNANPllFBCL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC qemu pci maintainers

Michael, Marcel,

Do you have any comments on this thread? As you can see one solution is
to simply deassert prior to asserting, the other is to reintroduce a
pci_irq_pulse(). Both seem to solve the issue.

On Jan 12 14:10, Klaus Jensen wrote:
> Hi all (linux-nvme, qemu-devel, maintainers),
>=20
> On QEMU riscv64, which does not use MSI/MSI-X and thus relies on
> pin-based interrupts, I'm seeing occasional completion timeouts, i.e.
>=20
>   nvme nvme0: I/O 333 QID 1 timeout, completion polled
>=20
> To rule out issues with shadow doorbells (which have been a source of
> frustration in the past), those are disabled. FWIW I'm also seeing the
> issue with shadow doorbells.
>=20
> 	diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> 	index f25cc2c235e9..28d8e7f4b56c 100644
> 	--- a/hw/nvme/ctrl.c
> 	+++ b/hw/nvme/ctrl.c
> 	@@ -7407,7 +7407,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice =
*pci_dev)
> 	     id->mdts =3D n->params.mdts;
> 	     id->ver =3D cpu_to_le32(NVME_SPEC_VER);
> 	     id->oacs =3D
> 	-        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DB=
BUF);
> 	+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
> 	     id->cntrltype =3D 0x1;
>=20
> 	     /*
>=20
>=20
> I captured a trace from QEMU when this happens:
>=20
> pci_nvme_mmio_write addr 0x1008 data 0x4e size 4
> pci_nvme_mmio_doorbell_sq sqid 1 new_tail 78
> pci_nvme_io_cmd cid 4428 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_REA=
D'
> pci_nvme_read cid 4428 nsid 1 nlb 32 count 16384 lba 0x1324
> pci_nvme_map_prp trans_len 4096 len 16384 prp1 0x80aca000 prp2 0x82474100=
 num_prps 5
> pci_nvme_map_addr addr 0x80aca000 len 4096
> pci_nvme_map_addr addr 0x80ac9000 len 4096
> pci_nvme_map_addr addr 0x80ac8000 len 4096
> pci_nvme_map_addr addr 0x80ac7000 len 4096
> pci_nvme_io_cmd cid 4429 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_REA=
D'
> pci_nvme_read cid 4429 nsid 1 nlb 224 count 114688 lba 0x1242
> pci_nvme_map_prp trans_len 4096 len 114688 prp1 0x80ae6000 prp2 0x8247400=
0 num_prps 29
> pci_nvme_map_addr addr 0x80ae6000 len 4096
> pci_nvme_map_addr addr 0x80ae5000 len 4096
> pci_nvme_map_addr addr 0x80ae4000 len 4096
> pci_nvme_map_addr addr 0x80ae3000 len 4096
> pci_nvme_map_addr addr 0x80ae2000 len 4096
> pci_nvme_map_addr addr 0x80ae1000 len 4096
> pci_nvme_map_addr addr 0x80ae0000 len 4096
> pci_nvme_map_addr addr 0x80adf000 len 4096
> pci_nvme_map_addr addr 0x80ade000 len 4096
> pci_nvme_map_addr addr 0x80add000 len 4096
> pci_nvme_map_addr addr 0x80adc000 len 4096
> pci_nvme_map_addr addr 0x80adb000 len 4096
> pci_nvme_map_addr addr 0x80ada000 len 4096
> pci_nvme_map_addr addr 0x80ad9000 len 4096
> pci_nvme_map_addr addr 0x80ad8000 len 4096
> pci_nvme_map_addr addr 0x80ad7000 len 4096
> pci_nvme_map_addr addr 0x80ad6000 len 4096
> pci_nvme_map_addr addr 0x80ad5000 len 4096
> pci_nvme_map_addr addr 0x80ad4000 len 4096
> pci_nvme_map_addr addr 0x80ad3000 len 4096
> pci_nvme_map_addr addr 0x80ad2000 len 4096
> pci_nvme_map_addr addr 0x80ad1000 len 4096
> pci_nvme_map_addr addr 0x80ad0000 len 4096
> pci_nvme_map_addr addr 0x80acf000 len 4096
> pci_nvme_map_addr addr 0x80ace000 len 4096
> pci_nvme_map_addr addr 0x80acd000 len 4096
> pci_nvme_map_addr addr 0x80acc000 len 4096
> pci_nvme_map_addr addr 0x80acb000 len 4096
> pci_nvme_rw_cb cid 4428 blk 'd0'
> pci_nvme_rw_complete_cb cid 4428 blk 'd0'
> pci_nvme_enqueue_req_completion cid 4428 cqid 1 dw0 0x0 dw1 0x0 status 0x0
> [1]: pci_nvme_irq_pin pulsing IRQ pin
> pci_nvme_rw_cb cid 4429 blk 'd0'
> pci_nvme_rw_complete_cb cid 4429 blk 'd0'
> pci_nvme_enqueue_req_completion cid 4429 cqid 1 dw0 0x0 dw1 0x0 status 0x0
> [2]: pci_nvme_irq_pin pulsing IRQ pin
> [3]: pci_nvme_mmio_write addr 0x100c data 0x4d size 4
> [4]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 77
> ---- TIMEOUT HERE (30s) ---
> [5]: pci_nvme_mmio_read addr 0x1c size 4
> [6]: pci_nvme_mmio_write addr 0x100c data 0x4e size 4
> [7]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 78
> --- Interrupt deasserted (cq->tail =3D=3D cq->head)
> [   31.757821] nvme nvme0: I/O 333 QID 1 timeout, completion polled
>=20
> Following the timeout, everything returns to "normal" and device/driver
> happily continues.
>=20
> The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
> am wondering if there is something going on with the kernel driver (but
> I certainly do not rule out that hw/nvme is at fault here, since
> pin-based interrupts has also been a source of several issues in the
> past).
>=20
> What I'm thinking is that following the interrupt in [1], the driver
> picks up completion for cid 4428 but does not find cid 4429 in the queue
> since it has not been posted yet. Before getting a cq head doorbell
> write (which would cause the pin to be deasserted), the device posts the
> completion for cid 4429 which just keeps the interrupt asserted in [2].
> The trace then shows the cq head doorbell update in [3,4] for cid 4428
> and then we hit the timeout since the driver is not aware that cid 4429
> has been posted in between this (why is it not aware of this?) Timing
> out, the driver then polls the queue and notices cid 4429 and updates
> the cq head doorbell in [5-7], causing the device to deassert the
> interrupt and we are "back in shape".
>=20
> I'm observing this on 6.0 kernels and v6.2-rc3 (have not tested <6.0).
> Tested on QEMU v7.0.0 (to rule out all the shadow doorbell
> optimizations) as well as QEMU nvme-next (infradead). In other words,
> it's not a recent regression in either project and potentially it has
> always been like this. I've not tested other platforms for now, but I
> would assume others using pin-based interrupts would observe the same.
>=20
> Any ideas on how to shed any light on this issue from the kernel side of
> things?



--=20
One of us - No more doubt, silence or taboo about mental illness.

--tnXpPrNANPllFBCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPBHDgACgkQTeGvMW1P
Dem57Qf8Dp6NtT29Ze8hsec4E2VvjCPmbU2O8z4UYnKRFrhi/ANaHBP9vkk3hMP3
gSqEcIF9hmc04I/nG75gAdqaycTjs7/GSMBp7YtEcgFFO6rk7XSFCFUGdmWT2HXO
LI1AluKB9IYiLmkFxYtr5HDdu3U+jL+VTzjKsDG9mciln6aK11FBDqZQYXwwUSRv
QSMZpiQtXh92Cxh9NHyM5mx6UzFHhcthIfT9aa5/fojROR7XK5Hq4LBxSMfbMeez
RD/f2NcGC65cFMHtkNW6D/PyEzUAMc7KjMpNqRXa+PifjB6UPgPB1/mMzycmvwha
QZ2mKAegZVn4huRuDbczkYD5R+74ag==
=zgP2
-----END PGP SIGNATURE-----

--tnXpPrNANPllFBCL--

