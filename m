Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58A418AF4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 22:21:17 +0200 (CEST)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUaeB-0002zT-RI
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 16:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUacW-0001uc-KA; Sun, 26 Sep 2021 16:19:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUacV-0008Mq-51; Sun, 26 Sep 2021 16:19:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id x20so1137322wrg.10;
 Sun, 26 Sep 2021 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=03DgaG1RzzgeU081YWoropruPxlpXxg483HBoJjh5V0=;
 b=Rqy29ISSKKday8M+ISB1MTJV6dnh14LEcnMi2/9128Zd3dpp7Wnk8nPTjre4NQI661
 QYoJlnHUZjhqggSCKzKTclXEXU+rONiI2v0Tzxfc4MFLCO05XppTFHfRoZ4A58bz3Aip
 1Zc2kbQsO7DYZGGxTGY3wcvNCz6qLoT/yyvepoA9/wzHJCnBTBcnjpmyveXMqhAEqjrF
 t1vR71htD31bN+LXGQMXldRIF1slGsFy/Re2OTOq6l7iAiaJcjKCPOAzVCs1npVzB8eb
 XLLXxAo3cHDyF+4JY5nmaiKR2UG8R03hfo2tB88zvSr5lcMA/NwiSBBWRr60HA5YHBJp
 vE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=03DgaG1RzzgeU081YWoropruPxlpXxg483HBoJjh5V0=;
 b=jb1LKKTs2OQkVNhHNXuO26Ee8tcc8p9Li9295B91VE6M2r8t0xg08ws6KaYYd/3X0A
 wZdNNVC9Rq9196MW8xDilG25jG/vklQpE0sZM7j2UqCm89y02aIVFiM9Gh5v53xuH6bb
 4QMDKBNPtWqq4xVpLBe5iKOriawFshoJskiCDyYfh1iIlxULZI8V0cVo5nioVsIpVnN8
 oOl/MyYJ0I0gXrelulxzsFG7tVtwuooiMECPbibNXFes5+LedPgCjxN2CyNwNicRSM81
 WzTjE2VTHR+ZtAp1ZDsp5nlmLr4wsi5GAXmKMbHg7yz3xvtiKlSzu8WU2B+CaW/u5CIU
 sA5g==
X-Gm-Message-State: AOAM532Vb1U18lqXyNSEYBjlLBXZHPEzP/fe+pnZiAvxatKO/VauiNgD
 o2wU4YYO1vmx98q/pAa5Ifz81/SWfRA=
X-Google-Smtp-Source: ABdhPJzqnWtXE0r+xJ8cGD0e7s/rzXL5Tqgjyy9y2GML9q0UNxQUe7EF8AWL3LdfU/IIsy7vbeJSJA==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr12786849wml.28.1632687568147; 
 Sun, 26 Sep 2021 13:19:28 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t126sm18457894wma.4.2021.09.26.13.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 13:19:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/remote/proxy: Categorize Wireless devices as 'Network' ones
Date: Sun, 26 Sep 2021 22:19:26 +0200
Message-Id: <20210926201926.1690896-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John G Johnson <john.g.johnson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU doesn't distinct network devices per link layer (Ethernet,
Wi-Fi, CAN, ...). Categorize PCI Wireless cards as Network
devices.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/remote/proxy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 499f540c947..bad164299dd 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -324,6 +324,7 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
         set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
         break;
     case PCI_BASE_CLASS_NETWORK:
+    case PCI_BASE_CLASS_WIRELESS:
         set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
         break;
     case PCI_BASE_CLASS_INPUT:
-- 
2.31.1


