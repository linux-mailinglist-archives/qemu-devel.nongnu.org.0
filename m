Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B594512643E
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:05:43 +0100 (CET)
Received: from localhost ([::1]:42076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwQv-0006EW-8h
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <k.jensen@samsung.com>) id 1ihvZ8-0001r1-Ji
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:10:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <k.jensen@samsung.com>) id 1ihvZ2-0007FB-S1
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:10:04 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47929)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <k.jensen@samsung.com>)
 id 1ihvYz-0006ZS-WB
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:09:58 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191219130946euoutp011a052721824e1744115eccb2d737db01~hx8NfKgoC1294812948euoutp01S
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 13:09:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191219130946euoutp011a052721824e1744115eccb2d737db01~hx8NfKgoC1294812948euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576760986;
 bh=znpmu+goHTDffx/79Yyl3+5RW25oQheLxhxE7SFDPdo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=PvDrWMVM/oKuyw9kw8qNJOrmUX4q5zc6ndYPkbzA/cJcUxUe3fnqs3xewATY4NddN
 RI+9bhT5UOd3H068vCOhyzN02povtR6Z3ErVJBOMOVSGWycaJi/7iSvKh2jOKHNkqW
 VnnfmqEheX9O1Xu6vBl5JiJv6yZZsJb1TvEVt+xY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191219130946eucas1p19b587cf88631ce3f7cc3a6ccec080bd1~hx8NN-9r-1797617976eucas1p1x;
 Thu, 19 Dec 2019 13:09:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 10.00.61286.A967BFD5; Thu, 19
 Dec 2019 13:09:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191219130945eucas1p1cfffc6af127586ee24746beccbe993fb~hx8M6Bs8X1176211762eucas1p1t;
 Thu, 19 Dec 2019 13:09:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191219130945eusmtrp2f47b6f228b06c992923ba70ca38c75a9~hx8M478T43120131201eusmtrp2G;
 Thu, 19 Dec 2019 13:09:45 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-6d-5dfb769afffd
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2C.4D.08375.9967BFD5; Thu, 19
 Dec 2019 13:09:45 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191219130945eusmtip287004718d673a3beda506834109ed941~hx8Mvk5Oy2680126801eusmtip2X;
 Thu, 19 Dec 2019 13:09:45 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) by
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) with Microsoft SMTP
 Server (TLS) id 15.0.1320.4; Thu, 19 Dec 2019 13:09:45 +0000
Received: from apples.local (106.110.32.41) by CAMSVWEXC01.scsc.local
 (106.1.227.71) with Microsoft SMTP Server id 15.0.1320.4 via Frontend
 Transport; Thu, 19 Dec 2019 13:09:44 +0000
From: Klaus Jensen <k.jensen@samsung.com>
To: <qemu-block@nongnu.org>
Subject: [PATCH v4 17/24] nvme: allow multiple aios per command
Date: Thu, 19 Dec 2019 14:09:14 +0100
Message-ID: <20191219130921.309264-18-k.jensen@samsung.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219130921.309264-1-k.jensen@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87qzyn7HGuyay26xub+d0WLSoWuM
 FksuplrMu6VsMetdO5vF8d4dLA5sHptWdbJ53Lm2h83jybXNTB7v911lC2CJ4rJJSc3JLEst
 0rdL4MrYfPoSU8HXy4wVL9v3szcwnp3H2MXIySEhYCKxtPMMSxcjF4eQwApGiTldz5kgnC+M
 Eh37r7JBOJ8ZJZavnM4C0zLh0AGoquWMEj2Xt7DAVd3v2cQI4ZxhlPg2cwVU2S5Giabn98D6
 2QQ0Jbb/+Q9miwhIS7RfncQKUsQscJ1R4tDvi+wgCWEBe4lja6+D2SwCqhJvn24Eu5dXwFpi
 xbE97BCHyEts/faJFcTmBIpv6b0NVSMocXLmE7AFzEA1zVtnM0PYEhIHX7xgBlkmIbCOXeLz
 6jtMEINcJN7vaIYaKizx6vgWKFtG4v/O+UwQDd2MEn0fvkJ1z2CUmL7sOzBwOIAca4m+MzkQ
 pqNE27ZsCJNP4sZbQYi9fBKTtk1nhgjzSnS0CUFMV5PY0bSVcQKj8iwkV89CcvUsJFcvYGRe
 xSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZhiTv87/mkH49dLSYcYBTgYlXh4HdJ+xwqx
 JpYVV+YeYpTgYFYS4b3d8TNWiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp2amp
 BalFMFkmDk6pBsbitYFrf8kWbLkp9fCt4oGeJb+PP521bPM13enGBoliaZKv/jek9l/flXXy
 +PaSFVcC2B9Yb2p4nXxpU6+Lm+htvaVRx/LO5zXtu+FpOuVn6yKJFGmvqb2vhV76PxX51HF9
 +4SZ07wPm0lHz1647e/PY3UV81tSdKO/aD/dH6+lqKkvkfFwuaasEktxRqKhFnNRcSIAm5Fg
 FS0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7ozy37HGpxaYGixub+d0WLSoWuM
 FksuplrMu6VsMetdO5vF8d4dLA5sHptWdbJ53Lm2h83jybXNTB7v911lC2CJ0rMpyi8tSVXI
 yC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MvYfPoSU8HXy4wVL9v3
 szcwnp3H2MXIySEhYCIx4dABpi5GLg4hgaWMEm0ntkIlZCQ+XfnIDmELS/y51sUGUfSRUeLJ
 69XMEM4ZRonrHavYQKqEBHYxSnw5mw9iswloSmz/858FxBYRkJZovzqJFaSBWeA6o8Sh3xfB
 xgoL2EscW3sdzGYRUJV4+3Qj2GpeAWuJFcf2QK2Wl9j67RMriM0JFN/Se5sRYpmVxOOfH1kg
 6gUlTs58AmYzA9U3b53NDGFLSBx88YJ5AqPwLCRls5CUzUJStoCReRWjSGppcW56brGhXnFi
 bnFpXrpecn7uJkZgnG079nPzDsZLG4MPMQpwMCrx8L5M/h0rxJpYVlyZe4hRgoNZSYT3dsfP
 WCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OB6aAvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFC
 AumJJanZqakFqUUwfUwcnFINjEoWOtYZP7/kt12/d9W9UmzyaZaKfWsrn78NDT6T9Mh1QuLn
 ScdKbkibhxyaqP7d92NB8VeR+ctjdh2q8rUVtXnXvftJZoLlpn23nxYtc1j5/t+dia3JOtY5
 OSuCHqx7wZ7OHLOiqPFqOfsKTp/PC/a76s335NK5ePv0qrs5fDz39p8uvVX957YSS3FGoqEW
 c1FxIgAAHwQAyQIAAA==
