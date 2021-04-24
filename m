Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273BC36A21B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:28:58 +0200 (CEST)
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL9N-0007GB-7J
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKii-0005or-Sg
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiK-0004Jo-1o
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: by mail-io1-xd2f.google.com with SMTP id q25so8310690iog.5
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKCD+PPDyOUrgWplU9tqkEeeW0rorHGKoJtS0fxSytw=;
 b=z8R4+40wcpkSGGjwOUgDZ6ROM/ps9DGhBVQC8hqcsSKDi/PwCdO3VCNlWi/HjagQ4X
 ia6JPf6ljaj17/d/KVJnvXeVxYBQoaXC+moYIOwkXVMdHyUX0IQ9odlOHOn3SGXdI0el
 Leeva2lHMNheA0yAah0bbCFbu6E4cV1i7BFBh9QdYQ9+/4wo8wrH61RVtJDEB+zaLfyL
 o1626qHpoe9A9xprTiakWc5yLqcaDvSnCLvMdZW0p8RQWGf5Qtj8G1/8K4IUPGUsiPKE
 0RkbwBov4egx3b6qxNmI38hQzPYQc+FZy8KjKSMTmGqFOd74spTdnfYg2qBB2CY79nwp
 aruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKCD+PPDyOUrgWplU9tqkEeeW0rorHGKoJtS0fxSytw=;
 b=ud67x1tH4akRGMahRpWnQ01c2KlN7mrJS++lRckFstoDixs0S7vQKzqOtlPqPD8zIb
 HKQqbaQgI0AFaCDKPcNw/PYJVd7BQw3PxcCx8kPgkWOxTImXXuxUXtxT5s29s99usK6a
 Vvo9fl0pSh4Y3NMnNzy1kU28A0XX0xI4foQDty4YdDFQU2Ge2m8JhuOVJf9WyKmODPK8
 BigBBZeOIZhctPYrq+OR9yg3QtH8kJkfiVHAE6n1j7j0oQaM0netVyXOHZ9sKPRhuQPg
 bKqQrhoUHxLpH3WY2MTFCJNlN3+PZU04l4tD/qOK4HKckGh3zBTBJG3w5jf0Zz9w3V8P
 9bQw==
X-Gm-Message-State: AOAM533JXN1CYe/zg/78yNULLPI/y1krxh1MQgM9HNhk+AI5bMgZrw17
 XT5EAjVwKmKFkpMQ0JopXsgMX6Egc1rpf2J9
X-Google-Smtp-Source: ABdhPJzgzP34TcOniz+zQXToMXVdlRJXHU+wgd7J8pyQ4OkppYKKchp5XF3XyxuOZkurJxAGKiSX1Q==
X-Received: by 2002:a02:308e:: with SMTP id q136mr8394550jaq.47.1619280056141; 
 Sat, 24 Apr 2021 09:00:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:55 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/48] bsd-user: style tweak: use {} for all if statements,
 format else correctly
Date: Sat, 24 Apr 2021 10:00:03 -0600
Message-Id: <20210424160016.15200-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
 bsd-user/qemu.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 2494d9209d..8d3767964d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -358,16 +358,18 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 static inline void *lock_user(int type, abi_ulong guest_addr, long len,
                               int copy)
 {
-    if (!access_ok(type, guest_addr, len))
+    if (!access_ok(type, guest_addr, len)) {
         return NULL;
+    }
 #ifdef DEBUG_REMAP
     {
         void *addr;
         addr = g_malloc(len);
-        if (copy)
+        if (copy) {
             memcpy(addr, g2h_untagged(guest_addr), len);
-        else
+        } else {
             memset(addr, 0, len);
+        }
         return addr;
     }
 #else
@@ -384,12 +386,15 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
 {
 
 #ifdef DEBUG_REMAP
-    if (!host_ptr)
+    if (!host_ptr) {
         return;
-    if (host_ptr == g2h_untagged(guest_addr))
+    }
+    if (host_ptr == g2h_untagged(guest_addr)) {
         return;
-    if (len > 0)
+    }
+    if (len > 0) {
         memcpy(g2h_untagged(guest_addr), host_ptr, len);
+    }
     g_free(host_ptr);
 #endif
 }
@@ -405,8 +410,9 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 {
     abi_long len;
     len = target_strlen(guest_addr);
-    if (len < 0)
+    if (len < 0) {
         return NULL;
+    }
     return lock_user(VERIFY_READ, guest_addr, (long)(len + 1), 1);
 }
 
-- 
2.22.1


