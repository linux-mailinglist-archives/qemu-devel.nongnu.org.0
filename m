Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4963FCDB1
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:30:58 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9TF-0001Js-FH
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QS-000881-Qx
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:04 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QQ-0001ie-PY
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:04 -0400
Received: by mail-lf1-x136.google.com with SMTP id p38so1279704lfa.0
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhNnfObZtyZZs9EpNx4FogV0B3f+YivYcf4b6vuqy/w=;
 b=nuPTdMB9Ht+KFo1/LsRv34RcLcVffM/pxLLtsU2DLgPbMshhTWQ3FqXz0slBVy3+Mh
 KD2Fomo2OB+Ck3U5CIAQhMxSO9DJiT6MVPZ0T7riD2vLMbogY8ifYwv7oqY6bydAOrsp
 UGBZyRxJCSr4kiuNLL6l6as24CJOFDg2SKmHHwGj7NcrokPEhXfZMlcrSt4VpADSodHM
 aMERG8R2KE4ub+D4BQh/eEZQLQTiteY2DYlSO72z/F+AWxsCIXg8DDvy27MfwV07YNqT
 FBie9Xu5kiajVVGHEDLHEKHyvEIVJdcmO25wPLPtOiUYidsykMzr1AApYWMgiAG+b3LD
 naFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhNnfObZtyZZs9EpNx4FogV0B3f+YivYcf4b6vuqy/w=;
 b=A4HkCADLdIW1usV0PTpB7oJNN/AipShU/RxQRHRjybQT3BiSWG3DDF9C5YgmRK2PY8
 zJpq7jWseRLhTiXSp3r9DQJ5TF/Jwdmj/U7x3IarM3eXQJt7ipXSFAv8mR0FqXD514mI
 3nXl5h9tEfOsPwxYGKC0iZRZsYhua7/xWpV51zndhAFN9vMv64W1yEhZ4oTSI9kvFjZj
 IanlXe639CXlU/ByWLNzYiNG7Pwz9HTnU7CeXpIvI2AN4GNClnFuw6sWwngy/Z0FeVnI
 TvtIEVqCr1uYlqdn0bT6WwpH/WdVxsjBlbZkeW7FzTGs2V/QIVSWB6QlTCdiap4bq6KF
 zWCg==
X-Gm-Message-State: AOAM532sBTT4o7txs+VWB204MJCbTTkAuAXzDQQ05mHmCiXbDdY9F+pC
 fdiDFn48rU1vWvHdn8NGEXy4UKQZmqYk0w==
X-Google-Smtp-Source: ABdhPJyFRjk7iGMLftuUveJcsvQVrnikYeni3Vwy+gD8j4pNLlx3kcxJFXksd5JZWLpZwG2pjzzIMw==
X-Received: by 2002:a05:6512:3b90:: with SMTP id
 g16mr3345665lfv.409.1630438080334; 
 Tue, 31 Aug 2021 12:28:00 -0700 (PDT)
Received: from UNIT-808.lan ([217.12.73.131])
 by smtp.gmail.com with ESMTPSA id u13sm1254791lfq.254.2021.08.31.12.27.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 12:27:59 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] net/vmnet: dependencies setup, initial preparations
Date: Tue, 31 Aug 2021 22:27:15 +0300
Message-Id: <20210831192720.33406-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'vmnet' customizable option and 'vmnet.framework' probe into
configure;

Create separate netdev per each vmnet operating mode
because they use quite different settings. Especially since
macOS 11.0 (vmnet.framework API gets lots of updates)
Create source files for network client driver, update meson.build;

Three new netdevs are added:
- vmnet-host
- vmnet-shared
- vmnet-bridged

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 configure       | 31 ++++++++++++++++
 meson.build     |  5 +++
 net/clients.h   | 11 ++++++
 net/meson.build |  1 +
 net/net.c       | 10 +++++
 net/vmnet.c     | 34 +++++++++++++++++
 qapi/net.json   | 99 ++++++++++++++++++++++++++++++++++++++++++++++++-
 7 files changed, 189 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet.c

diff --git a/configure b/configure
index 9a79a004d7..9884f0aff2 100755
--- a/configure
+++ b/configure
@@ -308,6 +308,7 @@ mpath="auto"
 vnc="auto"
 sparse="auto"
 vde="$default_feature"
+vmnet="auto"
 vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
