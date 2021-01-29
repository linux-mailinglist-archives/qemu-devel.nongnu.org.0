Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F666308855
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:36:04 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S4J-00010s-Mm
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnB-0004Bn-NI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rn9-0005tN-VF
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id f1so10084539edr.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vM/hCi4QzyBItSwDReV3rwOFjjrUHsJHgYVNtzBAOv8=;
 b=J4oisH4OEsj6iiXIMd16W/TcCSkSMTSXd+Y4VeVh0bFLibZkxB2WZ2v3qQf4gskDtq
 ghuXQ+DvqrNl30eJbhGPLHblLc8kRifE4KPNTkzqBDJU5w6W5a2kTGvJKBGBfwn44/gj
 e46tEfpXpqXtKddZLGa2q76tQceKW5f8WPjxSLgu66SiqXVgDR/VL8nTNn+nYccudQEF
 wcGU+GLMCZJNc2h2WQwfoqSfZc4cpJ7SQbH6T9FrgrVD0PMKcEMFCvSZWWNzWbWYR2HN
 DH5YS5Fj8NIoigvuMwdbVJQ6WwP0scou7FaopYRDZZ0ianJjiUIXP9hd5wNk8OKLAvit
 /zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vM/hCi4QzyBItSwDReV3rwOFjjrUHsJHgYVNtzBAOv8=;
 b=adVITrX8YEFQuFzTtOK02WH2kdgAzXCUj6xFHAv2eZG5MWqShyTgqyyZYgBByb/wvt
 vahQBJAioE+azk6GqCcxCzvx0kYaWzPWDbXXHOYwqnhcOtBKYd7c4FAU5J1v6R/0U6pv
 x1n+RWWPYTuKBmiUxjXhM/WwhiYnrIQUe9qL2WhSFChdH5dYI9IXUd4Y28oCdP+FAIua
 ydt66hA+w2+oksawPwaPvgODb5Z4Zm+64tKGO72sN26+Yr/ESni6w41UU2ChMH827Gul
 5TvI0PbSnr6StvSIWaS85dgKXVTeCBkGjlDdkGpc/HVgv/cZf8tuxttniXasuhpFjVch
 Kp4A==
X-Gm-Message-State: AOAM530cnjnldTU5jUap1sTBYSJxGbkEqAY6lp9Po8iBeNPZV/Jxfv6l
 P4qKHUeatR+Q7fg0fCIUeOqJHM1uIMzBag==
X-Google-Smtp-Source: ABdhPJycf5n9ZDweHokDLaCKA/0JQnx7NBJGNpIegNIwtkI5MyCyyMdq0OjtGfsOGtqpI71bQfvw4A==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr4643684edr.238.1611919098633; 
 Fri, 29 Jan 2021 03:18:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/36] docs/fuzz: fix pre-meson path
Date: Fri, 29 Jan 2021 12:17:41 +0100
Message-Id: <20210129111814.566629-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117201014.271610-2-alxndr@bu.edu>
---
 docs/devel/fuzzing.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/docs/devel/fuzzing.rst b/docs/devel/fuzzing.rst
index 6096242d99..5f5200c843 100644
--- a/docs/devel/fuzzing.rst
+++ b/docs/devel/fuzzing.rst
@@ -119,7 +119,7 @@ Adding a new fuzzer
 
 Coverage over virtual devices can be improved by adding additional fuzzers.
 Fuzzers are kept in ``tests/qtest/fuzz/`` and should be added to
-``tests/qtest/fuzz/Makefile.include``
+``tests/qtest/fuzz/meson.build``
 
 Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 
@@ -128,8 +128,7 @@ Fuzzers can rely on both qtest and libqos to communicate with virtual devices.
 2. Write the fuzzing code using the libqtest/libqos API. See existing fuzzers
    for reference.
 
-3. Register the fuzzer in ``tests/fuzz/Makefile.include`` by appending the
-   corresponding object to fuzz-obj-y
+3. Add the fuzzer to ``tests/qtest/fuzz/meson.build``.
 
 Fuzzers can be more-or-less thought of as special qtest programs which can
 modify the qtest commands and/or qtest command arguments based on inputs
-- 
2.29.2



