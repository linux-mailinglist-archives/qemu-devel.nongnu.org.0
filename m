Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F230948E38D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 06:22:38 +0100 (CET)
Received: from localhost ([::1]:45634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8F2s-0001qI-34
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 00:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Eqz-0006iF-Qg
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:10:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8Eqy-0001eI-4N
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642137014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxPDNBsk/Nye9vYPQqYbWzCVn7CHHfXEwXvyBJmzou4=;
 b=ByCB+r20T/diZ9sYPga/M4XidJuX+FePuvZUnkClIUG06GvGfTwz1jjPQdUck2mQfT+Yz4
 HTVhQ9d4D1E1Yrc+ff8PmcCal1rcRThh7NEIxhAXIt2zM7TsLPSmlCZOCf5onmr8IrA5Ff
 vyH+D+I+IHJQouA3SH8J4YKnOAeaEjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-1JsIda1uMFWoWDaB6hNdhw-1; Fri, 14 Jan 2022 00:10:11 -0500
X-MC-Unique: 1JsIda1uMFWoWDaB6hNdhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C265343CC;
 Fri, 14 Jan 2022 05:10:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76EDB108AC;
 Fri, 14 Jan 2022 05:10:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V3 12/13] net/vmnet: update qemu-options.hx
Date: Fri, 14 Jan 2022 13:09:08 +0800
Message-Id: <20220114050909.27133-13-jasowang@redhat.com>
In-Reply-To: <20220114050909.27133-1-jasowang@redhat.com>
References: <20220114050909.27133-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 qemu-options.hx | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index ec90505..81dd34f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2733,6 +2733,25 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
     "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
 #endif
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
+#endif
     "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
     "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
 DEF("nic", HAS_ARG, QEMU_OPTION_nic,
@@ -2752,6 +2771,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #ifdef CONFIG_POSIX
     "vhost-user|"
 #endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
+#endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
     "                macaddr) and connect it to the given host network backend\n"
@@ -2774,6 +2796,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
 #ifdef CONFIG_NETMAP
     "netmap|"
 #endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
+#endif
     "socket][,option][,option][,...]\n"
     "                old way to initialize a host network interface\n"
     "                (use the -netdev option if possible instead)\n", QEMU_ARCH_ALL)
-- 
2.7.4


