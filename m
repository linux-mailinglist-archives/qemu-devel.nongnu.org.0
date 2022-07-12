Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D96571AC4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:04:17 +0200 (CEST)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFYm-0004z1-Ui
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-00037Z-SR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLC-0001Rc-G5
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdKREiWGlc9GRmtH2zZG1YUUIf3U3o7uZP/DuGpn4k0=;
 b=jB1FUofDkIzzUi+jzI5aQhxfYsrdq77eeZXz/Kws/vyDebZRlV8jMG5KUG+5I/SO3KQFx9
 RnzoaIRrIYd84LaNGbE/Xm791MvbHKhC+lCWhZucGyVrDD92CWekcaIEu/rkccIVt5U0l+
 TwSwM0sLsEHd+c4IjtB/0FG5F4i2o+c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-0H63s1XeMbGrTN-0YyfaFw-1; Tue, 12 Jul 2022 08:50:11 -0400
X-MC-Unique: 0H63s1XeMbGrTN-0YyfaFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso4733626ede.21
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdKREiWGlc9GRmtH2zZG1YUUIf3U3o7uZP/DuGpn4k0=;
 b=1wGSImoR1JX3Qr4T613p6DhXvtzTsKovlxKYgFTBZHRUFJmwlJCvttn923eja4vUqw
 3UU9cTtYUaP1KaASK+qKUGL/wsSx/TKKqN/qKep/l+O2vsFl7W28o9PPTW5hD5yPtiqA
 0OjeyGDKoHh1q9whHVYB9Xaog4iE9NiG8oQWxjzFYEFVKNz8xs3MwUvhvht9Ote3aAPk
 9ec7mNE7iBAYlW9ZIOgDvLIHJj6PTG3wbBx24t6iWwSSOU9nm3lkEx/GWlMHtj/YgkAV
 aibGUBZP7Rd9J9KEoHWPQdmzMXH3pOcKWLvHGET8dnpz65zevD7JttFl2Qbepyx6OTDv
 /h8Q==
X-Gm-Message-State: AJIora9QwBgrcGbtwO9QY5/9eslMFu/nJl9fqiZwV6DHXuBeTy8GCvxJ
 qWXAyV0zs7MGnwoj57xlhnEVnvVfqvnypknghTjxho1bWzkasSQUJa15oEUm7AqtoEd+PkOc4/t
 s5TAz/Y4z4iaX4rZA+59OfA+HB30RsYeoLAjUWr1/wHDmdh539yioBXbxrlyqF/FsZ4U=
X-Received: by 2002:a17:907:d22:b0:726:dbb1:8828 with SMTP id
 gn34-20020a1709070d2200b00726dbb18828mr24458956ejc.722.1657630210190; 
 Tue, 12 Jul 2022 05:50:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdcaw4xo/tMUI3Wj3HOxz4P9pnBewlzwj0ia/SIx8s9nVm0pShclDvTQ8CMPSpgOBJP0jxzQ==
X-Received: by 2002:a17:907:d22:b0:726:dbb1:8828 with SMTP id
 gn34-20020a1709070d2200b00726dbb18828mr24458928ejc.722.1657630209859; 
 Tue, 12 Jul 2022 05:50:09 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bf14-20020a0564021a4e00b0043a78236cd2sm5993004edb.89.2022.07.12.05.50.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] configure, pc-bios/vof: pass cross CFLAGS correctly
Date: Tue, 12 Jul 2022 14:49:44 +0200
Message-Id: <20220712124956.150451-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
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

Use the flags passed to the configure script for the ppc cross compiler,
which in fact default to those that are needed to get the 32-bit ISA.
Add the endianness flag so that it remains possible to use a ppc64le
compiler to compile VOF.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure            | 13 ++++---------
 pc-bios/vof/Makefile |  8 +++-----
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/configure b/configure
index bf9282e2a1..8f3401a23e 100755
--- a/configure
+++ b/configure
@@ -1858,7 +1858,7 @@ fi
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
 : ${cross_cc_cflags_i386="-m32"}
-: ${cross_cc_cflags_ppc="-m32"}
+: ${cross_cc_cflags_ppc="-m32 -mbig-endian"}
 : ${cross_cc_cflags_ppc64="-m64 -mbig-endian"}
 : ${cross_cc_ppc64le="$cross_cc_ppc64"}
 : ${cross_cc_cflags_ppc64le="-m64 -mlittle-endian"}
@@ -2059,6 +2059,7 @@ probe_target_compiler() {
   compute_target_variable $1 target_strip strip
   case "$1:$cpu" in
     i386:x86_64 | \
+    ppc*:ppc64 | \
     "$cpu:$cpu")
       : ${target_cc:=$cc}
       : ${target_ccas:=$ccas}
@@ -2084,13 +2085,6 @@ probe_target_compiler() {
   fi
 }
 
-probe_target_compilers() {
-  for i; do
-    probe_target_compiler $i
-    test -n "$target_cc" && return 0
-  done
-}
-
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
@@ -2265,12 +2259,13 @@ if test -n "$target_cc" &&
     fi
 fi
 
-probe_target_compilers ppc ppc64
+probe_target_compiler ppc
 if test -n "$target_cc" && test "$softmmu" = yes; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
+    echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
     write_target_makefile >> $config_mak
 fi
 
diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 391ac0d600..8809c82768 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -2,15 +2,13 @@ include config.mak
 VPATH=$(SRC_DIR)
 all: vof.bin
 
-CC ?= $(CROSS)gcc
-LD ?= $(CROSS)ld
-OBJCOPY ?= $(CROSS)objcopy
+EXTRA_CFLAGS += -mcpu=power4
 
 %.o: %.S
-	$(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
+	$(CC) $(EXTRA_CFLAGS) -c -o $@ $<
 
 %.o: %.c
-	$(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ $<
+	$(CC) $(EXTRA_CFLAGS) -c -fno-stack-protector -o $@ $<
 
 vof.elf: entry.o main.o ci.o bootmem.o libc.o
 	$(LD) -nostdlib -e_start -T$(SRC_DIR)/vof.lds -EB -o $@ $^
-- 
2.36.1



