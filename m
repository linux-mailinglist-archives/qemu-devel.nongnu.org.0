Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5333C35F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:07:18 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqgX-0001ED-C0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLqTE-0001cK-VT
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:53:36 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLqTA-0006WW-N9
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:53:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id bx7so18152589edb.12
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ooeIZaqVsYo38nTjYxN80Priwu4uJCeduHroRZtsPls=;
 b=awL42rTURFwjTueSWvnBxldFqcUrHvgUqkvQnL1sqV2UjSgIEBRBB+JcTZaQDtFbu2
 flSB6WlRKdOpKSi3X1p5n4FPo7QRAOPmT7NUeF2DoPtACmuFiry3S2SJ2QBD1xFYttBp
 A/fGgAfpatm2kVISxd/KTA0BlmiwghZeXEk3J5sTAXKjVawzbAujIkzzEXbHNce/KpY3
 29+XeaS7nRJi7nAOOTZ0rxNcFjXjpDnhq2WJceOVoFdblfgV3Oz7tjsRGmqm6rEVBPie
 7BOPxganIi6sQ3/lSkLS+pbpfPrVnwZsuTmwujLx1eVD4wjc1fZ6s+RoORdi3X16kNtN
 RcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ooeIZaqVsYo38nTjYxN80Priwu4uJCeduHroRZtsPls=;
 b=IRzwQFFWojk+CxsGZPkurx6kCoe/PUXi/hHjrC0vhbidAxDtK7pb0zK5xVGhGr1nau
 vLtUjhRmES/Sur9qNLNfadE/qGOyktXyJIU3VU5WEEFGBohDvONFpVdtkjNoKD931q6R
 XfiOr2++EZDOmXmVM4hagNHUMRa6mm42MZ6lu/5S/6DGsCZrfZPQ7/J7EbXOYVwsoJRj
 GDwXyXW9ZWfVmR/oRIpqmnzZCLrdcc2mwbicRhy3A9eYjkV9MW6V8C0Y3pdXqTi6u5Cm
 VIFKYuHzroGwlTBrn91PT/UqefFnsVtXjoxBmSF57niq3WRQFT/Ye6KtXO3F5JlhrdL5
 cqBA==
X-Gm-Message-State: AOAM531SHnGiqODT7EcZcQuKcLN2Q0KKzAZ5K3WKiOxxzDa8HWTU6ANU
 3WgTXS9QI17M+qU3g5mMzIJajQ==
X-Google-Smtp-Source: ABdhPJynOl7R6rbJElIBTwPbq9WUuOa8T+BdFnDWRyRTo/ZAafmx9THtXqP73cyqvw6+CVe9BvuriQ==
X-Received: by 2002:a05:6402:42d3:: with SMTP id
 i19mr5890204edc.220.1615827203644; 
 Mon, 15 Mar 2021 09:53:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm7665885ejd.7.2021.03.15.09.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:53:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA3901FF7E;
 Mon, 15 Mar 2021 16:53:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: expand style section of memory management
Date: Mon, 15 Mar 2021 16:53:12 +0000
Message-Id: <20210315165312.22453-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This aims to provide a bit more guidance for those who take on one of
our "clean up memory allocation" bite-sized tasks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 8b0bdb3570..823fa6f209 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -385,17 +385,35 @@ avoided.
 Low level memory management
 ===========================
 
-Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
+Use of the ``malloc/free/realloc/calloc/valloc/memalign/posix_memalign``
 APIs is not allowed in the QEMU codebase. Instead of these routines,
-use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
-g_new0/g_realloc/g_free or QEMU's qemu_memalign/qemu_blockalign/qemu_vfree
-APIs.
+use the GLib memory allocation routines
+``g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free``
+or QEMU's ``qemu_memalign/qemu_blockalign/qemu_vfree`` APIs.
 
-Please note that g_malloc will exit on allocation failure, so there
-is no need to test for failure (as you would have to with malloc).
-Calling g_malloc with a zero size is valid and will return NULL.
+Please note that ``g_malloc`` will exit on allocation failure, so there
+is no need to test for failure (as you would have to with ``malloc``).
 
-Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the following
+Care should be taken to avoid introducing places where the guest could
+trigger an exit. For example using ``g_malloc`` on start-up is fine
+if the result of a failure is going to be a fatal exit anyway. There
+may be some start-up cases where failing is unreasonable (for example
+speculatively loading debug symbols).
+
+However if we are doing an allocation because of something the guest
+has done we should never trigger an exit. The code may deal with this
+by trying to allocate less memory and continue or re-designed to allocate
+buffers on start-up.
+
+If the lifetime of the allocation is within the function and there are
+multiple exist paths you can also improve the readability of the code
+by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
+for more details.
+
+
+Calling ``g_malloc`` with a zero size is valid and will return NULL.
+
+Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
 reasons:
 
 * It catches multiplication overflowing size_t;
@@ -409,8 +427,8 @@ Declarations like
 
 are acceptable, though.
 
-Memory allocated by qemu_memalign or qemu_blockalign must be freed with
-qemu_vfree, since breaking this will cause problems on Win32.
+Memory allocated by ``qemu_memalign`` or ``qemu_blockalign`` must be freed with
+``qemu_vfree``, since breaking this will cause problems on Win32.
 
 String manipulation
 ===================
@@ -485,6 +503,8 @@ In addition, QEMU assumes that the compiler does not use the latitude
 given in C99 and C11 to treat aspects of signed '<<' as undefined, as
 documented in the GNU Compiler Collection manual starting at version 4.0.
 
+.. _autofree-ref:
+
 Automatic memory deallocation
 =============================
 
-- 
2.20.1


