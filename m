Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9B139912C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:11:23 +0200 (CEST)
Received: from localhost ([::1]:50388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUOo-0007W3-Uj
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULu-0002fJ-D2; Wed, 02 Jun 2021 13:08:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULs-0007ZG-Ks; Wed, 02 Jun 2021 13:08:22 -0400
Received: by mail-ed1-x52a.google.com with SMTP id s6so3771950edu.10;
 Wed, 02 Jun 2021 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cm4Jw/Vvc3v9keGbrmk1rBryw+fvbHP1B4rEfLOcB88=;
 b=qUMlqc/1OUWPP+UqpdHfCd3WAwIc4e3gJ+PuQOTwxUlBBGzeXZpShaqmqaRCP4jm6X
 aukU2sPg/FtJhYG+Lc0RNjFxsi0QT0SgmdSykOePTu7oGuBEbgaTrQqhet8Zn8Ph5r7U
 E7Uh81o+2exbyL6H9H0cZOWGtYJ4z3Q7RdC/iXv3c7MVU1AgmM5BMSDE9z6eNJKxQR9h
 VPGmQVLi8I8IScO3O7QMdedyOsHvM3yIJ+zZ8ty5Jr07wqdfQxRavl7Ha2BTRevj46Hy
 Oxp0cPRsl7QCST+YXhzgSdy2SYHIjelz2jU89Qg1oZwgKL7KeBjpg0flOPm0pQuk3hYZ
 3a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cm4Jw/Vvc3v9keGbrmk1rBryw+fvbHP1B4rEfLOcB88=;
 b=Q1fhBCFKjopnva0KuDiVx6fSDESGAq2Potq62Vc4f6TVfnGNioQRsr8k+kJ2Fgknfe
 05888qt0l1qExpOc95VDF1X+DZuxLFfWl/3R+2yXJXEvz6firlIRYKZ9hAe64DVYbjk0
 yHbfJ8vk2/ut9DR5M/UibnXZMkN3+Sm1iJLwaMdNKIsh36CF0r4Sf0cmcjNqrtcQ9t0B
 hNqi2Gj40137xnbd6VIcZZB3pOaHhx+ZvZ/kdEe8hjWak6UzkV7vz/YAA58TfdXIFS/+
 x1LOTLaISH1eJpCVI1TQ2SBjLVA8e2LSSo5d3ylulRXmG2OYBDykMTVTg2QLIF8zcRdM
 iVdA==
X-Gm-Message-State: AOAM530lEelg9jvIxOk5KZ2iCqeQXvJBSG8534HqkocDjlEKa9xvPehf
 yBkjQTWI2Q0Bt+qLk0vtpm6XbRvh83N8vw==
X-Google-Smtp-Source: ABdhPJzAVF3noKcXnVm+P+atHRyJkE+oWSv5MxC6/XBS6rQqoEMcaK/S/dMelt/vla/LIPbiFfxGJw==
X-Received: by 2002:a05:6402:1a25:: with SMTP id
 be5mr30540007edb.369.1622653698695; 
 Wed, 02 Jun 2021 10:08:18 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q9sm270719edw.51.2021.06.02.10.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:08:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] scripts/oss-fuzz: Fix typo in documentation
Date: Wed,  2 Jun 2021 19:07:59 +0200
Message-Id: <20210602170759.2500248-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602170759.2500248-1-f4bug@amsat.org>
References: <20210602170759.2500248-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we only use stdin, the chardev is named 'stdio'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
index 890e1def856..b154a25508f 100755
--- a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
+++ b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
@@ -14,7 +14,7 @@
         /path/to/crash 2> qtest_log_output
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py qtest_log_output > qtest_trace
 ./i386-softmmu/qemu-fuzz-i386 -machine q35,accel=qtest \
-        -qtest stdin < qtest_trace
+        -qtest stdio < qtest_trace
 
 ### Details ###
 
-- 
2.26.3


