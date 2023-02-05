Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E175468AE45
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWgD-0007Fi-9j; Sat, 04 Feb 2023 23:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfd-0007F7-5F
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:29 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfb-0006Bn-6P
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:28 -0500
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 256594492
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AQ8/0q3JxKCQAGB1BPbD5W1zkn2cJEfYwER7XKvMYLTBsI5bpzQHy
 2AfUTzUPP3YambxKI1/OY/k8EIPvJTXzIVkQAQ+qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE5jfvTLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbQr414rZ8Ek05K6q5GtD1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN02XUgEEK46+t1XCEVe2
 acgMxcrZD6c0rfeLLKTEoGAh+wmJcjveZoD4zRulGCIS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHMXw2PUWojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKOklEgjOS8arI5fPShAsFzuwWVj
 1v02EDTEAAROcy16AWspyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83sfF3+hX6H5/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsF1attPROWBcKeAEX
IronPort-HdrOrdr: A9a23:rHqEuq9H+48KIhMmURJuk+E2db1zdoMgy1knxilNoHxuH/Bws/
 re+8jzsiWE7gr5OUtQ4OxoV5PwO080maQFnbX5Xo3SJDUO2lHYSL2KhLGKq1aLdEOeh40tt9
 YET0VnMrHN5D5B/LnHCWGDYqYdKbK8gd2VbInlvglQpWIDUdAV0+8dYjzrZ3GecDM2d6bQS/
 Knhvav6gDQM0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2jnC6l87nzFjmfx1M7XylUybkv3G
 DZm0ihj5/T/82T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHBmxulf4NoXpyFpXQQrPu04Fgnvd
 HQq1MLPth16VnWYmapyCGdljXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MP40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIWLH45JlO/1GkbKp
 gvMCic3ocWTbqiVQGWgoC7+q3uYp18JGbAfqE4gL3d79FnpgEP86Im/r1oop55zuNHd3Bl3Z
 WNDk06rsAEcia9V9MPOA5Ge7r5NkX9BSjHNnmfZXHqC60DUki92qLK3A==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:26 -0500
Received: by mail-qt1-f199.google.com with SMTP id
 bz17-20020a05622a1e9100b003b9c1013018so4739954qtb.18
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azWDX557QsD/UuRYVwT2M3/baGp+kYjabcZ5fZ1uEaE=;
 b=jd4CdsS6ObFRKGHDoHGq3gjbapk92Qazs8nOhHZQJBY//6pUD/jMdh/nqAaLGg3sc5
 1S8tTS6ZqqzHHuJ2rcNHOJJRseDPIcsfW3e8MyXC3IG6r1KDxkkbEoSR42UGlvWXAQlI
 tV07QJKpEC+5y7bacs3eq3N+wfTchp/I/ehjj1tHW3dxcKfjhsYIJxU5wRGw4ZyXMoIt
 0yn1n3IrMRbK+AOcISNLQA8UnJHlOdHD5rFmndIi2uAdCz7uq/Pnvf83nNAO/Xgc7lbj
 1il7EgvzjeenS74ZeK/Bps/btrFJ2CZ/I1rS4kiPnUQgIxZyppai3RkwiGJSr7/TgR60
 5a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azWDX557QsD/UuRYVwT2M3/baGp+kYjabcZ5fZ1uEaE=;
 b=5gBzKKklk4YqwYsepXyR5syY/zUp2MMc2HmsgpIsBIOVd3LER75cl64+Oz8wXkfhfW
 +DGg0j4m77VPencJPxUL+AZWacb5Nl1AYUlJycJQklndftYwiMDVVfGX69nzy45+pisi
 2Q5dzH0WJjA0yF+47Cb/txn41m3T9rzwm8lZlAEWeImdvu7zsknmmU6bN9LZa/froow6
 muWcV963awAh7a0UlsdSrboi32pMIqv6dQtToMZA6Tc9QJVcDU4oxxFeZe8rMmnJ37Zo
 jmA2ClHXE68Lm/uokeP0Ol6vm86nqfAe6XtYvv8DwTMpYFZMvlinc7LlLzgKtlyIOSOT
 hQ4w==
