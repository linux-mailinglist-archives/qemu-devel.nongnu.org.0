Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE4537236
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:44:32 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNtw-0002TN-1X
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq5-0006aa-Le; Sun, 29 May 2022 14:40:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq4-0002Fg-7c; Sun, 29 May 2022 14:40:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d26so6426798wrb.13;
 Sun, 29 May 2022 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nropo1Wp2345M6NB97Ef+VG++lmlRDODnalFkapLlxk=;
 b=GXfdhs0YHbcPDfiB8suGc3oKh1EXxqIVLA5eUBaUS5oxb2alENrBx3Jv21jJ5/MoD/
 eU9Dylt9uBFa0RIMYVvZaLfUlTGf8VNzSHY2Qo5lrslHYLIiTlV2w0Jyy+RkXJGTOSjF
 +GO2bYmKCdZRHtVBsQY2wZXvuDcob9lCr0yT56O8iuN9C6n0hedrnyO4VcvNuQLzS+xv
 CAiJaV9N2Xs689O6tN1f7RRguBepF3x8Ht3hft7454qN6Cw9ubyKP5+FI0m5PesMVZPy
 WsR3cD944JE2+2hlYFOp5icTRWkSJ1K0LqVb2e65WjFv6LvUUC4azglh3psOpq5Xqip2
 Dv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nropo1Wp2345M6NB97Ef+VG++lmlRDODnalFkapLlxk=;
 b=JmJMa+lJq9vE2kLrJhiCgoxidicrJbul/pdKwMS/671tGYuc2VeVNktyfcCLZDSfGR
 DhtonjlGsq1W6C96S5L35Mg5JYSANaWpnjH5eVgyGeK+eT3m7jk4U+LxLNB2OA8x6yB6
 sbHf62APM+axdKKW/VX1VeujyslkjT+Yhi7vHfZw490i/joxGhX41Q8SHXpjLNgtS+O8
 EpYnNLjXmIjxLvC3t9NgGzbz/B6YidPx5j6wGKLGL9StXLsjQG/L3m+CNl0w9A8C/rpD
 4ha0cfgSghL9cm+XeyK0vp3LpscXNUg+TDYVg0EhodDA0wkal0rF1y2g5ddctS8NBzvX
 tUOw==
X-Gm-Message-State: AOAM532eC4uh6nSEL7X3GgRPB5KEF8ehJoEZEmcFc2Vi902TBBdfiWyW
 kHTPMYFXcj2PnAbyrcSKGv5vdGtg8ibbM8NA
X-Google-Smtp-Source: ABdhPJxobdueCnX1hxRrooqg2we/iagGe39QUT6vBhzZ2w1yNpdIKNFlzZT0WnKjQGCs4ySOLhzp2g==
X-Received: by 2002:a5d:4344:0:b0:20c:cad4:9e9b with SMTP id
 u4-20020a5d4344000000b0020ccad49e9bmr43000570wrr.187.1653849630353; 
 Sun, 29 May 2022 11:40:30 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b002100e86319asm7341049wri.78.2022.05.29.11.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:40:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 1/3] hw/i386/microvm-dt: Force explicit failure if
 retrieving QOM property fails
Date: Sun, 29 May 2022 20:40:04 +0200
Message-Id: <20220529184006.10712-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529184006.10712-1-shentey@gmail.com>
References: <20220529184006.10712-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
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

New code will be added where this is best practice. So update existing code
as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/microvm-dt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 9c3c4995b4..fde74819f2 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -32,6 +32,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qapi/error.h"
 #include "sysemu/device_tree.h"
 #include "hw/char/serial.h"
 #include "hw/i386/fw_cfg.h"
@@ -187,8 +188,8 @@ static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "ns16550";
-    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", NULL);
-    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
+    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", &error_fatal);
+    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", &error_fatal);
     hwaddr size = 8;
     char *nodename;
 
-- 
2.36.1


