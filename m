Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40335F0FF3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 18:29:15 +0200 (CEST)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeIt0-0006cb-BK
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 12:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oeIpx-0001z2-2S
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:26:05 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:46762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1oeIpt-0001Xf-2E
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:26:02 -0400
Received: by mail-lf1-x12f.google.com with SMTP id a8so7612558lff.13
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=UrrD0Exi77GioeeFnA5EPj6klL2csA7S4Gu7HiZ2ciA=;
 b=eZBKt1XOsRgfVx0tfnjaqG45lgVmnH6kzV+V+DuAoQeVQPuUTObn6otZtjqpHnL+Rc
 jhRBeP6sqTb5JBZbnxaacSAt+JKKUvlKBzYPMleXkfOl3Ni30OtmUzz0McxNr83xb1Uj
 zAZNs94yUxSNNyR63rjM+bVUggu1jXuENG7Tayw78Xc4eTzajPVEwmpzjSbY2XNemkv1
 aVD/4YwX98yC778JF8f/FTSyhzE/5WouoQ5Ff7lSrHnEzzTs/IoDjCMtymKIgtcprPlU
 mhs4JEOyhrUGxZ37VWl883GAwmqg1j+Q9+R8MmRzYR1JZvH39VaBaO3fvSbfIkPqc40+
 zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=UrrD0Exi77GioeeFnA5EPj6klL2csA7S4Gu7HiZ2ciA=;
 b=uW3HGd4PCuJeBEQn1TXlOvjAwrRaM0X4809G1zyNQ/Q58s6Y2yaSXooOmsrrsgccKH
 HpgpkMhzfKm4WS64kQadvc5F1pEi1WCs0Wv+X4x/3/YATxamyqKWQgTUq3JwwXE7XQ6E
 r/cg4FkzHcLfT6boD+Fv+2i6d/6sMc4cLm+YsX0mNdrwHkFWvbfVXSRmhu5a56CmmFpQ
 0BKWVvE2cbSy9c2YpvwNP38UzByJaA6slCe3uufpeMY8dcy/o/SYjneq5v0SrXf+wa4M
 AmipCYtKf8VV0502YtAXZpHLYRGYNnfRLctcsskubKQ1XpRB2vIBtRw9C+bwyuP+vXoC
 R0zg==
X-Gm-Message-State: ACrzQf1+wxdq5p0L9DCuucqzEsOhWCWP9b5Rg4DSRYc7KZCUgIrB6wn9
 va67LZmyChWcQZANU4ckclfinAsh+CI42w==
X-Google-Smtp-Source: AMsMyM5jR5BVQY9BI1gKKhnaV8x9xmdJKc+mmEAxWbDptt7CrRN7fV9a3tfVoEm+Gp2p3IGyfyKJgA==
X-Received: by 2002:ac2:5bc3:0:b0:498:ff9:1cd1 with SMTP id
 u3-20020ac25bc3000000b004980ff91cd1mr3691976lfn.479.1664555158170; 
 Fri, 30 Sep 2022 09:25:58 -0700 (PDT)
Received: from localhost.localdomain (31-208-27-151.cust.bredband2.com.
 [31.208.27.151]) by smtp.gmail.com with ESMTPSA id
 g22-20020a05651222d600b0048b143c09c2sm332465lfu.259.2022.09.30.09.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 09:25:56 -0700 (PDT)
From: Francisco Iglesias <frasse.iglesias@gmail.com>
X-Google-Original-From: Francisco Iglesias <francisco.iglesias@amd.com>
To: qemu-devel@nongnu.org
Cc: frasse.iglesias@gmail.com, francisco.iglesias@amd.com,
 alistair@alistair23.me, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org, edgar.iglesias@amd.com, fkonrad@amd.com,
 sai.pavan.boddu@amd.com
Subject: [PATCH v1 1/1] hw/block/m25p80: Micron Xccela mt35xu01g flash Octal
 command support
Date: Fri, 30 Sep 2022 18:25:55 +0200
Message-Id: <20220930162555.3765-1-francisco.iglesias@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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

