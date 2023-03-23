Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A5D6C7031
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfPfi-0005DL-AK; Thu, 23 Mar 2023 14:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3P5ocZAYKCg4q5o8s5u22uzs.q204s08-rs9sz121u18.25u@flex--crauer.bounces.google.com>)
 id 1pfPff-0005D3-TS
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:28:19 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3P5ocZAYKCg4q5o8s5u22uzs.q204s08-rs9sz121u18.25u@flex--crauer.bounces.google.com>)
 id 1pfPfe-0005mv-3r
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:28:19 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 20-20020a630514000000b0050bed8b0b61so6198260pgf.11
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679596095; x=1682188095;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+yqME3RHbF+cljN6RjNGgsjOm4zuk60ET0EC9+gNnpE=;
 b=HnEuQkkJ2XSeAtxCqH7GVDIZJckzcjYGUXCJEtoljh22ZVRQWJYhsWeAz1MOf8dCmT
 ggwVawCWPwCM1IC/XEtjlkG29LuV1FPHIaqI40sxNj4jVnj57NjeVUpYeSN3qaylBSBP
 fZr/5+qSwR5XqlsQVA67A8YFYTMk/drShkQm6RByRch5L8Eeo4M+xFeeyiiGs6kVGerH
 xtbfjzw7o3oxd1Ipx8jXr4eZWy67MVqC6t6BOXyBG5yKI4p2yC6A4/WqRTJxCiJtCg/A
 wP2tffKLtDm8Z/z1yOHSn4yAEJy9fAQ2cIaXo5DN/p5mmolmHcC5SUgWKtBKOcgoErqI
 BvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679596095; x=1682188095;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+yqME3RHbF+cljN6RjNGgsjOm4zuk60ET0EC9+gNnpE=;
 b=I3JcCoMTnJH4zw0No1PXeYworTOKY+DrQjBsuAw29cBXkPUicWsdFkQ7U0mKZRrVXL
 pi+sulZ6oealXf6lviTg3uI7jYeV9Gp+1M8RlzgBTTxLqdLtigI4nL083oYcHqlmudp2
 /ymXOjQBzEg22nxQxEBKNF3PwBoTdig30Yjw3SUCJGfCMd14nwz06EcIQA6mw0j3IxUZ
 kJ8GcP1wXTG4yUzgDA+DqW8BA3SimEPaOPgLxXMy8UhleAqP1JUklSRi/f8N4A2xNBH0
 qhimMPR/NKlcARIgLiXXDoiQVNRhyi4xjiQRXeYrhE1d4u+F2FSdG/XlM3S0vkyOm1E1
 Ti4w==
X-Gm-Message-State: AO0yUKXK+e5k/1D3aYA7FNU+RNd1HaAXhrBc6yA1FaFgCqiYFil/bPSL
 zzEVwzzdNt5E1CP4Uk5sw0PyuzD8ywM=
X-Google-Smtp-Source: AK7set9G/hu4DsUbNACo0CXi9hgj10yzZeY5E42fiPnnDP+17+e+5LIT9V81qUqH1zI6vERY+p94kBAEIrE=
X-Received: from crauer-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:100f])
 (user=crauer job=sendgmr) by 2002:a17:902:bb86:b0:19f:1c64:f605 with SMTP id
 m6-20020a170902bb8600b0019f1c64f605mr2589037pls.1.1679596095104; Thu, 23 Mar
 2023 11:28:15 -0700 (PDT)
Date: Thu, 23 Mar 2023 18:28:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230323182811.2641044-1-crauer@google.com>
Subject: [PATCH] hw/ssi: Fix Linux driver init issue with xilinx_spi
From: Chris Rauer <crauer@google.com>
To: alistair@alistair23.me, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3P5ocZAYKCg4q5o8s5u22uzs.q204s08-rs9sz121u18.25u@flex--crauer.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The problem is that the Linux driver expects the master transaction inhibit
bit(R_SPICR_MTI) to be set during driver initialization so that it can
detect the fifo size but QEMU defaults it to zero out of reset.  The
datasheet indicates this bit is active on reset.

See page 25, SPI Control Register section:
https://www.xilinx.com/content/dam/xilinx/support/documents/ip_documentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf

Signed-off-by: Chris Rauer <crauer@google.com>
---
 hw/ssi/xilinx_spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 552927622f..d4de2e7aab 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -156,6 +156,7 @@ static void xlx_spi_do_reset(XilinxSPI *s)
     txfifo_reset(s);
 
     s->regs[R_SPISSR] = ~0;
+    s->regs[R_SPICR] = R_SPICR_MTI;
     xlx_spi_update_irq(s);
     xlx_spi_update_cs(s);
 }
-- 
2.40.0.348.gf938b09366-goog


