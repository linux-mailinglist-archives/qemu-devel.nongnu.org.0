Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E8A59DACD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 13:02:13 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQRff-0001cb-Me
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 07:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQRcN-0008L8-Ej; Tue, 23 Aug 2022 06:58:47 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQRcL-00039c-04; Tue, 23 Aug 2022 06:58:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C4C55C03BD;
 Tue, 23 Aug 2022 06:58:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 23 Aug 2022 06:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661252323; x=1661338723; bh=A3
 wdmJWlZPT+ggKQEZmyjxOShiLA6pFvFOkSM03xY6s=; b=BzmHnTeG4CQv8D8NZv
 s94c1L3jfM8xLpF6c5/8L7eHzu0Bk7H0GrBCMntDJ9QCR+upiBdUcd04K5K+k/6j
 FYTE4sM4banD/y3fm2Vkl19xSZfoPQ2lfJL1u/Sj8LWOkj8EmB0QazbwhX/WEP+E
 XnUiYtxv3gWn7xvtfI+zQbg5AsalfsJt5QYsCJTEcg7PLkl3v2CDydwfZbEmm3J3
 Nj0xpx6T3rzIDFmL0ZGhEtqKQtcfilCPPn99O7RUHmtPzuNbmY7ex+7PlYElHCS+
 bAylSnWWHI3XPPo8X/P81CMUmpm00G7Tf4TJHd0vPX+yHbGajEJ1nJTYIRL2kn1t
 mO3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661252323; x=1661338723; bh=A3wdmJWlZPT+ggKQEZmyjxOShiLA
 6pFvFOkSM03xY6s=; b=5cnCqxl/uN1HpBoT/noYdpzQvCVQCzatk+/AHpMMGy7B
 1ONF/O4xJp1MVpFZWl7N44qh5dRVoFL7q/Xvw3wsskJUFxadpQnJXe1T8L/O2Kx0
 UNrmCeJfRMD30M2FlzNHrrfLl5tVGXQctq8xo9qxQ2pD/9BAN74nBqIIIZeavN9f
 iMuxJj1RwEc94SdLnznV+DEaa+1DN7TC7TZIeXqYaK7qj1AOj2RpoMbxfOQWntXh
 MzQmvvlkR9S9Sl1YeHEpWQDuTl/CSj35VNaZaRHyWJe96HFkKiTWN35ckDkVfcw0
 Io3ZGZoMjEn1ma0ANZ8hyQCGyCcteAvW21RR2RrLBA==
X-ME-Sender: <xms:4rIEYydtcwNwXcDmxAGMV0Xx8FRAGuNpVS8dFAPAOuJciWT8qYXoiQ>
 <xme:4rIEY8OfIObn13M8gaKUy5268KR08_HcHyQJTOMAXBMQxAXZMortws3bQ57yvfe00
 DybRrwHIOB__AtsR80>
X-ME-Received: <xmr:4rIEYziQkaTE5hJWOMt2XonWgN1JUhNA3wVK-cL_SK0yegL4WWe2A1wuUyNhHtdmxRPeUhNM2_iW9MLK_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4rIEY_8jEKL8NQqvZc7WlysAAlYwNnmhM0oV-p8d_gpyHbtD6r8frQ>
 <xmx:4rIEY-sxjg4TqcvGOw-2HQN54dkf-1_NhYvEFhWqP03q9XBg3mRu-w>
 <xmx:4rIEY2H_7kKLcfYajjZ8__wKwMIAvhtbZmqLHyGmta9TDiolQ_qMsQ>
 <xmx:47IEYwKKTGl-ZlYpl_igpEavOD-TOoLQIpJ4mBVNskLiNyFP4U3hCw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 06:58:41 -0400 (EDT)
Date: Tue, 23 Aug 2022 12:58:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH 2/4] hw/nvme: add option to (de)assert irq with eventfd
Message-ID: <YwSy3+VKbXdkXbA0@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-3-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WnT1DihCBTXotd2d"
Content-Disposition: inline
In-Reply-To: <20220811153739.3079672-3-fanjinhao21s@ict.ac.cn>
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


