Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FD2DFD67
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:21:13 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMzo-0003FI-O6
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRH-0004rp-00
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007nx-UF
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a6so10098291wmc.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiKRgD2AaE0tCQWyXCImXmBK9bR0yALUWNeufpaoVnA=;
 b=YYR/8Vu2EThLDqvCwrTWwWASzV+uBwfLYFTacZetyEq8o2OOW2LxXOTmhnwet4Mcs2
 8ns8KPQk1KlHrQjc0OKtFLsFQF9T8oTpcjjb3SYBQMDy2KE09mPL0Jj4d/ouZSn70iq8
 ijo/wfL090ruOs8+VHrk2JDbUZWLjMdOs6O8VPHwv7mXAHzt7V7mVQesEHs6xDEYcGoA
 9ULk7I5W81WF33h3kSAIFr4Pi9kBoZLLjt3JtTqsjH86C/GXw9IxKcP8KNWMLVDglJfy
 BpTU6eZtqWobcXxTnXWdPTntBpFqxbKHAZhoSNQbByCTMs1Nm3sC5aJoBTSjV6hrt5GW
 elaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RiKRgD2AaE0tCQWyXCImXmBK9bR0yALUWNeufpaoVnA=;
 b=WKwI0fJeYWhzWqoxFIpjS3yj917WIDW1MWFqccntvE6XZHwJ4eQMpC12AUqEGFbf/H
 qJgISmiZIajVhIwmOJtYhCg1UrqvSY6JZAwfjXCelxolecMZStL194hV969Qv6s+5Boq
 kAHuJNNPMMfZQ1L3E56AFzZJtgQQg2cRBrEBE4o8oA3agAJQISYxGTh1PUeUjSECl7l2
 To1ppSXtvS21K6I2+/RS8ZHL9DOCkpYbV8eg17RT0ZLBPaos+KaqET7pEy5//GChLBt0
 jljivME+yPSRIFvEBgoWEjY4GZ1uLgQehwISUKMs/YkOxPYEFoKmkiWjJKfPJoWIWBYI
 lj7w==
X-Gm-Message-State: AOAM530Bz/RWVNKfKse7oL3dSF9aZ/3ME7h9fo/+gHNS3KPJNb0AFJdJ
 sTwp4hTMDDgLYD3P0zS0z8okT2PSMHU=
X-Google-Smtp-Source: ABdhPJzatNcahS/9uCqfZ/fXXCleisP7IFH6BU5VODnOXFfc/pApblaZg97p63FtHqBpFgEYq+PQyA==
X-Received: by 2002:a1c:43c5:: with SMTP id
 q188mr17059679wma.163.1608561921448; 
 Mon, 21 Dec 2020 06:45:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/55] brlapi: convert to meson
Date: Mon, 21 Dec 2020 15:44:28 +0100
Message-Id: <20201221144447.26161-37-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
 chardev/meson.build |  2 +-
 configure           | 32 ++++----------------------------
 meson.build         | 20 +++++++++++++++++---
 meson_options.txt   |  2 ++
 4 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/chardev/meson.build b/chardev/meson.build
index 4e19722c5e..32377af383 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -29,7 +29,7 @@ softmmu_ss.add(files('msmouse.c', 'wctablet.c', 'testdev.c'))
 
 chardev_modules = {}
 
-if config_host.has_key('CONFIG_BRLAPI')
+if brlapi.found()
   module_ss = ss.source_set()
   module_ss.add(when: [brlapi], if_true: [files('baum.c'), pixman])
   chardev_modules += { 'baum': module_ss }
diff --git a/configure b/configure
index 61ae342a58..8dd9c33685 100755
--- a/configure
+++ b/configure
@@ -305,7 +305,7 @@ for opt do
   esac
 done
 
-brlapi="$default_feature"
+brlapi="auto"
 curl="$default_feature"
 iconv="auto"
 curses="auto"
@@ -1104,9 +1104,9 @@ for opt do
   ;;
   --enable-xen-pci-passthrough) xen_pci_passthrough="enabled"
   ;;
