Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A74617E0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:20:36 +0100 (CET)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhWF-0008Ig-LF
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLo-0001Vh-TD
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:48 -0500
Received: from [2a00:1450:4864:20::42e] (port=39855
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLm-0006Wh-R1
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so37122846wrn.6
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUO0SB+BMTWj4cM859jVLA0edAg0vIZYqctggby2tKg=;
 b=vBCptxwGyZhz+7Y8v8Q0Z2bHKlAj7rmBwo+/nSQALIhXMZakiGhxHXs8e5PLgeY/CD
 fcBzwfA/ySpJEx3QFx/B+d6EiQ/JuKwDV+mIeKGzeFwrkFsPeNs77bA9E6m01c08c4zA
 eA1xDfiGzHPOpyNhEdBc95Drx+h4hJpvkqGJAl2MgSfHf9GkaSy/m+iCgP5jIAI5RnQ3
 YIrgunHiIdbpEb+i/BmNAYySHkWg8C2ApS8Q6GwgNVcdgBwKkEibV9Y/F724jTHJ+Xmb
 OAqcZRzBqiLrqDUcHzZyRrpRdg6iHiDRj4qp9If/zkckERTTgWS6kviNyYjjFdBUoTij
 YnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUO0SB+BMTWj4cM859jVLA0edAg0vIZYqctggby2tKg=;
 b=aVC6kgG0fIHEHfVmp4CG/JO8qfyXqzne0BQXW6FpWVlYddgy2y6wZHo5k8zk61E7YZ
 /UPUR30cR2OerBaIZzd6qYYJSCXXhPAQnAURMrGdjx0mnAiPUsSOaoduCaX8kDFJ9gTP
 YkuO5TWvSlcsqopBevZWjWvRxzvmVKL3UXmc4rZQ0Jg+zXpm06PPTjfS0P9iSqxDyrCF
 XnrkcVsR1dZ2jbN2MVlNkhXoAqU5H6aM9HnhN8nibs2C2lUepKJyFFAoTuOQgqJ7M+4+
 BNOMcOe98li9xiyUAKS07I56lllGaYqQhmIJtH+uQX+PRbdpBIZQOihCPWR0ZOuTEgTV
 8Kcg==
X-Gm-Message-State: AOAM531y+18jPq5IPzPBkffa196YHFnVvQsXcV15z8Q3ZjBLxAw1Jrm5
 TS+KZpadgx9MFynxhvVnaXR7Kg==
X-Google-Smtp-Source: ABdhPJx/Ja9GIiHDidkVDdzREuv+4AfVAkXrd03v3G6Oe/Lcfih2eRQR6FWXeIXkNm3qF9Tlr8LREA==
X-Received: by 2002:adf:ef52:: with SMTP id c18mr34807909wrp.162.1638194985251; 
 Mon, 29 Nov 2021 06:09:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm19448585wmp.9.2021.11.29.06.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5770B1FF9C;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 5/8] gdbstub: handle a potentially racing TaskState
Date: Mon, 29 Nov 2021 14:09:29 +0000
Message-Id: <20211129140932.4115115-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When dealing with multi-threaded userspace programs there is a race
condition with the addition of cpu->opaque (aka TaskState). This is
due to cpu_copy calling cpu_create which updates the global vCPU list.
However the task state isn't set until later. This shouldn't be a
problem because the new thread can't have executed anything yet but
the gdbstub code does liberally iterate through the CPU list in
various places.

This sticking plaster ensure the not yet fully realized vCPU is given
an pid of -1 which should be enough to ensure it doesn't show up
anywhere else.

In the longer term I think the code that manages the association
between vCPUs and attached GDB processes could do with a clean-up and
re-factor.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/730
Message-Id: <20211123205729.2205806-6-alex.bennee@linaro.org>
---
 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index 23baaef40e..141d7bc4ec 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -94,7 +94,7 @@ static inline int cpu_gdb_index(CPUState *cpu)
 {
 #if defined(CONFIG_USER_ONLY)
     TaskState *ts = (TaskState *) cpu->opaque;
-    return ts->ts_tid;
+    return ts ? ts->ts_tid : -1;
 #else
     return cpu->cpu_index + 1;
 #endif
-- 
2.30.2


