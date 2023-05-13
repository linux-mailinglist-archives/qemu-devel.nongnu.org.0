Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96C7701606
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 12:11:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxmC6-0008IP-Dc; Sat, 13 May 2023 06:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBv-0008Fo-Al; Sat, 13 May 2023 06:09:32 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pxmBt-0004Mu-5r; Sat, 13 May 2023 06:09:31 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-965ab8ed1c0so1801364166b.2; 
 Sat, 13 May 2023 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972565; x=1686564565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QAJ0NoXVVjNhpzbrMGuIQeXjVMHa9REQcHYBD4P+/Ho=;
 b=ieFjd9QXrPx2UZu4pB1FiSEW/Wlqyxcn3vlyYFMu3GWCI4WkW8XFOlI6c4CHlHr/vO
 6n6MxfKnCYjmxq6QZqDqjqJ2vMdO/yM0P7mYs843PkWa9/XRCyijwLySTYBAgNN7Cvah
 xfAyCDr8XZCVe35i9yZVkik7Qf6Lm1Crz1kH0O6SbZS/NChff0hQyeFQEreoEEcf6ato
 p7zkfPPP7TskCT07JBaqHwTZ4pAbILAojpC9hR44MkYbq1ROWs0rW+p/AFh3W1X2h5cm
 jsQLqQ+ML8x6nVvMuqCfCT64iVzaOdkXepavvanpu3zbbg92olzSwen9JRKcNvhXJhWb
 zrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972565; x=1686564565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QAJ0NoXVVjNhpzbrMGuIQeXjVMHa9REQcHYBD4P+/Ho=;
 b=Q8jM2fRzX2MNx5Ncz+jlKMgPLpK8Mm1+wZyCDafcNiR5AVkcxe5RTcNUfKGswRcHG4
 xfI/W1ne3JFjwRcTsSuAKNgSpUSNu2xdzwOZiAr+15anRZSEBjgiguzR7BGYsKYR7Pec
 LINQbh2GHWWqOqjT00ENVJU8UXCJO4c7gzv02yWFiU7LJC4AdSeM3bU7DUPuWSPB+bL8
 4WCLc5LysRJkA//jwfMFTTpG0JnIU98h/vRxCFeCgMcbA1gSFPSP692qgE5xnDcVLngl
 pJYMevID/Bikyf+LfUa3pEMmrbYMAgzOEnAbcijRRCsPDu2UjPIHxBmLWCqV7rwm7gjx
 MJCA==
X-Gm-Message-State: AC+VfDwqDZEdqVfJBtrRcCRP3WcKa3p8+4drNY2XsklmPyp9K8M8U327
 sHeXdLQScvrTbw0Wv2LRHV/wRKc9Z0s=
X-Google-Smtp-Source: ACHHUZ4T9AMrPpnTskQhpisYUDPJVXS2F6wtXJn1NyPCasbmp1iWvzmKkOwN5Sx7FDRiK4uCiy9nVw==
X-Received: by 2002:a17:907:9810:b0:969:f677:11b4 with SMTP id
 ji16-20020a170907981000b00969f67711b4mr15676753ejc.37.1683972564898; 
 Sat, 13 May 2023 03:09:24 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-013-174-037.77.13.pool.telefonica.de. [77.13.174.37])
 by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm6645285ejc.120.2023.05.13.03.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:09:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 2/4] hw/arm/omap: Remove unused omap_uart_attach()
Date: Sat, 13 May 2023 12:09:04 +0200
Message-Id: <20230513100906.46672-3-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230513100906.46672-1-shentey@gmail.com>
References: <20230513100906.46672-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The function is unused since commit
bdad3654d3c55f478e538037d9eccd204e5fc8ee ('hw/arm/nseries: Remove
invalid/unnecessary n8x0_uart_setup()').

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/omap.h | 1 -
 hw/char/omap_uart.c   | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index c275d9b681..067e9419f7 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -724,7 +724,6 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
                 qemu_irq txdma, qemu_irq rxdma,
                 const char *label, Chardev *chr);
 void omap_uart_reset(struct omap_uart_s *s);
-void omap_uart_attach(struct omap_uart_s *s, Chardev *chr);
 
 struct omap_mpuio_s;
 qemu_irq *omap_mpuio_in_get(struct omap_mpuio_s *s);
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index 1c890b9201..6848bddb4e 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -175,12 +175,3 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
 
     return s;
 }
-
-void omap_uart_attach(struct omap_uart_s *s, Chardev *chr)
-{
-    /* TODO: Should reuse or destroy current s->serial */
-    s->serial = serial_mm_init(get_system_memory(), s->base, 2, s->irq,
-                               omap_clk_getrate(s->fclk) / 16,
-                               chr ?: qemu_chr_new("null", "null", NULL),
-                               DEVICE_NATIVE_ENDIAN);
-}
-- 
2.40.1


