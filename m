Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A36A43FA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:14:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5j-0005oF-37; Mon, 27 Feb 2023 09:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5X-0005aP-RE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:49 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5V-0007ls-KH
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:47 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q16so6356007wrw.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5G5C159PYFBj84gcvHOzkkmU2rOSmahVuhSDYc1h7Xg=;
 b=KdUZki1f85S7vwSomeohgLOjcBziFnF7RklkFygeGbmhJ8Fo17KxNR1sNdCaIBcjDK
 8m1isKsWNvBzST6LBV8q8M8o9P8JIF6ND2rJc3Car8UxDjWOJu8+46eMa9HasnUOn/1j
 jG2BtuVTcgtgT+xqvjE9PNuvHXC4DXVBqBLw6DiCcgEGWqlPHF/EOwH+filETgCCmBVd
 PuuIG4i9qsnP3MWEDO3Zx6UHhqK28Z45Ba9BXARkusxj0V3FhOZjZcoS5b9ASsPWfay7
 H0drE2X2g6ueF+FVfrFmM/xDT+4IyR9I1AzZMc7ZUN0fspPnR3P7DUBez1qC0Pu1oh9K
 CWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5G5C159PYFBj84gcvHOzkkmU2rOSmahVuhSDYc1h7Xg=;
 b=D3pE1dGSdU3PdTuFeumoot8zu3BAJiKLOOFSUqPkoBWVSmobMfp9GBLwlWp5cVm7rw
 Af4Fio0HcVUthotAhTUnjZybNLuzmiuUAGTo6sJ+kGLwfdh+0DlCrCsAt1iE3GKZSJZn
 76/VrtcsbtwjpVI3LqlW/tX/ISEGpyYUlp+DIfFLGHDTW/DlXoFQwPlyQaQohmSAQqsj
 l8GZQIU1GHTjlvxCPdbjNlFSNIQD+IN5SBv7Kj2YkSicnV8GkZndAXp7OduGCvtGAiDg
 5PhMogpIsMukPVOjkjZ9XmkdE5E3vjdCGw6CjyQACbITlPjowPlu5Zt0r/dNmRsIL6St
 1WJw==
X-Gm-Message-State: AO0yUKUq7uKoIfFmfyy6MPKU9mZU3qG1WyTOirvu5t6wq/wIX9zBOFeE
 Vu1KWebS25EpohnaF9zNZha3t3mANbzLxiNG
X-Google-Smtp-Source: AK7set98dERiDscdEurWdxnfnb8RVRRX0xSH875T+PL33xyXz5MyocGHdfbD7tLnDoE1ZzZUguR5RQ==
X-Received: by 2002:adf:ee85:0:b0:2ca:c865:51b3 with SMTP id
 b5-20020adfee85000000b002cac86551b3mr3455459wro.12.1677506564387; 
 Mon, 27 Feb 2023 06:02:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a5d464c000000b002c71a32394dsm7232764wrs.64.2023.02.27.06.02.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 015/126] target/ppc/internal: Restrict MMU declarations to
 sysemu
Date: Mon, 27 Feb 2023 15:00:22 +0100
Message-Id: <20230227140213.35084-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

The 'hwaddr' type is only available / meaningful on system emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221217172907.8364-5-philmd@linaro.org>
---
 target/ppc/internal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 337a362205..901bae6d39 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -242,9 +242,12 @@ static inline int prot_for_access_type(MMUAccessType access_type)
     g_assert_not_reached();
 }
 
+#ifndef CONFIG_USER_ONLY
+
 /* PowerPC MMU emulation */
 
 typedef struct mmu_ctx_t mmu_ctx_t;
+
 bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
                       hwaddr *raddrp, int *psizep, int *protp,
                       int mmu_idx, bool guest_visible);
@@ -266,6 +269,8 @@ struct mmu_ctx_t {
     int nx;                        /* Non-execute area          */
 };
 
+#endif /* !CONFIG_USER_ONLY */
+
 /* Common routines used by software and hardware TLBs emulation */
 static inline int pte_is_valid(target_ulong pte0)
 {
-- 
2.38.1


