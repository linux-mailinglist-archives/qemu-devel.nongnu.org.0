Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E56062FF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:27:41 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWWI-00072f-Kt
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:27:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWUc-0001iv-Ld
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7k-00053E-15
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:13 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:45887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7g-00013Q-36
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:06 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id m128so9660493vka.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=D1apVJcxnpic/nI7vbdbPH7dVAQUtKqpSfoNGvBLQCc=;
 b=Zpft5ngG5R5rzg0OmX0XOtV+WbtYxSoHsxTY59/p0BkxgJOKWRxSKIky3BloiI5tRT
 c84MhOfEQRQVoRVCAVuPcj3pe4CMtSQ+E1X2lNJspwIAsbcxI2U5S5EeNm93JOoz15u9
 rIhxRbDvFW7bMsK++BIUMt5mfH9C8lLYzcTAsCtfXcgw7p1BILc0Cim/GKeaJOLEr982
 RCuTjLhEpTgN7yb3KI31Qh2PyqRwq6utTqJQ+SxRFbKuMLtPHIUfBHJj8pqZ/CpSB/T0
 zcqo5dmTYoXUx9ohSptgKwmpW8pDd9rUryHZtGOpfCu16nRaI+2gSvCJHf+Bqofy+ZUQ
 4fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D1apVJcxnpic/nI7vbdbPH7dVAQUtKqpSfoNGvBLQCc=;
 b=wbrAfVKHPxbgp/lpHekd1uWuh27Fq0HfmDQNLAaerIK0VxwtmmDq1wVsNUCwqyPI32
 Vg923cuLrpmjcf+WHtgFCzjUiYcncD2yi+To02hRbu0ArZPbVIFLzTBU2GrPyh5y0N82
 eEwIyU5dbdBPu55Yaw5pSP/Ev4MLh7bF8sgO0198Jbx7Eq11sThunY+7Q9cfmsb3KNiB
 6eiO9CmYwm6VotHRhQbEm1PmKNfOFfHY09VQ/Qwsb5OJl5dbHmDBLv13xzs3Vd89d+kZ
 zaITvUbYocbsjvLSwPkFAr49zGBIzPN7waeMHYqL6gMHh2wpAlB1I5H2KfINwoqWdgZS
 0HLQ==
X-Gm-Message-State: ACrzQf3hSdwpCklZJ0MKn3wU8BaV72UWnuD4rDjbmQSPGwNjfpFFRnh/
 K2w0tkXCyQ0rvGcvHOQi+inUi94AFexubG6M
X-Google-Smtp-Source: AMsMyM5CCUobe5qeI4gG7Z+cwxrXcxD4Z/z1UhZFA8URbc2RpsHwPeb7Pdx4flaMfl1BuIQfHP+YFQ==
X-Received: by 2002:a17:902:f710:b0:178:a692:b1f7 with SMTP id
 h16-20020a170902f71000b00178a692b1f7mr13864450plo.112.1666266831117; 
 Thu, 20 Oct 2022 04:53:51 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/31] tcg: Move TCG_TYPE_COUNT outside enum
Date: Thu, 20 Oct 2022 21:52:23 +1000
Message-Id: <20221020115242.2301066-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The count is not itself an enumerator.  Move it outside to
prevent the compiler from considering it with -Wswitch-enum.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index afa18986b1..a631e0bc80 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -294,8 +294,6 @@ typedef enum TCGType {
     TCG_TYPE_V128,
     TCG_TYPE_V256,
 
-    TCG_TYPE_COUNT, /* number of different types */
-
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
     TCG_TYPE_REG = TCG_TYPE_I32,
@@ -318,6 +316,9 @@ typedef enum TCGType {
 #endif
 } TCGType;
 
+/* Number of different types */
+#define TCG_TYPE_COUNT  (TCG_TYPE_V256 + 1)
+
 /**
  * get_alignment_bits
  * @memop: MemOp value
-- 
2.34.1


