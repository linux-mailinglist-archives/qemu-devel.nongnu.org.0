Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1AA810A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 13:26:56 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5TR9-00049G-IE
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 07:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5TLm-0007AF-56
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5TLg-0007I9-J7
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5TLf-0007Fr-RD
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q14so1454227wrm.9
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 04:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hEwLxmZ1/l0uu9kShjHwMMLEdP39KievYwY8GQL60m8=;
 b=XNsblw+iMOyRPzzXve5u68TAeQ+Sx5Dsce1UtFH07Fmmy+EtvXely+vmRk000jX0Mu
 +W7U666lhSQc3xfYdvhvU+DM/w3EYVHmarZZWSnA/KWs8SkTDtV6cqP4aINY6SCyTGCb
 lI2vk5e++XC6w2yfD8J2zsJ/c7FdbZ6tcd+P0d2AlgK0VvwmX62PfprHXDnSP+WjXWdw
 yPUKwK5jedCpFJQpzSiyTokq0KLzeSR2REu8GysAD0V8muPB28R1Gu3kQ2bpWn6UnX/U
 qYXMiokVzkVRDvkyGYS9Hzjfq6VUKmWCpcSq2BWqbiZTx0YPU+bEHzAVA3htOj1ESM7Y
 be0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hEwLxmZ1/l0uu9kShjHwMMLEdP39KievYwY8GQL60m8=;
 b=SRlmENU04LaSZ1yqHJ1n+vaVUVndRKxsDKIoIYMkGf0ftIVmZkF9/90f0e3aAm1quJ
 fdIyNXZy87Sllai5K7fSx2Fek6oZnZPJVHqMIwm+RJE3NVM2I88R8Ymh9Qk7HjjQiF7U
 UMmWr+zX9GE8WfU3OZHpTjnD32pG8tzp4tMUVhi75SkT1FqNpPYr7FH53sPIbe8/TTJz
 HyzTAVnl7S9CmOJbXwKnyxV6vsKerd69uq5ZPm/WvnmI7aejaeCmRf/Lcl0EzB0ZehnS
 BgzpdkLPXSQp5QShBVL7vfygwVjjW+c3UOXAa3bYVXem+ECGJrC0k8WBj8HuPW7vxfod
 1ZVA==
X-Gm-Message-State: APjAAAXZOnaJb9F+kMHHUKfwcu6XkNWRhFwxRM/Fv9mmulrkZrP1FSV+
 p1M8+qW7o0gxdhkc8HpPa99dZA==
X-Google-Smtp-Source: APXvYqyGDyAqXw7f4po4i0YTi9aiFNTfgTgrAXfSBqqxlSHjJxepqV+o6E5Sk3VIH//1/ttNn9FUDw==
X-Received: by 2002:adf:f186:: with SMTP id h6mr46801558wro.274.1567596074252; 
 Wed, 04 Sep 2019 04:21:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q25sm3344955wmq.27.2019.09.04.04.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:21:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 813951FF92;
 Wed,  4 Sep 2019 12:21:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:21:08 +0100
Message-Id: <20190904112108.2341-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904112108.2341-1-alex.bennee@linaro.org>
References: <20190904112108.2341-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: [Qemu-devel] [PATCH v2 5/5] atomic_template: fix indentation in
 GEN_ATOMIC_HELPER
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G. Cota" <cota@braap.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/atomic_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index df9c8388178..287433d809b 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -149,7 +149,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1