Provide the Micron Xccela flash mt35xu01g with Octal command support.

Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
---
 hw/block/m25p80.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a8d2519141..79e26424ec 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -360,6 +360,8 @@ typedef enum {
     READ4 = 0x13,
     FAST_READ = 0x0b,
     FAST_READ4 = 0x0c,
+    O_FAST_READ = 0x9d,
+    O_FAST_READ4 = 0xfd,
     DOR = 0x3b,
     DOR4 = 0x3c,
     QOR = 0x6b,
@@ -368,6 +370,10 @@ typedef enum {
     DIOR4 = 0xbc,
     QIOR = 0xeb,
     QIOR4 = 0xec,
+    OOR = 0x8b,
+    OOR4 = 0x7c,
+    OIOR = 0xcb,
+    OIOR4 = 0xcc,
 
     PP = 0x02,
     PP4 = 0x12,
@@ -375,6 +381,10 @@ typedef enum {
     DPP = 0xa2,
     QPP = 0x32,
     QPP_4 = 0x34,
+    OPP = 0x82,
+    OPP4 = 0x84,
+    EOPP = 0xc2,
+    EOPP4 = 0x8e,
     RDID_90 = 0x90,
     RDID_AB = 0xab,
     AAI_WP = 0xad,
@@ -430,6 +440,7 @@ typedef enum {
     MAN_WINBOND,
     MAN_SST,
     MAN_ISSI,
+    MAN_MICRON_OCTAL,
     MAN_GENERIC,
 } Manufacturer;
 
@@ -514,6 +525,8 @@ static inline Manufacturer get_man(Flash *s)
         return MAN_SST;
     case 0x9D:
         return MAN_ISSI;
+    case 0x2C:
+        return MAN_MICRON_OCTAL;
     default:
         return MAN_GENERIC;
     }
@@ -682,15 +695,20 @@ static inline int get_addr_length(Flash *s)
    case PP4:
    case PP4_4:
    case QPP_4:
+   case OPP4:
+   case EOPP4:
    case READ4:
    case QIOR4:
    case ERASE4_4K:
    case ERASE4_32K:
    case ERASE4_SECTOR:
    case FAST_READ4:
+   case O_FAST_READ4:
    case DOR4:
    case QOR4:
    case DIOR4:
+   case OOR4:
+   case OIOR4:
        return 4;
    default:
        return s->four_bytes_address_mode ? 4 : 3;
@@ -722,6 +740,10 @@ static void complete_collecting_data(Flash *s)
     case PP:
     case PP4:
     case PP4_4:
+    case OPP:
+    case OPP4:
+    case EOPP:
+    case EOPP4:
         s->state = STATE_PAGE_PROGRAM;
         break;
     case AAI_WP:
@@ -741,6 +763,12 @@ static void complete_collecting_data(Flash *s)
     case DIOR4:
     case QIOR:
     case QIOR4:
+    case OOR:
+    case OOR4:
+    case OIOR:
+    case OIOR4:
+    case O_FAST_READ:
+    case O_FAST_READ4:
         s->state = STATE_READ;
         break;
     case ERASE_4K:
@@ -963,6 +991,9 @@ static void decode_fast_read_cmd(Flash *s)
                                     SPANSION_DUMMY_CLK_LEN
                                     );
         break;
+    case MAN_MICRON_OCTAL:
+        s->needed_bytes += 8;
+        break;
     case MAN_ISSI:
         /*
          * The Fast Read instruction code is followed by address bytes and
@@ -1117,6 +1148,10 @@ static void decode_new_cmd(Flash *s, uint32_t value)
     case ERASE4_SECTOR:
     case PP:
     case PP4:
+    case OPP:
+    case OPP4:
+    case EOPP:
+    case EOPP4:
     case DIE_ERASE:
     case RDID_90:
     case RDID_AB:
@@ -1184,6 +1219,15 @@ static void decode_new_cmd(Flash *s, uint32_t value)
                           "DIO mode\n", s->cmd_in_progress);
         }
         break;
+    case OOR:
+    case OOR4:
+    case O_FAST_READ:
+        if (get_man(s) == MAN_MICRON_OCTAL) {
+            decode_fast_read_cmd(s);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
+        }
+        break;
 
     case DIOR:
     case DIOR4:
@@ -1204,6 +1248,19 @@ static void decode_new_cmd(Flash *s, uint32_t value)
                           "DIO mode\n", s->cmd_in_progress);
         }
         break;
+    case OIOR:
+    case OIOR4:
+    case O_FAST_READ4:
+        if (get_man(s) == MAN_MICRON_OCTAL) {
+            s->needed_bytes = get_addr_length(s);
+            s->needed_bytes += 16;
+            s->pos = 0;
+            s->len = 0;
+            s->state = STATE_COLLECTING_DATA;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: Unknown cmd %x\n", value);
+        }
+        break;
 
     case WRSR:
         /*
-- 
2.20.1


