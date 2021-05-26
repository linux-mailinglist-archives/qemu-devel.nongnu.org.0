Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292C3392229
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:37:13 +0200 (CEST)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1DE-0003sq-7A
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wX-0003mC-Ev
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wV-0000MU-Jg
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:57 -0400
Received: by mail-wr1-x436.google.com with SMTP id n2so2606473wrm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyPLI6JLUcbjYeHJDUpwGJGLFNpEvS/d73n7elFgK6w=;
 b=A0E0xhwrkSGZVTLwsUNmEWuHl8kbj7JtQ39tyikvFDlgTFOcCwSSHqc8eLNXquPebf
 bczlQIE4zKDAIGqpElBQZg0UGS7BqeWKpPLy5IHRDGgxtl74c20d/RNiyksN36a9oLOt
 3qyVh4vZKt5e1h4qrOunB3QnKa4UztpqoyOf2ZQjEHk3jyrcHPrWJINham08eodhZ5Y4
 wAFOwm0h5rydZ/a4B3bzuXTJGHzKDVNWdxAHPE1U1PnX/j/1hsoAXs9ER+ZE6BsrEWT+
 6kC1LIy2uyv1HeDDD626XJjA/x4mpb1nbeFpd4vO6grGmFOc2f6ucKOPuyqTnuT/dU9r
 lNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AyPLI6JLUcbjYeHJDUpwGJGLFNpEvS/d73n7elFgK6w=;
 b=OCylRcS6uzHM+beujicOG0Ytj2X4Niib24E8FbnkC9SVyq5Sq1qzXEK1dCsqqbvklS
 N2uU0mt6CADUF4SykNJ1+/KNVSGdwx833+6cYo0tgBiAX4HBmRwwcT+uTSzUqMioDTHV
 4Snd/Xuj+IR8OMNL5fW1dg8C8URbbFnZ/2BRxXVbRVVNes8RnaVBK0X4iM2M0tzw4M//
 PkVZn6ZH/34VQ11hm77Q+8i/SzbWaH4ruC+hv2wtlRehJqh0tVxJBLmCtCKoTunbXoFz
 goMnnNSVfwsbGeS53T5JnAVM0dFspJNU1XMz1JmCyccWCj1rj3la0D4Div/327YhD3sZ
 i3/Q==
X-Gm-Message-State: AOAM530jBtXGdhXrp40AWwYXRjeSs/X1NZUyeQzlKY8rk13F7p3gQIKV
 /V81lssVWOObZphLuPygdMhK+vM/UDtWug==
X-Google-Smtp-Source: ABdhPJyiVxeW8b0wtFhacGima1ynEST+bfmxzXdLXb+YWNyh+gH9zJUKq8RovlTU5cpcp044q9xUUQ==
X-Received: by 2002:adf:f386:: with SMTP id m6mr111wro.111.1622063993995;
 Wed, 26 May 2021 14:19:53 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z9sm305498wmi.17.2021.05.26.14.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/19] gitlab: Keep Avocado reports during 1 week
Date: Wed, 26 May 2021 23:18:34 +0200
Message-Id: <20210526211838.421716-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes pull requests are merged during the week-end, triggering
a CI pipeline. Currently if such pipeline fails, the Avocado reports
are available for 2 days. For the reviewers working on the project
during office hours, the reports are already discarded when they
want to look at them. Increase this time to 1 week, which should
give reviewers enough time.

Only keep the reports on failure, which is the only case we'll
look at them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210525082556.4011380-8-f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 167ee88c410..180bf1aee7e 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -46,8 +46,8 @@
     policy: pull-push
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: always
-    expire_in: 2 days
+    when: on_failure
+    expire_in: 7 days
     paths:
       - build/tests/results/latest/results.xml
       - build/tests/results/latest/test-results
-- 
2.26.3


