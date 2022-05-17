Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2150529E41
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:41:43 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqti2-0000o3-Tx
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTr-0000LM-VF
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTq-0003gi-4S
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fv84jwqP2aV20ibLcqIS+ICZdAWusduaR8f5CX+KcCA=;
 b=fnsfFJh2/R1nTVTWiv4+vRATOwFG4JPnr9VRpdCNFJxmNlxTmju7HxqJqSZC/+RdInwCPF
 fscopn+QDHvazFbhU153Xc0cphaz67TClzMY3vPzc/Rjmt8ojv+xujIHk0VmOF2+XZh/re
 qedbQARac65bIXXX7I0AenEdYlehogU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-ShdXZas2PEeEhTCDt-fFZQ-1; Tue, 17 May 2022 05:26:54 -0400
X-MC-Unique: ShdXZas2PEeEhTCDt-fFZQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 w5-20020a056402128500b0042aa2647eb6so5017562edv.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fv84jwqP2aV20ibLcqIS+ICZdAWusduaR8f5CX+KcCA=;
 b=PC/2XIJMu0cmXK1o/Pk1t+N8390sYcuaozOUamN5St4A9OIgh6jOiGGSGw5Og/M45g
 UTrTS4kiAz4Otsf55SeXq4VUi+R9aQ7GwIPlIH6vO5uTYVDiPhX3b957b0ROV7x95ZOE
 MmrTxuIAJ78leVt/34qdMYkHOuWYcnCNXvC5kiRpUGDIY89Co9qfumIdfVCSWr9Kd9h3
 D2ewFpI9EWJ+rjq3PcGtjqZKUflW4+fdt3jLjjFYJkR6SDb/D2hb6PRosXsRRCBV6KL7
 SsyJAHYvLfqzWu7JLyYxGH9g0B3TlnTxWLF/A8lWP8ARVwkOl8zF4YP/yRLe2UAlnmQq
 TGVw==
X-Gm-Message-State: AOAM532NSoa/FjA8hoShDGvcpqmTxJo6wLA5foHcef6TH9StfLqoAyM7
 851Xk77WlrQX5W5T4T9aoakkrPcnRKpWKJ2hSuCXUC/G05Rrm6Os+N1HNwfqG+J3ms5wOT46Nzy
 8H9wScWh8xv1Udlstte/50WWeT1NpREeyeMkdgJMpsI713DqMS1x3UluA3jP9u9chsuI=
X-Received: by 2002:a17:907:720f:b0:6f8:5c31:4027 with SMTP id
 dr15-20020a170907720f00b006f85c314027mr18798226ejc.284.1652779613327; 
 Tue, 17 May 2022 02:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx921GoWcz43ROTbDh94QD+Q/YM4EUEl5RexDsRanVOMfYkyWlJCkl5l+C5WiQPa7TEkCjdIA==
X-Received: by 2002:a17:907:720f:b0:6f8:5c31:4027 with SMTP id
 dr15-20020a170907720f00b006f85c314027mr18798209ejc.284.1652779612992; 
 Tue, 17 May 2022 02:26:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u12-20020aa7d88c000000b0042ac13e232csm1434203edq.39.2022.05.17.02.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 14/16] configure: enable cross-compilation of optionrom
Date: Tue, 17 May 2022 11:26:14 +0200
Message-Id: <20220517092616.1272238-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

While container-based cross compilers are not supported, this already makes
it possible to build x86 optionroms on any machine that has an installation
of GCC and binutils for 32- or 64-bit x86.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 29 +++++++++++++++++++++--------
 pc-bios/optionrom/Makefile |  2 --
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index e977d8e958..a6363f3331 100755
--- a/configure
+++ b/configure
@@ -2095,6 +2095,13 @@ probe_target_compiler() {
   fi
 }
 
+probe_target_compilers() {
+  for i; do
+    probe_target_compiler $i
+    test -n "$target_cc" && return 0
+  done
+}
+
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
@@ -2205,6 +2212,9 @@ fi
 
 QEMU_GA_MSI_MINGW_BIN_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
+#######################################
+# cross-compiled firmware targets
+
 # Set up build tree symlinks that point back into the source tree
 # (these can be both files and directories).
 # Caution: avoid adding files or directories here using wildcards. This
@@ -2231,19 +2241,27 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
+probe_target_compilers i386 x86_64
+if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
     # emulation. Linux and OpenBSD/amd64 use 'elf_i386'; FreeBSD uses the _fbsd
     # variant; OpenBSD/i386 uses the _obsd variant; and Windows uses i386pe.
     for emu in elf_i386 elf_i386_fbsd elf_i386_obsd i386pe; do
-        if "$ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
+        if "$target_ld" -verbose 2>&1 | grep -q "^[[:space:]]*$emu[[:space:]]*$"; then
             ld_i386_emulation="$emu"
-            roms="optionrom"
             break
         fi
     done
+    if test -n "$ld_i386_emulation"; then
+        roms="optionrom"
+        config_mak=pc-bios/optionrom/config.mak
+        echo "# Automatically generated by configure - do not modify" > $config_mak
+        echo "TOPSRC_DIR=$source_path" >> $config_mak
+        echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
+        write_target_makefile >> $config_mak
+    fi
 fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
@@ -2396,7 +2414,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
-echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
@@ -2586,10 +2603,6 @@ for target in $target_list; do
 done
 echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile)
 
-config_mak=pc-bios/optionrom/config.mak
-echo "# Automatically generated by configure - do not modify" > $config_mak
-echo "TOPSRC_DIR=$source_path" >> $config_mak
-
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
   meson_quote() {
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 17ccc76241..f639915b4f 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -6,7 +6,6 @@ all: multiboot.bin multiboot_dma.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bi
 # Dummy command so that make thinks it has done something
 	@true
 
-include ../../config-host.mak
 CFLAGS = -O2 -g
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
@@ -44,7 +43,6 @@ Wa = -Wa,
 override ASFLAGS += -32
 override CFLAGS += $(call cc-option, $(Wa)-32)
 
-LD_I386_EMULATION ?= elf_i386
 override LDFLAGS = -m $(LD_I386_EMULATION) -T $(SRC_DIR)/flat.lds
 
 pvh.img: pvh.o pvh_main.o
-- 
2.36.0