X-CMS-MailID: 20191219130945eucas1p1cfffc6af127586ee24746beccbe993fb
X-Msg-Generator: CA
X-RootMTR: 20191219130945eucas1p1cfffc6af127586ee24746beccbe993fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191219130945eucas1p1cfffc6af127586ee24746beccbe993fb
References: <20191219130921.309264-1-k.jensen@samsung.com>
 <CGME20191219130945eucas1p1cfffc6af127586ee24746beccbe993fb@eucas1p1.samsung.com>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 210.118.77.11
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:56:47 -0500
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This refactors how the device issues asynchronous block backend
requests. The NvmeRequest now holds a queue of NvmeAIOs that are
associated with the command. This allows multiple aios to be issued for
a command. Only when all requests have been completed will the device
post a completion queue entry.

Because the device is currently guaranteed to only issue a single aio
request per command, the benefit is not immediately obvious. But this
functionality is required to support metadata, the dataset management
command and other features.

Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 422 ++++++++++++++++++++++++++++++++++--------
 hw/block/nvme.h       | 126 +++++++++++--
 hw/block/trace-events |   8 +
 3 files changed, 461 insertions(+), 95 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index be554ae1e94c..56659bbe263a 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -19,7 +19,8 @@
  *      -drive file=3D<file>,if=3Dnone,id=3D<drive_id>
  *      -device nvme,drive=3D<drive_id>,serial=3D<serial>,id=3D<id[optio=
nal]>, \
  *              cmb_size_mb=3D<cmb_size_mb[optional]>, \
- *              num_queues=3D<N[optional]>
+ *              num_queues=3D<N[optional]>, \
+ *              mdts=3D<mdts[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -55,6 +56,7 @@
     } while (0)
=20
 static void nvme_process_sq(void *opaque);
