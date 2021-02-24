Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF2323BD9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:24:13 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtDA-0008MR-7v
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEtCC-0007uf-9R
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:23:12 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lEtCA-0008R8-6q
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:23:11 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so2690304ejf.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 04:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3p5Hf65tX062J2B2QKClY490eTOYjzdcfVhu8SEuifA=;
 b=ouYChA2rGzYWfkq0/dCxdI/ok/jYxtnaQWLt/B2jtukfjeMAQVDS9kxi+rRr0FMz0q
 Uk8UqAAVu+ccYAZ3jBMjQUqR2VzAI0TTaZk+84OaY+Yfv+3SReRsjzBVqS9HCM6v7viF
 Vj4s2rSElUhpi5+Ix6RN+wMxFfuxo5AGBSuyHxPW7C3SvBUKzYwcfOy3tZ6faKaxiaQM
 4WwC6JETe29tDTrTYWqPVw4uxrSsVeHHSxDao8VywJZu1mVuqU804KCc4GdahGSuvyQl
 q4CVypWuNIZ1bcUlKYocRi6av5GFA1nuhq3l0+5LbtWNqurzoyfIH1NTbVic7tbrgjHP
 auCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=3p5Hf65tX062J2B2QKClY490eTOYjzdcfVhu8SEuifA=;
 b=qvLiYtaL15sXZoGTsLFQcqBboP38TPvZkX30wTM/0R6VX27DML2JiE0CXh9TqrZh+I
 LBXSuwEHizJafqwonUQcbf11SSdSc6bkuzlEq/qrT5uWAkMEpfTgHi/dYYkRBJmHYz6y
 28/FbG35pdBT4E4pM6h3I8nsuSg8cF3JbSJ2eOSnJI4KGxo2aKwYHElxm1R1dA4V3D0N
 i7xqzhQ7fwQfRn7BZq+7Al3poXkz+PUO4jwY0sWarDr9bSsyUiz/qGqjje1mAoQvPj5q
 3F57tOo9jl9stvuuGzuCbfIy8DegYPPMsr2oIVMfwESUnzqF8wIEB267bynARx7GRpIi
 k4hg==
X-Gm-Message-State: AOAM532HHl9g7GoGMuZFrkptN4XU/vzuzx0hNrF0AhhB9oNyEFubWRvq
 qMVI2MBYFyPme3yx4QcLf8tlgYNmbao=
X-Google-Smtp-Source: ABdhPJwG6UmWXF2zUxTV/SvjEIdLz/l7E7gWbQ9fzEvxEQ1cX8+YEPKuLE6Jv5N6+9Mq8nkpGrcq2w==
X-Received: by 2002:a17:906:cf84:: with SMTP id
 um4mr30944906ejb.61.1614169387713; 
 Wed, 24 Feb 2021 04:23:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rn18sm1221096ejb.99.2021.02.24.04.23.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:23:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] multiprocess: move feature to meson_options.txt
Date: Wed, 24 Feb 2021 13:23:06 +0100
Message-Id: <20210224122306.451764-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 12 ++++--------
 meson.build       |  9 +++++++--
 meson_options.txt |  2 ++
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/configure b/configure
index 19f2b88589..bdc96d0831 100755
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
index 05a67c20d9..cb9420a99e 100644
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
 
@@ -2535,6 +2540,7 @@ endif
 summary_info += {'target list':       ' '.join(target_dirs)}
 if have_system
   summary_info += {'default devices':   get_option('default_devices')}
+  summary_info += {'Multiprocess QEMU': multiprocess_allowed}
 endif
 summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
@@ -2655,7 +2661,6 @@ summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
-summary_info += {'Multiprocess QEMU': config_host.has_key('CONFIG_MULTIPROCESS_ALLOWED')}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
 if not supported_cpus.contains(cpu)
diff --git a/meson_options.txt b/meson_options.txt
index 675a9c500a..bf11de7bb2 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -45,6 +45,8 @@ option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
+option('multiprocess', type: 'feature', value: 'auto',
+       description: 'Multiprocess QEMU support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
-- 
2.29.2


