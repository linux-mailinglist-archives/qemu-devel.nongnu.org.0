Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F0248772
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:27:10 +0200 (CEST)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82Zx-0006ar-D7
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82KD-0003ES-2H
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37132
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82K8-0007KR-Tt
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OiVJ5QAT6DF0R214TJgTSCDom3tcLTTEi+OwOWX+S4Q=;
 b=DT0oM31AA4KkhtWMuytjNa4TeiBgYxmQfWg6yLS+hADfAZ5ehczJ+K9MNcS3HjkMaunccM
 +BrTtZvYcSJkNwuzsvqGpbYnVrSbTnu3RzoqKGHR8C015nFoqP3NTJIVs5f4QPBow6H9e4
 DCqtq2RFBGinFxkwUXmYvTsL9HgCnho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-aLxmMs6lNJuj09JyZ2Llbw-1; Tue, 18 Aug 2020 10:10:44 -0400
X-MC-Unique: aLxmMs6lNJuj09JyZ2Llbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47BC100CA9E
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:10:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84FF35D9E2
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:10:43 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 020/150] meson: move summary to meson.build
Date: Tue, 18 Aug 2020 10:08:15 -0400
Message-Id: <20200818141025.21608-21-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 08:01:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 configure   | 237 --------------------------------------------------
 meson.build | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 243 insertions(+), 237 deletions(-)

diff --git a/configure b/configure
index d936f22d02..4ed8c9b673 100755
--- a/configure
+++ b/configure
@@ -527,8 +527,6 @@ secret_keyring=""
 libdaxctl=""
 meson=""
 
-supported_cpu="no"
-supported_os="no"
 bogus_os="no"
 malloc_trim=""
 
@@ -767,35 +765,27 @@ ARCH=
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
   ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
-    supported_cpu="yes"
   ;;
   ppc64le)
     ARCH="ppc64"
-    supported_cpu="yes"
   ;;
   i386|i486|i586|i686|i86pc|BePC)
     cpu="i386"
-    supported_cpu="yes"
   ;;
   x86_64|amd64)
     cpu="x86_64"
-    supported_cpu="yes"
   ;;
   armv*b|armv*l|arm)
     cpu="arm"
-    supported_cpu="yes"
   ;;
   aarch64)
     cpu="aarch64"
-    supported_cpu="yes"
   ;;
   mips*)
     cpu="mips"
-    supported_cpu="yes"
   ;;
   sparc|sun4[cdmuv])
     cpu="sparc"
-    supported_cpu="yes"
   ;;
   *)
     # This will result in either an error or falling back to TCI later
@@ -823,7 +813,6 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
-  pie="no"
 ;;
 GNU/kFreeBSD)
   bsd="yes"
@@ -841,7 +830,6 @@ FreeBSD)
   libs_qga="-lutil $libs_qga"
   netmap=""  # enable netmap autodetect
   HOST_VARIANT_DIR="freebsd"
-  supported_os="yes"
 ;;
 DragonFly)
   bsd="yes"
@@ -858,7 +846,6 @@ NetBSD)
   audio_possible_drivers="oss sdl"
   oss_lib="-lossaudio"
   HOST_VARIANT_DIR="netbsd"
-  supported_os="yes"
 ;;
 OpenBSD)
   bsd="yes"
@@ -866,7 +853,6 @@ OpenBSD)
   audio_drv_list="try-sdl"
   audio_possible_drivers="sdl"
   HOST_VARIANT_DIR="openbsd"
-  supported_os="yes"
 ;;
 Darwin)
   bsd="yes"
@@ -887,7 +873,6 @@ Darwin)
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
   HOST_VARIANT_DIR="darwin"
-  supported_os="yes"
 ;;
 SunOS)
   solaris="yes"
@@ -918,7 +903,6 @@ Linux)
   linux_user="yes"
   kvm="yes"
   QEMU_INCLUDES="-isystem ${source_path}/linux-headers -I$PWD/linux-headers $QEMU_INCLUDES"
