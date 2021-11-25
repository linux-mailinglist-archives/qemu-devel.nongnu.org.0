Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980845DE05
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:50:46 +0100 (CET)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqH1J-00061j-NP
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:50:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsq-0006kn-55
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:42:01 -0500
Received: from [2a00:1450:4864:20::431] (port=41773
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGso-0002L2-5G
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id a9so12517539wrr.8
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUO0SB+BMTWj4cM859jVLA0edAg0vIZYqctggby2tKg=;
 b=cOks5faj1ZAeIOESC8RJFn6w4X5WgrioTNGAJyEejDJhhhQ24BnJ1v3uQbcEAvYjUy
 OxM+su2lMvoLf3brzyI3BCTi45MN4vpk8gAssu23UzWB2jYGKqILq9T72p0qwiZX21Qy
 mNih0JSAHQNDwE1mPtKNYABdJPLnAEwa6kEz/ywpr4mwhPOMrRK9v+twtMR/CyTGFRfv
 91n94onlI/6k9Omrsph+7AUZOsgBYQ78iSvOL4Tlyt+gqBldP4FFoaPtIPvJxeStKqzE
 owIMC+WZc05+sM2DJ5PvwlTqb3KOpmI0FpidQDC0jjWXCW/NE8wm14880nc6fUBs6e4m
 uEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUO0SB+BMTWj4cM859jVLA0edAg0vIZYqctggby2tKg=;
 b=WhM0+Di9FRb0/u5fHsIgkX8fNkare34D+LiZRomBOQgNo5pmSgL5Pq0GIU+7mh87iO
 CEqz2CtEI7R5+FzrRMsGYAo3usVrIykpx7/F8Rig2iG5XEqYb9pyDrMpIMBREcRvTzGE
 vFgoDJerDKr38vt7KYGVf3BeB9FrnIv9HvqB1EfYyRXinAtbGbnF17qMrYAGmjuQikWL
 LYZEgBwTzqIfQfFHNIyrlKcnA9TJM0UJtQ2HBeUMpzTE3dd4zT+Rb9VmLMEIhlxfaTbN
 VXAXP6XolMefC4Me6kMtqlxMpiKtjzB4GXgb5rRNaeSGGJW8jYtO8Wv25tmNjxo52/Y2
 pvKg==
X-Gm-Message-State: AOAM530BnCvfObyFKiW8lmjWJ7iNbIxEVzfsde9aNlFKDpOSPkxH4r80
 4MTawMAQqlQDNP9WfLNwWMg4XQ==
X-Google-Smtp-Source: ABdhPJyH/ZXGt4RVMG+ovf14hNrAQv0hV/fP59ZuC4hMjuI9daRnwYHlDCw2g6YSZXjQXLryLcxNUw==
X-Received: by 2002:a5d:54d0:: with SMTP id x16mr7522187wrv.606.1637854916892; 
 Thu, 25 Nov 2021 07:41:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ay21sm7865615wmb.7.2021.11.25.07.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 624C81FF9C;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 5/7] gdbstub: handle a potentially racing TaskState
Date: Thu, 25 Nov 2021 15:41:42 +0000
Message-Id: <20211125154144.2904741-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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