+static void nvme_aio_cb(void *opaque, int ret);
=20
 static inline void *nvme_addr_to_cmb(NvmeCtrl *n, hwaddr addr)
 {
@@ -339,6 +341,116 @@ static uint16_t nvme_dma_prp(NvmeCtrl *n, uint8_t *=
ptr, uint32_t len,
     return status;
 }
=20
+static uint16_t nvme_map(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    NvmeNamespace *ns =3D req->ns;
+
+    uint32_t len =3D req->nlb << nvme_ns_lbads(ns);
+    uint64_t prp1 =3D le64_to_cpu(cmd->prp1);
+    uint64_t prp2 =3D le64_to_cpu(cmd->prp2);
+
+    return nvme_map_prp(n, &req->qsg, &req->iov, prp1, prp2, len, req);
+}
+
+static void nvme_aio_destroy(NvmeAIO *aio)
+{
+    g_free(aio);
+}
+
+static NvmeAIO *nvme_aio_new(BlockBackend *blk, int64_t offset, size_t l=
en,
+    QEMUSGList *qsg, QEMUIOVector *iov, NvmeRequest *req,
+    NvmeAIOCompletionFunc *cb)
+{
+    NvmeAIO *aio =3D g_malloc0(sizeof(*aio));
+
+    *aio =3D (NvmeAIO) {
+        .blk =3D blk,
+        .offset =3D offset,
+        .len =3D len,
+        .req =3D req,
+        .qsg =3D qsg,
+        .iov =3D iov,
+        .cb =3D cb,
+    };
+
+    return aio;
+}
+
+static inline void nvme_req_register_aio(NvmeRequest *req, NvmeAIO *aio,
+    NvmeAIOOp opc)
+{
+    aio->opc =3D opc;
+
+    trace_nvme_dev_req_register_aio(nvme_cid(req), aio, blk_name(aio->bl=
k),
+        aio->offset, aio->len, nvme_aio_opc_str(aio), req);
+
+    if (req) {
+        QTAILQ_INSERT_TAIL(&req->aio_tailq, aio, tailq_entry);
+    }
+}
+
+static void nvme_aio(NvmeAIO *aio)
+{
+    BlockBackend *blk =3D aio->blk;
+    BlockAcctCookie *acct =3D &aio->acct;
+    BlockAcctStats *stats =3D blk_get_stats(blk);
+
+    bool is_write, dma;
+
+    switch (aio->opc) {
+    case NVME_AIO_OPC_NONE:
+        break;
+
+    case NVME_AIO_OPC_FLUSH:
+        block_acct_start(stats, acct, 0, BLOCK_ACCT_FLUSH);
+        aio->aiocb =3D blk_aio_flush(blk, nvme_aio_cb, aio);
+        break;
+
+    case NVME_AIO_OPC_WRITE_ZEROES:
+        block_acct_start(stats, acct, aio->len, BLOCK_ACCT_WRITE);
+        aio->aiocb =3D blk_aio_pwrite_zeroes(blk, aio->offset, aio->len,
+            BDRV_REQ_MAY_UNMAP, nvme_aio_cb, aio);
+        break;
+
+    case NVME_AIO_OPC_READ:
+    case NVME_AIO_OPC_WRITE:
+        dma =3D aio->qsg !=3D NULL;
+        is_write =3D (aio->opc =3D=3D NVME_AIO_OPC_WRITE);
+
+        block_acct_start(stats, acct, aio->len,
+            is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ);
+
+        if (dma) {
+            aio->aiocb =3D is_write ?
+                dma_blk_write(blk, aio->qsg, aio->offset,
+                    BDRV_SECTOR_SIZE, nvme_aio_cb, aio) :
+                dma_blk_read(blk, aio->qsg, aio->offset,
+                    BDRV_SECTOR_SIZE, nvme_aio_cb, aio);
+
+            return;
+        }
+
+        aio->aiocb =3D is_write ?
+            blk_aio_pwritev(blk, aio->offset, aio->iov, 0,
+                nvme_aio_cb, aio) :
+            blk_aio_preadv(blk, aio->offset, aio->iov, 0,
+                nvme_aio_cb, aio);
+
+        break;
+    }
+}
+
+static void nvme_rw_aio(BlockBackend *blk, uint64_t offset, NvmeRequest =
*req)
+{
+    NvmeAIO *aio;
+    size_t len =3D req->qsg.nsg > 0 ? req->qsg.size : req->iov.size;
+
+    aio =3D nvme_aio_new(blk, offset, len, &req->qsg, &req->iov, req, NU=
LL);
+    nvme_req_register_aio(req, aio, nvme_req_is_write(req) ?
+        NVME_AIO_OPC_WRITE : NVME_AIO_OPC_READ);
+    nvme_aio(aio);
+}
+
 static void nvme_post_cqes(void *opaque)
 {
     NvmeCQueue *cq =3D opaque;
@@ -372,8 +484,16 @@ static void nvme_post_cqes(void *opaque)
 static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req=
)
 {
     assert(cq->cqid =3D=3D req->sq->cqid);
-    trace_nvme_dev_enqueue_req_completion(nvme_cid(req), cq->cqid,
-        req->status);
+    trace_nvme_dev_enqueue_req_completion(nvme_cid(req), cq->cqid, req->=
status);
+
+    if (req->qsg.nalloc) {
+        qemu_sglist_destroy(&req->qsg);
+    }
+
+    if (req->iov.nalloc) {
+        qemu_iovec_destroy(&req->iov);
+    }
+
     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
     timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
@@ -458,135 +578,259 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_=
t event_type)
     }
 }
