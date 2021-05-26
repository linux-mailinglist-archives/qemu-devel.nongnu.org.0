Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680CA39238D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:06:12 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3XO-0003Kh-Vm
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FL-0005do-75
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FG-0004VB-8c
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:30 -0400
Received: by mail-pg1-x533.google.com with SMTP id 6so2296358pgk.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6NHbX+q+VShA2Bk5Ng7npHq9zi23MHy7IkVvyiwqk1k=;
 b=hDygFv5uMpiv3vzt+5ukCbNv4OuSr0Cvoy9ECWFFZWT6gC3sAZexHp+1I02hqv2FII
 47DarLQ9s8i1ku34t0/1bcxTGqo8kNxrLbRAGMOcZWZZ4vJOEd/qENg4MxC9kFm41IyU
 /e+TCsHHPxY2THK1KBZpIY6NeWURnsS7qAMHHozidxk4jcdl2yHmNLa/c23B9VLP7cWS
 sOAN3qNKYDgXaDM7mfzF1EMCkRD7nfDkMepxCpUBYCibEzUWTJggoUh04A5A3pfXlMYq
 aDv7t+SQnI5N/u20/7ImX/WHQ1X70lPPfXm5tKg2OdPgqFwSoWPO+sBLOghfTyeJZHel
 ojUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NHbX+q+VShA2Bk5Ng7npHq9zi23MHy7IkVvyiwqk1k=;
 b=amuc/5zTSP1qyNhcW2Oi5uK8lrzdhrfFRU50jbu1xE5LdKoBbwoB9nAcCwB+QeMbRH
 0e3q6C3+PRGwAxlFiBPD8v4DDZEZGWPJSjf+LlETV9YqXz3JApqWJXg1jm377dDwDhR/
 pRu4HxOlsAK2A7OUkZc/sFZsOqDn8Amv1CVYcMusJ9mRXCntNTlFD8Qjufu97cwfJ4m2
 aC7JmWJfEh1GeI4xcSKMjbJl19YvCu94c6dyUaSpCbXbhRCu3LNIDOz06zFYPKQ6G220
 7fAZhSrwj883jlEQXsZjnVSf/h2aPSLKwtkjI993YLwdpl95EYtr6o/Z7dDHtpt3+W5U
 0R2Q==
X-Gm-Message-State: AOAM532h6C3/oXnKcTKTZShNpvFW9zkw9fF+Q0urFf7+jnFtLUdtAoUJ
 dkgEjwSkG/xDLTCqWe7mXPJ4ZaPsjgComQ==
X-Google-Smtp-Source: ABdhPJxJdrOLyYjpabDwsmcgeFQmXU5Hmr3xwqkC+uPGt20xtV+8QVr1+TEEQX9jSeDG1uCnjD1XTw==
X-Received: by 2002:aa7:9384:0:b029:2cc:5e38:933a with SMTP id
 t4-20020aa793840000b02902cc5e38933amr530137pfe.81.1622072842043; 
 Wed, 26 May 2021 16:47:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/31] cpu: Remove duplicated 'sysemu/hw_accel.h' header
Date: Wed, 26 May 2021 16:46:50 -0700
Message-Id: <20210526234710.125396-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-5-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07d..919dc3435a 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -34,7 +34,6 @@
 #include "hw/qdev-properties.h"
 #include "trace/trace-root.h"
 #include "qemu/plugin.h"
-#include "sysemu/hw_accel.h"
 
 CPUState *cpu_by_arch_id(int64_t id)
 {
-- 
2.25.1


