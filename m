Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFE3C1773
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:53:03 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XGo-0001BY-9i
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPI-0008SO-RF
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPH-0003r0-7i
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f9so2477251wrq.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rKgfiwNEXfRgtimBXh6F9470lEvKAcQP50o63eIQYv4=;
 b=U+lILNAd0t+YikfgpDbcopo2Oa/uSNBvtBIUpQpVFPBVIcZr7ot1zYEwoUot7TQ5JU
 tUSpzWBQfwIzSGXQUGhKAZFVKoPxPQRYnY4FMtlx4LwObziTY7YAKlwGsK3sIJSFubF7
 Mj97xCHEo6gk3T1Z+mpr5M/ZmerMoncq1lO6Nj3d7krYSVUerTzExe0ojiqyNabfGcg3
 MzYS3Eo/tk61xo+2kzxsrd+cg2g+KBdoJi9R7AROJ9K94Q70/b5KJd2beQMnXv8kW2dC
 5Ca4TDuiwFKUfRrupUhD2SYAIiFqgLZelKLF6n6WYQzMPH+Zxwfm5qhp8F0nXQlrtCN0
 fEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rKgfiwNEXfRgtimBXh6F9470lEvKAcQP50o63eIQYv4=;
 b=sm81Nn++HzSqW+cXACftBwCZLKJDvpLaoXshqu38Qtwydnnkk4zJuVKJkPFENRBRwu
 w3KmEBNUtkxqQyDDzTfpJnUrGp3+Y+w7w3YRNQoJo/7iybU7tYCRlSpGdOCjvrdv6lGZ
 UxHhkGchkWUBKVVJ3LYULcmoxaZwwxBeVCcE5U6vQp7KCAyn7Tcwx0SesQv8kTYp1SPO
 08SB6fe8gynb86cdL1YpRvdkGODVM0uc/XcPyMcdSt8e5rwEj20imCSg3y1jN6DhG+KY
 Va3CC202WyjXJEUGm42zWqVvwxg79IHPtx5Ai9NDdNNb8KsF0Yov5FQ4nF/YBS3Dm9+2
 dzqw==
X-Gm-Message-State: AOAM530xCnOtGIi00siKQGv1IDMN0Ae7qwb6+cPeM0PJf1XPGSPU7bs/
 4mnHHzeQ5b1HfxlsySApqEFBAnBiIGM=
X-Google-Smtp-Source: ABdhPJxKsrtYI5A56slbL3Nm8VcoqKodFiv/8oLlAFP9DYYsYZxaCYL4w57PLDFZI3jrfVqwm9SFuQ==
X-Received: by 2002:a5d:4911:: with SMTP id x17mr35406861wrq.328.1625759861559; 
 Thu, 08 Jul 2021 08:57:41 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a4sm2670290wru.55.2021.07.08.08.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:57:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] coverity-scan: Add a component for each accelerator
Date: Thu,  8 Jul 2021 17:57:34 +0200
Message-Id: <20210708155735.1805767-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708155735.1805767-1-f4bug@amsat.org>
References: <20210708155735.1805767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have components TCG and Xen. Add HVM and KVM.
Move the Xen component with the other accelerators.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coverity-scan/COMPONENTS.md | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 183f26a32c9..a6f4b9a2fb1 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -114,9 +114,18 @@ scsi
 slirp
   ~ (/qemu)?(/.*slirp.*)
 
+hvf
+  ~ (/qemu)?(.*/hvf.*)
+
+kvm
+  ~ (/qemu)?(.*/kvm.*)
+
 tcg
   ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
 
+xen
+  ~ (/qemu)?(.*/xen.*)
+
 trace
   ~ (/qemu)?(/.*trace.*\.[ch])
 
@@ -132,9 +141,6 @@ user
 util
   ~ (/qemu)?(/util/.*|/include/qemu/.*)
 
-xen
-  ~ (/qemu)?(.*/xen.*)
-
 virtiofsd
   ~ (/qemu)?(/tools/virtiofsd/.*)
 
-- 
2.31.1


