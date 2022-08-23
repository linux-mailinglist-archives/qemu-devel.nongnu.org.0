Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C059DAD6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 13:08:41 +0200 (CEST)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQRlw-0006Vy-1P
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 07:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQRi6-00027A-QL; Tue, 23 Aug 2022 07:04:42 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQRi2-0004Ch-5C; Tue, 23 Aug 2022 07:04:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0040F5C011D;
 Tue, 23 Aug 2022 07:04:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 23 Aug 2022 07:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661252676; x=1661339076; bh=Kf
 LR7OhMJJxsLgpAM/TFNGewM46fe4RkSghMTUmY6Zo=; b=Ye5a/ByxGxJIJeUPMq
 pdi6DdeMXKLECexsi0XJmzg0599841+trz3K10m9+k3whL+iAUHYmgOHOKsrGo1e
 P1IgC2trHl27dgKOoUmG4rNKAgsKLWlplDQtJYp8hq8fjxjl4y42h0MKCeS/R1KW
 TTnOvkfdnpJAjY6gxoExpdfcpQ3Aom8IJcQGABuQGYbf3OfiTwbyWo0uJ2AYmgPr
 +TN52QngW1G2w/o8F5IcJoMAN8lLVDz7sYfrvE5VfommmdwoSqXx4w8rzqqWP5pt
 dzZBCZm+hjJXeEQUwXuLh9N5RP3uhoui+AlOddoDjiWOWubVYFJJC3fXLmNNEqZ5
 YNrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661252676; x=1661339076; bh=KfLR7OhMJJxsLgpAM/TFNGewM46f
 e4RkSghMTUmY6Zo=; b=WMM4VCkMTqcEENRKnKk9SUYcK5axIiSBtq9empZuiKOt
 lcHCnUfdMrwRmTotgztagfItef6U8qQxKPQD7p81h4bBNQUUa7xfaJ0G7OdFOwlO
 uVb966SUZJf3/QgKObJesho6NZrJNQGRAgR34nePlV+Af3jNM2h9fY7DCBJS8DQv
 w7yEShT6TE/Lhm14H3My3tVr4oKq+MVbSR6qpJCq3XYxF0Lu0PLhyajctvsL3nGX
 16e/5TXqQoIsPPUWhkevtm96ygt/d4y/yfUFphKcUxsUhGbbkRVm0kj3UqKj9ELC
 mREBndbP1nqAhNv5f/ttwRIG7SY7lgvKdBdYNT2Jhg==
X-ME-Sender: <xms:RLQEYzJ2m58ykDcc3zns9kmGpILjdh6n0LhZubEzc00_mWDjqAizTQ>
 <xme:RLQEY3JbcDtgKMXYQj5-PxcV6TakVUB-mB0VK8iN--cXIEhWpwOd-orL07YaUX9xz
 1m5pnAECaNCl99gUJ0>
X-ME-Received: <xmr:RLQEY7uzd2GevBfNMhjVH-S3FXQo0ZWcaeggOaERDL0zjXuqWPSpPTrjyl5gSzgJPEeJCzQMF9KALpZnjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:RLQEY8b0uCp3FFaHVBA18668vatPe3CXLGQ-jFBXEn_davsl3jTJ9Q>
 <xmx:RLQEY6bgdfPSZUtVgO7V6QscgMmRUqAwAHuOVuBIdhWosQg00hPiAg>
 <xmx:RLQEYwBn9B4_p3jsV7ovfqA7LHjEABHHVZnJr_qaUUQPJUff434yfg>
 <xmx:RLQEYxXG2_qZ50uyFY1qriDECQrF9amNxGaaC2EUJel6dm3x6gS39w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 07:04:35 -0400 (EDT)
