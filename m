Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150593FCDB8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:38:04 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9Zx-0002z8-5R
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QV-0008DD-Fk
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:07 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:40825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mL9QU-0001md-1v
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:28:07 -0400
Received: by mail-lf1-x12d.google.com with SMTP id bq28so1126422lfb.7
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCPeNlXlWGkhJOT2ZZoxAKVM/qk0CiVaGY6Okr5opEE=;
 b=DWvPyfu2fk22njgR+TiEnXjE9OJUPfI/qyVqO+NUgPTC9YPJareYUevx8AXtJlYe16
 huli8t7dMTrQ4N8gDGozcPvLGcjwap31YCdjiQMrmi33Ufgdi88cbIePFGq7zsnD2u+R
 gBBEZn4ZxzRdmQhG9xxrvbzCdz9hlvZidbNsAE7YrG6BDX43EEF8fyz4IDB+vt16u7ZC
 eSyISJykj0ImsIORqKU65bNfUlFwHubf4sQEOIAEmg0JM8JSwsBClFy9talgr91d4TtP
 usE8Q2GLAZUwGy1lAul1Kr9y5xqtnWjY7nRhUUAenL76scG8yPaFFXFoCPEQlndJYuqt
 CHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aCPeNlXlWGkhJOT2ZZoxAKVM/qk0CiVaGY6Okr5opEE=;
 b=Q1otA3o+7bELun8Ezb3FQD84umn825HEbcyUwy+YVztXevf0lHQ3zuqIAQa8FReIOf
 pC25ObBog7dxgAdaTKhmd3QL1tcbY+gRufBkb903gnf4NW5DtcGnp2QOplixfB1SgAq6
 vbflkeDmUQsieg+GFKQhP6P2KR/ZHkRQeXooA6fGh3GFvNJ2Ml0hLlhRNLodF6g9iMBK
 54LGxvu65yWEOR/W4kpeeb8v6cM5zXeRDHbIJP6B8CuH9Yqk+rQlHkN9xkUAiC2TpKuz
 2UGOCdL0cPHW83LcApBFEwRzEZRK4Ip27Wuh7ZQ0hYii/WjNfEA/b2vz7kd0R1mXBY2E
 Q5dA==
X-Gm-Message-State: AOAM533ifxa0A/3Sb6tmvuJ71HLjjLjfzd83ovSJsmCTfUakhxXOrqk6
 e4M7jAsyzBi+Kw0uUrBzhOHt9fwFeHy9VQ==
X-Google-Smtp-Source: ABdhPJyXaSK3ITFzFvrjgJC8vmQFjUvI+yG7qQYhrZ1YNlTdVNV5VDGY3Q1Ir/1unLt3InBqR+mdfA==
X-Received: by 2002:a05:6512:c5:: with SMTP id
 c5mr12067515lfp.627.1630438084223; 
 Tue, 31 Aug 2021 12:28:04 -0700 (PDT)
Received: from UNIT-808.lan ([217.12.73.131])
 by smtp.gmail.com with ESMTPSA id u13sm1254791lfq.254.2021.08.31.12.28.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Aug 2021 12:28:03 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] net/vmnet: update qemu-options.hx
Date: Tue, 31 Aug 2021 22:27:20 +0300
Message-Id: <20210831192720.33406-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
References: <20210831192720.33406-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12d.google.com
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
index 83aa59a920..b5d1cbd49a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2655,6 +2655,17 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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
@@ -2674,6 +2685,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2696,6 +2710,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


