Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC3322BE40
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 08:50:48 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyrXb-0003hi-88
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 02:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSM-000499-PV
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:22 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSL-0000Jz-02
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id f139so7229858wmf.5
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mb3qWyP/9FE2vD7jrxPFH4L+sWhR13YlYckySzBJW0Y=;
 b=MHxmv6Gbd5UqfNI/R9ENV5xXM4lYKiMEUl/0jEtz0eSk7+iedQiQ/NJtKGKB4vG8Q5
 NUcPgndghBVu9tSHW6M2jabML9J7t7wXfkEWRJXz1UrGgAlku3yZzEi+IJU7c7dDfg9b
 l+Yhj/CxmueeRHYdKBIeyewoyGpOs6sfbBTSOHDZIwOg1YT5n4ltvFp38GWgNO6Hyuta
 opGC45mo3VYC2laiibJrHwLTXgKrTDUDF2b4euE8C8BbB9feoF9HARV6HFMR50XceIUw
 5OkLWKXb0WZdhSqS9ELt00uCwmDpz0m5hird7hLm0+gOpkWLbyKX8PfmdPhkztovQSHE
 tCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mb3qWyP/9FE2vD7jrxPFH4L+sWhR13YlYckySzBJW0Y=;
 b=i4+wCpTsaPn2bMsWkqJZDVTXUM2hvTOqCFX+tjBL5LiEK7mRxVRVtPasFhCCvB3vC0
 bHOktlkoeZYFTrTfnnJ9JamQOHKyx/GefFeOoQOTUBUa/9We5eD8O/zD3MEU2GTOyuna
 DmW/BOtIC3N7T0Rk3mqbuzpeVzZNNBuSGKkHnrWHUbnzrhuPM+YmPDqOoL0tfuk1ehny
 G7YtywFjeSie4oNYAYBgrHYUKp7575deFVGDhxrPL4NNQAzGZj7SY81/BNiwXoH/PZzC
 0n+J0zKVxmZZkZOHi6QX5X0ynukMpUXzq1zWoGVZ+HD6f5QcXxOe6BgXV9/WBRlzMgVW
 3LJg==
X-Gm-Message-State: AOAM53190DKxsvN7GgO/1JBoFrAzoMuJAuSoSFS3haGiXhMChS/BW5Tv
 y8vn4i+aIOYwfwylhmRBUdIQng==
X-Google-Smtp-Source: ABdhPJz3zrwgJwTC2CLoN65ldbvjfJrg0CFCjZmmpaqkcqm7+/e5OPSc0qEjyTHypcCx6PsHq7k/8Q==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr16022wmc.97.1595573119527;
 Thu, 23 Jul 2020 23:45:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h11sm152763wrb.68.2020.07.23.23.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 23:45:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA3291FF96;
 Fri, 24 Jul 2020 07:45:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/16] linux-user: don't use MAP_FIXED in
 pgd_find_hole_fallback
Date: Fri, 24 Jul 2020 07:45:01 +0100
Message-Id: <20200724064509.331-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724064509.331-1-alex.bennee@linaro.org>
References: <20200724064509.331-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Plain MAP_FIXED has the undesirable behaviour of splatting exiting
maps so we don't actually achieve what we want when looking for gaps.
We should be using MAP_FIXED_NOREPLACE. As this isn't always available
we need to potentially check the returned address to see if the kernel
gave us what we asked for.

Fixes: ad592e37dfc ("linux-user: provide fallback pgd_find_hole for bare chroots")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200722062902.24509-9-alex.bennee@linaro.org>
---
 include/qemu/osdep.h |  3 +++
 linux-user/elfload.c | 10 ++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0b1298b3c91..20872e793e4 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -173,6 +173,9 @@ extern int daemon(int, int);
 #ifndef MAP_ANONYMOUS
 #define MAP_ANONYMOUS MAP_ANON
 #endif
+#ifndef MAP_FIXED_NOREPLACE
+#define MAP_FIXED_NOREPLACE 0
+#endif
 #ifndef ENOMEDIUM
 #define ENOMEDIUM ENODEV
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 7e7f642332d..fe9dfe795dd 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2134,12 +2134,15 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t brk,
             /* we have run out of space */
             return -1;
         } else {
-            int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE | MAP_FIXED;
+            int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE |
+                MAP_FIXED_NOREPLACE;
             void * mmap_start = mmap((void *) align_start, guest_size,
                                      PROT_NONE, flags, -1, 0);
             if (mmap_start != MAP_FAILED) {
                 munmap((void *) align_start, guest_size);
-                return (uintptr_t) mmap_start + offset;
+                if (MAP_FIXED_NOREPLACE || mmap_start == (void *) align_start) {
+                    return (uintptr_t) mmap_start + offset;
+                }
             }
             base += qemu_host_page_size;
         }
@@ -2307,9 +2310,8 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
     /* Widen the "image" to the entire reserved address space. */
     pgb_static(image_name, 0, reserved_va, align);
 
-#ifdef MAP_FIXED_NOREPLACE
+    /* osdep.h defines this as 0 if it's missing */
     flags |= MAP_FIXED_NOREPLACE;
-#endif
 
     /* Reserve the memory on the host. */
     assert(guest_base != 0);
-- 
2.20.1


