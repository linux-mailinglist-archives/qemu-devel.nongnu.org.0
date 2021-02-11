Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC9318A9B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:32:39 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB9C-0000ME-Rp
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4v-0003Dy-U4
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:13 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4u-0003w4-7C
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:13 -0500
Received: by mail-wm1-x331.google.com with SMTP id l17so3833235wmq.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CMnqpr20flSURyNM92Gx7GeWK7ajly5dp8lWEdqL/SE=;
 b=obrv2+UmiQIXifPJIqfJbs/t90qNwZT3oY82gbqP2BODTpDIRSCVT1gQ1KW+7T5Tx/
 JChorMCWHBMyZK8WRKJbzBX3owcgE9h8Lk/0OKiVW19QGn9lyUuRNLpsvubmWwY0iP2a
 DZdHApRRLUycGMomiXLEnf9SXUtPC0iJChr68EK8wXUREc9SSQ67N8Hbt7Te0ou46Ggo
 N52biQdUE35B876C4UdzVAebmqum2GuiKEtcIaAG8l4wlfc+WhJB9gGoG3RS1z1x+Bbb
 qB/7Cs3VgEE3KxDcR2Q4Wq83W0no2NV4Mp3pi4ntYWL6vUa6e7nJjDIyBfooJP58Rhpj
 khgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CMnqpr20flSURyNM92Gx7GeWK7ajly5dp8lWEdqL/SE=;
 b=r2H0OT0KKs1pMzX8Ko7meKhu6cBy6pqJe/1nOQBX+tom8BCSmO7mTn0oQzTnbTlH12
 6rzrWUxV55Td7KLMCvniCtKQ3Ekmcvi7vXjLodU+cboMm84PGBtsizn6tcQ+LntgIgLn
 sYa4QlGP8aNvCQRgXkyIEqSecbQHi9qniQDuJWBZHlvT7S1E5IjQLexpGFjPO2rycVN0
 RFV8WXWTrN6qBlQKOx9olfLKwNJbChNcYFZRCsBTFXyxEbgVBMXKcS0Tq+yxLkBfpLRf
 PTiurtu61CGUeGsmsjE8qfwdnacV29brJtzk3gRV+/XzzeTEJ9ISoWW+hUkAtooTUOHS
 1pSw==
X-Gm-Message-State: AOAM5312rrHuUwbnVTw0p7fiRtVCQrQ67wRaW+kC34VBZhljMgldWbX7
 ge7hIzPEZk8AdfJ83oKqXWbIow==
X-Google-Smtp-Source: ABdhPJyJX67NvbjJ1ydvm0o1KRZu6eTfR0ygWzl0P0PGTZ9IND/LZ5sIwhmmMysl3x+PDlJdeRF2xg==
X-Received: by 2002:a7b:c199:: with SMTP id y25mr4890128wmi.72.1613046490906; 
 Thu, 11 Feb 2021 04:28:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w12sm9274364wmi.4.2021.02.11.04.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:28:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49D521FF9C;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/15] gdbstub: Remove unused gdb_get_float32() and
 gdb_get_float64()
Date: Thu, 11 Feb 2021 12:27:48 +0000
Message-Id: <20210211122750.22645-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The functions gdb_get_float32() and gdb_get_float64() are now unused;
remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113428.7181-5-peter.maydell@linaro.org>
---
 include/exec/gdbstub.h | 20 --------------------
 1 file changed, 20 deletions(-)

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


