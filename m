Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E41574823
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:14:24 +0200 (CEST)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuvP-00088C-C3
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk2-00059U-4K
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk0-0005zb-Eb
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cU4DWCKiVZhQ9j8g5YUlKqIkekzW14p85YKTJ5Ocap4=;
 b=NtIW3gE+ZeJ5ZseBIbJxOWdk9pIGdwUe+XKPVmk86wkbj4GnaL7iQcv6dBbAPwyJ3+lkNJ
 uyd0xbY8uS7GHpJJLDxKG5GrSPN8Hox5gb6Q5w9Cvda/IFIGWjZaOkZgm7fXlHMpAGBsNL
 psIQjqkWH0itrnGOjWRmJAvXSu5ntgc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-tdz3ZAiQPyyj8T1Wkk8gsg-1; Thu, 14 Jul 2022 05:02:34 -0400
X-MC-Unique: tdz3ZAiQPyyj8T1Wkk8gsg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so1104632edc.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cU4DWCKiVZhQ9j8g5YUlKqIkekzW14p85YKTJ5Ocap4=;
 b=AnNCqibwtNTA/dBI/uLMRTZB1SMOaoRwjblDVP7ZlECrOL7PV6/ZL6JZOLpRT73I51
 PpyBAMWfZwLwjz0U/v3d6w89a1Wt2JlBfdA56kHGu5/YZNySIGt17VCV4lgSM7qOmFZO
 9ajjl4omXD1OL0sUcGa+4mwm15Bl5+bvc0wGssb3hwXUA6jpl953QP1Mq5g470IBzepW
 Bl1uVYKAW39SrK7PQglz1YZoBmzjWfERvH5ymd6mX6kuGqory1fw5p/KfcaKDK286IcA
 PBiS3MtND02DTmCtpPTHTMqWg5+D6xyrbac4CB7bt86PfodtLhNXVALE+QA5foB07pzi
 5jOw==
X-Gm-Message-State: AJIora8ygmb0brkEL7+kRkqyI6/iX/WyRqGvn4g2nHznKKPPO5ywDFmP
 3pDcAogceyu432+pnQRf5dv1AmridpTA0NTLez4dx4htfebgtKdfXK/eIGLWn7b2n3FrLiPakGV
 jpv3RKgY/ng1EIDfn55rvpnWU4IV46EJ/fEO3BEYMywtPzUQa6SQ9CxPX1H6OzPdUPD4=
X-Received: by 2002:aa7:d5d7:0:b0:43a:6eda:464a with SMTP id
 d23-20020aa7d5d7000000b0043a6eda464amr10875715eds.193.1657789352635; 
 Thu, 14 Jul 2022 02:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQYejmBmBE0gfP8eTyCBALNiH58W72j56KOr40muK6MAI663vyL+nS4TD6UFaIi+9xLo/X4w==
X-Received: by 2002:aa7:d5d7:0:b0:43a:6eda:464a with SMTP id
 d23-20020aa7d5d7000000b0043a6eda464amr10875687eds.193.1657789352331; 
 Thu, 14 Jul 2022 02:02:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 n6-20020aa7c786000000b0043787ad7cfasm682359eds.22.2022.07.14.02.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 11/20] scsi-disk: add
 SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk for Macintosh
Date: Thu, 14 Jul 2022 11:02:02 +0200
Message-Id: <20220714090211.304305-12-pbonzini@redhat.com>
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

Both MacOS and A/UX make use of vendor-specific MODE SELECT commands with PF=0
to identify SCSI devices:

- MacOS sends a MODE SELECT command with PF=0 for the MODE_PAGE_VENDOR_SPECIFIC
  (0x0) mode page containing 2 bytes before initialising a disk

- A/UX (installed on disk) sends a MODE SELECT command with PF=0 during SCSI
  bus enumeration, and gets stuck in an infinite loop if it fails

Add a new SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE quirk to allow both
PF=0 MODE SELECT commands and implement a MODE_PAGE_VENDOR_SPECIFIC (0x0)
mode page which is compatible with MacOS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c      | 30 ++++++++++++++++++++++++++++--
 include/hw/scsi/scsi.h   |  1 +
 include/scsi/constants.h |  1 +
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index b1d08bfba5..2cdbba7ccc 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1079,6 +1079,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
                            int page_control)
 {
     static const int mode_sense_valid[0x3f] = {
+        [MODE_PAGE_VENDOR_SPECIFIC]        = (1 << TYPE_DISK) | (1 << TYPE_ROM),
         [MODE_PAGE_HD_GEOMETRY]            = (1 << TYPE_DISK),
         [MODE_PAGE_FLEXIBLE_DISK_GEOMETRY] = (1 << TYPE_DISK),
         [MODE_PAGE_CACHING]                = (1 << TYPE_DISK) | (1 << TYPE_ROM),
@@ -1244,6 +1245,22 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
             return -1;
         }
 
+    case MODE_PAGE_VENDOR_SPECIFIC:
+        if (s->qdev.type == TYPE_DISK && (s->quirks &
+            (1 << SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE))) {
+            length = 0x2;
+            if (page_control == 1) { /* Changeable Values */
+                p[0] = 0xff;
+                p[1] = 0xff;
+                break;
+            }
+            p[0] = 0;
+            p[1] = 0;
+            break;
+        } else {
+            return -1;
+        }
+
     default:
         return -1;
     }
@@ -1570,9 +1587,12 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
     int bd_len;
     int pass;
 
-    /* We only support PF=1, SP=0.  */
     if ((r->req.cmd.buf[1] & 0x11) != 0x10) {
-        goto invalid_field;
+        if (!(s->quirks &
+            (1 << SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE))) {
+            /* We only support PF=1, SP=0.  */
+            goto invalid_field;
+        }
     }
 
     if (len < hdr_len) {
@@ -3069,6 +3089,9 @@ static Property scsi_hd_properties[] = {
     DEFINE_PROP_UINT16("rotation_rate", SCSIDiskState, rotation_rate, 0),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
+                    quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
+                    0),
     DEFINE_BLOCK_CHS_PROPERTIES(SCSIDiskState, qdev.conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -3121,6 +3144,9 @@ static Property scsi_cd_properties[] = {
                     SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
     DEFINE_PROP_BIT("quirk_mode_sense_rom_use_dbd", SCSIDiskState, quirks,
                     SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD, 0),
+    DEFINE_PROP_BIT("quirk_mode_page_vendor_specific_apple", SCSIDiskState,
+                    quirks, SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE,
+                    0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 845d05722b..011cb84753 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -229,5 +229,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 /* scsi-disk.c */
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
 #define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
+#define SCSI_DISK_QUIRK_MODE_PAGE_VENDOR_SPECIFIC_APPLE    2
 
 #endif
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 891aa0f45c..6a8bad556a 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -225,6 +225,7 @@
 #define TYPE_NO_LUN         0x7f
 
 /* Mode page codes for mode sense/set */
+#define MODE_PAGE_VENDOR_SPECIFIC             0x00
 #define MODE_PAGE_R_W_ERROR                   0x01
 #define MODE_PAGE_HD_GEOMETRY                 0x04
 #define MODE_PAGE_FLEXIBLE_DISK_GEOMETRY      0x05
-- 
2.36.1



