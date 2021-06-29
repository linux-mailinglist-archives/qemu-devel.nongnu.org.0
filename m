Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C063B6DED
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 07:24:42 +0200 (CEST)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly6Ej-0002qS-JD
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 01:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ly6A5-0000zs-Qq; Tue, 29 Jun 2021 01:19:53 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ly6A4-0005jD-0w; Tue, 29 Jun 2021 01:19:53 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C3915C02D0;
 Tue, 29 Jun 2021 01:19:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 01:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=zCKiF1xaCCgd2szfuyRViE8bIRm
 4q+Wmtaq+vyqH7B0=; b=ImweH/CjNQ1hombSZi1M3H6Ys4Xqrc4skCRC3ZQMP5v
 2ad2Nz2v1X/SQTsL1hSIqFS6QzdClTOallY19hkTUiQnSFm21mHxQPR8jlusuOIl
 YF2mUS1JB9vLBOOM9L5dESLYEqXkQWordh6hTJJJy3Nv/34NyM4hVGK5rjPF4DiS
 iyk0TA1kab1DJfoWdCpcNgOYdVv2kf9uoV4+yqDASOfMeuleRZUoyhE/Dfk1acR/
 AtZtctq1WxIwJQIWDCPXyQw+EG+MWahmt8Pg5Yoa68Wl9IXTqsHnkir8Xaesku13
 aHd6myMRXV2CJXZCM+YZO49pl0kFRv5CDKv6TOHHHfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zCKiF1
 xaCCgd2szfuyRViE8bIRm4q+Wmtaq+vyqH7B0=; b=AMm0qqif9RWFCV98fCjF4N
 fmnBZP4tSKlB45pxQfNV3bhSoWrhk/Fxvq9qanrc0mmvQ9LmjeioXQQ0e3rsl6JT
 48ooSW8UTdskEesaOhbeOBaSSrRTNxHhPS1f3OWm55dIqVmALtKeXFcf4fw/RK11
 7z69OpR/mwiBzIJpUsRyWzZbB0vEl7VyumR/tP8yqVMn0JVAjRgF37AbLGRKlpub
 rQ6RxNqoAlHWF/j+vFDxF2BIfXZQZlF/7XPe5Y5+iW+f8ViG6ES2t9fLIYjskynG
 4BSsdLZOtBABzYNcyt9KeyVcIIU/z6VRP/m33/OJruwqNCYM8OWSVx00XJbcnE0Q
 ==
X-ME-Sender: <xms:dq3aYIDSbtu2AlqblKDgWzQv42sneWcRBc2sLLjB5Zdeb992rxGSBA>
 <xme:dq3aYKi8RFX0zPGcWTWqHvGfavO35Ht-9EEq9Im3g6aakSI6CNR_f9n6tFTEeC2CM
 -NoxjoIGEZmznsk3O0>
X-ME-Received: <xmr:dq3aYLmbA6IwKDkvbpvi0BGYPEG6V5RWFbLgvStULaxGVzuTHPqkYhVcN2qAn4HkfSk5R9-YCHxj9e99XyHpa8RT2Psh8zx6UCK86pghfz2F8xeQTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehhedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dq3aYOzv4Ho7bh2hZdXj3jOUPMLvmgzj_j_P8gtAZd9YC4cmMC8s9Q>
 <xmx:dq3aYNTzJ3tuqsoKe_3l9ewB_K_dIBbci2PrezWrg4eNUDyPOhyVdA>
 <xmx:dq3aYJblaXV-yjclK4tfDeIpYw4PBaeVdjOK_fdoAbPsnxqIhfTuIA>
 <xmx:d63aYLONsVFRvmBerPS_IYVxnw8Wo7vzcpIgSm388atpdblgnPQGJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 01:19:49 -0400 (EDT)
