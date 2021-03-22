Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C86343FA5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:27:09 +0100 (CET)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIiC-0007nD-SP
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfk-0006OP-S4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:36 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOIfj-0005BW-AI
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id k8so16259878wrc.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pphh/M4i+V5QXSFWtxyeo/WK7bpisFUp1Fv9ddkKt44=;
 b=RS9raCY4cxrkhDo22yKNtsyZDUZFBY3FWekOpPhHzjTI7lBfW3jpXTVoyRrEi9EbJy
 DAdKKoUdF1owkh+RzcSfyASAodfJ50AIqHcDByNaGmiCeNQ6wCcdb/en1SaP8gf8OnvI
 ENbH+mo0/TwqWvPYk6LZ48lvn/Dmfj8pwSR59NE1OtNFQbtXs/oVBDJEa9K/YqlkIJPb
 2HB2c83lyu47lgjqJXjZV4+9DbMWzqerehjX20PByydQUH7snNHW5y1bNI1mYg38s4aj
 8Ja/kDEssfxo0mqlfG8cM7150psYOjuO7ApwS3CKoHODON7tOnCxjrgDkpwQKw9zGM4E
 aTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pphh/M4i+V5QXSFWtxyeo/WK7bpisFUp1Fv9ddkKt44=;
 b=rJs5NeHFotQhtnv2dRliAX00haM12m4VnCUmckT4H00fZH+ICv/vUJoG/vGrVHkPA7
 1G8JmYKvYRjwtcPtNKYPzN0V//hANVXTI46SxnQ1/uZ+vXUjB6sGNKFxbxx224DXPb6F
 i3uZMjKXIqOB9AKROjG8IvNC2M4BoKlQu+2aYYt1I2jGvMFvFZdlAHP4+UtWkPoj8uaY
 9k+7t/a5/njMHW3udvW6rIaqqSFYIfHanVJZLkIOK7Sgr2g4JIehIwxru3xE1AGXLNzc
 4CH4bB3JawHpw6+d0amzB4t0iTgv5Su5xuJft3F0VaPGKEL0c6DH6UPxnydCIbEzYP7Q
 mHkw==
X-Gm-Message-State: AOAM530MJNINwArW9JxRHeDJbSkp062lGgWbckaEdkFN8gYfuJIP5BBW
 q2ptSj5L5WffqwBmAdMXfx1adIhxMBeRTQ==
X-Google-Smtp-Source: ABdhPJxYCyNE7EBjis2u6HTnHhla93JP23TrQ7BVfgM2D07lN114fLSi50ykv12ng9rWFaI/AUeYfQ==
X-Received: by 2002:adf:fe8d:: with SMTP id l13mr17271009wrr.81.1616412273872; 
 Mon, 22 Mar 2021 04:24:33 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l15sm19277270wru.38.2021.03.22.04.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 04:24:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] exec: Rename exec-vary.c as page-vary.c
Date: Mon, 22 Mar 2021 12:24:24 +0100
Message-Id: <20210322112427.4045204-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322112427.4045204-1-f4bug@amsat.org>
References: <20210322112427.4045204-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

exec-vary.c is about variable page size handling,
rename it page-vary.c. Currently this file is target
specific (built once for each target), comment this.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                | 3 ++-
 exec-vary.c => page-vary.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename exec-vary.c => page-vary.c (98%)

diff --git a/meson.build b/meson.build
index 5c85a15364d..f0dd8aa0898 100644
--- a/meson.build
+++ b/meson.build
@@ -1933,7 +1933,6 @@
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
   'tcg/optimize.c',
@@ -1945,6 +1944,8 @@
 ))
 specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
+specific_ss.add(files('page-vary.c'))
+
 subdir('backends')
 subdir('disas')
 subdir('migration')
diff --git a/exec-vary.c b/page-vary.c
similarity index 98%
rename from exec-vary.c
rename to page-vary.c
index a603b1b4336..344f9fcf76a 100644
--- a/exec-vary.c
+++ b/page-vary.c
@@ -1,5 +1,5 @@
 /*
- * Variable page size handling
+ * Variable page size handling -- target specific part.
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
-- 
2.26.2


