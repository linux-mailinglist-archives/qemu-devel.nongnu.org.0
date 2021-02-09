Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8F3155FA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:34:56 +0100 (CET)
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xqh-0001Xj-Pi
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk5-00033u-90
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:05 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xk3-0007pv-II
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:28:04 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n6so10386851wrv.8
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7e1FwTBjDma5YBYDcW8fs7cDFozA2L932geu4P/T6s=;
 b=tdVD6HkTknlvSqlFhHboH6AzQ1hVbJTfi1C/deNM96ggpcc5O+cTB+W2mkN74vHBer
 twQIiUFfQwZqRT+/gHS2CbZWwj0wx+7EQijv0LhDIQY2SioYdWDPyPOtwhv6NBwVKf/G
 5IwL+WdFegkAl8mygWiRkCgT0feLEqkNWhpHjTYBXZCo1EMjbRJYeUGf1qG1uQXiWoza
 CrugkjL9wmf4iK4BvIFKb2b4Lz6YSb3qcxNYAj4fnmFUOqFHHetZaPKRBen+Dwem6EWk
 oP5nhNwa6I/lA9HSzGAxqW24DWZNL0MZN4mfTchsv3kbP3BJM1h15FpoTi9hc6irRn4s
 sCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7e1FwTBjDma5YBYDcW8fs7cDFozA2L932geu4P/T6s=;
 b=LMrjKooDNPcVLMs6ITlGC1dDlQ6AWxBx3RX7c7NIygD/RLOEKusNJmj5elaa2IjOdD
 8/w/mljhrERpugfHvN0xxgVl9KdU0e1LqIR1hLrnFEOwtLTEv/dj6jHXlH3hlec76qVc
 NUPHJuKa2/Aoy1xT2my4F6/aOayFj3eDgkVFlmaTpuMfBn5RLnUBMWg6SotnWxD6sXr/
 rAzoynn5QV4sotnnvp/Busb7S9yO6Lu6MTL2iR+O3g+DfgcAkhNSMJM4JLngLw+8vJAV
 XDT4aXE49/u93jaoIlVxMU1CHqB9AD8rslPeKvUC5u1HkLN9iOr7kWHGWXeB8JRMEdG9
 MjRQ==
X-Gm-Message-State: AOAM530FBEVadO7qeIZuGDh1hKpvozOdn4hbakqccQrahuEd/JlhjTiF
 j/t/8RsdUNzsCaDkJghiC6WENA==
X-Google-Smtp-Source: ABdhPJxqQghwiX/e6wCIB2e1++ViPqGD1PvLHQHCOqEoHgvc4joznKEzPmj+8aCioxM4zisGy+WmFw==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr26916368wrw.150.1612895282211; 
 Tue, 09 Feb 2021 10:28:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i8sm40854951wry.90.2021.02.09.10.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D9FE1FF9A;
 Tue,  9 Feb 2021 18:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/12] tests/acceptance: add a new tests to detect counting
 errors
Date: Tue,  9 Feb 2021 18:27:48 +0000
Message-Id: <20210209182749.31323-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210209182749.31323-1-alex.bennee@linaro.org>
References: <20210209182749.31323-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The insn plugin has a simple heuristic to detect if an instruction is
detected running twice in a row. Check the plugin log after the run
and pass accordingly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


