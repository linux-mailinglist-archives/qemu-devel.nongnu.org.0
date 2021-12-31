Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C34823D8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:55:27 +0100 (CET)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GVK-0001Y1-9c
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPp-00031L-25
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GPm-0000Km-S3
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:49:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVbqGuL5i4KG9wiyUQdUi9FXx9GY+w1Tl1XX5hguON4=;
 b=a7gFxwuKt5bXpO1mEvnfj/sDkDZafca7cthZ8wuUoUejT+PF7KAAu6xKJz2c9ncXjgoJGM
 XbThsK5rR0iqlgYJUhczkdhDFJFistaLmmHC/uk7Mwn5ZkEFljdTXIV0brWSfAA3G0DHMg
 Wn6y9lf7dHXQ6MfTGfA7Kr3geLt6sSo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-HZIsEwYYMvKu9d7rOsl9CA-1; Fri, 31 Dec 2021 06:49:40 -0500
X-MC-Unique: HZIsEwYYMvKu9d7rOsl9CA-1
Received: by mail-wm1-f70.google.com with SMTP id
 f202-20020a1c1fd3000000b00344f1cae317so4561548wmf.0
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVbqGuL5i4KG9wiyUQdUi9FXx9GY+w1Tl1XX5hguON4=;
 b=itFKWUfmcUyNaTvqQe5cA9AU2C9exhz8LlxEpZ/tHfAi3ZWu36Be7tTNNvvgZlj/W1
 xRTuwJBpn+o1IR7WaTHvTgatGBtVGYzrb7Rtryk1b/TjQ8eQ+0rb4heuNCPP7GEjlzWg
 vUpcZhSzZHl4sgzvfwesQtLJgbmArMLtnniYShxcvMv0PlpfTEmCf1gluMZwpCWU0h03
 M22wDCyfAIWAmgcZhZ+NhEOreG9UwKxdM7ebAaogGjWXQUBBtUIgbmjGNa4/d5Hqxlre
 1bBYBIH0gTflBr/cyuUo8Z7qNbT8bL0YD3PwfRQazxbZNw8/ITLKUMzpRN5PcDmUm+SZ
 yR1Q==
X-Gm-Message-State: AOAM533yqQsteTRN3RFngsteSf4+yd5s/1rRnc9SZczc4ZZZate2MhJY
 paq+4Wqtf8JqZEyHmKRqOxgWexc3tqNkqzq1O4ZIk1XgSNKpqmSaCo3w8JJtIqlRchSL3b+GPZE
 GdtT7tRfE4wwPhDrYY99guWqWRsnVCJPvP6tmcOPAPvxKROsJlAo8wS7NaJiFnbEr
X-Received: by 2002:a05:6000:c6:: with SMTP id
 q6mr28844957wrx.181.1640951378964; 
 Fri, 31 Dec 2021 03:49:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze40y+FDpdvAVYk73CGv/wGhHSTGgdTSeJfcfRcrkN+CMguXeVW7PqdwukP2iZB0f9tFhPlg==
X-Received: by 2002:a05:6000:c6:: with SMTP id
 q6mr28844937wrx.181.1640951378689; 
 Fri, 31 Dec 2021 03:49:38 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id n17sm24984705wmc.32.2021.12.31.03.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 03:49:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hw/dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
Date: Fri, 31 Dec 2021 12:49:01 +0100
Message-Id: <20211231114901.976937-9-philmd@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the previous commit, dma_buf_rw() returns a MemTxResult
type. Do not discard it, return it to the caller.

Since both dma_buf_read/dma_buf_write functions were previously
returning the QEMUSGList size not consumed, add an extra argument
where the unconsummed size can be stored.

Update the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/scsi/scsi.h |  2 +-
 include/sysemu/dma.h   |  6 +++--
 hw/ide/ahci.c          |  8 +++---
 hw/nvme/ctrl.c         |  4 +--
 hw/scsi/megasas.c      | 59 ++++++++++++++++++++++++++++++------------
 hw/scsi/scsi-bus.c     |  6 +++--
 softmmu/dma-helpers.c  | 18 +++++--------
 7 files changed, 63 insertions(+), 40 deletions(-)

diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index b27d133b113..1ffb367f94f 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -30,7 +30,7 @@ struct SCSIRequest {
     int16_t           status;
     int16_t           host_status;
     void              *hba_private;
-    size_t            residual;
+    uint64_t          residual;
     SCSICommand       cmd;
     NotifierList      cancel_notifiers;
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 45a2567848c..77a346d5ed1 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,8 +303,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_read(void *ptr, dma_size_t len, dma_size_t *residual,
+                         QEMUSGList *sg, MemTxAttrs attrs);
+MemTxResult dma_buf_write(void *ptr, dma_size_t len, dma_size_t *residual,
+                          QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 256bbc377ce..564293fd492 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1384,9 +1384,9 @@ static void ahci_pio_transfer(const IDEDMA *dma)
         const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
 
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_write(s->data_ptr, size, NULL, &s->sg, attrs);
         } else {
-            dma_buf_read(s->data_ptr, size, &s->sg, attrs);
+            dma_buf_read(s->data_ptr, size, NULL, &s->sg, attrs);
         }
     }
 
