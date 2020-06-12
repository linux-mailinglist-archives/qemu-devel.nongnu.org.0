Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176781F7D5F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 21:09:48 +0200 (CEST)
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjp3j-0003Y2-4d
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 15:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjoxG-0000si-Sw
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:03:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43717)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjox9-0006t5-B7
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:03:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l10so10790472wrr.10
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjFzq8wR0LQu6X1N3b1WhVVhSNxDn3nhVeh4fkyxF4o=;
 b=NIOR2d1722Dj+ElXQGkvy6LpfgtK0baZ1X/2ZD9ALPp/VNEsIYr65VZnZses/Q8NwB
 jl0DN5ooJKADSgoAPXRDP2ZOPIRE1XWe9JGz06Ty1V5vJvnCIUSy1SFsX63+D/it4mId
 RvraKaN0SMAfee2zSkbYn0OxEinK2fAi+RZpxe8zETKIyolFVC91cm3EKwg6soKwU9W+
 6TTX/yLkxvKXUbNFSVy7MHOvfGf50rj/nJKLMNx0mBDOvezZLcdm5apoUMi/Rafa4tXg
 P39w59GLZ+CP3kFNi5pO04V0s+g+/rTkMlmOAtU4CpR2NHf2ofMjKnw4guL8H6pBQlfH
 PMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjFzq8wR0LQu6X1N3b1WhVVhSNxDn3nhVeh4fkyxF4o=;
 b=WJ+AqOSc3zh92aNm3K2Jt75tKplez3jKkZxWOoBYCc8IbPCpFBlWkFGpHRJNqwFJT4
 6unN5igARnFyxpzoP+HhyP/XC7z6QeEHHwLANQUudwcwDC/byAw5NqvogDVjNdrce7tt
 +Bf9TbOAltChcutRMFT00Gi/2Xr3q3rm5H43O1hSvj2XWd2vZFd4QGCmxTiaRs7Zplqu
 HSpunnhrW77kxbgH8AXeikHMpOoF0FdB5RPiIw+/3NszOXN2wXT+/Vbun6LQWwG9itq5
 b43OYtb3b03e664b8kZpIQtnNZM/zW6KezZHsPvQJd0C60dRI2ZfVwVJ3mGIIyaelU57
 lmNA==
X-Gm-Message-State: AOAM533WPeXTTBEzCWpQoEgWdg5YY3Zj1hnY51srNNBqnbo+dcxtcu6F
 z7WVjAeHW3kaltvfxvPj5cegzg==
X-Google-Smtp-Source: ABdhPJzEYe4MUPFXwnN50QhE8muFYgpVmrKDfnBjD9K9kDL9EN866QIch3grPpI+Vu/73jSiwF9fyw==
X-Received: by 2002:a1c:6a01:: with SMTP id f1mr364189wmc.52.1591988569992;
 Fri, 12 Jun 2020 12:02:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f11sm10755595wrm.13.2020.06.12.12.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03D9F1FF92;
 Fri, 12 Jun 2020 20:02:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/18] thread: add qemu_spin_destroy
Date: Fri, 12 Jun 2020 20:02:25 +0100
Message-Id: <20200612190237.30436-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612190237.30436-1-alex.bennee@linaro.org>
References: <20200612190237.30436-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com, Robert Foley <robert.foley@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

It will be used for TSAN annotations.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-4-robert.foley@linaro.org>
---
 include/qemu/thread.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index d22848138ea..e50a0738897 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -215,6 +215,9 @@ static inline void qemu_spin_init(QemuSpin *spin)
     __sync_lock_release(&spin->value);
 }
 
+static inline void qemu_spin_destroy(QemuSpin *spin)
+{ }
+
 static inline void qemu_spin_lock(QemuSpin *spin)
 {
     while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
-- 
2.20.1


