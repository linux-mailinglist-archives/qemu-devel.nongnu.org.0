Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3948DA88
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:14:32 +0100 (CET)
Received: from localhost ([::1]:58706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81o7-0002av-NG
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81br-0002QV-Nf
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:52 -0500
Received: from [2a00:1450:4864:20::12e] (port=37718
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n81bf-0003e4-Tw
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:01:45 -0500
Received: by mail-lf1-x12e.google.com with SMTP id m1so20509864lfq.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=mPjWVaZTIEQMXzudeVBNUAqzr/YZZPO5H6vTFMCYIg3nXtfQbadwh2DPxQYX11cIjC
 a3/wbNzx28tjLnK7/KKByX/fmOUSk6ppxRNDXwBcgB0tgWRGEbzWHCXbO6aAoWQU69bc
 QNmmTVVYblaGp6jZz5ombPPmqs6X+6rSVnQeZwQPUTT//E4+sdfKwWxGWauNoPbDpfz9
 gSqd155Dj6NqRo62EusqVSfswV4+95qLd0LUGqK8oE9m/WnzUiz9qyeU04oMZASBcO7p
 WzD17YFsDROLDS+EoGnuaLdezedcGmfz9H/COJ0D5wT+7Y11DFMSey4Agj2s8G7I93jA
 qtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=RIYCMwNTQlnm4JPIp0GOdLrztsoI1T8VhEwgZUTYOowyG8NwsAHPwAyIy/quxb0Ex4
 xmHi9gQSFc1rui6TA4y2Q4UczZb5L445RHuWsNFM9H4QTRH/XDhy4n4YHiq1kkAjHjKK
 kUO9R4ZLRDeT2TV8HKY0E/dOZKKUkt3c302hOuVhk0MwrIwe6Iqk8rMJ1lJbdgoPi+51
 CwQXuEJ/V0NZKzK+BrvwUEiGEyCTVTmnm7OuRyO5tZQtqfJHeKCxOtkgFEvPbRp0OZSk
 ab4cBePHAnN6NsZ0M2QswCVERgxnXuRegqOUJp4NT5iVNp5ZlthOXZg2aXfPpqqibK6J
 rwBg==
X-Gm-Message-State: AOAM533jC/vG+/yEblidfPOfHXeyATZoWoFyn2XbcRF71PTXIwvxdbwJ
 5Mbgml44c1lletCoIDw5tB45kggX9bwNY3F1
X-Google-Smtp-Source: ABdhPJxzObrvI6k1pcDI4dGxUanRHIZA1fB+Molk7yRFfs56oPCFb1hAjCWEhJayEk4VAH2l/SxICw==
X-Received: by 2002:a2e:b0ee:: with SMTP id h14mr3125826ljl.287.1642086098123; 
 Thu, 13 Jan 2022 07:01:38 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.20])
 by smtp.gmail.com with ESMTPSA id w25sm314278lfl.155.2022.01.13.07.01.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:01:37 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 6/7] net/vmnet: update qemu-options.hx
Date: Thu, 13 Jan 2022 18:01:12 +0300
Message-Id: <20220113150113.58437-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
References: <20220113150113.58437-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


