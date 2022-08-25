Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCDB5A12DA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:01:24 +0200 (CEST)
Received: from localhost ([::1]:52074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRDQB-0006A5-AZ
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRDO2-0004Ld-FQ; Thu, 25 Aug 2022 09:59:10 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRDO0-0007EK-Ac; Thu, 25 Aug 2022 09:59:10 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CBF3D5C0195;
 Thu, 25 Aug 2022 09:59:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 25 Aug 2022 09:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661435945; x=1661522345; bh=9H
 VqZ0eLVLK8JLsQtaiGBiBsnY6kg9CsZkhWHQ9oKZ8=; b=JQ2LQYxing36R1uKMY
 Gd+A34XLz2WL6jeMsqYGDuBkS+Wqkt7GGL/Z1nQ0Hqk/tVc0kWYHRc9UCJ7Xcc7r
 8qJaHEr89j4a6Q8LIpS5xXmq2ClzfK5yFNwv8wec1zDX+qL1dsYo0y3bfA1HLaGZ
 kkHChp9QJAOiyqta1p8rfWK+A/m0TWJ7w6iq7gbukka8rZkS5RiOdbG+hV2VkOox
 YILD17NoMbRZ0BFMxp2qYFFpCT2iya/mF71T6H593mezmcJAAsE5gHzi8kNLTZ+p
 e25H9FmI6RqqzEvYkESG6LF9euvvaB/XshEKN74Czw9TkJIusXCQJzw8wd+WsgEr
 Qt+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661435945; x=1661522345; bh=9HVqZ0eLVLK8JLsQtaiGBiBsnY6k
 g9CsZkhWHQ9oKZ8=; b=qc8dljzhNuJHUxV14yJwGCekzveqA5RpFMk4lQdMI8XP
 0Ki04IHQTXiGEXI+Fg/Yv0dcxAhpPEszGINIBNwmUy2LYf1RBnS/dLzLVNOK/t8k
 R/MI2NITPeOQlloc0v9FPdMylEC1/HT6o4EF1uyHzKpvQKNpiC1B/IDs+clbx965
 qn4g+3DEyfvB1FP3X33c4OwAU+c55R2CL2iH9XXB6lHYlqUfZJAsiLaw+8B6rr9p
 GVJQhCI5SVEYMnnu4Zy+gwQb5fcZNBh7UDSp21JvhtVg6DAjI1inp8VLPSuVqnS5
 PJNUZXMxy8jhai+1khLgnVzoiOQKj8UJHMY6vRnuhg==
X-ME-Sender: <xms:KYAHY3x4MwdcKIQOSA9OxqzMGlL-5YCIncFoy9SrN89NPnywI98mmQ>
 <xme:KYAHY_TQbzFxaTT7TIpnZHjhwXr_i9s37Wcm-X20NeyfepjrZnxgASHX_1ZsPrwMZ
 IS5uV3cqgBsLL9pKS0>
X-ME-Received: <xmr:KYAHYxWIp7IjyT7NF_ovqGeVnN0RYWI4RD-rHa3Gyvfj_wWdw6JO7RWp7V-YKg26g71ZefVsFH8tym4Ulw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeehgefguedufefgkedtudfgvdelfe
 eifeehgeeghfefteevgeelkeejvddtkeeiheenucffohhmrghinheptghtrhhlrdgtfidp
 rhhighhhthdrthgrrhhgvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KYAHYxg714Oe4DE81YkMXHybi3423uOvECZObzO_BwxTtEACMsdIsA>
 <xmx:KYAHY5B9Hwg1fKnMb35l4iuNY-5MXajV84-OpuxcB8pGNCIg_xrakg>
 <xmx:KYAHY6Jy3uECDjiv2f3BzVn7_F9ev0b_wb-7ab89zhkUPSz6HHjDfw>
 <xmx:KYAHY0-LPIUUS-Q1zd6HjvtXwwRcxdz304vHjhubr3OD9PIHzJvLXg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 09:59:04 -0400 (EDT)
Date: Thu, 25 Aug 2022 15:59:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 1/3] hw/nvme: support irq(de)assertion with eventfd
Message-ID: <YweAJsEfLPBomz2W@apples>
References: <YwdtOPccnpoMQLDq@apples>
 <29A5902D-D6FD-413A-B540-9C0E18B6329A@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yg1fIrvP+2v2xfIJ"