@@ -1479,9 +1479,9 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     if (is_write) {
-        dma_buf_read(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     } else {
-        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(p, l, NULL, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 4620e662fc9..72faa94a4a3 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1150,9 +1150,9 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
         dma_size_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
+            dma_buf_write(ptr, len, &residual, &sg->qsg, attrs);
         } else {
-            residual = dma_buf_read(ptr, len, &sg->qsg, attrs);
+            dma_buf_read(ptr, len, &residual, &sg->qsg, attrs);
         }
 
         if (unlikely(residual)) {
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 7456a25970a..f2daeeb7005 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -750,6 +750,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     int num_pd_disks = 0;
+    dma_size_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -860,7 +861,9 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -868,6 +871,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_defaults info;
     size_t dcmd_size = sizeof(struct mfi_defaults);
+    dma_size_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -890,7 +894,9 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -898,6 +904,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_bios_data info;
     size_t dcmd_size = sizeof(info);
+    dma_size_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -911,7 +918,9 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -919,10 +928,13 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 {
     uint64_t fw_time;
     size_t dcmd_size = sizeof(fw_time);
+    dma_size_t residual;
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&fw_time, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -942,6 +954,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_evt_log_state info;
     size_t dcmd_size = sizeof(info);
+    dma_size_t residual;
 
     memset(&info, 0, dcmd_size);
 
@@ -949,7 +962,9 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -979,6 +994,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     size_t dcmd_size = sizeof(info);
     BusChild *kid;
     uint32_t offset, dcmd_limit, num_pd_disks = 0, max_pd_disks;
+    dma_size_t residual;
 
     memset(&info, 0, dcmd_size);
     offset = 8;
@@ -1018,7 +1034,9 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, offset, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1113,8 +1131,9 @@ static int megasas_pd_get_info_submit(SCSIDevice *sdev, int lun,
     info->connected_port_bitmap = 0x1;
     info->device_speed = 1;
     info->link_speed = 1;
-    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
@@ -1187,8 +1206,8 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
@@ -1238,8 +1257,8 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    residual = dma_buf_read(&info, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     cmd->iov_size = dcmd_size - residual;
     return MFI_STAT_OK;
 }
@@ -1290,8 +1309,8 @@ static int megasas_ld_get_info_submit(SCSIDevice *sdev, int lun,
     info->ld_config.span[0].num_blocks = info->size;
     info->ld_config.span[0].array_ref = cpu_to_le16(sdev_id);
 
-    residual = dma_buf_read(cmd->iov_buf, dcmd_size, &cmd->qsg,
-                            MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(cmd->iov_buf, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
     g_free(cmd->iov_buf);
     cmd->iov_size = dcmd_size - residual;
     cmd->iov_buf = NULL;
@@ -1336,6 +1355,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
     struct mfi_config_data *info;
     int num_pd_disks = 0, array_offset, ld_offset;
     BusChild *kid;
+    dma_size_t residual;
 
     if (cmd->iov_size > 4096) {
         return MFI_STAT_INVALID_PARAMETER;
@@ -1410,7 +1430,9 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(data, info->size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1418,6 +1440,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
 {
     struct mfi_ctrl_props info;
     size_t dcmd_size = sizeof(info);
+    dma_size_t residual;
 
     memset(&info, 0x0, dcmd_size);
     if (cmd->iov_size < dcmd_size) {
@@ -1440,7 +1463,9 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_read(&info, dcmd_size, &residual, &cmd->qsg,
+                 MEMTXATTRS_UNSPECIFIED);
+    cmd->iov_size -= residual;
     return MFI_STAT_OK;
 }
 
@@ -1485,7 +1510,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
+    dma_buf_write(&info, dcmd_size, NULL, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 3466e680ac7..4057e04ce89 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1421,9 +1421,11 @@ void scsi_req_data(SCSIRequest *req, int len)
 
     buf = scsi_req_get_buf(req);
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
-        req->residual = dma_buf_read(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_read(buf, len, &req->residual, req->sg,
+                     MEMTXATTRS_UNSPECIFIED);
     } else {
-        req->residual = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
+        dma_buf_write(buf, len, &req->residual, req->sg,
+                      MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 66ba0b2c361..25120ea2792 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -321,22 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_size_t len, dma_size_t *residual,
     return res;
 }
 
-uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_read(void *ptr, dma_size_t len, dma_size_t *residual,
+                         QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
+MemTxResult dma_buf_write(void *ptr, dma_size_t len, dma_size_t *residual,
+                          QEMUSGList *sg, MemTxAttrs attrs)
 {
-    uint64_t residual;
-
-    dma_buf_rw(ptr, len, &residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
-
-    return residual;
+    return dma_buf_rw(ptr, len, residual, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


