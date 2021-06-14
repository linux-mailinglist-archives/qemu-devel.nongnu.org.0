Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F53A6E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:24:34 +0200 (CEST)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrGC-0000PH-UA
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrBd-0007QO-BL; Mon, 14 Jun 2021 14:19:49 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lsrBZ-0001eU-De; Mon, 14 Jun 2021 14:19:48 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 886FB5C01A7;
 Mon, 14 Jun 2021 14:19:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 14 Jun 2021 14:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=wa8BOr9dWBG+OsI6Lvph1ONQc5f
 7xg0g6F56wcAH8VU=; b=PsREuBEMp50rQsHsSWyKZr0t90deoY7s+YFchTcXfbp
 ljSYol63l0mkHDlAFhJNmJQZHyLP44/GybKNM322sMG4hEilxiWusMUydAZhXTa6
 xMstD7KDrlEX6EycvptSTPKFigV3NNtwZCVKWfBaPrrxFV4KnOeWIuc88O6FfEsz
 7z6eyffU42PctqhF5h36RP1cR3d0CBh9zfBYpyZa8/p6wrR9nf988FWIAC0E3OEf
 eeIO1CKtITXKafj8hF7BSZsOPmXrradyn47TKeBDpZa4UetODGHvPCAKD9LJlpwF
 v7WbPbB+03pCJ8LRP0J0c1QgV/KSQC+13myykgdQ9yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wa8BOr
 9dWBG+OsI6Lvph1ONQc5f7xg0g6F56wcAH8VU=; b=nYqA4HW2V2mL3oSS6fqYbp
 ny4aFhzjPqpDYNAGf/g8swTp551H3pRkfqfA6O6MTV28GmaNq/xVF49rQkGGTc4m
 /R2eaYA0ccHkIOUgKuALQLSjMumcPvkuVhXv31F0B7EErVNCjFuwWtdZ4okxBXy1
 p8438aqXN6r36kx6gzhMp2Q00o+xKDhU0KjIeYO3c9bRTwGltMyuKmO2iEYInNr0
 yHrBUVGD+o30hjPuTca6tomJosLqlZaHnRmTEiMEdkX3GJU0Ln+bJTBJdNGhiRib
 q+848hucJHz1+XHnE/yJfVAxBUF2w6FLes6au3OdvQA+dpYJ0lHcIZPnluElEeMQ
 ==
X-ME-Sender: <xms:vp3HYMuuMmRnILFqb9keciixwM-nofg8tH9W4LAlKPcWnrk2YgsC6Q>
 <xme:vp3HYJfquKc01_9KVhSKP0mQZX9YMil2TIDNfZ8KBQv5qrEoB3bXzAP3XVwL_K7ty
 PDOlwUjndo5UyheGA4>
X-ME-Received: <xmr:vp3HYHzkE7lDVvtfQEuLnueVUEDsDGdrGGE4rAK33PekkLV6D86gGojIHKyMoV2N7h1LsS_2AjJACy96P0X1uB16tbO3UWQy1BmT2iLaXtGR_xDTww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepheevffekffevuddugfdvudfhjeffveefgedvhfejvdevheetheffveetgfel
 uddtnecuffhomhgrihhnpegtthhrlhdrtgifnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vp3HYPMc8xumGS-l2RwHqx9o7S1uDMVlGRRBx_OkCPI4yvYOpRA1eQ>
 <xmx:vp3HYM9pzfj_YtjZ-2clSIQotXOxTmjvbSWOqoCLHyvYjtNExR8jNw>
 <xmx:vp3HYHWjQAo42DYXqnSi9wuLDs5i8PZgYzRoDmIBbZSZvUouIu76vg>
 <xmx:v53HYLYibKj5kliQMLOIm1QUTD85-KCH59JXiOam6vej17w9MWUPUQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 14:19:41 -0400 (EDT)
Date: Mon, 14 Jun 2021 20:19:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Subject: Re: [PATCH v2] hw/nvme: be more careful when deasserting IRQs
Message-ID: <YMedu0Ry1YKJ/2SV@apples.localdomain>
References: <20210614135429.56475-1-jakub.jermar@kernkonzept.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IWq/ZuRmfN33Q7Q4"
Content-Disposition: inline
In-Reply-To: <20210614135429.56475-1-jakub.jermar@kernkonzept.com>
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IWq/ZuRmfN33Q7Q4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 14 15:54, Jakub Jerm=C3=A1=C5=99 wrote:
>An IRQ vector used by a completion queue cannot be deasserted without
>first checking if the same vector does not need to stay asserted for
>some other completion queue. To this end the controller structure is
>extended by a counter of asserted completion queues.
>
>To prevent incrementing the counter for completion queues that are
>asserted repeatedly, each completion queue is extended by a flag which
>tells whether the queue is currently asserted.
>

I wasn't clear on this on my last review, but the misunderstanding here=20
is that the completion queue vector somehow matters for pin-based=20
interrupts - it does not. There is only *one* interrupt vector and if=20
the controller is not using MSI-X, then the Interrupt Vector (IV) field=20
of the Create I/O Completion Queue command *must* be zero.

