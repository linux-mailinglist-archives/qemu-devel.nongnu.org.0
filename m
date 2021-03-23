Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53982346692
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:43:25 +0100 (CET)
Received: from localhost ([::1]:53900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOl3s-0001m3-Cg
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHP-0006yu-Df
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:19 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHN-0002qB-J3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:19 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so24294267edb.8
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5VH/iDuZ8gOKK9M225cC8SQA1L/b8jfUqqAkjkoetSc=;
 b=i2xImALxk25LiGVgYSL78aj4ZXbZzI0Opw3+bwkjnUFr1VJB0fk0xJ9rsSLw4hLKCj
 XGV68ovPnZfotNq9RIRVc6TpbdkXRWD7AC8cRUXrurZM7M/ZMed8ARxHX3E8q5Q8myhf
 Ff3xLJf+ob16woLSiRN/nyfTIF1AZsUJoASyQe6uD+3Oae8xFf6sEHvUVrJzniFX5H8/
 uweWwVUf5/fz4Dm7F9GPKoXMpbJkW6k1WtquHWztv1ULXmH6stHvuW2isG6INLLuNg85
 2JwxbCwJTz35vAhzCL3TampKoszYZBsaQljAb9goYATrW+wIcBUD9gL2ta4rrn24WSfy
 y6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5VH/iDuZ8gOKK9M225cC8SQA1L/b8jfUqqAkjkoetSc=;
 b=CRFeHD5+ZSkqWOy1eHbSXgkTvCTAbi5GHhJbruCl1uv1JLJEJD1bu5YOKdT93Yo/dP
 LkyWi63BRIrMC0RzPxK1xpIoiOhSRMGt9Tr02EDAVyb4d2O0XpW6bs1KOg/0b9TALACU
 tFPC/ltJf+uI5hcdBAktfCxPJp8Sa5V3hqeYgw8j5rMspvcAjnvaXoQ5SZL7aictJ/kr
 a/fG3dctSRKpXbUU4JqhUXEHyu7R3nm8YpgbXZZPbo5SuWkarwbejOIqbcGvOqEc3OBv
 KlTZ76sK/uaSIhEBvDDSNFIyjFhcDmuD48qeAlUgXpL006fpFAdX1ck/DVsIoDRXPY/4
 LExA==
X-Gm-Message-State: AOAM532kwf4u7EK+Anlbx5grGf2ao0xWRL8q86ohdyzV1qZ8OUqdMYt1
 OBgy+SnfNhJxSqTEsuKT9VtwRg==
X-Google-Smtp-Source: ABdhPJzxYs8nSjR+4pdJoBU3du2mmy39wlXpU24+742Jr9KgjcC6Ll3MirX9SfXSJM1uYkH58SmmjQ==
X-Received: by 2002:aa7:c88e:: with SMTP id p14mr5355908eds.119.1616518396199; 
 Tue, 23 Mar 2021 09:53:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm11379745eji.80.2021.03.23.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 181EF1FF8F;
 Tue, 23 Mar 2021 16:53:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] docs/devel: expand style section of memory management
Date: Tue, 23 Mar 2021 16:52:49 +0000
Message-Id: <20210323165308.15244-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This aims to provide a bit more guidance for those who take on one of
our "clean up memory allocation" bite-sized tasks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210320133706.21475-4-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 46 ++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 8b0bdb3570..260e3263fa 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -385,17 +385,37 @@ avoided.
 Low level memory management
 ===========================
 
-Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
+Use of the ``malloc/free/realloc/calloc/valloc/memalign/posix_memalign``
 APIs is not allowed in the QEMU codebase. Instead of these routines,
-use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
-g_new0/g_realloc/g_free or QEMU's qemu_memalign/qemu_blockalign/qemu_vfree
-APIs.
-
-Please note that g_malloc will exit on allocation failure, so there
-is no need to test for failure (as you would have to with malloc).
-Calling g_malloc with a zero size is valid and will return NULL.
-
-Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the following
+use the GLib memory allocation routines
+``g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free``
+or QEMU's ``qemu_memalign/qemu_blockalign/qemu_vfree`` APIs.
+
+Please note that ``g_malloc`` will exit on allocation failure, so
+there is no need to test for failure (as you would have to with
+``malloc``). Generally using ``g_malloc`` on start-up is fine as the
+result of a failure to allocate memory is going to be a fatal exit
+anyway. There may be some start-up cases where failing is unreasonable
+(for example speculatively loading a large debug symbol table).
+
+Care should be taken to avoid introducing places where the guest could
+trigger an exit by causing a large allocation. For small allocations,
+of the order of 4k, a failure to allocate is likely indicative of an
+overloaded host and allowing ``g_malloc`` to ``exit`` is a reasonable
+approach. However for larger allocations where we could realistically
+fall-back to a smaller one if need be we should use functions like
+``g_try_new`` and check the result. For example this is valid approach
+for a time/space trade-off like ``tlb_mmu_resize_locked`` in the
+SoftMMU TLB code.
+
+If the lifetime of the allocation is within the function and there are
+multiple exist paths you can also improve the readability of the code
+by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
+for more details.
+
+Calling ``g_malloc`` with a zero size is valid and will return NULL.
+
+Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
 reasons:
 
 * It catches multiplication overflowing size_t;
@@ -409,8 +429,8 @@ Declarations like
 
 are acceptable, though.
 
-Memory allocated by qemu_memalign or qemu_blockalign must be freed with
-qemu_vfree, since breaking this will cause problems on Win32.
+Memory allocated by ``qemu_memalign`` or ``qemu_blockalign`` must be freed with
+``qemu_vfree``, since breaking this will cause problems on Win32.
 
 String manipulation
 ===================
@@ -485,6 +505,8 @@ In addition, QEMU assumes that the compiler does not use the latitude
 given in C99 and C11 to treat aspects of signed '<<' as undefined, as
 documented in the GNU Compiler Collection manual starting at version 4.0.
 
+.. _autofree-ref:
+
 Automatic memory deallocation
 =============================
 
-- 
2.20.1


