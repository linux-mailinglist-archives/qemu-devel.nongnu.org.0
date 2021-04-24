Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2336A21A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:28:23 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL8k-0006q1-Q9
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKif-0005iY-VV
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:22 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiE-0004JE-EE
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:21 -0400
Received: by mail-il1-x135.google.com with SMTP id i22so393151ila.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnchoQA/ZqjPQSSH2ekFTKVyc7FezQYrIYZdDfoc05M=;
 b=unqESEfc4cWWszsmwVP0mp10FSs6obU0h5W1yh/jR44VydF1J+BzNSXTJ8seYqbpuu
 yI6DNo1rNNbbWS3dGk5+uup5HZXumfacyKmcxONXmXa949+YOqBMaAI2K0bQc1JgeXNU
 a1QSrf3wY7ZrTSMK6RCuWpqrJ1ozE6VMvbHc4v0ij2vYQslf+eAPMmxit8ydjb03rTM5
 3hl/uJpxdR4EGRd0uVX4r3Yo30Oqe8DA/xqa2YxoACmGcrF7VshdErqk84tBahc5kWig
 myDfRMZgeCEZLNmWYYtvk6WVQmWZ8/mY0y+4+NzVp2eoTI/YT8TdGKdVAmdEOEzsOI/9
 Jiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnchoQA/ZqjPQSSH2ekFTKVyc7FezQYrIYZdDfoc05M=;
 b=gMfLCWnfJsc0bnNOrnMKrGvHM5Ved3AhQ2Ci7gHIDV0If7vcDWegWiTIg9cK6FojR4
 oDzO6hxUOuVD4KM1Kj9pYexTkOBk/mz7/KC1zu2NPnxnu/+8RSJGKpYzmRhUDFpQJN0T
 xcd1U1OBBcKjzM+4rf22hVoW7r72qf/3s8FgFmyfqD3RD/SH1FuBCR/gcPeII19f6Ck2
 S7IbP+I48D1Hz8Z4vnMo/lRAh7HDnhzQHrPVPHJqzD9CkeHDMonSemO827oeZs6rthsk
 ow95zEqJ0NyYDgl6Pz4rBUjrKrOMJrO1Hh32am4Mo+hx4QzDD1TxIFCUBRmvXePLy9EG
 Krvw==
X-Gm-Message-State: AOAM533qOMgeSoJGtmu4xmZEo5C8SJZ4Fyftbdtf9dEBQ8CnXukBblCv
 BSqr7eY4D3Dqt92kzqZ4VnHp+6snYSdo5rH5
X-Google-Smtp-Source: ABdhPJyCwbzFoq3WHrppOkQshUK5PbOVhZsz17gGqYgBgq9wbV7mZkH8Qtyo6kfP1fRvIzTIPA2r8w==
X-Received: by 2002:a92:4a12:: with SMTP id m18mr6947462ilf.296.1619280052848; 
 Sat, 24 Apr 2021 09:00:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:52 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/48] bsd-user: style tweak: use {} for all if statements,
 format else correctly
Date: Sat, 24 Apr 2021 09:59:59 -0600
Message-Id: <20210424160016.15200-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
 bsd-user/mmap.c | 112 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 74 insertions(+), 38 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 0ff06d7349..1aec1916c0 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -48,17 +48,19 @@ bool have_mmap_lock(void)
 /* Grab lock to make sure things are in a consistent state after fork().  */
 void mmap_fork_start(void)
 {
-    if (mmap_lock_count)
+    if (mmap_lock_count) {
         abort();
+    }
     pthread_mutex_lock(&mmap_mutex);
 }
 
 void mmap_fork_end(int child)
 {
-    if (child)
+    if (child) {
         pthread_mutex_init(&mmap_mutex, NULL);
-    else
+    } else {
         pthread_mutex_unlock(&mmap_mutex);
+    }
 }
 
 /* NOTE: all the constants are the HOST ones, but addresses are target. */
@@ -75,15 +77,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
            prot & PROT_EXEC ? 'x' : '-');
 #endif
 
-    if ((start & ~TARGET_PAGE_MASK) != 0)
+    if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (end < start)
+    if (end < start) {
         return -EINVAL;
+    }
     prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-    if (len == 0)
