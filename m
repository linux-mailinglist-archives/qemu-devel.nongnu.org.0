Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE648DD03
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:38:11 +0100 (CET)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8438-0000Db-Mj
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oY-00085P-LE
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:07 -0500
Received: from [2a00:1450:4864:20::12c] (port=46814
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1n83oX-0000rv-3r
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:23:06 -0500
Received: by mail-lf1-x12c.google.com with SMTP id d3so21853929lfv.13
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=o1rAP5y3x6vAi13SGBRX9GHdEBP6TK8FvgOTVlHCvItOmSHvKDPmUP8ufUzDNr93v1
 W8+ojASg8m7b7W3naJ3X4mvCp4E0Y1l6zNykMtFryLtvkELD8pdtAQVpUBPoSREo0W8o
 Hyhql7VA/zu5RyEyTZbeqQL7oibntgvUq53LWAnWoPdC+YbS1DfAcYxt1pYP1PjADIXB
 jPb3FAFCcgTXeih+ZbgRjJpXSM5pF6xbbIy8rwxaxwvNApUlk0wt/KISdEvGT8XfdNOV
 rkh3+DY0zCuQqnZF9xqzpDohnRjbvItLtNiT5ETW2TBjRhxiy1NBzKcCt4pyv++6PWxu
 10YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hnf7PUfpO9sxu018B4AlS1sjMuEdf3KZ9uqLBn7sjEM=;
 b=3qnD6hUHunk6NpWRmzYUXDh37tj0NwNloBkmINFLW5p51SWAE4z/svmd2GlWpMPPTl
 lpl0835zVx6pL1on6htkFsIKVypJunQV8YBFNoU4kJQpTrt/cUWiavVV+HQjAT5sFHB9
 yidwFsQ2p0qxjIbAa17sc9h4tCWq9zUX6XFlGOvkSTyhNhvdGQGG5ZqgSzHVuismJX2U
 Q21gmJcfFrTdCjygUHe1WVRE6jkw8+49TQeuB4tPHSMwchYgaLsTN7a7tNieJPRxsFhs
 CJnJAl9mAXpGOa8hbzJa5Vu7tyo3XLO/SI3grd9UQYFSzL9apLMOr+YU7Xx+nba7p29j
 AL7w==
X-Gm-Message-State: AOAM532etQwnm5OB8bT9OMP3QKvMIzvaombaFnVMOOaHGdIIj7ciCkac
 eSaF4SvtCmJLigyR2QQCmN9QiPlgnS96avWR
X-Google-Smtp-Source: ABdhPJyuweqGn1otbCoh2e/TEOndjS39k5RcQpT0a6VU4RmaULnBPERcWccBbTT99x2/iBDRw2e77w==
X-Received: by 2002:ac2:41c8:: with SMTP id d8mr4091137lfi.449.1642094583388; 
 Thu, 13 Jan 2022 09:23:03 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id h17sm323410ljk.41.2022.01.13.09.22.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:23:02 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 6/7] net/vmnet: update qemu-options.hx
Date: Thu, 13 Jan 2022 20:22:18 +0300
Message-Id: <20220113172219.66372-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12c.google.com
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
Cc: peter.maydell@linaro.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 alex.bennee@linaro.org, jasowang@redhat.com, phillip.ennen@gmail.com,
 armbru@redhat.com, dirty@apple.com, f4bug@amsat.org, roman@roolebo.dev,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, kraxel@redhat.com
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


