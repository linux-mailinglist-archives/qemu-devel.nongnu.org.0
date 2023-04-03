Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378166D3E4F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEp4-0001gu-0c; Mon, 03 Apr 2023 03:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEov-0001f7-5R
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEot-0006dJ-5U
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d17so28232736wrb.11
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTX5AlYG9H9wezF7Huuxzz/nE/nKnDO8ny1qnuzLZhc=;
 b=mtSXWDOaZ+SoOSRY+/QyXRKvT4i+55X7WZtDYWMATiHisig086+0JsHukwNdiJId7A
 tFqxCAoC4RwIQJM009Vk+jfFfOFlaKQrlmk2bTXjnhvW4+CF9lMXfKv1wHR3ukRMZW6Y
 CQyFaG+VXbo7bsLaY3JNaZ0O5jKXrhP2qIEG72Vjgf8MVH9BIMi5d+VGm5MfsEvzCudI
 GyrjyuNPJZrO+zweLhjAv7NojvLIUzr0fIDB8FyORUM/z/yAaS2dYmbZmQwIZzFXhz4c
 p7LFtBj/nJrdJSF6L2IGVCFNtgwR5DHDosc59QA+1G+LMTWWcV3o/frA6tmQ3zvYZ538
 VF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTX5AlYG9H9wezF7Huuxzz/nE/nKnDO8ny1qnuzLZhc=;
 b=HJXX+gRTJ/3g4UIRdRMvTSZWxz45dBeelQBGf1oHl9Oh/5JHeiQ0TbFgoTKZpQlLFm
 BImU/tQS8tIrZATCoBY644n/1itahBc55712EIgTkWmhKUUKkRJ5upCKPGoaG6w5mITD
 1rZvoDWZHQEUYApCpzX/QSlXeYTFRJOW98s7r4r6M1+6TwtN1mdx6Xjx7pvuAOCCm9N6
 9NrXdagaezBc89XHBxmVNRWILlKY1MPL1iLjZY6MOyqrpUlUSxylMM+jS/h802392km3
 SCooLmMyCrjMNcQ3fS426PxIHOcf/dolsl9LNXW1K5gm1+2IyioTD9G/wRRKWPQg5uSF
 XmjA==
X-Gm-Message-State: AAQBX9dsF4TgBA9Nf6ah/uZSLUNUwySZpXoGs8zXGJSgx6tztn3DjAZV
 VtqYcKq2hYxmj9fASDtdgrPVNhlCa6fLwQ==
X-Google-Smtp-Source: AKy350aggVxi8ptGEF+kz7DCXq42gtEfYkUb6ffP2AHigP6K835TVXtAlFx6fFv21AA1vyoQLxAQyA==
X-Received: by 2002:adf:f388:0:b0:2db:46ad:7e82 with SMTP id
 m8-20020adff388000000b002db46ad7e82mr25915768wro.47.1680507697657; 
 Mon, 03 Apr 2023 00:41:37 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:37 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 3/7] hw/isa/piix3: Reuse piix3_realize() in
 piix3_xen_realize()
Date: Mon,  3 Apr 2023 09:41:20 +0200
Message-Id: <20230403074124.3925-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a preparational patch for the next one to make the following
more obvious:

First, pci_bus_irqs() is now called twice in case of Xen where the
second call overrides the pci_set_irq_fn with the Xen variant.

Second, pci_bus_set_route_irq_fn() is now also called in Xen mode.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-3-shentey@gmail.com>
---
 hw/isa/piix3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 1b3e23f0d7..a86cd23ef4 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -394,7 +394,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    piix3_realize(dev, errp);
     if (*errp) {
         return;
     }
-- 
2.40.0


