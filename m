Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD31CDBA6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 15:46:11 +0200 (CEST)
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY8kz-0006f7-Va
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 09:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8Zb-0001q9-5m
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY8ZW-00070p-Bs
 for qemu-devel@nongnu.org; Mon, 11 May 2020 09:34:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id e16so10996888wra.7
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GGPPXos/k4jb+oNKI/UhklqvAQN9T1X0nGHGYMbT/VA=;
 b=zeGbPQVpyF7cVhoAcO2pvNhFlb9ugJgD6rIrv3FXnoWJRfnC2QIDaNGVHzfhCZ02nP
 uThX87lEaUoK9NbKmWVYqEcMQK8w9Jo1VVvqpjmrrxCM+K8g/CXDRYMdwv7bSR5gN90r
 aZzVfoZBOxze+sdFU7Qv1tFxHxfFe7VafdA3woDLtNJ9LEROecvYKMnPnn8XUAiZCpzy
 F6jWCniwvyhqPo0nTYSuieXKISPbfSK7BayXn5n9Bo7d25L4kYJVlhhrmdt6VW6WPajZ
 8RKH6cfHNKYrhu9FciMRCE7sXm3QtEMy9zAaK/yjHcE2a3k3J+h3nLyi7ALppoEPPT+5
 qWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGPPXos/k4jb+oNKI/UhklqvAQN9T1X0nGHGYMbT/VA=;
 b=f7BpSnrZTB7IRrraWtN0ehkKko5HIzSsTBWYavuy0fFmaBrBUzxUHE88yj8+xO4NaD
 1XEzOxntfkXSaA1hv85f0Y5Aqc4sAs6/fO4MD1yjGi1bp+eNvoSt5Nv4AvCRGAdAO8pJ
 N2L+xwvBTfzgqtBFKrWePz8WdzTEzNyqeNIaEztHIzndkTw3y0Qd9QcOouoye8w2IKm9
 XBmDHDy2VcQsupI2dMSdG0RPQF2V/xv3c4TlHdYHQwovuTyZzO2WyklG+j3WeaOAhAi5
 YdllDxd4BYflQ3Y9tEMgozse5h9wM68gah+KttH7DqNX1iWY9Q2KcFp/sQ3a9k/iwnA7
 8rGg==
X-Gm-Message-State: AGi0PuYTa3NpKfSphz599xJgldCOOg0k6E/v6Ig+luHnnztpP8Iadzr3
 39CRJDgN9mj7JhBT1ubn5tFIkbUNmjcFfA==
X-Google-Smtp-Source: APiQypKx3g8+wPA+CzLrS8wdAxJ7WSIznj9syEpOkQtyfyQkqQaaANfN7fLr55IZempaY38RXj8qLg==
X-Received: by 2002:a5d:6690:: with SMTP id l16mr819436wru.115.1589204056702; 
 Mon, 11 May 2020 06:34:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m3sm2154818wrn.96.2020.05.11.06.34.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/34] exec: Add block comments for watchpoint routines
Date: Mon, 11 May 2020 14:33:39 +0100
Message-Id: <20200511133405.5275-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511133405.5275-1-peter.maydell@linaro.org>
References: <20200511133405.5275-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200508154359.7494-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/core/cpu.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5bf94d28cff..07f76981550 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1100,8 +1100,31 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, int flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
 int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
-- 
2.20.1


