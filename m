Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09833A748
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:08:16 +0100 (CET)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLV9z-0008Ti-2v
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1V-0002Ec-Ps
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:29 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1I-00028f-PT
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:29 -0400
Received: by mail-qt1-x835.google.com with SMTP id 73so7647224qtg.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=H7HUNQ9xlWNHRVnGQK4Devlw33aHhulS5ME/ILOCUUt/HHPPUj2R+G2tM3AYuHiEU6
 FSFnJVg1BSw3ZxeOvARWbqVCVUQhQ4zAl4mnFWsJNY2GVVKtadIM15R4Io9yKq7bWRgG
 oB8aXzcPMG4+7U1k2hNrW7M2yBh+cpqeSyRbawCga9THFHwGZ32xdQioiBG6RPBTr2vF
 11cl8yz43raTWtEMZsUHNFTr8qXvdY7j2GcWY7+2tFYQOEdcEvwiklIm80mw1r92iqNq
 aQ6qJATagZ2ApM33xc6FVpx2J1KRcJCWQGCLcZKY+049N8aJo02jfigQeZ3yO59hajAI
 dn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pYpOKcKLH+90rQBuRerzfXX/ETf/I2egL2u0VDsDgAk=;
 b=BRi4WqSDgIErMoLSdv/32Df/uWYel3DMd0LwJYNgpWVfxKJU1hUQLexIwvI/lGmO53
 wM8M7668WNyRhtdsmxmsETjlA7KD8Akl7Md/EM7irU0wQU+SFzsDnS1fNtxwUqO1Iykw
 QNbHlhlbkGAe5kj+DV9yz8f7PTwOyZ2GinGbn1BLJg+Q8mZd5Il81pqqZBe8XvhDfUmT
 Vni7ctfkqu1FxxizOoAfFeZFaTafWuCuFD3WzWyaTlj6whCtVZ1Z5u70mDobfe4GMtdZ
 ne08Nfg1l/TrNmfmAaJj9l1+RBlw7feR14rTJlOupVD3IXeCRO8acS9O8X1Vm+/7vKhC
 nSFg==
X-Gm-Message-State: AOAM5327++8H95xJ05ZXABg4whkkM+sLLd4uBVIWNepnzebyIThp7tVd
 mKzt71RCbL/LOPXvwvwJ7R9K9ngjmQQFWy6W
X-Google-Smtp-Source: ABdhPJwCU01e6yt4R9oismIr2JAZty2Uj9JFCZ+g+CeRvD+AdmQ8acRp1j+mBB34Rs+eAKf4fcFS5g==
X-Received: by 2002:ac8:44b2:: with SMTP id a18mr19245908qto.285.1615744756020; 
 Sun, 14 Mar 2021 10:59:16 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/16] target/ppc: Fix comment for MSR_FE{0,1}
Date: Sun, 14 Mar 2021 11:58:56 -0600
Message-Id: <20210314175906.1733746-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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


