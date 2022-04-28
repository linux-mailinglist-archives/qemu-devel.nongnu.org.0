Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0497512D00
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:36:45 +0200 (CEST)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njyhd-0005Tk-QL
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy2A-0000QA-1T
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:50 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy28-00056f-05
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:49 -0400
Received: by mail-ej1-x632.google.com with SMTP id m20so7574994ejj.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SdVDlq9h49jPx35cP21eV6RQsn8nPu5Pm6Lev407IOc=;
 b=MwbzbhyvWg5z8JylFj3faSmd/JHtdcPYlTLbHVb+86a24RZF2lZzwNee0mSkeu0n0V
 bvDPEdgoOnIB5X8ITXTvizReBXIxUwwTGNN0SWEwcZ8Iczo/CALEOCM0lXIPv8JqV9jI
 a26YmJhhBNEMukrpAz6AgOx1Sb4jXJbmnbJ6JYRzSkx0V6FquQMDK9/I394D6B2qxEw8
 U0O14ErfRZhM5dl+ntSE3CfE0l2tICBerJJ/0IAHWb34ZmDSdBhPqIOQ5L35D9ZSNYv9
 CtOg9qfe4xHoa834p8qHjqPcwK0b4ciCFMrJ+NjdgJLYdOfb8Qsa5Ye5xvbVJIDS+wDH
 VCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SdVDlq9h49jPx35cP21eV6RQsn8nPu5Pm6Lev407IOc=;
 b=0u/YYV3Jn2/I1PQySELGzv2e5Onxg6Rn+PasodQm/UiHRsZOX0FnadvjgTBYr6XYae
 pkw3TOs7xDe6dcFWLnX/RqWCRQubdjdfwP2znoqeZYtk85Xb+bw6CwMZUgCPo4LPr3bx
 J26F+wphdJLLi3dm2jkM9tHPzJtbbD9HNr+A4juS4hsYqNBZLNjf5eXxAR0BN4x3QU8E
 8U/9M9qw1G0vXlu64g/jW4hVB5rUp9XT4hxVahFqshgi2S0zQTFcHC/zMAyVvey1WgJy
 95ZNRQM9sjuovnS3ndsMqjBQvIPEwFCE3gBt5lhHcgnWhRIItVCFdrUJnmTUqmfSNJE/
 gH2A==
X-Gm-Message-State: AOAM532NpCCyQXdT5TeLJCspkvdlf/n+OHDh6FgcV6QASYwPYgiVKrTv
 jTr7Bdl8gFTp8KRUp/ui6kZcFw5uxsac1Q==
X-Google-Smtp-Source: ABdhPJz5OiqzusIhN9mOFPKq6EScduwvDNLFGhr5XgiR9q0QKoRQBN7iFF5wqXb5n8OOvKwd5zW5xg==
X-Received: by 2002:a17:906:9746:b0:6e0:5c9a:1a20 with SMTP id
 o6-20020a170906974600b006e05c9a1a20mr30894294ejy.714.1651128826428; 
 Wed, 27 Apr 2022 23:53:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] meson, configure: move RDMA options to meson
Date: Thu, 28 Apr 2022 08:53:29 +0200
Message-Id: <20220428065335.189795-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                      | 115 ---------------------------------
 contrib/rdmacm-mux/meson.build |   4 +-
 meson.build                    |  56 ++++++++++++++--
 meson_options.txt              |   4 ++
 migration/meson.build          |   2 +-
 scripts/meson-buildoptions.sh  |   6 ++
 6 files changed, 62 insertions(+), 125 deletions(-)

diff --git a/configure b/configure
index 1aefbc2f68..4deca94235 100755
--- a/configure
+++ b/configure
@@ -301,8 +301,6 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
-rdma="$default_feature"
-pvrdma="$default_feature"
 debug_info="yes"
 debug_tcg="no"
 debug="no"
@@ -972,14 +970,6 @@ for opt do
   ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
-  --enable-rdma) rdma="yes"
-  ;;
-  --disable-rdma) rdma="no"
-  ;;
-  --enable-pvrdma) pvrdma="yes"
-  ;;
-  --disable-pvrdma) pvrdma="no"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1244,8 +1234,6 @@ cat << EOF
   lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  rdma            Enable RDMA-based migration
-  pvrdma          Enable PVRDMA support
   vhost-net       vhost-net kernel acceleration support
   vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