--WnT1DihCBTXotd2d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 11 23:37, Jinhao Fan wrote:
> When the new option 'irq-eventfd' is turned on, the IO emulation code
> signals an eventfd when it want to (de)assert an irq. The main loop
> eventfd handler does the actual irq (de)assertion.  This paves the way
> for iothread support since QEMU's interrupt emulation is not thread
> safe.
>=20
> Asserting and deasseting irq with eventfd has some performance
> implications. For small queue depth it increases request latency but
> for large queue depth it effectively coalesces irqs.
>=20
> Comparision (KIOPS):
>=20
> QD            1   4  16  64
> QEMU         38 123 210 329
> irq-eventfd  32 106 240 364
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h |  4 +++
>  2 files changed, 90 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index bd3350d7e0..8a1c5ce3e1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1338,6 +1338,54 @@ static void nvme_update_cq_head(NvmeCQueue *cq)
>      trace_pci_nvme_shadow_doorbell_cq(cq->cqid, cq->head);
>  }
> =20
> +static void nvme_assert_notifier_read(EventNotifier *e)
> +{
> +    NvmeCQueue *cq =3D container_of(e, NvmeCQueue, assert_notifier);
> +    if (event_notifier_test_and_clear(e)) {
> +        nvme_irq_assert(cq->ctrl, cq);
> +    }
> +}
> +
> +static void nvme_deassert_notifier_read(EventNotifier *e)
> +{
> +    NvmeCQueue *cq =3D container_of(e, NvmeCQueue, deassert_notifier);
> +    if (event_notifier_test_and_clear(e)) {
> +        nvme_irq_deassert(cq->ctrl, cq);
> +    }
> +}
> +
> +static void nvme_init_irq_notifier(NvmeCtrl *n, NvmeCQueue *cq)
> +{
> +    int ret;
> +
> +    ret =3D event_notifier_init(&cq->assert_notifier, 0);
> +    if (ret < 0) {
> +        goto fail_assert_handler;
> +    }
> +
> +    event_notifier_set_handler(&cq->assert_notifier,
> +                                nvme_assert_notifier_read);
> +
> +    if (!msix_enabled(&n->parent_obj)) {
> +        ret =3D event_notifier_init(&cq->deassert_notifier, 0);
> +        if (ret < 0) {
> +            goto fail_deassert_handler;
> +        }
> +
> +        event_notifier_set_handler(&cq->deassert_notifier,
> +                                   nvme_deassert_notifier_read);
> +    }
> +
> +    return;
> +
> +fail_deassert_handler:
> +    event_notifier_set_handler(&cq->deassert_notifier, NULL);
> +    event_notifier_cleanup(&cq->deassert_notifier);
> +fail_assert_handler:
> +    event_notifier_set_handler(&cq->assert_notifier, NULL);
> +    event_notifier_cleanup(&cq->assert_notifier);
> +}
> +
>  static void nvme_post_cqes(void *opaque)
>  {
>      NvmeCQueue *cq =3D opaque;
> @@ -1382,7 +1430,23 @@ static void nvme_post_cqes(void *opaque)
>                  n->cq_pending++;
>              }
> =20
> -            nvme_irq_assert(n, cq);
> +            if (unlikely(cq->first_io_cqe)) {
> +                /*
> +                 * Initilize event notifier when first cqe is posted. Fo=
r irqfd=20
> +                 * support we need to register the MSI message in KVM. We
> +                 * can not do this registration at CQ creation time beca=
use
> +                 * Linux's NVMe driver changes the MSI message after CQ =
creation.
> +                 */
> +                cq->first_io_cqe =3D false;
> +
> +                nvme_init_irq_notifier(n, cq);
> +            }

It is really unfortunate that we have to do this. From what I can tell
in the kernel driver, even if it were to change to set up the irq prior
to creating the completion queue, we'd still have issues making this
work on earlier versions and there is no way to quirk our way out of
this.

We can't even move this upon creation of the submission queue since the
kernel also creates *that* prior to allocating the interrupt line.

In conclusion I don't see any way around this other than asking the NVMe
TWG to add some kind of bit indicating that the host sets up the
interrupt line prior to creating the cq.

Meh.

> +
> +            if (cq->assert_notifier.initialized) {
> +                event_notifier_set(&cq->assert_notifier);
> +            } else {
> +                nvme_irq_assert(n, cq);
> +            }

There is a lot of duplication below, checking if the notifier is
initialized and then choosing what to do. Can we move this to
nvme_irq_assert/deassert()?

