Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB755958E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:39:22 +0200 (CEST)
Received: from localhost ([::1]:58368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4eqV-00046Z-8c
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efP-00060q-DL
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efN-0005To-T0
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmKEKXz1WMCXAE3ifCH3/oBkIMjVzlAEXgVpEHl337o=;
 b=KG9nj5TTxEOw4ta5JgRwaSbz1y33CvbjCNnph6vOQm9uSQAy6CROIg3tGOML5C3Z4JkvnX
 qO+o96ojQ99Rw50nI6CYpSABzWRR8m9GOBWWy/5Olx8M9sffzglTei+STCvOpT+CFFnKhR
 ZuyqA+PHWUxMALorG7niZ73M+Iswr+k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-r4m-nkHQNqioxzL1aibp2w-1; Fri, 24 Jun 2022 04:27:47 -0400
X-MC-Unique: r4m-nkHQNqioxzL1aibp2w-1
Received: by mail-ed1-f70.google.com with SMTP id
 t14-20020a056402524e00b0043595a18b91so1355411edd.13
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OmKEKXz1WMCXAE3ifCH3/oBkIMjVzlAEXgVpEHl337o=;
 b=nTqONWrCNqgeQCTIucBfbdHl+74pw6EK7fAEg9UAYQ0Dl7Du+IAjeR91RITV0Ufk0M
 GloT+eCxS2847Vi5XJ4hLnXoXTzsxAFozNyIYpOLx2A42iSnXyLfLO/7s/degq1SrpW2
 GfxcSCzHAz9LEqG1NhGAxEJTPcjFCD5IoQzUiGZlfenHuFztjxhZupBA2uTiQh+8ye8l
 ZKY6oyyPVI5aGuWMCo9yPTysQ829K0P1hajaRnLqy4+QGeioOr7sdz8dW41TQT7pH0mY
 l2qcu48u1rRb94cCR55/vdTqczD665WSk7kiD8/zso84h1n2ma0vMLwY70PH8Hej5/2o
 c3gQ==
X-Gm-Message-State: AJIora++lp9Kvr2a2yUsAoWHqFIwIHUjSNkVYvyY+5g5sGGLvn6bqpNl
 5SW0OPIaLlrO38W+unnKc3jRYDI/az0/PsDgf+s56d1kAjN7+DRwRuNQnFC0dBY2/OVFSkppbvC
 g0F3gy0uIY+9oXEvbBfDEhpWk7GtXPjPQ6FHeMZbzidY6zQXbW0OX0oH/4+kCUT67jmM=
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr16000340edb.329.1656059266331; 
 Fri, 24 Jun 2022 01:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vY5zcPEkE/xkuFOMhMlCAeBxysK+ZoSWoswbeUwvHVrMlV9m856gRvWoRWfQtBtsOswIz2tQ==
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr16000322edb.329.1656059266073; 
 Fri, 24 Jun 2022 01:27:46 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a170906a38d00b006fed787478asm722921ejz.92.2022.06.24.01.27.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/14] configure: write EXTRA_CFLAGS for all sub-Makefiles
Date: Fri, 24 Jun 2022 10:27:23 +0200
Message-Id: <20220624082730.246924-8-pbonzini@redhat.com>
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



