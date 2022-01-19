Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB3493F05
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:26:31 +0100 (CET)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEj7-0002gq-Rj
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:26:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbN-0002AX-HM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbJ-00005j-SI
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gjx5zBh2uSL8StsrRpbf84OR1jSjECyM3mgKt8sFMvA=;
 b=Y+2iozWXALEWZ4dYSd5P0malC3qMOi0o8AJV80j4HyTO2eADHyjNI2vaIJGq/lEPhivwB5
 ntdDgcCtZB5wRiHE2ffDpVa09KsnxulnwVuy26QPo2QuSypqbuAKKZGoiwYySu0YPWQCC5
 2O1yMvxblNppSJeqTuYbIjOzz2Deg6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-pKRSC75wN_WfUK6G23j3Cg-1; Wed, 19 Jan 2022 12:18:07 -0500
X-MC-Unique: pKRSC75wN_WfUK6G23j3Cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E9783DD23;
 Wed, 19 Jan 2022 17:18:06 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E467EFFE;
 Wed, 19 Jan 2022 17:18:05 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] meson: Don't pass 'method' to dependency()
Date: Wed, 19 Jan 2022 18:17:59 +0100
Message-Id: <20220119171800.491703-3-abologna@redhat.com>
In-Reply-To: <20220119171800.491703-1-abologna@redhat.com>
References: <20220119171800.491703-1-abologna@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson will do the right thing by default.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 meson.build     | 74 ++++++++++++++++++++-----------------------------
 tcg/meson.build |  2 +-
 2 files changed, 31 insertions(+), 45 deletions(-)

diff --git a/meson.build b/meson.build
index bc17ba67fd..b807ad9fbb 100644
--- a/meson.build
+++ b/meson.build
@@ -427,13 +427,13 @@ if 'CONFIG_GIO' in config_host
 endif
 lttng = not_found
 if 'ust' in get_option('trace_backends')
-  lttng = dependency('lttng-ust', required: true, method: 'pkg-config',
+  lttng = dependency('lttng-ust', required: true,
                      kwargs: static_kwargs)
 endif
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
-                      method: 'pkg-config', kwargs: static_kwargs)
+                      kwargs: static_kwargs)
 endif
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
 
@@ -446,18 +446,18 @@ endif
 linux_io_uring = not_found
 if not get_option('linux_io_uring').auto() or have_block
   linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
