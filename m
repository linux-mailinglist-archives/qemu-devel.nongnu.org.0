Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB3E46B8F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:26:44 +0100 (CET)
Received: from localhost ([::1]:58120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXgJ-0006ZJ-IK
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:26:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYn-0001pu-5Y
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:57 -0500
Received: from [2a00:1450:4864:20::134] (port=38802
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYl-0007Db-Jt
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:56 -0500
Received: by mail-lf1-x134.google.com with SMTP id bi37so32447243lfb.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KxyIn3tzuHg3Cc5smDSxhuZu5Nmeg1/uO+PyEusnahs=;
 b=miVdJoomoVLXKpdPMc+jlhD1VTe2WW1GXyqopnEiBrK4yv41ysiLSTcIb4tZ/QQiZv
 bCL+a7X7C4r6i1NtRZHQ2dLlNXLrUsQIAbibLsgipOO5Z8IgfY2Cjrc43D//+DJHrenc
 EhsBQt7xp456mb0XjYwuUvHp9WCv/PYXxSm6i6nZluhjectoust54Qw5akvyT5QIjZAi
 ikjxNwXeD0ePLDvj+KIYX+CZ6GC9q/5CAXm7EtUS8GK8YzQD8yfy9WV1EtJHXCJZT/D9
 VKyq5aCXWS6EtUbKjQ/5f0AM1umzrG2KanpuTv2ZzuYEwUlnaW8SAmew3znq34f4Jfeo
 4rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KxyIn3tzuHg3Cc5smDSxhuZu5Nmeg1/uO+PyEusnahs=;
 b=Kda/IrWdAk+GvmtuoryiWGeU+YUKt+tWsjDtb5ZCHSulGS1UiXYaByFpJ2LBQcHiJe
 5Xy16b3cnVVKtlLOXvlqCh1v717m89jPc92B0QIzi/0/wzRupaH09Dt1X5zNloEvMTWP
 rnxuy+SHHiVVLcB8ng0ZomzXyLIa32N/Jtuv12kaq3Tc0youuka8A06M9tFoWl89EmMq
 kVwdRRCqPYVVLVxW42X1t42KlRAdDTBmAYX7gE3HYnohtLITBcFOcnUEGFB5SXIRV8xH
 cpXAwL5kW8ZQwFU5uAhCUUlmGiWXPnuw/N3vBMIfO+RNyep1GAOyb709wP4YbLlOdsHJ
 qmtw==
X-Gm-Message-State: AOAM5305My+czn1aNoaoFwglbar4jLBVP/ejPQIdvLHfeZxSSc3sKO5o
 SuRCZAh6N6c9R5xDj3F4PiomY1Vf5CqZZA==
X-Google-Smtp-Source: ABdhPJx7AsH8XRqe9rVItPMtMKCr1wIqZfstVk8GedL3aTfJ8ERGFXDxDLnz9Yqrl4nra+d4Qs3/rQ==
X-Received: by 2002:a19:7512:: with SMTP id y18mr8279231lfe.236.1638872333682; 
 Tue, 07 Dec 2021 02:18:53 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:53 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/7] net/vmnet: update qemu-options.hx
Date: Tue,  7 Dec 2021 13:18:27 +0300
Message-Id: <20211207101828.22033-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x134.google.com
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


