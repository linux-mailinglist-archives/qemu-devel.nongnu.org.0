Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8E11C4A5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 05:11:14 +0100 (CET)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifFon-0004rL-5C
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 23:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFez-0000vw-KG
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFew-0004DB-Vg
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:05 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:46507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifFew-00046A-9S
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:02 -0500
Received: by mail-pj1-x1044.google.com with SMTP id z21so429790pjq.13
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r5qvsiX5IA+LOMSB6fEkOOIthLDhI8Op7OL9OEMu7no=;
 b=ytK+wWROUGVs+Qv86KTs5TbB7kJY3WTm7emXiy/vlvsSaxx6zeJRhCrRLvnmzJrpFc
 D/hG3+hdr4GnuHLDgTHbjt0RrQhYmgXJLj9BMIBxSMrX/wuE3eVVpIkwYhtwLlsCDbAW
 fFvM+6/bD9wKgDkOT0dMlmPLShgw08Th8rnUKywFD1rXUTNQ9pQRUABvwHs+DjFneqL0
 aquuU1X+mBBpjoBdqayERow2YFk92J8goM1FBhFGbdiYm4Gt2WEKHwi4L5K1C8RrPyaX
 ry+stkL79HGZ7/mP3R7mPR4VS7S8T6wOOUiDEGXlxpOeHKZjT+MedZuKqCwN1oczN8wM
 OOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5qvsiX5IA+LOMSB6fEkOOIthLDhI8Op7OL9OEMu7no=;
 b=Q/7HRsff+Vp8l93RQecpk/BaVRG3eSqfiC93UOioqqUVf86GG5uV4v5rBFlQmQ9/86
 QedZ4U8PYKXg+72luTELTLw9dqHdk+cYpSqWRaVauMB7ky8q8UyNVDrhAHbTzueaR7Am
 SPQFhZhAaLcM5mK8STPI52jdijfD8VIbhSZTf/zZuuYmSeAF1+fQNZany7cosJuW22A2
 CFtEqyHzL+NMzZUrl+jgwg8679h+6DVG1/kh0BRCkNj37q8CI6UD7suAA9uQofxT/f6f
 2Fe9QJm4e7MONPkh2S0HDB+gnenPaK/jyfT+QL9sYvwPq6BW4R2YgiTv2AtDeKc0Ae67
 0UXA==
X-Gm-Message-State: APjAAAUGdkIrfmiUYUVnCRfE4bx3HUq9oilB2xb/XVm4pz8cDjSzcieG
 IR6VmiQNkuQ28r/2cVBL2UM3eVziLoo=
X-Google-Smtp-Source: APXvYqzrFP/EB6HKoI0bH6DR+PWum7MrOEZD5PM1xcm+mwmZg1TGCb8Z5WkztnqGl7Qr/6EIVCEjPg==
X-Received: by 2002:a17:902:8216:: with SMTP id
 x22mr7261485pln.334.1576123257273; 
 Wed, 11 Dec 2019 20:00:57 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z130sm4666391pgz.6.2019.12.11.20.00.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 20:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/28] linux-user: Include trace-root.h in syscall-trace.h
Date: Wed, 11 Dec 2019 20:00:24 -0800
Message-Id: <20191212040039.26546-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212040039.26546-1-richard.henderson@linaro.org>
References: <20191212040039.26546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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

Code movement in an upcoming patch will show that this file
was implicitly depending on trace-root.h being included beforehand.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/user/syscall-trace.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/user/syscall-trace.h b/include/user/syscall-trace.h
index 9e60473643..79fd3e5aa9 100644
--- a/include/user/syscall-trace.h
+++ b/include/user/syscall-trace.h
@@ -10,6 +10,8 @@
 #ifndef _SYSCALL_TRACE_H_
 #define _SYSCALL_TRACE_H_
 
+#include "trace-root.h"
+
 /*
  * These helpers just provide a common place for the various
  * subsystems that want to track syscalls to put their hooks in. We
-- 
2.20.1


