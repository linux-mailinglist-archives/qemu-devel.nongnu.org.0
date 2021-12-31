Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A14823E6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:03:23 +0100 (CET)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Gcz-0002Cf-Tr
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:03:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPy-000357-G4
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPv-0000LB-2a
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zc7qbwDFORfvzaOFgdWHz84wTbYxgE4ItWWUjM2vJzI=;
 b=Rh9dzfnBKPx1YxLpE5Ax887lAOfXg5d8Cpjwd1MJmE6SNPYtUMKRjdsqI7aQjDRWqNVYJD
 qUzFELR1hGJcNDG/r+k6ZeCUpeDlKdNMHeZszmwlfzVItg+MWunT2jJh535FNEZ1FSoKTM
 gmBFclw6RP/C7kC0J8mEI1JlpHf3eaI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-7yhs7o33N8e57s5Roo2iXw-1; Fri, 31 Dec 2021 06:49:33 -0500
X-MC-Unique: 7yhs7o33N8e57s5Roo2iXw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r7-20020adfbb07000000b001a254645f13so7529183wrg.7
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zc7qbwDFORfvzaOFgdWHz84wTbYxgE4ItWWUjM2vJzI=;
 b=btpSJHnozcgCMMEYwF+RYU8ZmSIkBR6aZU7CTHyLrZ3ArmdOvD87pmLZU4wo0B+cyM
 GvvwOh5/J6/N+YgL2lWI6XKbOe1/085MoOw6WbBv7HXkTR7H7GAMuXNGxHHeT9TtlUM8
 paasiUOVhHPQIV+5RnWSJM/Pa/qI7eWJzdTHQxnVWt6yuBKag8o8L+ImU/aA8yGKRnIQ
 8Rih6UBQaieY6G9WR8r7AB8Gq1liUEibPGhaz8AS8GuTMs0WmtwgJyC3klUNHjW3gEaK
 uPtDULNr/O9OPAiYvD4Ls5kxLyqluwiGLf3qHaWCoFDoAjoE/Snxngy3cdDSqljsysEZ
 zpwA==
X-Gm-Message-State: AOAM5330UuW4vpSgRf/hKdLEel80rDdbJGQ9eYl1+rt2tqZP7cO8oc+a
 bFyQKHlo/libNEDVpq9oh/H1Tj9pWXUU8hYm7nNDJCI6ijZTOTumxnVuWMISVA31C/x8w608ona
 /7wwMOunOJDji0e/QjMHnMB8IBrUa951wJ8eycuGDuw0z9dDW4vB/CJKYgQij+YSo
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr29894733wmd.95.1640951371006; 
 Fri, 31 Dec 2021 03:49:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwh0MshaBZaWtcRc6fHWdv+TupxL0BpQwFByB51qvYil02BDqRkWkTGpzjhkcV6D+CEgQQLg==
X-Received: by 2002:a1c:1dc9:: with SMTP id d192mr29894672wmd.95.1640951369819; 
 Fri, 31 Dec 2021 03:49:29 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id o38sm24808178wms.11.2021.12.31.03.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] hw/scsi: Rename SCSIRequest::resid as 'residual'
