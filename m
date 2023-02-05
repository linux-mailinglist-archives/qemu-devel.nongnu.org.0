Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B2468AE4C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfX-0007Dr-IE; Sat, 04 Feb 2023 23:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfU-0007Cy-CB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:20 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfS-0006B8-Nk
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:20 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 257704565
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nd1zU647b2dtmuq5NBTQyAxRtIbFchMFZxGqfqrLsTDasY5as4F+v
 jNJXzzVaPeOMzOjeNhzPNux8BsHv5XcxoRiSQVlqn1hEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlA4gRlDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kRM9wIo/1SH11c5
 PYfGR8mLSyKn+2plefTpulE3qzPLeHuNYIb/2h8lHTXVKd3B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2MxNFKZMkwn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYsj+e1bIeLJ7RmQ+0SxH+b/
 kHZ/V/4KQ4fbtaR9Ban/Vaj07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6BXuQICsDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:d76xpKloiXYae1HJ9lBox3ZwHRHpDfL63DAbv31ZSRFFG/FwWf
 re+MjzsiWE9Ar5PUtLpTnuAtjnfZqxz+8W3WBVB8bYYOCEghrUEGgd1/qa/9SIIUSXnZ8/6U
 4jSdkFNDSZNzhHZK3BkW6F+rgbsby62ZHtr8vli1lWcSFWR5dJ0zpZYzzrbXGehzMrOXP6Lv
 ehDwZ8yQZIAU5nFvhTz0NrPtT+mw==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:17 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 bs11-20020ac86f0b000000b003b9b4ec27c4so4732086qtb.19
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iOOCbqIFWI5B1mqP3vuloqlMjg+VQAzQG7EsDxkjfAk=;
 b=GDKRXAi/vdryaRt8mx+cA3D4wuEZLVkYgGDljozHfvUY1B5VODiBsGChOYGT4mn1aC
 hzf1qu3PnyzAaa5xsx7pM7fyI6CQ2mfLPn+l+ZNkVdJT7Zi1sD4x7/q5NUzm0o1VGg/w
 lsgwmeG/2+rzjkqL9gDRS8AT9g+oM+du/QgFX45q+J3N9x9dzn1jpHSZfdWrrJXQCDqj
 c7OcrJlTI/ntorjBj6YFuODhMy8yCmi8VKphYBy9dO7Y4p7d5EsyxWrkHuzZbfpJK1IV
 9TJAztijdUSjbcUGVhKvj/jk1T2eSfoWiOZWKEHRf6BiwPlfwbX+xeXwjMlryPijVDJQ
 PNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iOOCbqIFWI5B1mqP3vuloqlMjg+VQAzQG7EsDxkjfAk=;
 b=hSZM61qVAhj4Xs+5cDTFgaDxFy0ddzjss+1/lsxlp7TMLnkHJKk3l1gtShOrXkIX36
 sQ6HnA0ZHtiIoJ5+9RVFJrZ4fu7RTE83Eh1q/t30VO5fis+0/Vv2Vhby+3fDSa0M7H0k
 /cjICQKnmytXKLcSNlCjFI1gttBLt0DVpJPRcVyKModIVxhNE8nN8abUKeP665f7Q9gC
 cLU1iC5VILwANOiPMMk2AJbtLypqVjcjIPkxRp/nX3BoQvk4l7GXd/z6D/30dl5pY+h2
 wA9rP9tNZr7h1qV6peO+xQeIFZBOvSVqEnbHMYxY4m27aLjtR0VTw/wfb+tsW8U6iKMG
 hvIQ==
X-Gm-Message-State: AO0yUKVQ5EXZ3F3/RyB6BDRM4DfC1V3vRyv+A2V47AXMUwDqyilqaeTr
 ERNG1vd5e0lSp9MmkalXsjvC4lWyJDhyptQtcL8KRh/YDv0fw505fXKqk3nUsxG2mtcjXOz2KUH
 p5ODYADIZ9pRXZXNrtm3ow36pThGy2w==
X-Received: by 2002:a05:6214:5011:b0:567:fe96:85a5 with SMTP id
 jo17-20020a056214501100b00567fe9685a5mr16155937qvb.22.1675571416668; 
 Sat, 04 Feb 2023 20:30:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9H9sPr03GriLEmXaJrNvr/4mXJTkxYE9g3rkX5HdFYmW90VemaVlUE78sQQtbxsi8JdpJWYQ==
