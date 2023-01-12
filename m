Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623256672F4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxMJ-0003Xb-ER; Thu, 12 Jan 2023 08:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFxMC-0003Wp-Ri; Thu, 12 Jan 2023 08:11:01 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pFxMA-0002hQ-U8; Thu, 12 Jan 2023 08:11:00 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E9D525C0120;
 Thu, 12 Jan 2023 08:10:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 12 Jan 2023 08:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1673529055; x=1673615455; bh=ax+yEPkxUDxwwCFONw/tlENQP9fx8MuQbRF
 8om3xqp0=; b=XZm+umDxtP4GG9dAaTJRRxNwEGr9ygdbbzwERSOWCbHi9nkazvM
 PH7C74ylJxGro3GuwriN4LXXNLDaWoBXBpMHJAXzB0NKmcgFVoqcY5UznQ5lc3nn
 yHJL651frYfqRwrUWbTo5zavyG5wF76EYXA2Dm9b7pJVDojesSB5PY7jOfvSfNHT
 ok00zXT841TMgXA5VclOCdsPJE04HYZ9xACemPrFPPI202DC1k0f1XCqaeif//fs
 vldhqeiyHdtykrQlK3DWHpbqnQxQDV+VTPfZ926eDwgYrgu2qMHJMyr8jHVCmSZk
 kn7T4jap//2Pd0le/wknAzrUzGHsCLxYY7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673529055; x=
 1673615455; bh=ax+yEPkxUDxwwCFONw/tlENQP9fx8MuQbRF8om3xqp0=; b=p
 N4rf+NRUOk3dfUIVMcUQUFRWVWaOBLB0czm7zX/RM7CwBRRPPzUzWEqNrpf6Hj2+
 dJqiNyNYzP128dKJsZ+3m96kO8sFjQXdE+o++8N7N2/4YfN7r2neNF2As2W9RiuV
 LiwUYmDo/U6atQlKZPlNtZG4nw2X2j3IjVfFWcKZKdVK55f46Q+SuJB9h27Z1jpL
 mZ4MMO1t5dN87xcO/f31jeQ0S5l0FF5/aI5z8CNP6Ci9KrVcYMy6+Rh2hRk1qUmb
 qc4gXJfG7vljKvl2zR/b9V/liadIqZ/JTEZqHxeOLfey50YBmp08c8+FHyQRuHx+
 JTBxUTsHOWjKj5QVYD9ew==
X-ME-Sender: <xms:3wbAY3eLD-ax9FzQIT8FpvCxsNRncEhou0EqyqS_QoOuVw3s3MA8SQ>
 <xme:3wbAY9NnlfcG8D4sQOHHHg_P2yoSXowOnD6uKhQH9enng-T8urlMIwLjlQMOn-W28
 RlFqERGFeyBkClVfZw>
X-ME-Received: <xmr:3wbAYwgfyU2c1VUQfWToB2xDW3wKlZ6df5l4ebDfXLErdtOL02lwdxAb5j0OxSYs-ElBlQ04LrwATuFj0kn-yEBa-gNzNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedtjefgteejuedvkeefjefgieekueetvdduheffkeehjeevleehhedvgfeiudehhfen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:3wbAY4_SxqB6wMdCcuYAYLlhIbcyhCIAy2vmFhd8Yu8lsL7OhM5XMg>
 <xmx:3wbAYzvl628P-DdQgoqjcjnkL63UnkNGGEpNc5pJfPhj6wfLOO1Hwg>
 <xmx:3wbAY3E4rpSQyuJbzXmnkiRpTWlnbxuSquSbPYLljZS-LB5YmeEy_A>
 <xmx:3wbAY8-MxCVZFy-_ZHonO5ZkMCnbb7zMLVmXhZhMW9NdC_mvXT_BjQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 08:10:53 -0500 (EST)
