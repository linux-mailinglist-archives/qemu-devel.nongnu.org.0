Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E279529E7C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:50:53 +0200 (CEST)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtqu-0004Bf-9A
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTf-00006F-QU
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTe-0003eC-1S
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2ulbuc2KaZH0veRnZxBkz6cgsAU+5K3oYUwI58WvS8=;
 b=Gm0Rm03AIY/HnB9h95oX3TkT7ygvidrgkGCgkvN9NO3sKi20lp64MqrGHnvs4KheOW28tU
 kGkvpOrVLe8hQjlOj94CUDM3HwoN/EyzRNCJFMMtSHcsRg6zdY7Zp7A/7jjY0+QAPF2UjW
 DS/nQM7pvS72t5hRC+K+PM9RIOUz0a8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-Vs-1HRweNQ6lvrcii6U3ng-1; Tue, 17 May 2022 05:26:48 -0400
X-MC-Unique: Vs-1HRweNQ6lvrcii6U3ng-1
Received: by mail-ej1-f71.google.com with SMTP id
 jx8-20020a170906ca4800b006f88b28f2f6so7058185ejb.11
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M2ulbuc2KaZH0veRnZxBkz6cgsAU+5K3oYUwI58WvS8=;
 b=WqEl1djO9AgjXOJkfxQSUcgmp1M/ztrOA4vctLlWPT0re1YBLXbdfk5sH8Z1mTZte3
 iosON9zknrxpZ06iG/zgtPD8Kysxh5OgO2PX/8Ma/sjmYp4dIK3S3psQx6fYSxDmgUsb
 LxVQEH54dE92aW656vHj7FXK0+5nj/TH51i0VkGL7qPSq8UnIlAH8M8238ayN0fL8ggT
 3Upoo7Os8PyXT6CcrsFgn8mJhl431Mg6ShVQHbgAmlIk8n6tTvS6NKGcv6FfTZS3jIxL
 kONQjTlybR8MUCen3nukBTqM5jifH2jhxEJ+hH/IBXxdZQhuGtMvD+Jw6qZAZU12qJKH
 9aZA==
X-Gm-Message-State: AOAM533NnHrBsvrCC9IisgjMgQ/nDCHRsEqAaR1Oe6E9eo72VmpLgPa4
 AwdQ0OuEXQ0xxCpoPEUMBcjiXNn8qqGQ8zvANKQkZLiuPHwL7lq+iNgZ+KVbirgxU+YhXpwEqcx
 1pi8zX3EH4PbyCNx8BEHI9YAwMymCoX3bJIlNKG5no5CBlItorb/8vTeA0C82ThoN7tE=
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr1255340edb.415.1652779606835; 
 Tue, 17 May 2022 02:26:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRjCcQpH30/i7HLm8cNKaF4CXCCbY++6yhfDCibFnZWZPhQ/yDk+QHwWjkzL0zInBEdqEpjA==
X-Received: by 2002:a05:6402:5298:b0:42a:cb63:5d10 with SMTP id
 en24-20020a056402529800b0042acb635d10mr1255321edb.415.1652779606616; 
 Tue, 17 May 2022 02:26:46 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7c04e000000b0042a5a39ba7esm5739348edo.25.2022.05.17.02.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 11/16] configure: include more binutils in tests/tcg makefile
Date: Tue, 17 May 2022 11:26:11 +0200
Message-Id: <20220517092616.1272238-12-pbonzini@redhat.com>
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

Firmware builds require paths to all the binutils; it is not enough to
use only cc, or even as/ld as in the case of tests/tcg/tricore.
Adjust the cross-compiler configurator to detect also ar, nm, objcopy,
ranlib and strip.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/configure b/configure
index ee4fcdacfe..5db0082ddc 100755
--- a/configure
+++ b/configure
@@ -1893,11 +1893,21 @@ probe_target_compiler() {
   container_image=
   container_hosts=
   container_cross_cc=
+  container_cross_ar=
   container_cross_as=
   container_cross_ld=
+  container_cross_nm=
+  container_cross_objcopy=
+  container_cross_ranlib=
+  container_cross_strip=
   target_cc=
+  target_ar=
   target_as=
   target_ld=
+  target_nm=
+  target_objcopy=
+  target_ranlib=
+  target_strip=
 
   case $1 in
     aarch64) container_hosts="x86_64 aarch64" ;;
@@ -2036,8 +2046,13 @@ probe_target_compiler() {
         ;;
     esac
     : ${container_cross_cc:=${container_cross_prefix}gcc}
+    : ${container_cross_ar:=${container_cross_prefix}ar}
     : ${container_cross_as:=${container_cross_prefix}as}
     : ${container_cross_ld:=${container_cross_prefix}ld}
+    : ${container_cross_nm:=${container_cross_prefix}nm}
+    : ${container_cross_objcopy:=${container_cross_prefix}objcopy}
+    : ${container_cross_ranlib:=${container_cross_prefix}ranlib}
+    : ${container_cross_strip:=${container_cross_prefix}strip}
   done
 
   eval "target_cflags=\${cross_cc_cflags_$1}"
@@ -2048,12 +2063,26 @@ probe_target_compiler() {
   else
     compute_target_variable $1 target_cc gcc
   fi
+  target_ccas=$target_cc
+  compute_target_variable $1 target_ar ar
   compute_target_variable $1 target_as as
   compute_target_variable $1 target_ld ld
+  compute_target_variable $1 target_nm nm
+  compute_target_variable $1 target_objcopy objcopy
+  compute_target_variable $1 target_ranlib ranlib
+  compute_target_variable $1 target_strip strip
   if test "$1" = $cpu; then
     : ${target_cc:=$cc}
+    : ${target_ccas:=$ccas}
     : ${target_as:=$as}
     : ${target_ld:=$ld}
+    : ${target_ar:=$ar}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+    : ${target_nm:=$nm}
+    : ${target_objcopy:=$objcopy}
+    : ${target_ranlib:=$ranlib}
+    : ${target_strip:=$strip}
   fi
   if test -n "$target_cc"; then
     case $1 in
@@ -2069,6 +2098,10 @@ probe_target_compiler() {
 write_target_makefile() {
   if test -n "$target_cc"; then
     echo "CC=$target_cc"
+    echo "CCAS=$target_ccas"
+  fi
+  if test -n "$target_ar"; then
+    echo "AR=$target_ar"
   fi
   if test -n "$target_as"; then
     echo "AS=$target_as"
@@ -2076,14 +2109,32 @@ write_target_makefile() {
   if test -n "$target_ld"; then
     echo "LD=$target_ld"
   fi
+  if test -n "$target_nm"; then
+    echo "NM=$target_nm"
+  fi
+  if test -n "$target_objcopy"; then
+    echo "OBJCOPY=$target_objcopy"
+  fi
+  if test -n "$target_ranlib"; then
+    echo "RANLIB=$target_ranlib"
+  fi
+  if test -n "$target_strip"; then
+    echo "STRIP=$target_strip"
+  fi
 }
 
 write_container_target_makefile() {
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
+  echo "AR=\$(DOCKER_SCRIPT) cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
   echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
   echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  echo "NM=\$(DOCKER_SCRIPT) cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+  echo "OBJCOPY=\$(DOCKER_SCRIPT) cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+  echo "RANLIB=\$(DOCKER_SCRIPT) cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+  echo "STRIP=\$(DOCKER_SCRIPT) cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
 
-- 
2.36.0


