Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51770317394
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:45:26 +0100 (CET)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9yEf-0002bz-75
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhy-0006Zh-7Y
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:38 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhm-0003M6-GT
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o15so1414910wmq.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvekATJKlJ7jP2wzTkI6nrkZoiKtJSAd7gzRekefiEE=;
 b=KWTu4zS8VKFWwdJG3b+CSTJ8Q7Q698lsmJqTBHinWpWiHyRr2t3X4gtYWcI2mCkXIC
 H6Gs3WGIlhn2KacRtbeTZ7KYAZ0q8htqc1D4MOyJPcsv5PijhaOJgWHfDl8qAkc1cvSv
 aP/Fiq9aabTWkqfYcLxxA+NE0eCm8KWXP/vUPTB3dvB0BnVmSTURrYPjo8r1sRrvhcUs
 FL4KRd5nriJulmynKavQvwcxM0mi7ug1UJ5mDZ/Rwo5IrxYSZ/3xqPnQWaSZO9M7AURk
 51hcfY1IG5SJ5MW0CTREsqv61w0EImWmr/N4TedBcxXbUZayzGIo0FjDvy2n1zaQ7XCh
 KXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvekATJKlJ7jP2wzTkI6nrkZoiKtJSAd7gzRekefiEE=;
 b=N3bCrvJlEMQCpTMOwYTG9uQgnb7DEGEJmKwrLYroHATotfGDDIFZ++OflZHrufDRQx
 30OPDmNIahLp2GalEC3d+7vHzLbCQQlnwpdhbUSKT/AKmTQPl+KoepsL86mn5UKluwhF
 cS12bKwFdzpWk3MufchouC8KY2Shop8YwouobOgG6zMUuAyZRN+J++CjNLsfKjXblmcq
 CSSRRuU3n6SFud12MK/rE0uQnCNeG4KNxnYxQ0iSAjzOzgpyzPt16y+sDgf98ELvq17V
 H5n8hjSThXr5+F5UzAnljqpngJAvE2lpUNnCHyD7XEVjU/YiZlMKc5LXH3XfSOWsdtkM
 QzZg==
X-Gm-Message-State: AOAM530wn0KFlMVS8XDUHWmU3YhnwXSm1B14GTm6/y6WpoL7v8myG1B4
 ceeWGrzVRL4mXqfeY2TUU/9cWw==
X-Google-Smtp-Source: ABdhPJxm4d9id4m5cvO6ZEc5K9Tg8OTfUETDyHUOMUTkhYiBefKRVUoVpGIBbxu6fUkdL6QxNjuDag==
X-Received: by 2002:a05:600c:2246:: with SMTP id
 a6mr1195632wmm.170.1612995084836; 
 Wed, 10 Feb 2021 14:11:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x125sm5179811wmx.6.2021.02.10.14.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:11:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A44181FFAA;
 Wed, 10 Feb 2021 22:10:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/21] tests/acceptance: add a new tests to detect counting
 errors
Date: Wed, 10 Feb 2021 22:10:53 +0000
Message-Id: <20210210221053.18050-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The insn plugin has a simple heuristic to detect if an instruction is
detected running twice in a row. Check the plugin log after the run
and pass accordingly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210209182749.31323-13-alex.bennee@linaro.org>
---
 tests/acceptance/tcg_plugins.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index b512979769..acab599505 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -101,3 +101,34 @@ class PluginKernelNormal(PluginKernelBase):
             else:
                 logger.debug("Failed to find instruction count")
                 self.fail
+
+    def test_aarch64_virt_insn_icount(self):
+        """
+        :avocado: tags=accel:tcg
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:virt
+        :avocado: tags=cpu:cortex-a57
+        """
+        kernel_path = self._grab_aarch64_kernel()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyAMA0')
+        console_pattern = 'Kernel panic - not syncing: VFS:'
+
+        plugin_log = tempfile.NamedTemporaryFile(mode="r+t", prefix="plugin",
+                                                 suffix=".log", delete=False)
+
+        self.run_vm(kernel_path, kernel_command_line,
+                    "tests/plugin/libinsn.so", plugin_log.name,
+                    console_pattern,
+                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+
+        logger = logging.getLogger()
+
+        with plugin_log as lf, \
+             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
+            m = re.search(br"detected repeat execution @ (?P<addr>0x[0-9A-Fa-f]+)", s)
+            if m is not None and "addr" in m.groupdict():
+                logger.debug("detected repeat instructions")
+                self.fail("detected repeated instructions")
+            else:
+                logger.debug("no repeats detected: %s", m)
-- 
2.20.1


