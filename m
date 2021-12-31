Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7648213C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:18:02 +0100 (CET)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36YS-0002oj-4i
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Dl-0001V5-QP
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36Di-0003YX-VG
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0O3GSXTG0rQZmC+XLVuOePHG903RoCnOoh6M+AdwkDI=;
 b=Q9PljLwIcvKrjYng1+OTb2V34FltLPFKFRF8UM8MUXEhzbF79QTZadcOTgzN/Ufcpox5sN
 nXGO0BkcKYH8b4UUQbnwasYoWHOUkP8hZ2MPyr5Bm8oj9Slimi527n08mfGanr6y1RSdLp
 FoHcgYRAedcc+jcutnxs0DwdGCA+X8A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-q0VgWBg8OiyPY_gWi0WS2g-1; Thu, 30 Dec 2021 19:56:33 -0500
X-MC-Unique: q0VgWBg8OiyPY_gWi0WS2g-1
Received: by mail-ed1-f70.google.com with SMTP id
 s12-20020a50ab0c000000b003efdf5a226fso18012012edc.10
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0O3GSXTG0rQZmC+XLVuOePHG903RoCnOoh6M+AdwkDI=;
 b=1egrkoGMg0yhwLLZHin5dUlLg4nai6pSiGsTuuBvZ2u94jlac4/BCWIZkSccF3OfiQ
 UuvOBehBz6wXwZJTtdICmjjrd1ilnkbnWjGiWGT4QAlO/KSbM615MqJSHV/pCip9E4tb
 ItXjgy1+wiYZpRZLYSRFs/LpI6Xo9/TJpS/dVri3WKYA8w3n1NbPinagzDe7UI41j02N
 ChQf62ScSczv9LaS8i5Kx5/T1c74k6zdaqnYzqn0WjwarJGWmJuLkAmDkPN9l8d8QJ6Y
 6HoIG6ayMyo/H/9QzR6JEUBICdt+swmFtVBYLri9vHk/LvRXKS8xUXGQGPonKvN1qYqN
 COFA==
X-Gm-Message-State: AOAM533aMAAJS6YtLYtHZEOx8q5H3vZkDqIgp0oMQEMfTar1sPBl7+ji
 zY3wuJBvaInrOpNdqvkvfDiBSBqn7CFfRKPykcJMsD/rSvNZC7WbTEHghbzVhU/L4xoKeJKYKAE
 I17vNbjCwkh89nsIK63MQwGInzlxU4a3gE5mi0dCFcZKZ3QuKYcPN1k9VaL10hqQE
X-Received: by 2002:a17:906:888f:: with SMTP id
 ak15mr26583491ejc.0.1640912191990; 
 Thu, 30 Dec 2021 16:56:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPXLNdzMwIN26GVSEBMJM4lZDxdoBrKusGfAWYZtjKrAwq2qZ7Ryr4gIHCi/lO+W0EMZfAog==
X-Received: by 2002:a17:906:888f:: with SMTP id
 ak15mr26583472ejc.0.1640912191689; 
 Thu, 30 Dec 2021 16:56:31 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ds7sm8121982ejc.50.2021.12.30.16.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/22] dma: Have dma_buf_read() / dma_buf_write() take a void
 pointer
Date: Fri, 31 Dec 2021 01:55:33 +0100
Message-Id: <20211231005546.723396-10-philmd@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_read/dma_buf_write functions to take
a void pointer argument and save us pointless casts to uint8_t *.

Remove this pointless casts in the megasas device model.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-9-philmd@redhat.com>
---
 include/sysemu/dma.h  |  4 ++--
 hw/scsi/megasas.c     | 22 +++++++++++-----------
 softmmu/dma-helpers.c |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 97ff6f29f8c..0d5b836013d 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -302,8 +302,8 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
 BlockAIOCB *dma_blk_write(BlockBackend *blk,
                           QEMUSGList *sg, uint64_t offset, uint32_t align,
                           BlockCompletionFunc *cb, void *opaque);
-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg);
-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg);
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg);
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
                     QEMUSGList *sg, enum BlockAcctType type);
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 14ec6d68bbf..2dae33f6755 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -848,7 +848,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -878,7 +878,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -899,7 +899,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -910,7 +910,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&fw_time, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -937,7 +937,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1006,7 +1006,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, offset, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1221,7 +1221,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1390,7 +1390,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)data, info->size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1420,7 +1420,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1465,7 +1465,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
                                             dcmd_size);
         return MFI_STAT_INVALID_PARAMETER;
     }
-    dma_buf_write((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    dma_buf_write(&info, dcmd_size, &cmd->qsg);
     trace_megasas_dcmd_unsupported(cmd->index, cmd->iov_size);
     return MFI_STAT_OK;
 }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 09e29997ee5..7f37548394e 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -317,12 +317,12 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     return resid;
 }
 
-uint64_t dma_buf_read(uint8_t *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
 }
 
-uint64_t dma_buf_write(uint8_t *ptr, int32_t len, QEMUSGList *sg)
+uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
     return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
 }
-- 
2.33.1


