Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB21048C5A4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:10:40 +0100 (CET)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eKl-0000S1-T9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce9-0006nD-MH
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:35 -0500
Received: from [2a00:1450:4864:20::134] (port=33601
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7ce5-0003iX-Ii
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:22:30 -0500
Received: by mail-lf1-x134.google.com with SMTP id k21so7657465lfu.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=JkbJRAFjHVb7fK1g4s6xMAyt8KSC6o/wN/36cxTW4YT68915PiTQxcxg4rzQWvstI3
 RZKo3WgkpHG4Hl8p3ELEgymYyTond7LRrOcyNaeIe2jKv7+DENNizRZ5aiYy8ZJ8iqS5
 3/bta+V96D/+qkNofduhmzZe0vqtg+Ne6dr4lWiOd4u5GrSFGrWcrHM/tzH/ALUKy2Ie
 CM3hCkJgmPaQLs9zqiVCkTHXOsANR3hmzept7qqFCQL2qo4pjAwU7MfyeTDwABxOpkRR
 vFfvwC8bvqnSuPm5Uz1C9KXExbLCeEsCK4ht4oL9MRHLMOT99ijo9t96fNcHULpID52Q
 ELTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=B34FYUKbfivtJIs1hYzoMGZ+f/df0vxEgUnRVA2vXtcWzVKx5TD/oM0CGHe0FeowAX
 V7GpGul13l7owox+11LnRjP0sMCCnwuBzEQ5iPC9OdzoBcY6WCYtzv8mQon9aU2JB9WO
 BUNkWryKarr06E3jbvxlOT1FwxQcgAndTB1lTp5vo+jxsq2DLdHMgBLdESdnA/8Xoqpm
 nv5k2Pldm0Ch8U8JRYCT0SQxFdMxI6BkibpmSsMej708kX6Xz+aZUxi+deXUdHBVdxoN
 YZ1wcwrvaY5M4bRUKcgI8kgg7xKVocpKVcL0+iGJd3qPLQLx0GCoTSGvbNXAKszthW+u
 Q9Fw==
X-Gm-Message-State: AOAM5327vsZK2DfGwmKjFSiTiJeI2lDpc8veq7VY90rWV1K2tFQxIUQL
 JcFy1Kjw6a934T43mS7wJ9IKwAjAlk6thUkw
X-Google-Smtp-Source: ABdhPJxR16vZYYddgbFTN+RXEzZFkq39pAYxT+/UHOa4KcB6ZV4K+Cr26xs4IbPbCenuhhXkNk4iUw==
X-Received: by 2002:a2e:bd10:: with SMTP id n16mr6205349ljq.401.1641990146883; 
 Wed, 12 Jan 2022 04:22:26 -0800 (PST)
Received: from localhost.localdomain ([77.234.205.2])
 by smtp.gmail.com with ESMTPSA id u7sm1623035lfs.218.2022.01.12.04.22.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:22:26 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 6/7] net/vmnet: update qemu-options.hx
Date: Wed, 12 Jan 2022 15:21:49 +0300
Message-Id: <20220112122150.37049-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
index ec90505d84..81dd34f550 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2732,6 +2732,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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
@@ -2751,6 +2770,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2773,6 +2795,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


