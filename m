Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615D552C8C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 10:04:27 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ys6-0006jv-E9
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 04:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3YgA-00036W-TO
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o3Yg7-0005vi-Nh
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 03:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655797923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7JySz0fdQvD9uHzuwePQvqCy994/RL69/J08zdtNoNo=;
 b=WE/xq2rdiK5+CI/x/RSMFegJ+w8SignY5GUuAxEMIOt3OGGMnDeOyb0KKdhIAux4TAfu4D
 JZguo0l3EzZTzmZ6gopYXfOLg8nFEy7t0Jno4Evc97tCxvjXMGHMe1uUoisZEovMkA6m/H
 uy2Wk8tRvS6e+iJxcCIZV4z5o03iKos=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-rAdVPxEbNrGCfFCxiSr7kA-1; Tue, 21 Jun 2022 03:52:01 -0400
X-MC-Unique: rAdVPxEbNrGCfFCxiSr7kA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne36-20020a1709077ba400b00722d5f547d8so1285668ejc.19
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 00:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7JySz0fdQvD9uHzuwePQvqCy994/RL69/J08zdtNoNo=;
 b=LxlRw/GBiai//2wC4+z9VTUTAGkAd6DNoct5Ow42JMe1pQfBcpp7th1MC+hyEa5SnS
 RtS9dYdT7yC80rB6VevZHCyM7eBxMMs2yAr7HViBz6PVj7A6oy+rkyK4+rPOgNKk03K2
 eigI8VCk1FAndanAtp60vKmDdDB0/rLlcBdO7GlHGigFT4JL3WPcrJOJg4dzqF+AazQQ
 OuaTpNDGp56bVUvZxyNMXOn+E1s0c0djYaakwO4+EqgB+5Nzy4UcMTe6wyt0KSuvSeJJ
 iwlhiuV/XsCKlkBlkl3Wy+g79x2Ng4TV6y8j9lDHPG3aYbP9QEZqAEixUPzfdpkyan+c
 lFNQ==
X-Gm-Message-State: AJIora99f+7Wp0LihkgDaUYp8+O60A30DNqlAY2/+z9mBo4WvCPF8DwA
 gdixPl1pTap6gvjUIohp7co9YatUJsUX63StI3cAeqLOPolvxRd7QlGj167Wp+UUR1ABWCkVfFR
 RntnZc2SAE9NE20w40CyaTst13oP4FaidkwEmG9SG9UgGxMebhx8+VhpyM+8t9TdIYLM=
X-Received: by 2002:a05:6402:201:b0:431:665f:11f1 with SMTP id
 t1-20020a056402020100b00431665f11f1mr34805021edv.378.1655797920252; 
 Tue, 21 Jun 2022 00:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ugZtV35tb7onWyrzTjcVN5cpL0htyEXSmPnu5Z9gKtJJ1+I+jKDWW2HDEz1+LEOG5f87lJ3g==
X-Received: by 2002:a05:6402:201:b0:431:665f:11f1 with SMTP id
 t1-20020a056402020100b00431665f11f1mr34805002edv.378.1655797919933; 
 Tue, 21 Jun 2022 00:51:59 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 y11-20020a056402270b00b0042e1cbc4471sm12304967edd.3.2022.06.21.00.51.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:51:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] configure: write EXTRA_CFLAGS for all sub-Makefiles
Date: Tue, 21 Jun 2022 09:51:47 +0200
Message-Id: <20220621075147.36297-7-pbonzini@redhat.com>
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

Move the EXTRA_CFLAGS line from the individual subdirectory blocks to
the common write_target_makefile and write_container_target_makefile
shell functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index c9feb1a924..0fd2838e82 100755
--- a/configure
+++ b/configure
@@ -2090,6 +2090,7 @@ probe_target_compiler() {
 }
 
 write_target_makefile() {
+  echo "EXTRA_CFLAGS=$target_cflags"
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
     echo "CCAS=$target_ccas"
@@ -2118,6 +2119,7 @@ write_target_makefile() {
 }
 
 write_container_target_makefile() {
+  echo "EXTRA_CFLAGS=$target_cflags"
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
     echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
@@ -2258,7 +2260,6 @@ if test -n "$target_cc" &&
         echo "# Automatically generated by configure - do not modify" > $config_mak
         echo "TOPSRC_DIR=$source_path" >> $config_mak
         echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_mak
-        echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
         write_target_makefile >> $config_mak
     fi
 fi
@@ -2269,7 +2270,6 @@ if test -n "$target_cc" && test "$softmmu" = yes; then
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
-    echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
     write_target_makefile >> $config_mak
 fi
 
@@ -2289,7 +2289,6 @@ if test -n "$target_cc" && test "$softmmu" = yes; then
     config_mak=pc-bios/s390-ccw/config-host.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
     echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
-    echo "EXTRA_CFLAGS=$target_cflags" >> $config_mak
     write_target_makefile >> $config_mak
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
@@ -2604,7 +2603,6 @@ for target in $target_list; do
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
-      echo "EXTRA_CFLAGS=$target_cflags" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
-- 
2.36.1


