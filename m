Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F722BE35
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 08:47:31 +0200 (CEST)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyrUQ-0005tP-Lb
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 02:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSL-00047Y-P6
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:21 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSJ-0000J8-Rg
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:21 -0400
Received: by mail-wm1-x341.google.com with SMTP id 3so308113wmi.1
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 23:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMSyvIe/j8rNWqKFP/JxZviEowS878eAm/0kjT0+++A=;
 b=i/+Q5o/qdgd8WEr22OJEAY8eg4zvUw6QjnE3hskmd2tOpi3+Ba07Go661YfzXQXRuI
 vR6rV8EN0uBUpxdk6mTuJd+BAKJP4rcFQqZsVUfi8lahlozQMp1hWwzQWTlPgJczJgXy
 YnAyvJm924WN9gp9rC7V0kOtiI7+rUzUjz/olEuNiGvSIRWdHtNU/qTskXjMgwtTIqLp
 5KuaBbTRnZ9pnoxTol9l7MEv4GjaMm07CZ8RhpQwujIgKn79XyKzvXu/JEyF4+WcrRFG
 3Wmf+6Zose+f7MDPmQHrZar0WnCayJOfRmftaynTAuBFPIMLF/s30VMV8JUsNjfIFQEA
 Z3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMSyvIe/j8rNWqKFP/JxZviEowS878eAm/0kjT0+++A=;
 b=AVA3Qs45L+CgXIwy8YOdpeKkeQrUwfYN3taJi3Kv9CkvF7BRXzTpEgY+REtIBQssKx
 cQkbtbYIFU29iKKHCxRF3VqttYiTMoA2NF5D/WTDn5NIG0N03X+9LgGc0wGoj75XyEQv
 TUghLqhLBzGomFWiUFxzBrJyJAE/IPT1wxaJa8vzHPj+1agy/4FYrGHhHL8O4bK8rWuh
 CSU6iwXPj9adBK5h9chM9ofdEvbmrkW65c8VAbX/J4Sac3r/vDY1p5hxIhJsdaFpuPQs
 KCwRI6XpKQCwfrvHhvQCg/0rOi5jIRgjzCfnGpLjMhNBXmWZ7xPzPjW8dbobLUe4VMLy
 w9nw==
X-Gm-Message-State: AOAM531CNC1YuZ56DGI1Va5Uxp6V9QWH2vmiwgORyHOQLRT/I1ByDnwj
 mHzW2bqkB6hU3FgX0btMHZiRwA==
X-Google-Smtp-Source: ABdhPJyDsKUGZKLEsbCexQoOMjQT0OP/Ms9G+eE1Ejy3k919Ru1XhBq1O8lTR3704VEfppCv7nUTZQ==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr7569806wmd.111.1595573118412; 
 Thu, 23 Jul 2020 23:45:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m16sm133774wrr.71.2020.07.23.23.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 23:45:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A41181FF91;
 Fri, 24 Jul 2020 07:45:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/16] util/oslib-win32: add qemu_get_host_physmem
 implementation
Date: Fri, 24 Jul 2020 07:44:58 +0100
Message-Id: <20200724064509.331-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724064509.331-1-alex.bennee@linaro.org>
References: <20200724064509.331-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 Stefan Weil <sw@weilnetz.de>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compile tested only.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefan Weil <sw@weilnetz.de>

---
v2
  - used more widely available GlobalMemoryStatusEx
  - dropped Phillipe's r-b due to the change
---
 util/oslib-win32.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 31030463cc9..a74ee5a3aa7 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -831,6 +831,11 @@ char *qemu_get_host_name(Error **errp)
 
 size_t qemu_get_host_physmem(void)
 {
-    /* currently unimplemented */
+    MEMORYSTATUSEX statex;
+    statex.dwLength = sizeof(statex);
+
+    if (!GlobalMemoryStatusEx(&statex)) {
+        return statex.ullTotalPhys;
+    }
     return 0;
 }
-- 
2.20.1


