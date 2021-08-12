Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D23EA221
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:35:42 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE77l-0000FK-9V
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76H-00058q-UH
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76C-0007mg-D8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so4056199wmi.1
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2pVr2aNOpSFLo/LYsO8eopoOEXQ86IrfFfAepPzciZQ=;
 b=F+WeSFxQpgKYzJxh3GXn8PpN8/kYg/REjMz1ksOK58AdeZIM8ntASqYUJOj17uKck0
 QYgZNM2Av/qEcgLsQ/WIucKp9DkqyiZWaM6QH1vncsbtWJSGFE5eCl9sYw7S2GuYDhxN
 PamW4klwlbSqumRVqQgbipTSIzOmMXWDhb0yihNd6m9AsFRQ717hsQGFnfyCUIHXyBH4
 sBx01wIi7WiDzr2y3eXHtqIKtkHd4i/dl+yY3/egX2/Ly5Z4svslJoEbNgKj3oAtcjFZ
 5pytDkCOp1jdz+gguLNdiM+Yv6ZzwvdDm/jKJpqQ7zU0ltg+YlnDZMBUqSw6uuhWkCN5
 T2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2pVr2aNOpSFLo/LYsO8eopoOEXQ86IrfFfAepPzciZQ=;
 b=fBkcaHrepULx1KcJ0g3DpV1PP2OM35/oyx3b02bygLtYeb9q9KnCxjUdbK9Lf0mxdG
 CU6ToOcQnlNmv8gkk3KJid+PZcFs+DkTSZ/mhviCE31zcFtFUcrL5X68n8OKJiscqd+B
 DdJjJAK/lFqQ6KbUT8p37g/hpB2uvRaLV+0ul4LYN257YV3PkSLqyRQjFm1bCuMo3FLc
 WXy18yt09GNiW2m3YHkiiXCuEs4ZOuhui+x7sgr6vatmne+Z6PcY2WOMBx9nUyeV9mWG
 NGolmFp3foaw0uSwSjn5pRc2DrBS6xKM5kBXGFEgNeO972F2AFxTkAmye9UmsdPPvLUA
 CkZQ==
X-Gm-Message-State: AOAM5321qQIYIEYLkQFYD5+l9HDi3DMv+2o4sTrTinKLZdTzWS/S1VDS
 5zp1z3wD9mDVwDnQJc9rh5KwVg==
X-Google-Smtp-Source: ABdhPJxt3WvidPMJB2hhb3GkWoGI/PDapByZ6yv0Cf8IiaU3MuT7J0GnHmUfYY4JmfHPLMwHK+qLeg==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr12317494wmj.117.1628760843141; 
 Thu, 12 Aug 2021 02:34:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/25] hw/timer/armv7m_systick: Add usual QEMU
 interface comment
Date: Thu, 12 Aug 2021 10:33:35 +0100
Message-Id: <20210812093356.1946-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the usual-style QEMU interface comment documenting what
properties, etc, this device exposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/armv7m_systick.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 84496faaf96..685fc5bc0d7 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -20,6 +20,13 @@
 
 OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
 
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0 is the register interface (covering
+ *    the registers which are mapped at address 0xE000E010)
+ *  + sysbus IRQ 0 is the interrupt line to the NVIC
+ */
+
 struct SysTickState {
     /*< private >*/
     SysBusDevice parent_obj;
-- 
2.20.1


