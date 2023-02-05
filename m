Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C068AE42
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWgC-0007FV-K6; Sat, 04 Feb 2023 23:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfb-0007Ek-HR
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:27 -0500
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfZ-0006C1-Gk
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:27 -0500
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 256644721
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z2cv/qNWr38r44XvrR0YlcFynXyQoLVcMsEvi/4bfWQNrUpz1mFSz
 WVOUGjTMv/ZYDfxLoonao7l9kNQupGGyIdiGQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656CEmjslkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s15Kiq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE5chXJxo8ZM4h3O9NOmdHq
 eIWFDA/YUXW7w626OrTpuhEg80iKIzyItpatC46iz7eCvkiTNbIRKCiCd1whm9hwJATW6yHN
 oxGM1KDbzyZC/FLEl4TGJQyhs+imz/yfyAwRFe9//dpvTSPk1YouFTrGILTItO6ecwMpX6J+
 0Wc3UP6WT9Gd9PKnFJp9Vrp3IcjhxjTQY8XCfi0++BnhHWVwWocDgBQUkG0ycRVkWa7UtNbb
 lUKo28g8vJ0+0usQd3wGRa/pRZooyIhZjaZKMVigCnl90Yey13x6rQsJtKZVOEbiQ==
IronPort-HdrOrdr: A9a23:PAkZiqhFNAb9o5o76FFrsTUK+3BQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:24 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 jo26-20020a056214501a00b0053aa15f61d4so4501206qvb.7
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFLxMEp2r8yiWAlvNWwqHg1ftE8mrJVRMTGKTtgibDE=;
 b=offjED22wZtTH6tSL9JqNt45FGxJXvHPXNT7LKZAIwZfMWjmHu7ySAc3Cs3UYMndCj
 FJ+5VklAfwnWMxXMWsUKXCDWfnacrjzaq+zdHOSu0Hka1lhx6QeP/Q1o/w+WOWEIHbLS
 /nRqWQ230ZVM5ZllheLr1fg7JrssM7qEPT0RcrZ5EOP7MmH6V/zp0dJgQlHvi6drMemY
 efhvVj4MJ08P+irigj+bJ8HRtCk6eM1eQaPmOdxz22f9YVw5hz+VzKchagxlkH5WmyaP
 r8xcXb0P3i4TLIZufpLnG5ubRqDoBaiSc4PIw4ACOarLh0JDjQ+2HOFR/vFlk0753/LH
 WP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pFLxMEp2r8yiWAlvNWwqHg1ftE8mrJVRMTGKTtgibDE=;
 b=g7Hs6SdcVlWRA3JPE4mMpLj20wo6DlX1uQM6nDX/0FI4snKlc/EUN/GfW2uPelibsa
 HkguX655NbuJq1D5U2cxI5gTXC8/EbIGLwjs8rMytvRM7GSScPcvV+7ZFbw7FGPbmaL7
 /PGCJBm0tRciuSOFhA7+9OLpy0tRherpahajJpmbdTPvh9QdiBwY1TI/lEXjiwjxPNs0
 zlteG9gFmokWTUxzb4meCrEGMDcxRlQZxy0OnFAYFgutfxvW2xi3+ght2Wy7UUI9JhZ5
 cPX25dYAz7XBBPC7orCPHyiF1vsjali9i9PTjqFtmttJYNuxQI5H2858S+IGMZvF0jUK
 RESA==
X-Gm-Message-State: AO0yUKXCeURzi8ci3xv3zsQBLYT1CJm7d34habwqtnzKkPBx1ylRGFMp
 M8XdGsH0YWeQnTzM7K3fZmnqGbLuzwGfrLSroQQNZIjeMx5U12fOs4tAb2WsqYTKGH/QlzjOzb2
 gfeqvcKDd3Y+pwuWNa1FxiCyQ40Ttgg==
X-Received: by 2002:a05:622a:4b:b0:3b8:6cf0:da83 with SMTP id
 y11-20020a05622a004b00b003b86cf0da83mr29312790qtw.42.1675571422435; 
 Sat, 04 Feb 2023 20:30:22 -0800 (PST)