-  supported_os="yes"
   libudev="yes"
 ;;
 esac
@@ -5272,8 +5256,6 @@ EOF
     spice="yes"
     libs_softmmu="$libs_softmmu $spice_libs"
     QEMU_CFLAGS="$QEMU_CFLAGS $spice_cflags"
-    spice_protocol_version=$($pkg_config --modversion spice-protocol)
-    spice_server_version=$($pkg_config --modversion spice-server)
   else
     if test "$spice" = "yes" ; then
       feature_not_found "spice" \
@@ -6890,225 +6872,6 @@ QEMU_CFLAGS="$pixman_cflags $fdt_cflags $QEMU_CFLAGS"
 QEMU_LDFLAGS="$fdt_ldflags $QEMU_LDFLAGS"
 libs_softmmu="$pixman_libs $libs_softmmu"
 
-echo "Install prefix    $prefix"
-echo "BIOS directory    $(eval echo $qemu_datadir)"
-echo "firmware path     $(eval echo $firmwarepath)"
-echo "binary directory  $(eval echo $bindir)"
-echo "library directory $(eval echo $libdir)"
-echo "module directory  $(eval echo $qemu_moddir)"
-echo "libexec directory $(eval echo $libexecdir)"
-echo "include directory $(eval echo $includedir)"
-echo "config directory  $(eval echo $sysconfdir)"
-if test "$mingw32" = "no" ; then
-echo "local state directory   $(eval echo $local_statedir)"
-echo "Manual directory  $(eval echo $mandir)"
-echo "ELF interp prefix $interp_prefix"
-else
-echo "local state directory   queried at runtime"
-echo "Windows SDK       $win_sdk"
-fi
-echo "Build directory   $(pwd)"
-echo "Source path       $source_path"
-echo "GIT binary        $git"
-echo "GIT submodules    $git_submodules"
-echo "C compiler        $cc"
-echo "Host C compiler   $host_cc"
-echo "C++ compiler      $cxx"
-echo "Objective-C compiler $objcc"
-echo "ARFLAGS           $ARFLAGS"
-echo "CFLAGS            $CFLAGS"
-echo "QEMU_CFLAGS       $QEMU_CFLAGS"
-echo "QEMU_LDFLAGS      $QEMU_LDFLAGS"
-echo "make              $make"
-echo "install           $install"
-echo "python            $python ($python_version)"
-if test "$docs" != "no"; then
-    echo "sphinx-build      $sphinx_build"
-fi
-echo "genisoimage       $genisoimage"
-echo "slirp support     $slirp $(echo_version $slirp $slirp_version)"
-if test "$slirp" != "no" ; then
-    echo "smbd              $smbd"
-fi
-echo "module support    $modules"
-echo "alt path mod load $module_upgrades"
-echo "host CPU          $cpu"
-echo "host big endian   $bigendian"
-echo "target list       $target_list"
-echo "gprof enabled     $gprof"
-echo "sparse enabled    $sparse"
-echo "strip binaries    $strip_opt"
-echo "profiler          $profiler"
-echo "static build      $static"
-echo "safe stack        $safe_stack"
-if test "$darwin" = "yes" ; then
-    echo "Cocoa support     $cocoa"
-fi
-echo "SDL support       $sdl $(echo_version $sdl $sdlversion)"
-echo "SDL image support $sdl_image"
-echo "GTK support       $gtk $(echo_version $gtk $gtk_version)"
-echo "GTK GL support    $gtk_gl"
-echo "VTE support       $vte $(echo_version $vte $vteversion)"
-echo "TLS priority      $tls_priority"
-echo "GNUTLS support    $gnutls"
-echo "libgcrypt         $gcrypt"
-if test "$gcrypt" = "yes"
-then
-   echo "  hmac            $gcrypt_hmac"
-   echo "  XTS             $gcrypt_xts"
-fi
-echo "nettle            $nettle $(echo_version $nettle $nettle_version)"
-if test "$nettle" = "yes"
-then
-   echo "  XTS             $nettle_xts"
-fi
-echo "libtasn1          $tasn1"
-echo "PAM               $auth_pam"
-echo "iconv support     $iconv"
-echo "curses support    $curses"
-echo "virgl support     $virglrenderer $(echo_version $virglrenderer $virgl_version)"
-echo "curl support      $curl"
-echo "mingw32 support   $mingw32"
-echo "Audio drivers     $audio_drv_list"
-echo "Block whitelist (rw) $block_drv_rw_whitelist"
-echo "Block whitelist (ro) $block_drv_ro_whitelist"
-echo "VirtFS support    $virtfs"
-echo "Multipath support $mpath"
-echo "VNC support       $vnc"
-if test "$vnc" = "yes" ; then
-    echo "VNC SASL support  $vnc_sasl"
-    echo "VNC JPEG support  $vnc_jpeg"
-    echo "VNC PNG support   $vnc_png"
-fi
-echo "xen support       $xen"
-if test "$xen" = "yes" ; then
-  echo "xen ctrl version  $xen_ctrl_version"
-fi
-echo "brlapi support    $brlapi"
-echo "Documentation     $docs"
-echo "PIE               $pie"
-echo "vde support       $vde"
-echo "netmap support    $netmap"
-echo "Linux AIO support $linux_aio"
-echo "Linux io_uring support $linux_io_uring"
-echo "ATTR/XATTR support $attr"
-echo "Install blobs     $blobs"
-echo "KVM support       $kvm"
-echo "HAX support       $hax"
-echo "HVF support       $hvf"
-echo "WHPX support      $whpx"
-echo "TCG support       $tcg"
-if test "$tcg" = "yes" ; then
-    echo "TCG debug enabled $debug_tcg"
-    echo "TCG interpreter   $tcg_interpreter"
-fi
-echo "malloc trim support $malloc_trim"
-echo "RDMA support      $rdma"
-echo "PVRDMA support    $pvrdma"
-echo "fdt support       $fdt"
-echo "membarrier        $membarrier"
-echo "preadv support    $preadv"
-echo "fdatasync         $fdatasync"
-echo "madvise           $madvise"
-echo "posix_madvise     $posix_madvise"
-echo "posix_memalign    $posix_memalign"
-echo "libcap-ng support $cap_ng"
-echo "vhost-net support $vhost_net"
-echo "vhost-crypto support $vhost_crypto"
-echo "vhost-scsi support $vhost_scsi"
-echo "vhost-vsock support $vhost_vsock"
-echo "vhost-user support $vhost_user"
-echo "vhost-user-fs support $vhost_user_fs"
-echo "vhost-vdpa support $vhost_vdpa"
-echo "Trace backends    $trace_backends"
-if have_backend "simple"; then
-echo "Trace output file $trace_file-<pid>"
-fi
-echo "spice support     $spice $(echo_version $spice $spice_protocol_version/$spice_server_version)"
-echo "rbd support       $rbd"
-echo "xfsctl support    $xfs"
-echo "smartcard support $smartcard"
-echo "libusb            $libusb"
-echo "usb net redir     $usb_redir"
-echo "OpenGL support    $opengl"
-echo "OpenGL dmabufs    $opengl_dmabuf"
-echo "libiscsi support  $libiscsi"
-echo "libnfs support    $libnfs"
-echo "build guest agent $guest_agent"
-echo "QGA VSS support   $guest_agent_with_vss"
-echo "QGA w32 disk info $guest_agent_ntddscsi"
-echo "QGA MSI support   $guest_agent_msi"
-echo "seccomp support   $seccomp"
-echo "coroutine backend $coroutine"
-echo "coroutine pool    $coroutine_pool"
-echo "debug stack usage $debug_stack_usage"
-echo "mutex debugging   $debug_mutex"
-echo "crypto afalg      $crypto_afalg"
-echo "GlusterFS support $glusterfs"
-echo "gcov              $gcov_tool"
-echo "gcov enabled      $gcov"
-echo "TPM support       $tpm"
-echo "libssh support    $libssh"
-echo "QOM debugging     $qom_cast_debug"
-echo "Live block migration $live_block_migration"
-echo "lzo support       $lzo"
-echo "snappy support    $snappy"
-echo "bzip2 support     $bzip2"
-echo "lzfse support     $lzfse"
-echo "zstd support      $zstd"
-echo "NUMA host support $numa"
-echo "libxml2           $libxml2"
-echo "tcmalloc support  $tcmalloc"
-echo "jemalloc support  $jemalloc"
-echo "avx2 optimization $avx2_opt"
-echo "avx512f optimization $avx512f_opt"
-echo "replication support $replication"
-echo "bochs support     $bochs"
-echo "cloop support     $cloop"
-echo "dmg support       $dmg"
-echo "qcow v1 support   $qcow1"
-echo "vdi support       $vdi"
-echo "vvfat support     $vvfat"
-echo "qed support       $qed"
-echo "parallels support $parallels"
-echo "sheepdog support  $sheepdog"
-echo "capstone          $capstone"
-echo "libpmem support   $libpmem"
-echo "libdaxctl support $libdaxctl"
-echo "libudev           $libudev"
-echo "default devices   $default_devices"
-echo "plugin support    $plugins"
-echo "fuzzing support   $fuzzing"
-echo "gdb               $gdb_bin"
-echo "rng-none          $rng_none"
-echo "Linux keyring     $secret_keyring"
-
-if test "$supported_cpu" = "no"; then
-    echo
-    echo "WARNING: SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!"
-    echo
-    echo "CPU host architecture $cpu support is not currently maintained."
-    echo "The QEMU project intends to remove support for this host CPU in"
-    echo "a future release if nobody volunteers to maintain it and to"
-    echo "provide a build host for our continuous integration setup."
-    echo "configure has succeeded and you can continue to build, but"
-    echo "if you care about QEMU on this platform you should contact"
-    echo "us upstream at qemu-devel@nongnu.org."
-fi
-
-if test "$supported_os" = "no"; then
-    echo
-    echo "WARNING: SUPPORT FOR THIS HOST OS WILL GO AWAY IN FUTURE RELEASES!"
-    echo
-    echo "Host OS $targetos support is not currently maintained."
-    echo "The QEMU project intends to remove support for this host OS in"
-    echo "a future release if nobody volunteers to maintain it and to"
-    echo "provide a build host for our continuous integration setup."
-    echo "configure has succeeded and you can continue to build, but"
-    echo "if you care about QEMU on this platform you should contact"
-    echo "us upstream at qemu-devel@nongnu.org."
-fi
-
 config_host_mak="config-host.mak"
 
 echo "# Automatically generated by configure - do not modify" >config-all-disas.mak
