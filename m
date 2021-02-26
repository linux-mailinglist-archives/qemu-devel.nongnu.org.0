Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC49B325EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:12:43 +0100 (CET)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYEs-0007VQ-Kx
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7y-0001j7-Ng
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:35 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7v-00043O-Lo
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so7679308wrz.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zf6sj2dDUp/4RFddGmN+eDdQt1nkcibDS28wiVKpr60=;
 b=ngcKks9oldaZKqxw82Jy8UQJwGR58tgut4jYvoXmG07kgVp61yTSEoZrBwNU1N4QJ+
 1EXJwtH9qd4YS0/J/jj+T/GHRpNxmH0WR9s/ecPZULKSYxZh0sXQwBDKlRNjnIUKDLRZ
 M98K2eJQpNiSUgbcVSTLadXUrw7ayh37vn3BVKHu5I/23kfKbLD0qgutnEBVs2kMeh5s
 OVVINlUnOcJ8Kh2CFsv66EUHAJ5MHNCacRe7mkHFeXJsABy9DAmdDpJNSBBenwGiVGQR
 mnFt2WU2iKPyAVHjtaGViiCgznAgSV5CCRdcjYAWmdZ5/WAm4zaEpVH9faun7dDyb/4I
 57xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Zf6sj2dDUp/4RFddGmN+eDdQt1nkcibDS28wiVKpr60=;
 b=UFz2H56LeUgNDEu6ZJbkvG+J2sRVQH7CY8lb+S7/F04/xq+28eqJDHvLobbOaEOiFQ
 FSxa/u/LttnMSBItH5mfXHSFVGJ2RcPVJGtob2rE4jLJ1MJnABbW4o3QmzMmfhq+clDG
 H044WV/xfJ2R2JDUwqkgRkkGj1nOE3jf2MJ39nTqZYeJ7gdrEIL//tIC5F0SsDDmz6EU
 q0c20xDJF3FO2sB6vTrkM+B2kM4OGh5Ao7cYedGcK/keKZipHPb8VdP3q9K+Juif0jjZ
 qLF1RiITLvPC7yiJFdEHOSzEVof8KPrXxkg467jYIVgVn+5fvjGkNJIg0rY0aSFhGH3P
 q6qQ==
X-Gm-Message-State: AOAM532WVBRJfa++fNpEB906DxodYgA0HbnAAa3UClhoSVj4MzJLHFyr
 4MtzUqXwh/oCtO36Tqb6eaYeXi9MMvU=
X-Google-Smtp-Source: ABdhPJygowwDNW1sDhuiFXZ3xD1f3Vx+Mv4wgtQLC4xmbws+kdDnmTlMj2Hbqla/dSE/jHoqUHrCiA==
X-Received: by 2002:a5d:452e:: with SMTP id j14mr1983087wra.244.1614326729880; 
 Fri, 26 Feb 2021 00:05:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] multiprocess: move feature to meson_options.txt
Date: Fri, 26 Feb 2021 09:05:00 +0100
Message-Id: <20210226080526.651705-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While at it, improve the description of the feature in the summary and
help message.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 14 +++++---------
 meson.build       |  9 +++++++--
 meson_options.txt |  2 ++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 19f2b88589..cc435e2503 100755
--- a/configure
+++ b/configure
@@ -463,7 +463,7 @@ skip_meson=no
 gettext="auto"
 fuse="auto"
 fuse_lseek="auto"
-multiprocess="no"
+multiprocess="auto"
 
 malloc_trim="auto"
 
@@ -798,7 +798,6 @@ Linux)
   linux="yes"
   linux_user="yes"
   vhost_user=${default_feature:-yes}
-  multiprocess=${default_feature:-yes}
 ;;
 esac
 
@@ -1558,9 +1557,9 @@ for opt do
   ;;
   --disable-fuse-lseek) fuse_lseek="disabled"
   ;;
-  --enable-multiprocess) multiprocess="yes"
+  --enable-multiprocess) multiprocess="enabled"
   ;;
-  --disable-multiprocess) multiprocess="no"
+  --disable-multiprocess) multiprocess="disabled"
   ;;
   *)
       echo "ERROR: unknown option $opt"
@@ -1914,7 +1913,7 @@ disabled with --disable-FEATURE, default is enabled if available
   libdaxctl       libdaxctl support
   fuse            FUSE block device export
   fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
-  multiprocess    Multiprocess QEMU support
+  multiprocess    Out of process device emulation support
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6089,9 +6088,6 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
-if test "$multiprocess" = "yes" ; then
-  echo "CONFIG_MULTIPROCESS_ALLOWED=y" >> $config_host_mak
-fi
 if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
@@ -6434,7 +6430,7 @@ NINJA=$ninja $meson setup \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
-        -Dvhost_user_blk_server=$vhost_user_blk_server \
+        -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
         $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
diff --git a/meson.build b/meson.build
index c79cb20993..d38620d3be 100644
--- a/meson.build
+++ b/meson.build
@@ -157,6 +157,11 @@ if targetos != 'linux' and get_option('mpath').enabled()
   error('Multipath is supported only on Linux')
 endif
 
+if targetos != 'linux' and get_option('multiprocess').enabled()
+  error('Multiprocess QEMU is supported only on Linux')
+endif
+multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
+
 m = cc.find_library('m', required: false)
 util = cc.find_library('util', required: false)
 winmm = []
@@ -1228,7 +1233,7 @@ host_kconfig = \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
-  ('CONFIG_MULTIPROCESS_ALLOWED' in config_host ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
+  (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -2538,6 +2543,7 @@ endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
+  summary_info += {'out of process emulation': multiprocess_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
@@ -2658,7 +2664,6 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
-summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/meson_options.txt b/meson_options.txt
index 675a9c500a..9734019995 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -45,6 +45,8 @@ option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
+option('multiprocess', type: 'feature', value: 'auto',
+       description: 'Out of process device emulation support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
-- 
2.29.2



