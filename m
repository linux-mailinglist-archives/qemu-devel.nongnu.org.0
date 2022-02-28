Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED04C6090
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 02:04:07 +0100 (CET)
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUSM-0006cR-CT
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 20:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUMA-0005Li-Ap
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:42 -0500
Received: from [2607:f8b0:4864:20::102b] (port=56084
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM7-0004ev-VN
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:41 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gb21so9679674pjb.5
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3yYCKAK4PyDr13xPU5WQLsZEQoxfNSDnsUZjZq2iaU=;
 b=Ya52YTASGIjYLFKIAsiAIZpBbfpLxJhaqumJfuvOsgNQMBEviQZ9wVeaskv6rW8M4G
 5VVB2aZZVb4wVO7IWkcpED3kpKPw1vXEkX/8QStJVrGVqS0IpSYkPDotqEK+d+MAfavp
 +SmdNfV6qp52jFI1yeK5F8wSrv8P2mJMNHV9SdVi76HnN/hR/b0L8eYdXOGKvJ3cn9km
 +2qQbf7PU0QgDtSpPGKDawNZDCptN6Ss6z8pU6LH+m/8VxEIz75O5VH2ISDT12Czb514
 xBm9+ukSOaac5c/T3EhAwIJo9Jeczy8Ew/LXQzWYV2s4V+0QRZNvY2RNH7g1QD7jp2qV
 z2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3yYCKAK4PyDr13xPU5WQLsZEQoxfNSDnsUZjZq2iaU=;
 b=3Mr3Lq1ytZeWaUvy7pc5f2JJp1tmH0JcsWFBe3va++yYGV7Y70R1haGS/0gM+pTPng
 1mNRXlAu7psdwVGEYdn3gqVwD+3+tuiGWLQ00pciFIjjyqWkRhwCyKXX3QeVNBqd7U0T
 u3B/m5mpRHyPjX82eRNNx3gwYIDBi49T5cSvdfWUvEbPPSbITrlvwXeVgHcbtNMDfEcm
 Xs2uFVTIBjdHdOH116Q3yvl6m6F6ta0YuuQQkbde3+rFELzJlQe6ZXZ0mN0HojaHfR7d
 UU5g6T5ZhuLVt37ncbnwIa45NF7cjpV7enbQUrf888Kt+ilJMiF6zzdjO3ot+2ldu9pd
 PjKQ==
X-Gm-Message-State: AOAM5337M+z5iqsdNOzU/rVXmJG1kVG8JLra93/V/TYDB7T3WycPsQSQ
 Mc5EDNGXbHn8NJ+ndgh01jwsNwrCCd4=
X-Google-Smtp-Source: ABdhPJwAHkMgy/bxldgAJFLOZkzVRvqL3m7Uf/QexVVgkLt+229SOh+MFrw+E8zMskAxbOXrW+SjdA==
X-Received: by 2002:a17:90a:ab93:b0:1b8:831d:2ee4 with SMTP id
 n19-20020a17090aab9300b001b8831d2ee4mr14052734pjq.123.1646009858504; 
 Sun, 27 Feb 2022 16:57:38 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:38 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 4/4] net: Use bundle mechanism
Date: Mon, 28 Feb 2022 09:57:10 +0900
Message-Id: <20220228005710.10442-6-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228005710.10442-1-akihiko.odaki@gmail.com>
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
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
index c5cbeaa7a2b..91415cd376c 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -508,7 +508,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
     sigprocmask(SIG_BLOCK, &mask, &oldmask);
 
     if (!helper) {
-        helper = default_helper = get_relocated_path(DEFAULT_BRIDGE_HELPER);
+        helper = default_helper = find_bundle(DEFAULT_BUNDLE_BRIDGE_HELPER);
+        if (!helper) {
+            error_setg(errp, "bridge helper not found");
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


