Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694D552C81
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:01:19 +0200 (CEST)
Received: from localhost ([::1]:55028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Yp4-0003fp-HK
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg5-0002xv-I4
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg2-0005uv-9N
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ImzJMwhR9wPVnFIPtIciK8UDE1hqPREDSJo0a91d7Q=;
 b=Avn03t0BjmJKSutVQniL9QK2U/j7xvQmM/yoDWmj8FO1ZSp/H9VanwZBqQ2JWuHONB7MHs
 NTwy0JSGGIU4v9payxF/4JSAtjB3cZFEPsafcoVH9TXOxCahGww4t8ybSPX39Uos55mr+T
 Wr69ioVQlwGqgAPd6MWB91VhqUudJLU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-OXUL9_W7N8OFVs0xQ2YnRg-1; Tue, 21 Jun 2022 03:51:55 -0400
X-MC-Unique: OXUL9_W7N8OFVs0xQ2YnRg-1
Received: by mail-ej1-f71.google.com with SMTP id
 ne36-20020a1709077ba400b00722d5f547d8so1285535ejc.19
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ImzJMwhR9wPVnFIPtIciK8UDE1hqPREDSJo0a91d7Q=;
 b=lHIwpYt3rOqWSHRr5vJ9Uiedjl4+8skJVHFuvsRfFBuGcsKA4/Z/DtKWn5+QvdCkiW
 KE+At05x6QEa5DSDmwEHDR4b2yMqyNS0nZB0wVDZBnugf8rnONSgduY0f7JsQmkU83FA
 lDPUgPc5KZrmzHtMuuwIwnbsBq+j85js8D+mAt/kM+8YztFLTHHT5XrbqatfatRyjzeF
 uQ73kF86ep9JcxhXE1qdi7hzQDLuUxQZoo/7/KZlzwMuGuq9icJYdimguWLsOM4o878t
 ScRKoekFaJAegFdFpnJSMUzgrt4Y3TlPgqtjwNTHvHyO05CEzGppZXbsYF4N+d7NvnhT
 K9Ag==
X-Gm-Message-State: AJIora85ItF2rVbGSl1on1uR5VT+glndY8AKFfjKfc1JlI0bZWLaNAWW
 aDkcOdf2qNsLQpB/RI5M3IyUrjHZ2hfIgyrUGMl+wpmxOsbHmOSaoDfpm/uHHhHQUDH1I4hg0Z+
 wnxNPg3k/8GemNswgELX/ahbAl+ras48ZGqFUE5Zj2Gbb8yHxibU02Tx8Xf5i1yCCgqg=
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id
 6-20020a170906208600b00712125777bfmr25715139ejq.655.1655797914071; 
 Tue, 21 Jun 2022 00:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vhM3nIc+lh4Ubs9X6LCaokpxjTAkSU9KvuQz6eDtuQ+XAGG4YMA9sLCkvV9dKb5aCtP1nhBw==
X-Received: by 2002:a17:906:2086:b0:712:1257:77bf with SMTP id
 6-20020a170906208600b00712125777bfmr25715118ejq.655.1655797913681; 
 Tue, 21 Jun 2022 00:51:53 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a170906768200b0070b8a467c82sm7144780ejm.22.2022.06.21.00.51.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] configure, pc-bios/optionrom: pass cross CFLAGS correctly
Date: Tue, 21 Jun 2022 09:51:43 +0200
Message-Id: <20220621075147.36297-3-pbonzini@redhat.com>
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

The optionrom build is disregarding the flags passed to the configure
script via --cross-cflags-i386.  Pass it down and add it to the Makefile.

This also fixes compilation of TCG i386 tests using an x86_64 compiler.

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



