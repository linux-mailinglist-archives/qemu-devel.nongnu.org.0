Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052D4D9B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:23:14 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6Cn-0007Lu-5M
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:23:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU630-0005wv-1g
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:09 -0400
Received: from [2a00:1450:4864:20::532] (port=38877
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62y-0000bP-5h
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:05 -0400
Received: by mail-ed1-x532.google.com with SMTP id h13so23904881ede.5
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4AELCoGsLjX+oRgyXcZMzmt/98I/pjWm2s8I0CPR0o=;
 b=x1E6wvxVO1ilXSwrleQtwxCERK0dObRa5MWC+dRKWAhLEJdTPoZAJga48ZphhAVolq
 fu7UcQEMAaSh1UHpor8M5OW/IBX16XJ/A0PQOk7rGJ/9XNaC4kuorvQaevQpg/N54NHX
 l8tuHz+TFHUkBVeuqJcMMORyv7m1I5M8ruEZUV1rHq5a5xNLXPt/lJt5nIeAh5yJ+Ens
 WDNZI8YizgAHkzNSp2tpWnWPfW01Wf1rWa4BMbnyYD00kWTcgxGFMw5oKfCGZWG6ByTw
 P6mAoaIrTLygiHB1K0QtGL+2QRk5WeMqiYE3MYaPSxbyyXTej0jTTvrhrrt48XVFOZ45
 3FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4AELCoGsLjX+oRgyXcZMzmt/98I/pjWm2s8I0CPR0o=;
 b=ZVw9g8r4n0C/bR7VRUrxKZfZcnGdnnWasAxmrbXf++RDdt8pkuuKsNl9o/WPelDS9u
 wmZwcbla4U+aOZ2X5je0k/DihLL+8ISVhexOnoIPM7H4VIngtyLQ4oIm44vpVljepFos
 +jediL0ID4T5UMP6TwEy7zM64o9Rsos0h8pl1LCBC71NigObz5wMnxYxTj1Dj3iEMjrg
 SsHnkoRKP90r8cVJbb7bv5oNo+6g6kwGdz2e3+0Pq+9z/6JuOBJBi1Ev6wUienlDGygP
 uWYE/sPqlq0eohyXZUNJFKk19w6PSViYZ3PYM3vfVyrBKPMsu9MYcWYSu0Gg5ZBkF88l
 HU0g==
X-Gm-Message-State: AOAM533ivPgq8NttDkhDiblxYZyTfzbh7Jrj3YtD5V8ZNfteFa/3qcTs
 iKvnyNcNTaClcXMv5nvVpy0SBA==
X-Google-Smtp-Source: ABdhPJxGz5ycvpklSmmMOm6SrqRln4NuZiaQKKGh4JVAT4wFSdC47hc6QP/w6e0yokzj3NwyaJ0IUw==
X-Received: by 2002:a05:6402:4396:b0:418:d776:14c1 with SMTP id
 o22-20020a056402439600b00418d77614c1mr337996edc.127.1647346382827; 
 Tue, 15 Mar 2022 05:13:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 qa44-20020a17090786ac00b006dbe1ca23casm1817451ejc.45.2022.03.15.05.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C02601FFBF;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/8] semihosting: clean up handling of expanded argv
Date: Tue, 15 Mar 2022 12:12:50 +0000
Message-Id: <20220315121251.2280317-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another cleanup patch tripped over the fact we weren't being careful
in our casting. Fix the casts, allow for a non-const and switch from
g_realloc to g_renew.

The whole semihosting argument handling could do with some tests
though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/semihosting/config.c b/semihosting/config.c
index 137171b717..50d82108e6 100644
--- a/semihosting/config.c
+++ b/semihosting/config.c
@@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
     bool enabled;
     SemihostingTarget target;
     Chardev *chardev;
-    const char **argv;
+    char **argv;
     int argc;
     const char *cmdline; /* concatenated argv */
 } SemihostingConfig;
@@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
     if (strcmp(name, "arg") == 0) {
         s->argc++;
         /* one extra element as g_strjoinv() expects NULL-terminated array */
-        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
-        s->argv[s->argc - 1] = val;
+        s->argv = g_renew(char *, s->argv, s->argc + 1);
+        s->argv[s->argc - 1] = g_strdup(val);
         s->argv[s->argc] = NULL;
     }
     return 0;
-- 
2.30.2


