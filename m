Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909DC3C2784
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:26:26 +0200 (CEST)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tKb-0001q4-K1
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t52-0001Vc-Q7
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4v-0000ud-9C
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:20 -0400
Received: by mail-wr1-x431.google.com with SMTP id k4so6549940wrc.8
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MBTkeOxa7kZ6L35aP7m9uF9eaW4Hvs6rU41xNfdKBxI=;
 b=jptwMPhpxo7R/xOT8AHDUDNb1ap27N1GgG7CGo57FhXzAd7/9wBGCIT8iwOOsq6BsV
 3luykQ3JhWqzlUxzCrApQ6LB6v/6IYGG4sVFmeRlDd6+lEKaMAR7K7fk2xOJqy1drFOf
 K+sXjBWTXJ3v+rf5z3zw0ZxpYTza39rCLnjw0HSSYdDGWg+9uOTa/4JkUIcfWxD98Na6
 wQtYkvIiWYsp0p1I/SB88BxRC/g5r0xENU/Bus9vJw92IfI6t6RmzuqP1+W4E4I1vXuK
 86hojcRXcCJ9LvFDJp3wTjA5FTirQn7w+WihA0jsCLASPuiZyJomDmZL0aYyWl3bYd88
 gZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MBTkeOxa7kZ6L35aP7m9uF9eaW4Hvs6rU41xNfdKBxI=;
 b=m9zkcmZxf3M/arPOeahL/dt8Z1WX6cOFXJQQDIgZjPeN0XoYThfWqkwgH2CEbrvH/I
 fmIqedQS2dcuJb1AxeVsg8ByBzaf0OFG8EhxvFkU1JfVc2OeKbuKRQBwcCFE5AS3F6cR
 3dBy5o46RwurNWfyULiJIS5PpExC9AwgF97U85tJzjSClpxR4XrkLXOMXnCSGoeAn+OG
 GgIEOnBzzSD2yHdpRyKtfKuragpbG/8L3pH2kpGnX0WqOBK/ESUlyWdzk3/uJG6cO4h3
 sO4DcJ+p/V43T+KTpul8Md+KFYmYj1b+TJ5kJdxnLQG21ufgsiIOR7E9QES44b0gUVGA
 k3oA==
X-Gm-Message-State: AOAM533mhQNzK4+6ocqBmxkiKgpo6g/z9QLwmm7Dc3VDoIIQLd6bkiwu
 n42sXltGB9CmMl/y0N5Zj+NL8jmqH65EGDN1
X-Google-Smtp-Source: ABdhPJyQTdV+kokguax4uHsPQrLs0o9F+86EJDdGZqT80bcfYVwfR6UJMA+3NI0+fm0sKYc8zw1fjA==
X-Received: by 2002:adf:b307:: with SMTP id j7mr18941649wrd.243.1625847011870; 
 Fri, 09 Jul 2021 09:10:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] hw/gpio/pl061: Document the interface of this device
Date: Fri,  9 Jul 2021 17:09:55 +0100
Message-Id: <20210709161003.25874-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Add a comment documenting the "QEMU interface" of this device:
which MMIO regions, IRQ lines, GPIO lines, etc it exposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/gpio/pl061.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 42f6e6c4891..a3c13862212 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -6,6 +6,13 @@
  * Written by Paul Brook
  *
  * This code is licensed under the GPL.
+ *
+ * QEMU interface:
+ *  + sysbus MMIO region 0: the device registers
+ *  + sysbus IRQ: the GPIOINTR interrupt line
+ *  + unnamed GPIO inputs 0..7: inputs to connect to the emulated GPIO lines
+ *  + unnamed GPIO outputs 0..7: the emulated GPIO lines, considered as
+ *    outputs
  */
 
 #include "qemu/osdep.h"
-- 
2.20.1