X-Google-Smtp-Source: AK7set8Pf9HMqSXFCkePQRTQspYgPDgZji/VhlStjpktGMRsu2uRrIdOoh+0DTwaynrzcO0uFPV/eQ==
X-Received: by 2002:a05:622a:4b:b0:3b8:6cf0:da83 with SMTP id
 y11-20020a05622a004b00b003b86cf0da83mr29312780qtw.42.1675571422085; 
 Sat, 04 Feb 2023 20:30:22 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 63-20020a370a42000000b00719d9f823c4sm4891482qkk.34.2023.02.04.20.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:21 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 07/10] fuzz/virtio-blk: remove fork-based fuzzer
Date: Sat,  4 Feb 2023 23:29:48 -0500
Message-Id: <20230205042951.3570008-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
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
 tests/qtest/fuzz/virtio_blk_fuzz.c | 51 ++++--------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index a9fb9ecf6c..82575a11d9 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -19,7 +19,6 @@
 #include "standard-headers/linux/virtio_pci.h"
 #include "standard-headers/linux/virtio_blk.h"
 #include "fuzz.h"
-#include "fork_fuzz.h"
 #include "qos_fuzz.h"
 
 #define TEST_IMAGE_SIZE         (64 * 1024 * 1024)
@@ -128,48 +127,24 @@ static void virtio_blk_fuzz(QTestState *s, QVirtioBlkQueues* queues,
     }
 }
 
-static void virtio_blk_fork_fuzz(QTestState *s,
-        const unsigned char *Data, size_t Size)
-{
-    QVirtioBlk *blk = fuzz_qos_obj;
-    static QVirtioBlkQueues *queues;
-    if (!queues) {
-        queues = qvirtio_blk_init(blk->vdev, 0);
-    }
-    if (fork() == 0) {
-        virtio_blk_fuzz(s, queues, Data, Size);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
-
 static void virtio_blk_with_flag_fuzz(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
     QVirtioBlk *blk = fuzz_qos_obj;
     static QVirtioBlkQueues *queues;
 
-    if (fork() == 0) {
-        if (Size >= sizeof(uint64_t)) {
-            queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
-            virtio_blk_fuzz(s, queues,
-                             Data + sizeof(uint64_t), Size - sizeof(uint64_t));
-            flush_events(s);
-        }
-        _Exit(0);
-    } else {
+    if (Size >= sizeof(uint64_t)) {
+        queues = qvirtio_blk_init(blk->vdev, *(uint64_t *)Data);
+        virtio_blk_fuzz(s, queues,
+                Data + sizeof(uint64_t), Size - sizeof(uint64_t));
         flush_events(s);
-        wait(NULL);
     }
+    fuzz_reboot(s);
 }
 
 static void virtio_blk_pre_fuzz(QTestState *s)
 {
     qos_init_path(s);
-    counter_shm_init();
 }
 
 static void drive_destroy(void *path)
@@ -208,22 +183,10 @@ static void *virtio_blk_test_setup(GString *cmd_line, void *arg)
 
 static void register_virtio_blk_fuzz_targets(void)
 {
-    fuzz_add_qos_target(&(FuzzTarget){
-                .name = "virtio-blk-fuzz",
-                .description = "Fuzz the virtio-blk virtual queues, forking "
-                                "for each fuzz run",
-                .pre_vm_init = &counter_shm_init,
-                .pre_fuzz = &virtio_blk_pre_fuzz,
-                .fuzz = virtio_blk_fork_fuzz,},
-                "virtio-blk",
-                &(QOSGraphTestOptions){.before = virtio_blk_test_setup}
-                );
-
     fuzz_add_qos_target(&(FuzzTarget){
                 .name = "virtio-blk-flags-fuzz",
-                .description = "Fuzz the virtio-blk virtual queues, forking "
-                "for each fuzz run (also fuzzes the virtio flags)",
-                .pre_vm_init = &counter_shm_init,
+                .description = "Fuzz the virtio-blk virtual queues. "
+                "Also fuzzes the virtio flags)",
                 .pre_fuzz = &virtio_blk_pre_fuzz,
                 .fuzz = virtio_blk_with_flag_fuzz,},
                 "virtio-blk",
-- 
2.39.0


