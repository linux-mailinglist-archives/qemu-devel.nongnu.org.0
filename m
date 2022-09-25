Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CFE5E931A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:32:08 +0200 (CEST)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQnm-00075E-RD
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrx-0003Js-0r; Sun, 25 Sep 2022 07:32:27 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrv-0006R1-4x; Sun, 25 Sep 2022 07:32:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so9958581pjm.1; 
 Sun, 25 Sep 2022 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Ys9PZej6Jr5Eh4o88j9BYOYlVXd3vSbqdt82ya5TQNo=;
 b=fl2pimBvUzMN51z5bGZhplbgYzfXG/TQLSWrOhNspA7XArF4mGSJLVIGDH2APkdQBc
 lvGhUmPQYccO3X7WoC8Ru86J2C65W317XAFg+jk8d9U5YD07r2wlfqH962aAIIjRK4TS
 k3tSye2jyM7QRw2YyXPf4w4pl0DV0el5akZ5T4vzPU803ZzUbVuyJ7grZRK6zpdlSyH+
 zOzo/HBByqMDUPthJTEiyzo9vY3Y7zSW0Vew2XnlPY5ZjXKpKb/Z8mO02I5ukc3Zy9xF
 GkZCm+qodIBF6n5tbqShacyFhZqrnasMzazVVhIzGMTe8jGVlYHlgb50y5BwzdVXuW8c
 Mshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ys9PZej6Jr5Eh4o88j9BYOYlVXd3vSbqdt82ya5TQNo=;
 b=f6K9KTlvaaFt8BaFD3TCFziG+OjnAyrVo1VV2S4lx3hyBNMyr7iGv4Claze1Ylffqj
 Zc3Hy1r0aOhRuLveyecSieyQd9MrBEPEio82EXZRwxaRZeTnF0qtHm4STRp0zNpvc0+k
 +/jZD2R61cajMM9PuFSiOWtw9KFQfKSsiW4Bf7SZYvT8qggsTP621uYTAk7vHZ/0JD/i
 vfz/SfXLljaQPoH5Ya8Uk+rjQSet4xvuJ/8bDk4PXhm3rvv5r1yMsMnmNl7vOkugCrem
 trXfIVaITP6+Jpazk9bq4lt+Zy8F9pJkFTHF74Ai3vNZ1OUVIpEtKdO+vcUdlr/rwHqH
 jnvQ==
X-Gm-Message-State: ACrzQf0G9tAOq5NAMiQTA4Kn9q+bVdWgottDUhvD3kv2OiEL6xe+QnKL
 DBVityBRjZDd/o+EtLWjz+thqtZmpYk=
X-Google-Smtp-Source: AMsMyM6h7pPSfpnYYRBqI4Ogv8wPLIdXbBnNEXC/rMDx2Z1UpmQDK6G3zR46q9G+KmzGIpMLUy+6KQ==
X-Received: by 2002:a17:90a:8909:b0:203:ab27:a41 with SMTP id
 u9-20020a17090a890900b00203ab270a41mr19918230pjn.163.1664105536721; 
 Sun, 25 Sep 2022 04:32:16 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH v3 37/54] tests/qtest: {ahci,
 ide}-test: Use relative path for temporary files for win32
Date: Sun, 25 Sep 2022 19:30:15 +0800
Message-Id: <20220925113032.1949844-38-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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

These test cases uses "blkdebug:path/to/config:path/to/image" for
testing. On Windows, absolute file paths contain the delimiter ':'
which causes the blkdebug filename parser fail to parse filenames.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/ahci-test.c | 21 ++++++++++++++++++---
 tests/qtest/ide-test.c  | 20 ++++++++++++++++++--
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 1d5929d8c3..66652fed04 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -1833,7 +1833,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
 
 int main(int argc, char **argv)
 {
-    const char *arch;
+    const char *arch, *base;
     int ret;
     int fd;
     int c;
@@ -1871,8 +1871,22 @@ int main(int argc, char **argv)
         return 0;
     }
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create a temporary image */
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,7 +1903,8 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 25302be6dc..5e3e28aea2 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -1011,16 +1011,32 @@ static void test_cdrom_dma(void)
 
 int main(int argc, char **argv)
 {
+    const char *base;
     int fd;
     int ret;
 
+    /*
+     * "base" stores the starting point where we create temporary files.
+     *
+     * On Windows, this is set to the relative path of current working
+     * directory, because the absolute path causes the blkdebug filename
+     * parser fail to parse "blkdebug:path/to/config:path/to/image".
+     */
+#ifndef _WIN32
+    base = g_get_tmp_dir();
+#else
+    base = ".";
+#endif
+
     /* Create temporary blkdebug instructions */
-    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
+    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", base);
+    fd = g_mkstemp(debug_path);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
+    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", base);
+    fd = g_mkstemp(tmp_path);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
-- 
2.34.1


