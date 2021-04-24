Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C497436A210
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:23:57 +0200 (CEST)
Received: from localhost ([::1]:46954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL4W-0000M6-S5
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKih-0005nV-VJ
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiJ-0004Jb-54
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:23 -0400
Received: by mail-io1-xd2b.google.com with SMTP id k25so8749470iob.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+XTeWxts5sk5LrurE8SZKOV4GTG2HFFTz7olzF6hdE=;
 b=VO9xd1nTMUsTeOJjyqH2BEUM3c+yuheRJc2g9JgQqtNEaeoHwUV8IBtfcOWDvsabqK
 q8HahzjJ545uL3WJhJG0DTRonSPNA2aUR2DtMJgjG1IPrQkLXdZ7/iWQLwK76Dq5bVsA
 iT9Wb00rfQ6rdgkszWoNEzL5SGlxIbRIbzDLRczFE8PsOh5GGu2iDWfFt8pkJZ2mu/E7
 Z91aiK9/mM8reY7p/fKUznSVtP4gj6fKF4hZF7hkqAhBLNiS/yt4qrs5JsVRyaIRg5W8
 GevcA3qfZj8UMdrTkqsUUO8rMNzNB7C5kfRQDy7qpkXu7EQsbJ6TKikij1y5E6H4CCpO
 1V7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+XTeWxts5sk5LrurE8SZKOV4GTG2HFFTz7olzF6hdE=;
 b=X2ZizozdzogBgrc9XO5ojG7yp3ZbPy47YFjvMt/eVluAG6RSwO491jO5npUaxkLg8M
 ATMsHiNr6hwWuFiRB9PYeW8qVxfvlLT5GvD9tI9a3gReZaFZcxK3RxojhJUtRyCtmxxQ
 0S8PFway/ITlwfo/EqKAOFH4ze4hZ9Whbnil7JCa5blQjwzuoLS5nZeuWZkXDIk/sCLG
 1Kqn/XmBVoApI67agfqpOdHaEZqhuIyFRKJgSx4gWMGWIc2RGCpc0TX14C03iFgpXFhx
 yrgUh3XtnVZTGJuSrvB9Jq88ZBviN+fMW2BAlyU3Vq7KmVRbripWnL5X/4PAeMHMtkhn
 DF5Q==
X-Gm-Message-State: AOAM5305gFfJxvjjaUh8cBHlSE47Pi/qeJGv+A0yi380m9aRapspGmke
 509NsEhj2J88ovXKL5IS4McQG5zksIuPkPcK
X-Google-Smtp-Source: ABdhPJzR8AXzTz8p1s0wsw2oCq/U7l90wFr/hSXs3zmYXlyWp0smMe1O9zBcrkou9l1v42I6zhEMxQ==
X-Received: by 2002:a02:c9c7:: with SMTP id c7mr272810jap.57.1619280054212;
 Sat, 24 Apr 2021 09:00:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 33/48] bsd-user: style tweak: Use preferred block comments
Date: Sat, 24 Apr 2021 10:00:01 -0600
Message-Id: <20210424160016.15200-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 74 ++++++++++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index de20e8329a..7f3cfa68aa 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -47,9 +47,10 @@ extern enum BSDType bsd_type;
 #define THREAD
 #endif
 
