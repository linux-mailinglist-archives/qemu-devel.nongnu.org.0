Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 722053A3245
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 19:37:33 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrOcW-0005L6-CM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 13:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lrOYc-0004GA-1Y; Thu, 10 Jun 2021 13:33:30 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lrOYZ-0007no-MP; Thu, 10 Jun 2021 13:33:29 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 22ECF2497;
 Thu, 10 Jun 2021 13:33:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Jun 2021 13:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=KcPNyjUFbVZpRematl3ZUiGmPw9
 z1C3gqnrmifH2Kt4=; b=ag3BCYFM45T6tw/3Q8i1OJ8emUrbcn6BNoMxy9oAMcK
 YDIiriGB2p1x6BqgyRsMBFxnSmCbB4hpx+TSyjkOlE9OWK1rxaABeLysin/9iqYk
 d5/nDJ8pC0xdZtPT1+i7qfOL0zTDevKKbEb9LJHnGCAZOBw2qi7BUIR3dwlNB75d
 WH91aBU3096o9AFAbe5iGD8StaBJLVQODPPk9+mMjTW6YOH1S4pZC/Ih9DYsV+bR
 YCIy3btNEz0UNtAjecI3EeKl+iAUKkY6o9JlSpDglt/GNz5GgMKgO6oPD4SBEA+6
 XWdVqx0/ZziMBfzuXVOjZOY7HgVWpfyboQhx4sejUQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KcPNyj
 UFbVZpRematl3ZUiGmPw9z1C3gqnrmifH2Kt4=; b=kxW1RS0ut1V601emFIEght
 e/0K+nSb/h6PfWVWLqIUucyZbGRgFIpHNhyDvN1BKgpI2GEF4nHR7PDPOIP38Ym/
 33YPv8g3wsB5t3/WOykHprlHoBwaI6G0H/VJO0OyuBR6ktwESyL22aQyRZsALhTy
 QSZD6hKsfAWhPPlMPGajEUbnvl5h/WIVE2SwMMTFVZXIxulaF9EMurn6Nw1TEdAh
 cI8m3J7yStJhohSebeLbqIrmGfL13Ac+TrsV1OQzIC6SVTz9aTcYUJ92jxmyMicR
 EoxkhvfZZJxWFB5EFZOacm7B7FOvSXeWmwKRXj120Ublpx/JrFWy6IcLQ02rOz3w
 ==
X-ME-Sender: <xms:4UzCYF_wZT8sygMj-BEq2h0Fq0YPSYowiBYAL68JcI5j2m_B7AJ32w>
 <xme:4UzCYJvO5tWdu27K5VyBBitN_6BenLZdhsVJJOgaNJ8AH2dsjgjXz5HmFihD7Tfu9
 grP0Dj4nRHtasn8GSY>
X-ME-Received: <xmr:4UzCYDCSKUmC2eVDVlzAF-JIofHFVrbAawYmZATtvu8A0id4PXjiUrwSJoiZlDStzB-qEExW6SLJccH_imDIeVa9U39MpZ2TCF9Do66qDyVXIn1saQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:4UzCYJfKLSnhXaxs3VQ4VkesyNz3TPaKFLTKdTgR49huJFFXCapZfg>
 <xmx:4UzCYKOw-p3xhHzSB1nwgWOAiNybl7DE7NE7iLgA1yYy4GfmB_NMyw>
 <xmx:4UzCYLlDmi_SHPOj_kCmuOyC7kJisVp6L5mqovomnZKxFItWS3555Q>
 <xmx:4kzCYHpqPhplZ6Tjl5ZImtpOgOgP5OaOBX8tjDmYCkkuF7rg8Xd8tQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 13:33:20 -0400 (EDT)
Date: Thu, 10 Jun 2021 19:33:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Subject: Re: [PATCH] hw/nvme: be more careful when deasserting IRQs
Message-ID: <YMJM3kXR/uZkPZpr@apples.localdomain>
References: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MsAQEvzw7TXcZm6r"
Content-Disposition: inline
In-Reply-To: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: its@irrelevant.dk, kbusch@kernel.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MsAQEvzw7TXcZm6r
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+cc qemu-block, maintainers

On Jun 10 13:46, Jakub Jerm=C3=A1=C5=99 wrote:
>An IRQ vector used by a completion queue cannot be deasserted without
>first checking if the same vector does not need to stay asserted for
>some other completion queue.
>
>Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>---
> hw/nvme/ctrl.c | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f..c0980929eb 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -473,6 +473,21 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue=
 *cq)
>     }
> }
>
>+/*
>+ * Check if the vector used by the cq can be deasserted, i.e. it needn't =
be
>+ * asserted for some other cq.
>+ */
>+static bool nvme_irq_can_deassert(NvmeCtrl *n, NvmeCQueue *cq)
>+{
>+    for (unsigned qid =3D 0; qid < n->params.max_ioqpairs + 1; qid++) {
>+        NvmeCQueue *q =3D n->cq[qid];
>+
>+        if (q && q->vector =3D=3D cq->vector && q->head !=3D q->tail)
>+            return false;  /* some queue needs this to stay asserted */
>+    }
>+    return true;
>+}
>+
> static void nvme_req_clear(NvmeRequest *req)
> {
>     req->ns =3D NULL;
>@@ -4089,7 +4104,9 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest=
 *req)
>         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
>         return NVME_INVALID_QUEUE_DEL;
>     }
>-    nvme_irq_deassert(n, cq);
>+    if (nvme_irq_can_deassert(n, cq)) {
>+        nvme_irq_deassert(n, cq);
>+    }
>     trace_pci_nvme_del_cq(qid);
>     nvme_free_cq(cq, n);
>     return NVME_SUCCESS;
>@@ -5757,7 +5774,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr=
, int val)
>             timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>         }
>
>-        if (cq->tail =3D=3D cq->head) {
>+        if (nvme_irq_can_deassert(n, cq)) {
>             nvme_irq_deassert(n, cq);
>         }
>     } else {
>--=20
>2.31.1
>
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--MsAQEvzw7TXcZm6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDCTNwACgkQTeGvMW1P
DenN1ggAwLH2GQDqWd9WJmP54hXMVBYChrm27bjJgqpOGrsOvwEClDLpCTR8+MWs
MfmzpDp+e5nIwFBxLLpnaSBfZojXFxi4bZZy0T/rBaUFBSTuolf6n3An5s9I7BVI
+YwzRBcDugLNoeK0fYMCrYy289/aDYVYgWt7+wZcpDQRfPsZowlC5o6L1v0aNOvN
ZTZCIiqg25lnawW3+aK19LPUNGCRQc2n9XQwnT35YwfacG0tP/op6mXM59TwNM4h
Y++9qcIawRZdv+F6tkAggkXFEQtP67BmBuh78CqHnYAe6xiVTd2gzkwIKD7LcMwn
HIFxkIeb7YA3BQ9TxTvaPbtH7iXGDQ==
=2hfZ
-----END PGP SIGNATURE-----

--MsAQEvzw7TXcZm6r--