+    if (len == 0) {
         return 0;
+    }
 
     mmap_lock();
     host_start = start & qemu_host_page_mask;
@@ -102,8 +107,9 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         }
         ret = mprotect(g2h_untagged(host_start),
                        qemu_host_page_size, prot1 & PAGE_BITS);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
         host_start += qemu_host_page_size;
     }
     if (end < host_end) {
@@ -113,16 +119,18 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
         }
         ret = mprotect(g2h_untagged(host_end - qemu_host_page_size),
                        qemu_host_page_size, prot1 & PAGE_BITS);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
         host_end -= qemu_host_page_size;
     }
 
     /* handle the pages in the middle */
     if (host_start < host_end) {
         ret = mprotect(g2h_untagged(host_start), host_end - host_start, prot);
-        if (ret != 0)
+        if (ret != 0) {
             goto error;
+        }
     }
     page_set_flags(start, start + len, prot | PAGE_VALID);
     mmap_unlock();
@@ -147,16 +155,18 @@ static int mmap_frag(abi_ulong real_start,
     /* get the protection of the target pages outside the mapping */
     prot1 = 0;
     for (addr = real_start; addr < real_end; addr++) {
-        if (addr < start || addr >= end)
+        if (addr < start || addr >= end) {
             prot1 |= page_get_flags(addr);
+        }
     }
 
     if (prot1 == 0) {
         /* no page was there, so we allocate one */
         void *p = mmap(host_start, qemu_host_page_size, prot,
                        flags | MAP_ANON, -1, 0);
-        if (p == MAP_FAILED)
+        if (p == MAP_FAILED) {
             return -1;
+        }
         prot1 = prot;
     }
     prot1 &= PAGE_BITS;
@@ -168,19 +178,22 @@ static int mmap_frag(abi_ulong real_start,
          * while it is a shared mapping
          */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
-            (prot & PROT_WRITE))
+            (prot & PROT_WRITE)) {
             return -1;
+        }
 
         /* adjust protection to be able to read */
-        if (!(prot1 & PROT_WRITE))
+        if (!(prot1 & PROT_WRITE)) {
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
+        }
 
         /* read the corresponding file data */
         pread(fd, g2h_untagged(start), end - start, offset);
 
         /* put final protection */
-        if (prot_new != (prot1 | PROT_WRITE))
+        if (prot_new != (prot1 | PROT_WRITE)) {
             mprotect(host_start, qemu_host_page_size, prot_new);
+        }
     } else {
         /* just update the protection */
         if (prot_new != prot1) {
@@ -224,23 +237,27 @@ static abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
     size = HOST_PAGE_ALIGN(size);
     start = start & qemu_host_page_mask;
     addr = start;
-    if (addr == 0)
+    if (addr == 0) {
         addr = mmap_next_start;
+    }
     addr_start = addr;
     for (;;) {
         prot = 0;
         for (addr1 = addr; addr1 < (addr + size); addr1 += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr1);
         }
-        if (prot == 0)
+        if (prot == 0) {
             break;
+        }
         addr += qemu_host_page_size;
         /* we found nothing */
-        if (addr == addr_start)
+        if (addr == addr_start) {
             return (abi_ulong)-1;
+        }
     }
-    if (start == 0)
+    if (start == 0) {
         mmap_next_start = addr + size;
+    }
     return addr;
 }
 
@@ -260,10 +277,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                prot & PROT_READ ? 'r' : '-',
                prot & PROT_WRITE ? 'w' : '-',
                prot & PROT_EXEC ? 'x' : '-');
-        if (flags & MAP_FIXED)
+        if (flags & MAP_FIXED) {
             printf("MAP_FIXED ");
-        if (flags & MAP_ANON)
+        }
+        if (flags & MAP_ANON) {
             printf("MAP_ANON ");
+        }
         switch (flags & TARGET_BSD_MAP_FLAGMASK) {
         case MAP_PRIVATE:
             printf("MAP_PRIVATE ");
@@ -285,8 +304,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     }
 
     len = TARGET_PAGE_ALIGN(len);