@@ -1074,6 +1075,10 @@ for opt do
   ;;
   --enable-vde) vde="yes"
   ;;
+  --disable-vmnet) vmnet="no"
+  ;;
+  --enable-vmnet) vmnet="yes"
+  ;;
   --disable-netmap) netmap="no"
   ;;
   --enable-netmap) netmap="yes"
@@ -1899,6 +1904,7 @@ disabled with --disable-FEATURE, default is enabled if available
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vde             support for vde network
+  vmnet           vmnet.framework support (macOS)
   netmap          support for netmap network
   linux-aio       Linux AIO support
   linux-io-uring  Linux io_uring support
@@ -2964,6 +2970,28 @@ EOF
   fi
 fi
 
+##########################################
+# vmnet.framework probe
+if test "$vmnet" != "no" ; then
+  vmnet_flags="-framework vmnet"
+  cat > $TMPC << EOF
+#include <vmnet/vmnet.h>
+int main(void)
+{
+    (void) vmnet_allocate_mac_address_key;
+    return 0;
+}
+EOF
+  if compile_prog "" "$vmnet_flags" ; then
+    vmnet=yes
+  else
+    if test "$vmnet" = "yes" ; then
+      feature_not_found "vmnet" "'vmnet.framework' in unsupported in this build"
+    fi
+    vmnet=no
+  fi
+fi
+
 ##########################################
 # netmap support probe
 # Apart from looking for netmap headers, we make sure that the host API version
@@ -4538,6 +4566,9 @@ if test "$vde" = "yes" ; then
   echo "CONFIG_VDE=y" >> $config_host_mak
   echo "VDE_LIBS=$vde_libs" >> $config_host_mak
 fi
+if test "$vmnet" = "yes" ; then
+  echo "CONFIG_VMNET=y" >> $config_host_mak
+fi
 if test "$netmap" = "yes" ; then
   echo "CONFIG_NETMAP=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index bf63784812..936fab8f04 100644
--- a/meson.build
+++ b/meson.build
@@ -180,6 +180,7 @@ iokit = []
 emulator_link_args = []
 nvmm =not_found
 hvf = not_found
+vmnet = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
@@ -191,6 +192,9 @@ if targetos == 'windows'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit', required: false)
+  if config_host.has_key('CONFIG_VMNET')
+    vmnet = dependency('appleframeworks', modules: 'vmnet')
+  endif
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -2886,6 +2890,7 @@ summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'vmnet support': vmnet.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
 
diff --git a/net/clients.h b/net/clients.h
index 92f9b59aed..c9157789f2 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -63,4 +63,15 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
+#ifdef CONFIG_VMNET
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+#endif /* CONFIG_VMNET */
+
 #endif /* QEMU_NET_CLIENTS_H */
diff --git a/net/meson.build b/net/meson.build
index 1076b0a7ab..196cf321a2 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -38,4 +38,5 @@ softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
 softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: files('vhost-vdpa.c'))
 
+softmmu_ss.add(when: ['CONFIG_VMNET', vmnet], if_true: files('vmnet.c'))
 subdir('can')
diff --git a/net/net.c b/net/net.c
index 52c99196c6..11bc6d289c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1003,6 +1003,11 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #ifdef CONFIG_L2TPV3
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
+#ifdef CONFIG_VMNET
+        [NET_CLIENT_DRIVER_VMNET_HOST] = net_init_vmnet_host,
+        [NET_CLIENT_DRIVER_VMNET_SHARED] = net_init_vmnet_shared,
+        [NET_CLIENT_DRIVER_VMNET_BRIDGED] = net_init_vmnet_bridged,
+#endif /* CONFIG_VMNET */
 };
 
 
@@ -1088,6 +1093,11 @@ void show_netdevs(void)
 #endif
 #ifdef CONFIG_VHOST_VDPA
         "vhost-vdpa",
+#endif
+#ifdef CONFIG_VMNET
+        "vmnet-host",
+        "vmnet-shared",
+        "vmnet-bridged",
 #endif
     };
 
