Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D169A4AA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs4L-0000il-Rx; Thu, 16 Feb 2023 23:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs48-0000ib-R2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:44 -0500
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs46-0001Aw-VH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:44 -0500
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 259336063
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IMEb96tM1C404ui/cfmKGQid3+fnVOhcMUV32f8akzHdYApBsoF/q
 tZmKW3XafrfMzTyKdpxa4i3pk0A78TUm4c1GQFu/3swHyMU9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZnO6gQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUa28VmODtg+
 cA7cm4OVT6gl8TuzpOkH7wEasQLdKEHPasas3BkiCjFVLMoG8ibBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk2eO1sVYg9/5JEWxY9EglH2dy1epEi9r7dx7mTOpOB0+OKwYYGOJITUHq25mG7Bj
 zn9/U3/CyoZNee08hDU7GC0xcr2yHaTtIU6UefQGuRRqESew3FWBBAIWF+Tp/6/hUijHdVFJ
 CQpFjEGqKEz8AmyUoC4UUfg+DiLuRkTX9cWGOo/gO2Q9pfpD8+iLjBsZlZ8hBYO7qfamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:2dLnhqMi+NmR28BcTvKjsMiBIKoaSvp037B87TEJdfU1SL38qy
 jN9M5w6faQslsssR4b9exoVJPufZq+z+8W3WByB9eftVLdyQ2VxehZhOOI/9SHIUPDH4VmpM
 RdmsZFaeEZojJB/L7HCKXTKadF/DEnmprY4tvj8w==
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:41 -0500
Received: by mail-qt1-f200.google.com with SMTP id
 l10-20020ac84a8a000000b003bd0d4e3a50so13765qtq.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Phgy+V4He7Yjv/0srTRJ3QnbvcXvk52FKU0VdrYD9A=;
 b=YlylxUS4Z5rNWhUMkkpcW4I/V2zNVCelJQHZByEjKIudp3ROaj2QnDPZMPkx09TBHQ
 uB0Lc1Wmhb2/nGGfgSOW/OkjlSjotaBLi+pr/Riq501nB/wv/qdH0A+DcW6fBgGM9kA8
 gq6hAGZjIIa2bIj0BInEML4DzWseyUTEWuAUpZMzldzrFwgeREVm1Arz0qnnt8rOLLym
 JaMEoAecyEGc1YDUAeM4pPHQDqGzVo7pUSCsCUVj2DoAi2wBYvfnvmdm5u5QGyMj7auz
 tNVa6tWxIdqZv18TKZdbvkpLK4fYqDgZ/SYlH8pSVqd9g3fRBxF/P6f5LFkcp2zGNGBM
 jfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Phgy+V4He7Yjv/0srTRJ3QnbvcXvk52FKU0VdrYD9A=;
 b=GZwZRe35dvh0hrnIM7n+BYhwk0Xm+RdT85/HUo8jDw++xieO+Ao17YYbdepvagSbq0
 UCm/09twfbVNn5rB46AyN/PQukaTa6AKrcW0Lz6/yRyKO+GAXrrUup55Xql0XW3QC7q+
 CSD4MRZr2CtJjUvFBUnvSBFRTERaIH/m85HKkB1INu0zq3ouzffMypxM3D6WC4wHKTK2
 OLpP7C9rpoJIHhWFJLgT73wXyoKBuUIC0COCqsikB6NXpl/G//reoG+63dLDUoXr4aKg
 WUHcyHMHL7tNicRNZhRcJyu32fvUEB3hD8PjMRjtYSPWVICNA6UdcjCsEnLxNDENcz8a
 Nd5A==
X-Gm-Message-State: AO0yUKWAT2ORCQKv+PaVdycRqkX934U/pYIr4kNUMRshke+xMjE7ZX2q
 dDozl4Lti44LdGDH7mBXQcWnj6JP8IpqpvnCkEm66ExbQMGz4qcsK4Eroc8nKEeVFlZAOn40wCw
 38UDAU6P+anmebFkAeMU5NHHSCgiUKIyeB5gMPw==
X-Received: by 2002:ac8:4e89:0:b0:3b9:bc8c:c1fa with SMTP id
 9-20020ac84e89000000b003b9bc8cc1famr8287654qtp.5.1676606979796; 
 Thu, 16 Feb 2023 20:09:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+CJjB5o1U+wrT6R0alJdKgYoheQBsHzqdZrWhTnlOkX2bMCVcrq+Jy8V3iRU8uL7EwKYtk4A==
X-Received: by 2002:ac8:4e89:0:b0:3b9:bc8c:c1fa with SMTP id
 9-20020ac84e89000000b003b9bc8cc1famr8287638qtp.5.1676606979532; 
 Thu, 16 Feb 2023 20:09:39 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 e186-20020a3769c3000000b0073b2e678ffdsm2520578qkc.51.2023.02.16.20.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:39 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PULL 05/10] fuzz/virtio-scsi: remove fork-based fuzzer
Date: Thu, 16 Feb 2023 23:08:50 -0500
Message-Id: <20230217040855.16873-6-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230217040855.16873-1-alxndr@bu.edu>
References: <20230217040855.16873-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
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
 tests/qtest/fuzz/virtio_scsi_fuzz.c | 51 ++++-------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_scsi_fuzz.c b/tests/qtest/fuzz/virtio_scsi_fuzz.c
index b3220ef6cb..b6268efd59 100644
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
+    fuzz_reset(s);
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


