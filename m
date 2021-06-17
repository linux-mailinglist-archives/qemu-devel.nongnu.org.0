Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF83AB61E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 16:38:18 +0200 (CEST)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltt9t-000411-P6
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 10:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5e-0004EU-AK
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:58 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:40743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1ltt5U-0001Nq-MW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 10:33:52 -0400
Received: by mail-lj1-x229.google.com with SMTP id x14so9321098ljp.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5w2yufnx/vm54xPNes++PujG3U/PMHkDseAnV/HU/4=;
 b=SLIA0Z1OQDkp2vZXXqOddCscQ1SX8EmkXaqYfFliCK0ieDQPijykAcTLLypubJz5cn
 zdZ7UUOLiTKDffmxwfbXyMhca337YcxPJGSpLR52cIFZKD306U8HPXhkFpE0FI8MDNfN
 v8T9ef7e7SrOdxMhJecNRlwulRkQHwJekFle1JZRhcYrAKW1UWva6jpqLbaC1S20LfNc
 COK2MDyxnhAKus5+CPeeJgTPaoBrrs+GUHsiejucEQ7QVOgU5v8oPNi6NW5l23F/DHBm
 SeDIxtqIq7Kaa8vfny0R0N4qQvb6z6dpY+vc/Ax8zCdlpxa3e488KtKqf9eaAY/xPA1h
 bTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5w2yufnx/vm54xPNes++PujG3U/PMHkDseAnV/HU/4=;
 b=PcZlzbYA6Q8ZjGIeXca7IprbAmPlMU7k53NfU5cgujZQGZpPVlLep90KVxe1LwXsIe
 2jB5gQm5wcoEuYRKBanTwi5y+UJEJeAdjHt2mF68tR/JX958U078rh6NKN4UUvDpVQ9A
 +NvFVb6WOe98M5j18RIQGTQtwMOJXtetlmoYir/zXifKMUos7g6PqcH0esix8WbJ3p41
 CioR0/mOonI1Pm81V5ZOXL70HrFq7LVpa5PSq7fYg6hlDqIDyO0a2blB3A6+clww7fui
 IKIWfKpfcvlo+Jwh6cy0hGYd+J7GxPATMedDXeOOgX+vSfmhMmDCd9NMKl4Hk3V/pIK8
 atrA==
X-Gm-Message-State: AOAM531anSx5iDQaoRz47nV2erCFO2HbLQ9DmZ3HfldxpqnApl3oHEWt
 rSftOoNjqoumwPoQsYRg3PILLaeksHzQCMtA
X-Google-Smtp-Source: ABdhPJzLSD7rczqqZtNkK2C8i+KbTB5ZDxjpuBuCJLEA/gOjPsHqRSwO6RPm5n309vElfl4uTBZvmQ==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr5014832lji.477.1623940419254; 
 Thu, 17 Jun 2021 07:33:39 -0700 (PDT)
Received: from localhost.localdomain ([5.18.249.207])
 by smtp.gmail.com with ESMTPSA id d9sm597406lfv.47.2021.06.17.07.33.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 07:33:38 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] net/vmnet: update qemu-options.hx
Date: Thu, 17 Jun 2021 17:32:46 +0300
Message-Id: <20210617143246.55336-8-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
References: <20210617143246.55336-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x229.google.com
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

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 qemu-options.hx | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..631572f2d4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2582,6 +2582,17 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_VMNET
+    "-netdev vmnet-host,id=str,[dhcpstart=addr,dhcpend=addr,subnetmask=mask]\n"
+    "                configure a vmnet network backend in host mode with ID 'str',\n"
+    "                configure its DHCP server and choose a subnet\n"
+    "-netdev vmnet-shared,id=str,[dhcpstart=addr,dhcpend=addr,subnetmask=mask]\n"
+    "                configure a vmnet network backend in shared mode with ID 'str',\n"
+    "                configure its DHCP server and choose a subnet\n"
+    "-netdev vmnet-bridged,id=str,ifname=name\n"
+    "                configure a vmnet network backend in bridged mode with ID 'str'\n"
+    "                use 'ifname=name' to select a physical network interface to be bridged\n"
 #endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
@@ -2601,6 +2612,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2623,6 +2637,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