Date: Tue, 23 Aug 2022 13:04:33 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH 4/4] hw/nvme: add MSI-x mask handlers for irqfd
Message-ID: <YwS0QaE7N3vzSex8@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fvviRMTTazXJpNN9"
Content-Disposition: inline
In-Reply-To: <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--fvviRMTTazXJpNN9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 11 23:37, Jinhao Fan wrote:
> When irqfd is enabled, we bypass QEMU's irq emulation and let KVM to
> directly assert the irq. However, KVM is not aware of the device's MSI-x
> masking status. Add MSI-x mask bookkeeping in NVMe emulation and
> detach the corresponding irqfd when the certain vector is masked.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c       | 82 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/nvme/nvme.h       |  2 ++
>  hw/nvme/trace-events |  3 ++
>  3 files changed, 87 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 63f988f2f9..ac5460c7c8 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -7478,10 +7478,84 @@ static int nvme_add_pm_capability(PCIDevice *pci_=
dev, uint8_t offset)
> =20
>      return 0;
>  }
> +static int nvme_vector_unmask(PCIDevice *pci_dev, unsigned vector,
> +                               MSIMessage msg)
> +{
> +    NvmeCtrl *n =3D NVME(pci_dev);
> +    int ret;
> +
> +    trace_pci_nvme_irq_unmask(vector, msg.address, msg.data);
> +   =20
> +    for (uint32_t i =3D 0; i < n->params.max_ioqpairs + 1; i++) {

This loop is OK for now, but could be done better with a reverse
mapping.

This is just an observation. Don't spend time on doing it since we are
not aware of any host actually doing masking/unmasking.

> +        NvmeCQueue *cq =3D n->cq[i];
> +        /*=20
> +         * If this function is called, then irqfd must be available. The=
refore,
> +         * irqfd must be in use if cq->assert_notifier.initialized is tr=
ue.
> +         */

The wording indicates that you want to assert() that assumption instead.

> +        if (cq && cq->vector =3D=3D vector && cq->assert_notifier.initia=
lized) {
> +            if (cq->msg.data !=3D msg.data || cq->msg.address !=3D msg.a=
ddress) {
> +                ret =3D kvm_irqchip_update_msi_route(kvm_state, cq->virq=
, msg,
> +                                                   pci_dev);
> +                if (ret < 0) {
> +                    return ret;
> +                }
> +                kvm_irqchip_commit_routes(kvm_state);
> +                cq->msg =3D msg;
> +            }
> +
> +            ret =3D kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> +                                                     &cq->assert_notifie=
r,
> +                                                     NULL, cq->virq);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void nvme_vector_mask(PCIDevice *pci_dev, unsigned vector)
> +{
> +    NvmeCtrl *n =3D NVME(pci_dev);
> +
> +    trace_pci_nvme_irq_mask(vector);
> +   =20
> +    for (uint32_t i =3D 0; i < n->params.max_ioqpairs + 1; i++) {
> +        NvmeCQueue *cq =3D n->cq[i];
> +        if (cq && cq->vector =3D=3D vector && cq->assert_notifier.initia=
lized) {
> +            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> +                                                  &cq->assert_notifier,
> +                                                  cq->virq);
> +        }
> +    }
> +}
> +
> +static void nvme_vector_poll(PCIDevice *pci_dev,
> +                             unsigned int vector_start,
> +                             unsigned int vector_end)
> +{
> +    NvmeCtrl *n =3D NVME(pci_dev);
> +
> +    trace_pci_nvme_irq_poll(vector_start, vector_end);
> +
> +    for (uint32_t i =3D 0; i < n->params.max_ioqpairs + 1; i++) {
> +        NvmeCQueue *cq =3D n->cq[i];
> +        if (cq && cq->vector >=3D vector_start && cq->vector <=3D vector=
_end=20
> +            && msix_is_masked(pci_dev, cq->vector)=20
> +            && cq->assert_notifier.initialized) {
> +            if (event_notifier_test_and_clear(&cq->assert_notifier)) {
> +                msix_set_pending(pci_dev, i);
> +            }
> +        }
> +    }
> +}

I'm a little fuzzy on this - what causes this function to be invoked?

--fvviRMTTazXJpNN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMEtEAACgkQTeGvMW1P
DelphwgAwppH+heT9kyBEkv1wMm9DsD2TwpitO3a6ofc3gdhuKJgylsxXyqtUXPn
pc672+3RuKznycLP5ZpYCEJO8Y19lCSWfbj9M6A8PQ7R3/iXp5DXnJB5vSXXcYZT
GE14D2PErwjq+nGZOuKeq1t7wQIkfKEAne0ho39HIMGi5Yjc5PazhQPIFbI/xXAc
AXAhRT13aaclGgUebVIn9YiafmAHYA717uXA3TUd2XWIrtAKJc286CWwMFv6geaV
ydifcwzfZNl2y9rbwKWesBrcV2wZ2GFHGcYKBUjbBQaM4ECWhRv/zppqDG4qvZWN
tsmpHtfD4zzJ3UN1LldejeVRkuCWEA==
=iGgD
-----END PGP SIGNATURE-----

--fvviRMTTazXJpNN9--

