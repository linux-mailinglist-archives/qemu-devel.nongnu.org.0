Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3842A31311B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 12:42:00 +0100 (CET)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l94vX-0006PF-9P
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 06:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90Us-0005C7-76
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:18 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:36518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l90UQ-0003xk-0p
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 01:58:01 -0500
Received: by mail-il1-x136.google.com with SMTP id g9so11825712ilc.3
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 22:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKWB7YexJnaUit3BNYa9SGu8rC7g3Cy8dSqEGGB8qus=;
 b=NARtokfaqFyTefE19kVvZqx9lXdNA1zFZppJrp1sfEAYvqK3lPx/j16ryoA5v29YDU
 tpQXbPSflOSNoXih0MMe/5fwvBAzPiDgEYmHaoarfeL/qnxaw4fvqRq7rSw9Z2pPAB9i
 RZF5ZyTj0Vt0ahnnnKOwPxlMcGtVhYqQKtBPZqday2izF1RVY+8f2BXRvE2WRTcCfXM8
 asT/7ZhAPIjBjzcZcw6++zGioKiDB3AlodqazJa/mSoRG1TXuabIOj2oC9WOQjX9eIq7
 1SE53aYZtdH+VDi05Ur4LBovZJOFLXPVbWM3zjiUZPT73H0Bsvc+12NQXx/b4yjFMGYr
 oW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKWB7YexJnaUit3BNYa9SGu8rC7g3Cy8dSqEGGB8qus=;
 b=SIFobXKTe5s31or3sQcO+zPAUggmUWYVEMEOvMf5pe3ckYIcaQCvYOI5zuXGAQROFs
 DkiadIDuTXS8dgXMkYLR4Pfg3MAH0WTXkAoxHAhr0tKdUcXVBT+qL/Yqe69NPwj5mPso
 O4w/ZFS8e+zCLJ0uISeNApVIPYhGcBUYhfApHC8mc+EYwe6mpaS0kjrE6CYDC+5Xqpgi
 L4aWbgvI7mh+NLMFhckNhj3CZBG3Ignnzb0yCp6yFaKnh9PFeTjth98Eqqj4IRkLT580
 KeZr1BV1cB84PO2uR/Tb+gHVhyl1APig0+tyDskVw46knsTw8lsOvNyMUOQ10InZVi/3
 E20A==
X-Gm-Message-State: AOAM5316ayTqBJAT+TMCLXvibDz39foXGFoHSpKaEKvE9Mluj9IN7i3M
 vjdQCkCxSoZOsphtfwA7+YMDbcbLMEaldhRP7vLcQUoQGsMUejjQT8Agvn4kVIzcduCjxFvKcKH
 gieLfA3eke5mLNi6I5xc11D3HQnov+Fu2bl+Fkukw5OOGoIaK2iQvnDa9YLCugVd579l+c04=
X-Google-Smtp-Source: ABdhPJxIK+E3LufGnuth41YOkoE5kfLkzGv1UElXLCtSkXDWLknb2h8CHbhLXrDG67kbPQewVT4a9Q==
X-Received: by 2002:a05:6e02:b46:: with SMTP id
 f6mr13271322ilu.230.1612767427183; 
 Sun, 07 Feb 2021 22:57:07 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id c19sm8335904ile.17.2021.02.07.22.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 22:57:06 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1
 for "max" AA64 CPU
Date: Sun,  7 Feb 2021 23:56:59 -0700
Message-Id: <20210208065700.19454-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208065700.19454-1-rebecca@nuviainc.com>
References: <20210208065700.19454-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index 10c51181767d..c255f1bcc393 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -669,6 +669,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
@@ -718,6 +719,10 @@ static void aarch64_max_initfn(Object *obj)
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


