Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95127455ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:00:15 +0100 (CET)
Received: from localhost ([::1]:56258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnita-0007fV-Dh
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnir7-0004nr-O2
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnir4-00084F-Tn
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 09:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637247458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3us/2QX6xHvSyMB3iMuIzPGz+T3xWB4txlMwAd+l0s=;
 b=V7bCA94Zebaz38TtRmAaPa0V/Mj8tEIEHXQp2rFipXRBgbOKIKMMgBeL7spfrmoWQPGI/d
 thvjm5l4HN3hkQXUvpVQxsoIWJbupBTcQcGg2dpWghEMURxALp2GIh9LSkCsSHULoKwGhe
 NKaIqzEBR2jJNDvXETVHkj63IFIk1No=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-Mm9eSH4wNjyBk6Yq5sLAzg-1; Thu, 18 Nov 2021 09:57:37 -0500
X-MC-Unique: Mm9eSH4wNjyBk6Yq5sLAzg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso3264194wms.0
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 06:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3us/2QX6xHvSyMB3iMuIzPGz+T3xWB4txlMwAd+l0s=;
 b=SfpVHv5Wi6E4phmwSZ5ONo5mCMn1mFSE8+vTtTKMALU8bS44DtpPxaqd/1gHec2NIC
 9SbPMXdJMpYEMo75LlrOLw06F3y/Ym278L2DfeSaI+MVsXbKwsxQNAROgf+g4K6LW+Tj
 LzazHqJO/Lc3udPlUT+VieeU/M9eyksO7NKRPzdX+O1JLFDoo9Gie+Yr8ZSNBpENBIJ1
 iCk59FEDbmWS+m6Od7c2f3Bmh8AXQZoHOY3dkQF0aqr2PbswwG/iwT+poU1esF/SO1bA
 GLdeHRF36DQXhIhvzBt4dXzl6t/6Bv9KF+z32ZYEy1QpVv+y1eX0SCzJemG8HKLuu+n5
 mfHw==
X-Gm-Message-State: AOAM530+V7oD9FVkSXqyBBLfNGiY6pk6ATn2vaEXKbd8lnvkPsBbaEEY
 pREcOkFN6jhPTTjcvUb5+NI5lhVcPPVdoHlZiU+hsHeN1N0Og/pMV2qdIw0g/ECUaOF9Faf/UC7
 CokXRFUjh0U16rcbVOsjx1rE07+IuuPZl2qknB4kBq273VpXsAB6HaJVNOFV56fx7
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr32215637wry.62.1637247455329; 
 Thu, 18 Nov 2021 06:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7Vy50/RRoqMbMb1vlB+RFIURa8dhPXf4Q0RGgcJkntxcEMZnyS4mQdt/plnR2/jpo47Cvow==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr32215590wry.62.1637247454975; 
 Thu, 18 Nov 2021 06:57:34 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id g4sm89060wro.12.2021.11.18.06.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:57:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? v2 4/5] docs/devel/style: Render C function names as
 monospaced text
Date: Thu, 18 Nov 2021 15:57:15 +0100
Message-Id: <20211118145716.4116731-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118145716.4116731-1-philmd@redhat.com>
References: <20211118145716.4116731-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add trailing parenthesis to functions and render
them as monospaced text.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/style.rst | 66 +++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index a7487d867e6..0397971e528 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -130,13 +130,13 @@ Function Naming Conventions
 
 Wrapped version of standard library or GLib functions use a ``qemu_``
 prefix to alert readers that they are seeing a wrapped version, for
-example ``qemu_strtol`` or ``qemu_mutex_lock``.  Other utility functions
+example ``qemu_strtol()`` or ``qemu_mutex_lock()``.  Other utility functions
 that are widely called from across the codebase should not have any
-prefix, for example ``pstrcpy`` or bit manipulation functions such as
-``find_first_bit``.
+prefix, for example ``pstrcpy()`` or bit manipulation functions such as
+``find_first_bit()``.
 
 The ``qemu_`` prefix is also used for functions that modify global
-emulator state, for example ``qemu_add_vm_change_state_handler``.
+emulator state, for example ``qemu_add_vm_change_state_handler()``.
 However, if there is an obvious subsystem-specific prefix it should be
 used instead.
 
@@ -385,15 +385,16 @@ avoided.
 Low level memory management
 ===========================
 
-Use of the ``malloc/free/realloc/calloc/valloc/memalign/posix_memalign``
+Use of the
+``malloc()/free()/realloc()/calloc()/valloc()/memalign()/posix_memalign()``
 APIs is not allowed in the QEMU codebase. Instead of these routines,
 use the GLib memory allocation routines
-``g_malloc/g_malloc0/g_new/g_new0/g_realloc/g_free``
-or QEMU's ``qemu_memalign/qemu_blockalign/qemu_vfree`` APIs.
+``g_malloc()/g_malloc0()/g_new()/g_new0()/g_realloc()/g_free()``
+or QEMU's ``qemu_memalign()/qemu_blockalign()/qemu_vfree()`` APIs.
 
-Please note that ``g_malloc`` will exit on allocation failure, so
+Please note that ``g_malloc()`` will exit on allocation failure, so
 there is no need to test for failure (as you would have to with
-``malloc``). Generally using ``g_malloc`` on start-up is fine as the
+``malloc()``). Generally using ``g_malloc()`` on start-up is fine as the
 result of a failure to allocate memory is going to be a fatal exit
 anyway. There may be some start-up cases where failing is unreasonable
 (for example speculatively loading a large debug symbol table).
