Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7295F6D52
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:07:48 +0200 (CEST)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVHf-0002wM-84
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogTyt-0006Fu-5M
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:44:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogTyp-0002an-RJ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:44:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id f140so2578420pfa.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L7fO1egp6CmiWhizzOTuOFeAvjN+DJZNJ5nac0rUuN4=;
 b=mqLSA0dKC83dW5y9gAINZ5lrTawA43FlLPfsI/c/l+Zmm9E8WRnu86mriOKUfKDc1y
 VdzWp6zhFZXxM3VbQ8cZTw7hkyfIy7yyzSEv9HMz+HqtXeTdDLgapt+Xb5oSXCXhtUZM
 hrck1jttTk21lAlAfRZwvRhK7v9XdXc8veXLKRJQfXSY43w2iBHMo8ym1iBKR/861WWP
 BU8PxnjJ/DVdAfql5iDQTEW3OslrHFuxeayJC61ym2TJWX/wp41yyAtzoDTGXlPvDZLi
 jFAFHajcUaOddXa8dWBd1RgqhnlzIdp5qAFhV+pysd9i/6qUG2i91N+RgRewIgJwOBzu
 Pyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7fO1egp6CmiWhizzOTuOFeAvjN+DJZNJ5nac0rUuN4=;
 b=8QiUZMds6oDTkqjgq41KzvdC4jN8BEcld6bTQp0IOLBjuP6Cl3EF9dVmAXf4aM0vud
 L+Dw+1lFDX63gmVsRyy55oubXnKMR44kcB+dTz6+3HgTcu51KDOozcpqB5rb+9ACEeBG
 vOME7VnsMQeGNk+rWcvDR/Hwha82f02u8z7CmbHui8ZJpJJJ8XxoOIqcEX+9Dx6dIrZv
 LJQk7zldZCH+t6PxHlpHfstPBhUJnNGzcBzIRNI9DFKryYafi2laWae2Y+47eECO19xI
 HHjHNn8KsqWwxD3u3upPuAeNR5LANoXhlymzuL8JZBiQx5IRAw6ptUyPE41t8OSsLv7I
 LQpA==
X-Gm-Message-State: ACrzQf0yH5iNX7jrOe+cSOzYDrLDN9IhRctsxoSJIZIF8GOmThqGi5S2
 kz01eHFhFi0p8m5nJI7ZeuVZsQ==
X-Google-Smtp-Source: AMsMyM5I6d97Q2anQ9Bn7bUp3B3QRYX45/i9l+DlUCWnhuZxHKFtTzKiILkgro6yCK3x4KicTB7CeQ==
X-Received: by 2002:a65:6e9a:0:b0:44c:2476:12e0 with SMTP id
 bm26-20020a656e9a000000b0044c247612e0mr632177pgb.159.1665074653858; 
 Thu, 06 Oct 2022 09:44:13 -0700 (PDT)
Received: from DESKTOP-8TCEJFK.localdomain
 (215.134.178.217.shared.user.transix.jp. [217.178.134.215])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a170902db0b00b0016c09a0ef87sm1480547plx.255.2022.10.06.09.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 09:44:13 -0700 (PDT)
From: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
X-Google-Original-From: Soichiro Isshiki <sisshiki@mac.com>
To: 
Cc: sisshiki1969 <sisshiki@mac.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
Date: Fri,  7 Oct 2022 01:43:43 +0900
Message-Id: <20221006164343.23693-1-sisshiki@mac.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Oct 2022 13:02:44 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: sisshiki1969 <sisshiki@mac.com>

Signed-off-by: sisshiki1969 <sisshiki@mac.com>
---
 linux-user/mmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..1ed79459ea 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -130,12 +130,12 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
-    if (!guest_range_valid_untagged(start, len)) {
-        return -TARGET_ENOMEM;
-    }
     if (len == 0) {
         return 0;
     }
+    if (!guest_range_valid_untagged(start, len)) {
+        return -TARGET_ENOMEM;
+    }
 
     mmap_lock();
     host_start = start & qemu_host_page_mask;
-- 
2.25.1