=20
-static void nvme_rw_cb(void *opaque, int ret)
+static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len,
+    NvmeRequest *req)
+{
+    uint8_t mdts =3D n->params.mdts;
+
+    if (mdts && len > n->page_size << mdts) {
+        trace_nvme_dev_err_mdts(nvme_cid(req), n->page_size << mdts, len=
);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static inline uint16_t nvme_check_prinfo(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeRwCmd *rw =3D (NvmeRwCmd *) &req->cmd;
+    NvmeNamespace *ns =3D req->ns;
+
+    uint16_t ctrl =3D le16_to_cpu(rw->control);
+
+    if ((ctrl & NVME_RW_PRINFO_PRACT) && !(ns->id_ns.dps & DPS_TYPE_MASK=
)) {
+        trace_nvme_dev_err_prinfo(nvme_cid(req), ctrl);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static inline uint16_t nvme_check_bounds(NvmeCtrl *n, uint64_t slba,
+    uint32_t nlb, NvmeRequest *req)
+{
+    NvmeNamespace *ns =3D req->ns;
+    uint64_t nsze =3D le64_to_cpu(ns->id_ns.nsze);
+
+    if (unlikely((slba + nlb) > nsze)) {
+        block_acct_invalid(blk_get_stats(n->conf.blk),
+            nvme_req_is_write(req) ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ)=
;
+        trace_nvme_dev_err_invalid_lba_range(slba, nlb, nsze);
+        return NVME_LBA_RANGE | NVME_DNR;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns =3D req->ns;
+    size_t len =3D req->nlb << nvme_ns_lbads(ns);
+    uint16_t status;
+
+    status =3D nvme_check_mdts(n, len, req);
+    if (status) {
+        return status;
+    }
+
+    status =3D nvme_check_prinfo(n, req);
+    if (status) {
+        return status;
+    }
+
+    status =3D nvme_check_bounds(n, req->slba, req->nlb, req);
+    if (status) {
+        return status;
+    }
+
+    return NVME_SUCCESS;
+}
+
+static void nvme_rw_cb(NvmeRequest *req, void *opaque)
 {
-    NvmeRequest *req =3D opaque;
     NvmeSQueue *sq =3D req->sq;
     NvmeCtrl *n =3D sq->ctrl;
     NvmeCQueue *cq =3D n->cq[sq->cqid];
=20
+    trace_nvme_dev_rw_cb(nvme_cid(req), req->cmd.nsid);
+
+    nvme_enqueue_req_completion(cq, req);
+}
+
+static void nvme_aio_cb(void *opaque, int ret)
+{
+    NvmeAIO *aio =3D opaque;
+    NvmeRequest *req =3D aio->req;
+
+    BlockBackend *blk =3D aio->blk;
+    BlockAcctCookie *acct =3D &aio->acct;
+    BlockAcctStats *stats =3D blk_get_stats(blk);
+
+    Error *local_err =3D NULL;
+
+    trace_nvme_dev_aio_cb(nvme_cid(req), aio, blk_name(blk), aio->offset=
,
+        nvme_aio_opc_str(aio), req);
+
+    if (req) {
+        QTAILQ_REMOVE(&req->aio_tailq, aio, tailq_entry);
+    }
+
     if (!ret) {
-        block_acct_done(blk_get_stats(n->conf.blk), &req->acct);
-        req->status =3D NVME_SUCCESS;
+        block_acct_done(stats, acct);
+
+        if (aio->cb) {
+            aio->cb(aio, aio->cb_arg);
+        }
     } else {
-        block_acct_failed(blk_get_stats(n->conf.blk), &req->acct);
-        req->status =3D NVME_INTERNAL_DEV_ERROR;
-    }
+        block_acct_failed(stats, acct);
+
+        if (req) {
+            uint16_t status;
+
+            switch (aio->opc) {
+            case NVME_AIO_OPC_READ:
+                status =3D NVME_UNRECOVERED_READ;
+                break;
+            case NVME_AIO_OPC_WRITE:
+            case NVME_AIO_OPC_WRITE_ZEROES:
+                status =3D NVME_WRITE_FAULT;
+                break;
+            default:
+                status =3D NVME_INTERNAL_DEV_ERROR;
+                break;
+            }
=20
-    if (req->qsg.nalloc) {
-        qemu_sglist_destroy(&req->qsg);
+            trace_nvme_dev_err_aio(nvme_cid(req), aio, blk_name(blk),
+                aio->offset, nvme_aio_opc_str(aio), req, status);
+
+            error_setg_errno(&local_err, -ret, "aio failed");
+            error_report_err(local_err);
+
+            /*
+             * An Internal Error trumps all other errors. For other erro=
rs,
+             * only set the first error encountered. Any additional erro=
rs will
+             * be recorded in the error information log page.
+             */
+            if (!req->status ||
+                nvme_status_is_error(status, NVME_INTERNAL_DEV_ERROR)) {
+                req->status =3D status;
+            }
+        }
     }
-    if (req->iov.nalloc) {
-        qemu_iovec_destroy(&req->iov);
+
+    if (req && QTAILQ_EMPTY(&req->aio_tailq)) {
+        if (req->cb) {
+            req->cb(req, req->cb_arg);
+        } else {
+            NvmeSQueue *sq =3D req->sq;
+            NvmeCtrl *n =3D sq->ctrl;
+            NvmeCQueue *cq =3D n->cq[sq->cqid];
+
+            nvme_enqueue_req_completion(cq, req);
+        }
     }
=20
-    nvme_enqueue_req_completion(cq, req);
+    nvme_aio_destroy(aio);
 }
=20
-static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
-    block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
-         BLOCK_ACCT_FLUSH);
-    req->aiocb =3D blk_aio_flush(n->conf.blk, nvme_rw_cb, req);
+    NvmeAIO *aio =3D nvme_aio_new(n->conf.blk, 0x0, 0, NULL, NULL, req, =
NULL);
+
+    nvme_req_register_aio(req, aio, NVME_AIO_OPC_FLUSH);
+    nvme_aio(aio);
=20
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd=
 *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
 {
-    NvmeRwCmd *rw =3D (NvmeRwCmd *)cmd;
-    const uint8_t lba_index =3D NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    const uint8_t data_shift =3D ns->id_ns.lbaf[lba_index].ds;
-    uint64_t slba =3D le64_to_cpu(rw->slba);
-    uint32_t nlb  =3D le16_to_cpu(rw->nlb) + 1;
-    uint64_t offset =3D slba << data_shift;
-    uint32_t count =3D nlb << data_shift;
+    NvmeAIO *aio;
=20
-    if (unlikely(slba + nlb > ns->id_ns.nsze)) {
-        trace_nvme_dev_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return NVME_LBA_RANGE | NVME_DNR;
+    NvmeNamespace *ns =3D req->ns;
+    NvmeRwCmd *rw =3D (NvmeRwCmd *) cmd;
+
+    int64_t offset;
+    size_t count;
+    uint16_t status;
+
+    req->slba =3D le64_to_cpu(rw->slba);
+    req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
+
+    trace_nvme_dev_write_zeros(nvme_cid(req), le32_to_cpu(cmd->nsid),
+        req->slba, req->nlb);
+
+    status =3D nvme_check_bounds(n, req->slba, req->nlb, req);
+    if (unlikely(status)) {
+        block_acct_invalid(blk_get_stats(n->conf.blk), BLOCK_ACCT_WRITE)=
;
+        return status;
     }
=20
-    block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
-                     BLOCK_ACCT_WRITE);
-    req->aiocb =3D blk_aio_pwrite_zeroes(n->conf.blk, offset, count,
-                                        BDRV_REQ_MAY_UNMAP, nvme_rw_cb, =
req);
+    offset =3D req->slba << nvme_ns_lbads(ns);
+    count =3D req->nlb << nvme_ns_lbads(ns);
+
+    aio =3D nvme_aio_new(n->conf.blk, offset, count, NULL, NULL, req, NU=
LL);
+
+    nvme_req_register_aio(req, aio, NVME_AIO_OPC_WRITE_ZEROES);
+    nvme_aio(aio);
+
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
-    NvmeRwCmd *rw =3D (NvmeRwCmd *)cmd;
-    uint32_t nlb  =3D le32_to_cpu(rw->nlb) + 1;
-    uint64_t slba =3D le64_to_cpu(rw->slba);
-    uint64_t prp1 =3D le64_to_cpu(rw->prp1);
-    uint64_t prp2 =3D le64_to_cpu(rw->prp2);
+    NvmeRwCmd *rw =3D (NvmeRwCmd *) cmd;
+    NvmeNamespace *ns =3D req->ns;
+    int status;
+
+    enum BlockAcctType acct =3D
+        nvme_req_is_write(req) ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ;
=20
-    uint8_t lba_index  =3D NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    uint8_t data_shift =3D ns->id_ns.lbaf[lba_index].ds;
-    uint64_t data_size =3D (uint64_t)nlb << data_shift;
-    uint64_t data_offset =3D slba << data_shift;
-    int is_write =3D rw->opcode =3D=3D NVME_CMD_WRITE ? 1 : 0;
-    enum BlockAcctType acct =3D is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT=
_READ;
+    req->nlb  =3D le16_to_cpu(rw->nlb) + 1;
+    req->slba =3D le64_to_cpu(rw->slba);
=20
-    trace_nvme_dev_rw(is_write ? "write" : "read", nlb, data_size, slba)=
;
+    trace_nvme_dev_rw(nvme_req_is_write(req) ? "write" : "read", req->nl=
b,
+        req->nlb << nvme_ns_lbads(req->ns), req->slba);
=20
-    if (unlikely((slba + nlb) > ns->id_ns.nsze)) {
+    status =3D nvme_check_rw(n, req);
+    if (status) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
-        trace_nvme_dev_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
-        return NVME_LBA_RANGE | NVME_DNR;
+        return status;
     }
=20
-    if (nvme_map_prp(n, &req->qsg, &req->iov, prp1, prp2, data_size, req=
)) {
+    status =3D nvme_map(n, cmd, req);
+    if (status) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
-        return NVME_INVALID_FIELD | NVME_DNR;
+        return status;
     }
=20
-    if (req->qsg.nsg > 0) {
-        block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->qs=
g.size,
-            acct);
-
-        req->aiocb =3D is_write ?
-            dma_blk_write(n->conf.blk, &req->qsg, data_offset, BDRV_SECT=
OR_SIZE,
-                          nvme_rw_cb, req) :
-            dma_blk_read(n->conf.blk, &req->qsg, data_offset, BDRV_SECTO=
R_SIZE,
-                         nvme_rw_cb, req);
-    } else {
-        block_acct_start(blk_get_stats(n->conf.blk), &req->acct, req->io=
v.size,
-            acct);
-
-        req->aiocb =3D is_write ?
-            blk_aio_pwritev(n->conf.blk, data_offset, &req->iov, 0, nvme=
_rw_cb,
-                            req) :
-            blk_aio_preadv(n->conf.blk, data_offset, &req->iov, 0, nvme_=
rw_cb,
-                           req);
-    }
+    nvme_rw_aio(n->conf.blk, req->slba << nvme_ns_lbads(ns), req);
+    nvme_req_set_cb(req, nvme_rw_cb, NULL);
=20
     return NVME_NO_COMPLETE;
 }
=20
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 {
-    NvmeNamespace *ns;
     uint32_t nsid =3D le32_to_cpu(cmd->nsid);
=20
+    trace_nvme_dev_io_cmd(nvme_cid(req), nsid, le16_to_cpu(req->sq->sqid=
), cmd->opcode);
+
     if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
         trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
-    ns =3D &n->namespaces[nsid - 1];
+    req->ns =3D &n->namespaces[nsid - 1];
+
     switch (cmd->opcode) {
     case NVME_CMD_FLUSH:
-        return nvme_flush(n, ns, cmd, req);
+        return nvme_flush(n, cmd, req);
     case NVME_CMD_WRITE_ZEROS:
-        return nvme_write_zeros(n, ns, cmd, req);
+        return nvme_write_zeros(n, cmd, req);
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
-        return nvme_rw(n, ns, cmd, req);
+        return nvme_rw(n, cmd, req);
     default:
         trace_nvme_dev_err_invalid_opc(cmd->opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
@@ -610,6 +854,7 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeCmd *cmd=
)
     NvmeRequest *req, *next;
     NvmeSQueue *sq;
     NvmeCQueue *cq;
+    NvmeAIO *aio;
     uint16_t qid =3D le16_to_cpu(c->qid);
=20
     if (unlikely(!qid || nvme_check_sqid(n, qid))) {
@@ -622,8 +867,11 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeCmd *cm=
d)
     sq =3D n->sq[qid];
     while (!QTAILQ_EMPTY(&sq->out_req_list)) {
         req =3D QTAILQ_FIRST(&sq->out_req_list);
-        assert(req->aiocb);
-        blk_aio_cancel(req->aiocb);
+        while (!QTAILQ_EMPTY(&req->aio_tailq)) {
+            aio =3D QTAILQ_FIRST(&req->aio_tailq);
+            assert(aio->aiocb);
+            blk_aio_cancel(aio->aiocb);
+        }
     }
     if (!nvme_check_cqid(n, sq->cqid)) {
         cq =3D n->cq[sq->cqid];
@@ -660,6 +908,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n,=
 uint64_t dma_addr,
     QTAILQ_INIT(&sq->out_req_list);
     for (i =3D 0; i < sq->size; i++) {
         sq->io_req[i].sq =3D sq;
+        QTAILQ_INIT(&(sq->io_req[i].aio_tailq));
         QTAILQ_INSERT_TAIL(&(sq->req_list), &sq->io_req[i], entry);
     }
     sq->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_process_sq, sq);
@@ -798,6 +1047,7 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *c=
md, NvmeRequest *req)
     uint32_t numdl, numdu;
     uint64_t off, lpol, lpou;
     size_t   len;
+    uint16_t status;
=20
     numdl =3D (dw10 >> 16);
     numdu =3D (dw11 & 0xffff);
@@ -813,6 +1063,11 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *=
cmd, NvmeRequest *req)
=20
     trace_nvme_dev_get_log(nvme_cid(req), lid, lsp, rae, len, off);
=20
+    status =3D nvme_check_mdts(n, len, req);
+    if (status) {
+        return status;
+    }
+
     switch (lid) {
     case NVME_LOG_ERROR_INFO:
         if (!rae) {
@@ -1346,7 +1601,9 @@ static void nvme_process_sq(void *opaque)
         req =3D QTAILQ_FIRST(&sq->req_list);
         QTAILQ_REMOVE(&sq->req_list, req, entry);
         QTAILQ_INSERT_TAIL(&sq->out_req_list, req, entry);
-        memset(&req->cqe, 0, sizeof(req->cqe));
+
+        nvme_req_clear(req);
+
         req->cqe.cid =3D cmd.cid;
         memcpy(&req->cmd, &cmd, sizeof(NvmeCmd));
=20
@@ -1926,6 +2183,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->ieee[0] =3D 0x00;
     id->ieee[1] =3D 0x02;
     id->ieee[2] =3D 0xb3;
+    id->mdts =3D params->mdts;
     id->ver =3D cpu_to_le32(NVME_SPEC_VER);
     id->oacs =3D cpu_to_le16(0);
=20
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index d27baa9d5391..2fe3e7b415c2 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -8,7 +8,8 @@
     DEFINE_PROP_UINT32("cmb_size_mb", _state, _props.cmb_size_mb, 0), \
     DEFINE_PROP_UINT32("num_queues", _state, _props.num_queues, 64), \
     DEFINE_PROP_UINT8("aerl", _state, _props.aerl, 3), \
-    DEFINE_PROP_UINT32("aer_max_queued", _state, _props.aer_max_queued, =
64)
+    DEFINE_PROP_UINT32("aer_max_queued", _state, _props.aer_max_queued, =
64), \
+    DEFINE_PROP_UINT8("mdts", _state, _props.mdts, 7)
=20
 typedef struct NvmeParams {
     char     *serial;
@@ -16,6 +17,7 @@ typedef struct NvmeParams {
     uint32_t cmb_size_mb;
     uint8_t  aerl;
     uint32_t aer_max_queued;
+    uint8_t  mdts;
 } NvmeParams;
=20
 typedef struct NvmeAsyncEvent {
@@ -23,17 +25,50 @@ typedef struct NvmeAsyncEvent {
     NvmeAerResult result;
 } NvmeAsyncEvent;
=20
-typedef struct NvmeRequest {
-    struct NvmeSQueue       *sq;
-    BlockAIOCB              *aiocb;
-    uint16_t                status;
-    NvmeCqe                 cqe;
-    BlockAcctCookie         acct;
-    QEMUSGList              qsg;
-    QEMUIOVector            iov;
-    NvmeCmd                 cmd;
-    QTAILQ_ENTRY(NvmeRequest)entry;
-} NvmeRequest;
+typedef struct NvmeRequest NvmeRequest;
+typedef void NvmeRequestCompletionFunc(NvmeRequest *req, void *opaque);
+
+struct NvmeRequest {
+    struct NvmeSQueue    *sq;
+    struct NvmeNamespace *ns;
+
+    NvmeCqe  cqe;
+    NvmeCmd  cmd;
+    uint16_t status;
+
+    uint64_t slba;
+    uint32_t nlb;
+
+    QEMUSGList   qsg;
+    QEMUIOVector iov;
+
+    NvmeRequestCompletionFunc *cb;
+    void                      *cb_arg;
+
+    QTAILQ_HEAD(, NvmeAIO)    aio_tailq;
+    QTAILQ_ENTRY(NvmeRequest) entry;
+};
+
+static inline void nvme_req_clear(NvmeRequest *req)
+{
+    req->ns =3D NULL;
+    memset(&req->cqe, 0, sizeof(req->cqe));
+    req->status =3D NVME_SUCCESS;
+    req->slba =3D req->nlb =3D 0x0;
+    req->cb =3D req->cb_arg =3D NULL;
+}
+
+static inline void nvme_req_set_cb(NvmeRequest *req,
+    NvmeRequestCompletionFunc *cb, void *cb_arg)
+{
+    req->cb =3D cb;
+    req->cb_arg =3D cb_arg;
+}
+
+static inline void nvme_req_clear_cb(NvmeRequest *req)
+{
+    req->cb =3D req->cb_arg =3D NULL;
+}
=20
 typedef struct NvmeSQueue {
     struct NvmeCtrl *ctrl;
@@ -85,6 +120,60 @@ static inline size_t nvme_ns_lbads_bytes(NvmeNamespac=
e *ns)
     return 1 << nvme_ns_lbads(ns);
 }
=20
+typedef enum NvmeAIOOp {
+    NVME_AIO_OPC_NONE         =3D 0x0,
+    NVME_AIO_OPC_FLUSH        =3D 0x1,
+    NVME_AIO_OPC_READ         =3D 0x2,
+    NVME_AIO_OPC_WRITE        =3D 0x3,
+    NVME_AIO_OPC_WRITE_ZEROES =3D 0x4,
+} NvmeAIOOp;
+
+typedef struct NvmeAIO NvmeAIO;
+typedef void NvmeAIOCompletionFunc(NvmeAIO *aio, void *opaque);
+
+struct NvmeAIO {
+    NvmeRequest *req;
+
+    NvmeAIOOp       opc;
+    int64_t         offset;
+    size_t          len;
+    BlockBackend    *blk;
+    BlockAIOCB      *aiocb;
+    BlockAcctCookie acct;
+
+    NvmeAIOCompletionFunc *cb;
+    void                  *cb_arg;
+
+    QEMUSGList   *qsg;
+    QEMUIOVector *iov;
+
+    QTAILQ_ENTRY(NvmeAIO) tailq_entry;
+};
+
+static inline const char *nvme_aio_opc_str(NvmeAIO *aio)
+{
+    switch (aio->opc) {
+    case NVME_AIO_OPC_NONE:         return "NVME_AIO_OP_NONE";
+    case NVME_AIO_OPC_FLUSH:        return "NVME_AIO_OP_FLUSH";
+    case NVME_AIO_OPC_READ:         return "NVME_AIO_OP_READ";
+    case NVME_AIO_OPC_WRITE:        return "NVME_AIO_OP_WRITE";
+    case NVME_AIO_OPC_WRITE_ZEROES: return "NVME_AIO_OP_WRITE_ZEROES";
+    default:                        return "NVME_AIO_OP_UNKNOWN";
+    }
+}
+
+static inline bool nvme_req_is_write(NvmeRequest *req)
+{
+    switch (req->cmd.opcode) {
+    case NVME_CMD_WRITE:
+    case NVME_CMD_WRITE_UNCOR:
+    case NVME_CMD_WRITE_ZEROS:
+        return true;
+    default:
+        return false;
+    }
+}
+
 #define TYPE_NVME "nvme"
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
@@ -139,10 +228,21 @@ static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, N=
vmeNamespace *ns)
 static inline uint16_t nvme_cid(NvmeRequest *req)
 {
     if (req) {
-        return le16_to_cpu(req->cqe.cid);
+        return le16_to_cpu(req->cmd.cid);
     }
=20
     return 0xffff;
 }
=20
+static inline bool nvme_status_is_error(uint16_t status, uint16_t err)
+{
+    /* strip DNR and MORE */
+    return (status & 0xfff) =3D=3D err;
+}
+
+static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
+{
+    return req->sq->ctrl;
+}
+
 #endif /* HW_NVME_H */
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 77aa0da99ee0..90a57fb6099a 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -34,7 +34,12 @@ nvme_dev_irq_pin(void) "pulsing IRQ pin"
 nvme_dev_irq_masked(void) "IRQ is masked"
 nvme_dev_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=3D0x%"PR=
Ix64" prp2=3D0x%"PRIx64""
 nvme_dev_map_prp(uint16_t cid, uint8_t opc, uint64_t trans_len, uint32_t=
 len, uint64_t prp1, uint64_t prp2, int num_prps) "cid %"PRIu16" opc 0x%"=
PRIx8" trans_len %"PRIu64" len %"PRIu32" prp1 0x%"PRIx64" prp2 0x%"PRIx64=
" num_prps %d"
+nvme_dev_req_register_aio(uint16_t cid, void *aio, const char *blkname, =
uint64_t offset, uint64_t count, const char *opc, void *req) "cid %"PRIu1=
6" aio %p blk \"%s\" offset %"PRIu64" count %"PRIu64" opc \"%s\" req %p"
+nvme_dev_aio_cb(uint16_t cid, void *aio, const char *blkname, uint64_t o=
ffset, const char *opc, void *req) "cid %"PRIu16" aio %p blk \"%s\" offse=
t %"PRIu64" opc \"%s\" req %p"
+nvme_dev_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opco=
de) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8""
 nvme_dev_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, u=
int64_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
+nvme_dev_rw_cb(uint16_t cid, uint32_t nsid) "cid %"PRIu16" nsid %"PRIu32=
""
+nvme_dev_write_zeros(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_=
t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
 nvme_dev_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t=
 qsize, uint16_t qflags) "create submission queue, addr=3D0x%"PRIx64", sq=
id=3D%"PRIu16", cqid=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"PRIu16""
 nvme_dev_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16=
_t size, uint16_t qflags, int ien) "create completion queue, addr=3D0x%"P=
RIx64", cqid=3D%"PRIu16", vector=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D=
%"PRIu16", ien=3D%d"
 nvme_dev_del_sq(uint16_t qid) "deleting submission queue sqid=3D%"PRIu16=
""
@@ -75,6 +80,9 @@ nvme_dev_mmio_shutdown_set(void) "shutdown bit set"
 nvme_dev_mmio_shutdown_cleared(void) "shutdown bit cleared"
=20
 # nvme traces for error conditions
+nvme_dev_err_mdts(uint16_t cid, size_t mdts, size_t len) "cid %"PRIu16" =
mdts %"PRIu64" len %"PRIu64""
+nvme_dev_err_prinfo(uint16_t cid, uint16_t ctrl) "cid %"PRIu16" ctrl %"P=
RIu16""
+nvme_dev_err_aio(uint16_t cid, void *aio, const char *blkname, uint64_t =
offset, const char *opc, void *req, uint16_t status) "cid %"PRIu16" aio %=
p blk \"%s\" offset %"PRIu64" opc \"%s\" req %p status 0x%"PRIx16""
 nvme_dev_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
 nvme_dev_err_invalid_prplist_ent(uint64_t prplist) "PRP list entry is nu=
ll or not page aligned: 0x%"PRIx64""
 nvme_dev_err_invalid_prp2_align(uint64_t prp2) "PRP2 is not page aligned=
: 0x%"PRIx64""
--=20
2.24.1


