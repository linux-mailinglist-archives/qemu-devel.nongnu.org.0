Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3DA57486E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:17:37 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBuyT-0002tC-BX
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuju-00056Q-Uu
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBujt-0005xx-BZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AI8wES1qKseyfvJptO7VtOVvhwLXSQUcnqOlBIz2DAs=;
 b=aBj8nkph9HnZdiSS5KH8rOk2TyAORnMwH7Usf+hoaby07pUuYW5Vz2N/A1QaNrOW1U9p/h
 celFatpoH30pyAYZqltr6/VIFmCteYtFamxKisEfxL02uP+ft2ktYml16+D9wuWFY4ASvl
 091ojtfSvtord4QPMvSf3Z+TFYHXkG4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-IOQFiGr2OtuyHVnDgG6k_Q-1; Thu, 14 Jul 2022 05:02:27 -0400
X-MC-Unique: IOQFiGr2OtuyHVnDgG6k_Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 m10-20020a056402510a00b0043a93d807ffso1096625edd.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AI8wES1qKseyfvJptO7VtOVvhwLXSQUcnqOlBIz2DAs=;
 b=rro8B+B8v5fqQ9gKH6pGCbS/YDnxn5vvau5ONhnnftEAm9UryJihspWI0K5nxu1W7T
 u0lwJdkPsgLml+M/NrXCefveu0bbr+3ZID8QpZfrFVR0pCW3XvIsSMwDCa5OhXMmvTlx
 1jNbH7d4DGainTWpH5xMtaBDyBa4CuO8MAOKZax0Qba/noaC/SXSnIz77c052toHnPQx
 3OLK/agNm1aji5feZZSJDLU4ia7PJlOgomiLMLDLLGrIVostqOIZNd3DoCUhQrHw44vv
 88BVF5+qxuEXu+Yc4w4b8m5QqOqLFR2N40TMPXpWgKSHghKIE9N5DtIoV4YEK4FVwyb9
 8RUQ==
X-Gm-Message-State: AJIora+WGqnF8dnh3biPeWIs0uwNCEBG2rCqAE28qlc4kRfvDhpUUFPg
 rkidevReOo4cr4ON/S+1SdttS8pZ99ooDtcXeaigBOaskbS8j4bYwcQKM+u70TfSh3Gb31+3TMc
 F/bpIJRagx4gwLB4Hk6X04+s+NNbnizooikS0JqWt2Pi/DN+3EzU9XQZcsf7QX3gSdmg=
X-Received: by 2002:a17:907:d26:b0:72b:8311:a167 with SMTP id
 gn38-20020a1709070d2600b0072b8311a167mr7642624ejc.89.1657789346198; 
 Thu, 14 Jul 2022 02:02:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKraSLNTRrNBTUN//00744IvgmiiQwCuXcV23BBtaf0/7kwmgT3wtf6yPZ1UwddSb2JsIw7w==
X-Received: by 2002:a17:907:d26:b0:72b:8311:a167 with SMTP id
 gn38-20020a1709070d2600b0072b8311a167mr7642596ejc.89.1657789345912; 
 Thu, 14 Jul 2022 02:02:25 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 z16-20020a1709064e1000b006fe9f9d0938sm452008eju.175.2022.07.14.02.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/20] scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for Macintosh
Date: Thu, 14 Jul 2022 11:01:58 +0200
Message-Id: <20220714090211.304305-8-pbonzini@redhat.com>
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

One of the mechanisms MacOS uses to identify CDROM drives compatible with MacOS
is to send a custom MODE SELECT command for page 0x30 to the drive. The
response to this is a hard-coded manufacturer string which must match in order
for the CDROM to be usable within MacOS.

Add an implementation of the MODE SELECT page 0x30 response guarded by a newly
defined SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR quirk bit so that CDROM drives
attached to non-Apple machines function exactly as before.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220622105314.802852-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/scsi-disk.c      | 17 +++++++++++++++++
 include/hw/scsi/scsi.h   |  3 +++
 include/scsi/constants.h |  1 +
 3 files changed, 21 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 55c19fb25d..2672730eca 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1085,6 +1085,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         [MODE_PAGE_R_W_ERROR]              = (1 << TYPE_DISK) | (1 << TYPE_ROM),
         [MODE_PAGE_AUDIO_CTL]              = (1 << TYPE_ROM),
         [MODE_PAGE_CAPABILITIES]           = (1 << TYPE_ROM),
+        [MODE_PAGE_APPLE_VENDOR]           = (1 << TYPE_ROM),
     };
 
     uint8_t *p = *p_outbuf + 2;
@@ -1229,6 +1230,20 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
         p[19] = (16 * 176) & 0xff;
         break;
 
+     case MODE_PAGE_APPLE_VENDOR:
+        if (s->quirks & (1 << SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR)) {
+            length = 0x1e;
+            if (page_control == 1) { /* Changeable Values */
+                break;
+            }
+
+            memset(p, 0, length);
+            strcpy((char *)p + 8, "APPLE COMPUTER, INC   ");
+            break;
+        } else {
+            return -1;
+        }
+
     default:
         return -1;
     }
@@ -3085,6 +3100,8 @@ static Property scsi_cd_properties[] = {
                        DEFAULT_MAX_IO_SIZE),
     DEFINE_PROP_INT32("scsi_version", SCSIDiskState, qdev.default_scsi_version,
                       5),
+    DEFINE_PROP_BIT("quirk_mode_page_apple_vendor", SCSIDiskState, quirks,
+                    SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 1ffb367f94..e090ea1b40 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -226,4 +226,7 @@ SCSIDevice *scsi_device_get(SCSIBus *bus, int channel, int target, int lun);
 /* scsi-generic.c. */
 extern const SCSIReqOps scsi_generic_req_ops;
 
+/* scsi-disk.c */
+#define SCSI_DISK_QUIRK_MODE_PAGE_APPLE_VENDOR             0
+
 #endif
diff --git a/include/scsi/constants.h b/include/scsi/constants.h
index 2a32c08b5e..891aa0f45c 100644
--- a/include/scsi/constants.h
+++ b/include/scsi/constants.h
@@ -234,6 +234,7 @@
 #define MODE_PAGE_FAULT_FAIL                  0x1c
 #define MODE_PAGE_TO_PROTECT                  0x1d
 #define MODE_PAGE_CAPABILITIES                0x2a
+#define MODE_PAGE_APPLE_VENDOR                0x30
 #define MODE_PAGE_ALLS                        0x3f
 /* Not in Mt. Fuji, but in ATAPI 2.6 -- deprecated now in favor
  * of MODE_PAGE_SENSE_POWER */
-- 
2.36.1



