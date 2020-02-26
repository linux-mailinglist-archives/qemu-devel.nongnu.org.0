Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCEA16F8C0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:48:42 +0100 (CET)
Received: from localhost ([::1]:39472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rQv-0007C2-TG
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIO-00013L-Is
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rIN-0002vm-8w
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38944)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rIN-0002uW-1U
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:51 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c84so1840678wme.4
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDf62Cq3SJaj+O7BFzF/D+1wJBPHwNV0aNRu09HEVs4=;
 b=YTiBBSkS40uIrltuUklpXCQubhJo4ikWPs2XC3h2XFByKQSRBWc3c+lBlPXwZkvmQ8
 np1I1ZACVy4dbQGXV5ZUjtapUW+HQsSoiWa59M2lWw7JqX04i3jlassDAad4MujawdDo
 IXC5ibNngxwBCkIle3HGBKvEFENwwXvb1uIs+ipfMKhcnDQYLT7Z4cDEf6LUnCg2djgN
 /NT6TCP2MYpG+mUTDCoWItl8wJTuZZkEdC9W3u4LIh2s6PLasRBVigVI7tW6XGTdUxWP
 uhsWEySBWMbLmbRyoieTZdZLZoq/a/b4b27UKevjhfBA1uXjkyJJujlUwLMlXlEFIUWk
 mekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDf62Cq3SJaj+O7BFzF/D+1wJBPHwNV0aNRu09HEVs4=;
 b=Ootg+zETwWFRNLOVzWlSCW8sxdnfcK72/SIBKnHvGNuT1PN7c+Cx1VKDB1dcddOndI
 J91JtCs00ZJzfHz3vljZCqCmqj+ZyggejBy5kKclyVq9JHqam5mMbuLF1UU8LCI05Yly
 xIr2i8lTUi3cmxIDZcTarm5TiNYBE2fa/XhWBWrlxqZAJ0oONBNe+GKKX45EOSISWA3/
 8mqezGDa1pd+VLb4osle7r+/U3suTCtrYrEfCo91S9FqBfyOxUwt7m7C0wfTUo1mIBf2
 DojqyxeDsJ4KdcgHR28BqQUwYkCpoU/ofdj/Q1Wg/KRfnEN/+RYQW2p6UHhuLeEfAb4T
 oOqQ==
X-Gm-Message-State: APjAAAVF9qOqZOSRJCBKLuEm+yCWoptBEsfzsb+wCuzDz//qaQJr3A84
 GF65MEeshqDA8MVRFDDBRfciPQ==
X-Google-Smtp-Source: APXvYqxqCrSJ3FoF1bGHG8KHM8+AhoYWV70u0G8729rvyinOQ0bHUKOwltK6qZ8/l8hGtG5jl+y2Mg==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr3851636wmk.160.1582702789980; 
 Tue, 25 Feb 2020 23:39:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d17sm1700621wmb.36.2020.02.25.23.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:45 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 678D41FF9D;
 Wed, 26 Feb 2020 07:39:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/19] qemu/bitops.h: Add extract8 and extract16
Date: Wed, 26 Feb 2020 07:39:23 +0000
Message-Id: <20200226073929.28237-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32f
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yoshinori Sato <ysato@users.sourceforge.jp>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200212130311.127515-3-ysato@users.sourceforge.jp>
Message-Id: <20200225124710.14152-14-alex.bennee@linaro.org>

diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 02c1ce6a5d4..f55ce8b320b 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -301,6 +301,44 @@ static inline uint32_t extract32(uint32_t value, int start, int length)
     return (value >> start) & (~0U >> (32 - length));
 }
 
+/**
+ * extract8:
+ * @value: the value to extract the bit field from
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ *
+ * Extract from the 8 bit input @value the bit field specified by the
+ * @start and @length parameters, and return it. The bit field must
+ * lie entirely within the 8 bit word. It is valid to request that
+ * all 8 bits are returned (ie @length 8 and @start 0).
+ *
+ * Returns: the value of the bit field extracted from the input value.
+ */
+static inline uint8_t extract8(uint8_t value, int start, int length)
+{
+    assert(start >= 0 && length > 0 && length <= 8 - start);
+    return extract32(value, start, length);
+}
+
+/**
+ * extract16:
+ * @value: the value to extract the bit field from
+ * @start: the lowest bit in the bit field (numbered from 0)
+ * @length: the length of the bit field
+ *
+ * Extract from the 16 bit input @value the bit field specified by the
+ * @start and @length parameters, and return it. The bit field must
+ * lie entirely within the 16 bit word. It is valid to request that
+ * all 16 bits are returned (ie @length 16 and @start 0).
+ *
+ * Returns: the value of the bit field extracted from the input value.
+ */
+static inline uint16_t extract16(uint16_t value, int start, int length)
+{
+    assert(start >= 0 && length > 0 && length <= 16 - start);
+    return extract32(value, start, length);
+}
+
 /**
  * extract64:
  * @value: the value to extract the bit field from
-- 
2.20.1


