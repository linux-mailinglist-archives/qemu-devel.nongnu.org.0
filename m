Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFC5367B2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 21:51:13 +0200 (CEST)
Received: from localhost ([::1]:55754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nufzM-0001OS-O6
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 15:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecN-0003eq-Ay
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:24 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec9-0004S8-K4
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:22 -0400
Received: by mail-pl1-x62d.google.com with SMTP id m1so4819407plx.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/Gjf6qj7oQJrc8fIndDZL/PahcE1ttP0aSQGMu5LyY=;
 b=JdPljj6iEXUsoytg2HU4OlQpmOsmw675ld7Q43RgjKJxvBs54TIXbB3r0qvdDUOP+S
 GYYcxES4BuQyOLn+PxqVqfsm9A5vfVuYZ3v7IUcOhJMlr/wJAc2giuOZP9ldkRF2nncQ
 kvqO2+jkvRgZCjbmKutBdT5oFy8gBrIp9BAmRFqsc7oV8OrSVD8bh4hOb298b2KcMaG0
 aetREmR6XPBbpiD3CTauZvImRUVHT5t26H05rUJeZWZvZXM3rp0IGNsm4uNAww+tHEIx
 dbgS/FtAS+ITuPtRheIvQZeEKjfuhl1vd7qNzpFkFfK6eDmBhv9ycqphwd2/WrgJlEGD
 Dc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/Gjf6qj7oQJrc8fIndDZL/PahcE1ttP0aSQGMu5LyY=;
 b=oG2JbjOKvZOsLvCiYjDDxRT37VhOp+ZMxA2GC7Qd5V85F4ETxZ8zy7cNq4WN1jvtw6
 7A6+B7CIz33k0LEZnd++fV6ln78uDDcn3X7N2qvLZhbcAyRrvJecf1gUGFvYrh9yGS+V
 T+KwY7uVv9BNZYubKOcopJeK6ZknnrC1cZOUhg0+ZNxqVX7wYCOyyRcrGmKJSRn1fTjg
 5uT7WZWUuMd6nfLA+5HBkWDWuZTJpDL4BhBXSZCHnCfvzrLBXHIqYR8rN4BLtFVKmM4X
 rNo7rLCQlA/TBDsn694loSOLaraMPDRqTySqc/d6H+0vBx/RWtJgxc88IWYr51rtrVqk
 qwsQ==
X-Gm-Message-State: AOAM532vqgB5VabdmRRBaWBzsGKZn5DplHEbmeEmPsmPNXc1EjDtIYOA
 OsR/gqJbnAF+ihU9h1Zm1A8b0NHCnLxYxQ==
X-Google-Smtp-Source: ABdhPJykRLQ2m1lk8V90Dt7/s2RGqhs+JByWjL/E/b9uc6wV/3cgOzru78Un2yF8rIJHnzmfWnLfCg==
X-Received: by 2002:a17:902:da8c:b0:162:33b5:6aa1 with SMTP id
 j12-20020a170902da8c00b0016233b56aa1mr22932175plx.75.1653675788185; 
 Fri, 27 May 2022 11:23:08 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 064/114] target/arm: Use TRANS_FEAT for do_last_general
Date: Fri, 27 May 2022 11:18:17 -0700
Message-Id: <20220527181907.189259-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 841c1b5644..caa587506c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2622,15 +2622,8 @@ static bool do_last_general(DisasContext *s, arg_rpr_esz *a, bool before)
     return true;
 }
 
-static bool trans_LASTA_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, false);
-}
-
-static bool trans_LASTB_r(DisasContext *s, arg_rpr_esz *a)
-{
-    return do_last_general(s, a, true);
-}
+TRANS_FEAT(LASTA_r, aa64_sve, do_last_general, a, false)
+TRANS_FEAT(LASTB_r, aa64_sve, do_last_general, a, true)
 
 static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a)
 {
-- 
2.34.1


