Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B38317360
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:30:25 +0100 (CET)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y08-0007Be-DB
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqJ-00070f-0M
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:16 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xqG-0006q2-2b
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:20:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id t142so3216083wmt.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im2/9eo7/fnC2asN2YmX8UWgpnbFcH4spWB/cPGWcw8=;
 b=n7iyfsnkx8PySQbwwndsyjpcKLXOOgc2QrrWDyNF5e8Nf66O+yAHmZFPdUHju7lHGg
 TmIMrT2CM+rEx/cEhZMDGGWt3RJj9/ah3M+29JeDC19PTRWjVc7/TyW/QUQQJKQr+TrB
 0qo9kM+eduMSy/zQEt8wl8753Sx08BSxZfQ9HBxl4C0IWAKYsH3Dr5L118iItEULQuEi
 Q1YBacEqvIh8D26DtpRLRy0MA62A92EcslUHePj2WKQwIA6Tu6LyrLwMZMBtToQ+NQC6
 KClzKaApNmIt6XzPFALE9B9DtvAiFukUHOghz56aavbKLYVgEB0zvEhvEbfZaH8Iwxsl
 1HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im2/9eo7/fnC2asN2YmX8UWgpnbFcH4spWB/cPGWcw8=;
 b=WG36uTAvuRn20NQEMronP0M5cKYBWVWy65oZUGRW+A+9bw6XuvxCk5Urn02W8LX0v0
 4AgpC/zf0jRZzgTpSl20OUtm2cjzppYl1IBXehtDMihAwi5wgg0FBzpW07TGUvWxjWgM
 rkS9BHERWNr9IVKJhmj/4Od2GIrLX4L2ouU3ysCgHyrdcl9kHzGYljG4Er1nbpiWIH0k
 gElJLxpwUuZ8iteUb0GlLhYSAdBntpc7N2rqmCwroaYy7x7uU2mg35lRQU/4bq9eDwmE
 YFlwZCAb6X5tnYFbXq0qj4puoaSCqt55/Ok0Jd6XIyGyO8/8m6IYPEq79//oEumNzwAr
 7TwQ==
X-Gm-Message-State: AOAM532X9IgSbs4dSOZXOGqIV6GRiRKyJdHNZisjxmA/POtpONVcmMWj
 U96p7xVzoBB0QNNVO6XbbThGSSR8CHw92oca
X-Google-Smtp-Source: ABdhPJw9iHqtEWr4+xLqBqSd2T7asFwRq+Ri8ORmAkjmcx/ZGe0RbT3fZq7S9tfZXqa/vE/LVfUXVA==
X-Received: by 2002:a1c:dcd7:: with SMTP id t206mr1182684wmg.108.1612995610348; 
 Wed, 10 Feb 2021 14:20:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o124sm5364205wmb.5.2021.02.10.14.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:20:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F08241FF9D;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/21] tests/plugin: expand insn test to detect duplicate
 instructions
Date: Wed, 10 Feb 2021 22:10:46 +0000
Message-Id: <20210210221053.18050-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A duplicate insn is one that is appears to be executed twice in a row.
This is currently possible due to -icount and cpu_io_recompile()
causing a re-translation of a block. On it's own this won't trigger
any tests though.

The heuristics that the plugin use can't deal with the x86 rep
instruction which (validly) will look like executing the same
instruction several times. To avoid problems later we tweak the rules
for x86 to run the "inline" version of the plugin. This also has the
advantage of increasing coverage of the plugin code (see bugfix in
previous commit).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210209182749.31323-6-alex.bennee@linaro.org>

---
v2
  - make i386/x86_64 run inline version
---
 tests/plugin/insn.c                      | 12 +++++++++++-
 tests/tcg/i386/Makefile.softmmu-target   | 10 ++++++++++
 tests/tcg/i386/Makefile.target           |  7 +++++++
 tests/tcg/x86_64/Makefile.softmmu-target | 10 ++++++++++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index a9a6e41237..c253980ec8 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -21,6 +21,14 @@ static bool do_inline;
 
 static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
 {
+    static uint64_t last_pc;
+    uint64_t this_pc = GPOINTER_TO_UINT(udata);
+    if (this_pc == last_pc) {
+        g_autofree gchar *out = g_strdup_printf("detected repeat execution @ 0x%"
+                                                PRIx64 "\n", this_pc);
+        qemu_plugin_outs(out);
+    }
+    last_pc = this_pc;
     insn_count++;
 }
 
@@ -36,8 +44,10 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             qemu_plugin_register_vcpu_insn_exec_inline(
                 insn, QEMU_PLUGIN_INLINE_ADD_U64, &insn_count, 1);
         } else {
+            uint64_t vaddr = qemu_plugin_insn_vaddr(insn);
             qemu_plugin_register_vcpu_insn_exec_cb(
-                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS, NULL);
+                insn, vcpu_insn_exec_before, QEMU_PLUGIN_CB_NO_REGS,
+                GUINT_TO_POINTER(vaddr));
         }
     }
 }
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 5266f2335a..fa9b1b9f90 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -33,5 +33,15 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	    	  -d plugin -D $*-with-libinsn.so.pout \
+	   	  $(QEMU_OPTS) $*, \
+		  "$* on $(TARGET_NAME)")
+
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index ad187cb2c9..c4a6f91966 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -48,6 +48,13 @@ else
 SKIP_I386_TESTS+=test-i386-fprem
 endif
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
+	       -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	       -d plugin -D $*-with-libinsn.so.pout $*, \
+		"$* (inline) on $(TARGET_NAME)")
+
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 1bd763f2e6..9896319f0e 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -33,5 +33,15 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
+# non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
+run-plugin-%-with-libinsn.so:
+	$(call run-test, $@, \
+	  $(QEMU) -monitor none -display none \
+		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
+                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	    	  -d plugin -D $*-with-libinsn.so.pout \
+	   	  $(QEMU_OPTS) $*, \
+		  "$* on $(TARGET_NAME)")
+
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
-- 
2.20.1


