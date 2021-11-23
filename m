Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F2A45ADCB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:03:17 +0100 (CET)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcwe-0001L8-Sw
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrF-00026f-ER
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:41 -0500
Received: from [2a00:1450:4864:20::32a] (port=42993
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrD-0006Nf-Qp
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so265820wmd.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SycTkjrDr+1oRjBfcTSdUKJyzjeYOYHJsQB5AU6b3cM=;
 b=h6VheffYOdocYdpTShecWBrRrd7pMGlluzqm+ZXYEBpryShPP58HEc2sLEB+kzx3gm
 f2Ch1tPIa2G54ZU+j8iB0ntA7OQCv1of8x25YGjKVhnMnk1xhjt6XJcuNPzlXBN4/TbZ
 eKzy6g1BFkyFicJR64/iz/kqZK7m/uxMhJ+qv1sHUz1u5aGo/is0AgiqWU2ChikvyulU
 yU/3VwAYcpxrOIW7bCKRRzUPkKogCJNva0rhqO9S1x7IiOuqt3UCJuqDLMF6z+xPAeeE
 lWPHepy263DUyToI4fo2m9CcxVc8y/CL5hJCpoT8ni+U5IRkvFt4NyUa4FoBIrVm2pv4
 QM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SycTkjrDr+1oRjBfcTSdUKJyzjeYOYHJsQB5AU6b3cM=;
 b=QozlJEeYBwAUHRLWY8A6QYKRMhKBgbT7BINhblfrS/tgFFu6u2/PB5XdoGfCDqfv87
 C8DRCiedV5YX8Z2+B4VYRI1/Un+pzr5j7DWJ2OrZfcFnDbNNfvo0GYvTe8Mfnx8DGTp6
 h7AkuGuBTg212R0WPBb2nKktCDmBza8Lm+9syCy7nmmqUeIqd3YN24tT4PG+JOXpTNL0
 SdDtwXR61lNUxg8J7eymhe4ARUszOzk1TWb6BumHtusF6l5p84mAoBnXa8IGf4Z9egj4
 Pd8eK1kjyJ/SSvkLI4SorPRHJnHgoMXv4ZzTfSqsccXAIdBbNP8/D9J2FWNUUYBtAi7C
 fLRw==
X-Gm-Message-State: AOAM5334hgfjSgxE7sFYEKL87ejlh+rQs0gZPIiR43Qb/bykKrBdjAkW
 m4QYMBgSbdnX1noT6r7fXKPWrA==
X-Google-Smtp-Source: ABdhPJxuvmWMElVFFkJYOr+nV0MxrlHtkzp94lLWKRzdSEHEnSr/rtX7SRv2sDy/vBRvA6qxJiJvqA==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr7354997wmq.68.1637701058555; 
 Tue, 23 Nov 2021 12:57:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k8sm12651400wrn.91.2021.11.23.12.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 851C41FF9C;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/7] gdbstub: handle a potentially racing TaskState
Date: Tue, 23 Nov 2021 20:57:27 +0000
Message-Id: <20211123205729.2205806-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


