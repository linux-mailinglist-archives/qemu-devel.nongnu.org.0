Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2857C872
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:20:47 +0200 (CEST)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrLL-000832-00
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40461)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsr8o-0002Bf-Ba
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsr8l-0000ox-M9
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:50 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40523)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsr8h-0000eP-Go
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:07:44 -0400
Received: by mail-wr1-x444.google.com with SMTP id r1so70282238wrl.7
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HmgqT/HIUKoP+z/2ztUMKoEQehWucsoXeXun56Y0Jjg=;
 b=RWDekH6OsbRhvKymT2V+CCx2+QFkfT7pWbng6zOPaUuLSMgnxJmPQL87R62kCBlgFl
 6xDK+Y1CKqSM6kDAvf2QEEKDnj7JeKIt6SAz2R28JDwvZKH7pBYQ4WVZmv29zQ9YAhZU
 v6J47t69pwwsnBmcX25D9gadyX9MWS0eitL17Yhn/kQeiYh+N28spa5uu4tXigylDj1a
 6jz4C1BwVaVIMor0yfhjallTVm49TJ/j/S9h7Oz24+NWz0grSsj+8zzbKQSrA+P5ElNm
 vrquHJt5/SAnuPw8LGflUx3iqxTn8ahr5WVdFXZEqtKFWghndRaKtQlmvFPSabxPvd+H
 Se+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HmgqT/HIUKoP+z/2ztUMKoEQehWucsoXeXun56Y0Jjg=;
 b=V/oO6Rd7ikpolj2+vctsMcNr+HuiOSON12pLpodA6Wk11+lVMc1jrWSCbyEE5eDCrD
 O3hxxyZSH/LA90azVMLXJaLEbGd1dNscAa82rAQX1+pPRgeRLC8wkxc2v4QPg3BQb9yZ
 llRGb9vZoMK2zzJGHDmMoDN3O/xualuf9ZO1ssAKkDb/zn5obH2ijCbdgYvTJGH47Ae8
 IWbRieU6JR/Z5ZosGWaMglEk4GPJKHUmXJmdLlThckPm0VM9b6Ui++4IoB+aMriZwynx
 N62NXSLkOmtqYDeRAZserMteo7uN47mWY+Nlil1d16qASr09nNaMptmUDFD9NYA4XkL4
 CPDw==
X-Gm-Message-State: APjAAAW8XGBu6q9NeqEMa9K8nf8KxQsSdU5CA6YJsXeGpuDqJJvry9NZ
 e+Zh+9/0F/w0Dq+BV7Bd75c5CQ==
X-Google-Smtp-Source: APXvYqxfKqFU4nwid9PrN3JBh+lOUsIlUqdPtDHryYYO5FoPebexv2Oj58NwcYsdT6HiptrExJIerw==
X-Received: by 2002:adf:f246:: with SMTP id b6mr14115306wrp.92.1564589245847; 
 Wed, 31 Jul 2019 09:07:25 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id x18sm60674566wmi.12.2019.07.31.09.07.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:07:23 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 311FF1FF98;
 Wed, 31 Jul 2019 17:07:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:06:33 +0100
Message-Id: <20190731160719.11396-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v4 08/54] tcg/README: fix typo
 s/afterwise/afterwards/
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 aaron@os.amperecomputing.com, cota@braap.org, bobby.prani@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Afterwise is "wise after the fact", as in "hindsight".
Here we meant "afterwards" (as in "subsequently"). Fix it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/README b/tcg/README
index 21fcdf737ff..ef9be5ba90e 100644
--- a/tcg/README
+++ b/tcg/README
@@ -101,7 +101,7 @@ This can be overridden using the following function modifiers:
   canonical locations before calling the helper.
 - TCG_CALL_NO_WRITE_GLOBALS means that the helper does not modify any globals.
   They will only be saved to their canonical location before calling helpers,
-  but they won't be reloaded afterwise.
+  but they won't be reloaded afterwards.
 - TCG_CALL_NO_SIDE_EFFECTS means that the call to the function is removed if
   the return value is not used.
 
-- 
2.20.1


