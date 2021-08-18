Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E043EFD9B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:14:51 +0200 (CEST)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFmf-0005Hw-O7
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhF-0006Iq-Ol
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:09 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhE-0008Fj-BV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3667500wme.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 00:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrrokDPajS6nMF2KbWHnqmO0OBFdFaecOU4LdS0Cd44=;
 b=TdXvgLtbMSwYCrO5hjti9UUwhuOv6tzaEqKMC/ZMXyxmN0zB7pKgnBgAplZFdkwhKt
 MEwLhFqrYjDvL5ySB7v9OIn9JbAG5oAv04gDlywuyIxTFOmd8qdKlLLkM5uJA0GjRsaH
 I8Gpt4IbkgwkSdBRkR9P4Sfr2sF5g/E6/Qshb77JM/SHETt45VHzTEGfeq3cCujNFAME
 hsbQASMDmsTnHCD3EbFeKCs20F23hmsjSjb4+mnvBMrDkz4aUWIUU7DhHhZ7TJzdGPAr
 Mu6mbNxMr7v7cvPWHQiSlA2LRJvzGgH+YyRHpH7vp0BKDpv4GcWxpAhc5mqtmSi6uE7C
 IFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrrokDPajS6nMF2KbWHnqmO0OBFdFaecOU4LdS0Cd44=;
 b=cMyibndA+P3EDwN55ek/xN4MkflM7OVzTvY11PL/LUcFn8fvEBZhz6piJL325sU4cQ
 PNKkqE1nAdVi8tmtnpYgY4MBpBukosidSZx+Qa0ZCKwk/LUIvtEGyOQfCYLxQo5zAv/v
 DFZgTsn7XMihunk/9t9K3NB3+UbrRUNNu6p0q2AJV0AUY8GlZXvmfYeUSS5lgVaZIV1S
 8qJhf2JfcmnEHFNpCU+4krCI5l5tlbHnhiNqmlIWSDmqfe9DMX/ompboPmukowD4a9cP
 E0QVBhUchHYmNR7c5u/d9yrnqn7xZb9thbt1lLhwFFYYeQPQBPSAfFtZA1yU6HDiYs15
 P3vQ==
X-Gm-Message-State: AOAM532WZGOQO3Y1c2dj41ACfQx2jcLqbysmCjWEg3a2Yg1f9umpXFjx
 OU442DmnBwaeqrgkSfbty23558u3NIo=
X-Google-Smtp-Source: ABdhPJz06cgM0gWEwC3xJLV7DhWNm6XvHmZdkJ1Yq3A5OT5Z0QEuRkx8qNuvMJAX6AyJq2CddQIx5A==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr7038666wml.186.1629270546052; 
 Wed, 18 Aug 2021 00:09:06 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b53c5004989ea3bb9da8dea.dip.versatel-1u1.de.
 [2001:16b8:2b53:c500:4989:ea3b:b9da:8dea])
 by smtp.gmail.com with ESMTPSA id w18sm4902609wrg.68.2021.08.18.00.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:09:05 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/i386: Added ignore TPR check in ctl_has_irq
Date: Wed, 18 Aug 2021 09:08:37 +0200
Message-Id: <20210818070838.44344-5-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818070838.44344-1-laramglazier@gmail.com>
References: <20210818070838.44344-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The APM2 states that if V_IGN_TPR is nonzero, the current
virtual interrupt ignores the (virtual) TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2c44bdb243..cbd3f086c4 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -83,6 +83,11 @@ static inline bool ctl_has_irq(CPUX86State *env)
 
     int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
     tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return env->int_ctl & V_IRQ_MASK;
+    }
+
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-- 
2.25.1