>          }
>      }
>  }
> @@ -4249,7 +4313,11 @@ static void nvme_cq_notifier(EventNotifier *e)
>      if (cq->irq_enabled && cq->tail =3D=3D cq->head) {
>          n->cq_pending--;
>          if (!msix_enabled(&n->parent_obj)) {
> -            nvme_irq_deassert(n, cq);
> +            if (cq->deassert_notifier.initialized) {
> +                event_notifier_set(&cq->deassert_notifier);
> +            } else {
> +                nvme_irq_deassert(n, cq);
> +            }
>          }
>      }
> =20
> @@ -4706,6 +4774,14 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl =
*n)
>          event_notifier_set_handler(&cq->notifier, NULL);
>          event_notifier_cleanup(&cq->notifier);
>      }
> +    if (cq->assert_notifier.initialized) {
> +        event_notifier_set_handler(&cq->assert_notifier, NULL);
> +        event_notifier_cleanup(&cq->assert_notifier);
> +    }
> +    if (cq->deassert_notifier.initialized) {
> +        event_notifier_set_handler(&cq->deassert_notifier, NULL);
> +        event_notifier_cleanup(&cq->deassert_notifier);
> +    }
>      if (msix_enabled(&n->parent_obj)) {
>          msix_vector_unuse(&n->parent_obj, cq->vector);
>      }
> @@ -4737,6 +4813,7 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeReques=
t *req)
>          }
> =20
>          if (!msix_enabled(&n->parent_obj)) {
> +            /* Do not use eventfd since this is always called in main lo=
op */
>              nvme_irq_deassert(n, cq);
>          }
>      }
> @@ -4777,6 +4854,7 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *=
n, uint64_t dma_addr,
>      }
>      n->cq[cqid] =3D cq;
>      cq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> +    cq->first_io_cqe =3D cqid !=3D 0;
>  }
> =20
>  static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
> @@ -6926,7 +7004,11 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr ad=
dr, int val)
>          if (cq->irq_enabled && cq->tail =3D=3D cq->head) {
>              n->cq_pending--;
>              if (!msix_enabled(&n->parent_obj)) {
> -                nvme_irq_deassert(n, cq);
> +                if (cq->deassert_notifier.initialized) {
> +                    event_notifier_set(&cq->deassert_notifier);
> +                } else {
> +                    nvme_irq_deassert(n, cq);
> +                }
>              }
>          }
>      } else {
> @@ -7675,6 +7757,7 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, fals=
e),
>      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
>      DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
> +    DEFINE_PROP_BOOL("irq-eventfd", NvmeCtrl, params.irq_eventfd, false),
>      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>      DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>                       params.auto_transition_zones, true),
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 79f5c281c2..759d0ecd7c 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -398,6 +398,9 @@ typedef struct NvmeCQueue {
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
>      EventNotifier notifier;
> +    EventNotifier assert_notifier;
> +    EventNotifier deassert_notifier;
> +    bool        first_io_cqe;
>      bool        ioeventfd_enabled;
>      QTAILQ_HEAD(, NvmeSQueue) sq_list;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
> @@ -422,6 +425,7 @@ typedef struct NvmeParams {
>      bool     auto_transition_zones;
>      bool     legacy_cmb;
>      bool     ioeventfd;
> +    bool     irq_eventfd;
>      uint8_t  sriov_max_vfs;
>      uint16_t sriov_vq_flexible;
>      uint16_t sriov_vi_flexible;
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--WnT1DihCBTXotd2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMEst4ACgkQTeGvMW1P
DelGIggAqiSqXx1iXKKVDKBnfoUEqiyDu/w+oYCdvR13wPvXRERmJpt4ca37Sa4d
irz0nvvLZHBot/mCP99HeXdE6oHTOQYP/nJIiw+MesS/dlw7LsSUk9f/7yYLl2fs
iNMrMWPOmD6i0l4apZvU9krUxB+R7AJ7N3Lg4m1gudVJg1QXtGD2iTVh9VY02KeQ
/66/lS6l/NoHj6UR5KvAv6IH3CXwtrxFg6L5lJn094VXjptJ1GqUd9BDmIb6GzF4
dKnt5C48/AUAJeyVKthq2yZ2UpoO7BSj7D5dg2o32dvbDsa2+eLj16mIdc8zdwyp
AhEoa9bUiDBpMQfPWxQGo1sAi3bgJw==
=MoQ2
-----END PGP SIGNATURE-----

--WnT1DihCBTXotd2d--