diff --git a/net/vmnet.c b/net/vmnet.c
new file mode 100644
index 0000000000..3f25afd7e8
--- /dev/null
+++ b/net/vmnet.c
@@ -0,0 +1,34 @@
+/*
+ * vmnet.c - network client wrapper for Apple vmnet.framework
+ *
+ * Copyright(c) 2021 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "clients.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+
+#include <vmnet/vmnet.h>
+
+int net_init_vmnet_host(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
+
+int net_init_vmnet_shared(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
+
+int net_init_vmnet_bridged(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..f4519d194f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -452,6 +452,89 @@
     '*vhostdev':     'str',
     '*queues':       'int' } }
 
+##
+# @NetdevVmnetHostOptions:
+#
+# vmnet (host mode) network backend.
+#
+# Allows the vmnet interface to communicate with
+# other vmnet interfaces that are in host mode and also with the native host.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
+#             private IP range (RFC 1918). Must be specified along
+#             with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The subsequent address
+#             up to and including dhcpend are placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
+#           the private IP range (RFC 1918). Must be specified along
+#           with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
+#              along with @dhcpstart and @subnetmask.
+#
+#
+# Since: 6.2,
+##
+{ 'struct': 'NetdevVmnetHostOptions',
+  'data': {
+    '*dhcpstart':   'str',
+    '*dhcpend':     'str',
+    '*subnetmask':  'str'
+  },
+  'if': 'CONFIG_VMNET' }
+
+##
+# @NetdevVmnetSharedOptions:
+#
+# vmnet (shared mode) network backend.
+#
+# Allows traffic originating from the vmnet interface to reach the
+# Internet through a network address translator (NAT). The vmnet interface
+# can also communicate with the native host. By default, the vmnet interface
+# is able to communicate with other shared mode interfaces. If a subnet range
+# is specified, the vmnet interface can communicate with other shared mode
+# interfaces on the same subnet.
+#
+# @dhcpstart: The starting IPv4 address to use for the interface. Must be in the
+#             private IP range (RFC 1918). Must be specified along
+#             with @dhcpend and @subnetmask.
+#             This address is used as the gateway address. The subsequent address
+#             up to and including dhcpend are  placed in the DHCP pool.
+#
+# @dhcpend: The DHCP IPv4 range end address to use for the interface. Must be in
+#           the private IP range (RFC 1918). Must be specified along
+#           with @dhcpstart and @subnetmask.
+#
+# @subnetmask: The IPv4 subnet mask to use on the interface. Must be specified
+#              along with @dhcpstart and @subnetmask.
+#
+#
+# Since: 6.2,
+##
+{ 'struct': 'NetdevVmnetSharedOptions',
+  'data': {
+    '*dhcpstart':    'str',
+    '*dhcpend':      'str',
+    '*subnetmask':   'str'
+  },
+  'if': 'CONFIG_VMNET' }
+
+##
+# @NetdevVmnetBridgedOptions:
+#
+# vmnet (bridged mode) network backend.
+#
+# Bridges the vmnet interface with a physical network interface.
+#
+# @ifname: The name of the physical interface to be bridged.
+#
+# Since: 6.2
+##
+{ 'struct': 'NetdevVmnetBridgedOptions',
+  'data': { 'ifname': 'str' },
+  'if': 'CONFIG_VMNET' }
+
 ##
 # @NetClientDriver:
 #
@@ -460,10 +543,16 @@
 # Since: 2.7
 #
 #        @vhost-vdpa since 5.1
+#        @vmnet-host since 6.2
+#        @vmnet-shared since 6.2
+#        @vmnet-bridged since 6.2
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
+            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
+            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
+            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
 
 ##
 # @Netdev:
@@ -477,6 +566,9 @@
 # Since: 1.2
 #
 #        'l2tpv3' - since 2.1
+#        'vmnet-host' - since 6.2
+#        'vmnet-shared' - since 6.2
+#        'vmnet-bridged' - since 6.2
 ##
 { 'union': 'Netdev',
   'base': { 'id': 'str', 'type': 'NetClientDriver' },
@@ -492,7 +584,10 @@
     'hubport':  'NetdevHubPortOptions',
     'netmap':   'NetdevNetmapOptions',
     'vhost-user': 'NetdevVhostUserOptions',
-    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
+    'vhost-vdpa': 'NetdevVhostVDPAOptions',
+    'vmnet-host': 'NetdevVmnetHostOptions',
+    'vmnet-shared': 'NetdevVmnetSharedOptions',
+    'vmnet-bridged': 'NetdevVmnetBridgedOptions' } }
 
 ##
 # @RxState:
-- 
2.23.0