-  --disable-brlapi) brlapi="no"
+  --disable-brlapi) brlapi="disabled"
   ;;
-  --enable-brlapi) brlapi="yes"
+  --enable-brlapi) brlapi="enabled"
   ;;
   --disable-kvm) kvm="disabled"
   ;;
@@ -3423,26 +3423,6 @@ for drv in $audio_drv_list; do
     esac
 done
 
-##########################################
-# BrlAPI probe
-
-if test "$brlapi" != "no" ; then
-  brlapi_libs="-lbrlapi"
-  cat > $TMPC << EOF
-#include <brlapi.h>
-#include <stddef.h>
-int main( void ) { return brlapi__openConnection (NULL, NULL, NULL); }
-EOF
-  if compile_prog "" "$brlapi_libs" ; then
-    brlapi=yes
-  else
-    if test "$brlapi" = "yes" ; then
-      feature_not_found "brlapi" "Install brlapi devel"
-    fi
-    brlapi=no
-  fi
-fi
-
 ##########################################
 # curl probe
 if test "$curl" != "no" ; then
@@ -6132,10 +6112,6 @@ if test "$curl" = "yes" ; then
   echo "CURL_CFLAGS=$curl_cflags" >> $config_host_mak
   echo "CURL_LIBS=$curl_libs" >> $config_host_mak
 fi
-if test "$brlapi" = "yes" ; then
-  echo "CONFIG_BRLAPI=y" >> $config_host_mak
-  echo "BRLAPI_LIBS=$brlapi_libs" >> $config_host_mak
-fi
 if test "$gtk" = "yes" ; then
   echo "CONFIG_GTK=y" >> $config_host_mak
   echo "GTK_CFLAGS=$gtk_cflags" >> $config_host_mak
@@ -6969,7 +6945,7 @@ NINJA=$ninja $meson setup \
         -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
+        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index 3e584499bc..ecc95207e5 100644
--- a/meson.build
+++ b/meson.build
@@ -570,8 +570,21 @@ if have_system and not get_option('curses').disabled()
 endif
 
 brlapi = not_found
-if 'CONFIG_BRLAPI' in config_host
-  brlapi = declare_dependency(link_args: config_host['BRLAPI_LIBS'].split())
+if not get_option('brlapi').auto() or have_system
+  brlapi = cc.find_library('brlapi', has_headers: ['brlapi.h'],
+                         required: get_option('brlapi'),
+                         static: enable_static)
+  if brlapi.found() and not cc.links('''
+     #include <brlapi.h>
+     #include <stddef.h>
+     int main(void) { return brlapi__openConnection (NULL, NULL, NULL); }''', dependencies: brlapi)
+    brlapi = not_found
+    if get_option('brlapi').enabled()
+      error('could not link brlapi')
+    else
+      warning('could not link brlapi, disabling')
+    endif
+  endif
 endif
 
 sdl = not_found
@@ -854,6 +867,7 @@ config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') /
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
 config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_option('sysconfdir'))
 
+config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
@@ -2165,7 +2179,7 @@ summary_info += {'xen support':       config_host.has_key('CONFIG_XEN_BACKEND')}
 if config_host.has_key('CONFIG_XEN_BACKEND')
   summary_info += {'xen ctrl version':  config_host['CONFIG_XEN_CTRL_INTERFACE_VERSION']}
 endif
-summary_info += {'brlapi support':    config_host.has_key('CONFIG_BRLAPI')}
+summary_info += {'brlapi support':    brlapi.found()}
 summary_info += {'Documentation':     build_docs}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'vde support':       config_host.has_key('CONFIG_VDE')}
diff --git a/meson_options.txt b/meson_options.txt
index 242e0769fb..62efe96a91 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -40,6 +40,8 @@ option('cfi', type: 'boolean', value: 'false',
 option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 
+option('brlapi', type : 'feature', value : 'auto',
+       description: 'brlapi character device driver')
 option('cocoa', type : 'feature', value : 'auto',
        description: 'Cocoa user interface (macOS only)')
 option('mpath', type : 'feature', value : 'auto',
-- 
2.29.2



