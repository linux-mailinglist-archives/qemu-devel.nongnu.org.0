Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8C3AB620
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:38:24 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt9z-0004GX-9L
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5a-0004EN-Vc
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:54 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5N-0001LL-FI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:49 -0400
Received: by mail-lf1-x133.google.com with SMTP id a1so10677792lfr.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QqPxIjNblMrQIu0xDYDaDYdDXYQeUE40f8Xt34tguDI=;
 b=GF0U98IiSNtjJ+ttiEDzslfu2GvAntN81s5+ckT3wYAUlZUwE6yHoFqpbOaeonjx5g
 M1u2oR9Q75VM8Ao8+KkL0e6F8195Y+c+O6sJ/EKp6lcaa157B2EayFDbpWMbeohL771R
 vB4NYaok1A47eqU15bpnhYc3WTc9LKZ92RYyW8RDOYqLuwui7JNDXpWTWzBCrOjgbvnz
 IlpKrrJy1vhxLuEgBTRAupEE5OZypXufUQzg+NHXZ1WXOVgI/ex45B7x7TeZLAyB/fT4
 IfuDeyj/UqekqOYEMy4+vdHN1ajHpamRBzefYncjmS0qgedOYHd1N86s43TrjmegxsQN
 IX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QqPxIjNblMrQIu0xDYDaDYdDXYQeUE40f8Xt34tguDI=;
 b=rNLsmODykY55ZOuzy0gYm0wvzSNQTDwpivTaXSHFOLQojfWFS0XqFfHvt+dhalkeQm
 yswwnhkI0iVWewiKIfgGgfNl8fmUBXprGxzMD21cM1sY/9w04OyhHmmXbQ5UeSlnbbpD
 yLDyxLuuDpEJA3u6DEbWCRKboZk382KXKkoJdCO9OxqcbUahkfDFfCIibfUDwp9vR+86
 ZbrkpnL11/nttY54gRGL7sPeNUg932mauywSdjyoN7+wvrl2subItfsc3QjvbdaXydl0
 ORFiQkuSC1E3XDMM7E+QNpqkMWE9Uty0ZdNP/Ty2XRMFaCysTH7gIHSE/wyGVHU1JRPR
 t9CQ==
X-Gm-Message-State: AOAM5335Xb09JI3ohesHzCr/P/xGeBIenXHM+ei4jPjcZsFugkRw8pRJ
 dvRiFkdA127O+FkLvcsdr80iMPhosfxipNRy
X-Google-Smtp-Source: ABdhPJxRO8d/oJR3tqKmwLao8CbQCufDJVKuX/LNHIRZERchNSG3iPxGhd4CM7YOtlcDG7enzZEX1A==
X-Received: by 2002:a05:6512:3483:: with SMTP id
 v3mr4363408lfr.154.1623940414276; 
 Thu, 17 Jun 2021 07:33:34 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:33 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] net/vmnet: dependencies setup, initial preparations
Date: Thu, 17 Jun 2021 17:32:40 +0300
Message-Id: <20210617143246.55336-2-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Create source files for network client driver, update meson.build;

Add 'vmnet' into qapi::net::NetClientDriver options list.

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 configure       | 31 +++++++++++++++++++++++++++++++
 meson.build     |  5 +++++
 net/clients.h   |  4 ++++
 net/meson.build |  1 +
 net/net.c       |  6 ++++++
 net/vmnet.c     | 22 ++++++++++++++++++++++
 qapi/net.json   |  3 ++-
 7 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 net/vmnet.c

diff --git a/configure b/configure
index 8dcb9965b2..cdc171988b 100755
--- a/configure
+++ b/configure
@@ -307,6 +307,7 @@ mpath="auto"
 vnc="enabled"
 sparse="auto"
 vde="$default_feature"
+vmnet="auto"
 vnc_sasl="auto"
 vnc_jpeg="auto"
 vnc_png="auto"
@@ -1059,6 +1060,10 @@ for opt do
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
@@ -1871,6 +1876,7 @@ disabled with --disable-FEATURE, default is enabled if available
   rdma            Enable RDMA-based migration
   pvrdma          Enable PVRDMA support
   vde             support for vde network
+  vmnet           vmnet.framework support (macOS)
   netmap          support for netmap network
   linux-aio       Linux AIO support
   linux-io-uring  Linux io_uring support
@@ -3157,6 +3163,28 @@ EOF
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
@@ -5559,6 +5587,9 @@ if test "$vde" = "yes" ; then
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
index a2311eda6e..df254522af 100644
--- a/meson.build
+++ b/meson.build
@@ -173,6 +173,7 @@ iokit = []
 emulator_link_args = []
 nvmm =not_found
 hvf = not_found
+vmnet = not_found
 if targetos == 'windows'
   socket = cc.find_library('ws2_32')
   winmm = cc.find_library('winmm')
@@ -184,6 +185,9 @@ if targetos == 'windows'
 elif targetos == 'darwin'
   coref = dependency('appleframeworks', modules: 'CoreFoundation')
   iokit = dependency('appleframeworks', modules: 'IOKit')
+  if config_host.has_key('CONFIG_VMNET')
+    vmnet = dependency('appleframeworks', modules: 'vmnet')
+  endif
 elif targetos == 'sunos'
   socket = [cc.find_library('socket'),
             cc.find_library('nsl'),
@@ -2522,6 +2526,7 @@ summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'vmnet support': vmnet.found()}
 summary_info += {'build guest agent': config_host.has_key('CONFIG_GUEST_AGENT')}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
 
diff --git a/net/clients.h b/net/clients.h
index 92f9b59aed..ac19843aab 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -63,4 +63,8 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
 
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
+#ifdef CONFIG_VMNET
+int net_init_vmnet(const Netdev *netdev, const char *name,
+                          NetClientState *peer, Error **errp);
+#endif
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
index 76bbb7c31b..645c52ef6e 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1001,6 +1001,9 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #ifdef CONFIG_L2TPV3
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
+#ifdef CONFIG_VMNET
+        [NET_CLIENT_DRIVER_VMNET] = net_init_vmnet,
+#endif
 };
 
 
@@ -1086,6 +1089,9 @@ void show_netdevs(void)
 #endif
 #ifdef CONFIG_VHOST_VDPA
         "vhost-vdpa",
+#endif
+#ifdef CONFIG_VMNET
+        "vmnet",
 #endif
     };
 
diff --git a/net/vmnet.c b/net/vmnet.c
new file mode 100644
index 0000000000..f8b64e2a27
--- /dev/null
+++ b/net/vmnet.c
@@ -0,0 +1,22 @@
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
+int net_init_vmnet(const Netdev *netdev, const char *name,
+                    NetClientState *peer, Error **errp) {
+  error_setg(errp, "vmnet is not implemented yet");
+  return -1;
+}
diff --git a/qapi/net.json b/qapi/net.json
index 7fab2e7cd8..c5de234e2c 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -460,10 +460,11 @@
 # Since: 2.7
 #
 #        @vhost-vdpa since 5.1
+#        @vmnet since 6.1
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet' ] }
 
 ##
 # @Netdev:
-- 
2.23.0


