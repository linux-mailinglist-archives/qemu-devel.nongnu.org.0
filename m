Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795CD476C45
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 09:56:15 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxmYg-00074b-GQ
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 03:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUV-0000fe-8f
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mxmUS-0004CN-6x
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 03:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639644711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=116wCfArOU87fwTJbit/Ib4jMlT4uME8m7V4T1JMkZI=;
 b=he1tt1w0OXpR1Q5CU8XSsF3M3DiOZTQ2QbeIBi7Qp2EKSsb15DFcKjPkiHmMuDpEsBIp9g
 7VXbXeP/zN0SbjudghkdGp0xn/Jsp2ZIwO6+ZgXhjwt2nFt2XZnTTcq39L1TA0tv59Nmw3
 DEtXUVaMu86nc1SxxMODBZQsLnPxM4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-LLJMRZCiMKuLw3Ixq5XCuQ-1; Thu, 16 Dec 2021 03:51:50 -0500
X-MC-Unique: LLJMRZCiMKuLw3Ixq5XCuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF20801AAB
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:49 +0000 (UTC)
Received: from avogadro.mxp.redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F9642BE77
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:51:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/10] configure, meson: move ARCH to meson.build
Date: Thu, 16 Dec 2021 09:51:38 +0100
Message-Id: <20211216085139.99682-10-pbonzini@redhat.com>
In-Reply-To: <20211216085139.99682-1-pbonzini@redhat.com>
References: <20211216085139.99682-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

$ARCH and the HOST_* symbols are only used by the QEMU build; configure
uses $cpu instead.  Remove it from config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 21 ++++-----------------
 meson.build | 26 +++++++++++++++++---------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/configure b/configure
index 741c33c7ad..2cecbd4c66 100755
--- a/configure
+++ b/configure
@@ -634,11 +634,9 @@ else
   cpu=$(uname -m)
 fi
 
-ARCH=
-# Normalise host CPU name, set ARCH and multilib cflags
+# Normalise host CPU name, set multilib cflags
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
-  aarch64|riscv) ;;
   armv*b|armv*l|arm)
     cpu="arm" ;;
 
@@ -667,8 +665,7 @@ case "$cpu" in
     CPU_CFLAGS="-m64 -mlittle" ;;
 
   s390)
-    CPU_CFLAGS="-m31"
-    ARCH=unknown ;;
+    CPU_CFLAGS="-m31" ;;
   s390x)
     CPU_CFLAGS="-m64" ;;
 
@@ -677,15 +674,7 @@ case "$cpu" in
     CPU_CFLAGS="-m32 -mv8plus -mcpu=ultrasparc" ;;
   sparc64)
     CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
-
-  *)
-    # This will result in either an error or falling back to TCI later
-    ARCH=unknown
-  ;;
 esac
-if test -z "$ARCH"; then
-  ARCH="$cpu"
-fi
 
 : ${make=${MAKE-make}}
 
@@ -3432,8 +3421,6 @@ echo "GIT=$git" >> $config_host_mak
 echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
 echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 
-echo "ARCH=$ARCH" >> $config_host_mak
-
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
@@ -3914,12 +3901,12 @@ if test "$skip_meson" = no; then
     cross_arg="--cross-file config-meson.cross"
     echo "[host_machine]" >> $cross
     echo "system = '$targetos'" >> $cross
-    case "$ARCH" in
+    case "$cpu" in
         i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
         *)
-            echo "cpu_family = '$ARCH'" >> $cross
+            echo "cpu_family = '$cpu'" >> $cross
             ;;
     esac
     echo "cpu = '$cpu'" >> $cross
diff --git a/meson.build b/meson.build
index 677ab1b57d..93f296e283 100644
--- a/meson.build
+++ b/meson.build
@@ -67,6 +67,14 @@ endif
 
 targetos = host_machine.system()
 
+if cpu not in supported_cpus
+  host_arch = 'unknown'
+elif cpu == 'x86'
+  host_arch = 'i386'
+else
+  host_arch = cpu
+endif
+
 if cpu in ['x86', 'x86_64']
   kvm_targets = ['i386-softmmu', 'x86_64-softmmu']
 elif cpu == 'aarch64'
@@ -335,9 +343,9 @@ if targetos == 'netbsd'
   endif
 endif
 
-tcg_arch = config_host['ARCH']
+tcg_arch = host_arch
 if not get_option('tcg').disabled()
-  if cpu not in supported_cpus
+  if host_arch == 'unknown'
     if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
     else
@@ -353,11 +361,11 @@ if not get_option('tcg').disabled()
   endif
   if get_option('tcg_interpreter')
     tcg_arch = 'tci'
-  elif config_host['ARCH'] == 'sparc64'
+  elif host_arch == 'sparc64'
     tcg_arch = 'sparc'
-  elif config_host['ARCH'] == 'x86_64'
+  elif host_arch == 'x86_64'
     tcg_arch = 'i386'
-  elif config_host['ARCH'] == 'ppc64'
+  elif host_arch == 'ppc64'
     tcg_arch = 'ppc'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
@@ -1422,6 +1430,8 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+config_host_data.set('HOST_' + host_arch.to_upper(), 1)
+
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
@@ -1770,8 +1780,6 @@ foreach k, v: config_host
       v = '"' + '", "'.join(v.split()) + '", '
     endif
     config_host_data.set(k, v)
-  elif k == 'ARCH'
-    config_host_data.set('HOST_' + v.to_upper(), 1)
   elif strings.contains(k)
     config_host_data.set_quoted(k, v)
   elif k.startswith('CONFIG_')
@@ -1914,7 +1922,7 @@ foreach target : target_dirs
   endif
 
   foreach k, v: disassemblers
-    if config_host['ARCH'].startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
+    if host_arch.startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
       foreach sym: v
         config_target += { sym: 'y' }
         config_all_disas += { sym: 'y' }
@@ -2883,7 +2891,7 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
+      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



