Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D35529E88
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:54:36 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtuV-0001Jr-AU
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTt-0000QB-Jh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTq-0003gV-54
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgcjfDJM39quLGJ4/mRxrdvE7hDFvh1glndkGEbyKjc=;
 b=iGHRpGv/oDKOTlpAQLP9ZEh2woTCeDBvnr1sx/JxN27Dszu+AImbSpcS1jCvL8HxfwYq0+
 Nj+lytXNwj+BLjJxuDyTnnphDLtYuHySfJZNxFhFAow8xtX3ZkepCnRqhvf32WJ5Y/4W2f
 hFw4ylgw2bRgSl7EMTmUxKWgc5/D9NY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-OzsaDwJgOJS4h3FyNcVBLw-1; Tue, 17 May 2022 05:26:52 -0400
X-MC-Unique: OzsaDwJgOJS4h3FyNcVBLw-1
Received: by mail-ej1-f71.google.com with SMTP id
 qb36-20020a1709077ea400b006f45e182187so7034073ejc.14
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgcjfDJM39quLGJ4/mRxrdvE7hDFvh1glndkGEbyKjc=;
 b=HxRvt3Xm5zrUa0gqcw6fH7FvubUanIWKyUVvbCzQDkh9OcERQFFhlcu+AL6PuLZu72
 N//J6pKYvqjGUrDHSHfvOS5jkUahIxYiEVCjcquczvZz/Y3pFQoOm2/4oCTd5TZHTfo0
 G4pDQncGDVk+bOAQRyYGiHPnut8q9zs/SGj7Jn2wVYqlEfWHpS27H1++Y0YP9Ufhx+mP
 tJW6vzGIqv2owxFeUXRVNd8mWBDsUnt4Ga6T4epHbQ2/00jMCtII5VCWMq4OMCRabYGc
 h1hM9MkqSouboNgia4fI7720vTARiA76vPEcqjullwrCi18XABHYAWtPwtlRioSIibX9
 3VJA==
X-Gm-Message-State: AOAM532gwP+t/xNCOlPVV8xvzwSS4hznno6gY0HeTpfnbonf3qRBXd30
 Xr/RCoOPKcuM/2SXg7UadbB2rGX65MT+K9eOyTNdzLIHjlWd9fY4P1OBWCJhrcfPiWuYsl9l0DL
 Oohm5MhpKjhr1tZbaL83WRMZI3LFF2maPlsh6lz+sJ5Hvq8NDNzYS70HFNOmqPzj3xlw=
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id
 nd20-20020a170907629400b006e10ea474a3mr18551483ejc.168.1652779610803; 
 Tue, 17 May 2022 02:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzja5r+fhBT5oi3fC3no/FTQN0u/gNkEdwVJYyJnNG5syL8NZtEqA1K3RRHzAcUQnVNB9Xv8g==
X-Received: by 2002:a17:907:6294:b0:6e1:ea4:74a3 with SMTP id
 nd20-20020a170907629400b006e10ea474a3mr18551466ejc.168.1652779610502; 
 Tue, 17 May 2022 02:26:50 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906748b00b006f3ef214de8sm807775ejl.78.2022.05.17.02.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 13/16] configure: enable cross-compilation of s390-ccw
Date: Tue, 17 May 2022 11:26:13 +0200
Message-Id: <20220517092616.1272238-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
it possible to build s390-ccw on any machine that has s390x GCC and binutils
installed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                    | 18 +++++++++++++-----
 pc-bios/s390-ccw/Makefile    |  9 +++++----
 pc-bios/s390-ccw/netboot.mak |  2 +-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index cf439e2deb..e977d8e958 100755
--- a/configure
+++ b/configure
@@ -2246,24 +2246,32 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
     done
 fi
 
-# Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
-# or -march=z10 (which is the lowest architecture level that Clang supports)
-if test "$cpu" = "s390x" ; then
+# Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
+# (which is the lowest architecture level that Clang supports)
+probe_target_compiler s390x
+if test -n "$target_cc" && test "$softmmu" = yes; then
   write_c_skeleton
-  compile_prog "-march=z900" ""
+  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float -Werror"; then
+  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
     if [ $has_z900 != 0 ]; then
       echo "WARNING: Your compiler does not support the z900!"
       echo "         The s390-ccw bios will only work with guest CPUs >= z10."
     fi
     roms="$roms s390-ccw"
+    config_mak=pc-bios/s390-ccw/config-host.mak
+    echo "# Automatically generated by configure - do not modify" > $config_mak
+    echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
+    write_target_makefile >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
     git_submodules="${git_submodules} roms/SLOF"
   fi
 fi
 
+#######################################
+# generate config-host.mak
+
 # Check that the C++ compiler exists and works with the C compiler.
 # All the QEMU_CXXFLAGS are based on QEMU_CFLAGS. Keep this at the end to don't miss any other that could be added.
 if has $cxx; then
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 0eb68efc7b..6eb713bf37 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -2,8 +2,9 @@ all: build-all
 # Dummy command so that make thinks it has done something
 	@true
 
-include ../../config-host.mak
+include config-host.mak
 CFLAGS = -O2 -g
+MAKEFLAGS += -rR
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
@@ -11,7 +12,7 @@ cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
-$(call set-vpath, $(SRC_PATH)/pc-bios/s390-ccw)
+$(call set-vpath, $(SRC_PATH))
 
 # Flags for dependency generation
 QEMU_DGFLAGS = -MMD -MP -MT $@ -MF $(@D)/$(*F).d
@@ -49,8 +50,8 @@ s390-ccw.img: s390-ccw.elf
 
 $(OBJECTS): Makefile
 
-ifneq ($(wildcard $(SRC_PATH)/roms/SLOF/lib/libnet),)
-include $(SRC_PATH)/pc-bios/s390-ccw/netboot.mak
+ifneq ($(wildcard $(SRC_PATH)/../../roms/SLOF/lib/libnet),)
+include $(SRC_PATH)/netboot.mak
 else
 s390-netboot.img:
 	@echo "s390-netboot.img not built since roms/SLOF/ is not available."
diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 68b4d7edcb..1a06befa4b 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -1,5 +1,5 @@
 
-SLOF_DIR := $(SRC_PATH)/roms/SLOF
+SLOF_DIR := $(SRC_PATH)/../../roms/SLOF
 
 NETOBJS := start.o sclp.o cio.o virtio.o virtio-net.o jump2ipl.o netmain.o
 
-- 
2.36.0


