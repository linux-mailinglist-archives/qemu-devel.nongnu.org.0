Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D54210C0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:53:34 +0200 (CEST)
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOPN-0006W9-P9
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJp-00062Q-3q
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJm-0007Az-8Y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e12so10657202wra.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIR/QX1UEyMaEQkzlnv0koPsuyPpzDzqnJZkMaWnDRw=;
 b=MpHMUEsJ982icNkG1XQ1Gfu47udzGozksirRt3xXnr1w2t+Yj7ahjkG6wdr5oCob6l
 PVIvV5NQAFMgTvqb0SCYSEppUmKTFZX/Iv89AsXBmYRW9S/GwLFturOIdwnsbSMw5EK/
 QFldFLW52dm4oqucRRghu5MAX05C7CF8MYJiFZqqhx0Uw4js0+ol1hE+wt3+LR8RpIgo
 WEkLCt/UXFUXm3eFAcFPPF+yzFpVf8uifzYdQw44tqF6IYpp7wiDaiBVQJZW8GOBMTg4
 ZVlPD6kJiYjrT5yh3bXvY3uwR5NVsfHPJQxFAsgiX78eH4FFRZg9matQbuzvowCD8JGW
 V7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIR/QX1UEyMaEQkzlnv0koPsuyPpzDzqnJZkMaWnDRw=;
 b=UD86s0A4/QOzlBFK6x/fC+dIg+P7zCbaPgRfZVJCOSkGk9w7l6TExIfBdNdwI6f6Mf
 kZeSL527mxlf36wbCYhdQ2qlfNBDjCUX9l9FKNE+1tlIiF9OHWdE80zFB6ljdckLqnYe
 /6IoJ4dBM9bNkjpy1pg9btQtmMgSIQLSVxyAl0yLqEcJodxFSruJnw2fyYOSnII3XnjF
 PeGiIiCzbW2drzCMXcl3YzSc1JOI4MZfqC/C6fU8yBvCErdy8cG/17ma+CVT13tRmnlq
 +NYwpxTZCjiW7xswUgN0TibM8CAZrn/nRICc8GxHQw6BJ2/hAhf2DKBzRtL3o3BNY5Kj
 TH8w==
X-Gm-Message-State: AOAM530SaoMZhW11lRrYyyikSbDrzXL/+4RMmvvHYEIPjkk2GPEwGAIn
 Wfp0S+ms9pF4qz8r6isPxL152A==
X-Google-Smtp-Source: ABdhPJz3u1mwtgIktsGzOfWqz9dioVktdfiWiIiJ1X6oaeMvdZhwe5zgtuxZQ+2DNfXQa8CUFS4TVg==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr13947426wrg.154.1633355263744; 
 Mon, 04 Oct 2021 06:47:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm14357977wmq.12.2021.10.04.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CE6F1FF99;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/7] hw/misc/bcm2835_property: Handle the 'domain state'
 property
Date: Mon,  4 Oct 2021 14:47:36 +0100
Message-Id: <20211004134742.2044280-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The kernel is happy with this change, so we don't need
to do anything more sophisticated.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/misc/bcm2835_property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 791c7554ec..b089e47584 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -133,6 +133,14 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        case 0x00030030: /* Get domain state */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: 0x%08x get domain state NYI\n",
+                          tag);
+            /* FIXME returning uninitialized memory */
+            resplen = 8;
+            break;
+
         case 0x00038002: /* Set clock rate */
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
-- 
2.30.2


