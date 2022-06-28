Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AE655BEA8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:11:45 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Rs-00057v-1y
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FY-0003FC-Jc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FW-0008Km-4J
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id r1so10016460plo.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h8LQotJB86tKW7baXHd45kRYb/tuL0ssQ0shlDYqkXc=;
 b=Yb0ZDcXD0G11W8UTrUonyloyWUOMF66yZUfWAK4MBwt6rY0klsKxImqCKi1TdLDK7R
 Ht2AuDaMrCFXb0XFQNh0Gumawx4beJRx5+C8gVAUkBGIIlEtVcitZ9bfMNYQ8vNVguQI
 9VMZuVDOXwralfeXE4Ehp3oVzxt2K80Lk9FQJcoUHIEm67BGm24oCoYXrxGVlJKMCBnb
 ZIcpypFEI7z0F7/FznaCvALM9DslKuev+qXPP6AGGCQ0XUnXnfizrpOdOXhQqmraVEdB
 te+IiKYgg+6eH+aMRrcVtyZQWdRR6RNNDSEZDSzCpjV6eQ5ZU5k+66bNEFWB62zCPs5v
 thIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h8LQotJB86tKW7baXHd45kRYb/tuL0ssQ0shlDYqkXc=;
 b=oT0t1pQxSKVnFkUmhBH9DPpzgjymoA9RT4KTpidmvDkOZNPORqzqRokDv3RwCZhbHU
 EwrMLYzOOwN9ysPKHtfMr4qU2qZ8f3phDCeTCXjeYEPM1fggQJjR7ISLaoGEV6CkKkvF
 v20LEX3DxKRrvkV/KZZDJN6OAYQnqLgykdNzwrJcZ1emtrpjjyvt4mxgLGYigI5H0Xrw
 ISTTSVdGciL+3Hm7i9KjXncqZcJCVHuahW6xH3VsJDHfCp+Gwf7mntm86DTaBVJiT5hN
 P2sNv1dkOuLKMpwf5rMAgZg9UisVKYsWzwt4dWWm7Lw5e+6zyJfDDUsk1sJWjzf93qYW
 PWYg==
X-Gm-Message-State: AJIora9qnHZeE+ne8nDRz+gx/RnYS0UoSME/dAx5q7KExkqET1qbaaVx
 AKlyoeX0o1AphtJ9sju6IuMIIIRYvUSuvA==
X-Google-Smtp-Source: AGRyM1v/Tuch7TaUXVnpgd7uzgaxpxuRtnPoAoM9/df4xdojlVHyo7GqI/kx5mrsVFCWizJxz6lVFg==
X-Received: by 2002:a17:90a:dc81:b0:1ec:afea:3b17 with SMTP id
 j1-20020a17090adc8100b001ecafea3b17mr20353877pjv.203.1656392093386; 
 Mon, 27 Jun 2022 21:54:53 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 19/60] gdbstub: Convert GDB error numbers to host error numbers
Date: Tue, 28 Jun 2022 10:23:22 +0530
Message-Id: <20220628045403.508716-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide the callback with consistent state -- always use
host error numbers.  The individual callback can then
decide if the errno requires conversion for the guest.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 88a34c8f52..f3a4664453 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1886,6 +1886,37 @@ static void handle_file_io(GArray *params, void *user_ctx)
         } else {
             err = 0;
         }
+
+        /* Convert GDB error numbers back to host error numbers. */
+#define E(X)  case GDB_E##X: err = E##X; break
+        switch (err) {
+        case 0:
+            break;
+        E(PERM);
+        E(NOENT);
+        E(INTR);
+        E(BADF);
+        E(ACCES);
+        E(FAULT);
+        E(BUSY);
+        E(EXIST);
+        E(NODEV);
+        E(NOTDIR);
+        E(ISDIR);
+        E(INVAL);
+        E(NFILE);
+        E(MFILE);
+        E(FBIG);
+        E(NOSPC);
+        E(SPIPE);
+        E(ROFS);
+        E(NAMETOOLONG);
+        default:
+            err = EINVAL;
+            break;
+        }
+#undef E
+
         gdbserver_state.current_syscall_cb(gdbserver_state.c_cpu, ret, err);
         gdbserver_state.current_syscall_cb = NULL;
     }
-- 
2.34.1


