Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF203AEC3A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:23:44 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLm4-0008TK-07
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjv-00069J-Cl
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:31 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjq-0000V4-Dw
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:31 -0400
Received: by mail-wm1-x32c.google.com with SMTP id w13so4167931wmc.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7HxxF0fRYYPMQhvrUbvYs+fS8StYcWHvNPLgRuYDaQ=;
 b=hccrKMVVnd+IYce49fkj9GLnE7V187gO19/9RPmajuJ2pQXBm3gKRHhI8i4/pTl//s
 nyaVFBPVbjcCUGMRfNf3RRwsDTgGCWxgKioR5X6jLKXDEicP8w9WJe+4Sctb5AV1233P
 NcEozoKdJPE/Dp6sikONkw9ojP4ILbFgCDQMkdxf/fEymOA9JI9wdDTprLGHs8I5ys0c
 oVoEe4SvaE9uh1KhBOqK6CHjeDmuBgN98VYzqGX+XiUhRb3+TbxCSskoB4zD2TSXz3Zc
 gro3VSJcZNUoitWR6oKx4bLgvlvOO+BgkJsypagVYtfM/hdoPHGRBKwBCD9l/rdQgUPw
 aaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7HxxF0fRYYPMQhvrUbvYs+fS8StYcWHvNPLgRuYDaQ=;
 b=TXI71RKXGmUX7wg16wrg/lG9Ub8RXTMyQoHnLPsF0/8+nqHMfxtEgP+X26Lbn9H5NS
 VGcsuM253YLoRQBdpbQkE3hkE+IDmb1RJfNvZCgGNfUS2WXH5992mTBO6BkmjdZZoY1b
 ODBltvYXKfEHx6xks6wn3sIuxAHhbsMt+A1fiCiz8LdWekm6svx3ggm4wYN4upfCRJ3s
 v9crrz4nL7+skVRSaT4QjT2/OnfbUw1iDYABxIdWlebaYY59zjljhEvJN/vNllxBG0Gx
 tOwnKQzR9H3MN/SP7pX8HT18hFWuKi4xixm06X8dRvphjBS3eDLOyr5swqA9EGtdzwb0
 PtkA==
X-Gm-Message-State: AOAM532UADvYeDS0nhObvelV7siRTHZWJG531yPJadqOj+yzuIJsIudI
 YyilZvA8TBVx7LyBxt0Cuajeqw==
X-Google-Smtp-Source: ABdhPJykXT3wf/OqXO23YZ1xqIEFO3B4E3sl9t1icULqjJLsm2lOKzfHcjz50tvPvY+oCPOttgd84w==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr27543407wmq.109.1624288884950; 
 Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p13sm17072753wrt.89.2021.06.21.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:21:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE3A71FF8C;
 Mon, 21 Jun 2021 16:21:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Mon, 21 Jun 2021 16:21:17 +0100
Message-Id: <20210621152120.4465-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 647b5c8b43..528f71bb9d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -368,6 +368,7 @@ config XLNX_VERSAL
     select UNIMP
     select XLNX_ZDMA
     select XLNX_ZYNQMP
+    select OR_IRQ
 
 config NPCM7XX
     bool
-- 
2.20.1