Date: Thu, 12 Jan 2023 14:10:51 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: completion timeouts with pin-based interrupts in QEMU hw/nvme
Message-ID: <Y8AG21o/9/3eUMIg@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZSQlxVMiwxf2AkzL"
Content-Disposition: inline
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--ZSQlxVMiwxf2AkzL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi all (linux-nvme, qemu-devel, maintainers),

On QEMU riscv64, which does not use MSI/MSI-X and thus relies on
pin-based interrupts, I'm seeing occasional completion timeouts, i.e.

  nvme nvme0: I/O 333 QID 1 timeout, completion polled

To rule out issues with shadow doorbells (which have been a source of
frustration in the past), those are disabled. FWIW I'm also seeing the
issue with shadow doorbells.

	diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
	index f25cc2c235e9..28d8e7f4b56c 100644
	--- a/hw/nvme/ctrl.c
	+++ b/hw/nvme/ctrl.c
	@@ -7407,7 +7407,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
	     id->mdts = n->params.mdts;
	     id->ver = cpu_to_le32(NVME_SPEC_VER);
	     id->oacs =
	-        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT | NVME_OACS_DBBUF);
	+        cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
	     id->cntrltype = 0x1;

	     /*


I captured a trace from QEMU when this happens:

pci_nvme_mmio_write addr 0x1008 data 0x4e size 4
pci_nvme_mmio_doorbell_sq sqid 1 new_tail 78
pci_nvme_io_cmd cid 4428 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_READ'
pci_nvme_read cid 4428 nsid 1 nlb 32 count 16384 lba 0x1324
pci_nvme_map_prp trans_len 4096 len 16384 prp1 0x80aca000 prp2 0x82474100 num_prps 5
pci_nvme_map_addr addr 0x80aca000 len 4096
pci_nvme_map_addr addr 0x80ac9000 len 4096
pci_nvme_map_addr addr 0x80ac8000 len 4096
pci_nvme_map_addr addr 0x80ac7000 len 4096
pci_nvme_io_cmd cid 4429 nsid 0x1 sqid 1 opc 0x2 opname 'NVME_NVM_CMD_READ'
pci_nvme_read cid 4429 nsid 1 nlb 224 count 114688 lba 0x1242
pci_nvme_map_prp trans_len 4096 len 114688 prp1 0x80ae6000 prp2 0x82474000 num_prps 29
pci_nvme_map_addr addr 0x80ae6000 len 4096
pci_nvme_map_addr addr 0x80ae5000 len 4096
pci_nvme_map_addr addr 0x80ae4000 len 4096
pci_nvme_map_addr addr 0x80ae3000 len 4096
pci_nvme_map_addr addr 0x80ae2000 len 4096
pci_nvme_map_addr addr 0x80ae1000 len 4096
pci_nvme_map_addr addr 0x80ae0000 len 4096
pci_nvme_map_addr addr 0x80adf000 len 4096
pci_nvme_map_addr addr 0x80ade000 len 4096
pci_nvme_map_addr addr 0x80add000 len 4096
pci_nvme_map_addr addr 0x80adc000 len 4096
pci_nvme_map_addr addr 0x80adb000 len 4096
pci_nvme_map_addr addr 0x80ada000 len 4096
pci_nvme_map_addr addr 0x80ad9000 len 4096
pci_nvme_map_addr addr 0x80ad8000 len 4096
pci_nvme_map_addr addr 0x80ad7000 len 4096
pci_nvme_map_addr addr 0x80ad6000 len 4096
pci_nvme_map_addr addr 0x80ad5000 len 4096
pci_nvme_map_addr addr 0x80ad4000 len 4096
pci_nvme_map_addr addr 0x80ad3000 len 4096
pci_nvme_map_addr addr 0x80ad2000 len 4096
pci_nvme_map_addr addr 0x80ad1000 len 4096
pci_nvme_map_addr addr 0x80ad0000 len 4096
pci_nvme_map_addr addr 0x80acf000 len 4096
pci_nvme_map_addr addr 0x80ace000 len 4096
pci_nvme_map_addr addr 0x80acd000 len 4096
pci_nvme_map_addr addr 0x80acc000 len 4096
pci_nvme_map_addr addr 0x80acb000 len 4096
pci_nvme_rw_cb cid 4428 blk 'd0'
pci_nvme_rw_complete_cb cid 4428 blk 'd0'
pci_nvme_enqueue_req_completion cid 4428 cqid 1 dw0 0x0 dw1 0x0 status 0x0
[1]: pci_nvme_irq_pin pulsing IRQ pin
pci_nvme_rw_cb cid 4429 blk 'd0'
pci_nvme_rw_complete_cb cid 4429 blk 'd0'
pci_nvme_enqueue_req_completion cid 4429 cqid 1 dw0 0x0 dw1 0x0 status 0x0
[2]: pci_nvme_irq_pin pulsing IRQ pin
[3]: pci_nvme_mmio_write addr 0x100c data 0x4d size 4
[4]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 77
---- TIMEOUT HERE (30s) ---
[5]: pci_nvme_mmio_read addr 0x1c size 4
[6]: pci_nvme_mmio_write addr 0x100c data 0x4e size 4
[7]: pci_nvme_mmio_doorbell_cq cqid 1 new_head 78
--- Interrupt deasserted (cq->tail == cq->head)
[   31.757821] nvme nvme0: I/O 333 QID 1 timeout, completion polled

Following the timeout, everything returns to "normal" and device/driver
happily continues.

The pin-based interrupt logic in hw/nvme seems sound enough to me, so I
am wondering if there is something going on with the kernel driver (but
I certainly do not rule out that hw/nvme is at fault here, since
pin-based interrupts has also been a source of several issues in the
past).

What I'm thinking is that following the interrupt in [1], the driver
picks up completion for cid 4428 but does not find cid 4429 in the queue
since it has not been posted yet. Before getting a cq head doorbell
write (which would cause the pin to be deasserted), the device posts the
completion for cid 4429 which just keeps the interrupt asserted in [2].
The trace then shows the cq head doorbell update in [3,4] for cid 4428
and then we hit the timeout since the driver is not aware that cid 4429
has been posted in between this (why is it not aware of this?) Timing
out, the driver then polls the queue and notices cid 4429 and updates
the cq head doorbell in [5-7], causing the device to deassert the
interrupt and we are "back in shape".

I'm observing this on 6.0 kernels and v6.2-rc3 (have not tested <6.0).
Tested on QEMU v7.0.0 (to rule out all the shadow doorbell
optimizations) as well as QEMU nvme-next (infradead). In other words,
it's not a recent regression in either project and potentially it has
always been like this. I've not tested other platforms for now, but I
would assume others using pin-based interrupts would observe the same.

Any ideas on how to shed any light on this issue from the kernel side of
things?

--ZSQlxVMiwxf2AkzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPABtoACgkQTeGvMW1P
DeliLgf9ENuEZObUMO1SQhR26bD7PJ9CmmaBc+PDf7tutqR7hPvXG6hEuI12LM+c
MetBUth3PDm+OT+9gsI8VT1WC6wiowqVYf1BpXtj/wJw7kJ5L+JURrVcGODEDLf7
AL0/kNJxWJ1sCQy+0pI4QOgSFlk/EcJPAqXLOX1zaUFT15t3dFuejV9fPfxS5Dm9
Qj+3bWA6HiUe+M/DznoCl550P2s2i6Pvhs2p975UfTwd1ftcR4d/ytl7emg8q8a0
a/rZMGoD3Mii/29aRtXcBiG10APMBHI4rHjKbNB0QwVvYyEehJOhPalbnyc6q9ul
AhkeAeaGXDXsmyY2fZ69A2liaHnk1Q==
=nWb1
-----END PGP SIGNATURE-----

--ZSQlxVMiwxf2AkzL--

