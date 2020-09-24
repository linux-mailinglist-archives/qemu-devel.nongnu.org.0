Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901D276FBB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 13:20:32 +0200 (CEST)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLPId-0005oA-EN
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 07:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGS-0004Bx-1N; Thu, 24 Sep 2020 07:18:16 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:51876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kLPGQ-0003uQ-ES; Thu, 24 Sep 2020 07:18:15 -0400
Received: by mail-wm1-x344.google.com with SMTP id w2so3131456wmi.1;
 Thu, 24 Sep 2020 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xrbRo504l8HmLzKW94CHr7HRIV9naYmGmvNreSdZ4Y4=;
 b=pT5c55imxwmvC1IsfJ9fpaZo1YMhKpo0WscLY+sWgdDa1npOly1YycADGyNd4mfBkL
 lI5sc/yipuV2kprHvWCqs61AwhGe4/e8YysVTpnIEcKBUCwS4epzlmAvRqXBjGNl1+Nq
 j7koYVQUuwzBTxXzC17ltXrVLkOEvdtgUKOgkwbwkSCRLPIK2osybRSvZacazf+pzfN0
 tguhymcuTuzn2xVX8hs0/RAKLyyZfwLu/wbFYVINnJ6oU/sXcMcyK/V4G/QSAEsejhaX
 pE77Lk7cVA0SCf0tfNyVv0g/SrH1g/kF8DloErj5Y2d2Tgh4n02MUgDHVu/9iMoVqBRc
 jV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xrbRo504l8HmLzKW94CHr7HRIV9naYmGmvNreSdZ4Y4=;
 b=lr96Q7lPDvLVxVfSbiFtFSt5wKJQxU6EnuCtBgVpSyfBFE6WxSbshDk36wFQe13bdD
 txYOIyM7bWeo4IBpAiig69KbEc75c5NdqucvfGry60ICgYqKXRopWT+DTVhwKcW4Rz/b
 5rBWc7HsppOSxC2hJxPHuPA4uFK+aUz+/EU7uhe0iXSx4/5CFaZDIyQPRrc8RbpaEwEQ
 kgfkElSjE3w1sH4ATJ25mcrjsEyjyPnXvIydq0dKnv6L7USvxXXfjUvxPpRkVqnEgAb8
 l0aAGDmdDnAANMGaocwYzMgLzgMVXoUoCuOTIqkXokwwbC1wyARg0iG6xWvwlYprFPVY
 YYSA==
X-Gm-Message-State: AOAM533nTcBdPBfxRXVFFb9jQahYF01u58j4aFBP7l3yylbkFHlmo9I5
 ELQ143APjdaQb6Q8+empueiiQd3Wkpo=
X-Google-Smtp-Source: ABdhPJyq+oD4O9J8WV4mf8RztBKJFYLPJiLSE5dVoZQj9L9mf5ISdNh0RE7vXPXap9wLBQReu/eeTQ==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr4099071wma.41.1600946291778; 
 Thu, 24 Sep 2020 04:18:11 -0700 (PDT)
Received: from x1w.redhat.com (234.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.234])
 by smtp.gmail.com with ESMTPSA id h76sm3400363wme.10.2020.09.24.04.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 04:18:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/8] hw/arm/raspi: Display the board revision in the
 machine description
Date: Thu, 24 Sep 2020 13:18:01 +0200
Message-Id: <20200924111808.77168-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924111808.77168-1-f4bug@amsat.org>
References: <20200924111808.77168-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Display the board revision in the machine description.

Before:

  $ qemu-system-aarch64 -M help | fgrep raspi
  raspi2               Raspberry Pi 2B
  raspi3               Raspberry Pi 3B

After:

  raspi2               Raspberry Pi 2B (revision 1.1)
  raspi3               Raspberry Pi 3B (revision 1.2)

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 811eaf52ff5..46d9ed7f054 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -312,7 +312,9 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
     rmc->board_rev = board_rev;
-    mc->desc = g_strdup_printf("Raspberry Pi %s", board_type(board_rev));
+    mc->desc = g_strdup_printf("Raspberry Pi %s (revision 1.%u)",
+                               board_type(board_rev),
+                               FIELD_EX32(board_rev, REV_CODE, REVISION));
     mc->init = raspi_machine_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.26.2


