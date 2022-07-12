Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342F571ABF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:03:47 +0200 (CEST)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFYI-0003ky-PA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-00037d-VR
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLE-0001Rx-2z
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmKEKXz1WMCXAE3ifCH3/oBkIMjVzlAEXgVpEHl337o=;
 b=gwerzvcFfaJRN9fj3NQawuUIh/2TegP6bq9nmh8tDEGU1rc+TkhQsu1fQStAP59TJr+107
 fN5hAzC7eLrmBKruzn9I8TxzRZS+s6rfaWrA3OQI1traRxrmGBow6dLuyaxk5fu/cNHuS6
 BomngspLRW7HDYC5yqhb4UEAtgJnfEc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-O9wd1JSbPaSjOWb6XA7osg-1; Tue, 12 Jul 2022 08:50:14 -0400
X-MC-Unique: O9wd1JSbPaSjOWb6XA7osg-1
Received: by mail-ej1-f72.google.com with SMTP id
 sh39-20020a1709076ea700b0072aa3156a68so2252741ejc.19
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmKEKXz1WMCXAE3ifCH3/oBkIMjVzlAEXgVpEHl337o=;
 b=lfJGEegh8T/18Z0o4A0pv3ygcaIkXsi4fWhheiIWErJVQUzwakzpBC03pxpvOzeogm
 B3QEb6fCXard/uZE+v0EFcxHql/l3coOnghJLiSb4esnAtnbZGkukTM3V31kRZzlJfT8
 a2kU/ndtAMyR/H+MpKhZ1STl/ftbevXhAE9AZcdZ1bVpVOutB8zs3o3dL2RJ+u80LiFS
 CA5bBNUiJmd328lxe7cDbVVSS0bQARkAdEpcWcOgy7itRgn5QcxxrGC+DAqRU75dtMs4
 7iQPWZkl9FmWB7Aj9mDgciyON+XXWMva0dNCb1DfsZqcIAB/RW7TQ+DpqhXxFrJgASoJ
 J92w==
X-Gm-Message-State: AJIora/FfH8sApDrIRYAh4/pxfC82XL+np31Fg15g7nuaZ+5Ky3vdPh2
 LazaEG6sULOwa4M5QC9k/htO7ZKsanboOihlGm1Tl9b7WzlKyUR7Br5HfQUVaWKV0tbIl/kA49h
 6Jwu26F12TgoT/+Fkl+Zz0BrqQH6rtIU2zeR+NNRTPfmermQpPjF2wBF8JDatfpGGRmI=
X-Received: by 2002:a05:6402:348e:b0:43a:953d:ade8 with SMTP id
 v14-20020a056402348e00b0043a953dade8mr31804965edc.135.1657630212883; 
 Tue, 12 Jul 2022 05:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vNm94WruIMDdeVC9jo2ODDBDBWLiqqJPgADnnEzeXqOWjCNV9jeaEhh6PoiV7+Zg8paXzsLQ==
X-Received: by 2002:a05:6402:348e:b0:43a:953d:ade8 with SMTP id
 v14-20020a056402348e00b0043a953dade8mr31804937edc.135.1657630212567; 
 Tue, 12 Jul 2022 05:50:12 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 lx20-20020a170906af1400b0072737733f9asm3744791ejb.106.2022.07.12.05.50.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/18] configure: write EXTRA_CFLAGS for all sub-Makefiles
Date: Tue, 12 Jul 2022 14:49:46 +0200
Message-Id: <20220712124956.150451-9-pbonzini@redhat.com>
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



