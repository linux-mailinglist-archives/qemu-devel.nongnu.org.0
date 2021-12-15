Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F934475BC4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:23:37 +0100 (CET)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxW80-0004uT-8Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:23:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxW5b-0002k5-NQ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:21:09 -0500
Received: from [2a00:1450:4864:20::332] (port=45917
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxW5Y-0005m8-Do
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:21:07 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so16206398wme.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 07:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48EcTsNISz23sIKndseg1G4ktnCtbAC8q1Fa0dZOUEQ=;
 b=n/mM0/BRUaskNRbtpOD13Cy3NLZEhsvC3wFUihY1z4GeMynPBtjcyzPKahDGFaf0S8
 Jl9o7o86840+Rt6AtasZmPWJ/P3x9rfeEhRxUtMZ0Ej5VDTrFwnr2N0hTDRkXtl8l3AQ
 BimxatBqSoo4N+CzVrRPIVgrK8N+IGlJSYjJ7K9TQ+W8UciI+OIVuFIPaEIA3aMdGDZX
 tupJvGqElEwifHCGfOtuFYYVrTUev+/mi7lfbdGirprHwUMn6HlZUYdMfxEDUSPcEYbB
 pyPrnMkP1LzQG7p4fJIRmCgE3Q4FCguvczcX78tIJEnS1kWaCXTX2fdclajEovj4PsY8
 EzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=48EcTsNISz23sIKndseg1G4ktnCtbAC8q1Fa0dZOUEQ=;
 b=1LPN8/9d0yGH1g2aD3HHQi6+ZqiM5ZQkmPtNHVFt/IxXOxenNfNLws9usvhQxEFo6m
 oE9L9XHnFvFMxmq766ZoDzy3VI96P8whSQnnDqg3fvXEPF+y/BMpaLQYCGpiu4CSKwRo
 6KTKCRotWTN2l2YSv6ZqD7seCu/pQpvQo77LCfiVUAh4BjuAsXhaJ1oWWJn3yAzLUkm1
 LxK0iALT74ujwcjc3BrgJNALLpf1+qgg08SkGfFjcbkEXiLOTxVJBkW69vdX66kwWKW7
 NiLkEXxdVsTrwZwQaUQXPyPcxuvbZ2hagW4Kk5GT4n9njsIw2Qyt85KbaUbapW1JSSo4
 rkQw==
X-Gm-Message-State: AOAM5315Bs2Ut3NiCp2I/fFj5ZA5mH95IuOgSfM8YZKIG9dKW1bJVHZa
 PhXoJVHW52mup2YYQHFsB3gT0g==
X-Google-Smtp-Source: ABdhPJyQFsj8gP0KciKrLXU5C510azrpBU4SYoZAa2kgBTvZBzPhgFBI8vi4hgCSWQ4dnBPK6JQYYA==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr290961wms.28.1639581662035; 
 Wed, 15 Dec 2021 07:21:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j32sm2011495wms.40.2021.12.15.07.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 07:21:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C86441FF96;
 Wed, 15 Dec 2021 15:20:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: update C standard to C11
Date: Wed, 15 Dec 2021 15:20:55 +0000
Message-Id: <20211215152055.1748462-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 8a9d3d5640 (configure: Use -std=gnu11) we have allowed C11 code
so lets reflect that in the style guide.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index d7315f45f4..a80abcd0c7 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -486,11 +486,11 @@ of arguments.
 C standard, implementation defined and undefined behaviors
 ==========================================================
 
-C code in QEMU should be written to the C99 language specification. A copy
-of the final version of the C99 standard with corrigenda TC1, TC2, and TC3
-included, formatted as a draft, can be downloaded from:
+C code in QEMU should be written to the C11 language specification. A
+copy of the final version of the C11 standard formatted as a draft,
+can be downloaded from:
 
-    `<http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf>`_
+    `<http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf>`_
 
 The C language specification defines regions of undefined behavior and
 implementation defined behavior (to give compiler authors enough leeway to
-- 
2.30.2


