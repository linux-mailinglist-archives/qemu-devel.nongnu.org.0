Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CB840B77B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:08:05 +0200 (CEST)
Received: from localhost ([::1]:60854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDmm-0006Rc-6o
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDde-0000Wl-FS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:38 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDda-0003ta-FW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:38 -0400
Received: by mail-pl1-x633.google.com with SMTP id bg1so8871153plb.13
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 11:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lq1biEQZ8k9CzIW5Mm8h1QqVVW+FFF3SxIW1mjztbL8=;
 b=PHGaP4jSmIPJphKdBP70PV47AfQ6BQAwFDRkFM2q57r/pXL2Rfrmm31aGb6UqKnvln
 YM+Lt7Jevef+GoZuahkNySDLeRFggPCQrAQ7LZSkd4JAKLPnPm3B6F/ohDhyqivomB4B
 LqgyR22XK4ZmnJ5OvWhe8x4IlbTSv3Esa5/rL4r5l/je60OWsypAl849zil8JHAEtoDB
 p73fAYCulPE6bnhOcEuQq8lGhZ4WuHTbP0BvrQ4aXcOtXVsECWsX6n9UV1TibU5C8jRv
 lyEOn4HvuR7Xm6SHrOYL+FxmB8/I0gXi5SFh78O89CkjKHnHkU+/96fsYYB0jFgg+UKT
 GLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lq1biEQZ8k9CzIW5Mm8h1QqVVW+FFF3SxIW1mjztbL8=;
 b=era6mKWzO7yLWzYMPth8EJIL91Uupl9kl+CvmElER6NpSB23e9iYbNzyY8LRyCp11x
 IM5iCS02XSHOWfYlmav3d2l4QyV7PJd9IZG/uDYZlfOGyhtEAyVqZMMQZC8jq9XFPWiN
 B7Z2Cy+xZ7DTWTcCow1tJQNzLu9v/S5YpFyJaPtyqb2+KnFAV6vTMYIEn+3DiMKCWSdy
 /ujTkWQgSXTavesaOFHAtMYl0k5D+7FwMvFf3LcrmJMrPXOq0iLYjUMfOh5h8ESjSTi3
 YXt0GAfrLOCG9tF+86NXh/RB4UsNspfa/n5sbEBgpg0LbF3vf7mR0ebYic1wKfmb1dCp
 OCkg==
X-Gm-Message-State: AOAM531GAkhcQcNyfGmkQ1FYrCCr1+wVeKUQlMliCdemqriC5OHEZ0u8
 SADAE6g2YlbKWfthbArFCpI8t/2Lj0mlkw==
X-Google-Smtp-Source: ABdhPJwiJGPcVApSxZ5YXQ6FyJDnJTXov99FbgRY3cYmrIyiIIt+QF3Gb+B63P/nJLzUmK8KHiJyVw==
X-Received: by 2002:a17:90b:3a8c:: with SMTP id
 om12mr3798291pjb.137.1631645913196; 
 Tue, 14 Sep 2021 11:58:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2151229pjb.48.2021.09.14.11.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 11:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
Date: Tue, 14 Sep 2021 11:58:30 -0700
Message-Id: <20210914185830.1378771-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914185830.1378771-1-richard.henderson@linaro.org>
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: willianr@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index f10168db2e..0fe4a55ac5 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -124,6 +124,20 @@ cross-ppc64el-user:
   variables:
     IMAGE: debian-ppc64el-cross
 
+cross-riscv64-system:
+  extends: .cross_system_build_job
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+
+cross-riscv64-user:
+  extends: .cross_user_build_job
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+
 cross-s390x-system:
   extends: .cross_system_build_job
   needs:
-- 
2.25.1


