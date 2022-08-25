Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649B5A1CC6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:53:00 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLic-0008Rz-UM
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKd-0002Ze-VA
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKb-0004dL-Kz
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxQZAQdVmzopwZT0uMnfdib1ocUWwLrUGaOrTEI8Fgg=;
 b=dL06S0gX4w1pTA0pc6C2ueYJqQeAllzcA7H8N6U9kMqUelBJGTZw5OeeLTmQJCoyAJnXdR
 SrI5EdWfeT4PV68YZLu84M6CEnLEDVNyJP38C8JcRxR1bhUKfl+AOuPz1GZkADR8Roppj3
 BQPve4Uv0x+hu+bH9QLpx8a+nofERTY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-SeKd9u6sNz-0GYscuHxnvg-1; Thu, 25 Aug 2022 18:28:07 -0400
X-MC-Unique: SeKd9u6sNz-0GYscuHxnvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003a64d0510d9so6519248wmh.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=DxQZAQdVmzopwZT0uMnfdib1ocUWwLrUGaOrTEI8Fgg=;
 b=JyH03h5/lMEPeguMsWCN5fPFmGlEm1PCaeMDiBDoWRjFqawhl/Wc/VhOQiyJFbPBbJ
 zIIHpNfjWkTuEIZ7XahW3mZXJ/nNkzCcAVRVWCE7/WHa+L1ZhxCD+kjZenRuFJjCCToY
 dFD3PYZKbD8JAnUwsy5RFwHn95qYZXiUgBPatlWUwwSESseYyxt4016DVR16z9RFM52L
 RhpeDD9+uNBtMpFaowB4fIXD5NRcHmqQP58bH/RMSpmSzQCJeCg3ITzK2Mq6l//q9SMZ
 4qOTEGj1uq+kjHVPlfLn1yfmmIjWhSe3ddAjOwnDPTkERhw6FN6/vk0npfs9hJ0AlaLn
 CFWw==
X-Gm-Message-State: ACgBeo1obN/srEXGzJetXQvqyO3uhCeE6/xTel+ooieyHYmumwOlBjuH
 ZbrVChOsika7+cwZradFpK+jbwCVG3U6RosoG3t/RYM1mzvthNOnqiI1gMt+qI8Be3Z75rCOcjl
 0O1cyUtBDvITS/MDc5kC1q2QKzYyYU+jNdIVAMt1uaMEYXof5ZmUHUQVBKijEgbqTVrI=
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr9484504wmp.8.1661466486306; 
 Thu, 25 Aug 2022 15:28:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7pvQ8jN4UhcUWDSQXwM/cwuDI2pX5IGI2c8peiaJyb6xDmQz7sqIGHKyHtGRKNUDKqqFzaCg==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id
 l26-20020a05600c089a00b003a54ea9d5eemr9484481wmp.8.1661466485833; 
 Thu, 25 Aug 2022 15:28:05 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b0020fff0ea0a3sm281048wru.116.2022.08.25.15.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 12/20] tests/tcg: clean up calls to run-test
Date: Fri, 26 Aug 2022 00:27:37 +0200
Message-Id: <20220825222745.38779-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Almost all invocations of run-test have either "$* on $(TARGET_NAME)"
or "$< on $(TARGET_NAME)" as the last argument.  So provide a default
test name, while allowing an escape hatch for custom names.