@@ -2037,100 +2025,6 @@ EOF
   fi
 fi
 
-##########################################
-# RDMA needs OpenFabrics libraries
-if test "$rdma" != "no" ; then
-  cat > $TMPC <<EOF
-#include <rdma/rdma_cma.h>
-int main(void) { return 0; }
-EOF
-  rdma_libs="-lrdmacm -libverbs -libumad"
-  if compile_prog "" "$rdma_libs" ; then
-    rdma="yes"
-  else
-    if test "$rdma" = "yes" ; then
-        error_exit \
-            " OpenFabrics librdmacm/libibverbs/libibumad not present." \
-            " Your options:" \
-            "  (1) Fast: Install infiniband packages (devel) from your distro." \
-            "  (2) Cleanest: Install libraries from www.openfabrics.org" \
-            "  (3) Also: Install softiwarp if you don't have RDMA hardware"
-    fi
-    rdma="no"
-  fi
-fi
-
-##########################################
-# PVRDMA detection
-
-cat > $TMPC <<EOF &&
-#include <sys/mman.h>
-
-int
-main(void)
-{
-    char buf = 0;
-    void *addr = &buf;
-    addr = mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
-
-    return 0;
-}
-EOF
-
-if test "$rdma" = "yes" ; then
-    case "$pvrdma" in
-    "")
-        if compile_prog "" ""; then
-            pvrdma="yes"
-        else
-            pvrdma="no"
-        fi
-        ;;
-    "yes")
-        if ! compile_prog "" ""; then
-            error_exit "PVRDMA is not supported since mremap is not implemented"
-        fi
-        pvrdma="yes"
-        ;;
-    "no")
-        pvrdma="no"
-        ;;
-    esac
-else
-    if test "$pvrdma" = "yes" ; then
-        error_exit "PVRDMA requires rdma suppport"
-    fi
-    pvrdma="no"
-fi
-
-# Let's see if enhanced reg_mr is supported
-if test "$pvrdma" = "yes" ; then
-
-cat > $TMPC <<EOF &&
-#include <infiniband/verbs.h>
-
-int
-main(void)
-{
-    struct ibv_mr *mr;
-    struct ibv_pd *pd = NULL;
-    size_t length = 10;
-    uint64_t iova = 0;
-    int access = 0;
-    void *addr = NULL;
-
-    mr = ibv_reg_mr_iova(pd, addr, length, iova, access);
-
-    ibv_dereg_mr(mr);
-
-    return 0;
-}
-EOF
-    if ! compile_prog "" "-libverbs"; then
-        QEMU_CFLAGS="$QEMU_CFLAGS -DLEGACY_RDMA_REG_MR"
-    fi
-fi
-
 ##########################################
 # glib support probe
 
@@ -2855,15 +2749,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
-if test "$rdma" = "yes" ; then
-  echo "CONFIG_RDMA=y" >> $config_host_mak
-  echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
-fi
-
-if test "$pvrdma" = "yes" ; then
-  echo "CONFIG_PVRDMA=y" >> $config_host_mak
-fi
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/contrib/rdmacm-mux/meson.build b/contrib/rdmacm-mux/meson.build
index 7674f54cc5..36c9c89630 100644
--- a/contrib/rdmacm-mux/meson.build
+++ b/contrib/rdmacm-mux/meson.build
@@ -1,7 +1,5 @@
-if 'CONFIG_PVRDMA' in config_host
-  # if not found, CONFIG_PVRDMA should not be set
+if have_pvrdma
   # FIXME: broken on big endian architectures
