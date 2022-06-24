Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39255957D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:34:05 +0200 (CEST)
Received: from localhost ([::1]:45736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4elQ-0003iR-DE
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efI-0005pI-OB
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efH-0005Sx-4x
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8+iHZndsfh6ZPzkxpQlOZtsgTLcoWONkUeR9C5fSbg=;
 b=Qb+DVvpuhx7zo/0vnjWEh/ikhPxmXWZGLa38h1qsTtYGQmB1H4OCUNs2PvKMNsx1lQ3WLr
 cD9RChgijQqMV4gVDU8dVtZDTLugJRbeT5K6EWvTd9WdjByGIOEFiDG/qBzHB8ibbFFKCE
 Px7e8XrE4ezbCNTKLC/WhmR3BIFg/a0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-85nXJWcrMmGt7qR3thicRA-1; Fri, 24 Jun 2022 04:27:41 -0400
X-MC-Unique: 85nXJWcrMmGt7qR3thicRA-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb34-20020a1709076da200b00722f4a9865bso592960ejc.1
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c8+iHZndsfh6ZPzkxpQlOZtsgTLcoWONkUeR9C5fSbg=;
 b=7pao0ot/fKijYEWu7D0eU3ASjDrb8jRgB6wsNGGbPPJvfrK1SVY6IxLfNB0bcJcuKY
 /JwcL0z/LH4/+KNsy4Hx715YXutwQYHLIIOnVpuwzwGFjuBEDH9LDkWDztpjykcrgptB
 aL6mXg+vzgTHvEn+resdFmYP8qFI9iND5j6q8O4lFTkmn/y6PxgUrRmSr6UWM3KT8jwr
 zmwdaJ6H1GO00xLFtFiJ0VMEquU4PnX1u+lJS4takf73VGGgLBaqM6toG/BF+pADNSto
 gbaa/sabarZmcrhMKpppPlR2v0rG0ZeSMtLRXMVBD/nNSWPp6VUdzhCrTW5me51xCXFJ
 evFQ==
X-Gm-Message-State: AJIora+Yc4zfe6oVj3W+DWH5gbeowagmqSTo67q2R+fhzzi2KibZb0uH
 m2DlLnV4Adkl8O2PDU7RiYo4pAKQM0VXrqbgUkUEMUL2JCRme0U+r++JhJmYmbrVg/yLZSwi6QU
 PSap1CpRcJHnZt0K1+ZknUQ4rsd5Gd+HHcPFAe+FHw7cGlW/DUp+Zd8qpIs5gDAQgCjg=
X-Received: by 2002:a17:906:ae0f:b0:726:32b3:17f4 with SMTP id
 le15-20020a170906ae0f00b0072632b317f4mr1420906ejb.116.1656059259535; 
 Fri, 24 Jun 2022 01:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t8a9SHHCsYy2v9/V2h1FDtKvJIKOUizLFIVpno5+2gYHrMe0g07mWpOfi7Tb/rko68mQUe/w==
X-Received: by 2002:a17:906:ae0f:b0:726:32b3:17f4 with SMTP id
 le15-20020a170906ae0f00b0072632b317f4mr1420885ejb.116.1656059259208; 
 Fri, 24 Jun 2022 01:27:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b0042617ba638esm1429894edt.24.2022.06.24.01.27.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] configure, pc-bios/optionrom: pass cross CFLAGS correctly
Date: Fri, 24 Jun 2022 10:27:19 +0200
Message-Id: <20220624082730.246924-4-pbonzini@redhat.com>
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



