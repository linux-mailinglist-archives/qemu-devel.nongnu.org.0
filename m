Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9FA5E9312
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:27:16 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQj5-0001Er-GB
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrd-0002zE-No
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrb-0006PP-Tp
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id c7so4197109pgt.11
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2Xb7XrmaLcBqtVTEcO7c2koX6kjKx3/BJ5rv1pbp5Aw=;
 b=K8eA5KO6qLEeHaIv9EFQN7305Bz+4dCXeyxFkTnfekjRtiqKWD2TptqP9CZUIkYo5A
 OCsuyUZ+k9h39Qnew59tQQOYbsRfg/p3CoZirBltqDKu2p2EgnPjKqgBLFs6FGwYWXeq
 LhN8d/6ThkIZgfuT90b1Gi2bES/ZyqyKJQUuFGmsRNuz8CUZEQKAmQD1+ALCR1zLbG9a
 GnosFmDXjpsx3j+WJutTal2XkGJwBGFYDt6EvthijRQcG7QkczzB6Np9GBdAwn5HSo1j
 oowJh7G+SzH/ZxaaEENdybPbUzBbOdMeVW+1nmhjADN2Rmyuc6tVU07madocDt/yF7PY
 FmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2Xb7XrmaLcBqtVTEcO7c2koX6kjKx3/BJ5rv1pbp5Aw=;
 b=RAqiZ1XZV1t3TJuXH8ZHJ5IRsptHhhTEwKfN42WxAhKEH+RMNG3aSVmor0w4MV4x50
 OdV58Arki/WH/IkeJUYYPLqoEzMukH8Ffd/+XDK7snxwFFnWD22kmG7FUIg75GcRTbHc
 u1dzUKQHWJm7tzkMMEjjgDPXMlYdjTk2UO7sad8EpmnfxZ/J6J7aUtNwTcpQ3hmgQxyY
 ZNZQKAQjI6rqKFSaLa2xkc9ko1ENtIOQpeNfUE10J3UdkZw6+kNiltgPdt7WaIf3i1D3
 nzAKRDjrmlX6XesFWXoj4p7xbzrSHIA/EkqIqaAFPmCcx+85AuSpK5HqEQR4mjBuL+RJ
 Sb4Q==
X-Gm-Message-State: ACrzQf0m2w9PA1tC1tWieSoA7JB2WwSZpSW/61VfwJ68yP/uJdlDbtyw
 kVcdihEQIzsZb4/KlThBCUbA/ktdM30=
X-Google-Smtp-Source: AMsMyM5bMWXnRqkRfB3om9wrOKkmwZceKNGKfsYdRlvVaiojIUkMuf7Zw/ml5e7fyGAU7dk1RAA99Q==
X-Received: by 2002:a63:5511:0:b0:439:12f6:fb9a with SMTP id
 j17-20020a635511000000b0043912f6fb9amr15989620pgb.197.1664105517503; 
 Sun, 25 Sep 2022 04:31:57 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:57 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 30/54] tests/qtest: qmp-test: Skip running test_qmp_oob for
 win32
Date: Sun, 25 Sep 2022 19:30:08 +0800
Message-Id: <20220925113032.1949844-31-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

The test_qmp_oob test case calls mkfifo() which does not exist on
win32. Exclude it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---

(no changes since v2)

Changes in v2:
- Add a comment in the code to explain why test_qmp_oob test case
  is skipped on win32

 tests/qtest/qmp-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 0fa00c12dc..074953fdf0 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -159,6 +159,8 @@ static void test_qmp_protocol(void)
     qtest_quit(qts);
 }
 
+#ifndef _WIN32
+
 /* Out-of-band tests */
 
 char *tmpdir;
@@ -279,6 +281,8 @@ static void test_qmp_oob(void)
     qtest_quit(qts);
 }
 
+#endif /* _WIN32 */
+
 /* Preconfig tests */
 
 static void test_qmp_preconfig(void)
@@ -338,7 +342,10 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     qtest_add_func("qmp/protocol", test_qmp_protocol);
+#ifndef _WIN32
+    /* This case calls mkfifo() which does not exist on win32 */
     qtest_add_func("qmp/oob", test_qmp_oob);
+#endif
     qtest_add_func("qmp/preconfig", test_qmp_preconfig);
     qtest_add_func("qmp/missing-any-arg", test_qmp_missing_any_arg);
 
-- 
2.34.1


