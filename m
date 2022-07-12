Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17571571ABB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:03:40 +0200 (CEST)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFYA-0003RJ-Vm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLQ-0003B8-I1
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL9-0001RT-VL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8+iHZndsfh6ZPzkxpQlOZtsgTLcoWONkUeR9C5fSbg=;
 b=V3m3GeRuf62Ms+Esxr+JAsT4t98CCPFn6MRARwnqJgGS2kFFykXk7K/sYj1Wr6jml30LKq
 3U8ybaspzX/RXHuS3NVXAfmP/fMy5GrTFLXoNgHFnnmiIp9CpOvFFPSb1nPKqk4opehgtK
 xHSszDNeHjwopOzc8PzYHUB5mQ/pZao=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-qwUZAhN0OQ6ExBFDbhcdDQ-1; Tue, 12 Jul 2022 08:50:08 -0400
X-MC-Unique: qwUZAhN0OQ6ExBFDbhcdDQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 i9-20020a05640242c900b0043aeffc5cf1so1052623edc.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8+iHZndsfh6ZPzkxpQlOZtsgTLcoWONkUeR9C5fSbg=;
 b=wKXt7g9bvmb+w/hGMgU/j1OgEipAGBf3k34NA/6upFIc9xTGbZz5H+pmtCVP+WNucC
 KCxFR+2AFJLcpGh+DPHsttu2Lukhhx+Uug7aqvp6oRYMXmROh6OuPuWjQ3YZEDbnM2TJ
 EIBQaoU7kFSPcEZtzuYF3/Hd6FkPNcndKmvxU0Y0a4XwNfC58YyxxyKLOE5pH/aorJ52
 Sr99iy47VfyKO7zk7LsySEC2TChLuKFx45V0y3fqJpv2RwxL52r8c19lp8meL+ayiERR
 I3qKZm1rdEtGfOt0p6WIAVXwk5n1ilsGy7luLYwzn6I0AQRYYVmHy/R0zDYvwO/TQsH1
 9l/A==
X-Gm-Message-State: AJIora+k+Qu8JTJjgldSxaxMYae23afJhtuR6g+gSgKUeUItKbtmFAoF
 Gw4FKjJc6V9wpqPcfDKV171EuDW/cO1tG3dZ4dcnwUsQlVtXlnE8QCYYYG4G60n2u183uEUu9s4
 jZ8Z27YkcdJvdAgJ6ZG4xOAuTvoXjNrn/AtApR0cz6oJLied4Zi1p8GwVg7T3XUFSWb4=
X-Received: by 2002:a17:907:7747:b0:6f3:ead4:abcb with SMTP id
 kx7-20020a170907774700b006f3ead4abcbmr23869787ejc.296.1657630206970; 
 Tue, 12 Jul 2022 05:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHKmOGGWCW8KljEhYG4QJFfppSfyqJaCQcqa/13+JL0x7XkZAZxkVOsU+CTTdzpiumlczS7w==
X-Received: by 2002:a17:907:7747:b0:6f3:ead4:abcb with SMTP id
 kx7-20020a170907774700b006f3ead4abcbmr23869763ejc.296.1657630206683; 
 Tue, 12 Jul 2022 05:50:06 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 q23-20020aa7d457000000b0043585bb803fsm6035462edr.25.2022.07.12.05.50.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] configure, pc-bios/optionrom: pass cross CFLAGS correctly
Date: Tue, 12 Jul 2022 14:49:42 +0200
Message-Id: <20220712124956.150451-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The optionrom build is disregarding the flags passed to the configure
script via --cross-cflags-i386.  Pass it down and add it to the Makefile.

This will make it possible to get the -m32 flag from $target_cflags to
force a 32-bit build on 64-bit hosts, instead of supplying manually the
arcane -Wa,-32 and linker emulation options.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                  | 32 ++++++++++++++++++--------------
 pc-bios/optionrom/Makefile |  2 +-
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 76728b31f7..3d00b361d7 100755
--- a/configure
+++ b/configure
@@ -2057,19 +2057,22 @@ probe_target_compiler() {
   compute_target_variable $1 target_objcopy objcopy
   compute_target_variable $1 target_ranlib ranlib
   compute_target_variable $1 target_strip strip
-  if test "$1" = $cpu; then
-    : ${target_cc:=$cc}
-    : ${target_ccas:=$ccas}
-    : ${target_as:=$as}
-    : ${target_ld:=$ld}
-    : ${target_ar:=$ar}
-    : ${target_as:=$as}
-    : ${target_ld:=$ld}
-    : ${target_nm:=$nm}
-    : ${target_objcopy:=$objcopy}
-    : ${target_ranlib:=$ranlib}
-    : ${target_strip:=$strip}
-  fi
+  case "$1:$cpu" in
+    i386:x86_64 | \
+    "$cpu:$cpu")
+      : ${target_cc:=$cc}
+      : ${target_ccas:=$ccas}
+      : ${target_as:=$as}
+      : ${target_ld:=$ld}
+      : ${target_ar:=$ar}
+      : ${target_as:=$as}
+      : ${target_ld:=$ld}
+      : ${target_nm:=$nm}
+      : ${target_objcopy:=$objcopy}
+      : ${target_ranlib:=$ranlib}
+      : ${target_strip:=$strip}
+      ;;
+  esac
   if test -n "$target_cc"; then
     case $1 in
       i386|x86_64)
@@ -2238,7 +2241,7 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-probe_target_compilers i386 x86_64
+probe_target_compiler i386
 if test -n "$target_cc" &&
         test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
         test "$targetos" != "haiku" && test "$softmmu" = yes ; then
@@ -2257,6 +2260,7 @@ if test -n "$target_cc" &&
         echo "# Automatically generated by configure - do not modify" > $config_mak
         echo "TOPSRC_DIR=$source_path" >> $config_mak
         echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
+        echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
         write_target_makefile >> $config_mak
     fi
 fi
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index ea89ce9d59..e90ca2e1c6 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -11,7 +11,7 @@ CFLAGS = -O2 -g
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 cc-option = $(if $(shell $(CC) $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1 && echo OK), $1, $2)
 
-override CFLAGS += -march=i486 -Wall -m16
+override CFLAGS += -march=i486 -Wall $(EXTRA_CFLAGS) -m16
 
 # If -fcf-protection is enabled in flags or compiler defaults that will
 # conflict with -march=i486
-- 
2.36.1



