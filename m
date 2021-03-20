Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E08342D23
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:45:46 +0100 (CET)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbvF-0002gG-1y
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn6-00035m-UA
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn0-0004Eo-1g
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id z1so14055211edb.8
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IM1oBayvdunRojoA3Pc9uJPF3Nk+3/AuR0/Svwaw3qQ=;
 b=FMVl8+T8V14SRgiP193wldryBjbcHXTun8kfuvY17B9vv4WL2II/NLqmjeZV0vpCiz
 mMjH/xFGzkpTqvtx8Gwlv1oeZU52xPmHFjRh9Qi9Ud5usTz5sK6n/2YoQbUHe/UkUkwP
 hps8JJAKlwHWOjwYrM/XputGzoWtzx8uYTA8f5EZq2Yes0B0mp4gJz8x5rNh0PNB0LBg
 oj121kCwN0a7i5g9WyGxivOpPaaqcZ1ikmkzKnylGWSi5YShZoyi7VORRjkZguFkW/7r
 TfgMtGGHLsZEN1r7ChpDov8FqKIO6Q2aJvvwiniXP/euN9f/Doqdy20sVgpbLoUTh5zL
 HN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IM1oBayvdunRojoA3Pc9uJPF3Nk+3/AuR0/Svwaw3qQ=;
 b=f61KLt7FCzqKHv9hA4dFU8lpdL0EMBxYcGJyvHntxfAehtjC2eb72CoZO7u2hSLPQ0
 XQPXUn5Ds2qkL2SY0WB31niGg/3zn6BSi+xEQgwtBU5Lm3QmWUAZ+UNr2MMlSGC9aS5s
 Qi+zkR2TGwicyHe7fVM9MK23CRrMaFBxZyGOH2PY8X5iTftJAu0IVb8zcDiL4VJoaZ1d
 a+mZTMCHLPTl4rsFkGCIQNxSn7TfVrpPXeWHU8Fc/Stn16yOAz+09ihFEUS4xdzrHTY0
 GvTvU7Ym2kZA0HOJMHQv+2ojGxc2TFcOjPovZWTFYqIdci7573Q7EbQRV/vFiYoSNI8v
 sBtg==
X-Gm-Message-State: AOAM532ApdKKuUaJZ/grMHw1IKuww3e8OTJw3Ik+Je6rtxw1E0n7Uqin
 O2ryd0xmVMVWRRp9K/EikXTQ779YPGJNM/xQ
X-Google-Smtp-Source: ABdhPJycP4mv43F5u1Cboc1dB48eu55EvbxuaGZMp+gWEsVr/d1Dj/L0e93vdPmBbMlcC9UdoPR+kg==
X-Received: by 2002:a05:6402:5255:: with SMTP id
 t21mr15585751edd.91.1616247431818; 
 Sat, 20 Mar 2021 06:37:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z9sm6395435edr.75.2021.03.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0010D1FF8F;
 Sat, 20 Mar 2021 13:37:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/14] docs/devel: expand style section of memory management
Date: Sat, 20 Mar 2021 13:36:55 +0000
Message-Id: <20210320133706.21475-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This aims to provide a bit more guidance for those who take on one of
our "clean up memory allocation" bite-sized tasks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


