Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5F378C65
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:43:26 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5Ft-0008TJ-AQ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zA-0006FC-Lv
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z8-0003Hn-V9
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l14so16426270wrx.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y2OKc7vP5DzVlkf/WS5AgktrZwPw/A4L8DIPa/tOpOY=;
 b=xDZQon8G1Uqtysu5cS+YPXt2vio4UBBFBQHd2gBLgBWjLF9Zk3+0L39bktME+B6dEK
 65JPJFNzOsLhm3i61R55eiIExL402MpeF0vOUQIiUTJ/oXprEbOX7KgE37/hCfeNuh1L
 EyorV5yDWVRz5dQyLbElglEKWDaM5n8B9wUUQVqkaRbL2KOTOheR8Z196Y921USHHCyR
 Wi6AUD3hX3N6Ls1ymo+NwuMZYYkikpytMJtxHLKptrd7lqAj+C8/TUvpqmf9qRGtt5PZ
 Ze1IyCxgJXw8oURF0kTlxX+jqW8Ku1m4E/VpoX+q+Sxyoseg1hyU1doG+wB1aJL8xYs/
 Gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2OKc7vP5DzVlkf/WS5AgktrZwPw/A4L8DIPa/tOpOY=;
 b=lLQqJURnhA822g4PFMgkMHAnvc6f8/S+YlFGqtGj/tZM5JZQZnhGhPlN9jwt1ZeWIY
 udHqg/xu21m68AVIp4yCpaolSqZ6TfE0IUHZJ3SHvEY1ZyQqAGGfzs8dXBT5U70eIVgF
 eXqn+h7MEpKi7UAosF3cBX83yQp4YXWC8e1ermdA5C8p9+7ObzPCf08gDnUBWPg1xwZR
 /0RPMqtF9q3JSLg+UUW7QCQR8ilxln7Jtw8E/uxawMPqi8SyqHyR1aik/zcU4nrwdcen
 Oldn8k9ee01A6/UyHRfRwXJyKlg0rVV+fQFUXH3L5iKU4dHeeBDTsGKux4Ct12w9D0S5
 S5dg==
X-Gm-Message-State: AOAM530LcpPO3P9I3+Mklp+6cy7SIh2Fbo3r/4Y6J2u8YB4TA82nveOG
 Do5hYXd1IeSLvJBuj4l0a56LL0RuTbTWrg==
X-Google-Smtp-Source: ABdhPJwqspTHpsienLbh42fVTIwt/w/giUaUPeJXQ2XZrGMSfJJDqx1T1mo/eviElvqn+ufpGGDVjQ==
X-Received: by 2002:a05:6000:237:: with SMTP id
 l23mr25580165wrz.138.1620649565643; 
 Mon, 10 May 2021 05:26:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/26] hw/misc/mps2-scc: Add "QEMU interface" comment
Date: Mon, 10 May 2021 13:25:45 +0100
Message-Id: <20210510122548.28638-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The MPS2 SCC device doesn't have any documentation of its properties;
add a "QEMU interface" format comment describing them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210504120912.23094-2-peter.maydell@linaro.org
---
 include/hw/misc/mps2-scc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 49d070616aa..ea261ea30d6 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -9,6 +9,18 @@
  *  (at your option) any later version.
  */
 
+/*
+ * This is a model of the Serial Communication Controller (SCC)
+ * block found in most MPS FPGA images.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the register bank
+ *  + QOM property "scc-cfg4": value of the read-only CFG4 register
+ *  + QOM property "scc-aid": value of the read-only SCC_AID register
+ *  + QOM property "scc-id": value of the read-only SCC_ID register
+ *  + QOM property array "oscclk": reset values of the OSCCLK registers
+ *    (which are accessed via the SYS_CFG channel provided by this device)
+ */
 #ifndef MPS2_SCC_H
 #define MPS2_SCC_H
 
-- 
2.20.1


