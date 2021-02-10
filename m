Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA13172FF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:14:15 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xkU-0007jC-7x
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:14:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhU-0005xu-IM
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhR-0003Eo-HC
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so1432691wmq.0
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PU9rNaQh7vkDttDYTlGc5gKeO+PSzP4WvxcncEhBalo=;
 b=hdILOJggMXoxOdu1cEeZQFhgPBdDg5z3LpQBYe0/UGKYdjIwj7l+7AMZzFmTSypXD0
 saaczdSIf8dApg6nIMvQCqjU3k6rEGhNHOw9hg0t2yKZmejVnJKtF+Zi02ObqDNOeJeO
 2b5vBlo1QuxrMyQenEKqEY1hesaZAP95cnelm36tfW6+QUeUZ5dlEYKEazuAd+jkbrmz
 luwL6n/xXpz7ghRwYi2kcb8UpTYKfl1FNo0+rjDXixbAs8nqgu1nJ6NRR1sfjrNfEoHW
 TiaLOWdcFAkI8ymuMSMhCvq6otVAN1YvUAmvSWaPosH95AEMURvJKALDLig0/NqRzyNO
 P0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PU9rNaQh7vkDttDYTlGc5gKeO+PSzP4WvxcncEhBalo=;
 b=KfT1gOhzhtpN/okFboGzmjE3qUQsFcZ4X79/M23GS1DNDh43/izw0ib2M/pfgUWPgv
 W67Xibww2X0YhDoMvyLEE1APOPyZyluZdRLAWF6FfaU2DCK3uZDY9x7klOR7/cZ6pe57
 mSamGNNoSd4uvJREm7jb6TAZOa4Xyh6iYqJDxxWVCZ08siIxsDTa7O9JuG80zOd0l9I8
 cAWEQ9++l1RFWO5WIdPbpA/U4a5kR2RcjF8P45kYvN920kFnC8hlgVXOnTDCQZ4GvQdo
 Shfl/t+1PWv8oPh/wIkvqS/3AFGCNzTwCkOkTZuLl40Wv+s0H5Wu0uJelKVLrjJlG/90
 d0tw==
X-Gm-Message-State: AOAM531JlT5uboQVJR09kGEZF3GJR/1jtoEVx+7mtSFKTqoFsDeLo9Rc
 xju7TJh5FilQefAH2wdTbhrUcw==
X-Google-Smtp-Source: ABdhPJy7HpG3QC2QkXGNRAZV+x+eZ3QlXMUTGqr30xOx7HOKdpmB5q3CeCioX0XR/6eYu7u0XsPsYw==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr1164558wmb.43.1612995064189;
 Wed, 10 Feb 2021 14:11:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm4443605wmi.43.2021.02.10.14.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B2751FF96;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/21] contrib: Open brace '{' following struct go on the
 same line
Date: Wed, 10 Feb 2021 22:10:40 +0000
Message-Id: <20210210221053.18050-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I found some style problems whil check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-6-zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 9d6fa33297..600f7facc1 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -145,8 +145,7 @@ typedef struct {
     int table_sz;
 } ClassSelector;
 
-static ClassSelector class_tables[] =
-{
+static ClassSelector class_tables[] = {
     { "aarch64", aarch64_insn_classes, ARRAY_SIZE(aarch64_insn_classes) },
     { "sparc",   sparc32_insn_classes, ARRAY_SIZE(sparc32_insn_classes) },
     { "sparc64", sparc64_insn_classes, ARRAY_SIZE(sparc64_insn_classes) },
-- 
2.20.1


