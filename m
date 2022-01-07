Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2948757D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:28:51 +0100 (CET)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5mUM-0003zA-Se
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMo-0001uj-G8
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:02 -0500
Received: from [2a00:1450:4864:20::132] (port=44704
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n5mMm-0001ef-UL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:21:02 -0500
Received: by mail-lf1-x132.google.com with SMTP id g26so13827536lfv.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=oAzDjNTe/m7/Igp9H8V3uu797xVOKQLajs3T/ZED4yuZzCzQ8y8Bm2LcWl/7S66Qcl
 vpJubYW/ejW9RuozlmbyegIPwgWDQEdQygWdUF6NeCahlwY1ObkLiMjY9x3xYFyRfcs4
 XTHruOxN7zrXJH1PAppS027HF5PC0tIDYp4nn/tTCEGbQjD3OV5tXXH+7k0dTrUTHyxA
 T0m4BVHSdbW7F+M3wt+NeN5Jj+QuO4pTXaJ9WkgcYSm6qzS1y4JPqJ0J1U2aLSANVqGR
 8Unr+k4e470bCtb1z3KyEOkk4Zw3zv0D3HK6HaBNWLRcpSQzcipMt/0HkwxiokfUNUG1
 4MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=Kb0jRra2Axx6DJF30PcdbTQ2AANBD9Ln921hkkv/GQ7TRpRPp4D5A2kLs1kejUDY6v
 hxAW0fMi9M3xRH1lqpat/I365+XyvpIBRMzM/M2cs5/Lnked6YnBJFunkkQGT6H8codo
 fVUyW3qglQSK3IzCyx3bz67UQCgp98kuiqBLJQw52j2J7FBYdKoJnEm6e7L6D5mAkTBe
 HF7cI0z2OCrctcB37Eb5U2etUjGzovss5GWVmKsie9PJ5z+smskYD5gHoaR8jiye6HjH
 D+vz9zVScbcX/XiUbbPROQgkjHq3ckhTssZ3/pfxj75v6mn/HTnQPjYAtUMgzy70OJXu
 D7kw==
X-Gm-Message-State: AOAM532WpdWgAVYssXLqBL3VOUF7QumKuPD9LvWCGJO+R1hAtJNiAoV5
 7FE8ieXpGLskzWW+BCsZB8emtqZ9C3M=
X-Google-Smtp-Source: ABdhPJzzT94Qhl3uPOPzwv8vEJkph+ri+OKa9MZyJKd8cxSFs316ASvCpLPgfaYc/RL3134RUC/58Q==
X-Received: by 2002:a2e:9a91:: with SMTP id p17mr45781147lji.154.1641550859139; 
 Fri, 07 Jan 2022 02:20:59 -0800 (PST)
Received: from localhost.localdomain ([62.140.238.4])
 by smtp.gmail.com with ESMTPSA id p15sm524259lfd.69.2022.01.07.02.20.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 02:20:58 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 6/7] net/vmnet: update qemu-options.hx
Date: Fri,  7 Jan 2022 13:20:18 +0300
Message-Id: <20220107102019.37013-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
References: <20220107102019.37013-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x132.google.com
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


