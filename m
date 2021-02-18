Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADF31E860
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 11:07:34 +0100 (CET)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCgDd-0004r1-J0
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 05:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzX-0004Yz-Vz
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:53:00 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfzW-00012K-6n
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:52:59 -0500
Received: by mail-wr1-x42e.google.com with SMTP id f7so1051259wrt.12
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UFgwBYMWW+cA/Y1jKLdTryuQ+jpOBq3LyRLsc4984U=;
 b=kBv5Z5erlb5fnJAVUkisVYukR44IXiXmtMmw4AcoPbVgQ16u6e0W+m//x/+d7ckobe
 BvJ3YpUsGpGd/J+vekJ0jC8R6yMgSC5LYKU2y0YgPOuq9lzZKQUP4LA6NtYYRGZ1o9Ri
 mGPx5jTYZaZyHPtkheLJTltRqAaJcuqjEwICaOT0uA5nQVbWWLazDo/plk5m431Mxay5
 76RHpXlmgRKZeBZdcQFfbDIKrQ8NQC95XdMv9RGc9l01xhEDmyjZH4YGC9ah7xzyLtIT
 yPtaiYxY3K7x5Oxz9z0usApkEmUJWdqJXEe0KAHebt4UY+scia5UTWjaCHz2b8WDWnt1
 oaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UFgwBYMWW+cA/Y1jKLdTryuQ+jpOBq3LyRLsc4984U=;
 b=UkUjpeMe581q93iew9qby6lBvJGjORQtqyxtKnXapx8HDaZSL2tY4q70iWMc4iVNqk
 BETb9p1ZurqD/DpOjitu+8HpMrJPynaHvaia16uxMBXu/UQ0rJGIiPjo3pkdHqPug3Bv
 5auato4JAHrtfRlUN3vcp5b/jsx3tqQRcflMX1x17V0648Sonr/V7ESvmqp8E/aaYZ1u
 3rydwVQMR5l+erLrlIETRdqzvba92UT4qaypfSMXj7mm3PdDuLATvQNCkuc3ucnimRaL
 b9lLqhMJXeZri15U19vV7+dREoMp5oEZK647oRdadywCL1Hlrs+ZhobpAPcRE5QFcB+b
 JUfg==
X-Gm-Message-State: AOAM532xwHEdVsIOtBqrQwmJpToeSlgqjkNjeoueydBSvwcWwYlCtpdH
 f09+n2DkGw8zOfcXMfpM0zLRHQ==
X-Google-Smtp-Source: ABdhPJziw5c8LRkjwaqCY2t+QIjQY8tV/R32Bkon+Roe6O3viQ0Ro5IS5KSFgqi99ugJ0NP2IUNZsg==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr3517185wrq.425.1613641974578; 
 Thu, 18 Feb 2021 01:52:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm8140158wra.61.2021.02.18.01.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:52:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D0F41FFAE;
 Thu, 18 Feb 2021 09:47:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/23] tests/acceptance: add a memory callback check
Date: Thu, 18 Feb 2021 09:47:06 +0000
Message-Id: <20210218094706.23038-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

This test makes sure that the inline and callback based memory checks
count the same number of accesses.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210213130325.14781-24-alex.bennee@linaro.org>

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index b1ba10498f..c21bf9e52a 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -115,3 +115,34 @@ def test_aarch64_virt_insn_icount(self):
             m = re.search(br"detected repeat execution @ (?P<addr>0x[0-9A-Fa-f]+)", s)
             if m is not None and "addr" in m.groupdict():
                 self.fail("detected repeated instructions")
+
+    def test_aarch64_virt_mem_icount(self):
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
+                    "tests/plugin/libmem.so,arg=both", plugin_log.name,
+                    console_pattern,
+                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+
+        with plugin_log as lf, \
+             mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
+            m = re.findall(br"mem accesses: (?P<count>\d+)", s)
+            if m is None or len(m) != 2:
+                self.fail("no memory access counts found")
+            else:
+                inline = int(m[0])
+                callback = int(m[1])
+                if inline != callback:
+                    self.fail("mismatched access counts")
-- 
2.20.1


