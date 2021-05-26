Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA139138B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 11:21:22 +0200 (CEST)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llpj7-0006Pt-FB
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 05:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llped-0007X2-5e; Wed, 26 May 2021 05:16:43 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1llpeb-0003sv-Ku; Wed, 26 May 2021 05:16:42 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q15so408173pgg.12;
 Wed, 26 May 2021 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8s1GYkpTL1y92MdcYO7OmqR9Va30aO0pcZm8p856ojg=;
 b=ryN4wFRKACtM6+CWtJmR1uxN0vpGj26/GrABplly0UW8ARQCbsgcxX7YJlIimXnMVU
 mHjq37NjJECg83RUkd5vByn/sROLpmHB7na3+tL9hU6N/lRhEjLzw3U1jGlsf9pnaTx0
 1FM7Kliz2FsJfyddDx0Qvfio0TO4zCeOqUIoZB4PA65fabK4bpoAUg6HS6nW7smswcRI
 xBAJuBHw/PS8LnWdAOOHSKHFeewVz9jl1hUZ+SWJ/xZG5QQoVee0XaiVx0NnJqK83KvT
 g0tSYBO1488aHJeUnZ5Ww/i14gAe5z4Y+Atlp+oGtgtNBEughyhNGACQ7CFk7Jo+CDEt
 RA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8s1GYkpTL1y92MdcYO7OmqR9Va30aO0pcZm8p856ojg=;
 b=fTghKi8z2rrUAWbf9XAofJcu4cpkET/gK5Lk9AikuoICCcKT2YxqZtKVCd1eHFzsI4
 Q9uo//9cKONx9ROD4ZcmKwGjXWBnPAthGqn0r2wq+YEcx+w5Ta86VRqOBBvYi1foGBad
 QCvV38nZT3wdiN+96AyCwH4TrCJWZAG1h+kmWLvGUgIbkRE73aWdML5gIgTWC9UkXeNK
 8W7qLcVEnaAVq5S+0Ig1c3WWBai6xv/6BiLe5mOf/ICdBBKL6jIZS6IeasICH5UjMX8B
 xEw77HDNfeiaOhWtxlXTgNhxpVfhv+UiG5+U2sUX4Mzyhk+09/mdl7gv5iZB4WSki2jb
 CV0g==
X-Gm-Message-State: AOAM5315V3la6tmeu2jnpD5PrKl/Vv2om4nMRK4rDobwmPtickPES7HY
 cQJCXgctMb8wRhn8dadjh04v4b5o+a3VKA==
X-Google-Smtp-Source: ABdhPJxPeqD38eU7KkH0oXSTtxB+E9LHkpKiyK/PSE108k0WHI+QspGQ2poGyzecdE/7tdiGkakFuA==
X-Received: by 2002:a65:6a05:: with SMTP id m5mr23501269pgu.319.1622020599929; 
 Wed, 26 May 2021 02:16:39 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id h22sm15055171pfn.55.2021.05.26.02.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 02:16:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 1/3] spapr: Remove stale comment about power-saving LPCR
 bits
Date: Wed, 26 May 2021 19:16:24 +1000
Message-Id: <20210526091626.3388262-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210526091626.3388262-1-npiggin@gmail.com>
References: <20210526091626.3388262-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 47a9b551547 ("spapr: Clean up handling of LPCR power-saving exit
bits") moved this logic but did not remove the comment from the
previous location.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_rtas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 03355b4c0a..63d96955c0 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -164,7 +164,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
     hreg_compute_hflags(env);
 
-    /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
     lpcr = env->spr[SPR_LPCR];
     if (!pcc->interrupts_big_endian(callcpu)) {
         lpcr |= LPCR_ILE;
-- 
2.23.0