Content-Disposition: inline
In-Reply-To: <29A5902D-D6FD-413A-B540-9C0E18B6329A@ict.ac.cn>
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


--Yg1fIrvP+2v2xfIJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 21:09, Jinhao Fan wrote:
>=20
>=20
>=20
> > =E5=9C=A8 2022=E5=B9=B48=E6=9C=8825=E6=97=A5=EF=BC=8C20:39=EF=BC=8CKlau=
s Jensen <its@irrelevant.dk> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > =EF=BB=BFOn Aug 25 13:56, Klaus Jensen wrote:
> >>> On Aug 25 19:16, Jinhao Fan wrote:
> >>> On 8/25/2022 5:33 PM, Klaus Jensen wrote:
> >>>> I'm still a bit perplexed by this issue, so I just tried moving
> >>>> nvme_init_irq_notifier() to the end of nvme_init_cq() and removing t=
his
> >>>> first_io_cqe thing. I did not observe any particular issues?
> >>>>=20
> >>>> What bad behavior did you encounter, it seems to work fine to me
> >>>=20
> >>> The kernel boots up and got stuck, waiting for interrupts. Then the r=
equest
> >>> times out and got retried three times. Finally the driver seems to de=
cide
> >>> that the drive is down and continues to boot.
> >>>=20
> >>> I added some prints during debugging and found that the MSI-X message=
 which
> >>> got registered in KVM via kvm_irqchip_add_msi_route() is not the same=
 as the
> >>> one actually used in msix_notify().
> >>>=20
> >>> Are you sure you are using KVM's irqfd?
> >>>=20
> >>=20
> >> Pretty sure? Using "ioeventfd=3Don,irq-eventfd=3Don" on the controller.
> >>=20
> >> And the following patch.
> >>=20
> >>=20
> >> diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
> >> index 30bbda7bb5ae..b2e41d3bd745 100644
> >> --- i/hw/nvme/ctrl.c
> >> +++ w/hw/nvme/ctrl.c
> >> @@ -1490,21 +1490,6 @@ static void nvme_post_cqes(void *opaque)
> >>             if (!pending) {
> >>                 n->cq_pending++;
> >>             }
> >> -
> >> -            if (unlikely(cq->first_io_cqe)) {
> >> -                /*
> >> -                 * Initilize event notifier when first cqe is posted.=
 For irqfd=20
> >> -                 * support we need to register the MSI message in KVM=
=2E We
> >> -                 * can not do this registration at CQ creation time b=
ecause
> >> -                 * Linux's NVMe driver changes the MSI message after =
CQ creation.
> >> -                 */
> >> -                cq->first_io_cqe =3D false;
> >> -
> >> -                if (n->params.irq_eventfd) {
> >> -                    nvme_init_irq_notifier(n, cq);
> >> -                }
> >> -            }
> >> -
> >>         }
> >>=20
> >>         nvme_irq_assert(n, cq);
> >> @@ -4914,11 +4899,14 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeC=
trl *n, uint64_t dma_addr,
> >>     }
> >>     n->cq[cqid] =3D cq;
> >>     cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> >> +
> >>     /*=20
> >>      * Only enable irqfd for IO queues since we always emulate admin q=
ueue=20
> >>      * in main loop thread=20
> >>      */
> >> -    cq->first_io_cqe =3D cqid !=3D 0;
> >> +    if (cqid && n->params.irq_eventfd) {
> >> +        nvme_init_irq_notifier(n, cq);
> >> +    }
> >> }
> >>=20
> >>=20
> >=20
> > From a trace, this is what I observe:
> >=20
> > First, the queue is created and a virq (0) is assigned.
> >=20
> >  msix_table_mmio_write dev nvme hwaddr 0xc val 0x0 size 4
> >  pci_nvme_mmio_write addr 0x1000 data 0x7 size 4
> >  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 7
> >  pci_nvme_admin_cmd cid 4117 sqid 0 opc 0x5 opname 'NVME_ADM_CMD_CREATE=
_CQ'
> >  pci_nvme_create_cq create completion queue, addr=3D0x104318000, cqid=
=3D1, vector=3D1, qsize=3D1023, qflags=3D3, ien=3D1
> >  kvm_irqchip_add_msi_route dev nvme vector 1 virq 0
> >  kvm_irqchip_commit_routes
> >  pci_nvme_enqueue_req_completion cid 4117 cqid 0 dw0 0x0 dw1 0x0 status=
 0x0
