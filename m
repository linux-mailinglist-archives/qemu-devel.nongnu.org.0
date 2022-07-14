Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA7574881
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:21:15 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBv20-000056-Ox
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk2-00059T-3L
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujz-0005zF-7N
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7BNvbDIkbI1uaiLP0zumbSGvEEG4aAJrNM+lpwoDsQ=;
 b=TTxdZ24VLz01MDBv6kwsmJX6RAnMW8vXE12jz8+GFMySAR7UC5v9vkkJ3KMazUXD/72pxP
 0LjivqMhIaHuway98Gs6Uq/4Fl9fRlglTPaPs5zp1ODgjOU64I2dOIoxZqf1p6m5r3t49l
 Vf+JSCYgoqNAkvYRaw/KZFi+7ytdzXc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-rK3aZyAJNwKf5OXIGCmzpw-1; Thu, 14 Jul 2022 05:02:31 -0400
X-MC-Unique: rK3aZyAJNwKf5OXIGCmzpw-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc42-20020a1709078a2a00b0072b5f51a9dbso509546ejc.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U7BNvbDIkbI1uaiLP0zumbSGvEEG4aAJrNM+lpwoDsQ=;
 b=2fg4wkGT+WleiFIpZFoXqpeZ43FAXMBHKuVvQlZJp9ArZhaqvAA8let+g/239yKWd0
 9OZXDs0KTMO/toQ6U8kVY1k1XpxAXE77WdY6pNsEc28G9yrUFZFtyyOzP0Rvdbli7ObO
 a7IxfGQgGZ3xP+Wq/GdnTDK4Fo/ru3jYmncC2Fg6WYl2XZCEtDB0E3zJJVGs3s1rR+dK
 4ctLlFErt0dXOhjj8+rFFMHcC5K/FrRu0S6vfiA+ZLLxvmiopPbO6xisyCSxZq+Q/rd6
 FQHUSWslk2U7VPhcnzL9jttCVKGKrGrS4Wh2CaRDcsTtbKEf49QrDPYTrQN9mTmgm6pu
 qKnQ==
X-Gm-Message-State: AJIora8+IkgBiHbonPJAq5PS18QtEiSLxGVesqYxDziFE6rYQP5pfxSl
 AklT1OFrUV/pxKOBowNHeGu5zADqIVaAIJgFrIp2Ri5L2Fh7ssJkdk0WrwELjVqUjKynhUggKGc
 L4lD7z0YwowBG5sR2EdMGQTryGbZ7kdgeQwPAULAQY6H9BWeMm3csid2hQgZqQK2ovnQ=
X-Received: by 2002:a17:907:728c:b0:72b:995f:78d with SMTP id
 dt12-20020a170907728c00b0072b995f078dmr7700974ejc.348.1657789349672; 
 Thu, 14 Jul 2022 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1slU3L+Ymn2F2IUeTVbBq+1Nq6qRAje0KJQsKVZtzFqPfJQmH4KuoXDWFGxonoelyc0oEyZCQ==
X-Received: by 2002:a17:907:728c:b0:72b:995f:78d with SMTP id
 dt12-20020a170907728c00b0072b995f078dmr7700944ejc.348.1657789349236; 
 Thu, 14 Jul 2022 02:02:29 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a1709060d8900b0072af6f166c2sm460560eji.82.2022.07.14.02.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 09/20] scsi-disk: add SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD
 quirk for Macintosh
Date: Thu, 14 Jul 2022 11:02:00 +0200
Message-Id: <20220714090211.304305-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

During SCSI bus enumeration A/UX sends a MODE SENSE command to the CDROM with
the DBD bit unset and expects the response to include a block descriptor. As per
the latest SCSI documentation, QEMU currently force-disables the block
descriptor for CDROM devices but the A/UX driver expects the requested block
descriptor to be returned.

If the block descriptor is not returned in the response then A/UX becomes
confused, since the block descriptor returned in the MODE SENSE response is
used to generate a subsequent MODE SELECT command which is then invalid.

Add a new SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD quirk to allow this behaviour
to be enabled as required. Note that an additional workaround is required for
the previous SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR quirk which must never
return a block descriptor even though the DBD bit is left unset.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c    | 27 +++++++++++++++++++++++----
 include/hw/scsi/scsi.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 2672730eca..b1d08bfba5 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1279,10 +1279,27 @@ static int scsi_disk_emulate_mode_sense(SCSIDiskReq *r, uint8_t *outbuf)
             dev_specific_param |= 0x80; /* Readonly.  */
         }
     } else {
-        /* MMC prescribes that CD/DVD drives have no block descriptors,
-         * and defines no device-specific parameter.  */
-        dev_specific_param = 0x00;
-        dbd = true;
+        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD)) {
+            /* Use DBD from the request... */
+            dev_specific_param = 0x00;
+
+            /*
+             * ... unless we receive a request for MODE_PAGE_APPLE_VENDOR
+             * which should never return a block descriptor even though DBD is
+             * not set, otherwise CDROM detection fails in MacOS
+             */
+            if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR) &&
+                page == MODE_PAGE_APPLE_VENDOR) {
+                dbd = true;
+            }
+        } else {
+            /*
+             * MMC prescribes that CD/DVD drives have no block descriptors,
+             * and defines no device-specific parameter.
+             */
+            dev_specific_param = 0x00;
+            dbd = true;
+        }
     }
 
     if (r->req.cmd.buf[0] == MODE_SENSE) {
@@ -3102,6 +3119,8 @@ static Property scsi_cd_properties[] = {
                       5),
     DEFINE_PROP_BIT("quirk_mode_page_apple_vendor", SCSIDiskState, quirks,
                     SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
+    DEFINE_PROP_BIT("quirk_mode_sense_rom_use_dbd", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index e090ea1b40..845d05722b 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -228,5 +228,6 @@ extern const SCSIReqOps scsi_generic_req_ops;
 
 /* scsi-disk.c */
 #define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
+#define SCSI_DISK_QUIRK_MODE_SENSE_ROM_USE_DBD             1
 
 #endif
-- 
2.36.1