In other words, all that matters is if there are one or more CQEs posted=20
(in any queue).

Would this (untested) patch do the trick?


diff --git i/hw/nvme/nvme.h w/hw/nvme/nvme.h
index 93a7e0e5380e..60250b579464 100644
--- i/hw/nvme/nvme.h
+++ w/hw/nvme/nvme.h
@@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
      uint32_t    max_q_ents;
      uint8_t     outstanding_aers;
      uint32_t    irq_status;
+    int         cq_pending;
      uint64_t    host_timestamp;                 /* Timestamp sent by the =
host */
      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
      uint64_t    starttime_ms;
diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
index 7dea64b72e6a..4de4b3177463 100644
--- i/hw/nvme/ctrl.c
+++ w/hw/nvme/ctrl.c
@@ -473,6 +473,10 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue =
*cq)
              return;
          } else {
              assert(cq->vector < 32);
+            if (--(n->cq_pending)) {
+                return;
+            }
+
              n->irq_status &=3D ~(1 << cq->vector);
              nvme_irq_check(n);
          }
@@ -1258,6 +1262,7 @@ static void nvme_post_cqes(void *opaque)
      NvmeCQueue *cq =3D opaque;
      NvmeCtrl *n =3D cq->ctrl;
      NvmeRequest *req, *next;
+    bool empty =3D cq->head =3D=3D cq->tail;
      int ret;

      QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
@@ -1287,6 +1292,10 @@ static void nvme_post_cqes(void *opaque)
          QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
      }
      if (cq->tail !=3D cq->head) {
+        if (empty) {
+            n->cq_pending++;
+        }
+
          nvme_irq_assert(n, cq);
      }
  }


>Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>---
> hw/nvme/ctrl.c | 22 ++++++++++++++++------
> hw/nvme/nvme.h |  2 ++
> 2 files changed, 18 insertions(+), 6 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f..97a5d768ee 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -451,9 +451,13 @@ static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *=
cq)
>             msix_notify(&(n->parent_obj), cq->vector);
>         } else {
>             trace_pci_nvme_irq_pin();
>-            assert(cq->vector < 32);
>-            n->irq_status |=3D 1 << cq->vector;
>-            nvme_irq_check(n);
>+            if (!cq->irq_asserted) {
>+                cq->irq_asserted =3D true;
>+                assert(cq->vector < 32);
>+                n->irq_asserted_cnt[cq->vector]++;
>+                n->irq_status |=3D 1 << cq->vector;
>+                nvme_irq_check(n);
>+            }
>         }
>     } else {
>         trace_pci_nvme_irq_masked();
>@@ -466,9 +470,15 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue=
 *cq)
>         if (msix_enabled(&(n->parent_obj))) {
>             return;
>         } else {
>-            assert(cq->vector < 32);
>-            n->irq_status &=3D ~(1 << cq->vector);
>-            nvme_irq_check(n);
>+            if (cq->irq_asserted) {
>+                cq->irq_asserted =3D false;
>+                assert(cq->vector < 32);
>+                assert(n->irq_asserted_cnt[cq->vector]);
>+                if (n->irq_asserted_cnt[cq->vector]-- =3D=3D 1) {
>+                    n->irq_status &=3D ~(1 << cq->vector);
>+                }
>+                nvme_irq_check(n);
>+            }
>         }
>     }
> }
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index 81a35cda14..753bf7a923 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -352,6 +352,7 @@ typedef struct NvmeCQueue {
>     uint32_t    head;
>     uint32_t    tail;
>     uint32_t    vector;
>+    bool        irq_asserted;
>     uint32_t    size;
>     uint64_t    dma_addr;
>     QEMUTimer   *timer;
>@@ -404,6 +405,7 @@ typedef struct NvmeCtrl {
>     uint32_t    max_q_ents;
>     uint8_t     outstanding_aers;
>     uint32_t    irq_status;
>+    uint16_t    irq_asserted_cnt[32];
>     uint64_t    host_timestamp;                 /* Timestamp sent by the =
host */
>     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>     uint64_t    starttime_ms;
>--=20
>2.31.1
>
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--IWq/ZuRmfN33Q7Q4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDHnboACgkQTeGvMW1P
Dem/2wf8CkMXScc/MT360x2fN9NK2xjRtIMZMYfZQR7YX3nDr+memN4eS2lPnWdV
LW50OJGQZSpPPHR6g1ktG2nB4wQ6bPbKAjAb4Cuctt42J+GJgxOVIFaWeiyGZg5g
ek+Z+c5+oxMsXY7zwQ2Ltm/p2jnaIGAoN0YNHH9JJ8sMRctSuuOt4UrxC9bznklj
GC82uI5iAUVNOgL1c2lILB6Vv23w9cxJxzsuI1IYIk73hSneFmzrqgneGVfj7LCw
L41AvWnivYNwOfxfGNCeszoNrEbXKwEemboWhLWDbpXxcy7GjKUlXBZ1Lw6u02FH
cMdBeBh6GFgC8pwr/5dg5UfQVJ6VJA==
=YmJa
-----END PGP SIGNATURE-----

--IWq/ZuRmfN33Q7Q4--

