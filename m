Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC08236A217
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:26:12 +0200 (CEST)
Received: from localhost ([::1]:55464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL6h-0003nw-RB
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKii-0005oZ-N6
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiJ-0004Jv-59
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:24 -0400
Received: by mail-io1-xd2b.google.com with SMTP id v123so703326ioe.10
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfabuplVH/Xndi+YByBhcEdJT1l70+GW7yUfnMNV+4M=;
 b=VzVNpNW017B/niUM/CUwTtPrxO8uQQEKfN/s52TdY3LAmOGBOTwipLr/8Y0w5HR94d
 nenhCKlYAEduP3jDFfMOroP6myzk2YYQzFBnMUPKS/XBkEKyVWYF28cqOYGMA0dkCifP
 FXZbuVYApyDoXDuaFx0zPmLcVNTJJezIQW91NPawJ3ZWmyNnmkHw2eNjUybrw9KMjxiZ
 Mz4yfZySZDw0tcLbS+VaN0f20xmlHPVZn48FvTCd8Lq2bx7bRSMb4wHMLRJUFSYuMfLh
 f9SILJVtn+GOEm6jQcB2euEPocws73vAN/1mekrQwf6pMMogOPYWnoi0OFjGH0VViqEU
 3Khw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfabuplVH/Xndi+YByBhcEdJT1l70+GW7yUfnMNV+4M=;
 b=qulPjOoREOvh+EhLlbgsV0H+1T2cijKV506aaYeE98S2peIyZ4HlqSsY/M+d5OUEzf
 YhxchQpyY+IHUyHKJhrPHehPfFJyAp32dTi06OhHEUtGiK3LJJokkRWPTGmUMr2mbmR4
 dUSTg3G4BQoLWUEmtTZ+7+YmZf803ATp3trsP1Oxg9w1TwYwSJZm2mA5Xnh7Xnmtz51V
 AfQB9NMRskrD7w1hGzdvkzF5WY4eF5Ld8ZAtDiG89z56A7fK3SiX49p8ie6Zmm/uHg/G
 aVCtD1icu6Ks/9SO1k+V5z86G/r5VGYAJg8/q2sg8kChuCLweMm3RZU1ol2sJrMDkkPw
 7AiA==
X-Gm-Message-State: AOAM5326bHO0bECf0GJXPgHZFiHH/hy0aeI+NHwb+rCjNF/bYmaMWN6O
 FthqlNCAbCrLH0r2m7WjsP3Dqgwo49SQpYn+
X-Google-Smtp-Source: ABdhPJxXZ62m1UvYAQaWD8Kam+wSGsanYFT4yNMSEjBJs2mnPdI0dgZ0pr8xSRaNGnc+6WYG6vn6Ow==
X-Received: by 2002:a5d:9694:: with SMTP id m20mr7473490ion.40.1619280056997; 
 Sat, 24 Apr 2021 09:00:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:56 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/48] bsd-user: style tweak: Use preferred block comments
Date: Sat, 24 Apr 2021 10:00:04 -0600
Message-Id: <20210424160016.15200-37-imp@bsdimp.com>
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
 bsd-user/uaccess.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 89163257f4..7eb4546fed 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -4,9 +4,10 @@
 
 #include "qemu.h"
 
-/* copy_from_user() and copy_to_user() are usually used to copy data
- * buffers between the target and host.  These internally perform
- * locking/unlocking of the memory.
+/*
+ * copy_from_user() and copy_to_user() are usually used to copy data buffers
+ * between the target and host.  These internally perform locking/unlocking of
+ * the memory.
  */
 abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len)
 {
@@ -37,8 +38,10 @@ abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len)
     return ret;
 }
 
-/* Return the length of a string in target memory or -TARGET_EFAULT if
-   access error  */
+/*
+ * Return the length of a string in target memory or -TARGET_EFAULT if access
+ * error
+ */
 abi_long target_strlen(abi_ulong guest_addr1)
 {
     uint8_t *ptr;
-- 
2.22.1


