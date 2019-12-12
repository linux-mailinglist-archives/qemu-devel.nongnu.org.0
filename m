Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB5E11C4A6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 05:11:20 +0100 (CET)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifFot-00052H-1Y
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 23:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFew-0000u2-Ve
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFev-0004AL-Nq
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:02 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifFes-00041J-7h
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:00:59 -0500
Received: by mail-pg1-x544.google.com with SMTP id x7so420892pgl.11
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BDlFqXreFAX+2qKs+QbdbUJAsxEgY9F0CR36Id8YiRk=;
 b=FhjIvlSPbHhaz2/P6BtwCZPI/B+kn1i+MH5t/o1szbLbROqCwcKv6K5EXkIqiEPOH3
 E0XY0UmeEnu4QuiaGch+YXQnHN6jJNh++fi78S6rQiMK8tiVp8Td6m+q2oUOon0OZ9Bj
 vtvZKLwXAwWGOiXAcKRyO3chWcumquuuNNXpyk4OIOmpSPJtoTMa4vLZAzZxzIMqzdrx
 Ea5JkiJ/9Z6uZE4V/J1nq1v8tGIsBBegtEdEVycWYH7sUpdD6s+vl1BBsIdk8i5VFzFw
 JMOa3o8oiR/s/QtPolsLIs+VRwYEOTaYqjzxfwD/2ONqvEBwRbKHLV+7CBTV+HcckHeF
 zTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BDlFqXreFAX+2qKs+QbdbUJAsxEgY9F0CR36Id8YiRk=;
 b=l+zsLkTKuyK5nk8AjNb+xZ3rncW4WetWGwRMCh5/1An/rOGu+SE+Vm6RThI7HgOBp3
 uOWIXNuJW3Tm5XwbD+DpMMC8qT8ab7XuQMIgM1n/1dOwFKbIrpfZdxlOdkE7/jg14XGn
 fEbmZsf4dbjvET28p9Qero+uXDOYvqTnIxBY3QgBNUPoJOCx2pw+Hjd32NYUreyaGVRN
 RuHkB1a6J2rchjzHjyBF+HEExzdiNSR/ILIzJX2R13z3eBeyWQJqaGwHBZLlej1KwXen
 EtPc8wrye+ux4tR8qbU5T5NJjZ8Q5f4cQhRRJzRJUJbzvl1YAp/6OT/Df8OXSl6d/zwW
 x9Sg==
X-Gm-Message-State: APjAAAXaK0UtDZFkNR+q7dNZwQSJ1+KkaHw8ZAwDQRoX9SdzlDaXTKEh
 KVvnrgZnFLNNYJnHcKY3cpf1SiPNjDY=
X-Google-Smtp-Source: APXvYqzrZ6k6i2MUaKrBDmyCkzJuA+yJnCZS5sEDcN7MSdgMtFVLzLd2ErheKt0IYmPFzirssU1YrQ==
X-Received: by 2002:aa7:8438:: with SMTP id q24mr7383682pfn.170.1576123252507; 
 Wed, 11 Dec 2019 20:00:52 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z130sm4666391pgz.6.2019.12.11.20.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 20:00:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/28] target/s390x: Include tcg.h in mem_helper.c
Date: Wed, 11 Dec 2019 20:00:20 -0800
Message-Id: <20191212040039.26546-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212040039.26546-1-richard.henderson@linaro.org>
References: <20191212040039.26546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code movement in an upcoming patch will show that this file
was implicitly depending on tcg.h being included indirectly.

Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/mem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 2325767f17..57ce17c252 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -27,6 +27,7 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
+#include "tcg.h"
 
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/s390x/storage-keys.h"
-- 
2.20.1


