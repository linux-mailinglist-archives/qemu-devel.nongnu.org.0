Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04A23AB156
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:28:36 +0200 (CEST)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltpGF-0002t7-MA
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltoxv-0007m4-Cw; Thu, 17 Jun 2021 06:09:42 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltoxt-0008CM-Ll; Thu, 17 Jun 2021 06:09:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 889B65C0196;
 Thu, 17 Jun 2021 06:09:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 06:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=n2b9yGdnLJvyxNiFmX/Spt6EeyH
 XPYiZ4mOQaOSKcLw=; b=duwLnWoqQR5k0RSKtKHeUsOoWM0+qIbEP6psX7lDNTi
 l73wpqxIF6Dm1Uzar9SDcTqIgD9juD4f2Yr14im7GoXCI08+BRrqlfTycEPiqgz3
 Vl32Np5MCECgtSVtPZPkhc5vHVibI46oN+fEkmJSSeNHL1zrSRfdV7UiOx7V+yZh
 BWmWYarVlhbDnnFPCyErIQq14i20Iog4tqWfKrSKMI0giC0dOqhGYyL3pyco64JC
 sgf4XDwmsQ574DfMLIwHy6VFJaBaLltwypO0ifQvimjKn+HgL7q1loZ13x9TVM8u
 HKMGxaqvSkHg9S+3LEpGyZmeODa3/VdpK2deuOYJQ1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=n2b9yG
 dnLJvyxNiFmX/Spt6EeyHXPYiZ4mOQaOSKcLw=; b=INaQ+W9Q7k7bmG9qXf3Sv+
 iJH+5a8vEbUu7Fkr6JYbm8OZjzi3BEiMCknYAnNbyMK8ejJLdDpqFK7ibGdoA7Rr
 xUEnce+wrU0rlQxFh6X8CkfK5XUqdEPHyUENgo7pUdV0/rpNjAniXy6trNwpBb3P
 trQxIci8dD8+/UbldFn4odSiLPjB7FK+Tt2zeBXcC9r7egxETNJki0PhWU5ZXMwx
 MlrgiOLtXDG7t9GgNUjxvp0RLszXMc1OMkB8RKRWhZCb6KcY7L5UE0DTkSLpVKvC
 +3Sw1a/LGRJg+JTDcAyMEuO93c4sNcdlInRgtDilNTvSsY+/3e1wCOv6YShDOBKg
 ==
X-ME-Sender: <xms:Xx_LYAAOL3I6Z2cMEGh3Vo19OKDb1SDGEuKeNSV9i1Q07Orr1l3Dgw>
 <xme:Xx_LYCgSkxTtR5QsZlssbECINYvDmiDLVZZECV3PoUQ-X09IkmqaqmqwbolmHaXt0
 eRKV8s1AEOyFPzbQfc>
X-ME-Received: <xmr:Xx_LYDkDL0mAbUXLcJkJ1dK42XIqVjRnqI6YXXlVt-YabMPZVVsMSt_K6LDz4wnwH4hbK5X0XYlw00dwnoV8g1DmgfjWcSDcZGDcuoKtnXjf_N2bpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Xx_LYGwBWRHsj8bvnVVSbxQKHVG8CcbHghtCNGnWfalINIpOJxq7vQ>
 <xmx:Xx_LYFRnAI61FxAzgFttB3wBquNjC0KLxlHWieMS1XBNe1SavwlVSQ>
 <xmx:Xx_LYBYTWG0Ucp2WVSTDV7gQjvI4BxRhluoll4f0Z5BOn1CHWSJr-A>
 <xmx:YB_LYDNdGDnMlzQy_kqU5NtisahPkoSNuuO-H94gRyGOvUYO4jUukg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 06:09:34 -0400 (EDT)
Date: Thu, 17 Jun 2021 12:09:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix pin-based interrupt behavior (again)
Message-ID: <YMsfXG+SeYuMvHlt@apples.localdomain>
References: <20210617100820.75510-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cYNP9iS2xZ4YTY0Q"
Content-Disposition: inline
In-Reply-To: <20210617100820.75510-1-its@irrelevant.dk>
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cYNP9iS2xZ4YTY0Q
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 17 12:08, Klaus Jensen wrote:
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
> hw/nvme/nvme.h |  1 +
> hw/nvme/ctrl.c | 15 ++++++++++++++-
> 2 files changed, 15 insertions(+), 1 deletion(-)
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
>index 7dea64b72e6a..9419f67c4e88 100644
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
>+        if (!pending) {
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
>+    if (cq->tail !=3D cq->head) {
>+        n->cq_pending--;
>+    }
>+
>     nvme_irq_deassert(n, cq);
>     trace_pci_nvme_del_cq(qid);
>     nvme_free_cq(cq, n);
>@@ -5758,6 +5770,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr=
, int val)
>         }
>
>         if (cq->tail =3D=3D cq->head) {
>+            n->cq_pending--;
>             nvme_irq_deassert(n, cq);
>         }
>     } else {
>--=20
>2.32.0
>

Jakub, can you test this in your environment?

--cYNP9iS2xZ4YTY0Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDLH1sACgkQTeGvMW1P
DenCXgf/aB9XsZS+nJ285nye1Q+KgV5B2v0xqbrplkKp9MDuDPTzJXe2dS8j1bKb
FIqSSl2TeaFtmbyQN8kiWrcmcc+l5bCRP2fxgV98+h2TOmcVuCI4DuxyR+yrxoi3
trVuR+wJ1gfToE8SHp8HcuPDhQIp+ToKLJ09Jpy0vNZoX5imCmRZRtQMZV3KhGRm
dFPg5nSIP/sl6PAOgByJQ8TeaGFBMQclgv6H5S+wqEMWPlmMaUaiq2dUidfMSZWi
YFBK6zTrx8FhgSae/kju3+vPubKh9Y6AEftTA2U3bsPA1aXKUncacBZmjePM04gi
YtV4gEJhBTtSHfdGhPA5Jo51ak/2Ng==
=vdGO
-----END PGP SIGNATURE-----

--cYNP9iS2xZ4YTY0Q--

