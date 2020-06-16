Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00D1FB141
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlB8m-0000T0-FN
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB64-00044F-9Y
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:48 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:32895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB5z-00007a-Bu
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:47 -0400
Received: by mail-wm1-x342.google.com with SMTP id j198so2220101wmj.0
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+YQiH3+sIht8+/pPMXJHUeuWld2thZ6YfsosCzHZ13w=;
 b=E0iaV65j3PDxpXdycp93g5RIJVNflbqEOJOryeuGUKSC+x3lZ4fECeagRx3Td4Axoe
 9PirnoupbB4MX7X2c3bKf59q8y31vbeFlsPyUysc+f/YCFE1FYtMLGRrYRtGbY+6s37A
 1xXIxKdCZMgaVf+xbqQWYhA/H0u5bnQybujJz2binnbVvhoUdZp6SKSjBkLV0BC+U9Be
 3ILW2KMeJaIJ3CKnPm16kiwdyLJWr2UWd52YrwReOffWx7kgdq6gmSZymDtoXDcNEbT3
 Wg6DanRKREnwrirN6Xdtrln2Mi5+yu1DtvCb7xHoS9EWoFqwzS6oke5Kb8Z61ZTuCeUJ
 LYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+YQiH3+sIht8+/pPMXJHUeuWld2thZ6YfsosCzHZ13w=;
 b=lJedWDVgnHjFVwcL30ZzS0e5d+HDdgEm8+LzQgG7lMB+oAQVg2eAfFoqXbZcwQ9pu0
 lSJIXnQlNRLKHkC3qeAN1xvYeh1URUsiNLfzVAGITQuSRBl64V76qiTLTFyjb52W2dpL
 14/lLQ8zmXS3bkDLrjWBsF7gYjH+xkiZc8Otgjwqn9FXRagVJsB6A5/n7UrM5GrFT532
 ZAYFeje1EPcOP1Lm7YjSFifK6n20V5ffh6aCFOgc4VHI1DSj3ACpDMpNNnkdWA5Sewln
 fSoILzc268UIMISUEcPuQrKa4mxBW3MNPUPq4ObMW6RhhWeT5SNieKPZGrkNn8VjV5cD
 YX3w==
X-Gm-Message-State: AOAM533Vf4Woizmp1WEprfnjzlosInut5GW6hvWN2RnNx+UzUiZsb9XZ
 S48sWkz6oul+ryFdhpcb2X5xJA==
X-Google-Smtp-Source: ABdhPJxz1aBtfXhHBEjztJyLCCsQ5f8J6/A+ICeV8SwjXWjymYg7uZngezqdXiojJtcAtfk+8SDZuQ==
X-Received: by 2002:a7b:c944:: with SMTP id i4mr3093352wml.22.1592312018553;
 Tue, 16 Jun 2020 05:53:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o9sm3767881wmh.37.2020.06.16.05.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:53:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 406791FF99;
 Tue, 16 Jun 2020 13:53:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/21] translate-all: call qemu_spin_destroy for PageDesc
Date: Tue, 16 Jun 2020 13:53:13 +0100
Message-Id: <20200616125324.19045-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616125324.19045-1-alex.bennee@linaro.org>
References: <20200616125324.19045-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G. Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

The radix tree is append-only, but we can fail to insert
a PageDesc if the insertion races with another thread.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-8-robert.foley@linaro.org>
Message-Id: <20200612190237.30436-11-alex.bennee@linaro.org>

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c937210e217..c3d37058a17 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -547,6 +547,15 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
 #endif
         existing = atomic_cmpxchg(lp, NULL, pd);
         if (unlikely(existing)) {
+#ifndef CONFIG_USER_ONLY
+            {
+                int i;
+
+                for (i = 0; i < V_L2_SIZE; i++) {
+                    qemu_spin_destroy(&pd[i].lock);
+                }
+            }
+#endif
             g_free(pd);
             pd = existing;
         }
-- 
2.20.1


