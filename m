Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA463B6741
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:07:23 +0200 (CEST)
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxujB-0003tQ-Qn
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxueK-0002HS-4F; Mon, 28 Jun 2021 13:02:20 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxueG-0002JK-Fv; Mon, 28 Jun 2021 13:02:19 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 51DE75C00E6;
 Mon, 28 Jun 2021 13:02:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Jun 2021 13:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4s97CDKOsoto/eHc/yKiW+9YrEy
 ECx/ajrowOeYFKYM=; b=Di/RjXPiwlMLL3BnqNZgwZ+bWWL059MFYguahDk3a6b
 IWyfuplMQSv/Cqv9OAJv9l5/uMCegyAAcsZLtKqOPpGbGYnbmG1ERX5A2+goCNWy
 mw8YpYo7bTYxdQbeCusmHDSUq1/glXb+LP5n7QlrDCSxYHrjV3wgUm9YgkusCy/z
 bEZG7ZsVyqyD5P4QEFju4xpBV9X0bBSxEsKKopfE4KieC9+aXWjxyAjblMzTmOjg
 a8Y6pEvoU4+sLmFoYstO/QrW/SuRng/gaI5M3ltkrEddn1MBYNmQ0aaxFbhqzdlD
 ID0JhoEF1KYhtMfVndhBKy8bDHuRVBqFDpklc8Eurew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4s97CD
 KOsoto/eHc/yKiW+9YrEyECx/ajrowOeYFKYM=; b=f59jVfy6Xjb5tJyk4zdwCW
 DDP2mHC0XvWpdPNFajlV9iz9h9GnCQGG0g7SjGquq/2XDKGQXibddIqS4iTgbMoS
 JA5lCRVsiK4l0HzCXruTMGrMSlaa9/FmERaQUfoyDzeUR/3lbjxYEhOa0um5484p
 6KlA7iI9AyDlhmAzOT1xw9O+QF+pZxpeBzuDoiuKTZE3/MFwU0LT6M0lDxjCqY98
 lJhU/AdeTXSkuUhyLbRSoR3bFkoRGXtAC19PvtZpcQzXXDPMVc4Vz47z8ogI+6T9
 JR5ZhtUoFaxP2Zob0Hd5UrjrXm273NOCiC1OIKGl2STxyszL2L3hYb1CeXaIDnqQ
 ==
X-ME-Sender: <xms:lQDaYI3SowN4ZB-S6-2_AHw6vGQ9Xt9dnC7-DrQ_xfrLruqPqiQhkw>
 <xme:lQDaYDFw3WMEF-3nMOv-nzZ1BgSS9t0du2Db46J67NIhp0TKGUISp5BopV2xF7yOQ
 5MrrRdy0OuN8rv5LhM>
X-ME-Received: <xmr:lQDaYA4joVpTislcvMUovxyXUFRWcBjNZm-ebSg6dHnQSphgkJE131L43RI7zpB38idoVdHsmVK9QQ3I81d5QEl7LptYk9kl1L7SVuRkn-jJQPD00A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lQDaYB3t5RXr14Fb19otP1BMtaRQ5bxC4eq_J5y2zXjNlhQFYaCcXw>
 <xmx:lQDaYLHH7d4GKRttaJc-ykHW6ICu3YMNiflA6KI6yb54KTGqaKgihA>
 <xmx:lQDaYK-ouaI6xoHU01yyginDK2GzX71GzcW2wuY_jW8wTF8j_uCW7g>
 <xmx:lgDaYPiEZdjcBOy8_EJPIMIIzLbq4WS3nvqa6fC2lM2lA2t2PW-f9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:02:11 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:02:09 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <YNoAkfcgpu+iU/VZ@apples.localdomain>
References: <20210617185542.106252-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7i9Qz01P2VKTXCdQ"
Content-Disposition: inline
In-Reply-To: <20210617185542.106252-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7i9Qz01P2VKTXCdQ
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

Bump :)

--7i9Qz01P2VKTXCdQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAJAACgkQTeGvMW1P
Delq/Af8DEqRJUaXAheStFbPjY6u7bu/3vn0exj0n/27qx6o9nKjFRxktWkwSxXh
xUiPQzMnQxKMOMp28B5i5tO3xpRupKDxyP5e7ZKAJKudOiayIVOGYXm5KHS0BAfm
0Km/bffMUxg99OCxBSNvjhAkdOQGdMMAdI3cEp2F+gaC5l0hb6+tmXKAIx4AIZ9a
3SE7RX/vp0CDKF3wyF+BL1D6wvcapPdge6+IvMJn2sN2XzFnnnF+Y1trlFtEGxgD
doPMofwvL0eA25bu17FddFwsOezQ0Ak5oUA+cg08kxCUT2eWFZw1k6IZTDurXhWE
ztxR0CmegzjRo9aXEokVPD/AKCp0Og==
=yrng
-----END PGP SIGNATURE-----

--7i9Qz01P2VKTXCdQ--

