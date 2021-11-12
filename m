Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E144E3BD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:20:24 +0100 (CET)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSjP-0003xI-BA
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:20:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe3-00023b-TE
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:51 -0500
Received: from [2a00:1450:4864:20::134] (port=35728
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe2-0000q2-4U
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:51 -0500
Received: by mail-lf1-x134.google.com with SMTP id p16so20789769lfa.2
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 01:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJBpzO6R9GmHNAE7Ii3PsVXpsYLZ7zboHCfFVaSYQkU=;
 b=g4kewQfHFOmzzOhQ2c1J/NrSIdjjqiIwMxFSZutryFZQZ4hWa2Zn0tvKK8igTIVBpI
 RMZ7J/uzSjjUVBulStVzxTFAybUWJL80XThu/y/AtCoeFptjQ9KkKb7QUVgdcEIrFHHE
 Qo+WsAyuvslWNMyxHzsSL63ZF1QuLuiIjNh2ICbkpc2xoH2Pracwt6ohYwVj7rklnny3
 xa/2sOEOSzvq5MH3dEprrWApZYFDzME6qsooTJ67Lx/IBiQDrzVPNiwGNDuzD/jAQLOt
 N12F8uMjg7YxGM3GHBvhr2Hoiyf9mbJCt0lhC2UAbCUPd8x5C3emE+1OkLKTf+WRa01x
 yjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJBpzO6R9GmHNAE7Ii3PsVXpsYLZ7zboHCfFVaSYQkU=;
 b=AQVQtq/P14yd5HQJbNl1CFNBQSSI9XI/R/CiZgSbD3nGrqg+FLaIIhf+zCXQoFc+0T
 Bi8RywM80YNhQ+vG+ZOPVgNTpr1bOUopXZOL+AFkl00bRAcijAJ5j7GKsvfaVi+9njSM
 QdTRQqMfr3O+mziTzDgIRcu3B9jAcUpAkIn4shTngfCnC1InbqFZmZsSCIUnjVm4y+pu
 gm5EkHMRaVIKtMIMJsf+jO+eBl0FY70r3RRYmqxIK1C5QWYKBJWVuwl/j0D4U/l3Inin
 CYPRIm5LICU6lfHc8w0m52MtPJTI+ZL45vI/25BzN8P7h4wz5yCXE3S6f7Bj85FHjuD5
 yMfw==
X-Gm-Message-State: AOAM532G6N/bQczRGnPIrA6T0a4Eq1CxgXMSSHG0ifRqBLfJD4mFgzvn
 k14y+99+9vZl2HE5aR+2fUeWiu42+lqICA==
X-Google-Smtp-Source: ABdhPJxHebIzzBpDtC9ILjNcl3L/Wf/879OlkvzQysaQjXj3f/Dr2Rv9h65QLbGabxNgbL0qb8YK7A==
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr12901747lfq.334.1636708488460; 
 Fri, 12 Nov 2021 01:14:48 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2d:d7c7:95ac:c963:ac2e:68f])
 by smtp.gmail.com with ESMTPSA id j11sm570134ljc.9.2021.11.12.01.14.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:14:48 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] net/vmnet: update qemu-options.hx
Date: Fri, 12 Nov 2021 12:14:14 +0300
Message-Id: <20211112091414.34223-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
References: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
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
index 7749f59300..350d43bbc0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2677,6 +2677,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_VMNET
+    "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
+    "         [,dhcpstart=addr,dhcpend=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in host mode with ID 'str',\n"
+    "                isolate this interface from others with 'isolated',\n"
+    "                configure its DHCP server and choose a subnet mask\n"
+    "                or specify network UUID 'uuid' to disable DHCP and interact with\n"
+    "                vmnet-host interfaces within this isolated network\n"
+    "-netdev vmnet-shared,id=str[,isolated=on|off][,nat66-prefix=addr]\n"
+    "         [,dhcpstart=addr,dhcpend=addr,subnet-mask=mask]\n"
+    "                configure a vmnet network backend in shared mode with ID 'str',\n"
+    "                configure its DHCP server and choose a subnet mask,\n"
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


