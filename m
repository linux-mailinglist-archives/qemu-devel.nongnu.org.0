Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54E68AE47
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfb-0007Ej-SC; Sat, 04 Feb 2023 23:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfZ-0007EJ-IJ
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:25 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfX-0006Bn-Su
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:25 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 256594485
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k0didatMXL7ICD8npAgMHsZMYefnVOtcMUV32f8akzHdYApBsoF/q
 tZmKWHUb6nYNGf0f4t0aNizoEMAvJ7Xzt4xQAo/pXpnQSMR9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZmOagQ1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqVCxMcsE2d38
 MBJdmlVVR6ClfDn5JiSH7wEasQLdKEHPasas3BkiCjHVLMoH8GFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2RJUMeUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjeawYYaJKoHiqcN9vUW8/
 33M+1nCIAg2KeKwimqX0zGur7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37VLyC9ejDlu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:vrgQwKPJ6EptT8BcThejsMiBIKoaSvp037Dk7TEUdfUzSL3lqy
 nKpp4mPHDP+VAssR0b6LK90ey7MAjhHP1OkPQs1MmZLXDbUQKTRekInOjfKn/balfDH4ZmtZ
 uIGJIOb+EYY2IK6PrS0U2TP+xl7uO60J2Fs8/j8lYFd3AUV0ii1WtE48Sgf3GeiDMpOXNALu
 vl2iOPnVXARUgq
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:20 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 ib5-20020a0562141c8500b0053c23b938a0so4514340qvb.17
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHDhBXIdMrv1WJ0/+De0O/L/lQBwtTrFTHETIFhRcNE=;
 b=Hfwkq+0jPjM8fu2lNb29PbRIxJYak7S8otxTQULgVcMoJq1tos4Kywm5iyHNU3VCqx
 i9x16ZLStECwPDWQmaFXjqndAILTM8QtcTAaBDeQdIP+6NZSV9ulSCa3ZWs5c2s+aNXJ
 lntHCaHS8QzgZ9/vrG/Kt2PmzbuYnve66ahkSa1L0jjKoJMiPntbdsB5FqMzeLSbxFlz
 jsqYfjcGn4T9q5xjsWt9ByeSNpKnGj12lLALAMtPOmxZGIE3xrcK4kRcrCOgspS3XjAp
 +56cwTRM589f9fUIGth5lUq8JdPVdHb1UXn1NxeQGBQE4qzXwKmABo/9nby5/yPnxXfq
 swug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHDhBXIdMrv1WJ0/+De0O/L/lQBwtTrFTHETIFhRcNE=;
 b=l23Je0aYoNCUlcQaYLnsw1PnoZ/Mnj+KZTFzoBH2OAZqj2eDD5KEwWVNLGTbp/o1CW
 bChDafVE3Tc5IohyHiLDeKBQuIIetC/YjaWOMfWK2yLypbKGIRn7b2cVNkja2Uf6cvJp
 QYilQ6XyeUREq1XG/d4pI5XIu+99ckJqGQ83fDbEYleBJZ3h5z5C2cMcZngdz8LVgFpJ
 yDDJmMiNKIBFrt4LNrEIYnywcwEjJDlMQUF0cCQZCoIdfrCQP5taC7pwdZ2XF4B/JT4m
 wLZwhYGLMOxOPzL8oV9h6FFB22AyII9Ru2by0Y1MVTRb/W6VAm0bNxlJut7n/4077Uue
 gA6Q==
X-Gm-Message-State: AO0yUKVDvdIOXfuTABMyJplHgVYXQna16ouNK//baQcTlLXyapTNCV8Z
 WRd1Y51B/tPzqH6E6lXri7HzwuhVIq0u14KcvFKq4NUGJby0bcAbaQBOxWblwWUXZ14ZZq35XSP
 6fu+LWZ78OK+p0d0vF88fQHlTv/bg3A==
