Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C8320B40
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:06:54 +0100 (CET)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqJx-0002wQ-H1
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprw-00016C-Rm
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:57 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprv-0003dE-Ga
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:56 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v15so16353029wrx.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8uDjfWQ/sIxX8kRNXJ8euWqWigOjj7dJz0jCt5kTchs=;
 b=p+pRljfKwjNP3bu+/xPFoCAtSM7PjIZHzBxwnCdsqY3abCuzVYPJPy3vsuf2dgZ/Wo
 hNSMZh+hlfljzvd2dNcRMh6sQLAHmZp9TeK9ZyixqBXwz/GcBFRTXYeWMq9/otYEEzA7
 RYt1k/Td36/KeWih9I43NP0NuNXB7ssCC/ashlvjUugMHSbC4Mxzjg5iTZZ+IgSadrfw
 5FQPtGAND3mOEqIFDJY6sM9hFekuMUe2rf+xDrmSuyGkc5aZWhqh9E8H18pdMgDFSpg/
 uvQhp87H5tgT8U/dZ2ZlGvbli3URS4XncphfuT3fXIsCYVMsm0Es2BXh+uoH85KXW6Wz
 dGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8uDjfWQ/sIxX8kRNXJ8euWqWigOjj7dJz0jCt5kTchs=;
 b=AN4Nw6VGluvGV+B4luMhO8E+n18QH1kLHb5cRl61SdBFDKUElRAmTSh6q+hlP2n/Gh
 9bcW3zNQCn/enomvzrDLG3S1pX7Rp0ugHSIN96u0iA737C96gO2atgoRA/1cGofNrbKZ
 Z/L75Z8I4i8iZqX3Ctmso0QAFRZ3BRLBtiYAEYw0Cn9R+JtxH+N7ZyNGkeUTAKlBsyAl
 5uUU2v/6FVPrTpWERn+CU2B4mFzQwpYX7w2hxi0x/PPNLfl6s172a/fmZHCdOTkhqOj0
 Da54trgwBNpAH69DemW9JBUSwOCOXIFsH25xgAXsstPOkQY96/vtKlR1u+M2afWTfCZz
 z8Bw==
X-Gm-Message-State: AOAM532MkyQnVsXsxFCntDpLR7lkObsUD18diFS61xv4R34JOhAOF5jI
 xDxSz3XQz7JVBxTUs1XOuO4zbtxIpSM=
X-Google-Smtp-Source: ABdhPJwBnXMnOdM7BvaxmiRmkk4kGQ6WG4QlB3WoFoOpytBGhALFzaKm+Dq4Yu581qVCIZS2/aBwXw==
X-Received: by 2002:a5d:4e10:: with SMTP id p16mr17614678wrt.360.1613918274100; 
 Sun, 21 Feb 2021 06:37:54 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm22512939wrn.0.2021.02.21.06.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/43] vt82c686: Reduce indentation by returning early
Date: Sun, 21 Feb 2021 15:34:29 +0100
Message-Id: <20210221143432.2468220-41-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split patch original in 5, this is part 2/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 47 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index eebaa0d444c..2f69b4d531f 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -258,33 +258,32 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
 {
     SuperIOConfig *sc = opaque;
     uint8_t idx = sc->regs[0];
+    bool can_write = true;
 
     if (addr == 0x3f0) { /* config index register */
         idx = data & 0xff;
-    } else {
-        bool can_write = true;
-        /* 0x3f1, config data register */
-        trace_via_superio_write(idx, data & 0xff);
-        switch (idx) {
-        case 0x00 ... 0xdf:
-        case 0xe4:
-        case 0xe5:
-        case 0xe9 ... 0xed:
-        case 0xf3:
-        case 0xf5:
-        case 0xf7:
-        case 0xf9 ... 0xfb:
-        case 0xfd ... 0xff:
-            can_write = false;
-            break;
-        /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
-        default:
-            break;
-
-        }
-        if (can_write) {
-            sc->regs[idx] = data & 0xff;
-        }
+        return;
+    }
+    /* 0x3f1, config data register */
+    trace_via_superio_write(idx, data & 0xff);
+    switch (idx) {
+    case 0x00 ... 0xdf:
+    case 0xe4:
+    case 0xe5:
+    case 0xe9 ... 0xed:
+    case 0xf3:
+    case 0xf5:
+    case 0xf7:
+    case 0xf9 ... 0xfb:
+    case 0xfd ... 0xff:
+        can_write = false;
+        break;
+    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
+    default:
+        break;
+    }
+    if (can_write) {
+        sc->regs[idx] = data & 0xff;
     }
 }
 
-- 
2.26.2


