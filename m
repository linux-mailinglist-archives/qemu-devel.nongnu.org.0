Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D59836A229
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:39:27 +0200 (CEST)
Received: from localhost ([::1]:59484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLJV-0000UJ-Te
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKij-0005r4-U1
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:25 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiJ-0004Jj-59
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:25 -0400
Received: by mail-il1-x12e.google.com with SMTP id y10so2434134ilv.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUDFu/I6EM+q361qAo+D5v6XcOpZP9dVZrI/ucKywtM=;
 b=jvm/tkGwc/cuLhgtwtxm+biQMGI+oBqzriY6c8LH++sHkC5PCY8LpPCriEDAFnVklM
 IUIFbtuTnPruXumLQ7SEduCuWcRP1xCuei75ayxEg0xQS0hEgakXZdqmaSPFWdoiTm3d
 C9UvNkcNvh4M8dHjDVAKm7pXKtu0PSeZXdeMNQDRr/H5t3Ww/CH2ME0aJ9nU6Pkn+470
 k8LqioyEDgLQaUzbaGBwy64GaF1t+ipuPAgCrzLzXMHP6X9kOSUaa+enPrzOGQ/cl6ie
 0DksRL8/0z+GXNSh69tJJ6GgsZZc0xIaI4LDO25zS7+BdwrRKJUL4s6Wo/8vur2FjE7B
 7Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUDFu/I6EM+q361qAo+D5v6XcOpZP9dVZrI/ucKywtM=;
 b=hw2xFELgNJoLnGjJGGTsYfppFBHlNJeuNAZc3NOWnmzn4xvN5aQ+aCvn5bW9rXOAIM
 7bHzLEiEdzeBlr3QUXV9z82edg0gUPOvtZAGBKwPzrhNLuYUgklWTyalQuQONMvJMEqg
 Fffq1osNVDuum4GMBKdPQwtBssbInxnzBg14+VDKM7GkLtYuygpcPNhM9tQH3ZSmib1M
 J2MTJ65s7i7jF4xxnn1oHN0KHUg3w0OO7aYETI+nnZP93KpaNerAgQXaxQl5IduYleBZ
 VuJptCRZHBVFmdY+svfKE2el09WmwPjrG2FaoHVI6WQ52vVMQEtD1O8XV0BYGmvzcNBY
 +3Dg==
X-Gm-Message-State: AOAM530rHdDqi05f35FtZAbpSJtnI9f9btyToy2w5vlBhxbu3JP61PPA
 R0+61vlx28vooc9I9v6cvN9H9rJbxEg0348z
X-Google-Smtp-Source: ABdhPJzwUZjkpKyN9Zq3rI0NkgVZfjpQuNpJ8eMeYRLBat4IbpV3HgzogNZbwfWLGXgGxltYQJpYlQ==
X-Received: by 2002:a92:c56a:: with SMTP id b10mr7355848ilj.6.1619280055187;
 Sat, 24 Apr 2021 09:00:55 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:54 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/48] bsd-user: style tweak: don't assign in if statements
Date: Sat, 24 Apr 2021 10:00:02 -0600
Message-Id: <20210424160016.15200-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
 bsd-user/qemu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 7f3cfa68aa..2494d9209d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -288,7 +288,8 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     abi_ulong __gaddr = (gaddr);                                        \
     target_type *__hptr;                                                \
     abi_long __ret;                                                     \
-    if ((__hptr = lock_user(VERIFY_WRITE, __gaddr, sizeof(target_type), 0))) { \
+    __hptr = lock_user(VERIFY_WRITE, __gaddr, sizeof(target_type), 0);  \
+    if (__hptr) {                                                       \
         __ret = __put_user((x), __hptr);                                \
         unlock_user(__hptr, __gaddr, sizeof(target_type));              \
     } else                                                              \
@@ -301,7 +302,8 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
     abi_ulong __gaddr = (gaddr);                                        \
     target_type *__hptr;                                                \
     abi_long __ret;                                                     \
-    if ((__hptr = lock_user(VERIFY_READ, __gaddr, sizeof(target_type), 1))) { \
+    __hptr = lock_user(VERIFY_READ, __gaddr, sizeof(target_type), 1);   \
+    if (__hptr) {                                                       \
         __ret = __get_user((x), __hptr);                                \
         unlock_user(__hptr, __gaddr, 0);                                \
     } else {                                                            \
-- 
2.22.1


