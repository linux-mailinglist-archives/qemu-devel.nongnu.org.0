Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14876141938
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 20:40:04 +0100 (CET)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1istwx-0002S4-5s
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 14:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1istfP-0006Tq-Ra
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1istfO-0007m0-DI
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:55 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1istfN-0007l3-QF
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 14:21:53 -0500
Received: by mail-wr1-x441.google.com with SMTP id j42so25688146wrj.12
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYxzhX6CrN3trG1tXILsFerazq8eN+loUJM/YFYVzmM=;
 b=KVOipJrjQl5TChaCRq391GAiBQ8TD/BhFHgPYpzbBpRqFL/kkvChUXWjVEvSBlXR0g
 MUonVZIkRlLN2MOF6ZwAVlhrZtugkcnSoQVTerVgL6d3HM73TPfQlVZ+5vnetTLGLSOc
 bBoXi1pzs0jsxLg/lO3fD4V8qjeN2Be0ZHXGdoWz938TKrlh9sjFz2xLpMxvqCncpKZw
 Yw4mVVpp9jazohcnnDF6n9wiRr6rmCr+8RlmnnjglTHlWK6h/CWkaHEgeTzD2jz+w71L
 dJFT2LysgI6LuATnLMdaPZdQPlFC0cON4CwAzjnweJhYy6P078mfex0IJFRGCL0S0c+C
 lCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYxzhX6CrN3trG1tXILsFerazq8eN+loUJM/YFYVzmM=;
 b=YFPCIRIuTs9pAFpyF+qKp8pWrVJ8CD8eM3/Vf/TQBD99iNgF7r1gB9azlMURL5AtUi
 ytYGkHZQwBKOdzw9A5mbHgaMMugev6M1s9w/bYGpv2PoGoi9/gBDdRYvWFRrX9wnhTOP
 2HNwg/DH27VPvfODYUIaTrGIabczZadrtcdXr9InZjQTpBkKgGUREykB1guX2nWCO9iD
 D6czb1VbLj1w62k7tmFW02aUAhBraM0rQyG3AOnFqEUcZK3PP61h7q7AK+JLOkD3ZQeb
 bfj+b9FMphmz2yh2U26ZvOP9kOJGgYqTPk3ZtKpQlY/VTr43adDt4Ww/taaLqGn87ZCL
 MEeQ==
X-Gm-Message-State: APjAAAU51hDMk3nSsRO3vqaLn8g5Cj6B4ywKwGSlH/NKH9mtBP/s2/05
 mB4CICremqYNYymhNMQEaOhrG/Wj4cDvsUT7
X-Google-Smtp-Source: APXvYqzUNimMhDxmDcqBwbnLP5oKE4XR6BFMtYiZLx+D9MabmPr9JQd7AiX+06kkRQQ4j1g+MB+P4g==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr10364807wrr.340.1579375312602; 
 Sat, 18 Jan 2020 11:21:52 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-108-13.red.bezeqint.net. [109.65.108.13])
 by smtp.gmail.com with ESMTPSA id o16sm2875468wmc.18.2020.01.18.11.21.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 18 Jan 2020 11:21:52 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v41 18/21] target/avr: Update build system
Date: Sat, 18 Jan 2020 21:14:13 +0200
Message-Id: <20200118191416.19934-19-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20200118191416.19934-1-mrolnik@gmail.com>
References: <20200118191416.19934-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org, dovgaluk@ispras.ru,
 imammedo@redhat.com, philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make AVR support buildable

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 configure                       |  7 +++++++
 default-configs/avr-softmmu.mak |  5 +++++
 target/avr/Makefile.objs        | 34 +++++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 default-configs/avr-softmmu.mak
 create mode 100644 target/avr/Makefile.objs

diff --git a/configure b/configure
index 557e4382ea..94e79ca634 100755
--- a/configure
+++ b/configure
@@ -7612,6 +7612,10 @@ case "$target_name" in
     mttcg="yes"
     gdb_xml_files="aarch64-core.xml aarch64-fpu.xml arm-core.xml arm-vfp.xml arm-vfp3.xml arm-neon.xml"
   ;;
+  avr)
+    gdb_xml_files="avr-cpu.xml"
+    target_compiler=$cross_cc_avr
+  ;;
   cris)
   ;;
   hppa)
@@ -7831,6 +7835,9 @@ for i in $ARCH $TARGET_BASE_ARCH ; do
       disas_config "ARM_A64"
     fi
   ;;
+  avr)
+    disas_config "AVR"
+  ;;
   cris)
     disas_config "CRIS"
   ;;
diff --git a/default-configs/avr-softmmu.mak b/default-configs/avr-softmmu.mak
new file mode 100644
index 0000000000..d1e1c28118
--- /dev/null
+++ b/default-configs/avr-softmmu.mak
@@ -0,0 +1,5 @@
+# Default configuration for avr-softmmu
+
+# Boards:
+#
+CONFIG_AVR_SAMPLE=y
diff --git a/target/avr/Makefile.objs b/target/avr/Makefile.objs
new file mode 100644
index 0000000000..7523e0c6e2
--- /dev/null
+++ b/target/avr/Makefile.objs
@@ -0,0 +1,34 @@
+#
+#  QEMU AVR CPU
+#
+#  Copyright (c) 2019 Michael Rolnik
+#
+#  This library is free software; you can redistribute it and/or
+#  modify it under the terms of the GNU Lesser General Public
+#  License as published by the Free Software Foundation; either
+#  version 2.1 of the License, or (at your option) any later version.
+#
+#  This library is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+#  Lesser General Public License for more details.
+#
+#  You should have received a copy of the GNU Lesser General Public
+#  License along with this library; if not, see
+#  <http://www.gnu.org/licenses/lgpl-2.1.html>
+#
+
+DECODETREE = $(SRC_PATH)/scripts/decodetree.py
+decode-y = $(SRC_PATH)/target/avr/insn.decode
+
+target/avr/decode_insn.inc.c: $(decode-y) $(DECODETREE)
+	$(call quiet-command, \
+	  $(PYTHON) $(DECODETREE) -o $@ --decode decode_insn --insnwidth 16 $<, \
+	  "GEN", $(TARGET_DIR)$@)
+
+target/avr/translate.o: target/avr/decode_insn.inc.c
+
+obj-y += translate.o cpu.o helper.o
+obj-y += gdbstub.o
+obj-y += disas.o
+obj-$(CONFIG_SOFTMMU) += machine.o
-- 
2.17.2 (Apple Git-113)