-  libumad = cc.find_library('ibumad', required: true)
   executable('rdmacm-mux', files('main.c'), genh,
              dependencies: [glib, libumad],
              build_by_default: false,
diff --git a/meson.build b/meson.build
index 83b7347c5f..9c03436756 100644
--- a/meson.build
+++ b/meson.build
@@ -1219,9 +1219,22 @@ if numa.found() and not cc.links('''
 endif
 
 rdma = not_found
-if 'CONFIG_RDMA' in config_host
-  rdma = declare_dependency(link_args: config_host['RDMA_LIBS'].split())
+if not get_option('rdma').auto() or have_system
+  libumad = cc.find_library('ibumad', required: get_option('rdma'))
+  rdma_libs = [cc.find_library('rdmacm', has_headers: ['rdma/rdma_cma.h'],
+                               required: get_option('rdma'),
+                               kwargs: static_kwargs),
+               cc.find_library('ibverbs', required: get_option('rdma'),
+                               kwargs: static_kwargs),
+               libumad]
+  rdma = declare_dependency(dependencies: rdma_libs)
+  foreach lib: rdma_libs
+    if not lib.found()
+      rdma = not_found
+    endif
+  endforeach
 endif
+
 xen = not_found
 if 'CONFIG_XEN_BACKEND' in config_host
   xen = declare_dependency(compile_args: config_host['XEN_CFLAGS'].split(),
@@ -1554,6 +1567,7 @@ config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
+config_host_data.set('CONFIG_RDMA', rdma.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
@@ -1652,7 +1666,7 @@ config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
-                                       args: config_host['RDMA_LIBS'].split(),
+                                       dependencies: rdma,
                                        prefix: '#include <infiniband/verbs.h>'))
 endif
 
@@ -1972,6 +1986,36 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512F not available').allowed())
 
+have_pvrdma = get_option('pvrdma') \
+  .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
+  .require(cc.compiles('''
+    int main(void)
+    {
+      char buf = 0;
+      void *addr = &buf;
+      addr = mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
+
+      return 0;
+    }'''), error_message: 'PVRDMA requires mremap').allowed()
+
+if have_pvrdma
+  config_host_data.set('LEGACY_RDMA_REG_MR', not cc.compiles('''
+    #include <infiniband/verbs.h>
+    int main(void)
+    {
+      struct ibv_mr *mr;
+      struct ibv_pd *pd = NULL;
+      size_t length = 10;
+      uint64_t iova = 0;
+      int access = 0;
+      void *addr = NULL;
+
+      mr = ibv_reg_mr_iova(pd, addr, length, iova, access);
+      ibv_dereg_mr(mr);
+      return 0;
+    }'''))
+endif
+
 if get_option('membarrier').disabled()
   have_membarrier = false
 elif targetos == 'windows'
@@ -2106,7 +2150,7 @@ host_kconfig = \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
-  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
+  (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
@@ -3700,8 +3744,8 @@ summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
-summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
-summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
+summary_info += {'RDMA support':      rdma}
+summary_info += {'PVRDMA support':    have_pvrdma}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng}
 summary_info += {'bpf support':       libbpf}
diff --git a/meson_options.txt b/meson_options.txt
index dbcf9722bb..3bdf409497 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -151,6 +151,10 @@ option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('opengl', type : 'feature', value : 'auto',
        description: 'OpenGL support')
+option('rdma', type : 'feature', value : 'auto',
+       description: 'Enable RDMA-based migration')
+option('pvrdma', type : 'feature', value : 'auto',
+       description: 'Enable PVRDMA support')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
diff --git a/migration/meson.build b/migration/meson.build
index 8b5ca5c047..6880b61b10 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -27,7 +27,7 @@ softmmu_ss.add(files(
   'tls.c',
 ), gnutls)
 
-softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
+softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
 if get_option('live_block_migration').allowed()
   softmmu_ss.add(files('block.c'))
 endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 203f33ae18..838aa38df9 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -96,10 +96,12 @@ meson_options_help() {
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
   printf "%s\n" '  png             PNG support with libpng'
+  printf "%s\n" '  pvrdma          Enable PVRDMA support'
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  qga-vss         build QGA VSS support (broken with MinGW)'
   printf "%s\n" '  rbd             Ceph block device driver'
+  printf "%s\n" '  rdma            Enable RDMA-based migration'
   printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
@@ -284,6 +286,8 @@ _meson_option_parse() {
     --disable-png) printf "%s" -Dpng=disabled ;;
     --enable-profiler) printf "%s" -Dprofiler=true ;;
     --disable-profiler) printf "%s" -Dprofiler=false ;;
+    --enable-pvrdma) printf "%s" -Dpvrdma=enabled ;;
+    --disable-pvrdma) printf "%s" -Dpvrdma=disabled ;;
     --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
@@ -294,6 +298,8 @@ _meson_option_parse() {
     --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=false ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
     --disable-rbd) printf "%s" -Drbd=disabled ;;
+    --enable-rdma) printf "%s" -Drdma=enabled ;;
+    --disable-rdma) printf "%s" -Drdma=disabled ;;
     --enable-replication) printf "%s" -Dreplication=enabled ;;
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
-- 
2.35.1