Date: Fri, 31 Dec 2021 12:48:59 +0100
Message-Id: <20211231114901.976937-7-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231114901.976937-1-philmd@redhat.com>
References: <20211231114901.976937-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'resid' field is slightly confusing and could be
interpreted as some ID. Rename it as 'residual' which
is clearer to review. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/scsi/scsi.h |  4 ++--
 hw/scsi/megasas.c      | 42 +++++++++++++++++++++++++-----------------
 hw/scsi/scsi-bus.c     | 10 +++++-----
 hw/scsi/scsi-disk.c    |  4 ++--
 softmmu/dma-helpers.c  | 26 +++++++++++++-------------
 5 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 2ef80af6dca..b27d133b113 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -30,7 +30,7 @@ struct SCSIRequest {
     int16_t           status;
     int16_t           host_status;
     void              *hba_private;
-    size_t            resid;
+    size_t            residual;
     SCSICommand       cmd;
     NotifierList      cancel_notifiers;
 
@@ -125,7 +125,7 @@ struct SCSIBusInfo {
                      void *hba_private);
     void (*transfer_data)(SCSIRequest *req, uint32_t arg);
     void (*fail)(SCSIRequest *req);
-    void (*complete)(SCSIRequest *req, size_t resid);
+    void (*complete)(SCSIRequest *req, size_t residual);
     void (*cancel)(SCSIRequest *req);
     void (*change)(SCSIBus *bus, SCSIDevice *dev, SCSISense sense);
     QEMUSGList *(*get_sg_list)(SCSIRequest *req);
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index dc9bbdb740e..cb019549371 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1045,7 +1045,8 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     uint64_t pd_size;
     uint16_t pd_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint8_t cmdbuf[6];
-    size_t len, resid;
+    size_t len;
+    size_t residual;
 
     if (!cmd->iov_buf) {
         cmd->iov_buf = g_malloc0(dcmd_size);
@@ -1112,9 +1113,10 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
-    cmd->iov_size = dcmd_size - resid;
+    cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
     return MFI_STAT_OK;
 }
@@ -1149,7 +1151,8 @@ static int megasas_dcmd_pd_get_info(MegasasState *s, MegasasCmd *cmd)
 static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ld_list info;
-    size_t dcmd_size = sizeof(info), resid;
+    size_t dcmd_size = sizeof(info);
+    size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks;
     uint64_t ld_size;
     BusChild *kid;
@@ -1184,8 +1187,9 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
-    cmd->iov_size = dcmd_size - resid;
+    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
 
@@ -1193,7 +1197,8 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
 {
     uint16_t flags;
     struct mfi_ld_targetid_list info;
-    size_t dcmd_size = sizeof(info), resid;
+    size_t dcmd_size = sizeof(info);
+    size_t residual;
     uint32_t num_ld_disks = 0, max_ld_disks = s->fw_luns;
     BusChild *kid;
 
@@ -1233,8 +1238,9 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
-    cmd->iov_size = dcmd_size - resid;
+    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
 
@@ -1244,7 +1250,8 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     struct mfi_ld_info *info = cmd->iov_buf;
     size_t dcmd_size = sizeof(struct mfi_ld_info);
     uint8_t cdb[6];
-    ssize_t len, resid;
+    ssize_t len;
+    size_t residual;
     uint16_t sdev_id = ((sdev->id & 0xFF) << 8) | (lun & 0xFF);
     uint64_t ld_size;
 
@@ -1283,9 +1290,10 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
+                            MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
-    cmd->iov_size = dcmd_size - resid;
+    cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
     return MFI_STAT_OK;
 }
@@ -1617,13 +1625,13 @@ static int megasas_handle_dcmd(MegasasState *s, MegasasCmd *cmd)
 }
 
 static int megasas_finish_internal_dcmd(MegasasCmd *cmd,
-                                        SCSIRequest *req, size_t resid)
+                                        SCSIRequest *req, size_t residual)
 {
     int retval = MFI_STAT_OK;
     int lun = req->lun;
 
     trace_megasas_dcmd_internal_finish(cmd->index, cmd->dcmd_opcode, lun);
-    cmd->iov_size -= resid;
+    cmd->iov_size -= residual;
     switch (cmd->dcmd_opcode) {
     case MFI_DCMD_PD_GET_INFO:
         retval = megasas_pd_get_info_submit(req->dev, lun, cmd);
@@ -1865,12 +1873,12 @@ static void megasas_xfer_complete(SCSIRequest *req, uint32_t len)
     }
 }
 