-                              method: 'pkg-config', kwargs: static_kwargs)
+                              kwargs: static_kwargs)
 endif
 libxml2 = not_found
 if not get_option('libxml2').auto() or have_block
   libxml2 = dependency('libxml-2.0', required: get_option('libxml2'),
-                       method: 'pkg-config', kwargs: static_kwargs)
+                       kwargs: static_kwargs)
 endif
 libnfs = not_found
 if not get_option('libnfs').auto() or have_block
   libnfs = dependency('libnfs', version: '>=1.9.3',
                       required: get_option('libnfs'),
-                      method: 'pkg-config', kwargs: static_kwargs)
+                      kwargs: static_kwargs)
 endif
 
 libattr_test = '''
@@ -505,7 +505,7 @@ seccomp = not_found
 if not get_option('seccomp').auto() or have_system or have_tools
   seccomp = dependency('libseccomp', version: '>=2.3.0',
                        required: get_option('seccomp'),
-                       method: 'pkg-config', kwargs: static_kwargs)
+                       kwargs: static_kwargs)
 endif
 
 libcap_ng = not_found
@@ -533,7 +533,7 @@ if get_option('xkbcommon').auto() and not have_system and not have_tools
   xkbcommon = not_found
 else
   xkbcommon = dependency('xkbcommon', required: get_option('xkbcommon'),
-                         method: 'pkg-config', kwargs: static_kwargs)
+                         kwargs: static_kwargs)
 endif
 
 vde = not_found
@@ -562,30 +562,30 @@ endif
 pulse = not_found
 if not get_option('pa').auto() or (targetos == 'linux' and have_system)
   pulse = dependency('libpulse', required: get_option('pa'),
-                     method: 'pkg-config', kwargs: static_kwargs)
+                     kwargs: static_kwargs)
 endif
 alsa = not_found
 if not get_option('alsa').auto() or (targetos == 'linux' and have_system)
   alsa = dependency('alsa', required: get_option('alsa'),
-                    method: 'pkg-config', kwargs: static_kwargs)
+                    kwargs: static_kwargs)
 endif
 jack = not_found
 if not get_option('jack').auto() or have_system
   jack = dependency('jack', required: get_option('jack'),
-                    method: 'pkg-config', kwargs: static_kwargs)
+                    kwargs: static_kwargs)
 endif
 
 spice_protocol = not_found
 if not get_option('spice_protocol').auto() or have_system
   spice_protocol = dependency('spice-protocol', version: '>=0.12.3',
                               required: get_option('spice_protocol'),
-                              method: 'pkg-config', kwargs: static_kwargs)
+                              kwargs: static_kwargs)
 endif
 spice = not_found
 if not get_option('spice').auto() or have_system
   spice = dependency('spice-server', version: '>=0.12.5',
                      required: get_option('spice'),
-                     method: 'pkg-config', kwargs: static_kwargs)
+                     kwargs: static_kwargs)
 endif
 spice_headers = spice.partial_dependency(compile_args: true, includes: true)
 
@@ -595,32 +595,29 @@ libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
   libiscsi = dependency('libiscsi', version: '>=1.9.0',
                          required: get_option('libiscsi'),
-                         method: 'pkg-config', kwargs: static_kwargs)
+                         kwargs: static_kwargs)
 endif
 zstd = not_found
 if not get_option('zstd').auto() or have_block
   zstd = dependency('libzstd', version: '>=1.4.0',
                     required: get_option('zstd'),
-                    method: 'pkg-config', kwargs: static_kwargs)
+                    kwargs: static_kwargs)
 endif
 virgl = not_found
 if not get_option('virglrenderer').auto() or have_system
   virgl = dependency('virglrenderer',
-                     method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
 endif
 curl = not_found
 if not get_option('curl').auto() or have_block
   curl = dependency('libcurl', version: '>=7.29.0',
-                    method: 'pkg-config',
                     required: get_option('curl'),
                     kwargs: static_kwargs)
 endif
 libudev = not_found
 if targetos == 'linux' and (have_system or have_tools)
   libudev = dependency('libudev',
-                       method: 'pkg-config',
                        required: get_option('libudev'),
                        kwargs: static_kwargs)
 endif
@@ -720,7 +717,6 @@ if have_system and not get_option('curses').disabled()
     if not curses.found()
       curses = dependency(curses_dep,
                           required: false,
-                          method: 'pkg-config',
                           kwargs: static_kwargs)
     endif
   endforeach
@@ -821,7 +817,7 @@ if sdl.found()
   sdl = declare_dependency(compile_args: '-Wno-undef',
                            dependencies: sdl)
   sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                         method: 'pkg-config', kwargs: static_kwargs)
+                         kwargs: static_kwargs)
 else
   if get_option('sdl_image').enabled()
     error('sdl-image required, but SDL was @0@'.format(
@@ -864,7 +860,7 @@ glusterfs_iocb_has_stat = false
 if not get_option('glusterfs').auto() or have_block
   glusterfs = dependency('glusterfs-api', version: '>=3',
                          required: get_option('glusterfs'),
-                         method: 'pkg-config', kwargs: static_kwargs)
+                         kwargs: static_kwargs)
   if glusterfs.found()
     glusterfs_ftruncate_has_stat = cc.links('''
       #include <glusterfs/api/glfs.h>
@@ -898,7 +894,6 @@ endif
 libssh = not_found
 if not get_option('libssh').auto() or have_block
   libssh = dependency('libssh', version: '>=0.8.7',
-                    method: 'pkg-config',
                     required: get_option('libssh'),
                     kwargs: static_kwargs)
 endif
@@ -980,7 +975,7 @@ if 'CONFIG_OPENGL' in config_host
 endif
 gbm = not_found
 if (have_system or have_tools) and (virgl.found() or opengl.found())
-  gbm = dependency('gbm', method: 'pkg-config', required: false,
+  gbm = dependency('gbm', required: false,
                    kwargs: static_kwargs)
 endif
 
@@ -1001,7 +996,6 @@ if get_option('gnutls').enabled() or (get_option('gnutls').auto() and have_syste
   # still use a different crypto backend to satisfy
   # the platform support requirements
   gnutls_crypto = dependency('gnutls', version: '>=3.6.14',
-                             method: 'pkg-config',
                              required: false,
                              kwargs: static_kwargs)
   if gnutls_crypto.found()
@@ -1009,7 +1003,6 @@ if get_option('gnutls').enabled() or (get_option('gnutls').auto() and have_syste
   else
     # Our min version if all we need is TLS
     gnutls = dependency('gnutls', version: '>=3.5.18',
-                        method: 'pkg-config',
                         required: get_option('gnutls'),
                         kwargs: static_kwargs)
   endif
@@ -1049,7 +1042,6 @@ if not gnutls_crypto.found()
   endif
   if (not get_option('nettle').auto() or have_system) and not gcrypt.found()
     nettle = dependency('nettle', version: '>=3.4',
-                        method: 'pkg-config',
                         required: get_option('nettle'),
                         kwargs: static_kwargs)
     if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)
@@ -1063,19 +1055,16 @@ gtkx11 = not_found
 vte = not_found
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
-                   method: 'pkg-config',
                    required: get_option('gtk'),
                    kwargs: static_kwargs)
   if gtk.found()
     gtkx11 = dependency('gtk+-x11-3.0', version: '>=3.22.0',
-                        method: 'pkg-config',
                         required: false,
                         kwargs: static_kwargs)
     gtk = declare_dependency(dependencies: [gtk, gtkx11])
 
     if not get_option('vte').auto() or have_system
       vte = dependency('vte-2.91',
-                       method: 'pkg-config',
                        required: get_option('vte'),
                        kwargs: static_kwargs)
     endif
@@ -1084,7 +1073,7 @@ endif
 
 x11 = not_found
 if gtkx11.found()
-  x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
+  x11 = dependency('x11', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
 vnc = not_found
@@ -1094,9 +1083,9 @@ sasl = not_found
 if have_system and not get_option('vnc').disabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
+                   kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
-                    method: 'pkg-config', kwargs: static_kwargs)
+                    kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
                          required: get_option('vnc_sasl'),
                          kwargs: static_kwargs)