X-Received: by 2002:a05:6214:5011:b0:567:fe96:85a5 with SMTP id
 jo17-20020a056214501100b00567fe9685a5mr16155918qvb.22.1675571416413; 
 Sat, 04 Feb 2023 20:30:16 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 dw28-20020a05620a601c00b00728bbe45888sm4959084qkb.10.2023.02.04.20.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:16 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 05/10] fuzz/virtio-scsi: remove fork-based fuzzer
Date: Sat,  4 Feb 2023 23:29:46 -0500
Message-Id: <20230205042951.3570008-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 tests/qtest/fuzz/virtio_scsi_fuzz.c | 51 ++++-------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
index b3220ef6cb..8b26e951ae 100644
--- a/tests/qtest/fuzz/virtio_scsi_fuzz.c
+++ b/tests/qtest/fuzz/virtio_scsi_fuzz.c
@@ -20,7 +20,6 @@
 #include "standard-headers/linux/virtio_pci.h"
 #include "standard-headers/linux/virtio_scsi.h"
 #include "fuzz.h"
-#include "fork_fuzz.h"
 #include "qos_fuzz.h"
 
 #define PCI_SLOT                0x02
@@ -132,48 +131,24 @@ static void virtio_scsi_fuzz(QTestState *s, QVirtioSCSIQueues* queues,
     }
 }
 
-static void virtio_scsi_fork_fuzz(QTestState *s,
-        const unsigned char *Data, size_t Size)
-{
-    QVirtioSCSI *scsi = fuzz_qos_obj;
-    static QVirtioSCSIQueues *queues;
-    if (!queues) {
-        queues = qvirtio_scsi_init(scsi->vdev, 0);
-    }
-    if (fork() == 0) {
-        virtio_scsi_fuzz(s, queues, Data, Size);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
-
 static void virtio_scsi_with_flag_fuzz(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
     QVirtioSCSI *scsi = fuzz_qos_obj;
     static QVirtioSCSIQueues *queues;
 
-    if (fork() == 0) {
-        if (Size >= sizeof(uint64_t)) {
-            queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
-            virtio_scsi_fuzz(s, queues,
-                             Data + sizeof(uint64_t), Size - sizeof(uint64_t));
-            flush_events(s);
-        }
-        _Exit(0);
-    } else {
+    if (Size >= sizeof(uint64_t)) {
+        queues = qvirtio_scsi_init(scsi->vdev, *(uint64_t *)Data);
+        virtio_scsi_fuzz(s, queues,
+                Data + sizeof(uint64_t), Size - sizeof(uint64_t));
         flush_events(s);
-        wait(NULL);
     }
+    fuzz_reboot(s);
 }
 
 static void virtio_scsi_pre_fuzz(QTestState *s)
 {
     qos_init_path(s);
-    counter_shm_init();
 }
 
 static void *virtio_scsi_test_setup(GString *cmd_line, void *arg)
@@ -189,22 +164,10 @@ static void *virtio_scsi_test_setup(GString *cmd_line, void *arg)
 
 static void register_virtio_scsi_fuzz_targets(void)
 {
-    fuzz_add_qos_target(&(FuzzTarget){
-                .name = "virtio-scsi-fuzz",
-                .description = "Fuzz the virtio-scsi virtual queues, forking "
-                                "for each fuzz run",
-                .pre_vm_init = &counter_shm_init,
-                .pre_fuzz = &virtio_scsi_pre_fuzz,
-                .fuzz = virtio_scsi_fork_fuzz,},
-                "virtio-scsi",
-                &(QOSGraphTestOptions){.before = virtio_scsi_test_setup}
-                );
-
     fuzz_add_qos_target(&(FuzzTarget){
                 .name = "virtio-scsi-flags-fuzz",
-                .description = "Fuzz the virtio-scsi virtual queues, forking "
-                "for each fuzz run (also fuzzes the virtio flags)",
-                .pre_vm_init = &counter_shm_init,
+                .description = "Fuzz the virtio-scsi virtual queues. "
+                "Also fuzzes the virtio flags",
                 .pre_fuzz = &virtio_scsi_pre_fuzz,
                 .fuzz = virtio_scsi_with_flag_fuzz,},
                 "virtio-scsi",
-- 
2.39.0


