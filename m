Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A65A10DE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:45:02 +0200 (CEST)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCEG-0003wu-W9
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRC7t-0004Sq-QT; Thu, 25 Aug 2022 08:38:27 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRC7q-0008VH-VW; Thu, 25 Aug 2022 08:38:25 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B85F5C005F;
 Thu, 25 Aug 2022 08:38:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 08:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661431100; x=1661517500; bh=Oh
 yfYn9O3yZfBQbxoVbm9BRwLPvG346gwY1cfM5NNy8=; b=saopv2yzXuYAjzFfav
 YIagF9NLpaR6Q50k3OacIjfVl5ZvX5L9mpE8FCTaKDm/bll+ZcGD75ZCLcRxWoUt
 0kFxl3xRP+/pu9670mR98uHXgNeqxsUo0kQCfXYaUxBflaicfcK5QSmEF/BLiJc4
 rCbiyKUGDvVJ4eHsvsBZQhpsaZgNj9jPyESVYmugiHHBCUZLEdxTMf3WUtJgmteE
 QrHnLjpOzKBw0qFKMEmeKCOJ+P6aWF8ChboAvG3qRiHa6AVca6Bzxu5mGnYK0vh4
 A8//HiC+cdKPe0hDMwFsvlk0nNvurqQtoeKZJY1/2lKBEocmJi4bm48Y+1YIlNyT
 NWKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661431100; x=1661517500; bh=OhyfYn9O3yZfBQbxoVbm9BRwLPvG
 346gwY1cfM5NNy8=; b=3oPWSzhfVREI7N8FNq6ufqLQMC/+IAXLAO5e0cUfPf2n
 1u9shLR3ixOEuQFh8Fcep7SUxenW76AkxbFWuQ7SKnBaalHXO39198nyXb+2vSI8
 wmDQ5iFYtr5woeLWXeWprte1fnakjHhqGGvfEbwuiz7OIbgJACrPI9Ui28H5BJ+4
 8tBlYDM0ykSLiqwv4ujhF43bxrxO5JOTv5BudRZ7E0FtOgZoApNZgj8reziYnnSZ
 znrsMSnjzFdQMlS9sLdaLNZD/Rvbr2hGAJvrpL4v9WEsfyfUxOoFCo5I3HUr6nn/
 9mrSYmjLdN3hXWRa7aHFqF/aV+n2FRgZjYBgpWYx/w==
X-ME-Sender: <xms:O20HY8mflU8imHT_7FtP-dpPLrd983z9i-gAIELcH7mU8RswXilq2A>
 <xme:O20HY726hTPMHm7VrGRMuylGW3FikINB7YyVIvMzIV2d-lKcQm9t7T6r5cVkQPRgW
 lsALnMDzonfTReDz-I>
X-ME-Received: <xmr:O20HY6qoUhkU7r3o3MmW6utDeJBhDO0Jdnp3FpXSBb-igkJ0cbDetAHLaP7xVCU0kJUjr4Vvml6pNst_eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 orredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeetgfdtfefhueeigffgffekffekle
 ehleeuieevgfefvddthfeiveegfedtuedutdenucffohhmrghinheptghtrhhlrdgtfien
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:O20HY4n4VTkCPFZ_zxYJvZ9xxfXl1EpWOhK0bvQ1OAFmizP2uwpA1w>
 <xmx:O20HY62sdc8mKn8kgLJzNtODD8-SluM3_72GIYHqSRYTEpVt3EAc8w>
 <xmx:O20HY_uPoMS63GIGbWAWUgVIyNpZ_ybmxsjwb7Ho3ooPtk05nKqdzw>
 <xmx:PG0HY9TXDu9iAkir_yfpuk61h7IVRysfa5N54aQ9aW4zqXKOqd7NCA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 08:38:18 -0400 (EDT)
Date: Thu, 25 Aug 2022 14:38:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Message-ID: <YwdtOPccnpoMQLDq@apples>
References: <20220825074746.2047420-1-fanjinhao21s@ict.ac.cn>
 <20220825074746.2047420-2-fanjinhao21s@ict.ac.cn>
 <YwdB//iV62uWeqJK@apples>
 <7e5708c6-ffad-d867-a232-85ce55ee60b4@ict.ac.cn>
 <YwdjdZye1L/D+29G@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MuDbEUYJyz2IyvXS"
