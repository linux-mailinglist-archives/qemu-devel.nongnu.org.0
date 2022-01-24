Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C0A4992C2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:26:53 +0100 (CET)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5vQ-0001Nf-9F
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:26:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5l9-0006Z6-1f
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:18 -0500
Received: from [2a00:1450:4864:20::62e] (port=44951
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5l7-00038b-A0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:14 -0500
Received: by mail-ej1-x62e.google.com with SMTP id ka4so24628653ejc.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+PFdg49CjIqjo/3MH2m0xFVDRDgDWrE13p/nEuIP+Q=;
 b=g173QchYTjNVtaTut5anqOUPlLFZEMJJKXi5kS/JYUrnqr0x1lMOn7+HZ5QFJrgRpE
 3LMQueNtR8FSx2/fUqpFAesNNKuWYxIeI7ptnCdSS1dP5ca0mfYuRccWMbLISmiDiXiY
 Lc5MfH3VV0paUigq1Oruv2tQsGnA5LDzqyLSDiNoBEyA8CTpVtV6i3qbEBSzz3O3ka6M
 T61pMUZng6rAtdLPrgEl4S8d/eAGpYgaefYl4SY0s0y5Hx3fMFeOdsk0PO+tBF8aPNcR
 6l9WcogvAbk3whFw2LLIEvEHC39KPqUkuhbcydwHnPnhKCkXgrPJPBYoeGHghRFdAATA
 QgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B+PFdg49CjIqjo/3MH2m0xFVDRDgDWrE13p/nEuIP+Q=;
 b=PHShJ6SoN2CauOeDqQgwBh/O3YtpzymrQr9rezwN/z/WVHX0j5pALsAZK3xG0tLSF/
 CzvqnSFaDb1YdymW+U92MHCRQDFMaKl+4D/L4LqB7ozQE9gtKVLc9tMLUzEJS6AIbCa2
 XXUt6p0DYJEFhoTkuIHZt2RrIjf9iFxdogV6Vq1UVgJ4TNRrWowB6+hUJkLf0z6jkoL8
 H8UOyh/VeaIQDU3pTxu32FIr73rn30Bd60lhCGaz8RPyr5nMx2rWRAUI7gUUhSEqIOaj
 dzYW0BfSQTk8qoFC4EkJ9lmVSrZy1NoTEn8vUHX+Myg1evskizw7hLzM+C/I1hces/m+
 cJLw==
X-Gm-Message-State: AOAM5324VJsCKz589jrsQCVqEoR9Yz70ftOUWkydCxVfzgh7dk40YYsS
 SWXU44+NkP6MboU0RyOiP6hDmg==
X-Google-Smtp-Source: ABdhPJzWyLXrflc9yi1nHNIiFIgVbxrULtve0PA5xaP25/uz2s+k7m/UdbF/0z2KlrrRuyWCreMsNg==
X-Received: by 2002:a17:907:9722:: with SMTP id
 jg34mr5046853ejc.757.1643055371288; 
 Mon, 24 Jan 2022 12:16:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p29sm7155958edi.11.2022.01.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 964001FFBA;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/22] tests/qtest: enable more vhost-user tests by default
Date: Mon, 24 Jan 2022 20:15:48 +0000
Message-Id: <20220124201608.604599-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If this starts causing failures again we should probably fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/vhost-user-test.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c..2a4568cd7d 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -995,20 +995,17 @@ static void register_vhost_user_test(void)
                  "virtio-net",
                  test_migrate, &opts);
 
-    /* keeps failing on build-system since Aug 15 2017 */
-    if (getenv("QTEST_VHOST_USER_FIXME")) {
-        opts.before = vhost_user_test_setup_reconnect;
-        qos_add_test("vhost-user/reconnect", "virtio-net",
-                     test_reconnect, &opts);
+    opts.before = vhost_user_test_setup_reconnect;
+    qos_add_test("vhost-user/reconnect", "virtio-net",
+                 test_reconnect, &opts);
 
-        opts.before = vhost_user_test_setup_connect_fail;
-        qos_add_test("vhost-user/connect-fail", "virtio-net",
-                     test_vhost_user_started, &opts);
+    opts.before = vhost_user_test_setup_connect_fail;
+    qos_add_test("vhost-user/connect-fail", "virtio-net",
+                 test_vhost_user_started, &opts);
 
-        opts.before = vhost_user_test_setup_flags_mismatch;
-        qos_add_test("vhost-user/flags-mismatch", "virtio-net",
-                     test_vhost_user_started, &opts);
-    }
+    opts.before = vhost_user_test_setup_flags_mismatch;
+    qos_add_test("vhost-user/flags-mismatch", "virtio-net",
+                 test_vhost_user_started, &opts);
 
     opts.before = vhost_user_test_setup_multiqueue;
     opts.edge.extra_device_opts = "mq=on";
-- 
2.30.2


