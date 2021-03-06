Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CC832FB77
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:44:42 +0100 (CET)
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ6f-0002l6-5V
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzh-0001Dq-Uk
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzg-0008Qv-ER
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id e10so5848201wro.12
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81TC0bXYTxGLtWhvQ00zHVezRA2hvTHOwclpqQk6LRU=;
 b=FX2vGa9fKdnX5bE0EcKhWXfZYVXe01aTanRKNpaVePHicvi/6pskfOmH9zJC7FzbNG
 pKV6DY9QnzU+0PoXI39JVwfHkeeyW1OwDY0+LprL44G6SevnJEl7v/praoN2DTinrSrP
 /OFenegM9AIQ2rwQS4nVSbr2L5O3IKB0jT2N9DSHPBjSB1jPoLlJTOIyCufAOY9D00Zh
 KFvYt6FxKHl0Y9nsj9jnctWIP0S/bW36dhG36M3OruoiMEBOWFM/rGKCZMUHs5cd9Lk9
 87KdqGS4/m6OAyUxboe9PQM7z0I0n8DmcH9CHrM932J1yeFhQki62wibtqAhv6wLD8o5
 d0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=81TC0bXYTxGLtWhvQ00zHVezRA2hvTHOwclpqQk6LRU=;
 b=nHkcWAuhLpUMl8tSFoJ1ZtSRyDy/FIZZnR6RA7XAMyhaSkCsr2ITnxsWtLMWhPy2kh
 EcUNliWRVuB+DmOIZXmR0AgyY3kaOghLtXRYB3TO57KOAtTJgv6ptpD7ns5wVOIE/AfH
 OibF7Gf57k+XxtAnnR1ZHUW3qB2rKo+uUQH/z8yOQIPH2NoJA2XPgRsJrDUl1nB4JncB
 4gK3ipXU5BJqRfd4s/yWsZ8nf7Nkkw+Kk/3RC3m1nfgjTrBqQsHzPSaWJn+wPL0hpi6A
 eeEsTLnxjGPw+UFjOWiCGePhVYDhbvDJfpe/YuRZ0ZMhkl1nDxjNhPgSx4v1yCAKut6m
 58Pg==
X-Gm-Message-State: AOAM533jgPVlrQkNDuj7kHSvDupCPKerep7KsLQ61m7x0SPV0OmCmCD/
 hZXpOaDwHAeebyMu5EXiYzlCym5ygMA=
X-Google-Smtp-Source: ABdhPJxduzeVsqz3RfXVtcIAWAT3CXvnXqCAx2XWg2bKSfIP+J898DY8Y0kxuyh7sGkNUAcaI7Dlmw==
X-Received: by 2002:adf:f711:: with SMTP id r17mr14681816wrp.358.1615045047071; 
 Sat, 06 Mar 2021 07:37:27 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m9sm9519549wro.52.2021.03.06.07.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/14] hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
Date: Sat,  6 Mar 2021 16:36:20 +0100
Message-Id: <20210306153621.2393879-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As replaced the generic CONFIG_SH4 by more fine-grained
selectors, we can remove this now unused config variable.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-9-f4bug@amsat.org>
---
 hw/sh4/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index b9f0538d57f..ab733a3f760 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -9,14 +9,12 @@ config R2D
     select USB_OHCI_PCI
     select PCI
     select SM501
-    select SH4
     select SH7750
     select SH_PCI
 
 config SHIX
     bool
     select SH7750
-    select SH4
     select TC58128
 
 config SH7750
@@ -24,6 +22,3 @@ config SH7750
     select SH_INTC
     select SH_SCI
     select SH_TIMER
-
-config SH4
-    bool
-- 
2.26.2


