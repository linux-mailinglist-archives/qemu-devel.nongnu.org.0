Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01849482124
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:04:35 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36LR-00066c-LZ
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dy-000241-8J
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dw-0003Ze-Mp
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+1Z9pLM3dvlcchcXJSyskF4WLTwr1M3wKSGXhcPQIKI=;
 b=iddQ+H/XgT0JVvxgJXQv/M2rd7SeClQy95JwijIvMk9fL9AGnSINS47EDFT/b+Bctlc0nz
 U5TnQtt2G5kx453q00742uImLuZv4NlguvRU1okY0fD2e7eXQmVkfH25xgtIQotnotePgE
 /RwA09WX1pNrnHKEQhfIc8oEw79V48s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-sjRAvaUKPR6uteyZuDeqWw-1; Thu, 30 Dec 2021 19:56:47 -0500
X-MC-Unique: sjRAvaUKPR6uteyZuDeqWw-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so18053505edb.12
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1Z9pLM3dvlcchcXJSyskF4WLTwr1M3wKSGXhcPQIKI=;
 b=OunoSsQR/iBKEgJWeLfr6S81x1ByF8eK5vkUAnLWWQhsWCwl2/qu2X1drDQyGrgXCa
 tuFBnL1p3UKuqgq+Fd3ub015iKZTX5G+dn33Ga1tZDkz2tDiYWD17/E3yPgEIuLhiqQq
 9QttVesIWp2k05uoOUo3h6i+v0fj1aDqhxHqRVFwvBwuEpWHe++fyEpbbWs1QbrVHybO
 2hW5ghdldKAcO4AfcHyn547J+6Cohm02iWWC3MfACsSF4Gx1gxRYQ/c7Fi8XI14ANQkW
 U8eTVXLW6HTRfYGgbdOkqOV7unFhTP7QRdSfejR8/0pZ8byud2Svdz54xjvrgIY4OZxw
 nRSQ==
X-Gm-Message-State: AOAM531iSzGXdYLUF1cYGKlMmQAc26R9gYRRtowUzpCr5vY7uKCWGWSc
 eY+J4crdsNLs/vGjUcW/RInNtaoAjQBkMKPGrRM20VYDLfRpkj82sNg9JbGzNFttcG+xwBXZggF
 4KpI9EZL1WZrOjBJPYSTT7en5XGIlNqT+u1Us1CR0OGicP9Cvmfu5e5sVvshYwtua
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr32180619edd.79.1640912205639; 
 Thu, 30 Dec 2021 16:56:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgR5CfazrtMirXmAS5QOoJws+tELIcAQhVe0L3hg0fTVUeMBhEfuOyVZlmn2kDfRSZos7Pbw==
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr32180597edd.79.1640912205413; 
 Thu, 30 Dec 2021 16:56:45 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id qw9sm8092092ejc.211.2021.12.30.16.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/22] dma: Let dma_buf_write() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:36 +0100
Message-Id: <20211231005546.723396-13-philmd@redhat.com>
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
dma_buf_write().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-12-philmd@redhat.com>
---
 include/sysemu/dma.h  | 2 +-
 hw/ide/ahci.c         | 6 ++++--
 hw/nvme/ctrl.c        | 3 ++-
 hw/scsi/megasas.c     | 2 +-
 hw/scsi/scsi-bus.c    | 2 +-
 softmmu/dma-helpers.c | 5 ++---
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0d5b836013d..e3dd74a9c4f 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,7 +303,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 8e77ddb660f..079d2977f23 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1381,8 +1381,10 @@ static void ahci_pio_transfer(const IDEDMA *dma)
                             has_sglist ? "" : "o");
 
     if (has_sglist && size) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
         if (is_write) {
-            dma_buf_write(s->data_ptr, size, &s->sg);
+            dma_buf_write(s->data_ptr, size, &s->sg, attrs);
         } else {
             dma_buf_read(s->data_ptr, size, &s->sg);
         }
@@ -1479,7 +1481,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     if (is_write) {
         dma_buf_read(p, l, &s->sg);
     } else {
-        dma_buf_write(p, l, &s->sg);
+        dma_buf_write(p, l, &s->sg, MEMTXATTRS_UNSPECIFIED);
     }
 
     /* free sglist, update byte count */
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3..e1a531d5d6c 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -1146,10 +1146,11 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
     assert(sg->flags & NVME_SG_ALLOC);
 
     if (sg->flags & NVME_SG_DMA) {
+        const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
         uint64_t residual;
 
         if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
-            residual = dma_buf_write(ptr, len, &sg->qsg);
+            residual = dma_buf_write(ptr, len, &sg->qsg, attrs);
         } else {
             residual = dma_buf_read(ptr, len, &sg->qsg);
         }
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 2dae33f6755..79fd14c5a33 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write(&info, dcmd_size, &cmd->qsg);
+    dma_buf_write(&info, dcmd_size, &cmd->qsg, MEMTXATTRS_UNSPECIFIED);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 77325d8cc7a..64a506a3975 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1423,7 +1423,7 @@ void scsi_req_data(SCSIRequest *req, int len)
     if (req->cmd.mode == SCSI_XFER_FROM_DEV) {
         req->resid = dma_buf_read(buf, len, req->sg);
     } else {
-        req->resid = dma_buf_write(buf, len, req->sg);
+        req->resid = dma_buf_write(buf, len, req->sg, MEMTXATTRS_UNSPECIFIED);
     }
     scsi_req_continue(req);
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index fa81d2b386c..2f1a241b81a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -322,10 +322,9 @@ uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
                       MEMTXATTRS_UNSPECIFIED);
 }
 
-uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
-                      MEMTXATTRS_UNSPECIFIED);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