-static void megasas_command_complete(SCSIRequest *req, size_t resid)
+static void megasas_command_complete(SCSIRequest *req, size_t residual)
 {
     MegasasCmd *cmd = req->hba_private;
     uint8_t cmd_status = MFI_STAT_OK;
 
-    trace_megasas_command_complete(cmd->index, req->status, resid);
+    trace_megasas_command_complete(cmd->index, req->status, residual);
 
     if (req->io_canceled) {
         return;
@@ -1880,7 +1888,7 @@ static void megasas_command_complete(SCSIRequest *req, size_t resid)
         /*
          * Internal command complete
          */
-        cmd_status = megasas_finish_internal_dcmd(cmd, req, resid);
+        cmd_status = megasas_finish_internal_dcmd(cmd, req, residual);
         if (cmd_status == MFI_STAT_INVALID_STATUS) {
             return;
         }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 2b5e9dca311..3466e680ac7 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -760,7 +760,7 @@ SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
     }
 
     req->cmd = cmd;
-    req->resid = req->cmd.xfer;
+    req->residual = req->cmd.xfer;
 
     switch (buf[0]) {
     case INQUIRY:
@@ -1408,7 +1408,7 @@ void scsi_req_data(SCSIRequest *req, int len)
     trace_scsi_req_data(req->dev->id, req->lun, req->tag, len);
     assert(req->cmd.mode != SCSI_XFER_NONE);
     if (!req->sg) {
-        req->resid -= len;
+        req->residual -= len;
         req->bus->info->transfer_data(req, len);
         return;
     }
@@ -1421,9 +1421,9 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->resid = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        req->residual = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        req->residual = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
@@ -1512,7 +1512,7 @@ void scsi_req_complete(SCSIRequest *req, int status)
 
     scsi_req_ref(req);
     scsi_req_dequeue(req);
-    req->bus->info->complete(req, req->resid);
+    req->bus->info->complete(req, req->residual);
 
     /* Cancelled requests might end up being completed instead of cancelled */
     notifier_list_notify(&req->cancel_notifiers, req);
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index d4914178ea0..9c0dc7b9468 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -420,7 +420,7 @@ static void scsi_do_read(SCSIDiskReq *r, int ret)
 
     if (r->req.sg) {
         dma_acct_start(s->qdev.conf.blk, &r->acct, r->req.sg, BLOCK_ACCT_READ);
-        r->req.resid -= r->req.sg->size;
+        r->req.residual -= r->req.sg->size;
         r->req.aiocb = dma_blk_io(blk_get_aio_context(s->qdev.conf.blk),
                                   r->req.sg, r->sector << BDRV_SECTOR_BITS,
                                   BDRV_SECTOR_SIZE,
@@ -580,7 +580,7 @@ static void scsi_write_data(SCSIRequest *req)
 
     if (r->req.sg) {
         dma_acct_start(s->qdev.conf.blk, &r->acct, r->req.sg, BLOCK_ACCT_WRITE);
-        r->req.resid -= r->req.sg->size;
+        r->req.residual -= r->req.sg->size;
         r->req.aiocb = dma_blk_io(blk_get_aio_context(s->qdev.conf.blk),
                                   r->req.sg, r->sector << BDRV_SECTOR_BITS,
                                   BDRV_SECTOR_SIZE,
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index b0be1564797..4563a775aa7 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,49 +294,49 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
+static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residual,
                               QEMUSGList *sg, DMADirection dir,
                               MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
-    uint64_t resid;
+    uint64_t xresidual;
     int sg_cur_index;
     MemTxResult res = MEMTX_OK;
 
-    resid = sg->size;
+    xresidual = sg->size;
     sg_cur_index = 0;
-    len = MIN(len, resid);
+    len = MIN(len, xresidual);
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
         res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
-        resid -= xfer;
+        xresidual -= xfer;
     }
 
-    if (residp) {
-        *residp = resid;
+    if (residual) {
+        *residual = xresidual;
     }
     return res;
 }
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
+    uint64_t residual;
 
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 
-    return resid;
+    return residual;
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t resid;
+    uint64_t residual;
 
-    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 
-    return resid;
+    return residual;
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


