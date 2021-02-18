Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDF31E82A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:58:09 +0100 (CET)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg4W-0002JR-A1
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuL-00078Z-UM
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuE-0007IH-T4
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v14so2183321wro.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5rHH5POPbuYAq0YUi5h3icjOV2z6ayt8RsNYkhPgywI=;
 b=JRIu0Q8b0SW4GfxGiaw6/sHNFqj/lFNVIV+YXe+wewONsWwevOm64mU2pRyeDuul+6
 B5DAuphar1fzmIjAvpR3Ks87oS+4YS7PYk5h3lyIiE1nVh9dJTkrFzhl/lLSBEzMZW9E
 vg5sHvniW2pcTt72wXftNpIzPSg/ASEkaANFdLcZkdBE+8k5RPfhog36EhFdfvZi+r3w
 UUo13d2OszGto+k4rjE0T6KcjyBpG/Cy4kcjlB8SN7VWbC9hBhyc2qmDxqv14fiq5MQi
 7TyEr2HZVZnK1EwfYYCs5mP7Im9sDqUcQ7olyiddzHj2+oLxG4oCc2c8v5mcsDacQUKn
 pSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5rHH5POPbuYAq0YUi5h3icjOV2z6ayt8RsNYkhPgywI=;
 b=afWF82FJSfiojwJgqklkm9lGESNQ/t7f6S9U8jcEJjz9FIIfADD227AybzJtS9RMKb
 NA+O3m97VZc51mo3FAIEevgKZibOv5z2YtPSMIrqxOH15SoSSKRCFHwWHDI0d7PHl8zh
 O4qZpDEfKGilD/XGAPk9Ty1O8TSZnuEITiIZqbJb0fbLRmfWxasf3BWfhlmBtVSeoKVZ
 LQvQl94TvfPdcideBjmo4tM3oD81OpmcDelYG+M5m9XOOa530HRIt4lja9ItboG6fnFD
 SdZikDyVLUfZFsupgcPDPr6wcZfEXj88vfDr8beTcVXP7eXRq3StGbG3CBPnpi/EHZE7
 87vw==
X-Gm-Message-State: AOAM531azktT/auUDnKqfDQ+bxFuQWwsFO+f8zbbqPzjNRwRa2xQa1x5
 3PT8rxt45kuCodnSwFT6SqmPuA==
X-Google-Smtp-Source: ABdhPJxHlEZdY20EEnNXtoSGQx+NS2+Wh1GhBBHkGWRNArTrmKUkM6qQYm4QlLp+di8h7msU0Eeirg==
X-Received: by 2002:adf:e5d1:: with SMTP id a17mr3583259wrn.260.1613641649512; 
 Thu, 18 Feb 2021 01:47:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm8319898wrn.11.2021.02.18.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 031BD1FFAB;
 Thu, 18 Feb 2021 09:47:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/23] tests/acceptance: add a new tests to detect counting
 errors
Date: Thu, 18 Feb 2021 09:47:04 +0000
Message-Id: <20210218094706.23038-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The insn plugin has a simple heuristic to detect if an instruction is
detected running twice in a row. Check the plugin log after the run
and pass accordingly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210213130325.14781-22-alex.bennee@linaro.org>

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index adec40d3a5..b1ba10498f 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -89,3 +89,29 @@ def test_aarch64_virt_insn(self):
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