-/* This struct is used to hold certain information about the image.
- * Basically, it replicates in user space what would be certain
- * task_struct fields in the kernel
+/*
+ * This struct is used to hold certain information about the image.  Basically,
+ * it replicates in user space what would be certain task_struct fields in the
+ * kernel
  */
 struct image_info {
     abi_ulong load_addr;
@@ -78,12 +79,13 @@ struct sigqueue {
 struct emulated_sigtable {
     int pending; /* true if signal is pending */
     struct sigqueue *first;
-    struct sigqueue info; /* in order to always have memory for the
-                             first signal, we put it here */
+    /* in order to always have memory for the first signal, we put it here */
+    struct sigqueue info;
 };
 
-/* NOTE: we force a big alignment so that the stack stored after is
-   aligned too */
+/*
+ * NOTE: we force a big alignment so that the stack stored after is aligned too
+ */
 typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 
@@ -103,7 +105,6 @@ void init_task_state(TaskState *ts);
 extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
-/* ??? See if we can avoid exposing so much of the loader internals.  */
 /*
  * MAX_ARG_PAGES defines the number of pages allocated for arguments
  * and envelope for the new program. 32 should suffice, this gives
@@ -224,9 +225,11 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
-/* NOTE __get_user and __put_user use host pointers and don't check access. */
-/* These are usually used to access struct data members once the
- * struct has been locked - usually with lock_user_struct().
+/*
+ * NOTE __get_user and __put_user use host pointers and don't check access.
+ *
+ * These are usually used to access struct data members once the struct has been
+ * locked - usually with lock_user_struct().
  */
 #define __put_user(x, hptr)\
 ({\
@@ -267,17 +270,18 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         x = (typeof(*hptr))tswap64(*(uint64_t *)(hptr));\
         break;\
     default:\
-        /* avoid warning */\
         x = 0;\
         abort();\
     } \
     0;\
 })
 
-/* put_user()/get_user() take a guest address and check access */
-/* These are usually used to access an atomic data type, such as an int,
- * that has been passed by address.  These internally perform locking
- * and unlocking on the data type.
+/*
+ * put_user()/get_user() take a guest address and check access
+ *
+ * These are usually used to access an atomic data type, such as an int, that
+ * has been passed by address.  These internally perform locking and unlocking
+ * on the data type.
  */
 #define put_user(x, gaddr, target_type)                                 \
 ({                                                                      \
@@ -301,7 +305,6 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         __ret = __get_user((x), __hptr);                                \
         unlock_user(__hptr, __gaddr, 0);                                \
     } else {                                                            \
-        /* avoid warning */                                             \
         (x) = 0;                                                        \
         __ret = -TARGET_EFAULT;                                         \
     }                                                                   \
@@ -330,22 +333,28 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define get_user_u8(x, gaddr)  get_user((x), (gaddr), uint8_t)
 #define get_user_s8(x, gaddr)  get_user((x), (gaddr), int8_t)
 
-/* copy_from_user() and copy_to_user() are usually used to copy data
+/*
+ * copy_from_user() and copy_to_user() are usually used to copy data
  * buffers between the target and host.  These internally perform
  * locking/unlocking of the memory.
  */
 abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
 abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
-/* Functions for accessing guest memory.  The tget and tput functions
-   read/write single values, byteswapping as necessary.  The lock_user function
-   gets a pointer to a contiguous area of guest memory, but does not perform
-   any byteswapping.  lock_user may return either a pointer to the guest
-   memory, or a temporary buffer.  */
+/*
+ * Functions for accessing guest memory.  The tget and tput functions
+ * read/write single values, byteswapping as necessary.  The lock_user function
+ * gets a pointer to a contiguous area of guest memory, but does not perform
+ * any byteswapping.  lock_user may return either a pointer to the guest
+ * memory, or a temporary buffer.
+ */
 
-/* Lock an area of guest memory into the host.  If copy is true then the
-   host area will have the same contents as the guest.  */
-static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
+/*
+ * Lock an area of guest memory into the host.  If copy is true then the
+ * host area will have the same contents as the guest.
+ */
+static inline void *lock_user(int type, abi_ulong guest_addr, long len,
+                              int copy)
 {
     if (!access_ok(type, guest_addr, len))
         return NULL;
@@ -364,9 +373,10 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #endif
 }
 
-/* Unlock an area of guest memory.  The first LEN bytes must be
-   flushed back to guest memory. host_ptr = NULL is explicitly
-   allowed and does nothing. */
+/*
+ * Unlock an area of guest memory.  The first LEN bytes must be flushed back to
+ * guest memory. host_ptr = NULL is explicitly allowed and does nothing.
+ */
 static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
                                long len)
 {
@@ -382,8 +392,10 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
 #endif
 }
 
-/* Return the length of a string in target memory or -TARGET_EFAULT if
-   access error. */
+/*
+ * Return the length of a string in target memory or -TARGET_EFAULT if access
+ * error.
+ */
 abi_long target_strlen(abi_ulong gaddr);
 
 /* Like lock_user but for null terminated strings.  */
-- 
2.22.1