Date: Tue, 29 Jun 2021 07:19:47 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <YNqtc2cW3OyUKHg+@apples.localdomain>
References: <20210617185542.106252-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FVPatJWiMmsyENUC"
Content-Disposition: inline
In-Reply-To: <20210617185542.106252-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FVPatJWiMmsyENUC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 17 20:55, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Jakub noticed[1] that, when using pin-based interrupts, the device will
>unconditionally deasssert when any CQEs are acknowledged. However, the
>pin should not be deasserted if other completion queues still holds
>unacknowledged CQEs.
>
>The bug is an artifact of commit ca247d35098d ("hw/block/nvme: fix
>pin-based interrupt behavior") which fixed one bug but introduced
>another. This is the third time someone tries to fix pin-based
>interrupts (see commit 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt
>behaviour of NVMe"))...
>
>Third time's the charm, so fix it, again, by keeping track of how many
>CQs have unacknowledged CQEs and only deassert when all are cleared.
>
>  [1]: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
>
>Fixes: ca247d35098d ("hw/block/nvme: fix pin-based interrupt behavior")
>Reported-by: Jakub Jerm=C3=A1=C5=99 <jakub.jermar@kernkonzept.com>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
>
>v2:
>  - only refcount for CQs with interrupts enabled (Keith)
>
> hw/nvme/nvme.h |  1 +
> hw/nvme/ctrl.c | 18 +++++++++++++++++-
> 2 files changed, 18 insertions(+), 1 deletion(-)
>
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index 93a7e0e5380e..60250b579464 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -405,6 +405,7 @@ typedef struct NvmeCtrl {
>     uint32_t    max_q_ents;
>     uint8_t     outstanding_aers;
>     uint32_t    irq_status;
>+    int         cq_pending;
>     uint64_t    host_timestamp;                 /* Timestamp sent by the =
host */
>     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>     uint64_t    starttime_ms;
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 7dea64b72e6a..b8d4f9ce8532 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -473,7 +473,9 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue =
*cq)
>             return;
>         } else {
>             assert(cq->vector < 32);
>-            n->irq_status &=3D ~(1 << cq->vector);
>+            if (!n->cq_pending) {
>+                n->irq_status &=3D ~(1 << cq->vector);
>+            }
>             nvme_irq_check(n);
>         }
>     }
>@@ -1258,6 +1260,7 @@ static void nvme_post_cqes(void *opaque)
>     NvmeCQueue *cq =3D opaque;
>     NvmeCtrl *n =3D cq->ctrl;
>     NvmeRequest *req, *next;
>+    bool pending =3D cq->head !=3D cq->tail;
>     int ret;
>
>     QTAILQ_FOREACH_SAFE(req, &cq->req_list, entry, next) {
>@@ -1287,6 +1290,10 @@ static void nvme_post_cqes(void *opaque)
>         QTAILQ_INSERT_TAIL(&sq->req_list, req, entry);
>     }
>     if (cq->tail !=3D cq->head) {
>+        if (cq->irq_enabled && !pending) {
>+            n->cq_pending++;
>+        }
>+
>         nvme_irq_assert(n, cq);
>     }
> }
>@@ -4099,6 +4106,11 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeReques=
t *req)
>         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
>         return NVME_INVALID_QUEUE_DEL;
>     }
>+
>+    if (cq->irq_enabled && cq->tail !=3D cq->head) {
>+        n->cq_pending--;
>+    }
>+
>     nvme_irq_deassert(n, cq);
>     trace_pci_nvme_del_cq(qid);
>     nvme_free_cq(cq, n);
>@@ -5758,6 +5770,10 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
>         }
>
>         if (cq->tail =3D=3D cq->head) {
>+            if (cq->irq_enabled) {
>+                n->cq_pending--;
>+            }
>+
>             nvme_irq_deassert(n, cq);
>         }
>     } else {
>--=20
>2.32.0
>

Applied to nvme-next!

--FVPatJWiMmsyENUC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDarXEACgkQTeGvMW1P
Dekh0Qf/UpHPHqzqXUut6TSX7Z0OADoKYMJDNzb9kbfpPcYmC4FUP6UFjxuvjn7i
bZKYyi8sAvG4nda3l9HqW41hTksplNvWSr+gUGVi/PthouvcEa0t7ntlORHaxR6K
dc1Vw7BCAPHzQPrdI69wXgRvLUgicGLyCiaFYzANWVa6Z0O9PsgjqZjTSbie+d92
dhCQW1j2cQB1s1ByZ87kMV2bXfACU6phA+obr4BaL0ZdoKVrOIT4YEfBmuUg7xP3
EB9aM7U3VdGZDgKEh8P01cvq79RzsOQZr507VHYWl1yisk5uHPst4P3Bt6ezJDQ9
KSMqCD8mUoQN3xX37Vs+LjYItlruwA==
=LccA
-----END PGP SIGNATURE-----

--FVPatJWiMmsyENUC--

