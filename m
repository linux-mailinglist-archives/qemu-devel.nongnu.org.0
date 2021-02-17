Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77331E31F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:42:24 +0100 (CET)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWSd-0000ov-IX
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQu-0007dc-Br
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:36 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQs-0004ZT-Kx
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:36 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 189so32019pfy.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GdkpxzgcEFcZSIACGMXXs19rNBJ+Fas4AM99kJ+waPE=;
 b=wJXFuZ4XMrEkUyyI5wsGPK4g50YqkYKrswA2Ki3gX+dHm8Anln+LzVRV/FXBI9t8X1
 5SgR9Cs9tXEfj907aEYxkLttQUg4c/+EDk7GPz+KneGg+6k+Ji4O8vm6oWGn3TgbRTi8
 sRc2ZvfpXllCSIdm2X1dy/MI/5yVAzkEngKpeXKjC4u8LZ1PCrYrs7lVN61d844TKJn0
 QyJKC7zd+6whaTXTuU9OZsvevwi1MNWZpz3a5e87uH2ejWLTEGgPeuJP90+RTYxMYON0
 DXOLCr+XyQU9yVlbDDLQwS+Hh3/XdfsLjMVDTKxTOiKjM9YUm+MShAnq8uM1e1LxGFf2
 Uuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdkpxzgcEFcZSIACGMXXs19rNBJ+Fas4AM99kJ+waPE=;
 b=YUQfQTWHiYiDWr3Wcyq/D60TD8QGMOPhfjX05sZMx838ltqS6DUCtZUNsQ6e9tVfUk
 3043dYnM8G1Smg+eryHay/TNwFXHXAi6WqX99wcHQPQ9Wa5WMeeB5W8tkXSpvYoYP7fA
 ZalinNWunVhZER0U5KIijQFElk31B2qBuEBkJs7b49rSGIon63VhnwsBsUU6K6liOc83
 4+nWWMgKYJUxFxXGg1wzoOcygFahjayHGC0nds6Xq0FKHm4uvT+WKVSxtr9S2lcA7MpY
 KZxOEM9uUnqGAuVwyvhWHnxfsCEjJxkKLV6e261Jf9tQ7lG1SetWtLLDuBCRV1AQbceH
 mXOg==
X-Gm-Message-State: AOAM532/cjYa3QLc/tg3aYcxvEaG7t9ZX1MhObD9tl4XYvfZ/UyhbyfZ
 vMuSQSt4OXNeyVAsvx9+A6cY6H61sqGywg==
X-Google-Smtp-Source: ABdhPJx3X+wFqTzo7ZOBUuenP2CZUhypvC01tGam0bd9fQ70fQZ8bzPuFknVGbLcPhYLgBsrOCOVGQ==
X-Received: by 2002:a63:4507:: with SMTP id s7mr1546722pga.390.1613605233069; 
 Wed, 17 Feb 2021 15:40:33 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] Hexagon Update MAINTAINERS file
Date: Wed, 17 Feb 2021 15:39:50 -0800
Message-Id: <20210217234023.1742406-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Add Taylor Simpson as the Hexagon target maintainer

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-2-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68ee271792..c277a7788c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -188,6 +188,15 @@ F: include/hw/cris/
 F: tests/tcg/cris/
 F: disas/cris.c
 
+Hexagon TCG CPUs
+M: Taylor Simpson <tsimpson@quicinc.com>
+S: Supported
+F: target/hexagon/
+F: linux-user/hexagon/
+F: tests/tcg/hexagon/
+F: disas/hexagon.c
+F: default-configs/targets/hexagon-linux-user.mak
+
 HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
-- 
2.25.1


