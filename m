Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A9D31ABAD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:23:42 +0100 (CET)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAutg-0007Zv-Sy
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaa-0002At-ON
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:56 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaW-0006A3-19
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id b3so2917927wrj.5
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1aw1h3jqxc44ee8O7RKBgZtgO/tTqSNqOcENiGbAYw=;
 b=s+1dlk89Hznn+UVnG+y+uYiS5xaiFbExzPo5L/KN4P5+wzHQDJCfbpMBG+Wm+GHmms
 y5KIPvpNBd5UbKtbl3bobvC2JptgkKrGQxv2xDYIkS5JYgb5y7StZns58brxsHC1osXm
 vuOGVH2HfRtaC16PtA7U/SehZALVdx+CLfQ7nihxWZDUb+M1k8escEo/E9snaQYJfU9U
 bT4a0YvTX+CnJGmZpKm7mDJKpjzBcrWF6OJhVrcDMco47gvSqvJ+QxwrCZJ89HEUKewT
 efEmAMXQplZ+xv9jOelFyaISoRRQj/tar/CIMOmjrdnyIVforTasgSCa8q2UiTWBKOFh
 sZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1aw1h3jqxc44ee8O7RKBgZtgO/tTqSNqOcENiGbAYw=;
 b=IRGbQvoUvvHMyBSfloQzf0EVHm1IDhG6t1Zkcz5YZdpFIuIxLvaDcYBUY4s/i8r3CC
 MeS08NXmBP+7uersUIQMu+WoAlEbI8RoyG82o7o1GRCFaOLLEg+ShDLe3iG4/u6h7SXZ
 75pIP7I20v84aUXgx4dbORVngghDymPk5kfSJxhqqS8ZfTcQY/Xkz30vvgTPKovyvD9V
 noOXaX7tprL3QIfWUSI2KeC+ycjUlL61b3wjTnq5Cr1xL5Rssmrcvf4VUc+trsQGO5rN
 kLuHbbK9wk3krBr3PRZwTS9yhvaQuC9cuLTGnpr16Ud1n/mqg+A64J6ZfmZs2UCgolNo
 IrEA==
X-Gm-Message-State: AOAM5336A4qVV0xUQRwzEeyXGCR2eP+28GQChGu+9SIIliFcMZQe4GSd
 +9ihF9XAA0u6TKIQTdNBfo+vQA==
X-Google-Smtp-Source: ABdhPJwKiED3TKL4itE9DaNPDbVNVOZZBdZ8lqyuLt0pypxelVGTcsx807U77EHu7tvQHx9HL0pkaw==
X-Received: by 2002:a05:6000:242:: with SMTP id
 m2mr8654268wrz.422.1613221430813; 
 Sat, 13 Feb 2021 05:03:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm15773579wro.10.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B50AC1FFAE;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 23/23] tests/acceptance: add a memory callback check
Date: Sat, 13 Feb 2021 13:03:25 +0000
Message-Id: <20210213130325.14781-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

This test makes sure that the inline and callback based memory checks
count the same number of accesses.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/tcg_plugins.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index b1ba10498f..c21bf9e52a 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -115,3 +115,34 @@ class PluginKernelNormal(PluginKernelBase):
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


