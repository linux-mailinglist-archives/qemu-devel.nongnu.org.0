Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD4306C68
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 05:48:25 +0100 (CET)
Received: from localhost ([::1]:54064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4zEG-0000Mu-E5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 23:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBi-0004sB-PG
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:46 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l4zBe-000767-EV
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 23:45:46 -0500
Received: by mail-oi1-x22f.google.com with SMTP id k25so4733273oik.13
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 20:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=jtznkj0cJfXTVrAm9697ZVvA84JV+aVT8IFq7uy3gZu5J3BDP4py6NrJxK+/L/tDQO
 KJT8whhweqw9nSeZkqgiGS80pR93dBwBmHhtCupw9d/1xIMfPqSttd7xrAKBmgMeAaeR
 +C1/LLsy+WV2brRIc3u5cCaBg6b83kzmOanH+1pU+Yb65tI+8hY7VYfCFMM7v1oAOmdQ
 8RiKkq9+oeH5g2sC9wKHp4es7Or+TkWHrsUYwEVvyUEv3G5IKK2jZeHGixKy8VQnRrbU
 UwNXuZ2HbYOIAc0FaSKAWttQeo/hbhD9X3ptu0ARhsU6xP6zVy55pwg0SOoZDWxXWlti
 nlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JAFdn6IbZBNqvP6S0gWLCOyNml8OyzsyVzQVR6rXHRA=;
 b=R0FR5GQo+8j4DoRObFBx93ph0pcCME60HYVellnFL4rd4JJfAaiBLW/zEr1R75O8+J
 IKoSNgJiVIiUZeOxYI9tcES/FNzpIVWDmrrU9ZtS+6ZOGVm/8k8s3wx8nq8VGtExasNd
 tRXcDIhyl4/pKQldykcSrQXqHn0cfY/omptPPZgWNvvfxxlU94o1i+ZtmDgPdL5IBiRW
 72TkYgSPlitVE7l8AlAQ6b5syJDx8otozItIWnWOsF3DN+4xo6He/QeXETlc8HGZEujN
 Dl6JzsXYST1IDXeO78vP79sRIB4P18qPsXzk7iyqm/W2x8hLeGn4Mq421bXTb3gqGhc0
 5IMg==
X-Gm-Message-State: AOAM530a/OogCfCYHwCl5r62qYrGXr8c/A/xN6pFsRtkX3ksIlFLYZAJ
 G3nYqF90GboU06JaToc6i/F26Zjtb/UFhiCceS2HLQTykeK75TOFm4Vi3XNqCTGNOQewmO4QIBx
 7V/I35EtSXXNr58C/fO9d6pDOK/NLwEsj2c/7YI0Etp2MLOraaSEADEx+PqAqitkin2c/L4U=
X-Google-Smtp-Source: ABdhPJz+vwhWliySfK5mJUQWAsdlzosmu47JnlR/j9CLljL94vYPlAAuSPnQhVUQHnECbsWQI50tNw==
X-Received: by 2002:a54:4e81:: with SMTP id c1mr5299334oiy.52.1611809140750;
 Wed, 27 Jan 2021 20:45:40 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k198sm887399oih.33.2021.01.27.20.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 20:45:40 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1
 for "max" AA64 CPU
Date: Wed, 27 Jan 2021 21:45:28 -0700
Message-Id: <20210128044529.1403-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128044529.1403-1-rebecca@nuviainc.com>
References: <20210128044529.1403-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=rebecca@nuviainc.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable FEAT_DIT for the "max" AARCH64 CPU.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5e851028c592..9a5cfd4fc632 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -666,6 +666,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
@@ -715,6 +716,10 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
         cpu->isar.id_isar6 = u;
 
+        u = cpu->isar.id_pfr0;
+        u = FIELD_DP32(u, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = u;
+
         u = cpu->isar.id_mmfr3;
         u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
         cpu->isar.id_mmfr3 = u;
-- 
2.26.2


