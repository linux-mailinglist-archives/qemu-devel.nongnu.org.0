Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67ED807F7
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Aug 2019 21:03:06 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htzJ4-0005SU-3p
	for lists+qemu-devel@lfdr.de; Sat, 03 Aug 2019 15:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33011)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1htz5D-0006vt-Hs
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1htz5B-0007SL-Ju
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:47 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34530)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1htz59-0007Pz-KF
 for qemu-devel@nongnu.org; Sat, 03 Aug 2019 14:48:44 -0400
Received: by mail-pg1-x542.google.com with SMTP id n9so31447493pgc.1
 for <qemu-devel@nongnu.org>; Sat, 03 Aug 2019 11:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
 b=QWKl0+P7ZCOzrJrGAAa335JojcAeKlcVoNs1cAydwjDyaxukqGtQnw6FMo6klTTsSr
 V8JrdKdrddDhr1/jqvOmEUZOrm/NCNmkWtc8YEsvczoU0dOKyATP6Pzc1B01JyNL34dN
 J3mwHRjHZGob/MtP/AJsmyZpX9MFb2OXxjLYg7rPRwIJkEK2p9CpM/ojJYbxjJNjJvej
 YEwlX7vtKw5QXwXU+l7G6J7yC5ppYyeCTRz+COZRCf9UjW6lf2K0c3AeYlyNvlA6a16X
 /lHkMqyLXBtduo9etkcuJU4JK7ICQiik7TISJxmCSAZlFZDX6l65LIBrGBUCRbwafi81
 337g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
 b=EzJd4sweE6Zktx8FacOAjlZ1Gcz8/V8RLkVpXlulbnr9iCgD8mdRL7zg9swsPmhGr7
 DT7J8TeqzwobmTBZ3YcrXJLNquWmXHn1UO7Mt3LDgl4wnjxQbOi1Hyut+GF0UH+13FrS
 1ZhIjPNnHiVytDZzS2prs8vxwWZQwj0UecuKq3ow1JmU+W663idPJIKe4qQGdT7Ywxd0
 SBlSdhsBv/Sr493MRHzRlubceHKJn2IU5hChf/HYRXh5+uhtTcr3FSFU4l4m318L8Y0x
 3iihL9QjPvQG0lBT+mQ6R9zbZ0u/rAuYaI8WZpAh8pDsBEtpk9cDE4da2yZFoqxsSbnL
 18WQ==
X-Gm-Message-State: APjAAAWdZAx6qW26EtoMen4K5y1YnNFGR50OeZSn/HtDwJPwbQbxCjMY
 be79vQMVVOwqTNHAp5G5BWWAPPPNeik=
X-Google-Smtp-Source: APXvYqyw43hH5g5+9yj8il4fBZ/JqVWEEe+LCjQgr0W4w2DChR3Y+K97beq7ZV93AlZ4kzUNQG17aw==
X-Received: by 2002:a17:90a:2525:: with SMTP id
 j34mr10667580pje.11.1564858120445; 
 Sat, 03 Aug 2019 11:48:40 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 03 Aug 2019 11:48:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Aug 2019 11:47:58 -0700
Message-Id: <20190803184800.8221-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v3 32/34] target/arm: Enable ARMv8.1-VHE in
 -cpu max
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1901997a06..b1bb394c6d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -337,6 +337,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.17.1


