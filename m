Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAF69A4B2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:11:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4q-0001qo-Bb; Thu, 16 Feb 2023 23:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4i-0001Hl-Hy
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs4f-0001C4-RY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:10:20 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 259423681
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ZBVYP6qTmTQfYkdwwKD34Pw6hKteBmKmZxIvgKrLsJaIsI4StFCzt
 garIBmOaP+DZjf9e9tyYdy08EgB7JLdzYIyTwU4ry00HysU85acVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK4T5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxOFLAj5o3
 PgicmopbgCTxOS2nIOgc7w57igjBJGD0II3v3hhyXTAEa9jT8mSEuPF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKZPUUJYwZGYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3bYuJIIfUFZw9ckCwh
 Ebv9Fn9ADgjafuA5wuo/S22md/AgnauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV8WkGhPh8S/CsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJVeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:X5Kf8qp3hBpxNSC02kxc1LsaV5r9eYIsimQD101hICG9vPbo8/
 xG+85rqSMc7Qx6ZJhOo6HnBEDtewK/yXcx2/hrAV7AZniahILXFvAa0WKK+VSJcFycygce79
 YbT0EXMr3N5DNB/KHHCWeDYrMd6ejC2oyTwcnl81dRYTdDV5xAhj0JdTpz0XcbeOCFP/cE/V
 aniPav3wDQAUj/p/7VZ0U4Yw==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:48 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 v8-20020a05622a144800b003ba0dc5d798so2422322qtx.22
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+rkA7yqe1v+7MHE0IZMKWViVHmTa9V+2cxVonneGdM=;
 b=ZN4Td4vsCoU/hUW7hCp6pxTvQfswziU/JHwCg+ASNt4V3zLD7HS2LsRN46sWEv+dpw
 fG82FakUqT+z6VFuRo+rTE2p6vPQWGhR/CEI/eszQiIpS9L/z/LF/2Vwbl16vrjLey1P
 1sxVjCmAf2vjTT85p2vlPVp7NBlJo7X7iEFLDQMU1KxHR+wsOQ01SOMSODeODSHYzNjQ
 XE/o0xwIFpwxbBeJ4a8ps/AS9Dd00/EBdzNPpew3nmXpT+0hko1XNuRtTk+nubof7yYf
 JQ4JcbPnSqmZBov6twq8dXVGJHjrWIFVN4Td8V3xyoOj8fCPvBlXpzm5iHVGKDRD5C1+
 uSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+rkA7yqe1v+7MHE0IZMKWViVHmTa9V+2cxVonneGdM=;
 b=PQOUYidSYlTrMNV7ESLXcDDWlAX/nYWQYZQTuqHspywzQOiYqrcJKUXk0FI23mebVM
 kLdB+c4C3V+IEh5ZZ9kIwUEVrMImTqnJ+mUvol1AHSphfsVu4OCBJcV4kZxPtUSgQhOe
 xKvW27aEPKdWz9Pe0asG2zRKSGEeopUmBL9lj/W6u7JuKqJj989Rbuojuke6BwuVItuD
 nJyifEp/7Dpiyjc27btanB5p4xrKCEHk8HVrwOQPbIepgD0rCBKm8/vIsz1C8EvlUTiT
 GCsEOVgM1eX7nlXB0Q9Y4rt/IqCuI7CAkLuKPwuTpahaRko53bFWFMwm1o+TTLRWUwkS
 WvKg==
X-Gm-Message-State: AO0yUKUW2fMt4prjPmW1APRbZ0m0rw4YTSrN5xf50WaThwKBnrHDcEyp
 zjKYEfhxO03esTXAOq6aSWn+XUV0BL86j3S17ksj+wcIJcDmtUJMq5dktJBsTWtM7v6IJs+9fTO
 3YA0Zgr2t5aEZ2BfUMnEgzx3/YdAgIGUcylrt2A==
X-Received: by 2002:a05:6214:23cc:b0:56e:f1fd:f16c with SMTP id
 hr12-20020a05621423cc00b0056ef1fdf16cmr8638792qvb.20.1676606987148; 
 Thu, 16 Feb 2023 20:09:47 -0800 (PST)
X-Google-Smtp-Source: AK7set94/RB1USkEdYBdQOE+vbH1Mk9S1f30OiDruEr7MFWiUAm5mvjyrEi1F3aq6cw5rzqK3+KH9A==
X-Received: by 2002:a05:6214:23cc:b0:56e:f1fd:f16c with SMTP id
 hr12-20020a05621423cc00b0056ef1fdf16cmr8638759qvb.20.1676606986833; 
 Thu, 16 Feb 2023 20:09:46 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a3769c4000000b0073b9c59e668sm1842810qkc.74.2023.02.16.20.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:46 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 07/10] fuzz/virtio-blk: remove fork-based fuzzer
Date: Thu, 16 Feb 2023 23:08:52 -0500
Message-Id: <20230217040855.16873-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
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
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 tests/qtest/fuzz/virtio_blk_fuzz.c | 51 ++++--------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index a9fb9ecf6c..651fd4f043 100644
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
+    fuzz_reset(s);
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


