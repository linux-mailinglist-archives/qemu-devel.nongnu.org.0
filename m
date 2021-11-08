Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2811044982E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:28:07 +0100 (CET)
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6Z4-0002g8-8r
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:28:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6X2-0000Za-Rw
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:26:00 -0500
Received: from [2a00:1450:4864:20::52f] (port=41666
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mk6X0-0007mT-Uw
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 10:26:00 -0500
Received: by mail-ed1-x52f.google.com with SMTP id ee33so64291392edb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7h4oNr10DMB+5zfOwZ1ccOKa/BbfeiVQCemq3m1EIU=;
 b=BCfQ2lWA4S+68m5bv0gyqvd7rAWCBhuA8cfs+gXh0H+vEtn/h8KjaZEUtnlMoZz1wq
 zr51anqD3LEHrTEFUskGFZp1LODl0NcZNCFZZ+oSf/Ispb1Mv4ckhzr+3vsEc+PDH5bv
 yoyF6E7uqMtyF6BPDp1Mbc5atfKoiq5nBszQCPfCeMwStfABl2pQM6Txz3pLCC5eF+j5
 297V20pYYzaD0HMCrnHt3GNnvxcJHHOM+iZppXgUW0uSCXeLGXlHi4yo3Sk4sESxM+pc
 rSpz/vf5fLly14mRqTOqfHimqsoPZnL/lpm90V9gMuTTvGDpyTPSYdmlMcIYZTV4C80Z
 SMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7h4oNr10DMB+5zfOwZ1ccOKa/BbfeiVQCemq3m1EIU=;
 b=nHYa8C1yI1PixJ1z53vWirwVj2ZmNC848kd62CbKNhqqeuaYCRbLeOe3UhRleaLVVX
 HpJAZUEIUFf+XAgix6NRTJR72SVDHmJeDIn6h6oP7ztWYBzLRZOIqyxwNmSsK3A8EwjS
 19nAxwQ6J53i0GNRyLNuJl2KadxJIMW7aX+TPVvuG16+s67H9Xaq4ItmDelWCfAXgcRI
 RNSGGWvhCgxxeQnFPzlF4s1YqgiIaXUKeJ4yvNJpjZFOzg4CzK/nSADCEzGAVxc22zlm
 4OOEWbsvv0eeVeRa+n3NQCOGyOVeqYY4bbQW5vSIYpLLFZUgAj02CZt7RrWMGLUFXLPq
 z1HA==
X-Gm-Message-State: AOAM530WDw/IlVrA3oP0DjeabyJDUIKx0j7FUeXVy4OcrGvqKG4lq55V
 LPd2rxbgVdDccQg90Ab/TAlvLx3wbr6xLg==
X-Google-Smtp-Source: ABdhPJymUNXpShxqTyiQLsr3AjBWTBGHXmhFKQTr9N6vJUgGgnPS1z4CASE5g80SdUKRvSXvv0NQow==
X-Received: by 2002:a05:6512:3b8c:: with SMTP id
 g12mr59560lfv.119.1636384738254; 
 Mon, 08 Nov 2021 07:18:58 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id z13sm1312776lfd.139.2021.11.08.07.18.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:18:57 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] net/vmnet: update qemu-options.hx
Date: Mon,  8 Nov 2021 18:17:04 +0300
Message-Id: <20211108151704.65611-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ed1-x52f.google.com
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
 qemu-options.hx | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index f051536b63..443cb9a64b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2677,6 +2677,23 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef __linux__
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
+#endif
+#ifdef CONFIG_VMNET
+    "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
+    "         [,dhcpstart=addr,dhcpend=addr,subnetmask=mask]\n"
+    "                configure a vmnet network backend in host mode with ID 'str',\n"
+    "                isolate this interface from others with 'isolated',\n"
+    "                configure its DHCP server and choose a subnet mask\n"
+    "                or specify network UUID 'uuid' to disable DHCP and interact with\n"
+    "                vmnet-host interfaces within this isolated network\n"
+    "-netdev vmnet-shared,id=str[,isolated=on|off][,dhcpstart=addr,dhcpend=addr,subnetmask=mask]\n"
+    "                configure a vmnet network backend in shared mode with ID 'str',\n"
+    "                configure its DHCP server and choose a subnet mask,\n"
+    "                isolate this interface from others with 'isolated'\n"
+    "-netdev vmnet-bridged,id=str,ifname=name[,isolated=on|off]\n"
+    "                configure a vmnet network backend in bridged mode with ID 'str',\n"
+    "                use 'ifname=name' to select a physical network interface to be bridged,\n"
+    "                isolate this interface from others with 'isolated'\n"
 #endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
@@ -2696,6 +2713,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2718,6 +2738,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


