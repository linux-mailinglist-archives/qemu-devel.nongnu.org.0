Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BEC42A305
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:19:04 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFoF-0002Hi-6Z
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSU-0003G9-5l
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:34 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:42525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSS-0003zJ-MG
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:33 -0400
Received: by mail-lf1-x134.google.com with SMTP id x27so85837036lfa.9
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2IilJ9aFwnwmu8bHPjzRz8xaSfqsClKPRVXjgKSjMA=;
 b=faI4B1rEd0EkoGRt9frTZyue4V9mOVufpYj86G2Dkq/I7JWTzFfZ+KzFBgRaQXTVgd
 YOWQsQcLkaJvyS2m+HmB56GA+Mdy4gRF0S/wIy8jdN6d898PrGkDytsfSOtfBaCrlfNZ
 MWq3E05p22Wkp4QOLbMwF7joSxmoKo4MKIn75hlHQZ89aV3JegQ0gLBfv8si0sZMak3p
 ltrhEuD6dGHdjAG8Ol2tv1sBQLINKqKQ4+6aKh2+HkynULb4Dul7FlnHFyDzGRz0+Kbo
 FUvWDT2EPHOt1JFbVxa7IhNnzhe6q1O0AlevRYA3QeuzW2836RSIj8r7FqfCOtJVMmaj
 IPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2IilJ9aFwnwmu8bHPjzRz8xaSfqsClKPRVXjgKSjMA=;
 b=tz57VrC+IbCfKtfsvVLpOhKFB38K00V0n9SwU7GjomhFzU6JiDhn92NUOnyQSpeG8z
 R7o2/BrkphY0uTRoWnzT8JEgXDf3UnG5xD43QMBxh0AsXQxXE3hN5TpWl4TvXgC8A43E
 9XUTPykdvNvybhHQu6Zhah7PSVxxBWDFRAWzyIzXwti63KUzuyGe7TSzCK7deA41xoKi
 o4y/gG7AsGXILW4J0WVlRu2aG/pUWasdgy9lwtCWV8ZeA5V5a2MZn+YHSWL8qU8zCCJq
 cEoZ4WlXcowh4rlXl5wx9LcYi8ZuJWuEwnxLMQjjpzNmb8LBex5FQzYhyAuoBaCvYJZu
 diHQ==
X-Gm-Message-State: AOAM533nfcsbv3QFW2OceCj0f3NvkkJ29xsCs/XWMJQyl0r4+8NVVySh
 tpVzTf+VyiWM3VNvkDzdURcSzyp7oVIGeyr5
X-Google-Smtp-Source: ABdhPJwz/HSQb+4jStj4D2eXm1zh4NW9+OovH5KmPOsB6Vk9iYgcHX8t25dAbg4Ml+lZM5crBvwmSw==
X-Received: by 2002:a2e:b7c8:: with SMTP id p8mr29568607ljo.154.1634036189913; 
 Tue, 12 Oct 2021 03:56:29 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:29 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] net/vmnet: update qemu-options.hx
Date: Tue, 12 Oct 2021 13:55:58 +0300
Message-Id: <20211012105558.21530-7-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
References: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x134.google.com
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
Cc: jasowang@redhat.com, eblake@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
---
 qemu-options.hx | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..2aaa7a0782 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2677,6 +2677,17 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
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
@@ -2696,6 +2707,9 @@ DEF("nic", HAS_ARG, QEMU_OPTION_nic,
 #endif
 #ifdef CONFIG_POSIX
     "vhost-user|"
+#endif
+#ifdef CONFIG_VMNET
+    "vmnet-host|vmnet-shared|vmnet-bridged|"
 #endif
     "socket][,option][,...][mac=macaddr]\n"
     "                initialize an on-board / default host NIC (using MAC address\n"
@@ -2718,6 +2732,9 @@ DEF("net", HAS_ARG, QEMU_OPTION_net,
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