As an additional simplification, remove the need to do shell quoting.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/Makefile.target                     | 21 +++++++++----------
 tests/tcg/aarch64/Makefile.softmmu-target     |  6 ++----
 tests/tcg/aarch64/Makefile.target             |  6 +++---
 tests/tcg/arm/Makefile.target                 |  9 ++++----
 tests/tcg/cris/Makefile.target                |  2 +-
 tests/tcg/i386/Makefile.softmmu-target        |  3 +--
 tests/tcg/i386/Makefile.target                |  5 ++---
 tests/tcg/multiarch/Makefile.target           | 18 +++++++---------
 .../multiarch/system/Makefile.softmmu-target  |  2 +-
 tests/tcg/s390x/Makefile.target               |  2 +-
 tests/tcg/x86_64/Makefile.softmmu-target      |  3 +--
 11 files changed, 34 insertions(+), 43 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 8d2dafabf0..6d588075f2 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -41,14 +41,16 @@ endif
 # for including , in command strings
 COMMA := ,
 
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "  %-7s %s\n" "$(strip $1)" "$(strip $2)" && ))
+quiet-command = $(call quiet-@,$2,$3)$1
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
-	"TEST",$3)
+	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+        TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
 # $1 = test name, $2 = reference
@@ -56,7 +58,7 @@ endif
 # we know it failed and then force failure at the end.
 diff-out = $(call quiet-command, diff -q $1.out $2 || \
                                  (diff -u $1.out $2 | head -n 10 && false), \
-                                 "DIFF","$1.out with $2")
+                                 DIFF,$1.out with $2)
 
 # $1 = test name, $2 = reason
 skip-test = @printf "  SKIPPED %s on $(TARGET_NAME) because %s\n" $1 $2
@@ -155,21 +157,19 @@ RUN_TESTS+=$(EXTRA_RUNS)
 
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 
 run-plugin-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		-d plugin -D $*.pout \
-		 $(call strip-plugin,$<), \
-	"$* on $(TARGET_NAME)")
+		 $(call strip-plugin,$<))
 else
 run-%: %
 	$(call run-test, $<, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
-	   	  $(QEMU_OPTS) $<, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $<)
 
 run-plugin-%:
 	$(call run-test, $@, \
@@ -177,8 +177,7 @@ run-plugin-%:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
 	   	  -plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 	    	  -d plugin -D $*.pout \
-	   	  $(QEMU_OPTS) $(call strip-plugin,$<), \
-	  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $(call strip-plugin,$<))
 endif
 
 gdb-%: %
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f6fcd4829e..84a9990f8d 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -50,8 +50,7 @@ run-memory-record: memory-record memory
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
-	   	  $(QEMU_OPTS) memory, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) memory)
 
 .PHONY: memory-replay
 run-memory-replay: memory-replay run-memory-record
@@ -59,8 +58,7 @@ run-memory-replay: memory-replay run-memory-record
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
-	   	  $(QEMU_OPTS) memory, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) memory)
 
 EXTRA_RUNS+=run-memory-replay
 
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d6a74d24dc..9837a809dc 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -55,7 +55,7 @@ sha1-vector: CFLAGS=-O3
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call diff-out, sha1-vector, sha1.out)
 
 TESTS += sha1-vector
@@ -75,14 +75,14 @@ run-gdbstub-sysregs: sysregs
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve.py, \
-	"basic gdbstub SVE support")
+	basic gdbstub SVE support)
 
 run-gdbstub-sve-ioctls: sve-ioctls
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
-	"basic gdbstub SVE ZLEN support")
+	basic gdbstub SVE ZLEN support)
 
 EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 2f815120a5..b3b1504a1c 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -26,7 +26,7 @@ ARM_TESTS += fcvt
 fcvt: LDFLAGS+=-lm
 # fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
 run-fcvt: fcvt
-	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,fcvt,$(QEMU) $<)
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
 # PC alignment test
@@ -44,13 +44,12 @@ semihosting-arm: semihosting.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semihosting-arm: semihosting-arm
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+	$(call run-test,$<,$(QEMU) $< 2> $<.err)
 
 run-plugin-semihosting-arm-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
+		 $(call strip-plugin,$<) 2> $<.err)
 
 ARM_TESTS += semiconsole-arm
 
