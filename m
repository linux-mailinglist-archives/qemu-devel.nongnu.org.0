Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DC530E9D8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:14 +0100 (CET)
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7TzF-0007tG-OX
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tid-00055o-OZ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:04 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tib-0003rU-Fc
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:03 -0500
Received: by mail-pf1-x436.google.com with SMTP id w14so1083911pfi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5oMkWTFAvkbENXCd9UcZlqUmvtysI4E37yjhcZ4CH7A=;
 b=xle5V4a4kqCv2nbTnmDL1F5pLKB1kQsToVwsq+57vmouygcUOMz0DRYxoFk66YLJMS
 2I/OyMbguKM637Ll58JPW5VNV14Ked7Ei4Xu0PTH5jvByAMLTCu/7TmnL8LCR847qPL0
 yXy2P9F7Fb5cy/vRaj5/jv+vfD8HJQwtqXd4HvYQkNHHLHhCOTllppVRwPRtXr6ecysa
 g5g3ZsDMJUkNGYYulquvsOsl/6fdXwTYXLJSvRS2QcNp5AC2xjOg1JnN+LzH+RDBa1l8
 unmxyCA2k/tTBeC2x3xGUvfgm3pm8lQKo5vcyBlDDMuhacfWF0PmKVDmbywz5ZvFEGCL
 Q4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5oMkWTFAvkbENXCd9UcZlqUmvtysI4E37yjhcZ4CH7A=;
 b=dHa6J6aZTntZ5y3FLXeIIoVS3tPuKg1GJ2kDTT1z33OQBtnJskHM0yzt6IoePipntT
 SEhbsaKssAHT9pfG8wCQhY+UBPYHmWXiPk2NdNSwgcTWpTa58jD9FVbH5uQ6GXNBIKcu
 ffFKqFH2ZLgZ8dh6dIoY7IAfPm6zqAGQ5Bf5BgSZDliSXlmFEyFQnoDmPQT4mwyIQ4ol
 +qXt6icTDi1HddqyJE4c/0vQQnRNrlIkl95JRXCsx1CzLkoHNQu0kKuTfjYZiEulgyQn
 7Y0JpTX23i9TtFVxDWhSY072A+qcdQv//7o4LaGKzZR1RNECE0yOK8m5H8NCL6DrJiAY
 szmQ==
X-Gm-Message-State: AOAM532GgPNz9+PCNpBVoFaI4yjQ/Ciy5VEdWXtAUbu5UbR3jgaCw6S2
 i/VuzzmfPparTbx4B2WWnttrCyypgqrHcJrz
X-Google-Smtp-Source: ABdhPJz+1EL3F98lhINj4w6c+bTlaxu6pEFAG3MRq6P/8dbk+kQsdX9jF9kscRrG+99QRWovvsZ31Q==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr6618739pgl.9.1612403159413;
 Wed, 03 Feb 2021 17:45:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/93] tcg/tci: Remove TODO as unused
Date: Wed,  3 Feb 2021 15:44:01 -1000
Message-Id: <20210204014509.882821-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5c84a1c979..e0d815e4b2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -33,14 +33,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/compiler.h"
 
-/* Marker for missing code. */
-#define TODO() \
-    do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
-        tcg_abort(); \
-    } while (0)
-
 #if MAX_OPC_PARAM_IARGS != 6
 # error Fix needed, number of supported input arguments changed!
 #endif
-- 
2.25.1


