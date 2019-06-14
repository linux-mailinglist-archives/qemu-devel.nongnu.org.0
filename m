Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55986467AA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:39:41 +0200 (CEST)
Received: from localhost ([::1]:54178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbr6y-0005IU-HG
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34063)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0J-00076W-Q7
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0H-0003zf-J4
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbq0F-0003wu-Li
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id f17so575593wme.2
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LkO/RwU961CsHjb/1835Cx9O+zFCubxVzSPwrwohBY=;
 b=W6EqP8YJ+T9LS2axiftttPSXbxy78ZYzJJ8MKjFCDwGsLUHeGuD00S/IKsLeLBVP69
 zN4lQloUzN0iJ7hr8bKOItDQelJc4aE9XL+ag8Kuki+qQzl3oqilwdnUoaVViskIolnM
 vl4UfQ4UOmLecQSm9ZPwk1Ue2lIq9IzYbzn/mQODII8EENhknYA9Lb71O3ivo0C3wA//
 Z2S0bV+o9cBvCMPgeCEdkKBwKDd5linBPIVdqOWrV19FY5+i+w7vV8hIIX/7EEFlw6dt
 FGzGHrSFR5OM1B1FpU4Ahzt67ZREHcmJZcTf2pem1yMJg+9qN9rUb3dYCMmTMvF5yUz5
 8vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LkO/RwU961CsHjb/1835Cx9O+zFCubxVzSPwrwohBY=;
 b=eSXQt8SF8Zlaqb1O9LDUPbeXAaTHDHFcCuGDHQ2lVV4CpHGvEdFK68xl3ycKCkqo7M
 0IMfQO3sGQD1zirGZrG8pNebiMrdXL5WTNN50dcw68Xn4QgKXD6S40TTl3g/W1ek2boZ
 QgXQbEoIYQem0WYHVxRSc5Y/oP4RlDZalk7VY7H2HBS/cOCmkkrHb3cJMR8uuf8Lc/fC
 L1ijOcs5TMExRr0p6sUOYJbr+w6UpnHd9gBi5GTOK/8Zx4AuPRFFl2T4WMabdbhL+h2e
 x3dj0TYF3gq5/C2DDX4B5nBGgdjQSiEz8LVQ/KsI9eq3e+EQJb0oTHO+WoPH+WSkNY/w
 pW5g==
X-Gm-Message-State: APjAAAWNrG3vxZ0YVl5fXvbXCw/6W6tuxztqtzly3zZNuPAjf+fBPl3S
 Jhaifu1t4wJQyp1TodZ71+KXmg==
X-Google-Smtp-Source: APXvYqwAjbuiS8A1DyMpf1MGsaDY4dHNCCPSRo1/xfeOfnoq/QYoURplMUi6TxMkTqAi92AsWAMPRg==
X-Received: by 2002:a7b:c057:: with SMTP id u23mr8968631wmc.29.1560533318513; 
 Fri, 14 Jun 2019 10:28:38 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id v204sm5834489wma.20.2019.06.14.10.28.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:28:36 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB19D1FF9F;
 Fri, 14 Jun 2019 18:12:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:26 +0100
Message-Id: <20190614171200.21078-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
Subject: [Qemu-devel] [PATCH v3 16/50] atomic_template: fix indentation in
 GEN_ATOMIC_HELPER
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 accel/tcg/atomic_template.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index 5aaf186253..df9c838817 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -284,7 +284,7 @@ ABI_TYPE ATOMIC_NAME(xchg)(CPUArchState *env, target_ulong addr,
 
 #define GEN_ATOMIC_HELPER(X)                                        \
 ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
-                 ABI_TYPE val EXTRA_ARGS)                           \
+                        ABI_TYPE val EXTRA_ARGS)                    \
 {                                                                   \
     ATOMIC_MMU_DECLS;                                               \
     DATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                           \
-- 
2.20.1


