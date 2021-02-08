Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3E314044
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:20:56 +0100 (CET)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D1j-0007Ah-W2
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wy-0004ji-PW; Mon, 08 Feb 2021 08:51:41 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wh-0008Nn-Ul; Mon, 08 Feb 2021 08:51:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so4219347wrs.11;
 Mon, 08 Feb 2021 05:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=na17oWuPKTj+SU6c6Dkqcg8IZxkfU6eQT/pu9RwQ//c=;
 b=dSedH1SxplSrJIo17nt4Yjv0otJr09g7f7pDzGmziC5RxvP+vmlQEJKncGy3q+BUyY
 jCQlXX2Dm9eoQvJegJYDlWOuWOmvGlwLaRj+bRUNnygDCU2pnoDK9VjuoYhXVqMGwGbF
 GQg+FZXmj5LC4dUWpWC9BnH16L3jRz+RD+jZA36Bxv5AbBSI5ab4ko2ThLSnpLoIzmvE
 SQc1i2OjRC5m+QnjPGEP4uq2uFHIuxMvdw5PZaszfdIcfsPw8CTyGfYTaF1qe3eYZDrO
 ttzu9/TI9XIfcJILv0be74ybXgJ6MtPOKAx5WLUcGBZ4fCu166P6ZIamCwjchoJA+yYh
 /RMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=na17oWuPKTj+SU6c6Dkqcg8IZxkfU6eQT/pu9RwQ//c=;
 b=bCQLco5GIiePlK9udzWAM2M+sueZW5+kLPQlZg3/pLyRi5uBXbKEcViWB8AyM8vppq
 Ow+coRG6i7euId2UI5mlnn7lT01JP0zMS1VZwPWiHExqwBRrHySH56Hmsr7lb0WBxVqw
 4VBMvph0+hUOKG0l7WqA2C9TD9nBUY/QIl73F22z9vOFLGqE6IoFWp8egAYZfOhi7t/K
 InIqUqYKD+RCeQ/F/TpYhmHhPT29zeWspuDJAyd1Bpj6VAGSmNRWbRiYI+WLZATAxjR1
 AvoaUYdmfN0LmW6OX078DGjqlhe7qorrsloFLx/SuUgPeSQWZpInZb7MG40cSe/n2OIN
 I7Yw==
X-Gm-Message-State: AOAM532f3XjLWqmVxp/m9Cpblc//Bn1q/x7JI5QUWZZQi0iCmBBjwqQc
 t6+MD72HglzwQ4KLYsUBb6AetWDarF0=
X-Google-Smtp-Source: ABdhPJxOrrCsrJsNXlrOHytBJpUcWhTuAG8que3wTHno94u1TGkhMhVtjswH2PAX93477SX1KhswZg==
X-Received: by 2002:adf:e805:: with SMTP id o5mr3091832wrm.227.1612792270221; 
 Mon, 08 Feb 2021 05:51:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l38sm4384680wmp.19.2021.02.08.05.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:51:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES
Date: Mon,  8 Feb 2021 14:50:48 +0100
Message-Id: <20210208135048.2601693-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208135048.2601693-1-f4bug@amsat.org>
References: <20210208135048.2601693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Milkymist board requires more than the PTIMER. Directly
select the LM32_DEVICES. This fixes:

  /usr/bin/ld:
  libqemu-lm32-softmmu.fa.p/target_lm32_gdbstub.c.o: in function `lm32_cpu_gdb_read_register':
  target/lm32/gdbstub.c:46: undefined reference to `lm32_pic_get_im'
  target/lm32/gdbstub.c:48: undefined reference to `lm32_pic_get_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_im':
  target/lm32/op_helper.c:107: undefined reference to `lm32_pic_set_im'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_ip':
  target/lm32/op_helper.c:114: undefined reference to `lm32_pic_set_ip'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jtx':
  target/lm32/op_helper.c:120: undefined reference to `lm32_juart_set_jtx'
  libqemu-lm32-softmmu.fa.p/target_lm32_op_helper.c.o: in function `helper_wcsr_jrx':
  target/lm32/op_helper.c:125: undefined reference to `lm32_juart_set_jrx'
  libqemu-lm32-softmmu.fa.p/target_lm32_translate.c.o: in function `lm32_cpu_dump_state':
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_ip'
  target/lm32/translate.c:1161: undefined reference to `lm32_pic_get_im'

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/lm32/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index 518c84ed508..8ac94205d71 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -6,11 +6,11 @@ config MILKYMIST
     bool
     # FIXME: disabling it results in compile-time errors
     select MILKYMIST_TMU2 if OPENGL && X11
-    select PTIMER
     select PFLASH_CFI01
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+    select LM32_DEVICES
 
 config LM32_EVR
     bool
-- 
2.26.2


