Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1A54BC8F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 23:12:34 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Dpx-0004Yu-AN
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 17:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dli-0005Zk-V1
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:11 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o1Dlh-0007lF-64
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 17:08:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id g8so3562788plt.8
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 14:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5OEPrwlGXS58p8HvgS1ILRM7xBQDf6JCfGW6ElXKY/4=;
 b=qSEAVT6CFgkqFdi7Jb/1VcV9K/DZtnwpHDQ56EsFUgX1CMYijXfwTjk0ow6r8VPE1v
 xViErMxpHM6I5LXLrE/K2pR+mFszU2x8o39tCaM97rOeudmLi674MPHufqodxmTdW7aE
 Idnea95DKHa77XS8YqN2CkBKMY5BywBjjLRBl1Yb63KabnPfOH7CvTHdLyqB42oXgpvr
 Qp94hFo57pOns2FfvOM0AXlGp/Mb/b3ovdDzlFdCSr8axX7Xd4n9BDa3ZN7TWy/XUpgf
 Cvl7QCsx5NXslQVpviN3QJq064qvb7E3yKEolkc6Jd8CiPfoI4vAB3hsPL3K/gruExsE
 JZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5OEPrwlGXS58p8HvgS1ILRM7xBQDf6JCfGW6ElXKY/4=;
 b=rzQzGZq/SMx0y7Z4OjJRc5kS6ySipixl6em/phpeZ+UO7H5dGTQNiFSNbuhqPPjCFu
 OkAQLxYAEjdrfV4QGzi4X2gM2ZH3YcCoIeojA76o4nsuJSb2IA331k4mhh7QOrpz4cJv
 7r43yZU6OAg8Q5/P8Gb+5xKBy6cg2i+6lv82RzRKXQVJzcP9S8tWCr+v6dauzK8jQTCb
 n/kg5FbA3vRy29DvELWoVsTiN41L6Rt03hKhD/HNsWgY54IK0vBusxRnqyr0jWVKEHz6
 1LaC7gO58Ed74BiXvQZ0Xqt5frX1dD7EVekCBogqCAZYNlTxk1rw5H11IdwewqfUprSx
 SMkQ==
X-Gm-Message-State: AJIora/+X1PJ0zQP8JY6SJ6fAqk+2xQQs+t7ftUEcxnZU+jW9sklVLcq
 s9jiLHa/jYM+iaBwyCYzOgg=
X-Google-Smtp-Source: ABdhPJxiWu1PElqEKJ0+36/mMBHLqJb4PCBRd1kJEKpte6Ocnr0c2OQnpuhQ0qEfa6GjX+q1Lacn9Q==
X-Received: by 2002:a17:902:6b89:b0:168:cf03:9e63 with SMTP id
 p9-20020a1709026b8900b00168cf039e63mr6162562plk.46.1655240887790; 
 Tue, 14 Jun 2022 14:08:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d5aa:1806:cce3:7773])
 by smtp.gmail.com with ESMTPSA id
 h65-20020a62de44000000b0050dc762813csm8129456pfg.22.2022.06.14.14.08.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Jun 2022 14:08:07 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v4 4/4] net: Use bundle mechanism
Date: Wed, 15 Jun 2022 06:07:46 +0900
Message-Id: <20220614210746.78911-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220614210746.78911-1-akihiko.odaki@gmail.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
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
 meson.build       | 8 +++++++-
 net/tap.c         | 6 +++++-
 qemu-options.hx   | 4 ++--
 4 files changed, 15 insertions(+), 5 deletions(-)

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
index e7b385eaf34..72d006f228e 100644
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
@@ -3573,6 +3573,12 @@ if have_tools
                dependencies: [authz, crypto, io, qom, qemuutil,
                               libcap_ng, mpathpersist],
                install: true)
+
+    run_command('mkdir', '-p', qemu_bundledir / get_option('libexecdir'),
+                check: true)
+
+    run_command('ln', '-sf', '../../qemu-bridge-helper', qemu_bundledir / get_option('libexecdir'),
+                check: true)
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