X-Gm-Message-State: AO0yUKWHZhimNezqn3voq8pWWZW5f7OF2QXgQ7owL/bUM6oc3xgVBrjy
 jek3lBoMy9Wxh1CY8ffHglS7B459KugGf8zjxJK49k3trHQQjTJd2VObXggx9lhdkQ41nMIVb1B
 IP3vAsHs+92l4Xkd5n+E+5Ef2da5i6A==
X-Received: by 2002:ac8:7fc6:0:b0:3b9:a589:e7f4 with SMTP id
 b6-20020ac87fc6000000b003b9a589e7f4mr29809003qtk.64.1675571425248; 
 Sat, 04 Feb 2023 20:30:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+o6sP5mzmfrVuyzUxYKYdJ7SPJgFR6hnRQC/XQ38Gvd8MD9YYx4Y7RDWX91X7hQsDqaVe99Q==
X-Received: by 2002:ac8:7fc6:0:b0:3b9:a589:e7f4 with SMTP id
 b6-20020ac87fc6000000b003b9a589e7f4mr29808987qtk.64.1675571424985; 
 Sat, 04 Feb 2023 20:30:24 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05620a0a0900b0071d0f1d01easm4827875qka.57.2023.02.04.20.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:24 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 08/10] fuzz/i440fx: remove fork-based fuzzer
Date: Sat,  4 Feb 2023 23:29:49 -0500
Message-Id: <20230205042951.3570008-9-alxndr@bu.edu>
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
 tests/qtest/fuzz/i440fx_fuzz.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index b17fc725df..5d6a703481 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -18,7 +18,6 @@
 #include "tests/qtest/libqos/pci-pc.h"
 #include "fuzz.h"
 #include "qos_fuzz.h"
-#include "fork_fuzz.h"
 
 
 #define I440FX_PCI_HOST_BRIDGE_CFG 0xcf8
@@ -89,6 +88,7 @@ static void i440fx_fuzz_qtest(QTestState *s,
                               size_t Size)
 {
     ioport_fuzz_qtest(s, Data, Size);
+    fuzz_reboot(s);
 }
 
 static void pciconfig_fuzz_qos(QTestState *s, QPCIBus *bus,
@@ -145,17 +145,6 @@ static void i440fx_fuzz_qos(QTestState *s,
     pciconfig_fuzz_qos(s, bus, Data, Size);
 }
 
-static void i440fx_fuzz_qos_fork(QTestState *s,
-        const unsigned char *Data, size_t Size) {
-    if (fork() == 0) {
-        i440fx_fuzz_qos(s, Data, Size);
-        _Exit(0);
-    } else {
-        flush_events(s);
-        wait(NULL);
-    }
-}
-
 static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
                                        " -m 0 -display none";
 static GString *i440fx_argv(FuzzTarget *t)
@@ -163,10 +152,6 @@ static GString *i440fx_argv(FuzzTarget *t)
     return g_string_new(i440fx_qtest_argv);
 }
 
-static void fork_init(void)
-{
-    counter_shm_init();
-}
 
 static void register_pci_fuzz_targets(void)
 {
@@ -178,16 +163,6 @@ static void register_pci_fuzz_targets(void)
                 .get_init_cmdline = i440fx_argv,
                 .fuzz = i440fx_fuzz_qtest});
 
-    /* Uses libqos and forks to prevent state leakage */
-    fuzz_add_qos_target(&(FuzzTarget){
-                .name = "i440fx-qos-fork-fuzz",
-                .description = "Fuzz the i440fx using raw qtest commands and "
-                               "rebooting after each run",
-                .pre_vm_init = &fork_init,
-                .fuzz = i440fx_fuzz_qos_fork,},
-                "i440FX-pcihost",
-                &(QOSGraphTestOptions){}
-                );
 
     /*
      * Uses libqos. Doesn't do anything to reset state. Note that if we were to
-- 
2.39.0


