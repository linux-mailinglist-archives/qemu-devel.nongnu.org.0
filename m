Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E16347ACE
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:34:11 +0100 (CET)
Received: from localhost ([::1]:48356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4aI-00082W-T8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wk-0006Hx-UX
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:30 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wj-0007KC-26
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id d191so13009972wmd.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLzVba92sB3FPFp388sRp+Thx4lW+oVZeKfAa3xPR1Q=;
 b=adnG4M9CBykaDOtOvvr58emmLoAdPbBEwvf1Ill/6WfuUlotqVMemiATHnYKMT3Yni
 aVLGy0JQsv61e8RZzBZgxN9xQ5N7usT0BKe3GU4nVXk7e0mX6ixDsTFSeaABore8YC0R
 HVzlzprcLeZIwXySCWM4VRqP1tg7hYRawVtiH/JB2wC/kU0RhkPKujyiTonKqIMGQL6G
 5X7kzbcYPAZ3qCXKq9ucUWg5roOg4+tmvy2OSurolC1uA+OK+o1lUEWqWqHUoCbsBoo6
 sMAPgxfG8gEaAVNHEkOdmDs9+1O6Ud8vT3K8MX/kL6NLG6oAKoVlhcTJ1rBYgo/SIRLm
 wZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLzVba92sB3FPFp388sRp+Thx4lW+oVZeKfAa3xPR1Q=;
 b=Y1N8YiEFoD0YSwz4lF6BJ6rBiX628uFtnrRkhPDocU6bZLQCjhm33Gy5Tbxe//zrQ4
 TUuDNjKgwRSMN1i75o3ioIXYt7dMV1U7PRAijJ6V73RSjvUvmjQi50sTuis7oixgU4k8
 jZmvDFFdUwkBS1TPdSLhdZSaXcKUaCKgJEuGtdwDcdqkZKOjGvGWHteh+ERgODj/nHj1
 +2w/VMQaTUNQ+FI/YgRaNqEsKAYIWwPD8yH2WrCWArIZ4Iv2xt34PwuzTvn8bHysHecN
 H5MbKRiU0NMyx/uVcI4tx20j+wm1tQWhKm54rGzzE24WqzM5qJ/OxmOw4gQk8R1LMe4Y
 XjTw==
X-Gm-Message-State: AOAM530FvelZjnYdwh1WRge2tHV/6pzpAUW8t696tnr5PfZPRcpeKvzY
 MmlMyQ+5kDJI1ebNGWOUs0dQFw==
X-Google-Smtp-Source: ABdhPJwqDJ9jr2T2R+l5b6m4DeZsVC/w7Ps0ME7YenKLhP23aGOW7RWaJSNg6Ue2OiSz5psxs55jHA==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr3266665wmc.168.1616596227741; 
 Wed, 24 Mar 2021 07:30:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w6sm3410048wrl.49.2021.03.24.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F0EDB1FF8F;
 Wed, 24 Mar 2021 14:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/22] docs/devel: expand style section of memory management
Date: Wed, 24 Mar 2021 14:30:02 +0000
Message-Id: <20210324143021.8560-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This aims to provide a bit more guidance for those who take on one of
our "clean up memory allocation" bite-sized tasks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323165308.15244-4-alex.bennee@linaro.org>

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