> >  pci_nvme_irq_msix raising MSI-X IRQ vector 0
> >  pci_nvme_mmio_write addr 0x1004 data 0x7 size 4
> >  pci_nvme_mmio_doorbell_cq cqid 0 new_head 7
> >=20
> > We go on and the SQ is created as well.
> >=20
> >  pci_nvme_mmio_write addr 0x1000 data 0x8 size 4
> >  pci_nvme_mmio_doorbell_sq sqid 0 new_tail 8
> >  pci_nvme_admin_cmd cid 4118 sqid 0 opc 0x1 opname 'NVME_ADM_CMD_CREATE=
_SQ'
> >  pci_nvme_create_sq create submission queue, addr=3D0x1049a0000, sqid=
=3D1, cqid=3D1, qsize=3D1023, qflags=3D1
> >  pci_nvme_enqueue_req_completion cid 4118 cqid 0 dw0 0x0 dw1 0x0 status=
 0x0
> >  pci_nvme_irq_msix raising MSI-X IRQ vector 0
> >  pci_nvme_mmio_write addr 0x1004 data 0x8 size 4
> >  pci_nvme_mmio_doorbell_cq cqid 0 new_head 8
> >=20
> >=20
> > Then i get a bunch of update_msi_routes, but the virq's are not related
> > to the nvme device.
> >=20
> > However, I then assume we hit queue_request_irq() in the kernel and we
> > see the MSI-X table updated:
> >=20
> >  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x1 size 4
> >  msix_table_mmio_write dev nvme hwaddr 0x10 val 0xfee003f8 size 4
> >  msix_table_mmio_write dev nvme hwaddr 0x14 val 0x0 size 4
> >  msix_table_mmio_write dev nvme hwaddr 0x18 val 0x0 size 4
> >  msix_table_mmio_write dev nvme hwaddr 0x1c val 0x0 size 4
> >  kvm_irqchip_update_msi_route Updating MSI route virq=3D0
> >  ... other virq updates
> >  kvm_irqchip_commit_routes
> >=20
> > Notice the last trace line. The route for virq 0 is updated.
> >=20
> > Looks to me that the virq route is implicitly updated with the new
> > message, no?
>=20
> Could you try without the msix masking patch? I suspect our unmask functi=
on actually did the =E2=80=9Cimplicit=E2=80=9D update here.
>=20
> >=20

RIGHT.

target/i386/kvm/kvm.c:

5353     if (!notify_list_inited) {
5354         /* For the first time we do add route, add ourselves into
5355          * IOMMU's IEC notify list if needed. */
5356         X86IOMMUState *iommu =3D x86_iommu_get_default();
5357         if (iommu) {
5358             x86_iommu_iec_register_notifier(iommu,
5359                                             kvm_update_msi_routes_all,
5360                                             NULL);
5361         }
5362         notify_list_inited =3D true;
5363     }

If we have an IOMMU, then it all just works. I always run with a viommu
configured, so that is why I was not seeing the issue. The masking has
nothing to do with it.

I wonder if this can be made to work without the iommu as well...

--Yg1fIrvP+2v2xfIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMHgCQACgkQTeGvMW1P
DellhQgAvd3D7iRvUM8T263IjA3pYCI8FmrQQqMjt3JAUv/BX+ZORisiULYOiGa6
GCR1jqlyA1YkzshfpuWYUnAxHzyI0xezIg1Ud1pxoqO/3FLEvG0ChgfkYEvJo3cz
56kX651WwTxBid43hjCqxd6WwWjIkqfUYMtU1JwIKA68im+aRSgxKBX+lvk04DPl
gKgTP2vaKn3MbVusSg52MeEv96AqU33/WiMRgXLcQV7xWnkycncSdTGW3Q2jK9Vc
Pr2v03p5E7GOjKtbjik0gLHb9idgiN8qlsCf5XREX4a4Yw3VWE5fhCUewtx6xxz2
LWP+pRfEEhD0vrxWDXLWhXIiWcrVlQ==
=5SQj
-----END PGP SIGNATURE-----

--Yg1fIrvP+2v2xfIJ--

