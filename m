Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0F31B6C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:54:10 +0100 (CET)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaa1-0003cW-KF
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYK-0001vI-Ka
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:25 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYI-0008AT-W6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:24 -0500
Received: by mail-wr1-x429.google.com with SMTP id r21so8082411wrr.9
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D3Fr91XJCXcm4d4eYGJnhtw/QeqRtMf5zDy1ilXxRkY=;
 b=dHCBT2mjwKPFBnfX8eoiF7pHHTczI4YKg0EWKV5R0RsiJ+959I27blhR6xCxtCQo5R
 J27bWg6XYOWkSl+JEr9Qwz7bJUbp7koQJCA9VryaiizzofbaX+Lm0BC82bPnSMzYQmTA
 byJV2toyeIlEHCfcNurzM3z656aijodH/X24G77dhTgYj7ABxG0xhxoHGOwRJ2126r56
 ws87gZlWIZbnQ5sarbCwKii4mF0VmIzISmFe7yJujvjmxiJfwLhur/B5i3JGxsxBQ1C2
 671uE+Aesj7zrNC9JOrJ1TAxJG6AaH+LLR/jPQR9rvIB7a/3cVN7Lwi9WFiuKKx/N0/g
 Q8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D3Fr91XJCXcm4d4eYGJnhtw/QeqRtMf5zDy1ilXxRkY=;
 b=IsLQes64P5bApqJDQEiEW7WPZmvRu7pMXgg+r88Q8RKoFafeWBu+26dcau/XWOzl5R
 fGRxtdjRL4MDSGa3W9V0uf/x/K4wh1iG4UrtuELlnJvy1QhnoMhpj7zNUGaw+1i9Wz5C
 0nEyiBe3SDoul7S1Q3YSwsjtcGJ0An1FPEiKur0bWpahkX0E5oMZgvaMVpM23cydzt0f
 IxxPeTEka8b09y4CVf4pZOZZnKXkhazRhK2G1+4vXZygomZtcLIrLcPcU818riuCMy/k
 MJCWAa+zQsYjAyaPx61BNpWdmiT14qdyLWbGL25T3XclRCbtoxQ6YWoqdKRq4FjJhzYM
 sbnA==
X-Gm-Message-State: AOAM532Dc+PGFREfWyqbi4xG9qifXa4X7CVSsgWd0lfEt0uEWyBVJw3n
 C34MALsNZqQH21WmONP/Qmf1JA==
X-Google-Smtp-Source: ABdhPJzm1MATOuYvXbHYl/5nnI1j0xeqhUuc4AHRmeRgLxOAylJcKbAtsVU8wbOupuLDh2DOiy8zUQ==
X-Received: by 2002:a05:6000:1806:: with SMTP id
 m6mr17613800wrh.320.1613382741603; 
 Mon, 15 Feb 2021 01:52:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g18sm4279425wrw.40.2021.02.15.01.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:52:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F4851FF9C;
 Mon, 15 Feb 2021 09:42:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/15] gdbstub: Remove unused gdb_get_float32() and
 gdb_get_float64()
Date: Mon, 15 Feb 2021 09:42:42 +0000
Message-Id: <20210215094244.12716-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The functions gdb_get_float32() and gdb_get_float64() are now unused;
remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210208113428.7181-5-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-14-alex.bennee@linaro.org>

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index ff0b7bc45e..a024a0350d 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -135,26 +135,6 @@ static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
     return 16;
 }
 
-static inline int gdb_get_float32(GByteArray *array, float32 val)
-{
-    uint8_t buf[sizeof(CPU_FloatU)];
-
-    stfl_p(buf, val);
-    g_byte_array_append(array, buf, sizeof(buf));
-
-    return sizeof(buf);
-}
-
-static inline int gdb_get_float64(GByteArray *array, float64 val)
-{
-    uint8_t buf[sizeof(CPU_DoubleU)];
-
-    stfq_p(buf, val);
-    g_byte_array_append(array, buf, sizeof(buf));
-
-    return sizeof(buf);
-}
-
 static inline int gdb_get_zeroes(GByteArray *array, size_t len)
 {
     guint oldlen = array->len;
-- 
2.20.1


