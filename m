Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E9242EE3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 21:03:27 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5w22-0003ZR-Q4
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 15:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5w0r-0002UY-7v; Wed, 12 Aug 2020 15:02:13 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k5w0p-0006EW-IM; Wed, 12 Aug 2020 15:02:12 -0400
Received: by mail-wr1-x441.google.com with SMTP id f1so3055564wro.2;
 Wed, 12 Aug 2020 12:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+iUv2TzpXLrAdI56+r9nGAkPMiWMPyqKq2ram8/0+Co=;
 b=ewiL921ImKlRlevO/ifdoTJyIbgpgneiRO4Kv6Z0/gbEFnJY1rw9sLS6++vCVOc5bs
 4jfiCgBN8eh2KphPBkOe3Kxe7x5JcNaopu31OxA5JfvxjrzYNi+FVjKr82oXGW/M6Lsh
 q8+TkYt7czYFCQ2WrzYuoqvM77n/KTV9QNaIMyJgc7c381WTdKBF4wMGbz4Pri52Lwk3
 O4OLMYyVo46KLCFOjGBwQ3xlcEGhaWnyaBpndAv1Tm6CUnIPwo3r82QkUutCuhNJGE9c
 BgokAYskXAyt8+LnATQhH/W3fRZMUcuEdDL8EZmPFg7nMTLavmqd97tsgsbGGS2f4h/Z
 ndKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+iUv2TzpXLrAdI56+r9nGAkPMiWMPyqKq2ram8/0+Co=;
 b=NZDKxpfLGopWRSm271DdahH+Q4DaexRlOCASnTXoIUszA0v3Ma5VCMPv3mB+ntwzKT
 XVMg6tbtb5tbAz645TFF9A0fkEcJBYFjEb3D5IvXH1WppSnXO+tqpHDWrBsqtv6ZirTE
 6sX58+Yk+cLebp0aht+ruduX+SgrQglsiWm8Fqc9Q6sXhMZ/FzDwOJalgwEmZ74cgDep
 DP6JeNY/jV59XYJ59uQKndo9NfDsV3xx8E2+GXnyAzY2daKrEgNsZ50lMch+fhDgTFDY
 /FCvIR8zoDiD70R+elfP/xL3DZFz/ryXUMNlgrOlyvM+4NNMnDG7ef2MygZwBSqEhyyM
 PicQ==
X-Gm-Message-State: AOAM532LtUP1WR9QFGaxtF4pDYx7aBN0BtKvgGjpF7TqIWLMmycPOuVO
 s8CHkNXuMIxkekveAeAZlDXluubM
X-Google-Smtp-Source: ABdhPJxwmxPcVC/oXUsJch+Gs8mCqwRyQQrvO1MHl0DIqZLBjq0dRL3BBqCFdr67h7+6aQoF20QhoQ==
X-Received: by 2002:adf:de91:: with SMTP id w17mr576191wrl.108.1597258929379; 
 Wed, 12 Aug 2020 12:02:09 -0700 (PDT)
Received: from x1w.redhat.com (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z12sm5689441wrp.20.2020.08.12.12.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 12:02:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/misc/unimp: Display value after offset
Date: Wed, 12 Aug 2020 21:02:04 +0200
Message-Id: <20200812190206.31595-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200812190206.31595-1-f4bug@amsat.org>
References: <20200812190206.31595-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To better align the read/write accesses, display the value after
the offset (read accesses only display the offset).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/unimp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/misc/unimp.c b/hw/misc/unimp.c
index bc4084d344..ee2e536c8b 100644
--- a/hw/misc/unimp.c
+++ b/hw/misc/unimp.c
@@ -22,7 +22,7 @@ static uint64_t unimp_read(void *opaque, hwaddr offset, unsigned size)
 {
     UnimplementedDeviceState *s = UNIMPLEMENTED_DEVICE(opaque);
 
-    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read "
+    qemu_log_mask(LOG_UNIMP, "%s: unimplemented device read  "
                   "(size %d, offset 0x%" HWADDR_PRIx ")\n",
                   s->name, size, offset);
     return 0;
@@ -34,9 +34,9 @@ static void unimp_write(void *opaque, hwaddr offset,
     UnimplementedDeviceState *s = UNIMPLEMENTED_DEVICE(opaque);
 
     qemu_log_mask(LOG_UNIMP, "%s: unimplemented device write "
-                  "(size %d, value 0x%" PRIx64
-                  ", offset 0x%" HWADDR_PRIx ")\n",
-                  s->name, size, value, offset);
+                  "(size %d, offset 0x%" HWADDR_PRIx
+                  ", value 0x%" PRIx64 ")\n",
+                  s->name, size, offset, value);
 }
 
 static const MemoryRegionOps unimp_ops = {
-- 
2.21.3


