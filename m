Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF9E339AB6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:07:53 +0100 (CET)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKsky-0008Ib-Nv
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdt-00077j-RI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:33 -0500
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:45683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdq-0003Qe-8o
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:33 -0500
Received: by mail-qv1-xf33.google.com with SMTP id t16so5173829qvr.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=hfjDgjjaDLXoXCxxzKHpf0bhefHgOCjX7UdQX7LOT7c84WpKqcJrJg3luAo89L2Dzv
 FRQXYbNPrPbUAcsP0y3uBRPKubG0atXBfgnaEsfnuXq2oPCAoSBAH4+iEr1LMfZz+/JZ
 WU0ldf1szvQbkry0eJE1Am1iuHLCvltGD2Zpn0zjFLax//EUFLfbitayZsuj9dHr5dyI
 bzkeROQtIZ7JtJIksS4SiOogFnYfTNhmQomzNM77r4YrgtKTP8tG7mcQ6s4uh6WHvi/I
 inb+sMtG5SxeMR7C7P7FAgObCZBoCRvUZCiKuwQIaRw9lahsqg3RSLhamjmkoayzCV14
 ODLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=HxAFIQC/GEKC0HzM3TTIu8dTFB+EJORSfLw+QQmbi9zbj5sTOsYqeINI12YL+k1e1N
 2C794uC8Nh95j/Q/mpVma4n/r5l3nDTK3eJBBCE/kGj3n/vD/TvEjuXcU7uFsK0YBh4G
 wKWP0M4Eo6+Ueob1ECwWEjZPwPtyMc8jOyvhVAmTmLedgLoTdPasC1AKiHFlbuBk9MBV
 G1FSZycnrIvSwuwVJFVR3uYRt7klb1c4NSwvi+WuOH5o0ZGRN0MZabLeSJUWd6kd9X1o
 p58+VwydfbDMDuM8qxE9chYz3NeO4Ql+Utgbp1P1TrqaD6S2399N2d40lr6XWEAcLqsZ
 bIHQ==
X-Gm-Message-State: AOAM533e0h6YUOrIQasx67sBbY/odnzQ7wcvkcDWXa12ej0+gQw4PeD0
 GeZoCGCcMy8kjoWq+bONyYMp8+CzvNQyMLEY
X-Google-Smtp-Source: ABdhPJzoBIQEC6gKSUWjMRRr5K3jUT7nbH8b1SGNtqNSphpL7hq5tNWCG/pvXRpqb+/a58c5+s2L6A==
X-Received: by 2002:a0c:a692:: with SMTP id t18mr898225qva.18.1615597228743;
 Fri, 12 Mar 2021 17:00:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] target/ppc: Fix comment for MSR_FE{0,1}
Date: Fri, 12 Mar 2021 19:00:09 -0600
Message-Id: <20210313010018.819153-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per hreg_compute_hflags:

  We 'forget' FE0 & FE1: we'll never generate imprecise exceptions

remove the hflags marker from the respective comments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 79c4033a42..fd13489dce 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -322,13 +322,13 @@ typedef struct ppc_v3_pate_t {
 #define MSR_PR   14 /* Problem state                                  hflags */
 #define MSR_FP   13 /* Floating point available                       hflags */
 #define MSR_ME   12 /* Machine check interrupt enable                        */
-#define MSR_FE0  11 /* Floating point exception mode 0                hflags */
+#define MSR_FE0  11 /* Floating point exception mode 0                       */
 #define MSR_SE   10 /* Single-step trace enable                     x hflags */
 #define MSR_DWE  10 /* Debug wait enable on 405                     x        */
 #define MSR_UBLE 10 /* User BTB lock enable on e500                 x        */
 #define MSR_BE   9  /* Branch trace enable                          x hflags */
 #define MSR_DE   9  /* Debug interrupts enable on embedded PowerPC  x        */
-#define MSR_FE1  8  /* Floating point exception mode 1                hflags */
+#define MSR_FE1  8  /* Floating point exception mode 1                       */
 #define MSR_AL   7  /* AL bit on POWER                                       */
 #define MSR_EP   6  /* Exception prefix on 601                               */
 #define MSR_IR   5  /* Instruction relocate                                  */
-- 
2.25.1


