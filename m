Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7311D609801
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 03:59:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhFt-00069p-86
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5D-0007DY-7P; Sat, 22 Oct 2022 11:06:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5B-0002Cw-KY; Sat, 22 Oct 2022 11:06:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a5so3029074edb.11;
 Sat, 22 Oct 2022 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPF9+HfmXGc/QS2MxhD55Mybo4zeq8/bfRvcchWncns=;
 b=I8OJ82nIGVhQNSgYz7xcBYcTBFq5IXI2DGCE3WEJX+AHYH4rUpLC1Is8PGpe9RK5ao
 irSjm3rBzz393bC/BRiGMpUZ82Zita6oGCF0CpZVjw8qTsyhLzVfHK7yb68+Ai745JGZ
 Gcgrh5tlAN0Tj3u5qRnuABpatvehjEOf6i3jG/AuEvBV+g/Ltq+iGTjIpzbsodajZVLn
 TuPZcctRUUXDZEhTwo6L7QoogZIj2qB6vfulmx40jjROKL4eT696NHI6ybgqYDL+j8sO
 e54tYRdarFsZRhu2IE5pwP+pU3eH02y3wgJfUVZybk7G5oSQNoxGJJVHeUhPYcQOjjAP
 ITwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aPF9+HfmXGc/QS2MxhD55Mybo4zeq8/bfRvcchWncns=;
 b=CQvf0XQ5lLSXrLaqcw5jTiRsXItVv5LB+EFjrWfEV36yDZ8Vjv3MBBcvP9fEf48xOe
 zVg9qakRj4A/W8yO+mnfiARv4ZRao+65+quaIke3NZW2y6RC8psxseC2P3Gis0h4kzmJ
 L07vjjHCFEInVlLSFCk8Y4Bh6LZfZhIusb1Sax10xppw+/zWO8zkitQ2HFoh7d4Vk2oa
 OS4FAGQJN49Vk6HicMWwb0xJqjoGHeQ3YxPsyYZNelqsTS5WR5BfLj600C43ttXO92kU
 H+xL8rP2u9ndBD5jhz/CXK3llzeN0sYqy37gjSBxA3yDlRIcxbKVni0JcaqY+QOMyqaf
 /0Fw==
X-Gm-Message-State: ACrzQf3KTxbpfuba8/zVlCMJitMen/kilAlEl3qks2Gwqh0wOmCIw3r6
 ZAMI21mxlELibvyoaPptvcMJaUy1SSfD8w==
X-Google-Smtp-Source: AMsMyM41h1cDcBqTFIcHfWvZlyR+i+uyqV2T/jhcre+zeVZhQcf7YEC7XOJ1dUk/N9D9s4onR5MtMQ==
X-Received: by 2002:a05:6402:3887:b0:458:289e:c9cc with SMTP id
 fd7-20020a056402388700b00458289ec9ccmr22456316edb.101.1666451200351; 
 Sat, 22 Oct 2022 08:06:40 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 19/43] hw/isa/piix3: Allow board to provide PCI interrupt
 routes
Date: Sat, 22 Oct 2022 17:04:44 +0200
Message-Id: <20221022150508.26830-20-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

PIIX3 initializes the PIRQx route control registers to the default
values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
April 1997 manual. PIIX4, however, initializes the routes according to
the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
allow the reset methods to be consolidated, allow board code to specify
the routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c                | 12 ++++++++----
 include/hw/southbridge/piix.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index aa32f43e4a..c6a8f1f27d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -168,10 +168,10 @@ static void piix3_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x80;
-    pci_conf[0x61] = 0x80;
-    pci_conf[0x62] = 0x80;
-    pci_conf[0x63] = 0x80;
+    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
+    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
+    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
+    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
@@ -383,6 +383,10 @@ static void pci_piix3_init(Object *obj)
 
 static Property pci_piix3_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], 0x80),
     DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
     DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 1f22eb1444..df3e0084c5 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -54,6 +54,7 @@ struct PIIXState {
 
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
+    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
 
     ISAPICState pic;
     RTCState rtc;
-- 
2.38.1


