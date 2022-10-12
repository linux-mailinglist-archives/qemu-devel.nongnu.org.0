Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241795FC2DF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:16:28 +0200 (CEST)
Received: from localhost ([::1]:42474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXqk-0005Iq-Lj
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXjc-0007yG-GH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:09:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXja-0001BL-Hk
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Gh3XCcQHzmUA7MDKcGTL3N2YdYzPT8tFs26LfkjLzs=;
 b=iOUrQZDY1Srw8hV+mAnoIp6mU0D+y2mWCyfUoQnkQnknPgvatY4tS+yWeTa+jrL/gYyLeb
 kwa1nyYGMonjhJTBkzP3ChL7AKCGxuYQdqsdqk2FTUIja2oj4BQxQxRh2mWtdnbf7Wf+ig
 H4mrG7cg5Lo1t0DWitEvaFB9LQBj8Hs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-9vcBASpsMaKrEXQao4Tk-g-1; Wed, 12 Oct 2022 05:09:00 -0400
X-MC-Unique: 9vcBASpsMaKrEXQao4Tk-g-1
Received: by mail-ej1-f69.google.com with SMTP id
 xc12-20020a170907074c00b007416699ea14so7031050ejb.19
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 02:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Gh3XCcQHzmUA7MDKcGTL3N2YdYzPT8tFs26LfkjLzs=;
 b=Ljz3RczT1KcGkbGVQKPZOw03biUffYkDM5rYYl2+CDBJ8keZ+LQk1ySsPshxb6CGX/
 4qOpWqCAzXA9V9xPwsTCGztKaQ8S+Bowktn8Z0mXmChAYER165kKA00vHjTlwFYVJXmO
 n1vFTX7fIjGKWSf4NNKJQ/5niG9ZQCjNnxZvgy7CzloAeBo+lNJeaa22yio97YzGQcBg
 60EZokIv/F8OYuRRGW+WRg7hGq/ObeYqGCQL57pw1D4Exda5JY9jtGrX3kHsxZVu5t7r
 Z2PQRRyjZhXzjTphx5texVJQCIIkVV0oEmauMsAJYDn8tLPAReZFo+0WiRDDEx/YQGvE
 CdGA==
X-Gm-Message-State: ACrzQf2CS+59wqlcPO/fZ0w/YpklTp0FHoOZyxsVhZtcrkNOvoku8ZCb
 3xsyXj3LIfyWImecpC3CjL5MntD+nV8iC0QB+JCmQd6Bx+cukrUmCme+foHefPvH6vhMxThUz6p
 /klyMtjgZIVrs/8VrkMHEMu6CuEvF8hF7tGw4vairNw+RnoFyECGRxct7UbKzW5otrA0=
X-Received: by 2002:a05:6402:3496:b0:459:9cb5:78e5 with SMTP id
 v22-20020a056402349600b004599cb578e5mr26922679edc.236.1665565738860; 
 Wed, 12 Oct 2022 02:08:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lf92sFKJpuBT2LhICCRHr1osYga2L6xt5nhlIjr6mt15E3bfPMJJeqi3DAaeYxPip5AbF2w==
X-Received: by 2002:a05:6402:3496:b0:459:9cb5:78e5 with SMTP id
 v22-20020a056402349600b004599cb578e5mr26922658edc.236.1665565738501; 
 Wed, 12 Oct 2022 02:08:58 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709064a8600b00787a6adab7csm900786eju.147.2022.10.12.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 02:08:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] build: disable container-based cross compilers by default
Date: Wed, 12 Oct 2022 11:08:55 +0200
Message-Id: <20221012090855.359847-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Container-based cross compilers have some issues which were overlooked
when they were only used for TCG tests, but are more visible since
firmware builds try to use them:

- Downloading and building containers as part of make adds a
  very long task to the build, unless you are on a fast network.
  Container images can be hundreds of MBs.

- Verbose progress information from the container builds
  is printed on stderr and messes up other output from
  make/ninja

- There seem to be some rough edges around failure too.

