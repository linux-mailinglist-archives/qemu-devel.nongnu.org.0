Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A371CB3DD4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:42:10 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9t8j-0007Gj-2d
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCy-0006WW-BG
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCw-0007UR-9E
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCv-0007Tv-PW
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id p7so59942wmp.4
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=ChAXva6YSSYbjM1DBwPiQI1g6eo1sIJEFyhcEiZi7kE=;
 b=JSy7hejGmesu5b62BHq9K64RllLLtWLzWreXf5jpLzogsugar3wBaolRqbTFhsTrmL
 sR0XB3dZ2Vx/JPPZt48jE/wF7j2tqp0r3gC7FOV+7esKzgpVE6ShnCtM2aoqyzZ0rNe0
 qLgDdQMXMFNBUhUyedMV/tBNJ2HYsROY7QUGKarkQnv1rOpGFZfFe3FXT7YYyk9hhzWD
 SSNYxm6K8gd5kENx/4c3goyO4qoeDqX09iI9sv7BMfuiWHmnq8ytNJkfEnBDGV0TQSCv
 vrpEyFTRxkR5aICuPdshqwHVq15SID5dkitCcAv74WUXEoo5OzHYywXgp+0sQn/ADa/Z
 z2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=ChAXva6YSSYbjM1DBwPiQI1g6eo1sIJEFyhcEiZi7kE=;
 b=P5eSeVHhyWKXzaaOaVyYnKZlvbv4EwZkVYjUCLjjUmFDaIJvtmP7/cBQZV6gfwNYDr
 lqjs0AHiF2xwLZZHKhHH8zUBKk4UpakAEZ1EL/buvZAgO+EueBVWM3+8Q3ckhlzjKwPs
 jZTuUPRfaBT4S2cPVhV2GIIh4joNBAUO2R8Hw6OWxxl6UfMAyLtXCBvLFnZvoPkc05Qj
 aLfQ5fuJzdPGIGs0cOXNUk858xlkqRLNh4Vf/ZbEgep36hon5SB1xixaIaYrWWcFJ/y+
 EU1lOhleMmaaXI+uN7YKOdUvfqgUMXkCxzLg0zA5ohfwqry2YEUheItMbmZwW8Qc7sOL
 RjZg==
X-Gm-Message-State: APjAAAWbVT4/6uSXoqPtVphEQ3jMETojuVzu9uRmgeU8UZmZ4DAYrFXY
 IRiL7s14NhPucf0o4vLQbRcHEVsU
X-Google-Smtp-Source: APXvYqxoI7Vn5CaNqenA49GBI/8bxScFVAXq7yKbTKt5lKmrbfX3vdbu9n2zVaQv1EOWCp/VYJEbTg==
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr37454wmq.57.1568644944347;
 Mon, 16 Sep 2019 07:42:24 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:52 +0200
Message-Id: <1568644929-9124-13-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::334
Subject: [Qemu-devel] [PULL 12/29] memory: inline and optimize devend_memop
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

devend_memop can rely on the fact that the result is always either
0 or MO_BSWAP, corresponding respectively to host endianness and
the opposite.  Native (target) endianness in turn can be either
the host endianness, in which case MO_BSWAP is only returned for
host-opposite endianness, or the opposite, in which case 0 is only
returned for host endianness.

With this in mind, devend_memop can be compiled as a setcond+shift
for every target.  Do this and, while at it, move it to
include/exec/memory.h since !NEED_CPU_H files do not (and should not)
need it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/memory.h | 19 ++++++++++++++++++-
 memory.c              | 18 ------------------
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 2dd8102..a30245c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2201,8 +2201,25 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
     }
 }
 
+#ifdef NEED_CPU_H
 /* enum device_endian to MemOp.  */
-MemOp devend_memop(enum device_endian end);
+static inline MemOp devend_memop(enum device_endian end)
+{
+    QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
+                      DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
+
+#if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN)
+    /* Swap if non-host endianness or native (target) endianness */
+    return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
+#else
+    const int non_host_endianness =
+        DEVICE_LITTLE_ENDIAN ^ DEVICE_BIG_ENDIAN ^ DEVICE_HOST_ENDIAN;
+
+    /* In this case, native (target) endianness needs no swap.  */
+    return (end == non_host_endianness) ? MO_BSWAP : 0;
+#endif
+}
+#endif
 
 #endif
 
diff --git a/memory.c b/memory.c
index 61a254c..b9dd6b9 100644
--- a/memory.c
+++ b/memory.c
@@ -3267,21 +3267,3 @@ static void memory_register_types(void)
 }
 
 type_init(memory_register_types)
-
-MemOp devend_memop(enum device_endian end)
-{
-    static MemOp conv[] = {
-        [DEVICE_LITTLE_ENDIAN] = MO_LE,
-        [DEVICE_BIG_ENDIAN] = MO_BE,
-        [DEVICE_NATIVE_ENDIAN] = MO_TE,
-        [DEVICE_HOST_ENDIAN] = 0,
-    };
-    switch (end) {
-    case DEVICE_LITTLE_ENDIAN:
-    case DEVICE_BIG_ENDIAN:
-    case DEVICE_NATIVE_ENDIAN:
-        return conv[end];
-    default:
-        g_assert_not_reached();
-    }
-}
-- 
1.8.3.1



