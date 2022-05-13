Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6D5268D8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 19:57:55 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZY2-0002ES-FM
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 13:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVF-00088y-F1; Fri, 13 May 2022 13:55:01 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVD-0004jE-MG; Fri, 13 May 2022 13:55:01 -0400
Received: by mail-ej1-x62a.google.com with SMTP id z2so17691614ejj.3;
 Fri, 13 May 2022 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ahvpqt2hq3u7BcojE8H/KUXFWTnihYIZx8SSjYlNYOc=;
 b=Y4kq5O/Lc9ignYn8e/H4+uSgv7653ErcESA43/9rRlXCAdk5Npom/8dNE3Uqi9KuBo
 y+gA3EUFD2ImCF52CLPAwmMeh0vZOCR7a170oB/ly6PkUFx12AMKs8zhKa5QcU0AvTMk
 ACiHHyz4pFsdYTRFSNpSLFKHh85D7sVjXsBXjvvhp+a0Kh6N31aaqJyiCfqefZye58Sr
 Zu9fSI5d/2mBVbh7XFrzx8u5O8iMy+dJyZGTsgLGtANFDV36nAWdygTau3KG6mvSY0Vi
 qOajs29IweKDrTZ5tc4mSP4qzBTWH1gqG5vLv3dIjvGN4zEZnsT8sckweZuJ5mzjN/mP
 oAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ahvpqt2hq3u7BcojE8H/KUXFWTnihYIZx8SSjYlNYOc=;
 b=erKBkSmuHH+0Oj6zFbzSD1YNwBirCuSs2K3xBk/vPSCB7JNJtHHBcP8aNup4AfeHJr
 QcVms13sfytvxpzLWs1lTYNNCEnq4VnL+ZHPjNM7YR+n6dX2LFApSlrAP2X8dCR0dWkH
 3XrO8foV37qLGkZ8a61GNzZtYz3PdBS++62zq+35GNkv6cnN54ubPh5bnk7O3SuLU4BN
 SLf4CGBGWTTCWz9vxhwfzpwYywZByGoC/NKMIHr3NvhnwdJOzwCbRzmt4Vs8DyozzZET
 4+GukTrODcrwiFELI0xXus1mHpBkJwk4qy8pkYkHghYKYZc9rqmxbe2M6Z9HS71bj/PF
 x2aA==
X-Gm-Message-State: AOAM532xjAbCbyFKLuF3jtlg3afJcqLPhSRRXKNETKNXHB+Gn88u92dd
 7W6Si920deUmVfPq/8aX6i6qcarnVbI=
X-Google-Smtp-Source: ABdhPJxtTxLaIXOnD3r3JfSGbjHDy2w/HwGbqAyQRB7868Ion4Wjkau//SAwHBDEwsa9di/4Uap/Cg==
X-Received: by 2002:a17:906:b286:b0:6f3:b3e4:5f67 with SMTP id
 q6-20020a170906b28600b006f3b3e45f67mr5482052ejz.148.1652464497696; 
 Fri, 13 May 2022 10:54:57 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:54:57 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/6] include/hw: Move TYPE_PIIX4_PCI_DEVICE to
 southbridge/piix.h
Date: Fri, 13 May 2022 19:54:40 +0200
Message-Id: <20220513175445.89616-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_PIIX3_PCI_DEVICE resides there as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/isa/isa.h          | 2 --
 include/hw/southbridge/piix.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..e9fa2f5cea 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-
 #endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f63f83e5c6..a304fc6041 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,8 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.36.1


