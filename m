Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C15A1CB3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:49:24 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLf9-0002av-Dc
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKh-0002nr-Tu
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKg-0004fj-1g
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6W78XcIEwjBygjDtKPv0nEQYE1uLOnUnaxuQgUKSOpI=;
 b=hWH/JjiZG0sY+rQOSCsOM/Vgj83JiEYMtZqaWhZuVaUwYRKN20meQC8lYl8tJ4TRWbN/sC
 H/un2FVQTzLaQFtpVprqD7Yf+oRSUk//CGV6/ZBhoSrrjBoOdj9r9E9x7gOyLFFMprs1ih
 wlSiT+WZq8ppR4+NEYMzqPHcwV5SQUk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-ajkT9WrSOw-JiCZNloVRCw-1; Thu, 25 Aug 2022 18:28:12 -0400
X-MC-Unique: ajkT9WrSOw-JiCZNloVRCw-1
Received: by mail-wm1-f72.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so3064705wmc.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6W78XcIEwjBygjDtKPv0nEQYE1uLOnUnaxuQgUKSOpI=;
 b=OubUoGMYHg9t9vLytak4tD4nEtiT/ZoJXEn0Qg4dVbtmADk9CkizAGpvAm5Qqm6B9e
 uKsYgObORE0wf9Ke2Od31+p6W21LDQOFl5T+9EXSAT1/26rIjyBOJwv9uZiINQab5LMQ
 qjPsBH/iUTp2f6w2G3gqCebuDgINyEzx9/zR5TzYku8k4RvCpSBl+Y75hItzgvreNse5
 iDq7c4HlpPs3Iuo9lnjnbpncfIomdLGYtf1TJs74EVN9KIFz6Zdg7Pqv1UHCanpLt6Wo
 JKoGBg62hHYhipAw10uLajFVa+bxlWVHRqDbMQ5WLkMuKVYBTLo2n/XJbNO9nUYoSGSt
 FtxQ==
X-Gm-Message-State: ACgBeo23sJADfofFhiOxEbokSl95Jhsw1QhNeC8PVelNeR9pZQU7G9zp
 1D6Zha4ET3hi3ErWqPVDF1xTYJ0qIq+ZDQxYJIHYBwWPtF1UVXRFRgCnI8Aih0JkQFBcbm7mQoJ
 HnAK/WOkN6apt4VP9y5JphF6M5e/wmYs1j7WxSPSehGVn/Q1HAhy6IPiMYF5Oa/STFAk=
X-Received: by 2002:a7b:ce89:0:b0:3a5:cefe:80f6 with SMTP id
 q9-20020a7bce89000000b003a5cefe80f6mr10005690wmj.113.1661466490370; 
 Thu, 25 Aug 2022 15:28:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4dAEfVt7GTMUq/DJFibx2SwTEwWVrGbqdTSJCaDrBdU7BX98Lu2QOWoNjWYtp5NLjteg+ozg==
X-Received: by 2002:a7b:ce89:0:b0:3a5:cefe:80f6 with SMTP id
 q9-20020a7bce89000000b003a5cefe80f6mr10005684wmj.113.1661466490075; 
 Thu, 25 Aug 2022 15:28:10 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a54d610e5fsm7030053wmb.26.2022.08.25.15.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 15/20] configure: unify creation of cross-compilation Makefiles
Date: Fri, 26 Aug 2022 00:27:40 +0200
Message-Id: <20220825222745.38779-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Let write_target_makefile handle both host and container cross compilers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 94 +++++++++++++++++++++++++------------------------------
 1 file changed, 43 insertions(+), 51 deletions(-)

diff --git a/configure b/configure
index 6dc6a5a48b..37ddd90bb1 100755
--- a/configure
+++ b/configure
@@ -2191,51 +2191,49 @@ probe_target_compiler() {
 
 write_target_makefile() {
   echo "EXTRA_CFLAGS=$target_cflags"
-  if test -n "$target_cc"; then
-    echo "CC=$target_cc"
-    echo "CCAS=$target_ccas"
-  fi
-  if test -n "$target_ar"; then
-    echo "AR=$target_ar"
-  fi
-  if test -n "$target_as"; then
-    echo "AS=$target_as"
-  fi
-  if test -n "$target_ld"; then
-    echo "LD=$target_ld"
-  fi
-  if test -n "$target_nm"; then
-    echo "NM=$target_nm"
-  fi
-  if test -n "$target_objcopy"; then
-    echo "OBJCOPY=$target_objcopy"
-  fi
-  if test -n "$target_ranlib"; then
-    echo "RANLIB=$target_ranlib"
-  fi
-  if test -n "$target_strip"; then
-    echo "STRIP=$target_strip"
+  if test -z "$target_cc" && test -z "$target_as"; then
+    test -z "$container_image" && error_exit "Internal error: could not find cross compiler for $1?"
+    echo "$1: docker-image-$container_image" >> Makefile.prereqs
+    if test -n "$container_cross_cc"; then
+      echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+      echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    fi
+    echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
+    echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+    echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+    echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+    echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+    echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+    echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
+  else
+    if test -n "$target_cc"; then
+      echo "CC=$target_cc"
+      echo "CCAS=$target_ccas"
+    fi
+    if test -n "$target_ar"; then
+      echo "AR=$target_ar"
+    fi
+    if test -n "$target_as"; then
+      echo "AS=$target_as"
+    fi
+    if test -n "$target_ld"; then
+      echo "LD=$target_ld"
+    fi
+    if test -n "$target_nm"; then
+      echo "NM=$target_nm"
+    fi
+    if test -n "$target_objcopy"; then
+      echo "OBJCOPY=$target_objcopy"
+    fi
+    if test -n "$target_ranlib"; then
+      echo "RANLIB=$target_ranlib"
+    fi
+    if test -n "$target_strip"; then
+      echo "STRIP=$target_strip"
+    fi
   fi
 }
 
-write_container_target_makefile() {
-  echo "$1: docker-image-$container_image" >> Makefile.prereqs
-  echo "EXTRA_CFLAGS=$target_cflags"
-  if test -n "$container_cross_cc"; then
-    echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
-    echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
-  fi
-  echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
-  echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
-  echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
-  echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
-  echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
-  echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
-  echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
-}
-
-
-
 ##########################################
 # check for vfio_user_server
 
@@ -2587,15 +2585,9 @@ for target in $target_list; do
       ;;
   esac
 
-  probe_target_compiler $target
-  if test $got_cross_cc = yes; then
-      write_target_makefile >> $config_target_mak
-  elif test -n "$container_image"; then
-      build_static=y
-      write_container_target_makefile build-tcg-tests-$target >> $config_target_mak
-      got_cross_cc=yes
-  fi
-  if test $got_cross_cc = yes; then
+  if probe_target_compiler $target || test -n "$container_image"; then
+      test -n "$container_image" && build_static=y
+      write_target_makefile build-tcg-tests-$target >> $config_target_mak
       mkdir -p tests/tcg/$target
       ln -sf $source_path/tests/tcg/Makefile.target tests/tcg/$target/Makefile
       ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
-- 
2.37.1



