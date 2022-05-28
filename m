Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EC1536E2E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:28:08 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv26Z-0003QV-Vv
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv201-0003Pl-QI; Sat, 28 May 2022 15:21:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:43704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv200-00021Y-6l; Sat, 28 May 2022 15:21:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so4433744wmz.2; 
 Sat, 28 May 2022 12:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRQy+p9QHBhbhdctUoVX94Tio3w4hP8sJtMALXRbrgI=;
 b=XleCAWp84dkWm7IuXktFmgkYbHpRXZ0N9YLRf7jpkoRt0cxGwKV60vBQdNXMPKKOnF
 6aWhAY2Hp5B+TcVpme7dhPB7924DSU+FbjBevKe/dzT33tA1svnUtbLB0oTFiCgxhJsE
 gsNvJOKLfJSagR8ko/qbzFcDPtEFmLNO1xl3dKyX3Sd36bsqtExWS2m/Y7KniNFPMB3u
 EY8dPjlX0fnzc22ruMHEzeAEkC3KVBJ1jbohG+MUlf6061H9xU0YV+vhaDacEEatjhF9
 Njz7Ac7bkiNVadIRgtQvmNHIb6pVIIlm2iqe0feYkiYAdpFj9GQ1WYSn4LnVh2lNjGFA
 4vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRQy+p9QHBhbhdctUoVX94Tio3w4hP8sJtMALXRbrgI=;
 b=SgvpiFSEjXcIzbLtGecy8yfqiHzN4Qx1WMxMbDzbAhauzam3nNnx8OhY0Yo6dwGXXu
 e7mgu/yqiPo/SwBoTXmPA6IFmAe4AIXI5Hsss6TCNiqNiwIdPzECfTd2GEHfFlOkn0hb
 6FJszEZaGniscmHfXPLjABG5HMmtG//VcvOFbEaK8qV9m6jE6KNyQ6pYagiUR66TlUml
 FwKPt7+JzbgY6VNJgX7vVm40qYJ0+UAkKAlZMmhXyn6FW7ncXsjzHsXATSP4VW9EDx49
 ARFvr86lqZqQ1gZjKutDw9VuREB1NTdDGlJnTMJ76jMHonhyVKRvbG02LLyvd5m7l2Qp
 1vrg==
X-Gm-Message-State: AOAM532ZKhAhegcVherh5HPccVDlOSB2tSE0DFIKCyu547a66c4+XTyk
 NFjPPg20qfRqb6a71fUlEp9VA4u0OGoA3WMi3Tg=
X-Google-Smtp-Source: ABdhPJztmUkyqv7csNXDv4qVvLB32N0lwWenFjR4xa1ABfI427zAUFaqv4wknJbP31r8rz3KsJ53Rw==
X-Received: by 2002:a05:600c:a4b:b0:398:a862:8c27 with SMTP id
 c11-20020a05600c0a4b00b00398a8628c27mr4469921wmq.88.1653765678001; 
 Sat, 28 May 2022 12:21:18 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v3 1/7] include/hw/southbridge/piix: Aggregate all PIIX
 soughbridge type names
Date: Sat, 28 May 2022 21:20:50 +0200
Message-Id: <20220528192057.30910-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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

TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
ones, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c                | 3 ---
 include/hw/isa/isa.h          | 2 --
 include/hw/southbridge/piix.h | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..d96ce2b788 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -35,9 +35,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
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
index 976b4da582..3b97186f75 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.36.1


