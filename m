Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031D632318
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:06:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6SA-00057l-86; Mon, 21 Nov 2022 08:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rj-0004t8-Ql
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:51 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rh-0007RR-BD
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id n3so3199822wrp.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dfFlEzHVaLMstRWNXLjvHFrz5cabOw805eWOhqpeeRA=;
 b=oRH6dU8H4Z236bsoFAPrx5sEQzZFLRnbWnl3g1h05XS4KMAzWIxLM2aPW+PZuDCbyI
 Psg1mNbm7Cc42RDyqihS4o6E4M7n87sdshXBdIV8sDuYriXcW24lRYTv7G+af4Ifnxj1
 tZ7lqCVKSyfD+ior8v8WirrsqSmPygTi8my2ojI9WMbpCL+XdL/cnFkOaNT1GR++yuS+
 kDj8U81Yxr+T3EC7r7KIK1+OvQnzqPRijZWqMqggwOaDobkUnnPAJjPNc8v1JP6/plOa
 MyfvQckEKzD5Dv4SywbIq7Vmpgtxdb2OeOHNpkkLSmrydDhNyajg28U2WsYhqbT9d9ub
 C50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dfFlEzHVaLMstRWNXLjvHFrz5cabOw805eWOhqpeeRA=;
 b=c0FjH9NLKviS2C7l903Xf2iV+XsblVTiJvbYo1f0dcG8I3pFSeXC4yMen0dQFx9bOw
 M/0UXKn4gx49WmCEmMi8yUXvR/WUfyNiUovCLR0nNrV747DyEz/4jJbqErCIECEAGuQ6
 LulclT0ynJRSWm23U90pYRMjXN3wfwLeUaPvx/W9YrLKELdqcdMFHNpDOpg9bHpkVtC+
 C+Gp432RLjVQYVF0YiBRf++P/dcxxi/rPKmYAYA7M1f2Byy7uLgN8lXOYESjP1oUBxsB
 QzDXWlwKBAiJwUx0TbLxzP/+Xao+u2A3qy/5WgArtVjth/YhzO0yLVCFTTDJNGjomQy7
 fz/Q==
X-Gm-Message-State: ANoB5pnwedJDnB5L8uPfMMmrdPVwlIDsYsdl/zgpxzLC2/e/oVwKnDR5
 N1KVukrijpWH3eGdhG5/uqrYFMGs9J+Byg==
X-Google-Smtp-Source: AA0mqf4i/hpLD8r7rFy1suyyXP2UzjDy6IzkfswpybkF0Hboj4GLC8iepvSEP4gnXkOBBSLPr89mFg==
X-Received: by 2002:adf:f50c:0:b0:22e:71db:47ba with SMTP id
 q12-20020adff50c000000b0022e71db47bamr3562016wro.359.1669035763731; 
 Mon, 21 Nov 2022 05:02:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] hw/intc: add implementation of GICD_IIDR to Arm GIC
Date: Mon, 21 Nov 2022 13:02:37 +0000
Message-Id: <20221121130239.1138631-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
this for the CPU interface register. The fact we don't implement it
shows up when running Xen with -d guest_error which is definitely
wrong because the guest is perfectly entitled to read it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 1a04144c38b..7a34bc0998a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* GICD_TYPER byte 1 */
             return (s->security_extn << 2);
         }
-        if (offset < 0x08)
+        if (offset == 8) {
+            /* GICD_IIDR byte 0 */
+            return 0x3b; /* Arm JEP106 identity */
+        }
+        if (offset == 9) {
+            /* GICD_IIDR byte 1 */
+            return 0x04; /* Arm JEP106 identity */
+        }
+        if (offset < 0x0c) {
+            /* All other bytes in this range are RAZ */
             return 0;
+        }
         if (offset >= 0x80) {
             /* Interrupt Group Registers: these RAZ/WI if this is an NS
              * access to a GIC with the security extensions, or if the GIC
-- 
2.25.1


