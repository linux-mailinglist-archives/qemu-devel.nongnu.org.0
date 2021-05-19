Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DB33895C1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:48:08 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljREl-0002BJ-MR
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyh-000474-PE
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:31 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:44627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyX-0005lE-Cs
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:31 -0400
Received: by mail-oi1-x22c.google.com with SMTP id d21so13963149oic.11
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTg6BvoWJ/n7on/pBv1zoVqUiCNkVIMQcf6I+J3L8wc=;
 b=n1BmLBqxNQgv5dN5Yy7VjXC5UXez89zsm4y6i8xGMKUw0Qn18S7m04KZcpMVOvogQ2
 gtYVdMk9+IZG1Ve2gEkO/tepIQcCrF/pL4plN/BMDUcpdtB/iGwjPN3/z+0gBZjK6wK8
 wrySv6jQoyr9Ddl+V5A87uc641IjuFpgpGM0rN+cBL6YSlxWN0BqPVmTJL8W/IyeDCjC
 bXSWrlBbKQKRJKFY340ofuax3FrysJNxVaBec5VGK2NoWx8/Bcs2P68iW/Sto1W965DU
 j19QnuRwTPEDwT3eAC8bqPPS+dHiVOAmwQ+Kx6pnLwIIfYy7/NkVQ7JrskXxV7xe51h5
 63PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTg6BvoWJ/n7on/pBv1zoVqUiCNkVIMQcf6I+J3L8wc=;
 b=E0PEly+Xmfl4KCAFQOb9j3Dwlyj/AMt9N3IPPigW1sbAwCB/cif8ZlqHLe9MZqHWYu
 wposd6FsjZVWDWNQrEGLfiCJEWx6A9I0SZmSisLYGrGrBSEg1hvJWXzClAXi9O2IXj2h
 ikbcbtmzQ4iKYJjwUnbfVq7aeljytdfVbyGW65rD2ZYmmJiLUfANKVxuvYo+PZonG1fI
 GVFp+b1IL1UevetWWn4UNjGKs7uc0W/izwctm538a3bPomrS5OlKwqXE/Z5O+1/zerGU
 fNVAfgql8Zw/20tIL++xbGSTMCdqvcEAJdXDevhp8cCYWMRMKJH5xxwFHq4oTSpOViI7
 RWdw==
X-Gm-Message-State: AOAM532Mx/Pa1SZFfBrOn2xZvxbVRBMcCahA8YDMTTiHZPzv3y3Nup7Q
 DJiS5i8bOVyrOa0RfzP1lsd0uwq+IhEv89d0
X-Google-Smtp-Source: ABdhPJxnN6Q8DBJ6SE40hmGoqCRoyaUs5ZKmpDXIXKMOS/PykLnK7RoGJj/an/lK5jAozz+MKNJ1Fg==
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr555837oic.18.1621449079087; 
 Wed, 19 May 2021 11:31:19 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/50] target/i386: Fix the comment for repz_opt
Date: Wed, 19 May 2021 13:30:27 -0500
Message-Id: <20210519183050.875453-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After fixing a typo in the comment, fixup for CODING_STYLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210514151342.384376-28-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b9b94f0625..226fb62ccb 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8521,15 +8521,10 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !(dc->base.singlestep_enabled ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-    /* Do not optimize repz jumps at all in icount mode, because
-       rep movsS instructions are execured with different paths
-       in !repz_opt and repz_opt modes. The first one was used
-       always except single step mode. And this setting
-       disables jumps optimization and control paths become
-       equivalent in run and single step modes.
-       Now there will be no jump optimization for repz in
-       record/replay modes and there will always be an
-       additional step for ecx=0 when icount is enabled.
+    /*
+     * If jmp_opt, we want to handle each string instruction individually.
+     * For icount also disable repz optimization so that each iteration
+     * is accounted separately.
      */
     dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
 
-- 
2.25.1


