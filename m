Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974764C77C5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:29:24 +0100 (CET)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOklv-0006VL-NH
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkVF-0000ob-RV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:09 -0500
Received: from [2607:f8b0:4864:20::d35] (port=35446
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV4-0006bj-39
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:12:09 -0500
Received: by mail-io1-xd35.google.com with SMTP id q8so15687264iod.2
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Y45btB372BUYpl0DMg2V5qSfR8CjjH9rCY8SnGr7hw=;
 b=GFvWjw/0JzPK1OwVfjy4Zy9hHyNkHdm2CAJ7Z933gv+cZBtWBOtLhrzfylAjcewops
 RIcp+87MWOOFOf5pmcXMrbITHq+qxVN9GzsTz5fXx0RMlyjhJ6BTKa7aOdBCBD44LGLT
 XkMdYmZQ/8xSWK5ZyW0/DS/UAhdqmxWScwDJ/vg+CDQzDLv8tusvUSZtmPsrBZ0mskvX
 j7ORo3kYSPLRC83eIuf1VvbaOMZSEXXj7Z4YtvdOhzDzDhf7HJdfcLyVnRjaSz+n6a3Q
 5i7L8g0O26djCnv2NhaFkndWbTwY/MtSKeADUV/FerN0qKjCSwtBYzIkSJtPw4yFqt20
 18RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Y45btB372BUYpl0DMg2V5qSfR8CjjH9rCY8SnGr7hw=;
 b=vQnWIr4HPgCqi2ddt8GS4MYI0wE1Cbpt9HYwV4xZOlpjV1PiYeVGGsAr0XpmmvfCWx
 tibNWVA/PZ98gQwPRKc5l7z/4ybi6uEatkTJikdsIhuMgUUpLUycyKgar+DZWAlebWqf
 7wk51+75s2g5UkDGhZuvFhuLBFiT6CNZStN8D8h5D1Tm3F9itGjJIYD2T8D+u45NlWnf
 tzrKNjcdG5SmGA464/43+o0SDAE3cIt0jYlXo/J1MGy1XQTWcVoRwGfakaBFdxiWtTCb
 jVOm/tAModSAdCaj8ANLDg8OoHOyyrTrVyANYuMo+QdTamSXidOdJ3MjHnTg9ZMtCs02
 ETew==
X-Gm-Message-State: AOAM530KdA9JK9Xn3Xuh+td5f0YmgnGlNf3oGDaIWF8p/5coobzRRk9X
 glIQXumMeJ8jGycAypKTfXQ+vtXfnaoUmA==
X-Google-Smtp-Source: ABdhPJz8KNkpxydAyxGgb4+aVdAqJY1Z8L/ku9EhI5+AaS3F8pvlU4Knolwq1YtQPceqFwTsWMfTYQ==
X-Received: by 2002:a05:6638:378c:b0:313:f08c:e4df with SMTP id
 w12-20020a056638378c00b00313f08ce4dfmr18112321jal.192.1646071916793; 
 Mon, 28 Feb 2022 10:11:56 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] bsd-user: Define target_arg64
Date: Mon, 28 Feb 2022 11:12:13 -0700
Message-Id: <20220228181214.2602-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_arg64 is a generic way to extract 64-bits from a pair of
arguments. On 32-bit platforms, it returns them joined together as
appropriate. On 64-bit platforms, it returns the first arg because it's
already 64-bits.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a9efa807b78..af272c2a802 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -462,6 +462,19 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 #define unlock_user_struct(host_ptr, guest_addr, copy)          \
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
+static inline uint64_t target_arg64(uint32_t word0, uint32_t word1)
+{
+#if TARGET_ABI_BITS == 32
+#ifdef TARGET_WORDS_BIGENDIAN
+    return ((uint64_t)word0 << 32) | word1;
+#else
+    return ((uint64_t)word1 << 32) | word0;
+#endif
+#else /* TARGET_ABI_BITS != 32 */
+    return word0;
+#endif /* TARGET_ABI_BITS != 32 */
+}
+
 #include <pthread.h>
 
 #include "user/safe-syscall.h"
-- 
2.33.1