@@ -401,11 +402,11 @@ anyway. There may be some start-up cases where failing is unreasonable
 Care should be taken to avoid introducing places where the guest could
 trigger an exit by causing a large allocation. For small allocations,
 of the order of 4k, a failure to allocate is likely indicative of an
-overloaded host and allowing ``g_malloc`` to ``exit`` is a reasonable
+overloaded host and allowing ``g_malloc()`` to ``exit()`` is a reasonable
 approach. However for larger allocations where we could realistically
 fall-back to a smaller one if need be we should use functions like
-``g_try_new`` and check the result. For example this is valid approach
-for a time/space trade-off like ``tlb_mmu_resize_locked`` in the
+``g_try_new()`` and check the result. For example this is valid approach
+for a time/space trade-off like ``tlb_mmu_resize_locked()`` in the
 SoftMMU TLB code.
 
 If the lifetime of the allocation is within the function and there are
@@ -413,7 +414,7 @@ multiple exist paths you can also improve the readability of the code
 by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
 for more details.
 
-Calling ``g_malloc`` with a zero size is valid and will return NULL.
+Calling ``g_malloc()`` with a zero size is valid and will return ``NULL``.
 
 Prefer ``g_new(T, n)`` instead of ``g_malloc(sizeof(T) * n)`` for the following
 reasons:
@@ -430,14 +431,15 @@ Declarations like
 
 are acceptable, though.
 
-Memory allocated by ``qemu_memalign`` or ``qemu_blockalign`` must be freed with
-``qemu_vfree``, since breaking this will cause problems on Win32.
+Memory allocated by ``qemu_memalign()`` or ``qemu_blockalign()`` must be freed
+with ``qemu_vfree()``, since breaking this will cause problems on Win32.
 
 String manipulation
 ===================
 
-Do not use the strncpy function.  As mentioned in the man page, it does *not*
-guarantee a NULL-terminated buffer, which makes it extremely dangerous to use.
+Do not use the ``strncpy()`` function.  As mentioned in the man page, it does
+*not* guarantee a ``NULL``-terminated buffer, which makes it extremely
+dangerous to use.
 It also zeros trailing destination bytes out to the specified length.  Instead,
 use this similar function when possible, but note its different signature:
 
@@ -445,14 +447,14 @@ use this similar function when possible, but note its different signature:
 
     void pstrcpy(char *dest, int dest_buf_size, const char *src)
 
-Don't use strcat because it can't check for buffer overflows, but:
+Don't use ``strcat()`` because it can't check for buffer overflows, but:
 
 .. code-block:: c
 
     char *pstrcat(char *buf, int buf_size, const char *s)
 
-The same limitation exists with sprintf and vsprintf, so use snprintf and
-vsnprintf.
+The same limitation exists with ``sprintf()`` and ``vsprintf()``, so use
+``snprintf()`` and ``vsnprintf()``.
 
 QEMU provides other useful string functions:
 
@@ -462,11 +464,11 @@ QEMU provides other useful string functions:
     int stristart(const char *str, const char *val, const char **ptr)
     int qemu_strnlen(const char *s, int max_len)
 
-There are also replacement character processing macros for isxyz and toxyz,
-so instead of e.g. isalnum you should use qemu_isalnum.
+There are also replacement character processing macros for ``isxyz()`` and
+``toxyz()``, so instead of e.g. ``isalnum()`` you should use ``qemu_isalnum()``.
 
-Because of the memory management rules, you must use g_strdup/g_strndup
-instead of plain strdup/strndup.
+Because of the memory management rules, you must use ``g_strdup()/g_strndup()``
+instead of plain ``strdup()/strndup()``.
 
 Printf-style functions
 ======================
@@ -525,10 +527,10 @@ automatic cleanup:
 
 Most notably:
 
-* g_autofree - will invoke g_free() on the variable going out of scope
+* ``g_autofree`` - will invoke ``g_free()`` on the variable going out of scope
 
-* g_autoptr - for structs / objects, will invoke the cleanup func created
-  by a previous use of G_DEFINE_AUTOPTR_CLEANUP_FUNC. This is
+* ``g_autoptr`` - for structs / objects, will invoke the cleanup func created
+  by a previous use of ``G_DEFINE_AUTOPTR_CLEANUP_FUNC``. This is
   supported for most GLib data types and GObjects
 
 For example, instead of
@@ -552,7 +554,7 @@ For example, instead of
         return ret;
     }
 
-Using g_autofree/g_autoptr enables the code to be written as:
+Using ``g_autofree/g_autoptr`` enables the code to be written as:
 
 .. code-block:: c
 
@@ -570,13 +572,13 @@ Using g_autofree/g_autoptr enables the code to be written as:
 While this generally results in simpler, less leak-prone code, there
 are still some caveats to beware of
 
-* Variables declared with g_auto* MUST always be initialized,
+* Variables declared with ``g_auto*`` MUST always be initialized,
   otherwise the cleanup function will use uninitialized stack memory
 
-* If a variable declared with g_auto* holds a value which must
+* If a variable declared with ``g_auto*`` holds a value which must
   live beyond the life of the function, that value must be saved
-  and the original variable NULL'd out. This can be simpler using
-  g_steal_pointer
+  and the original variable ``NULL``'d out. This can be simpler using
+  ``g_steal_pointer``.
 
 
 .. code-block:: c
-- 
2.31.1


