Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615C31ABB3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:26:02 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuvx-0001Ua-7H
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaa-0002B5-R6
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:56 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-00068d-MC
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:56 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v15so2910946wrx.4
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWlE1B1jJCkyjsPbS+2wpobDIWIoYorHTQPmUidlBbI=;
 b=Z3DXak/QL8mKrg4vncJIyDkOEuavta9lAXQ9B/EnTuDpy0Egt+hGsodBCGGflEJfs/
 VJdALUWpzIwIFS17QrcJISA1urcORIMBDq87r2CCToZgQ4Ow7OOFSj4klz0QwNAmfBjp
 pX7M2vwSk8ddAQTLX0SDfT+yK+ejw60QHk/s9ICgRF+EW0Od7JslVWOPeTP355U1BF6y
 PPTYMJzTqHh5yUioi4j8VHp2+EXMXQ7WRyRuETGxA6vlg80Iy3q7EMOnBVK4rHoeo74P
 4w5B1PEQFSyD/C4uGWFU3dnf1vKwitYF/91WRsiOXrcMQ4QtKwuYWS2ikMmoEeRqlA9q
 k2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWlE1B1jJCkyjsPbS+2wpobDIWIoYorHTQPmUidlBbI=;
 b=Dl1OxkGKn638unEesG2Tbf5AeA9pJL+D9MfIaT2Rvc52ba5nFnabr1bNMDE7hpwG5m
 4L2ITD6vWznSOB80XGvmT3BKrm7ysTuDQRH+aHhrgx2e+AyHfVnLa8cvVISk8eVH2bjF
 XQgXF41AhqCpi1z8Ff2Db0C8nLU3PQmfNQKGeZ/LT78VDTPAUUoE4G9ZyEneHT8Bnw9A
 zZlZLAdGCqh8MmmZT6xJRgyBqppzZcuhl7X1eCqPPNPL7Yjd41eBvPSAAlu8tGaOB6iM
 l0+PV/NLLYvz4n6+bBnivbIHdmeejr4YUY4dt7PiOfcARVm+CSaDoKzzcJO6T5uXno2C
 aW6g==
X-Gm-Message-State: AOAM533JeZzkdkvJ0yvWvfBu6sz9px4J4QDm2aUqYivrrlhbk9hmpwhz
 +v0u8HAz++iydbtUdEiLDj7vqQ==
X-Google-Smtp-Source: ABdhPJx0O2C2sXXTQIoXp4CN0ShclCXBz8NYdgUF4WfUm7L9tzM3ZOkadR9vihU/X4IxlNQjbpx4yw==
X-Received: by 2002:adf:e943:: with SMTP id m3mr2925476wrn.179.1613221428360; 
 Sat, 13 Feb 2021 05:03:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm4054274wrr.62.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87CE81FFAB;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/23] tests/acceptance: add a new tests to detect counting
 errors
Date: Sat, 13 Feb 2021 13:03:23 +0000
Message-Id: <20210213130325.14781-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210210221053.18050-22-alex.bennee@linaro.org>

---
v3
  - remove delete=False from log file
  - remove excess logging
---
 tests/acceptance/tcg_plugins.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index adec40d3a5..b1ba10498f 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -89,3 +89,29 @@ class PluginKernelNormal(PluginKernelBase):
             m = re.search(br"insns: (?P<count>\d+)", s)
             if "count" not in m.groupdict():
                 self.fail("Failed to find instruction count")
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
+                                                 suffix=".log")
+
+        self.run_vm(kernel_path, kernel_command_line,
+                    "tests/plugin/libinsn.so", plugin_log.name,
+                    console_pattern,
+                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+
+        with plugin_log as lf, \
+             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
+            m = re.search(br"detected repeat execution @ (?P<addr>0x[0-9A-Fa-f]+)", s)
+            if m is not None and "addr" in m.groupdict():
+                self.fail("detected repeated instructions")
-- 
2.20.1


