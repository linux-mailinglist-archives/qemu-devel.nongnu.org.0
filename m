Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F69E4668B0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:53:21 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspKi-0007Lr-8x
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:53:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mspHT-0004hX-Mt
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:50:00 -0500
Received: from [2a00:1450:4864:20::42b] (port=37577
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mspHL-0005mo-Cb
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 11:49:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d9so90499wrw.4
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 08:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vmAM52JfSSXwOMsFRYBUjyjXXmv4Jdz3sFOGF5ZQxQ=;
 b=Su3uvgmdJpQ0qBxk67/GpWp7Ec56cKOJmRiPIf/gmd09CeYpOvTRCXtj749xJAjmRJ
 pmkIjHnS8u+ZPemLwQfsyiIohdmLNKlbhgPojjPgmsgCeYksuGBmSU6FoodL9hdCZNP2
 YNACbhBrrrm8k7mBwPZh6LwiyObKeGxaQR0VUTAOTwG3Lm5pFaXG0BDPkiclCvmEif4a
 KhsiJGLTc+/yyO9UzPWrOetVsYnLV8KEBhxKwWK3KpvWs2WUe8qvhbHhCR96dsl/u5+F
 wokb/N46T098tCYmO/dnJxie/Vy3zgYllGRI3Ckkrsu4j4jBzmTN5QgOVZr0FjIw3AWc
 FNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5vmAM52JfSSXwOMsFRYBUjyjXXmv4Jdz3sFOGF5ZQxQ=;
 b=mwt7kDogqXfxzTEVg5Q05R1/169zk91TyfLgg7dRSZrqNcOJs6/6RmXqH/i8rqYVWz
 uYRRPeVvKDVXV7glNp7QQ64EWk07QH+5goddEjaCL0WuVE5o3PzUbMWprMTm8tsPJMeo
 mcsEsOIqVPE47pza9SnW+c7nGt0MVMnBMQefGxBwZ63eu5PwkaS5nfvIwO9cvvzCunw+
 pqsbDYMX3uHxhGcbC9Lvgdfdxj96mx3/lvJ8tZ67+5rQOtU+aVULGj+uaZsPYaABnMHn
 iUkAG4BPd/i6DDreU2+Uk65dGQnOvr30WlA2uguvlP8YOkJme7y4Z0f7eEaD1WiylGZW
 IWKw==
X-Gm-Message-State: AOAM5320ia/780yHnC2O8Py3OBtBt0DO/ZKi4ThDrPcvbq+ynYoGdjGh
 zx7z/Ie6nvueROL9/bg7EsOzAA==
X-Google-Smtp-Source: ABdhPJy5kqVoAGdFOgTglBxewMlwdW8ruFpn9+vILWiVfuwH4mYyoRQK+sRfSjk5X0S6oxgVa3nVkg==
X-Received: by 2002:a5d:54c5:: with SMTP id x5mr14934414wrv.607.1638463787415; 
 Thu, 02 Dec 2021 08:49:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm291805wrt.44.2021.12.02.08.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:49:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80D691FF96;
 Thu,  2 Dec 2021 16:49:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2?] Revert "vga: don't abort when adding a duplicate
 isa-vga device"
Date: Thu,  2 Dec 2021 16:49:29 +0000
Message-Id: <20211202164929.1119036-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.

The check is bogus as it ends up finding itself and falling over.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733
---
 hw/display/vga-isa.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 8cea84f2be..90851e730b 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -33,7 +33,6 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
-#include "qapi/error.h"
 
 #define TYPE_ISA_VGA "isa-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
@@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
-    /*
-     * make sure this device is not being added twice, if so
-     * exit without crashing qemu
-     */
-    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
-        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
-        return;
-    }
-
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.30.2