@@ -75,7 +74,7 @@ sha1-vector: CFLAGS=-O3
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call diff-out, sha1-vector, sha1.out)
 
 ARM_TESTS += sha1-vector
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index e72d3cbdb2..372287bd03 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -56,4 +56,4 @@ SIMG:=cris-axis-linux-gnu-run
 
 # e.g.: make -f ../../tests/tcg/Makefile run-check_orm-on-sim
 run-%-on-sim:
-	$(call run-test, $<, $(SIMG) $<, "$< on $(TARGET_NAME) with SIM")
+	$(call run-test, $<, $(SIMG) $<)
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 9b9038d0be..ed922d59c8 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -40,8 +40,7 @@ run-plugin-%-with-libinsn.so:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
                   -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
-	   	  $(QEMU_OPTS) $*, \
-		  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $*)
 
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index bd73c96d0d..8380f5846a 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -52,7 +52,7 @@ test-i386-fprem.ref: test-i386-fprem
 
 run-test-i386-fprem: TIMEOUT=60
 run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
-	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,test-i386-fprem, $(QEMU) $<)
 	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
 else
 SKIP_I386_TESTS+=test-i386-fprem
@@ -62,8 +62,7 @@ endif
 run-plugin-%-with-libinsn.so:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 	       -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
-	       -d plugin -D $*-with-libinsn.so.pout $*, \
-		"$* (inline) on $(TARGET_NAME)")
+	       -d plugin -D $*-with-libinsn.so.pout $*)
 
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6bba523729..78104f9bbb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -26,7 +26,7 @@ float_%: float_%.c libs/float_helpers.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)
 
 run-float_%: float_%
-	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call conditional-diff-out,$<,$(SRC_PATH)/tests/tcg/$(TARGET_NAME)/$<.ref)
 
 
@@ -42,13 +42,11 @@ signals: LDFLAGS+=-lrt -lpthread
 
 # default case (host page size)
 run-test-mmap: test-mmap
-	$(call run-test, test-mmap, $(QEMU) $<, \
-		"$< (default) on $(TARGET_NAME)")
+	$(call run-test, test-mmap, $(QEMU) $<, $< (default))
 
 # additional page sizes (defined by each architecture adding to EXTRA_RUNS)
 run-test-mmap-%: test-mmap
-	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
-		"$< ($* byte pages) on $(TARGET_NAME)")
+	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<, $< ($* byte pages))
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
@@ -58,21 +56,21 @@ run-gdbstub-sha1: sha1
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
-	"basic gdbstub support")
+	basic gdbstub support)
 
 run-gdbstub-qxfer-auxv-read: sha1
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
-	"basic gdbstub qXfer:auxv:read support")
+	basic gdbstub qXfer:auxv:read support)
 
 run-gdbstub-thread-breakpoint: testthread
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
-	"hitting a breakpoint on non-main thread")
+	hitting a breakpoint on non-main thread)
 
 else
 run-gdbstub-%:
@@ -94,13 +92,13 @@ VPATH += $(MULTIARCH_SRC)/arm-compat-semi
 semihosting: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 
 run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+	$(call run-test,$<,$(QEMU) $< 2> $<.err)
 
 run-plugin-semihosting-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
+		$< with $*)
 
 semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 625ed792c6..368b64d531 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -25,7 +25,7 @@ run-gdbstub-memory: memory
 		--qargs \
 		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
-	"softmmu gdbstub support")
+	softmmu gdbstub support)
 
 else
 run-gdbstub-%:
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 1a7a4a2f59..5c553ae1ef 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -40,7 +40,7 @@ run-gdbstub-signals-s390x: signals-s390x
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
-	"mixing signals and debugging on s390x")
+	mixing signals and debugging)
 
 EXTRA_RUNS += run-gdbstub-signals-s390x
 endif
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 2afa3298bf..7207fee94c 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -40,8 +40,7 @@ run-plugin-%-with-libinsn.so:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
                   -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
-	   	  $(QEMU_OPTS) $*, \
-		  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $*)
 
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
-- 
2.37.1



