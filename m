Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAC48212D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:09:05 +0100 (CET)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Po-0003U0-SL
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36EB-0002RD-E7
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36E8-0003bE-Il
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zV1cC5sbwAcNr5Gi638i0pS/v+OOIgrgXUoKZb4q7T8=;
 b=cp8HQ8k/2pq19VQDSi1gXiP1jmSUH1GXUUdAVcx7zL+J+vTj7U7/moaeWIgC4VNeT42/jW
 yBd/S1YexS5jvA9Ds/5v46ShF5qmOsuDSPChcwL3TCjJNUsYXslPuCKlBHQcy0cBT9AvfS
 EZ73npFZPW00KhlvMH4L756EuuEl1Zo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-4t-AeLHgNiaPmky1vM2b5w-1; Thu, 30 Dec 2021 19:56:54 -0500
X-MC-Unique: 4t-AeLHgNiaPmky1vM2b5w-1
Received: by mail-ed1-f70.google.com with SMTP id
 x19-20020a05640226d300b003f8b80f5729so16762742edd.13
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zV1cC5sbwAcNr5Gi638i0pS/v+OOIgrgXUoKZb4q7T8=;
 b=SJKe/TKJRKQv1cZupmYyBuXm8X2Z6KqgJCEIwsoEmWrgmr69F0iSMHBRo0AKWluguu
 /MAcTq1Rpzv+gHFSGMjvXd/fGlnKsXxzHRDvV+aGXCQoChcxnIMvQQN4mbZjRliXhimk
 vk+2mOa1RKIUVP+5FtBiqkBnYVwq0XMirtlj9vCVmBiKu9uSzHFXZRjpoFH2xaiL1+WD
 tXRnDP+d5BM9i0A5BprtQl4MXtq1aa4JlPRi1xhQegQPCJCHgjpHm9zTNLtQuIC2T/s+
 VbSHJDWmkzVtg1/qUmwLrWOadMZZSyscmtUd963brBGtdIrfbNvzQAwqJnoltWnBSqRz
 46yA==
X-Gm-Message-State: AOAM5309A7sObRLMBpNLXug35IGVOAE6Cegeu+obp7DoS/DGlpXm25Wu
 GPtAmkZCW8+/hEAaIwhmbo4U0h5PYnl9gw0pWEwQ3KoaSiH4jvK/6noYD3Ca2JLAjzinltsfKH4
 PZJFdFh1+t9pPNer/2EEI3nP/njp3yk/8cP4tQhLFaMTOjpR77mBJxrHrucO9kDup
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr20696242edd.407.1640912210232; 
 Thu, 30 Dec 2021 16:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9Itl8Ksdb6qLIHcdGIrLzEXEyOHdt2mxwMLq1FKJ+YlyNiQ+LvnvgjhS1draAigsD28n62A==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr20696220edd.407.1640912209926; 
 Thu, 30 Dec 2021 16:56:49 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id f8sm10085420edd.73.2021.12.30.16.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/22] dma: Let dma_buf_read() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:37 +0100
Message-Id: <20211231005546.723396-14-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_buf_read().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-13-philmd@redhat.com>
---
 include/sysemu/dma.h  |  2 +-
 hw/ide/ahci.c         |  4 ++--
 hw/nvme/ctrl.c        |  2 +-
 hw/scsi/megasas.c     | 24 ++++++++++++------------
 hw/scsi/scsi-bus.c    |  2 +-
 softmmu/dma-helpers.c |  5 ++---
 6 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index e3dd74a9c4f..fd8f16003dd 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -302,7 +302,7 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 079d2977f23..205dfdc6622 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1386,7 +1386,7 @@ static void ahci_pio_transfer(const IDEDMA *dma)
         if (is_write) {
             dma_buf_write(s->data_ptr, size, &s->sg, attrs);
         } else {
-            dma_buf_read(s->data_ptr, size, &s->sg);
+            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
         }
     }
 
@@ -1479,7 +1479,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     if (is_write) {
-        dma_buf_read(p, l, &s->sg);
+        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
         dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index e1a531d5d6c..462f79a1f60 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1152,7 +1152,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
             residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
         } else {
-            residual = dma_buf_read(ptr, len, &sg->qsg);
+            residual = dma_buf_read(ptr, len, &sg->qsg, attrs);
         }
 
         if (unlikely(residual)) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 79fd14c5a33..091a350e055 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1100,7 +1100,7 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1271,7 +1271,7 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - resid;
     cmd->iov_buf = NULL;
@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     return MFI_STAT_OK;
 }
 
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 64a506a3975..2b5e9dca311 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1421,7 +1421,7 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->resid = dma_buf_read(buf, len, req->sg);
+        req->resid = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
         req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 2f1a241b81a..a391773c296 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -316,10 +316,9 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     return resid;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
-                      MEMTXATTRS_UNSPECIFIED);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
-- 
2.33.1