X-Received: by 2002:ac8:5a48:0:b0:3b9:d1c1:6da6 with SMTP id
 o8-20020ac85a48000000b003b9d1c16da6mr20511850qta.7.1675571419594; 
 Sat, 04 Feb 2023 20:30:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+vI0R0b4+vg2oEfKTNV3ynxdQgHwgCXjFySYeDcawNHdD/0LmpHqQZvccXBZqg6TU0pe8GCQ==
X-Received: by 2002:ac8:5a48:0:b0:3b9:d1c1:6da6 with SMTP id
 o8-20020ac85a48000000b003b9d1c16da6mr20511827qta.7.1675571419338; 
 Sat, 04 Feb 2023 20:30:19 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 g7-20020ac87d07000000b003b9a50c8fa1sm4775368qtb.87.2023.02.04.20.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:19 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 06/10] fuzz/virtio-net: remove fork-based fuzzer
Date: Sat,  4 Feb 2023 23:29:47 -0500
Message-Id: <20230205042951.3570008-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
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
 tests/qtest/fuzz/virtio_net_fuzz.c | 54 +++---------------------------
 1 file changed, 5 insertions(+), 49 deletions(-)

diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
index c2c15f07f0..d245ee66a1 100644
--- a/tests/qtest/fuzz/virtio_net_fuzz.c
+++ b/tests/qtest/fuzz/virtio_net_fuzz.c
@@ -16,7 +16,6 @@
 #include "tests/qtest/libqtest.h"
 #include "tests/qtest/libqos/virtio-net.h"
 #include "fuzz.h"
-#include "fork_fuzz.h"
 #include "qos_fuzz.h"
 
 
@@ -115,36 +114,18 @@ static void virtio_net_fuzz_multi(QTestState *s,
     }
 }
 
-static void virtio_net_fork_fuzz(QTestState *s,
-        const unsigned char *Data, size_t Size)
-{
-    if (fork() == 0) {
-        virtio_net_fuzz_multi(s, Data, Size, false);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
 
-static void virtio_net_fork_fuzz_check_used(QTestState *s,
+static void virtio_net_fuzz_check_used(QTestState *s,
         const unsigned char *Data, size_t Size)
 {
-    if (fork() == 0) {
-        virtio_net_fuzz_multi(s, Data, Size, true);
-        flush_events(s);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
+    virtio_net_fuzz_multi(s, Data, Size, true);
+    flush_events(s);
+    fuzz_reboot(s);
 }
 
 static void virtio_net_pre_fuzz(QTestState *s)
 {
     qos_init_path(s);
-    counter_shm_init();
 }
 
 static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
@@ -158,23 +139,8 @@ static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
     return arg;
 }
 
-static void *virtio_net_test_setup_user(GString *cmd_line, void *arg)
-{
-    g_string_append_printf(cmd_line, " -netdev user,id=hs0 ");
-    return arg;
-}
-
 static void register_virtio_net_fuzz_targets(void)
 {
-    fuzz_add_qos_target(&(FuzzTarget){
-            .name = "virtio-net-socket",
-            .description = "Fuzz the virtio-net virtual queues. Fuzz incoming "
-            "traffic using the socket backend",
-            .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz,},
-            "virtio-net",
-            &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
-            );
 
     fuzz_add_qos_target(&(FuzzTarget){
             .name = "virtio-net-socket-check-used",
@@ -182,20 +148,10 @@ static void register_virtio_net_fuzz_targets(void)
             "descriptors to be used. Timeout may indicate improperly handled "
             "input",
             .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz_check_used,},
+            .fuzz = virtio_net_fuzz_check_used,},
             "virtio-net",
             &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
             );
-    fuzz_add_qos_target(&(FuzzTarget){
-            .name = "virtio-net-slirp",
-            .description = "Fuzz the virtio-net virtual queues with the slirp "
-            " backend. Warning: May result in network traffic emitted from the "
-            " process. Run in an isolated network environment.",
-            .pre_fuzz = &virtio_net_pre_fuzz,
-            .fuzz = virtio_net_fork_fuzz,},
-            "virtio-net",
-            &(QOSGraphTestOptions){.before = virtio_net_test_setup_user}
-            );
 }
 
 fuzz_target_init(register_virtio_net_fuzz_targets);
-- 
2.39.0


