Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA355958C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:37:24 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eod-0001Rd-Nn
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efO-00060p-HW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efM-0005Tf-5Z
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdKREiWGlc9GRmtH2zZG1YUUIf3U3o7uZP/DuGpn4k0=;
 b=P/ia0jDT/xhjKXg4FZdU02wY8fsHq6G9hqRfDhV9ZRAuVcnk6uN89UyOZm1q9TY7Gf750f
 eYnsFZJ+Mmf4S2j7YPiN9RzXnY39nQCnfCxZl30xDZ0+ZGLcgUVqB7jzl2qafWVKdXvAH9
 OZZVGPgabSqn92qHSQ1FuzY6O+zK64k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-0LjA2anTP5eZWHQ5JrRd4g-1; Fri, 24 Jun 2022 04:27:44 -0400
X-MC-Unique: 0LjA2anTP5eZWHQ5JrRd4g-1
Received: by mail-ej1-f70.google.com with SMTP id
 q5-20020a17090676c500b00704ffb95131so581186ejn.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdKREiWGlc9GRmtH2zZG1YUUIf3U3o7uZP/DuGpn4k0=;
 b=RJ1FZbROkhxF21yTBl4TOyIfio5YzssToCaKkgj2W4Ro5JTU2aAKnppJED+SCAga+F
 BA8lSZuvFf05vLRAi0liSgjwZKGrSgyFSApH78WK+u4FN3hM+CYyUS+pajbapG1Wh/sp
 pYjKhl0qzShZWYiCdffWmDPw0an1uI9doobG8wPMglcHF5CRs4+WiKQdp2kvyHYHgSmQ
 /viMxM+KoX++nz0CN24cWy1OD0LGZEChbwRBSD/hcPkGu0BZ1SoZyw5RVJiNgYuamHb4
 KhlCMeQuzjJ+1E/ngVrQYBUgNjZaMwHYuZjMaXfBkIU3dGy1aAb0/mHtDnQVIBloVbo6
 4ANA==
X-Gm-Message-State: AJIora+ZS73DcViuI91tc6Da6Meqir1iUOJmC+cwb4N55RRrcZ07mSPo
 JWB9ZXBsIKHY4/4avvj6J90/SfiQDV7yAj/kRXnNvs+PYnpbyxSDylUMsc1Me33O+hPj+farqui
 4WL9I4FlYC8sUuOqIpyy4Cdxj/u8uWLB2O5t+63aGhotcOgZFnNyJYdj1U5L/3Glt3GY=
X-Received: by 2002:a17:906:4795:b0:722:f42b:18b8 with SMTP id
 cw21-20020a170906479500b00722f42b18b8mr11169845ejc.34.1656059263087; 
 Fri, 24 Jun 2022 01:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7qwVfDXqiFBwqThOatp5KNMISoVADU4clM2DJ1WMfCKzJLi2A+ClxC8JlSmLcwcDmge2tkA==
X-Received: by 2002:a17:906:4795:b0:722:f42b:18b8 with SMTP id
 cw21-20020a170906479500b00722f42b18b8mr11169824ejc.34.1656059262824; 
 Fri, 24 Jun 2022 01:27:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 p19-20020aa7cc93000000b0042bdb6a3602sm1396429edt.69.2022.06.24.01.27.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] configure, pc-bios/vof: pass cross CFLAGS correctly
Date: Fri, 24 Jun 2022 10:27:21 +0200
Message-Id: <20220624082730.246924-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
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



