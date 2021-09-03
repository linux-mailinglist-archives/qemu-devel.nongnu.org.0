Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF813FFCE6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:18:31 +0200 (CEST)
Received: from localhost ([::1]:44832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5LC-0007NS-6I
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F5-0003jj-Ad
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F3-0003vn-NC
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id g135so3029761wme.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cPUmLfeX6y8YbGi3PEDcVcc78oGY3uTICFwnBB6uSQ0=;
 b=FIXDw4IbnQTTnWg8+B2nwFWDaRAzArr8dF04w7nFEg6/3aSutS0s/ktXxoY5cClygK
 QkuAc8fNHUU38ZzadfIZRzijid/i3zFfAHNqAQCcKSnygA68W/Km9hAu6FjvZWfnsB//
 ZPUIOuwYoqeLaQIj0CqZXEr9Eyji2deVzW0MSSorHgd20pNTT3Rl2azl98kN/ofYaPA3
 zCOgZtzoxeBnLzCLvMbaZBtJuD3zVetcZGQwf1gDRsG5dUH4/4yHxc/IrWkLjL2Mksot
 JY0HErOGuw2Y+oHpcLa0XGEgtQnu2HvmX8LvtLbLuapc3ualWbY/4iWz1mJhoNduR2fV
 3AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cPUmLfeX6y8YbGi3PEDcVcc78oGY3uTICFwnBB6uSQ0=;
 b=Av4xkPYHemtapfXz90Trkp+y+dktXm4oxtO6TF7ftot627wskYSkPOi53ARObxgEtB
 3A7Hlal+N3h03H51tVmn8xS7sRcKLmo4lQvt4Oi7M2wptLN79ve33YUxs/oxmO5yK8Zy
 GsuOcdOy4YLbSeR6rjq3pB8pYmcui/QsLA3yYH3mDeDA4q8AQVTadBRTMtv2flMUQp0/
 WnpTLJNtwhtfTF7JBObKIorGhEGLBmmmwkOlPF7qGU1tN8hOuWhHb5IAp0cIwuKX1Jsy
 CYNz/t+0/WvxqpEmW01p/jzhV+EZGMla0zMTv/xk85Yf1BVovoZhY3794rQ/2LE4LG43
 TXNA==
X-Gm-Message-State: AOAM533LVnizq34nBSASYht7UuQux9cE9IsgJLFhTsj2y1m3pO4dzo6A
 aXfjAs6DJ5uw7dyQntxTnWaOQw==
X-Google-Smtp-Source: ABdhPJwS3ku6ahvCkcMg7O90hTucBF3nsLeKv621BbstQjhvvQZUpy7c2CxRbCmMXg5hLVmBHlt6Kw==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr2235838wmi.158.1630660328330; 
 Fri, 03 Sep 2021 02:12:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t7sm4697894wrq.90.2021.09.03.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51B1F1FFB3;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/22] tests/plugins/insn: made arg inline not positional and
 parse it as bool
Date: Fri,  3 Sep 2021 10:03:35 +0100
Message-Id: <20210903090339.1074887-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Made argument "inline" not positional, this has two benefits. First is
that we adhere to how QEMU passes args generally, by taking the last
value of an argument and drop the others. And the second is that this
sets up a framework for potentially adding new args easily.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-11-ma.mandourr@gmail.com>
[AJB: fix check-tcg tests calling arg=inline]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
index c253980ec8..0f6a1938c1 100644
--- a/tests/plugin/insn.c
+++ b/tests/plugin/insn.c
@@ -62,8 +62,18 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc && !strcmp(argv[0], "inline")) {
-        do_inline = true;
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
     }
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index fa9b1b9f90..9b9038d0be 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -38,7 +38,7 @@ run-plugin-%-with-libinsn.so:
 	$(call run-test, $@, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
-                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+                  -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
 	   	  $(QEMU_OPTS) $*, \
 		  "$* on $(TARGET_NAME)")
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index b0a2128980..a053ca3f15 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -61,7 +61,7 @@ endif
 # non-inline runs will trigger the duplicate instruction heuristics in libinsn.so
 run-plugin-%-with-libinsn.so:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
-	       -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+	       -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	       -d plugin -D $*-with-libinsn.so.pout $*, \
 		"$* (inline) on $(TARGET_NAME)")
 
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 9896319f0e..2afa3298bf 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -38,7 +38,7 @@ run-plugin-%-with-libinsn.so:
 	$(call run-test, $@, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
-                  -plugin ../../plugin/libinsn.so$(COMMA)arg=inline \
+                  -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
 	   	  $(QEMU_OPTS) $*, \
 		  "$* on $(TARGET_NAME)")
-- 
2.30.2


