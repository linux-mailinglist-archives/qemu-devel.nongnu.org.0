Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B981559FB
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 15:48:05 +0100 (CET)
Received: from localhost ([::1]:58286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j04vM-000345-LH
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 09:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j04iC-0001Dc-RG
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j04iB-0003Ra-Qh
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:28 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j04iB-0003RC-JM
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 09:34:27 -0500
Received: by mail-wm1-x342.google.com with SMTP id f129so3032642wmf.2
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 06:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YdKU1QWvkmmjgwwkasyQqqG8djubpO+AkgikbEH38uY=;
 b=gsKg79I5gj2S3f69Y2kcE6eoRsGu7gB+0Ud6fGduhjsLUaK79+DpYZhxSm9zEwu1nT
 suQKO8x9Axyc5miyiV7ykJKeu5s5J+4Sc9dm5WmsJ0WoCbtlavWP8jgeBDoKVVx1yCih
 C0mp9+ZvTaPlDvfWC9g4sSijgAf1W1YUqC6Us/ApBroIwh1vZVDVC8Jq7al2uNQxCpb+
 Fh+ZPn53LYo0Q1ST7pc0p8a2eBQcE7Wj0zPUBPw+HrBtrNxLA0QcxLjJFvczhoUB1H8v
 FE/5hzG7KrIw98t+So5zlFmhLqR2lvVJbF4M9ntG4ZJPaW4nnRvPUAY+Kwc4bu1YQs+E
 pNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdKU1QWvkmmjgwwkasyQqqG8djubpO+AkgikbEH38uY=;
 b=FlFwkFff7itC9gE5xwiHuhm8mpDkjH9EVM9siedFOH2zV3kzcP0btNyomD6fAIhIhm
 8NcxIEXd6nuEt6rdq6Vw6PPOaxMQaCBjuV7ltxYRtVR7NIqBQk53YVFnx4bMu1EeeKZ/
 vuW7Lwlp6wohdx1qCDGjAuV8Br5m8UffpiV9eNdavFkKOoNouA1/rATaTusaIh0xiPaW
 YDgmJiF0xgTtID1rtrHARePvku2otxrXAKIJJoXHww1J3X5fVsB3I7w6M03ob8m7+Exr
 pOSu4xWAJMZ7q6LSe/PCp/MyNGj6HglRa/IwTKHxJ4ZB8qhyKSq+ZO+2l58cOogaVZvU
 BoQw==
X-Gm-Message-State: APjAAAUZ+KiiqdlIZJh6B18zHc8Wc3/Ad9TLR/zHCB7dRRIFf7nTuryn
 S+hTWXUxkpZ14rJzxI6L2aeERL54liI=
X-Google-Smtp-Source: APXvYqwyJUnFvTU88HHme1XFy0dhOt+2ab65X7wNn6Umgo6ilUQNNk6Fo4ei7cd6l6DX8U+u67wAOg==
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr4556943wmd.87.1581086066469; 
 Fri, 07 Feb 2020 06:34:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w1sm3796430wro.72.2020.02.07.06.34.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 06:34:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/48] target/arm: Enable ARMv8.1-VHE in -cpu max
Date: Fri,  7 Feb 2020 14:33:33 +0000
Message-Id: <20200207143343.30322-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207143343.30322-1-peter.maydell@linaro.org>
References: <20200207143343.30322-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200206105448.4726-38-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2d97bf45e1e..c80fb5fd438 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -672,6 +672,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.20.1


