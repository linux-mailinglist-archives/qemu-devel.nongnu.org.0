Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F48439390
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:22:20 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mex7T-0007kn-2H
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mex3W-0004ku-U6
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mex3U-0006LH-78
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:18:14 -0400
Received: by mail-pl1-x636.google.com with SMTP id v16so2197197ple.9
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kERtKH8W478bchr7Q/Ed43f8LXyPFwNoN8JEt1Jp/Js=;
 b=LM6fxGURknnYo35vPHZlp3NsIFumxmsdckUBMI3vwqvvh0SBiTgA8P4C/aOlNEshWz
 xGqe6XUOPnPWiDC3Q+QXTum9uXBpYm5Y6SoYlpIa/Rb2oEaAeg8NHgNluZdTUeuG2jMW
 RE4ypQ9+XDzN5CAvbumQsBnTyS0ZJZH0EFHc/gsnvxp1LuVbOwHR9z32lXlpHh0t2Qo3
 st6OaVlEwpW5UuUIAvcsbnZa4QXPq2et9AA913ZJHmLYu0MZLUXuftwtP2iMuhyUEZE9
 IfAMxUvxdWhJzg9O3ULVg1J8faFzaJ/mekO0YOokacZO4s2FY+SYz5p0YVvAhM+uZwql
 6lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kERtKH8W478bchr7Q/Ed43f8LXyPFwNoN8JEt1Jp/Js=;
 b=yjDYPuLhgdghDoPqVw576v7ChY9nMKdBQgOSAjb2P07/WwqVdHY+qJ800RLcdsAMYN
 WG2/qkvaWIkuW1yJEa0/MHYDeS0Qi9vnz5B1w73XujS8Ayaxs2HFC5ajWPO3uKrDUePU
 mXDNsZD1tXKlvEjdH4yii8MNw03ejTvm3Ze4XcpgAodF3iqT86Xv/g9Wv7dhiKhYn7+M
 tnf+Bod4l4/D6hAg70GXcaW2KqEaunogk9X2k8PUhsD6l8fP7nT77pFZcRCHiB9jvWbR
 ut3l5eNX1oYr1uHX/Eo/hmWo8ic6k+ecmbAxVPonZiuZO+J7HBcB2BiFQTTYWKcZbsBX
 65dw==
X-Gm-Message-State: AOAM533a3pNIqRNbHzh0flZ8LEg7VQQgeeLVXilaHqEOEa1vIe1APVUD
 z5DjhdBTrh3AIKt9JieBVPJUiaCJsroUjg==
X-Google-Smtp-Source: ABdhPJxuzbrAETgsaDKzctAS157uagmkpgeu8QGm6WnWgTggIPWyiiooqSxLe9AhPnBAQREscOQc0g==
X-Received: by 2002:a17:90a:bf09:: with SMTP id
 c9mr19707958pjs.203.1635157089210; 
 Mon, 25 Oct 2021 03:18:09 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.157.25])
 by smtp.googlemail.com with ESMTPSA id u11sm19671928pfg.2.2021.10.25.03.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 03:18:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] Add a comment about endian-ness of capabilities recorded in
 pci config space
Date: Mon, 25 Oct 2021 15:47:36 +0530
Message-Id: <20211025101736.404148-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Values in PCI configuration space are written in little endian format. This
includes capability values recorded in pci config space for pci bridges etc.
Add comment to remind developers to make sure the values are written in little
endian for all platforms and that the code must be endian safe.
Please also see the following fix which resolves an issue related to code not
being endian safe for BE systems:

0e464f7d99311 ("pci: fix PCI resource reserve capability on BE")

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 include/hw/pci/pci_bridge.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index a94d350034..5fc6841833 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -143,6 +143,8 @@ typedef struct PCIBridgeQemuCap {
 /*
  * PCI BUS/IO/MEM/PREFMEM additional resources recorded as a
  * capability in PCI configuration space to reserve on firmware init.
+ * The values of these parameters must be in little-endian and
+ * the code assigning the values must be endian safe for all platforms.
  */
 typedef struct PCIResReserve {
     uint32_t bus;
-- 
2.25.1


