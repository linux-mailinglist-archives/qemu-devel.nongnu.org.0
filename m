Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D73269D2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 23:12:57 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFlLz-000738-H6
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 17:12:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <romain.naour@gmail.com>)
 id 1lFlGh-0005mC-B9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:07:27 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <romain.naour@gmail.com>)
 id 1lFlGd-0006TL-Aq
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:07:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g11so4758602wmh.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSjei1Z4CnYMxLbGtUVguWxO51GB6RDR+5oRb0bQMQo=;
 b=TY8N4TqHnrsjjRdz+Pmq3nsd9R1QbZ/Ql0UvV8JB6x+pd6YG+GC2qvr9AykELezqzs
 081myEAuD4xBvPUx/rf9SLS+tSYF9HanIVhsGu9qoTGKsgj0F21KMKeuQqtn92znlzqX
 1ZsU17AgVxNnD+kO3CO2HbbodlPyx6XzD22kezyItOS+8iAYNY3kHmpZGW2HLnA488K4
 zORYDawh09oYQM2ScXo0x61Mst5Ql9NSUZv/j9CN+nfY051Wp/hZn0h+mI3ad3v/pE0y
 HwKTb+NcUUmGjAw6Cwyu99er8bT7OywHtusPMb+kCTQrdRIWRUc4If49T35gN6q31Gzl
 UNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSjei1Z4CnYMxLbGtUVguWxO51GB6RDR+5oRb0bQMQo=;
 b=K9+QRZPUAuaXVvG2oXK/PiLGc5znOok0QSHZB4sNQDT2xLAbpWv5jMp6E2pEtAoJ56
 Y+VEsnEcAwf3GnVqcytrlhZjUJykICO/0ysjZb0FsM2pJ8UlUZVPn/GK8hvda4OwGtkS
 l3BmMiGeLUv/Bz0wZVOn0FkkGvSA54+2SpUJlx1v2Pos0nikHItmcTaaCI5iiGZcpDuL
 jw0zNmaIpWYUEU+76ifuk99AEyNstEcWemEAI+ZnOa3EOYcJ37XNPRFNULxsax2bqUuz
 KFQmkITurm9TEiW8p9tdmsLACzcLlPC4RJV3oX2oekyG4TFVTK4os7CpRGVcs4YeRYQE
 hluA==
X-Gm-Message-State: AOAM532/Qopha+33JZk7k0cDpifBCzgaT8jNEgzQ+WjiG9RxVrIu4Gtc
 HUOVr4k+p/YsRwShodEmU8CtbKhlmHI=
X-Google-Smtp-Source: ABdhPJwXVXottlKqG4jIL1oaZqn/SUgMMgr0wOOhaFyUPGfs2BG7nDBsB4IyZezpugX+vzHpDd86Ng==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr4663505wmj.99.1614377240871;
 Fri, 26 Feb 2021 14:07:20 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id k4sm19021082wrd.9.2021.02.26.14.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 14:07:20 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: add tests option
Date: Fri, 26 Feb 2021 23:07:15 +0100
Message-Id: <20210226220715.3103110-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=romain.naour@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Feb 2021 17:11:52 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/fp/fp-bench.c use fenv.h that is not always provided
by the libc (uClibc).

To workaround this issue, add an new meson option to
disable tests while building Qemu.

Fixes:
http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configure         | 7 +++++++
 meson.build       | 6 +++++-
 meson_options.txt | 3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index a79b3746d4..cd114f4b9e 100755
--- a/configure
+++ b/configure
@@ -464,6 +464,7 @@ gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
 multiprocess="no"
+tests="auto"
 
 malloc_trim="auto"
 
@@ -1562,6 +1563,10 @@ for opt do
   ;;
   --disable-multiprocess) multiprocess="no"
   ;;
+  --disable-tests) tests="disabled"
+  ;;
+  --enable-tests) tests="enabled"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1915,6 +1920,7 @@ disabled with --disable-FEATURE, default is enabled if available
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
   multiprocess    Multiprocess QEMU support
+  tests           build tests
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6428,6 +6434,7 @@ NINJA=$ninja $meson setup \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
+        -Dtests=$tests \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index 05a67c20d9..2d7cbc0fbd 100644
--- a/meson.build
+++ b/meson.build
@@ -2341,7 +2341,11 @@ subdir('scripts')
 subdir('tools')
 subdir('pc-bios')
 subdir('docs')
-subdir('tests')
+
+if get_option('tests').enabled()
+  subdir('tests')
+endif
+
 if gtk.found()
   subdir('po')
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 675a9c500a..be30ad5450 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -114,6 +114,9 @@ option('virtfs', type: 'feature', value: 'auto',
 option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
 
+option('tests', type : 'feature', value : 'auto',
+       description: 'Tests build support')
+
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the capstone library')
-- 
2.29.2