So, make container builds opt-in.

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest.yml                       | 16 ++++++++--------
 .gitlab-ci.d/crossbuilds.yml                     |  2 +-
 .../custom-runners/ubuntu-20.04-s390x.yml        |  2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml      |  2 +-
 configure                                        |  4 ++--
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 6c05c46397..41742ae962 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -263,7 +263,7 @@ build-user:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system
+    CONFIGURE_ARGS: --disable-tools --disable-system --enable-containers
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-static:
@@ -272,7 +272,7 @@ build-user-static:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --static
+    CONFIGURE_ARGS: --disable-tools --disable-system --static --enable-containers
     MAKE_CHECK_ARGS: check-tcg
 
 # Because the hexagon cross-compiler takes so long to build we don't rely
@@ -286,7 +286,7 @@ build-user-hexagon:
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
-    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg --enable-containers
     MAKE_CHECK_ARGS: check-tcg
 
 # Only build the softmmu targets we have check-tcg tests for
@@ -296,7 +296,7 @@ build-some-softmmu:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --enable-debug
+    CONFIGURE_ARGS: --disable-tools --enable-debug --enable-containers
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
@@ -307,7 +307,7 @@ build-tricore-softmmu:
     job: tricore-debian-cross-container
   variables:
     IMAGE: debian-tricore-cross
-    CONFIGURE_ARGS: --disable-tools --disable-fdt --enable-debug
+    CONFIGURE_ARGS: --disable-tools --disable-fdt --enable-debug --enable-containers
     TARGETS: tricore-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
@@ -317,7 +317,7 @@ clang-system:
     job: amd64-fedora-container
   variables:
     IMAGE: fedora
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++
+    CONFIGURE_ARGS: --enable-containers --cc=clang --cxx=clang++
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
       ppc-softmmu s390x-softmmu
@@ -329,7 +329,7 @@ clang-user:
     job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+    CONFIGURE_ARGS: --enable-containers --cc=clang --cxx=clang++ --disable-system
       --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
       --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check-unit check-tcg
@@ -523,7 +523,7 @@ build-tci:
     - TARGETS="aarch64 alpha arm hppa m68k microblaze ppc64 s390x x86_64"
     - mkdir build
     - cd build
-    - ../configure --enable-tcg-interpreter
+    - ../configure --enable-containers --enable-tcg-interpreter
         --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index c4cd96433d..b2519ff2e0 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -67,7 +67,7 @@ cross-i386-tci:
   variables:
     IMAGE: fedora-i386-cross
     ACCEL: tcg-interpreter
-    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
+    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user --enable-containers
     MAKE_CHECK_ARGS: check check-tcg
 
 cross-mipsel-system:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 0c835939db..24bca3f995 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -16,7 +16,7 @@ ubuntu-20.04-s390x-all-linux-static:
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
  - mkdir build
  - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --enable-containers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index ce0b18af6f..db0c919fab 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -16,7 +16,7 @@ ubuntu-22.04-aarch64-all-linux-static:
  - cd build
  # Disable -static-pie due to build error with system libc:
  # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
- - ../configure --enable-debug --static --disable-system --disable-pie
+ - ../configure --enable-debug --static --disable-system --disable-pie --enable-containers
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
diff --git a/configure b/configure
index baa69189f0..6fa158a0d4 100755
--- a/configure
+++ b/configure
@@ -227,7 +227,7 @@ cross_prefix=""
 host_cc="cc"
 stack_protector=""
 safe_stack=""
-use_containers="yes"
+use_containers="no"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 
 if test -e "$source_path/.git"
@@ -1034,7 +1034,7 @@ Advanced options (experts only):
                            ucontext, sigaltstack, windows
   --enable-plugins
                            enable plugins via shared library loading
-  --disable-containers     don't use containers for cross-building
+  --enable-containers      use containers for cross-building
   --gdb=GDB-path           gdb to use for gdbstub tests [$gdb_bin]
 EOF
   meson_options_help
-- 
2.37.3


