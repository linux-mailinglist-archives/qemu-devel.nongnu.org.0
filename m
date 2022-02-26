Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC884C5602
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 14:02:05 +0100 (CET)
Received: from localhost ([::1]:47760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwi4-0004k7-Ts
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 08:02:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSU-0001QC-De
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:46:02 -0500
Received: from [2607:f8b0:4864:20::62c] (port=35809
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwSR-0003Ku-Rn
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:45:57 -0500
Received: by mail-pl1-x62c.google.com with SMTP id i1so6989248plr.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5RcX9KNvZOz10vLgkZvfBQaI33Kp2lfBYnofxB3uzVI=;
 b=Z79MmeE+aAjLYAOaXJobzlMemKMNFqBgiH51ZeCoUfEMqnq8+aejtUFjV2FWvEWdL6
 n6k9+Y4PpWlO6Qc57RGzScpmXmx8hOMpX3wWbs7bOdW5XI2RNH2uZjAKrBcHMPOLl/8F
 emADkccSmJxjfqN0y/Wc7KUPEcMAJEilt/rkUeP/Gbd1m1P/COOfPjWtw4+L8yvhckYc
 I7I+DqZs57mVy2S4OP7G+CnXGbVGe+IFCEYLKencdyZgZU1Lh5Magp89TDz0RFYkyX/t
 HGsMWyhdyDryeqQmEyNLvtv7mZvgnQUmsw6kzh1titWNBi0eEHhAsEduv+I9PTfTJltq
 zqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5RcX9KNvZOz10vLgkZvfBQaI33Kp2lfBYnofxB3uzVI=;
 b=50JdHSsfKiWY7PVZvca39MxsPQ1J79boYAIMtG+oxaEEc0s3QoZpgHPlboHsELKq77
 GtRE/U3NahQL4NwqwmxYgNz1Gkn3FBT7DoQoMcViF7n9KnoQe1MrOvKQX1+4n1Ffrcb9
 7wFfxRgwwbRytF9Gx2envFaHwDPbL0Nud2FKPs7a+I99Gdr6Y99JdRFNznlzjeRpVrb7
 ibG80hfbPMSuxkjSpQ+AkvcpX6hqvBlGxC2P3dTdYcF8P+gAeDmx2H9P3tOIaoc2/aAR
 NG2hooPrDojGaw7mjdJTl9MCss9xdipu2K/CoMVFKrHrvg9SdQyofRZDTE5FPoWzU3qZ
 vRIw==
X-Gm-Message-State: AOAM533CPL1QIseR8Vjv2GQVxH/NZezDysV3nwAULN2RXoYB81LATIsw
 XyFsG+5hOAmkyL8+UfRsNnm64NmLoUs=
X-Google-Smtp-Source: ABdhPJwDWoPhfq2+8gE2tTbLQO7xBYai6EkDs5RBGLlvrvJOVzJM1TayVZeY2pJ04tFGbLCPN0kcKg==
X-Received: by 2002:a17:90b:2496:b0:1b9:a6dd:ae7 with SMTP id
 nt22-20020a17090b249600b001b9a6dd0ae7mr7760798pjb.35.1645879553799; 
 Sat, 26 Feb 2022 04:45:53 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a17090a438400b001bc6d52de70sm11725653pjg.24.2022.02.26.04.45.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:45:53 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 4/4] net: Use bundle mechanism
Date: Sat, 26 Feb 2022 21:45:35 +0900
Message-Id: <20220226124535.76885-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226124535.76885-1-akihiko.odaki@gmail.com>
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure         | 1 +
 include/net/net.h | 2 +-
 meson.build       | 1 +
 net/tap.c         | 6 +++++-
 qemu-options.hx   | 4 ++--
 5 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 80d36a85bc5..63df8f5886e 100755
--- a/configure
+++ b/configure
@@ -3100,6 +3100,7 @@ done
 
 symlink $source_path/ui/icons/qemu.svg qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
 symlink ../../pc-bios qemu-bundle/share/qemu
+symlink ../../qemu-bridge-helper qemu-bundle/libexec/qemu-bridge-helper
 
 (for i in $cross_cc_vars; do
   export $i
diff --git a/include/net/net.h b/include/net/net.h
index 523136c7acb..4a5ed27a4b7 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -228,7 +228,7 @@ NetClientState *net_hub_port_find(int hub_id);
 
 #define DEFAULT_NETWORK_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifup"
 #define DEFAULT_NETWORK_DOWN_SCRIPT CONFIG_SYSCONFDIR "/qemu-ifdown"
-#define DEFAULT_BRIDGE_HELPER CONFIG_QEMU_HELPERDIR "/qemu-bridge-helper"
+#define DEFAULT_BUNDLE_BRIDGE_HELPER CONFIG_QEMU_BUNDLE_HELPERDIR "/qemu-bridge-helper"
 #define DEFAULT_BRIDGE_INTERFACE "br0"
 
 void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd);
diff --git a/meson.build b/meson.build
index f7e64a74545..95ee0a7c14e 100644
--- a/meson.build
+++ b/meson.build
@@ -1472,6 +1472,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_HELPERDIR', get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
diff --git a/net/tap.c b/net/tap.c
index c5cbeaa7a2b..3225d91ae00 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -508,7 +508,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = find_bundle(DEFAULT_BUNDLE_BRIDGE_HELPER);
+        if (!helper) {
+            error_setg(errp, "birdge helper not found");
+            return -1;
+        }
     }
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) == -1) {
diff --git a/qemu-options.hx b/qemu-options.hx
index 094a6c1d7c2..a5c03e2caf3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2665,7 +2665,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
     "                to deconfigure it\n"
     "                use '[down]script=no' to disable script execution\n"
-    "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
+    "                use network helper 'helper' (default=" DEFAULT_BUNDLE_BRIDGE_HELPER ") to\n"
     "                configure it\n"
     "                use 'fd=h' to connect to an already opened TAP interface\n"
     "                use 'fds=x:y:...:z' to connect to already opened multiqueue capable TAP interfaces\n"
@@ -2684,7 +2684,7 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev bridge,id=str[,br=bridge][,helper=helper]\n"
     "                configure a host TAP network backend with ID 'str' that is\n"
     "                connected to a bridge (default=" DEFAULT_BRIDGE_INTERFACE ")\n"
-    "                using the program 'helper (default=" DEFAULT_BRIDGE_HELPER ")\n"
+    "                using the program 'helper (default=" DEFAULT_BUNDLE_BRIDGE_HELPER ")\n"
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
-- 
2.32.0 (Apple Git-132)


