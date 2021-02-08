Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B89314337
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:52:41 +0100 (CET)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FOa-00028N-BA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCF-0002rt-TM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCE-00062M-1I
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o24so42100wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vM/hCi4QzyBItSwDReV3rwOFjjrUHsJHgYVNtzBAOv8=;
 b=gvV6FC8roxEVoAL6VqZF7mZpTGJlLXYnJt30vepqx0454Met4G3vrLtkb30gIGKd9s
 VQ2mdW9qrqw68ggTb2qT9KAXemyC9ld5+Zhhji90WaP0s7CvXGk5HnNmhbzRo7+mdQgJ
 3m9E59NGcHIpNNHcePUr/M++jxghZueFiRkfpFMt54b69JZ4lx4wMUmrXwATowoxRQzs
 7gqYfMQTjazUY4EIlh2MQ3XR8bCiOi0l9Bu4FU5VaRVnHgAaaANVsIbkKBx4wAGeL8tv
 WEeYZ2ER0wnTBab34xYidAhFqGz8MS/YM1B/nbSHsS7hgThiryQBSmaQDjeehnbrfUn3
 NuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vM/hCi4QzyBItSwDReV3rwOFjjrUHsJHgYVNtzBAOv8=;
 b=qimQd255TU+Erc2oTETlYP14TlwQiU+n8NZ7jE7RXnMDeWU7iTVfmgh/Op8/4/GYP5
 9sY6MZ2Ic4xUvo629B10D7bORtS9tDEVnD3ygke3AJOI9ugKM3X6OHRMmqnnkk62nuUp
 irGYTaU/+7pRX9LYUT+UBJoRhNFXZmSGCe5W3jM5+mjxVHrCcbBohCe/aqORF7lxh5ri
 df3m7QiMO82pEDa3vcBQvPGKDqysV/0UNzYg/8Whcsel9zmdqyn/B9EXNhtD/FmJAFoF
 MuFIM2Moje8TK2S9n7Vs5uO13dDYbRyJJqFlKIlKHqcJSLVj6byR16a/6yNMC0Harv28
 kxww==
X-Gm-Message-State: AOAM530yUJBV+xbl0trQ3t8cKTTezNEpSX1cMm6i+uH9gK5KeJx0X7PF
 8tp8s4/jawRsqB8OF3fuAZsEQebpXpKq7A==
X-Google-Smtp-Source: ABdhPJyVjP72Oa0WxkghnEtUWqH0qoattN9sTXkNuZWbt6UyQWtqWoHUAyehwwDneNkYvrvGOjX69A==
X-Received: by 2002:a1c:2d0b:: with SMTP id t11mr41032wmt.109.1612808616605;
 Mon, 08 Feb 2021 10:23:36 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/46] docs/fuzz: fix pre-meson path
Date: Mon,  8 Feb 2021 19:22:48 +0100
Message-Id: <20210208182331.58897-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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



