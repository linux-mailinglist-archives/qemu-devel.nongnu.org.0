Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF237CF05
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:29:05 +0200 (CEST)
Received: from localhost ([::1]:51972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsfQ-0000hE-8s
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUZ-00079d-3Q
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:52 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:46636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUO-0008LF-NK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:50 -0400
Received: by mail-io1-xd2a.google.com with SMTP id o21so22007715iow.13
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRrrJ+IXY+0xCRPhFu92lFObilisjbpZec5alMTm5/0=;
 b=t8282PhNL3PHELD6ml7E5JcFq++kpraFuGho20K3QH4hVzjhu4vdN51Lpkn4HGXTnx
 +s7Y8u1AQNfOoQvDtj8wK/+EuXw85sTN9Jk8dP9VhFo/8XzKNmyR5cOXOvpAqnFsclPB
 7pmyEEoddpqu/kh/4UJxOQajqgtWnZlzghPxTLfNNeynPMA1qzXv7Yp/NXOQtal8xv5K
 Bt9J7ySpQef+JKd6XN1W25+QfEklS7DpGNHIL0ZaGJWgXDO2fSWMrU0EzVX19Nz4Bqrd
 3+rlepxcSOI88WYeXOHT2qMvOHqS2+PXnVdT7ZSzBK01Rc2YpnUdPJchUU1ClIqk5MG+
 tr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRrrJ+IXY+0xCRPhFu92lFObilisjbpZec5alMTm5/0=;
 b=krnTofsoXZ9HotX6yDpAbnq1liaUh0sA3RVcXuGPRyQGjSiwua/FJodhHUi0/OYs6t
 NMtz8iORssg6xr81cHx5/n9mJ+g5EPMSoXCrzw88eARAsfT5LgF98lqP9Vwt309ADKLD
 /P3OuuC+GPoLrC8ySacl9/KSOySMxw+rJ7h1OWIfGn4DMHoeStQj0TvGxWkDV0tP4AZe
 1twMaTYgE/Ltp90KNtcuZfmVlI7HGZ9EF48G76xflDfbRAb8im+0G9R8tY0xEwEsjC+o
 +PXxre/HS5rLNrntkLIqftggGsLQ6VcD38Nx2Xa2TsX4iGcc/QZugUtVeBtBpllC7M4w
 2B9A==
X-Gm-Message-State: AOAM5310b5i5yuWgMZQISCD5cOX9OSPEsDiXbBYKE4KtHDs/6+Cb0sv1
 UqC53Qlt3v6dohR648gid1+LMn8BaxLZCQ==
X-Google-Smtp-Source: ABdhPJy8jAopUG04ZUaQhomJlhnQ+AOZ9y80D7llRuDzyN+Z8yjVWurk18lDIrmqsQMU/6xkILqzuw==
X-Received: by 2002:a5d:9619:: with SMTP id w25mr27855723iol.2.1620839857354; 
 Wed, 12 May 2021 10:17:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] bsd-user: style tweak: use {} for all if statements,
 format else correctly
Date: Wed, 12 May 2021 11:17:10 -0600
Message-Id: <20210512171720.46744-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


