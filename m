Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A493C276A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:18:51 +0200 (CEST)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tDG-0007qL-8y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t58-0001ct-8G
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:26 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4z-0000xh-TY
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f17so12842830wrt.6
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x+uSZxacODbTK/KRgyLGc1oZvH48wQ1/apF/C2TkCec=;
 b=n8yAjSIiSgFWqF5Ss7+Q3O2q3F6bLmijhj8dF2ELS9ak5D4RS+YzkGAAaeRU8xi0Ig
 WwowxgpexoGByINoHnFEZg6XD5POGF7DlITodT1BON9ktoQKU0Nn4HQZzsQZiB65Mzfu
 I9ZkJ25t6MX2sWC/Xzv6waBy3KorWz5Par+f4YIvxdL7/5e8Crxo13fumSm19yfPqsW/
 qMQlQDyzjAWn2q2XEtKi+hBpW4fJN9L57ga5XlABORtfYK43ffWhoAkCvCVguG0+0a3S
 Ji8uurD8lhusqAer3yursKhAgeMoTcA07l6P+lgddzKNu28UjIQBBITnmDKtGJvMooyV
 Wlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+uSZxacODbTK/KRgyLGc1oZvH48wQ1/apF/C2TkCec=;
 b=iHLBqeh+xrSmy87lYPnCcfCsorHbMcRrcMlcyAKHBmmI8PBPIv/DxjnbDYAea28oC2
 w3OpC9X54dFhMnZT/mbTAlx5xlvd4lZWuPUkNPzq0jbPU0cbmH6HMEe18iYTtvORfZRm
 VNkSYavniPINTDddU1XMvVZxXqii+Vl74Drr8VzoDIChzBIwzxCi/7fbnk76nK7CyJPg
 DHE7/V1bTmNfUZNu2MhjL7jFS7n2ILEotBmTxSJV0YqL+P+MO8jasAHs8lcOo/2gxuhI
 6ggFl3qRinWVcRqhAGJRixTcXDR554J+WmLRNfT6ghwDOLmK1wQtis7d2MuG8xvuZCU8
 /QEA==
X-Gm-Message-State: AOAM5333C9GjL34RwbiMrW6dCCVQS5MhgrfQVs4QQX8r2B2E/YWj/97z
 CtqsM8pvHlNFqTVPWzuzJtcFywSYdeWSP+WU
X-Google-Smtp-Source: ABdhPJyzzERvvs9XQhYuxUTx6M9lE9sLyE/c9kAnaVYq5dZ5rfFD3A8hMpHgES4ivdKEVntvQlWjag==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr2494693wrn.329.1625847015756; 
 Fri, 09 Jul 2021 09:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] hw/arm/stellaris: Expand comment about handling of OLED
 chipselect
Date: Fri,  9 Jul 2021 17:10:01 +0100
Message-Id: <20210709161003.25874-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The stellaris board doesn't emulate the handling of the OLED
chipselect line correctly.  Expand the comment describing this,
including a sketch of the theoretical correct way to do it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 56 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8b4dab9b79f..ad48cf26058 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1453,13 +1453,67 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *sddev;
             DeviceState *ssddev;
 
-            /* Some boards have both an OLED controller and SD card connected to
+            /*
+             * Some boards have both an OLED controller and SD card connected to
              * the same SSI port, with the SD card chip select connected to a
              * GPIO pin.  Technically the OLED chip select is connected to the
              * SSI Fss pin.  We do not bother emulating that as both devices
              * should never be selected simultaneously, and our OLED controller
              * ignores stray 0xff commands that occur when deselecting the SD
              * card.
+             *
+             * The h/w wiring is:
+             *  - GPIO pin D0 is wired to the active-low SD card chip select
+             *  - GPIO pin A3 is wired to the active-low OLED chip select
+             *  - The SoC wiring of the PL061 "auxiliary function" for A3 is
+             *    SSI0Fss ("frame signal"), which is an output from the SoC's
+             *    SSI controller. The SSI controller takes SSI0Fss low when it
+             *    transmits a frame, so it can work as a chip-select signal.
+             *  - GPIO A4 is aux-function SSI0Rx, and wired to the SD card Tx
+             *    (the OLED never sends data to the CPU, so no wiring needed)
+             *  - GPIO A5 is aux-function SSI0Tx, and wired to the SD card Rx
+             *    and the OLED display-data-in
+             *  - GPIO A2 is aux-function SSI0Clk, wired to SD card and OLED
+             *    serial-clock input
+             * So a guest that wants to use the OLED can configure the PL061
+             * to make pins A2, A3, A5 aux-function, so they are connected
+             * directly to the SSI controller. When the SSI controller sends
+             * data it asserts SSI0Fss which selects the OLED.
+             * A guest that wants to use the SD card configures A2, A4 and A5
+             * as aux-function, but leaves A3 as a software-controlled GPIO
+             * line. It asserts the SD card chip-select by using the PL061
+             * to control pin D0, and lets the SSI controller handle Clk, Tx
+             * and Rx. (The SSI controller asserts Fss during tx cycles as
+             * usual, but because A3 is not set to aux-function this is not
+             * forwarded to the OLED, and so the OLED stays unselected.)
+             *
+             * The QEMU implementation instead is:
+             *  - GPIO pin D0 is wired to the active-low SD card chip select,
+             *    and also to the OLED chip-select which is implemented
+             *    as *active-high*
+             *  - SSI controller signals go to the devices regardless of
+             *    whether the guest programs A2, A4, A5 as aux-function or not
+             *
+             * The problem with this implementation is if the guest doesn't
+             * care about the SD card and only uses the OLED. In that case it
+             * may choose never to do anything with D0 (leaving it in its
+             * default floating state, which reliably leaves the card disabled
+             * because an SD card has a pullup on CS within the card itself),
+             * and only set up A2, A3, A5. This for us would mean the OLED
+             * never gets the chip-select assert it needs. We work around
+             * this with a manual raise of D0 here (despite board creation
+             * code being the wrong place to raise IRQ lines) to put the OLED
+             * into an initially selected state.
+             *
+             * In theory the right way to model this would be:
+             *  - Implement aux-function support in the PL061, with an
+             *    extra set of AFIN and AFOUT GPIO lines (set up so that
+             *    if a GPIO line is in auxfn mode the main GPIO in and out
+             *    track the AFIN and AFOUT lines)
+             *  - Wire the AFOUT for D0 up to either a line from the
+             *    SSI controller that's pulled low around every transmit,
+             *    or at least to an always-0 line here on the board
+             *  - Make the ssd0323 OLED controller chipselect active-low
              */
             bus = qdev_get_child_bus(dev, "ssi");
 
-- 
2.20.1


