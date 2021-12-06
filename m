Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24146A1A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:44:38 +0100 (CET)
Received: from localhost ([::1]:34382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muH6S-0007Qz-U7
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:44:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muH4d-0004iw-8G
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:42:43 -0500
Received: from [2a00:1450:4864:20::230] (port=37808
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muH4b-00075I-QR
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:42:43 -0500
Received: by mail-lj1-x230.google.com with SMTP id k2so22144774lji.4
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 08:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxyIn3tzuHg3Cc5smDSxhuZu5Nmeg1/uO+PyEusnahs=;
 b=Pz0DBo/+AIonKSgZnbfylmT8pmeehB0bu6xj07lVmYiqZoc1PcmR3A0VVSqdeMXhjV
 k3Ehms5B96ReJHyndux3ye9VF840FcF4fffi1HldNJfjk7BHvK/keyoPYRIwGuGEwvq9
 99ciyWUS5QtJhKmv0hB3VDS2awimeyyKPGFZqDHKNLY1nrGyngYfISP95QewdGhcDv/o
 2vdAmQYeyGi49SAFM/DIef2WuKxXXUDVD9hDCdgSl+GoHgXE4h42ttFdvfQiLzFBZpXL
 YzrnF7TDAOKnw2MP1TcHqG2TFlZsVlR16kl6UKfdjTRk9KXu/lSWcWc9YMiQ2ILMBSMi
 aZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxyIn3tzuHg3Cc5smDSxhuZu5Nmeg1/uO+PyEusnahs=;
 b=L4mW1DHAEYfyouTNFe2xv/3WL6rdVuUys6UBbxNZChol7vSTLtPemCuwz0NZm0Xa4h
 N9ADCU98EisTnWVGNR/iJZzWR6OeAX81OLoMvP0wVwa2WZoqeQ2eZ1dF8FXx0GisTjQR
 0PxEgzXLh+adV0mAzJgH299apd14tVtsvrz7HZkP7GBj1B3zya9T2g4uYbZwC/n3DWl2
 /N6wh4zFuwp9+gTgMKW1f/yUr47M9Ha1euWzS9lH0jfwady2ATOopLbeRy/pP9fYphWC
 A5hiHmI9bT3Os9QRQyrSyNaMBTFlfKiFzVEfG9UtPL1Fppj1ASSBpjGwOMMOeApUbwog
 8zXA==
X-Gm-Message-State: AOAM5328drsNByZ8GC2pprdlrLq92UK2zdGM+ei0bkub5FIHX9ptSVy+
 btqkZPru3ZgxAa1sPaIfJTUXRimn4MZf7ifF
X-Google-Smtp-Source: ABdhPJwZ6DnSoQPS1fOIkq7D1xyMA6oEynZo7Lh1PA6uYU4zpYhaFhbllu7NzeZoq7wLM6b6tBjO/Q==
X-Received: by 2002:a2e:b816:: with SMTP id u22mr37472918ljo.51.1638808959938; 
 Mon, 06 Dec 2021 08:42:39 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id e11sm1401809lfq.65.2021.12.06.08.42.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Dec 2021 08:42:39 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/6] net/vmnet: update qemu-options.hx
Date: Mon,  6 Dec 2021 19:42:22 +0300
Message-Id: <20211206164222.11027-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211206164222.11027-1-yaroshchuk2000@gmail.com>
References: <20211206164222.11027-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 qemu-options.hx | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..1ffa5eedd5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2677,6 +2677,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_VMNET
+    "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
+    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in host mode with ID 'str',\n"
+    "                isolate this interface from others with 'isolated',\n"
+    "                configure the address range and choose a subnet mask,\n"
+    "                specify network UUID 'uuid' to disable DHCP and interact with\n"
+    "                vmnet-host interfaces within this isolated network\n"
+    "-netdev vmnet-shared,id=str[,isolated=on|off][,nat66-prefix=addr]\n"
+    "         [,start-address=addr,end-address=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in shared mode with ID 'str',\n"
+    "                configure the address range and choose a subnet mask,\n"
+    "                set IPv6 ULA prefix (of length 64) to use for internal network,\n"
+    "                isolate this interface from others with 'isolated'\n"
+    "-netdev vmnet-bridged,id=str,ifname=name[,isolated=on|off]\n"
+    "                configure a vmnet network backend in bridged mode with ID 'str',\n"
+    "                use 'ifname=name' to select a physical network interface to be bridged,\n"
+    "                isolate this interface from others with 'isolated'\n"
 #endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
@@ -2696,6 +2715,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2718,6 +2740,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
 #endif
 #ifdef CONFIG_NETMAP
     "netmap|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,option][,...]\n"
     "                old way to initialize a host network interface\n"
-- 
2.23.0