@@ -1181,54 +1170,52 @@ endif
 cacard = not_found
 if not get_option('smartcard').auto() or have_system
   cacard = dependency('libcacard', required: get_option('smartcard'),
-                      version: '>=2.5.1', method: 'pkg-config',
+                      version: '>=2.5.1',
                       kwargs: static_kwargs)
 endif
 u2f = not_found
 if have_system
   u2f = dependency('u2f-emu', required: get_option('u2f'),
-                   method: 'pkg-config',
                    kwargs: static_kwargs)
 endif
 usbredir = not_found
 if not get_option('usb_redir').auto() or have_system
   usbredir = dependency('libusbredirparser-0.5', required: get_option('usb_redir'),
-                        version: '>=0.6', method: 'pkg-config',
+                        version: '>=0.6',
                         kwargs: static_kwargs)
 endif
 libusb = not_found
 if not get_option('libusb').auto() or have_system
   libusb = dependency('libusb-1.0', required: get_option('libusb'),
-                      version: '>=1.0.13', method: 'pkg-config',
+                      version: '>=1.0.13',
                       kwargs: static_kwargs)
 endif
 
 libpmem = not_found
 if not get_option('libpmem').auto() or have_system
   libpmem = dependency('libpmem', required: get_option('libpmem'),
-                       method: 'pkg-config', kwargs: static_kwargs)
+                       kwargs: static_kwargs)
 endif
 libdaxctl = not_found
 if not get_option('libdaxctl').auto() or have_system
   libdaxctl = dependency('libdaxctl', required: get_option('libdaxctl'),
-                         version: '>=57', method: 'pkg-config',
+                         version: '>=57',
                          kwargs: static_kwargs)
 endif
 tasn1 = not_found
 if gnutls.found()
   tasn1 = dependency('libtasn1',
-                     method: 'pkg-config',
                      kwargs: static_kwargs)
 endif
 keyutils = dependency('libkeyutils', required: false,
-                      method: 'pkg-config', kwargs: static_kwargs)
+                      kwargs: static_kwargs)
 
 has_gettid = cc.has_function('gettid')
 
 # libselinux
 selinux = dependency('libselinux',
                      required: get_option('selinux'),
-                     method: 'pkg-config', kwargs: static_kwargs)
+                     kwargs: static_kwargs)
 
 # Malloc tests
 
@@ -1286,7 +1273,7 @@ if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
 endif
 
 fuse = dependency('fuse3', required: get_option('fuse'),
-                  version: '>=3.1', method: 'pkg-config',
+                  version: '>=3.1',
                   kwargs: static_kwargs)
 
 fuse_lseek = not_found
@@ -1304,7 +1291,7 @@ if not get_option('fuse_lseek').disabled()
 endif
 
 # libbpf
-libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
+libbpf = dependency('libbpf', required: get_option('bpf'))
 if libbpf.found() and not cc.links('''
    #include <bpf/libbpf.h>
    int main(void)
@@ -2053,7 +2040,7 @@ capstone_opt = get_option('capstone')
 if capstone_opt in ['enabled', 'auto', 'system']
   have_internal = fs.exists(meson.current_source_dir() / 'capstone/Makefile')
   capstone = dependency('capstone', version: '>=4.0',
-                        kwargs: static_kwargs, method: 'pkg-config',
+                        kwargs: static_kwargs,
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
 
@@ -2177,7 +2164,6 @@ if have_system
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
     slirp = dependency('slirp', kwargs: static_kwargs,
-                       method: 'pkg-config',
                        required: slirp_opt == 'system' or
                                  slirp_opt == 'enabled' and not have_internal)
     if slirp.found()
diff --git a/tcg/meson.build b/tcg/meson.build
index c4c63b19d4..26a46269db 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -12,7 +12,7 @@ tcg_ss.add(files(
 
 if get_option('tcg_interpreter')
   libffi = dependency('libffi', version: '>=3.0', required: true,
-                      method: 'pkg-config', kwargs: static_kwargs)
+                      kwargs: static_kwargs)
   specific_ss.add(libffi)
   specific_ss.add(files('tci.c'))
 endif
-- 
2.34.1


