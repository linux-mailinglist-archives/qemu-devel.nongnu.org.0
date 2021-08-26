Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B273F8CB8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:09:08 +0200 (CEST)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIs5-0007vz-UJ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImq-0005dM-Ly
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImo-0008SP-VG
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so7366695wmd.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gElcNWN3M9Jq5lKNbD/CRw0/G5CG8Srht/Gqb5hcJyc=;
 b=lEgQqtyyh0bqOB1GHvGVlBf+Qsro+203Siy3qnQnycLa473qiQLh7Eg8BWyMvz5/Zx
 VaUNt9KIIBQ3DKqFzKlJQ3wTSsww5KjTgUVJ3HRay22IXJsplr02WRN5+HtbZEwh3Tp9
 FLGxxB5+KmYXd+bqOdUXVRwNiJEzn71qWQkqqSEiQbSadrkJu+alQvkaG6NA6uimNzJT
 09S1SfnPlaanFLrWP24b4M75mK/ZQ71Nuqq1up+cwSY1egniP/F+I/72JLgcg5KrkgV7
 9FQFx+ipztH/WYDjWRQbBwxz5EFuXms8zJXPB635zs+6QPPk9aUcUxtj4aGHFddLxiwC
 p+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gElcNWN3M9Jq5lKNbD/CRw0/G5CG8Srht/Gqb5hcJyc=;
 b=K1RYueNoSEJNa3MT+b1uUloUeVJyVNstq5dl1Kij9m4PvX9TlJNVVXQ62oYoRiXSJX
 xP8lqvADF117qipFPwlxNpQ+IU+kVZnCJSc+xAZyLEBC3qOxB4V4Pt2LK5fV9T+5rr9j
 4dGmk2EoddWRkFIfAi11iw9WJYqV9kxTqAdoZqTfP/Mm2LtVkWTxijQFLcBhzass5pUj
 O4xGCXDNkJVdwPcf7f1aKhKoxqhDR3Gmyo+Vw0vG1gTuSBwiINxwu/dDaEP2AnCrjvPI
 Hsy2gs7skPw2MH2BAkjJ+RKCMY2T6uetv4sleSeXWKPNjDzxCjHejiptN0L1dlHC0WJ5
 yOmQ==
X-Gm-Message-State: AOAM533R1/JJrP1SF2UoCPTERErsJCxbpSQ0m7fsufvR+rdeBfl/zZ9s
 qDt0oVo4E8X9VLX9w8GnzfCrzRR04E4gfw==
X-Google-Smtp-Source: ABdhPJzNbWclHv3NlAiS3QkGS5hCyWR0mVBtkBsjrD2U6c4y6gFudzRlkaxBYDex01NEcVT5h1aniQ==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr595615wmp.164.1629997409699; 
 Thu, 26 Aug 2021 10:03:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/37] arch_init.h: Add QEMU_ARCH_HEXAGON
Date: Thu, 26 Aug 2021 18:02:49 +0100
Message-Id: <20210826170307.27733-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

When Hexagon was added we forgot to add it to the QEMU_ARCH_*
enumeration.  This doesn't cause a visible effect because at the
moment Hexagon is linux-user only and the QEMU_ARCH_* constants are
only used in softmmu, but we might as well add it in, since it's the
only architecture currently missing from the list.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20210730105947.28215-6-peter.maydell@linaro.org
---
 include/sysemu/arch_init.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 57caad1c675..60270c5ad15 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -23,6 +23,7 @@ enum {
     QEMU_ARCH_RISCV = (1 << 19),
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
+    QEMU_ARCH_HEXAGON = (1 << 22),
 
     QEMU_ARCH_NONE = (1 << 31),
 };
-- 
2.20.1


