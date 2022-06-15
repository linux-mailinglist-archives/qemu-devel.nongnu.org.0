Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1178F54C9A3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:20:29 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Swd-0002hF-VZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Slq-0007dw-GI
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:18 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Slo-0007TW-Ox
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:09:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id gd1so11220178pjb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CzkQvOR6mj7YcW3f1bR2W0lXisdBjAOjyBnrfHspMUo=;
 b=kuw7vK5lFt+G7x8AWx29qHblGnWN/jbMzpB1ZvVpbPZ5UjGCtL1FuGcDPcrqn3Qd1w
 cywo5Wz2bhD2zEmyPD2Cp0fWjoD50ie2TjVVuBZ0hTArUyJldDJtYZzJ6iY/twoBi5OG
 /1c2EMJPCj9pQcwjUG/NeNOZH9FLUGspnRxkZL9qcqFZnNYLrTMZeCnbMFOFQrL3K4eo
 NI3weadVETdD1BqCoLGRygIo4kdpI5gR4krcLVEJsJEtsMFgoLXiPXcx/BSU5sVsD1kV
 hDqhQp7pv4XuFl/JTBRVj8hf4prSU8CPLwRs0o9lezXkC5AR/+TlZY+9fOh+XuP8KblR
 UKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CzkQvOR6mj7YcW3f1bR2W0lXisdBjAOjyBnrfHspMUo=;
 b=SbIWQn1Mg8em/4ryMJM0HVwWFPLqtcZHZq9glUsY6y7whzSMi0EtwLLKTUxsbT5mu0
 irY1Bm8LsbqBuSG9Srnvtmy8zkKJjc4v2I1zvpCN1YxuDXAgF9CSJwoXbS82DXCVpwi5
 ZwFLF1ZVqrw1t586yDZImPI2gO8YWt6kF0vyNIjFPds4662dkcrTEgSWTNVfunWqRwfY
 1UcY8GeDd3fuoiR0QkZZ86Ye7rDyquMNh1bYlvpn5nBsFBNEK/9b6MS/jtGzZzsBvXRC
 68PHVDJfvUd02XlBZCAa1BGPQ5Rcp2B05W4O1bcriZLK61ZnX6/aJHbWZJVh4qMXsEk2
 kT7Q==
X-Gm-Message-State: AJIora/Hhf9L5+jVm+q7U5Oo0NLfkvF7Yw8PWwj3Xa9G7li/iKvKtVAX
 XI9ehGx9uyjRcc1PisqoeXo=
X-Google-Smtp-Source: AGRyM1sE2+pp0l+mWxMeccjU9CpsmLg3As1JMbc59oXBa7awMBOT+mxzzSN0ofPpNouXo3GaJGXRNA==
X-Received: by 2002:a17:90a:de90:b0:1ea:7efe:e59a with SMTP id
 n16-20020a17090ade9000b001ea7efee59amr10002075pjv.115.1655298555547; 
 Wed, 15 Jun 2022 06:09:15 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:4126:b1a8:8fce:1a8])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b0016392bd5060sm9278448pln.142.2022.06.15.06.09.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jun 2022 06:09:15 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 4/4] net: Use bundle mechanism
Date: Wed, 15 Jun 2022 22:08:45 +0900
Message-Id: <20220615130845.32674-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220615130845.32674-1-akihiko.odaki@gmail.com>
References: <20220615130845.32674-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 include/net/net.h | 2 +-
 meson.build       | 4 +++-
 net/tap.c         | 6 +++++-
 qemu-options.hx   | 4 ++--
 4 files changed, 11 insertions(+), 5 deletions(-)

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
index e17c1ebc1c9..909c8a3c63d 100644
--- a/meson.build
+++ b/meson.build
@@ -1686,7 +1686,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('prefix') / get_option('qemu_firmwarepath'))
-config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_HELPERDIR', get_option('libexecdir'))
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
@@ -3575,6 +3575,8 @@ if have_tools
                dependencies: [authz, crypto, io, qom, qemuutil,
                               libcap_ng, mpathpersist],
                install: true)
+
+    bundles += { get_option('libexecdir') / 'qemu-bridge-helper': '../../qemu-bridge-helper' }
   endif
 
   if have_ivshmem
diff --git a/net/tap.c b/net/tap.c
index b3ddfd4a74b..ea013ca3873 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -507,7 +507,11 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
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
index 377d22fbd82..1959db01061 100644
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
2.32.1 (Apple Git-133)


