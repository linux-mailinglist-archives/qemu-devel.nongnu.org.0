Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5F346626
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:19:55 +0100 (CET)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkh8-0000bp-BR
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhS-00070m-LT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOjhP-0008QK-9R
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:16:10 -0400
Received: by mail-oi1-x232.google.com with SMTP id d12so17581144oiw.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e93t7AcpX0MjpVEUPJ+qK951VVe9n5DKhcqYQAAQ+4=;
 b=n6KcxKMbLfem1Pn7BLCmxKQVCteAHjjVJMLlqK/0smSSDp7vnDy7sbjcZMQxBDXhgr
 HVATv1xA62bLJvuPiEmpo8smcjdmv8SD9fitgsg1NJvlOZJVZw6n/Ovc18kyqyQPiML1
 PUujMvGTZsbh57aqLZdEWnOis2L7lCKKm3t/xKA1+A2Ad/X2jboH3q8Kt9D1H8OhHoZj
 KM1FFbWuMvB2qQcO24Pp5coMTl4BQ8W/aVfXBgOH8cZw1mfpQzsiuXkWUmolRqatM6Qh
 srWHA8w2Cbx9L+UwophwgFcfS7ZZ6qKkJv4mVRVqmyKj5kmfAaawvwi114EHt2kNp5cq
 nR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e93t7AcpX0MjpVEUPJ+qK951VVe9n5DKhcqYQAAQ+4=;
 b=d00r7Ooq+qf6MeEM7Ew4W1cbHTr6fi49xWfqvE2KoffhDMmtpCqEQi9LO1MZm7WX34
 bVCn12dbc+omz1zy1UzvAncei8Qx6OqzKFJMLkP/yy11AaqzajREXupnjDl/HwRs/rnH
 5Swq1GPHvKegjNsVWBwoa2vl9tWKyftHoTzvn91Waspdob3S19UMXBc/AMAEnr/VZq29
 XEMkMFKOdv8U4Y3pk/+/l6bjLJSbhpbA9qJKfzdKr/vIBGpTrbpY/WhwPWEb9DIDKGzp
 DKMPjMfcBlOy4J5MB/KRHNzslfktV9uXarH0JXo5loW/+TJzyiNVFl8mNVOaK29pX0IL
 PC6w==
X-Gm-Message-State: AOAM531kgr6RlMncu4t3gwI4XZ/rLR4Eae7Hc7Rr8lq8SclIddrA0/m0
 a9IJfaWMyD+N3hY0WcJH0LrU6BHwVY9MGTiO
X-Google-Smtp-Source: ABdhPJz8Azu1HbNxjFXxMW4zMbNXEutbEAp/LmqmiF3fiUx5Sqwz0jFHOaRwoXl3ODg6p46jpnKMBQ==
X-Received: by 2002:aca:47c4:: with SMTP id u187mr3862953oia.136.1616516165273; 
 Tue, 23 Mar 2021 09:16:05 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 8sm4317822otx.1.2021.03.23.09.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] exec: Rename exec-vary.c as page-vary.c
Date: Tue, 23 Mar 2021 10:15:59 -0600
Message-Id: <20210323161601.454996-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323161601.454996-1-richard.henderson@linaro.org>
References: <20210323161601.454996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, gshan@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

exec-vary.c is about variable page size handling,
rename it page-vary.c. Currently this file is target
specific (built once for each target), comment this.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210322112427.4045204-2-f4bug@amsat.org>
[rth: Update MAINTAINERS]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                | 3 ++-
 exec-vary.c => page-vary.c | 2 +-
 MAINTAINERS                | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename exec-vary.c => page-vary.c (98%)

diff --git a/meson.build b/meson.build
index 5c85a15364..f0dd8aa089 100644
--- a/meson.build
+++ b/meson.build
@@ -1933,7 +1933,6 @@ subdir('softmmu')
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
   'tcg/optimize.c',
@@ -1945,6 +1944,8 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
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
index a603b1b433..344f9fcf76 100644
--- a/exec-vary.c
+++ b/page-vary.c
@@ -1,5 +1,5 @@
 /*
- * Variable page size handling
+ * Variable page size handling -- target specific part.
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..ed68de3cec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -117,6 +117,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: softmmu/cpus.c
 F: cpus-common.c
+F: page-vary.c
 F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
-- 
2.25.1


