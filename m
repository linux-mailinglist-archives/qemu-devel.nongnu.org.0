Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D365A1CBF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:51:47 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLhS-0006gQ-L4
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKj-0002wG-PC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKi-0004gF-7g
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GD6gVGwT+P5RhtY3xGlHFrbigVj0Tyk29M0Qd4qf44s=;
 b=SVDPLMeCxl9ic7/svk5sonrb0OhVO+lcmyYuvDsBS9Fq31mi4mOl8Tc5vCsEZHHY87MPrn
 IgEvViqFcemW6JLzM7TtEH17E1QR/gIxpGzzed3XVg1oE+m5L4lsbZlLtf1AZB7YBwacvs
 zFLb/k2u3la0A0NEe4pQE3owEkHH72w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-cNqrelgMPCyC47FdOTSc1Q-1; Thu, 25 Aug 2022 18:28:13 -0400
X-MC-Unique: cNqrelgMPCyC47FdOTSc1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so11510016wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=GD6gVGwT+P5RhtY3xGlHFrbigVj0Tyk29M0Qd4qf44s=;
 b=HaGNx5qAqruiJ0v67rY1xG3hCYHLaYHJur8NV8BFnVNwQZG5moOET9hS3RY1oJKrBc
 UnYYcNt36R5bIcLLoJI+EhZEJgyoIhqF03GBUKYGBQetuIJkJekF+k6xLtsjOPY9G40f
 kDGkd6rqlStSH5I9RoohqlTZ02iuhUDQaJziCOaatn8fFerASJbWjNVmsrspcHrTjFbz
 doN4zdOE3+ASZTV/Hlrn2EpNFsfFt8KuZM+/HDhJTkgeGQvgSUCJHzeLJTFkUUY3AmHY
 vkXIoFb3X/Chd77M0irRCHjsZPQJHJpTkm3WdQzq5lwOYhUpVnBdT/BEOwQI/B0JNV/u
 mGEg==
X-Gm-Message-State: ACgBeo1udrwzv1NT17Fhk4CLJlp3KI0UAtrWJKK6xplVHcNPjO3NXnsk
 z/6xLUgkfiWTf+cUl5YhpcqFQ6ZGh4QZtz7DwMMrF3CKFme8Hy6X4JoN0uu1WuUx+hi0VymXsLQ
 HqOP3kUpk729Bh4U2CbfU5Eda1AGyrtF+1Zcud8h1nh7rNJEX4NS6+E0ETkvZcrQLAK4=
X-Received: by 2002:adf:d20b:0:b0:225:4ec9:8cac with SMTP id
 j11-20020adfd20b000000b002254ec98cacmr3285072wrh.92.1661466491556; 
 Thu, 25 Aug 2022 15:28:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56jJ9vyIqRHzfFJUGHosMx/db9Nh0YadRCX6lwjMSEV8UfNTJJUmcKt/VUL2aczb9YEW106A==
X-Received: by 2002:adf:d20b:0:b0:225:4ec9:8cac with SMTP id
 j11-20020adfd20b000000b002254ec98cacmr3285064wrh.92.1661466491315; 
 Thu, 25 Aug 2022 15:28:11 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q18-20020adff952000000b002207a0b93b4sm337833wrr.49.2022.08.25.15.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 16/20] configure: cleanup creation of tests/tcg target config
Date: Fri, 26 Aug 2022 00:27:41 +0200
Message-Id: <20220825222745.38779-17-pbonzini@redhat.com>
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

Remove the symlink to tests/tcg/config-*.mak, which is possible now
that unused target config files are not created anymore.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile    |  2 +-
 configure   | 12 +++++-------
 meson.build |  2 +-
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 6fd5b6ac06..adf24c0236 100644
--- a/Makefile
+++ b/Makefile
@@ -221,7 +221,7 @@ qemu-%.tar.bz2:
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
 	rm -f config-host.mak Makefile.prereqs qemu-bundle
-	rm -f tests/tcg/config-*.mak
+	rm -f tests/tcg/*/config-target.mak tests/tcg/config-host.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
 	rm -f qemu-plugins-ld.symbols qemu-plugins-ld64.symbols
diff --git a/configure b/configure
index 37ddd90bb1..97665ef619 100755
--- a/configure
+++ b/configure
@@ -2567,10 +2567,6 @@ tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
 
-  config_target_mak=tests/tcg/config-$target.mak
-
-  echo "# Automatically generated by configure - do not modify" > $config_target_mak
-  echo "TARGET_NAME=$arch" >> $config_target_mak
   case $target in
     xtensa*-linux-user)
       # the toolchain is not complete with headers, only build softmmu tests
@@ -2587,13 +2583,15 @@ for target in $target_list; do
 
   if probe_target_compiler $target || test -n "$container_image"; then
       test -n "$container_image" && build_static=y
-      write_target_makefile build-tcg-tests-$target >> $config_target_mak
       mkdir -p tests/tcg/$target
+      config_target_mak=tests/tcg/$target/config-target.mak
       ln -sf $source_path/tests/tcg/Makefile.target tests/tcg/$target/Makefile
-      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      echo "# Automatically generated by configure - do not modify" > $config_target_mak
+      echo "TARGET_NAME=$arch" >> $config_target_mak
       echo "TARGET=$target" >> $config_target_mak
-      echo "QEMU=$PWD/$qemu" >> $config_target_mak
+      write_target_makefile build-tcg-tests-$target >> $config_target_mak
       echo "BUILD_STATIC=$build_static" >> $config_target_mak
+      echo "QEMU=$PWD/$qemu" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
diff --git a/meson.build b/meson.build
index 8e927fc457..5cfb352d45 100644
--- a/meson.build
+++ b/meson.build
@@ -3812,7 +3812,7 @@ summary(summary_info, bool_yn: true, section: 'Compilation')
 summary_info = {}
 have_cross = false
 foreach target: target_dirs
-  tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
+  tcg_mak = meson.current_build_dir() / 'tests/tcg' / target / 'config-target.mak'
   if fs.exists(tcg_mak)
     config_cross_tcg = keyval.load(tcg_mak)
     if 'CC' in config_cross_tcg
-- 
2.37.1



