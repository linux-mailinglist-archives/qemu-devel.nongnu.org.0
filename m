Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C9552C70
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 09:56:37 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3YkW-0006b0-Mj
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 03:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg6-00030I-Sz
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg5-0005vF-An
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUDEvAYpas2OIeLZAuNbCzfYxc2UpJhMF/Rl8lVm3ss=;
 b=BY+A/AT7P61Uekics15DgpK5+3qgPQDCweGmIO5GeExUqDJNtg5+A86kXUhOCb1kXfWAMV
 WfOXuihRh00+Xs+2FHtw9HYyDPYToiHz9XIDUOeqJLU1JNSQrB5vwEXsA9xiL/dGLxlHEs
 iOsNPOL7mFJmK74+2vUWN5nGM8DMG7k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-qerNNhmLNgOHU5kX1RvgZA-1; Tue, 21 Jun 2022 03:51:58 -0400
X-MC-Unique: qerNNhmLNgOHU5kX1RvgZA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x15-20020a05640226cf00b004318eab9feaso10363314edd.12
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hUDEvAYpas2OIeLZAuNbCzfYxc2UpJhMF/Rl8lVm3ss=;
 b=7vL/lClm/BtK76+yAjN+3PhusA9dwNa2OltndGQRRDmm2tcGAcuxVldDShbKhpwKGh
 qQ+Jl9qwXqh/SmDULnZlZPzKvO8jHygACI2cHY4lMp8FJlQcKEwtG/104EouFmjNyvuv
 /ZczlS2BFlAqCkXgKJ1Ek1A5vAx+PhabemaWT+O2vM3AtCWD1ulH1yQYRkNd2BiVmYmq
 0F7jabTEl4M6+3sAB8z3ydRfwoyONJzZl9xeEnEwu0qCpDNREKh7IkobBL6lLVbc0k53
 Je00TbW1sTbZi4TnTyprfBA1zoFpE/NzKQqAcGxZ/9DuoAiF9B3t6q9RYmQflUGT2GuX
 kB3g==
X-Gm-Message-State: AJIora/QfgU88BSsRNkIgiUSS5UpSdDHOYjROlyadZwhzod8LJFPzs42
 V1F0jfi2IU0sCzpRoRvJ1LCg0xQGrU1JkcXJLDrvJqAcupFf12j1Hm2qZrs6/Qc0brYo4XEbwyn
 P219628+Lj88+i71rS0mN7l3Hu7FaOIo6oNKf6cy4yqzHN8eJgmE3qnprFgGJM2qXOa4=
X-Received: by 2002:a17:907:a410:b0:70b:db4d:784d with SMTP id
 sg16-20020a170907a41000b0070bdb4d784dmr23813978ejc.185.1655797917029; 
 Tue, 21 Jun 2022 00:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1urVsIdXxFSuFM17sykPy3j01xRKQWmPskUNCE6GXgGvc87+ukoheruOGuQ9vTpHS5UVk5DeQ==
X-Received: by 2002:a17:907:a410:b0:70b:db4d:784d with SMTP id
 sg16-20020a170907a41000b0070bdb4d784dmr23813959ejc.185.1655797916652; 
 Tue, 21 Jun 2022 00:51:56 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a056402424c00b0043589eba83bsm3481415edb.58.2022.06.21.00.51.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] configure, pc-bios/vof: pass cross CFLAGS correctly
Date: Tue, 21 Jun 2022 09:51:45 +0200
Message-Id: <20220621075147.36297-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621075147.36297-1-pbonzini@redhat.com>
References: <20220621075147.36297-1-pbonzini@redhat.com>
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

This also fixes compilation of TCG tests using a biarch compiler,
for example ppc64 tests on ppc64le.

Reported-by: Matheus Ferst <matheus.ferst@eldorado.org.br
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



