Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61A477226
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:48:34 +0100 (CET)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqBV-00085B-8g
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzk-0001WY-L5
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzi-0004SN-D4
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/M2Z91DmJISpf5VIdppwk0Jxgt7u3GlgWaSk5GaDk0=;
 b=BHDxwhcYSp9d+/uWiDA7eQd6pAZ9XWn7Eo/s1sP+4uwCSMU6F/T1abEPhHmrIit4T/LNa0
 8qLKumhcmtku/EusDe8+Sj4FBmM88AWwEkR9BXrEfqKxWtHFvrRWSpBn6dW+qbyuVTsXjl
 txncv8xe3PslTxu1JmPB8FdMJC9OecQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-_EOmgWjvNWi3faCeCPnvwg-1; Thu, 16 Dec 2021 07:36:19 -0500
X-MC-Unique: _EOmgWjvNWi3faCeCPnvwg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so6894142wrd.1
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8/M2Z91DmJISpf5VIdppwk0Jxgt7u3GlgWaSk5GaDk0=;
 b=RIWAWK/l96fy7JaMQ96VGo6kD0bcc/noY3Mp7adfSxow/JaUwEJKkB6SHZcMSmRGhu
 piWbmLUnsva6ExvrHQl3nkIYBt7aoLqwDJaN4jZUtOdQJePeft51y0xILokWw3MU9DcP
 kZcA6aGrGWu/o2QW+Y5LvfiMWR01pQzmf9AKf6N7/qmv3ncP2e6aWqN8+LqRdVQPDKAE
 cnP0iB2gpQ7ImuE/1/2JTVk3eCgPGT3EHs0WfaeAujAsM02p/lDJ36khtvBD263+gsNz
 nRbF5ds2HtU/CT84yhOZ7YcWG1+8fR2BPzDzcTRpAKHm0V+IkWt6M66fuoIWPTW63/8k
 lVmw==
X-Gm-Message-State: AOAM532IUaGVrb7ykHfhvCSyoVCamjZ7SzecfDKojvIEk01pw4u76xov
 zkGMaeNwm0joe9iK2TSxxwkM8XxfV0+D3puqacUPFDOjkz/Neaf3xN1MY1UdI4ynMDX+gz/kHRH
 2AIP77FsFQhd5C/oOxanN5Wi4LVPINR/k8nn5Xjjevs+p8vUKW73LnV6QPTMxix2M
X-Received: by 2002:a1c:f609:: with SMTP id w9mr4791074wmc.99.1639658178238;
 Thu, 16 Dec 2021 04:36:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6fsYs6o2lFdMDoxOoeLq+MwLP7ixEHYKLskyotIS9oGEYCq9DI/d8Yv4UkdEbRF9k2ZJMZg==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr4791022wmc.99.1639658177775;
 Thu, 16 Dec 2021 04:36:17 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id z11sm4817241wmf.9.2021.12.16.04.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] dma: Have dma_buf_read() / dma_buf_write() take a void
 pointer
Date: Thu, 16 Dec 2021 13:35:52 +0100
Message-Id: <20211216123558.799425-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
References: <20211216123558.799425-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DMA operations are run on any kind of buffer, not arrays of
uint8_t. Convert dma_buf_read/dma_buf_write functions to take
a void pointer argument and save us pointless casts to uint8_t *.

Remove this pointless casts in the megasas device model.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h  |  4 ++--
 hw/scsi/megasas.c     | 22 +++++++++++-----------
 softmmu/dma-helpers.c |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 531f02db14e..2721bf296a8 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -303,8 +303,8 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
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
index 4ff51221d4c..733ca8e9865 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -847,7 +847,7 @@ static int megasas_ctrl_get_info(MegasasState *s, MegasasCmd *cmd)
                                        MFI_INFO_PDMIX_SATA |
                                        MFI_INFO_PDMIX_LD);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -877,7 +877,7 @@ static int megasas_mfc_get_defaults(MegasasState *s, MegasasCmd *cmd)
     info.disable_preboot_cli = 1;
     info.cluster_disable = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -898,7 +898,7 @@ static int megasas_dcmd_get_bios_info(MegasasState *s, MegasasCmd *cmd)
         info.expose_all_drives = 1;
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -909,7 +909,7 @@ static int megasas_dcmd_get_fw_time(MegasasState *s, MegasasCmd *cmd)
 
     fw_time = cpu_to_le64(megasas_fw_time());
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&fw_time, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&fw_time, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -936,7 +936,7 @@ static int megasas_event_info(MegasasState *s, MegasasCmd *cmd)
     info.shutdown_seq_num = cpu_to_le32(s->shutdown_event);
     info.boot_seq_num = cpu_to_le32(s->boot_event);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1005,7 +1005,7 @@ static int megasas_dcmd_pd_get_list(MegasasState *s, MegasasCmd *cmd)
     info.size = cpu_to_le32(offset);
     info.count = cpu_to_le32(num_pd_disks);
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, offset, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, offset, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1171,7 +1171,7 @@ static int megasas_dcmd_ld_get_list(MegasasState *s, MegasasCmd *cmd)
     info.ld_count = cpu_to_le32(num_ld_disks);
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1220,7 +1220,7 @@ static int megasas_dcmd_ld_list_query(MegasasState *s, MegasasCmd *cmd)
     info.size = dcmd_size;
     trace_megasas_dcmd_ld_get_list(cmd->index, num_ld_disks, max_ld_disks);
 
-    resid = dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    resid = dma_buf_read(&info, dcmd_size, &cmd->qsg);
     cmd->iov_size = dcmd_size - resid;
     return MFI_STAT_OK;
 }
@@ -1389,7 +1389,7 @@ static int megasas_dcmd_cfg_read(MegasasState *s, MegasasCmd *cmd)
         ld_offset += sizeof(struct mfi_ld_config);
     }
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)data, info->size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(data, info->size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1419,7 +1419,7 @@ static int megasas_dcmd_get_properties(MegasasState *s, MegasasCmd *cmd)
     info.ecc_bucket_leak_rate = cpu_to_le16(1440);
     info.expose_encl_devices = 1;
 
-    cmd->iov_size -= dma_buf_read((uint8_t *)&info, dcmd_size, &cmd->qsg);
+    cmd->iov_size -= dma_buf_read(&info, dcmd_size, &cmd->qsg);
     return MFI_STAT_OK;
 }
 
@@ -1464,7 +1464,7 @@ static int megasas_dcmd_set_properties(MegasasState *s, MegasasCmd *cmd)
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