-    if (len == 0)
+    if (len == 0) {
         goto the_end;
+    }
     real_start = start & qemu_host_page_mask;
 
     if (!(flags & MAP_FIXED)) {
@@ -306,12 +326,14 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          */
         p = mmap(g2h_untagged(mmap_start),
                  host_len, prot, flags | MAP_FIXED, fd, host_offset);
-        if (p == MAP_FAILED)
+        if (p == MAP_FAILED) {
             goto fail;
+        }
         /* update start so that it points to the file position at 'offset' */
         host_start = (unsigned long)p;
-        if (!(flags & MAP_ANON))
+        if (!(flags & MAP_ANON)) {
             host_start += offset - host_offset;
+        }
         start = h2g(host_start);
     } else {
         int flg;
@@ -350,8 +372,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             retaddr = target_mmap(start, len, prot | PROT_WRITE,
                                   MAP_FIXED | MAP_PRIVATE | MAP_ANON,
                                   -1, 0);
-            if (retaddr == -1)
+            if (retaddr == -1) {
                 goto fail;
+            }
             pread(fd, g2h_untagged(start), len, offset);
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
@@ -369,14 +392,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                 /* one single host page */
                 ret = mmap_frag(real_start, start, end,
                                 prot, flags, fd, offset);
-                if (ret == -1)
+                if (ret == -1) {
                     goto fail;
+                }
                 goto the_end1;
             }
             ret = mmap_frag(real_start, start, real_start + qemu_host_page_size,
                             prot, flags, fd, offset);
-            if (ret == -1)
+            if (ret == -1) {
                 goto fail;
+            }
             real_start += qemu_host_page_size;
         }
         /* handle the end of the mapping */
@@ -385,8 +410,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                             real_end - qemu_host_page_size, real_end,
                             prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
-            if (ret == -1)
+            if (ret == -1) {
                 goto fail;
+            }
             real_end -= qemu_host_page_size;
         }
 
@@ -394,14 +420,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (real_start < real_end) {
             void *p;
             unsigned long offset1;
-            if (flags & MAP_ANON)
+            if (flags & MAP_ANON) {
                 offset1 = 0;
-            else
+            } else {
                 offset1 = offset + real_start - start;
+            }
             p = mmap(g2h_untagged(real_start), real_end - real_start,
                      prot, flags, fd, offset1);
-            if (p == MAP_FAILED)
+            if (p == MAP_FAILED) {
                 goto fail;
+            }
         }
     }
  the_end1:
@@ -427,11 +455,13 @@ int target_munmap(abi_ulong start, abi_ulong len)
 #ifdef DEBUG_MMAP
     printf("munmap: start=0x%lx len=0x%lx\n", start, len);
 #endif
-    if (start & ~TARGET_PAGE_MASK)
+    if (start & ~TARGET_PAGE_MASK) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
-    if (len == 0)
+    if (len == 0) {
         return -EINVAL;
+    }
     mmap_lock();
     end = start + len;
     real_start = start & qemu_host_page_mask;
@@ -449,16 +479,18 @@ int target_munmap(abi_ulong start, abi_ulong len)
             }
             end = real_end;
         }
-        if (prot != 0)
+        if (prot != 0) {
             real_start += qemu_host_page_size;
+        }
     }
     if (end < real_end) {
         prot = 0;
         for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr);
         }
-        if (prot != 0)
+        if (prot != 0) {
             real_end -= qemu_host_page_size;
+        }
     }
 
     ret = 0;
@@ -467,8 +499,9 @@ int target_munmap(abi_ulong start, abi_ulong len)
         ret = munmap(g2h_untagged(real_start), real_end - real_start);
     }
 
-    if (ret == 0)
+    if (ret == 0) {
         page_set_flags(start, start + len, 0);
+    }
     mmap_unlock();
     return ret;
 }
@@ -477,14 +510,17 @@ int target_msync(abi_ulong start, abi_ulong len, int flags)
 {
     abi_ulong end;
 
-    if (start & ~TARGET_PAGE_MASK)
+    if (start & ~TARGET_PAGE_MASK) {
         return -EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (end < start)
+    if (end < start) {
         return -EINVAL;
-    if (end == start)
+    }
+    if (end == start) {
         return 0;
+    }
 
     start &= qemu_host_page_mask;
     return msync(g2h_untagged(start), end - start, flags);
-- 
2.22.1


