Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301133CC2A9
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:31:16 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hbH-0000Ur-2K
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4haR-0008G4-A4
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:30:23 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4haP-0003ng-RU
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:30:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m2so15061391wrq.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mj0B9KuVpKwlQZxV5tIKGVLxu/uZ6YBPm72FAg3oYVs=;
 b=Vis3MCnCtDbo/C5PVz42T5ewu+PxqoD8dntMy7xzS9TwWFl7FPMHsGqu1k0Oihkoa2
 yE7xBikWEQAfiGEre2j/HPysuuKoNBTLWb0btjHv904xPcn6AhExgKPwimUV++lpKA1W
 e8rHB4h1AXO+Lap12MV5/WJjFxCoFooPS/SJmGn+PljVoiC4y4JRgLg5oqOokrxlmcWn
 Fx8xS95Zp4s7b5A+BxnlDq3x8l7k4DOH+D02SXvKZMEVvOJpnnJQWLZxwL/kp7vr4DOE
 Dyp3lTutlljVXXlBRktMO8jaVZl0HDlliq5FP2gAOHj4ai2ZnlsobFPstFibHQ2exDBz
 c6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mj0B9KuVpKwlQZxV5tIKGVLxu/uZ6YBPm72FAg3oYVs=;
 b=VIW6JD6EWm1Tf1FD4/FD1900XKhk6zVBeXUYJkUkByj7S4FmvG4I0R9ck9wlgSTl3E
 e6Ba3rtHL0DcvYq2TQ+FG7aioCwA4yhwIgwyGQsfas8ncae7ojgNh2pOh2jZ1Zi1Sg+x
 RdLJRJwVWsTg1S20zS9Mux8UnZBc4O/ntJgkTZI3WGwHzacJc/X2H+GeREJpRQfdJUwr
 nOSMhlWAB36LHNEshP6T1NHHyY84YFpDi8YF1UWdv7MV4o4H2nYgmY7SnAhG0ztF7/1H
 Osf7G3Rvax2szLn+bkGt9aHZ5LPh6MQsz246lwefPSa1ejEVhCpGintQ6U9sM6cOaEf8
 72RQ==
X-Gm-Message-State: AOAM532sC2uVjfgOk5lZ/aQ4gWXII+DUvteY0UCKSEtMUcEF4vlfn8NB
 fPkD9pSTB/GR8lzJldh3b3pkYF9RsUmC43Hp
X-Google-Smtp-Source: ABdhPJxCKFPuvjaaIXOnQVoO1OH/S4dYOxaqDHvpHk6PjX2kXOBe4VjG1GBbiMxpXnmHvbPJ79V7ow==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr17927588wrv.190.1626517819607; 
 Sat, 17 Jul 2021 03:30:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v11sm12645304wrs.4.2021.07.17.03.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:30:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hexagon: Drop include of qemu.h
Date: Sat, 17 Jul 2021 11:30:17 +0100
Message-Id: <20210717103017.20491-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu.h file is a CONFIG_USER_ONLY header; it doesn't appear on
the include path for softmmu builds.  Currently we include it
unconditionally in target/hexagon/op_helper.c.  We used to need it
for the put_user_*() and get_user_*() functions, but now that we have
removed the uses of those from op_helper.c, the only reason it's
still there is that we're implicitly relying on it pulling in some
other headers.

Explicitly include the headers we need for other functions, and drop
the include of qemu.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 1626384156-6248-1-git-send-email-tsimpson@quicinc.com
("[PATCH v3 0/2] SIGSEGV fixes")

I noticed this because it's the only place in the tree where we
include qemu.h that isn't either (a) a linux-user specific file
or (b) wrapping the #include line in an ifdef CONFIG_USER_ONLY.

 target/hexagon/op_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index a959dba56ee..61d5cde939a 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -16,7 +16,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu.h"
+#include "qemu/log.h"
+#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
-- 
2.20.1


