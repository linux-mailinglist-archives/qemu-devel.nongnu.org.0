Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DF48B94E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 22:23:00 +0100 (CET)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Obc-00006U-33
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 16:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTl-00068F-GI
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:53 -0500
Received: from [2a00:1450:4864:20::12e] (port=44705
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n7OTj-00031k-UM
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 16:14:53 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o15so1039673lfo.11
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 13:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=i5+f/eb5jduz20SiYGAL/yxBYw4wQrnCeMJ2qbShvUHEIZkDzjWz87yfmjq7c9wkfz
 gc76jnt5+G7Aet3RxAICdfwJZpWPzf0dT9CkDBT/9qTybJmlqW1rbwH3IDVweKySpDSn
 4U6reT6PQ8a2yADSSH/FUrxsD/xxFSwWWYDosXkXcxAKfZFfB19x0S/6SYXjjuNAO9/F
 /wiGObz1J+uwNM0vGk/JCj4utVGte9r72fMO5D6FD1LsMmWkmLO511GEbxuyy8icevN5
 MMKKXdiAX23jxZwOsQ/IBsrWqA2idTQbadi7dfgySehnau1PfxAaCA9Vdbr0TAqxsJX0
 pXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=dn1RJrEclaQ6q6s8T3/HFs7dp6SHGuYDu3oShDCDcFvltFq+KFfb/vPDB8s8MCWkRy
 cuZ/YIg5+6PboUMptXGEDIPzvELPMaj8vKoHfxWpjHQkMCtTk3JndBpFGoWr0W+wU3Fh
 NFxzfP27CmFhcKdcATa/Tka5CUU/hQMZWELE2gRFYrNmGygdOQqFImlefZh55uKN9MYK
 hwzoQ5rLGfrvUqMcwk0HMVvvk/B0s2jyTJPLVq8uDBkKgvy50UaGAdzrDW/++eXnubU+
 q1a1hs2r24TjU8sB5SUjgZklR5vryWr3qcU0xjBeBcrywnUZ8BmBKKl7W6Fnzy6Jw3q6
 TmuA==
X-Gm-Message-State: AOAM533j4etta3TW8O3EjXQzKOOzx14mU3sJ7hZ09nRJ5dyMxG43XNVF
 enDc81/fCVdM/LoDQSqNq9XlI5sbbrxv4Q==
X-Google-Smtp-Source: ABdhPJw2Agp+8EBjhF/KOx7cZejMUwDBt5fKPdlwORDBry05h9+W7HbGADUc31Q81339ykCPlbJ8aw==
X-Received: by 2002:a2e:b003:: with SMTP id y3mr4314137ljk.183.1641935690218; 
 Tue, 11 Jan 2022 13:14:50 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:6a8d:c51:3b28:285b:bcad])
 by smtp.gmail.com with ESMTPSA id u5sm1422045lja.36.2022.01.11.13.14.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 13:14:49 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 6/7] net/vmnet: update qemu-options.hx
Date: Wed, 12 Jan 2022 00:14:21 +0300
Message-Id: <20220111211422.21789-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
References: <20220111211422.21789-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12e.google.com
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


