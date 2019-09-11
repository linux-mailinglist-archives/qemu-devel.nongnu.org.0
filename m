Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF89AF92D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:40:56 +0200 (CEST)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7z7P-0007nE-TL
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7z6W-0007DD-Ho
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:40:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7z6V-0002Fg-F4
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:40:00 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33580)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7z6V-0002DH-7u
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 05:39:59 -0400
Received: by mail-wm1-x342.google.com with SMTP id r17so1768294wme.0
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8d2MvAAXsyWEC9Rv0xA5bQQYYz6ijsyBtgTcHChhLI=;
 b=KcKpCX6AcaOQdOucKd8XCuP8eCnM5tcWD6r7lWvr0qqNiDUc3OTIxes/Rf4rmEhvBV
 FZChUI2BWxrIm1/7ruhLu2fGavEV+qeqR+l+UosVQ+P1rkoxxWqYpyTVwVOKZPQYS/Eg
 izeINX0wHnwo26ECvUMeaxpmT7LMGufosgtjO18XIgoR8lmFBSCDJn7qekvBxxuVLljZ
 P2uqcIeMATyuEp88IGFxdWKXmwELNWzTYwuYpOR7fnNYPf0EAWpXOQDHCIklCZEzaz+u
 nKvll+8hUVlzMuScrIwdFeTBFjblCgyFTkW6jyOo5s1kKD411o/UbEJjvYVc/4C19XF8
 xriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8d2MvAAXsyWEC9Rv0xA5bQQYYz6ijsyBtgTcHChhLI=;
 b=GH11ULxCoIvr4hAjmfnSVJ9TCZaobYVszJC6aV4KScDNLR7acxDpOP4VMM0alk2Vyi
 PTYRnZbiGz8XuBqr7PiTI3ruwiNx8bCe/7puR3cm/EcQaKkQDcqImEkDlQGSerk3APvR
 kQC85pevbLLeNk1jo20pR/26etBhOFqbx4V91a180uDl+lfBYLYDbpnJG6qIzparP41I
 zQOvMoOxfcGLi9LiiB2EWyEJB5xXeOTC8tnYwKJ2wJQ3aJ5SbN/F+7Yrzcj7J+0nj/v6
 ju0xa+ENFmItEWNJETxscwj+Gav8HlQWSe3It8p239PANAsA/JP7fc8AYDceRMWjnwLB
 6dmQ==
X-Gm-Message-State: APjAAAX3TIPJjvZJ2542GSE1ORukjw8OzbG4Yl/c13+bLyHfoonft7XJ
 fEsT5cGCpoJy9ZzHqMcnDRV22w==
X-Google-Smtp-Source: APXvYqwDrqROyfKZtP6LKyIILGv6T5TsFMHj9B1QiIfI7TvcYIto0SqvxGE/IKGbQ5uQ06BEKtds8A==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr3218988wml.177.1568194797787; 
 Wed, 11 Sep 2019 02:39:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h7sm2377246wmb.34.2019.09.11.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 02:39:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E8B81FF87;
 Wed, 11 Sep 2019 10:39:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 10:39:51 +0100
Message-Id: <20190911093951.6244-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH] target/ppc: fix signal delivery for ppc64abi32
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
Cc: Riku Voipio <riku.voipio@iki.fi>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were incorrectly setting NIP resulting in a segfault. This fixes
linux-test for this ABI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/ppc/signal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 619a56950df..5b82af6cb62 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -501,7 +501,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     int i, err = 0;
 #if defined(TARGET_PPC64)
     struct target_sigcontext *sc = 0;
+#if !defined(TARGET_ABI32)
     struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
+#endif
 #endif
 
     rt_sf_addr = get_sigframe(ka, env, sizeof(*rt_sf));
@@ -557,7 +559,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->gpr[5] = (target_ulong) h2g(&rt_sf->uc);
     env->gpr[6] = (target_ulong) h2g(rt_sf);
 
-#if defined(TARGET_PPC64)
+#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
     if (get_ppc64_abi(image) < 2) {
         /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
         struct target_func_ptr *handler =
-- 
2.20.1


