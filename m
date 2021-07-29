Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3A3D9ABB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:01:57 +0200 (CEST)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uQu-0000tu-Pz
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCn-0004WN-Ut
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCk-0002fv-Uy
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso6744535pjs.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eh6jSlkFkLDW4j3dUChHjpO3vt9gth6BEs6Q46dbo0U=;
 b=MlgmBJ1Uuxc/shG2v0FOkWSFkw8C6EpsxoTnWRc29tDZaFPYeNQzAeSGhbviCALohw
 ZrfTrzx9Ow3gBI6jN6ZHVDLANksHfO2NqxUrBXyovm2uvngeoxlDj3dIbQrGG342s4tv
 ItCtpPcxv/LTgYIyLJxP8jQh8Li9bdv3f/p6C7gZBvqCyAuUJMZD5DvoFzJxAKSR8VFL
 J+7UH3wymaAQ+AOhmfO4FvroV0REjs10zEV1BSiWLreQsdwhOtgRDlgNTiRx5KMUyGPw
 d4WdK92lxbENtCrX/1IEb0gPNNG8uwEJtLFt8UMudtVVLB0TbY3zeHs4ql3azeetAqqE
 nGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eh6jSlkFkLDW4j3dUChHjpO3vt9gth6BEs6Q46dbo0U=;
 b=eQ90O9VrSrC9lCEdMl0QUWh6/35vL0MFqP9CTCflMkiVQP3g8jZ4vsD6XiWHKwng0K
 KJ6d4iT0Nas6H8fhpzQQ2o2RS8TwTKAainj7LGsxWdv9mxLhxG4zuXQbMJE6eUbmiVcU
 r9n0FoveISuHWHcMP3XDh3sS5Qr942IK00D4T6lJPmDkOGoS9PwWHYGnE6xvPWQ6oIgv
 KsFFqNxYgiRpOlqoQumuaKzyzIMNlyqfMwFLsawetw5QU0i5uCmxbMvsDbjFZ4hQFbW0
 rXYZsLwSSOewnJvhs0f3kZmrV0YmqELq5oRlkamfFcZ5rbCc0g8W6iIJQ78OE33Sv7Dv
 7kkA==
X-Gm-Message-State: AOAM533z1fBYY1tn0o8zFjSeUQuerBZIALZ7OrQckMyAVKH1pQfZWiHk
 fhAxD+7ZYCBN/27+dYc9ki/leFMFUOIG7w==
X-Google-Smtp-Source: ABdhPJwEAs2WNLASEl+MRcN1AF8OTPrY3XTuti845fVRC33UIIx2B3HUweCOcNe8JUjRuBRrN+b15w==
X-Received: by 2002:a17:90a:b387:: with SMTP id
 e7mr10423494pjr.77.1627519637782; 
 Wed, 28 Jul 2021 17:47:17 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.47.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:47:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 23/43] accel/tcg: Remove double bswap for
 helper_atomic_sto_*_mmu
Date: Wed, 28 Jul 2021 14:46:27 -1000
Message-Id: <20210729004647.282017-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This crept in as either a cut-and-paste error, or rebase error.

Fixes: cfec388518d
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/atomic_template.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 4427fab6df..4230ff2957 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -251,7 +251,6 @@ void ATOMIC_NAME(st)(CPUArchState *env, target_ulong addr, ABI_TYPE val,
                                          PAGE_WRITE, retaddr);
     uint16_t info = atomic_trace_st_pre(env, addr, oi);
 
-    val = BSWAP(val);
     val = BSWAP(val);
     atomic16_set(haddr, val);
     ATOMIC_MMU_CLEANUP;
-- 
2.25.1