Content-Disposition: inline
In-Reply-To: <YwdjdZye1L/D+29G@apples>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--MuDbEUYJyz2IyvXS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 13:56, Klaus Jensen wrote:
> On Aug 25 19:16, Jinhao Fan wrote:
> > On 8/25/2022 5:33 PM, Klaus Jensen wrote:
> > > I'm still a bit perplexed by this issue, so I just tried moving
> > > nvme_init_irq_notifier() to the end of nvme_init_cq() and removing th=
is
> > > first_io_cqe thing. I did not observe any particular issues?
> > >=20
> > > What bad behavior did you encounter, it seems to work fine to me
> >=20
> > The kernel boots up and got stuck, waiting for interrupts. Then the req=
uest
> > times out and got retried three times. Finally the driver seems to deci=
de
> > that the drive is down and continues to boot.
> >=20
> > I added some prints during debugging and found that the MSI-X message w=
hich
> > got registered in KVM via kvm_irqchip_add_msi_route() is not the same a=
s the
> > one actually used in msix_notify().
> >=20
> > Are you sure you are using KVM's irqfd?
> >=20
>=20
> Pretty sure? Using "ioeventfd=3Don,irq-eventfd=3Don" on the controller.
>=20
> And the following patch.
>=20
>=20
> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> index 30bbda7bb5ae..b2e41d3bd745 100644
> --- i/hw/nvme/ctrl.c
> +++ w/hw/nvme/ctrl.c
> @@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
>              if (!pending) {
>                  n->cq_pending++;
>              }
> -
> -            if (unlikely(cq->first_io_cqe)) {
> -                /*
> -                 * Initilize event notifier when first cqe is posted. Fo=
r irqfd=20
> -                 * support we need to register the MSI message in KVM. We
> -                 * can not do this registration at CQ creation time beca=
use
> -                 * Linux's NVMe driver changes the MSI message after CQ =
creation.
> -                 */
> -                cq->first_io_cqe =3D false;
> -
> -                if (n->params.irq_eventfd) {
> -                    nvme_init_irq_notifier(n, cq);
> -                }
> -            }
> -
>          }
> =20
>          nvme_irq_assert(n, cq);
> @@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl=
 *n, uint64_t dma_addr,
>      }
>      n->cq[cqid] =3D cq;
>      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> +
>      /*=20
>       * Only enable irqfd for IO queues since we always emulate admin que=
ue=20
>       * in main loop thread=20
>       */
> -    cq->first_io_cqe =3D cqid !=3D 0;
> +    if (cqid && n->params.irq_eventfd) {
> +        nvme_init_irq_notifier(n, cq);
> +    }
>  }
>=20
>=20

=46rom a trace, this is what I observe:

First, the queue is created and a virq (0) is assigned.

  msix_table_mmio_write dev nvme hwaddr 0xc val 0x0 size 4
  pci_nvme_mmio_write addr 0x1000 data 0x7 size 4
  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 7
  pci_nvme_admin_cmd cid 4117 sqid 0 opc 0x5 opname 'NVME_ADM_CMD_CREATE_CQ'
  pci_nvme_create_cq create completion queue, addr=3D0x104318000, cqid=3D1,=
 vector=3D1, qsize=3D1023, qflags=3D3, ien=3D1
  kvm_irqchip_add_msi_route dev nvme vector 1 virq 0
  kvm_irqchip_commit_routes
  pci_nvme_enqueue_req_completion cid 4117 cqid 0 dw0 0x0 dw1 0x0 status 0x0
  pci_nvme_irq_msix raising MSI-X IRQ vector 0
  pci_nvme_mmio_write addr 0x1004 data 0x7 size 4
  pci_nvme_mmio_doorbell_cq cqid 0 new_head 7

We go on and the SQ is created as well.

  pci_nvme_mmio_write addr 0x1000 data 0x8 size 4
  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 8
  pci_nvme_admin_cmd cid 4118 sqid 0 opc 0x1 opname 'NVME_ADM_CMD_CREATE_SQ'
  pci_nvme_create_sq create submission queue, addr=3D0x1049a0000, sqid=3D1,=
 cqid=3D1, qsize=3D1023, qflags=3D1
  pci_nvme_enqueue_req_completion cid 4118 cqid 0 dw0 0x0 dw1 0x0 status 0x0
  pci_nvme_irq_msix raising MSI-X IRQ vector 0
  pci_nvme_mmio_write addr 0x1004 data 0x8 size 4
  pci_nvme_mmio_doorbell_cq cqid 0 new_head 8


Then i get a bunch of update_msi_routes, but the virq's are not related
to the nvme device.

However, I then assume we hit queue_request_irq() in the kernel and we
see the MSI-X table updated:

  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x1 size 4
  msix_table_mmio_write dev nvme hwaddr 0x10 val 0xfee003f8 size 4
  msix_table_mmio_write dev nvme hwaddr 0x14 val 0x0 size 4
  msix_table_mmio_write dev nvme hwaddr 0x18 val 0x0 size 4
  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x0 size 4
  kvm_irqchip_update_msi_route Updating MSI route virq=3D0
  ... other virq updates
  kvm_irqchip_commit_routes

Notice the last trace line. The route for virq 0 is updated.

Looks to me that the virq route is implicitly updated with the new
message, no?

--MuDbEUYJyz2IyvXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMHbTcACgkQTeGvMW1P
DempXwgAhefrwajftbdm0SLeL3isCwQYRl3qCekbUGw2cFlcblNyvn7NSj5sjtX3
1x7XcHv4LVGaRlE7b/r5RadVT938KFjs57Jxc0xzzPeo+tHT5B62Hw6lFZf4KT/d
kykxcggCuVS7Fvmg/iQgXuY5O3FgH+3NiUX8mc6Qgu8rQHBC1eD3u067sVS9K2Gr
Ky2StxAly6chRY8veARY9Go6jUZpD+N0nDRa8x9CP+wn19bqp8oq7DcanB3hvBv4
m30Y2QmzdIQge68gWpsP1x4ehVmn399/87TJz25tboPexWVEmkuHvSDZRU7HyoJ5
QOqqKYZ1Ioexxhd8cuMFvE9N3edPAg==
=Yhtw
-----END PGP SIGNATURE-----

--MuDbEUYJyz2IyvXS--

