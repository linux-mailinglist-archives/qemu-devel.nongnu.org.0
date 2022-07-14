Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F125748D8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:28:00 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv8Z-0001td-A0
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk6-0005BU-6G
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk4-00060V-Er
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITcwNs94bqpAb2bGyOg0ZV+GYhMASrM2rJCPaUnfMr4=;
 b=UjI2Do/poCqkxCaDYFHuku1oy/6a+XgKkDr7vQVCoJ+AvBrRx/obpQ73fzO1U1WFjj7nVl
 29n57GpOMqeA9IQqORJ38wnQgDfmgoJWLwb9ndUm6lKS16pn8aVzFamfnvK29jCJiQOSRs
 foALtVKpL7dKKPKounHkIISmVwn3qHs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-pfT4ogswNlyKCqR4y7NX7Q-1; Thu, 14 Jul 2022 05:02:38 -0400
X-MC-Unique: pfT4ogswNlyKCqR4y7NX7Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 c9-20020a05640227c900b0043ad14b1fa0so1119848ede.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ITcwNs94bqpAb2bGyOg0ZV+GYhMASrM2rJCPaUnfMr4=;
 b=HliExn+qsxtkCPv1Y7ZNvXWuqmSqb1QWDG/mOqd0HcV+igQT1m99ujsMfDxxihRelD
 VM60j+sDBIRtieh9PLRdzx0lR9s94/BgGHl1mZNcsw+T6Gq/uebmscX695KXlHYa7vgw
 6KkPEO9QelUT3N9VuGAYd71nWXjeVzyjGXUYwHI5BlyrHiKuUeq8bdf9mlMLwFXz+i3+
 S8jEOstzosG33HcuM43E+HPVoleW4rNyN8s9DLiwHyyv/kZ5aVKnP1x76vQXymsv/eXB
 cI2W88Vkf8tRug9dG0Vm2iKg9kgv4FVNiMTDffu460AxgDXEKyiakA6zvSdTBBFrNnKN
 PdDg==
X-Gm-Message-State: AJIora94w6GtptveFrJPJbaesK9m3qxuRHBz/m3cWp9PoQzxRu7zE7XN
 /pMLlpJtNjdyJTVhAFYZXGIjUrTDq1rt0/WGtm4rXpSVzR0q8jlyxo84+Q4PxKqGKLmyY0AJv9q
 7hSGxRxCch03pIA1Vuq/6eN30MqSHRZr5r0eMrcBumrZQzh60N+6wVB/8ZsmyYnizI+0=
X-Received: by 2002:a17:906:49d5:b0:717:7d2f:d6ed with SMTP id
 w21-20020a17090649d500b007177d2fd6edmr7713423ejv.750.1657789357239; 
 Thu, 14 Jul 2022 02:02:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYP7nHq+5ow94T2vjBu69qWjkJAFY9ZU+0WhxNg5DUdFTp2ZPt4JZe/eSkf6nR+eWIjbZkRg==
X-Received: by 2002:a17:906:49d5:b0:717:7d2f:d6ed with SMTP id
 w21-20020a17090649d500b007177d2fd6edmr7713404ejv.750.1657789356894; 
 Thu, 14 Jul 2022 02:02:36 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l5-20020aa7c3c5000000b0043575ae2051sm679918edr.62.2022.07.14.02.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 14/20] scsi-disk: add SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk
 for Macintosh
Date: Thu, 14 Jul 2022 11:02:05 +0200
Message-Id: <20220714090211.304305-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

When A/UX configures the CDROM device it sends a truncated MODE SELECT request
for page 1 (MODE_PAGE_R_W_ERROR) which is only 6 bytes in length rather than
10. This seems to be due to bug in Apple's code which calculates the CDB message
length incorrectly.

The work at [1] suggests that this truncated request is accepted on real
hardware whereas in QEMU it generates an INVALID_PARAM_LEN sense code which
causes A/UX to get stuck in a loop retrying the command in an attempt to succeed.

Alter the mode page request length check so that truncated requests are allowed
if the SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED quirk is enabled, whilst also adding a
trace event to enable the condition to be detected.

[1] https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-10-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c    | 7 ++++++-
 hw/scsi/trace-events   | 1 +
 include/hw/scsi/scsi.h | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 9413b33bac..2b2e496ebd 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1552,7 +1552,10 @@ static int mode_select_pages(SCSIDiskReq *r, uint8_t *p, int len, bool change)
             goto invalid_param;
         }
         if (page_len > len) {
-            goto invalid_param_len;
+            if (!(s->quirks & SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED)) {
+                goto invalid_param_len;
+            }
+            trace_scsi_disk_mode_select_page_truncated(page, page_len, len);
         }
 
         if (!change) {
@@ -3151,6 +3154,8 @@ static Property scsi_cd_properties[] = {
     DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
                     quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
                     0),
+    DEFINE_PROP_BIT("quirk_mode_page_truncated", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/scsi/trace-events b/hw/scsi/trace-events
index 03b2640934..8e927ff62d 100644
--- a/hw/scsi/trace-events
+++ b/hw/scsi/trace-events
@@ -339,6 +339,7 @@ scsi_disk_dma_command_READ(uint64_t lba, uint32_t len) "Read (sector %" PRId64 "
 scsi_disk_dma_command_WRITE(const char *cmd, uint64_t lba, int len) "Write %s(sector %" PRId64 ", count %u)"
 scsi_disk_new_request(uint32_t lun, uint32_t tag, const char *line) "Command: lun=%d tag=0x%x data=%s"
 scsi_disk_aio_sgio_command(uint32_t tag, uint8_t cmd, uint64_t lba, int len, uint32_t timeout) "disk aio sgio: tag=0x%x cmd=0x%x (sector %" PRId64 ", count %d) timeout=%u"
+scsi_disk_mode_select_page_truncated(int page, int len, int page_len) "page %d expected length %d but received length %d"
 
 # scsi-generic.c
 scsi_generic_command_complete_noio(void *req, uint32_t tag, int statuc) "Command complete %p tag=0x%x status=%d"
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 011cb84753..e284e3a4ec 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -230,5 +230,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
 #define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
 #define SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE    2
+#define SCSI_DISK_QUIRK_MODE_PAGE_TRUNCATED                3
 
 #endif
-- 
2.36.1



