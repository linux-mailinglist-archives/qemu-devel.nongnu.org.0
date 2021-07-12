Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42A3C65DB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:01:27 +0200 (CEST)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33zS-0000Xr-0Y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33ty-0000i1-Ff
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:46 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tw-0006uL-8j
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:46 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z2so7086358plg.8
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/XbZAZAFUZutJ4SOP5C+rLYYfepTHI4gi5UAVTl5lRY=;
 b=raCqmEuSHTRoBEv3+JgQg9ZfYYg5oj4Fd8guID8cmYXV25P9/Im+VLjX6J4UfULWoY
 3tCiqNy5h6fGV0rGVddRsUbt2XFzMqhtmOHVH64YCvL4x9lsXCPqD0/MvRmLIHfs7tIL
 zEecQjZBml8jx+5B2EeDoxQXrjXgNHHsT9KAwcy0SS/Uh22lRr5bx5pVJeC94amK/bnm
 CIg8rWYH+tGu08qyrHIWmADP8z8wBP7u7pAW+OS7EJLCZP3AiUvJ4SqyJYdBDc73/qRs
 38Bd14mvr956X8Lypts5MLR6mqh1J0stHvWZiztbSQIcC8e2riC52Si4Sw44XMslTdGD
 tAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/XbZAZAFUZutJ4SOP5C+rLYYfepTHI4gi5UAVTl5lRY=;
 b=XN3fEaefra2tdPIrXPAUeD+Y8NIfxcIsyp22+kJqoXWz1/lLWszuUwW+vVhraFMvs4
 MrFvv7j1fbkVUk9Lt4Jugm9Ayv41boUR+8TnCEzjcKtJ9DDO3MUE5GfpfEzhSvsSAtLw
 RwQ/gEYTqUggcZvajztTQ9KORpVrOFM/F4dtIB898AO5PORncvYK2Xbzuvyr+gtkgZKx
 ZYdbsL5tHPoA0V2dcc0RhiSdVnrJMsazC3F0hcgHI9VlIV9PVulEmsczUrrTtB2Ec4Tk
 67nzVbp+KvSVzxijYTL7II9HI8Xk+aEviV/eHbQ3pIeI0F/NW8pbVCoT9Nd/EpFNWbz1
 UmKA==
X-Gm-Message-State: AOAM532u3veS7zcfcU0KVAtAvbWCOQFG8RJDu+FvuSQZo6LmZZ8mTGvT
 /tOWlceQEnTOge3hjOFkRL6mFuhw5sORrg==
X-Google-Smtp-Source: ABdhPJzZSudLo3nbcfrapkBCa/yWGuU5nC4fbswLzT+gzQL1cNk2gRjk7mpqu6yyqjMMIUdYiF32XA==
X-Received: by 2002:a17:90a:5889:: with SMTP id
 j9mr979309pji.234.1626126942828; 
 Mon, 12 Jul 2021 14:55:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] tests/unit: Remove unused variable from test_io
Date: Mon, 12 Jul 2021 14:55:33 -0700
Message-Id: <20210712215535.1471256-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
tests/unit/test-iov.c:161:26: error: variable 't' set but not used \
    [-Werror,-Wunused-but-set-variable]

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/unit/test-iov.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/unit/test-iov.c b/tests/unit/test-iov.c
index 9c415e2f1f..5371066fb6 100644
--- a/tests/unit/test-iov.c
+++ b/tests/unit/test-iov.c
@@ -158,7 +158,7 @@ static void test_io(void)
 
     int sv[2];
     int r;
-    unsigned i, j, k, s, t;
+    unsigned i, j, k, s;
     fd_set fds;
     unsigned niov;
     struct iovec *iov, *siov;
@@ -182,7 +182,6 @@ static void test_io(void)
 
     FD_ZERO(&fds);
 
-    t = 0;
     if (fork() == 0) {
        /* writer */
 
@@ -201,7 +200,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r >= 0) {
                        k += r;
-                       t += r;
                        usleep(g_test_rand_int_range(0, 30));
                    } else if (errno == EAGAIN) {
                        select(sv[1]+1, NULL, &fds, NULL, NULL);
@@ -238,7 +236,6 @@ static void test_io(void)
                    g_assert(memcmp(iov, siov, sizeof(*iov)*niov) == 0);
                    if (r > 0) {
                        k += r;
-                       t += r;
                    } else if (!r) {
                        if (s) {
                            break;
-- 
2.25.1