diff --git a/meson.build b/meson.build
index f338a3e677..ffb848487e 100644
--- a/meson.build
+++ b/meson.build
@@ -15,6 +15,8 @@ add_project_link_arguments(config_host['QEMU_LDFLAGS'].split(),
 add_project_arguments(config_host['QEMU_INCLUDES'].split(),
                       language: ['c', 'cpp', 'objc'])
 
+python = import('python').find_installation()
+
 add_languages('cpp', required: false, native: false)
 if host_machine.system() == 'darwin'
   add_languages('objc', required: false, native: false)
@@ -23,3 +25,244 @@ endif
 configure_file(input: files('scripts/ninjatool.py'),
                output: 'ninjatool',
                configuration: config_host)
+
+supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
+supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
+  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+
+cpu = host_machine.cpu_family()
+targetos = host_machine.system()
+
+summary_info = {}
+summary_info += {'Install prefix':    config_host['prefix']}
+summary_info += {'BIOS directory':    config_host['qemu_datadir']}
+summary_info += {'firmware path':     config_host['qemu_firmwarepath']}
+summary_info += {'binary directory':  config_host['bindir']}
+summary_info += {'library directory': config_host['libdir']}
+summary_info += {'module directory':  config_host['qemu_moddir']}
+summary_info += {'libexec directory': config_host['libexecdir']}
+summary_info += {'include directory': config_host['includedir']}
+summary_info += {'config directory':  config_host['sysconfdir']}
+if targetos != 'windows'
+  summary_info += {'local state directory': config_host['qemu_localstatedir']}
+  summary_info += {'Manual directory':      config_host['mandir']}
+else
+  summary_info += {'local state directory': 'queried at runtime'}
+endif
+summary_info += {'Build directory':   meson.current_build_dir()}
+summary_info += {'Source path':       meson.current_source_dir()}
+summary_info += {'GIT binary':        config_host['GIT']}
+summary_info += {'GIT submodules':    config_host['GIT_SUBMODULES']}
+summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
+summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
+summary_info += {'C++ compiler':      meson.get_compiler('cpp').cmd_array()[0]}
+if targetos == 'darwin'
+  summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
+endif
+summary_info += {'ARFLAGS':           config_host['ARFLAGS']}
+summary_info += {'CFLAGS':            config_host['CFLAGS']}
+summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
+summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
+summary_info += {'make':              config_host['MAKE']}
+summary_info += {'install':           config_host['INSTALL']}
+summary_info += {'python':            '@0@ (version: @1@)'.format(python.full_path(), python.language_version())}
+summary_info += {'sphinx-build':      config_host['SPHINX_BUILD']}
+summary_info += {'genisoimage':       config_host['GENISOIMAGE']}
+# TODO: add back version
+summary_info += {'slirp support':     config_host.has_key('CONFIG_SLIRP')}
+if config_host.has_key('CONFIG_SLIRP')
+  summary_info += {'smbd':            config_host['CONFIG_SMBD_COMMAND']}
+endif
+summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
+if config_host.has_key('CONFIG_MODULES')
+  summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
+endif
+summary_info += {'host CPU':          cpu}
+summary_info += {'host endianness':   build_machine.endian()}
+summary_info += {'target list':       config_host['TARGET_DIRS']}
+summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
+summary_info += {'sparse enabled':    meson.get_compiler('c').cmd_array().contains('cgcc')}
+summary_info += {'strip binaries':    get_option('strip')}
+summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
+summary_info += {'static build':      config_host.has_key('CONFIG_TOOLS')}
+if targetos == 'darwin'
+  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
+endif
+# TODO: add back version
+summary_info += {'SDL support':       config_host.has_key('CONFIG_SDL')}
+summary_info += {'SDL image support': config_host.has_key('CONFIG_SDL_IMAGE')}
+# TODO: add back version
+summary_info += {'GTK support':       config_host.has_key('CONFIG_GTK')}
+summary_info += {'GTK GL support':    config_host.has_key('CONFIG_GTK_GL')}
+# TODO: add back version
+summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
+summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
+summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
+# TODO: add back version
+summary_info += {'libgcrypt':         config_host.has_key('CONFIG_GCRYPT')}
+if config_host.has_key('CONFIG_GCRYPT')
+   summary_info += {'  hmac':            config_host.has_key('CONFIG_GCRYPT_HMAC')}
+   summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
+endif
+# TODO: add back version
+summary_info += {'nettle':            config_host.has_key('CONFIG_NETTLE')}
+if config_host.has_key('CONFIG_NETTLE')
+   summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
+endif
+summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
+summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
+summary_info += {'iconv support':     config_host.has_key('CONFIG_ICONV')}
+summary_info += {'curses support':    config_host.has_key('CONFIG_CURSES')}
+# TODO: add back version
+summary_info += {'virgl support':     config_host.has_key('CONFIG_VIRGL')}
+summary_info += {'curl support':      config_host.has_key('CONFIG_CURL')}
+summary_info += {'mingw32 support':   targetos == 'windows'}
+summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
+summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
+summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
+summary_info += {'VirtFS support':    config_host.has_key('CONFIG_VIRTFS')}
+summary_info += {'Multipath support': config_host.has_key('CONFIG_MPATH')}
+summary_info += {'VNC support':       config_host.has_key('CONFIG_VNC')}
+if config_host.has_key('CONFIG_VNC')
+  summary_info += {'VNC SASL support':  config_host.has_key('CONFIG_VNC_SASL')}
+  summary_info += {'VNC JPEG support':  config_host.has_key('CONFIG_VNC_JPEG')}
+  summary_info += {'VNC PNG support':   config_host.has_key('CONFIG_VNC_PNG')}
+endif
+summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
+if config_host.has_key('CONFIG_XEN_BACKEND')
+  summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
+endif
+summary_info += {'brlapi support':    config_host.has_key('CONFIG_BRLAPI')}
+summary_info += {'Documentation':     config_host.has_key('BUILD_DOCS')}
+summary_info += {'PIE':               get_option('b_pie')}
+summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
+summary_info += {'netmap support':    config_host.has_key('CONFIG_NETMAP')}
+summary_info += {'Linux AIO support': config_host.has_key('CONFIG_LINUX_AIO')}
+summary_info += {'Linux io_uring support': config_host.has_key('CONFIG_LINUX_IO_URING')}
+summary_info += {'ATTR/XATTR support': config_host.has_key('CONFIG_ATTR')}
+summary_info += {'Install blobs':     config_host.has_key('INSTALL_BLOBS')}
+# TODO: add back KVM/HAX/HVF/WHPX/TCG
+#summary_info += {'KVM support':       have_kvm'}
+#summary_info += {'HAX support':       have_hax'}
+#summary_info += {'HVF support':       have_hvf'}
+#summary_info += {'WHPX support':      have_whpx'}
+#summary_info += {'TCG support':       have_tcg'}
+#if get_option('tcg')
+#  summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
+#  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
+#endif
+summary_info += {'malloc trim support': config_host.has_key('CONFIG_MALLOC_TRIM')}
+summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
+summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
+summary_info += {'fdt support':       config_host.has_key('CONFIG_FDT')}
+summary_info += {'membarrier':        config_host.has_key('CONFIG_MEMBARRIER')}
+summary_info += {'preadv support':    config_host.has_key('CONFIG_PREADV')}
+summary_info += {'fdatasync':         config_host.has_key('CONFIG_FDATASYNC')}
+summary_info += {'madvise':           config_host.has_key('CONFIG_MADVISE')}
+summary_info += {'posix_madvise':     config_host.has_key('CONFIG_POSIX_MADVISE')}
+summary_info += {'posix_memalign':    config_host.has_key('CONFIG_POSIX_MEMALIGN')}
+summary_info += {'libcap-ng support': config_host.has_key('CONFIG_LIBCAP_NG')}
+summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
+summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
+summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
+summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
+summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
+summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
+if config_host['TRACE_BACKENDS'].split().contains('simple')
+  summary_info += {'Trace output file': config_host['CONFIG_TRACE_FILE'] + '-<pid>'}
+endif
+# TODO: add back protocol and server version
+summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
+summary_info += {'rbd support':       config_host.has_key('CONFIG_RBD')}
+summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
+summary_info += {'smartcard support': config_host.has_key('CONFIG_SMARTCARD')}
+summary_info += {'libusb':            config_host.has_key('CONFIG_USB_LIBUSB')}
+summary_info += {'usb net redir':     config_host.has_key('CONFIG_USB_REDIR')}
+summary_info += {'OpenGL support':    config_host.has_key('CONFIG_OPENGL')}
+summary_info += {'OpenGL dmabufs':    config_host.has_key('CONFIG_OPENGL_DMABUF')}
+summary_info += {'libiscsi support':  config_host.has_key('CONFIG_LIBISCSI')}
+summary_info += {'libnfs support':    config_host.has_key('CONFIG_LIBNFS')}
+summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
+if targetos == 'windows'
+  if 'WIN_SDK' in config_host
+    summary_info += {'Windows SDK':       config_host['WIN_SDK']}
+  endif
+  summary_info += {'QGA VSS support':   config_host.has_key('CONFIG_QGA_VSS')}
+  summary_info += {'QGA w32 disk info': config_host.has_key('CONFIG_QGA_NTDDSCSI')}
+  summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI_ENABLED')}
+endif
+summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
+summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
+summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
+summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
+summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
+summary_info += {'GlusterFS support': config_host.has_key('CONFIG_GLUSTERFS')}
+summary_info += {'gcov':              config_host.has_key('CONFIG_GCOV')}
+summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
+summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
+summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
+summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
+summary_info += {'lzo support':       config_host.has_key('CONFIG_LZO')}
+summary_info += {'snappy support':    config_host.has_key('CONFIG_SNAPPY')}
+summary_info += {'bzip2 support':     config_host.has_key('CONFIG_BZIP2')}
+summary_info += {'lzfse support':     config_host.has_key('CONFIG_LZFSE')}
+summary_info += {'zstd support':      config_host.has_key('CONFIG_ZSTD')}
+summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
+summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
+summary_info += {'tcmalloc support':  config_host.has_key('CONFIG_TCMALLOC')}
+summary_info += {'jemalloc support':  config_host.has_key('CONFIG_JEMALLOC')}
+summary_info += {'avx2 optimization': config_host.has_key('CONFIG_AVX2_OPT')}
+summary_info += {'avx512f optimization': config_host.has_key('CONFIG_AVX512F_OPT')}
+summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
+summary_info += {'bochs support':     config_host.has_key('CONFIG_BOCHS')}
+summary_info += {'cloop support':     config_host.has_key('CONFIG_CLOOP')}
+summary_info += {'dmg support':       config_host.has_key('CONFIG_DMG')}
+summary_info += {'qcow v1 support':   config_host.has_key('CONFIG_QCOW1')}
+summary_info += {'vdi support':       config_host.has_key('CONFIG_VDI')}
+summary_info += {'vvfat support':     config_host.has_key('CONFIG_VVFAT')}
+summary_info += {'qed support':       config_host.has_key('CONFIG_QED')}
+summary_info += {'parallels support': config_host.has_key('CONFIG_PARALLELS')}
+summary_info += {'sheepdog support':  config_host.has_key('CONFIG_SHEEPDOG')}
+summary_info += {'capstone':          config_host.has_key('CONFIG_CAPSTONE')}
+summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
+summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
+summary_info += {'libudev':           config_host.has_key('CONFIG_LIBUDEV')}
+summary_info += {'default devices':   config_host['CONFIG_MINIKCONF_MODE'] == '--defconfig'}
+summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
+summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
+if config_host.has_key('HAVE_GDB_BIN')
+  summary_info += {'gdb':             config_host['HAVE_GDB_BIN']}
+endif
+summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
+summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
+summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary(summary_info, bool_yn: true)
+
+if not supported_cpus.contains(cpu)
+  message()
+  warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
+  message()
+  message('CPU host architecture ' + cpu + ' support is not currently maintained.')
+  message('The QEMU project intends to remove support for this host CPU in')
+  message('a future release if nobody volunteers to maintain it and to')
+  message('provide a build host for our continuous integration setup.')
+  message('configure has succeeded and you can continue to build, but')
+  message('if you care about QEMU on this platform you should contact')
+  message('us upstream at qemu-devel@nongnu.org.')
+endif
+
+if not supported_oses.contains(targetos)
+  message()
+  warning('WARNING: SUPPORT FOR THIS HOST OS WILL GO AWAY IN FUTURE RELEASES!')
+  message()
+  message('Host OS ' + targetos + 'support is not currently maintained.')
+  message('The QEMU project intends to remove support for this host OS in')
+  message('a future release if nobody volunteers to maintain it and to')
+  message('provide a build host for our continuous integration setup.')
+  message('configure has succeeded and you can continue to build, but')
+  message('if you care about QEMU on this platform you should contact')
+  message('us upstream at qemu-devel@nongnu.org.')
+endif
-- 
2.26.2



