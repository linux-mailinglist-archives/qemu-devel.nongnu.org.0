Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E13513A4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:31:38 +0200 (CEST)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRubx-0008Oz-Fl
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWi-0002lK-4u
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWG-0001kv-TR
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id v4so1253122wrp.13
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CpLm1kUZyBISIhBEEKQZmPYby9LYdqEZ3YfXq/Sye7M=;
 b=NLSJZvY0eA1rdSOHCMlUH12q0H0dMuxBaHzuXSwMofXvY1s5B7eYkRa0kjK8pAb/o8
 CjuXA2JweYrhHAvbwv6Ecd/UNmL5uewRs//jx8ZRBM3T57zxaZy/gfSVG+7TvE0SFe85
 l5h6YnEqZIq0E63nm+7Y3TnzXpwMKfPdFx87LKT4l9sH5y0/CD/udiK24w4p2IBjWh5T
 kW+N/zrzYYrVsAh79ryt9k0qYymxlWOHVaBwJrM7en/3PBW83PLuWAuBg1jajbVCjTk1
 zpeGVdtpaIUXzIwvtwATgACKybwZW33MHpuLNw+2NzibFpiilM4dma9zXnqhEMtLXD5w
 zU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpLm1kUZyBISIhBEEKQZmPYby9LYdqEZ3YfXq/Sye7M=;
 b=sAQ8A9p4QBtXQPIU2lDdYPDSl8TqS5CPj1/OU7Yz7MfM87A3F+Z2WyGjEP4RwBdhfq
 DSZfeDQluVmfJcZxjW0f4eouR/a2VssomiyEamrf/dbKCyZ/DvaAi50eQckFzMpjpFYW
 7JlzgKxNjGdK4Ox0LU76nPR3/qNvOJN2xbaoaeNL/YGVSn+/4FOnt/iTPiL01T/tQIgr
 6671EjrWKdaIJWrvr9ox65KWVD6P+BFnVQEmU6TwhUN+Xb+JbdPu9keh6v0JIiVqFYec
 +S+mv/5pyEezE+PahmQ/bwjDPecj0aidq+S1xU9f+fkeHSOEotps3Ce7sEvgHmAdtTJb
 RHVg==
X-Gm-Message-State: AOAM530Jl1oLSX9ZC4OxK+5DL+wPE/gTLertYHPpyzcLENgO9P4NgPnF
 BmlbhkezFjHAV2frabaua6jP9Q==
X-Google-Smtp-Source: ABdhPJyVFAb5eG9uIE9pnGWI6sooywaXGauqIss0z3bZYW6fxRovWgZXpjfvcCatlXvw4O85U+36Jw==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr8728625wrx.52.1617272740069;
 Thu, 01 Apr 2021 03:25:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm26373325wmi.2.2021.04.01.03.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12A7E1FF93;
 Thu,  1 Apr 2021 11:25:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/11] tests/tcg: relax the next step precision of the gdb
 sha1 test
Date: Thu,  1 Apr 2021 11:25:26 +0100
Message-Id: <20210401102530.12030-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the version of gdb we may not execute the first line of
SHA1Init when executing the first "next" command - instead just
stepping over the preamble. As we don't actually care about the
position of the PC after the steps and want to be sure the
context->state[] has been loaded before we inspect it do a double next
at the start.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/gdbstub/sha1.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/gdbstub/sha1.py b/tests/tcg/multiarch/gdbstub/sha1.py
index 2bfde49633..423b720e6d 100644
--- a/tests/tcg/multiarch/gdbstub/sha1.py
+++ b/tests/tcg/multiarch/gdbstub/sha1.py
@@ -40,7 +40,10 @@ def run_test():
 
     check_break("SHA1Init")
 
-    # check step and inspect values
+    # Check step and inspect values. We do a double next after the
+    # breakpoint as depending on the version of gdb we may step the
+    # preamble and not the first actual line of source.
+    gdb.execute("next")
     gdb.execute("next")
     val_ctx = gdb.parse_and_eval("context->state[0]")
     exp_ctx = 0x67452301
-- 
2.20.1


