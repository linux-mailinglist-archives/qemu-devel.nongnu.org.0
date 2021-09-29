Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AB41C567
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:18:07 +0200 (CEST)
Received: from localhost ([::1]:56404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZTK-0006im-1D
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHy-0006k6-7Q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:22 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHw-0006AS-HS
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:21 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so2769199otj.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=gOYu1nivdD0Jq4FXVEuBcoKZM4WPNoB268Jd8qxrxVRBpSc71Whk0vtrgpBDCLjfQt
 VQAFk2gzu4Fn7Aj2ted9JbLNzJVoef53CmUEcNIhmsz5U1PEf+X0flHJ3AZZjpt4sTzl
 Rm/Rk+1zRXSxKiYPwhpKo3EtYuAPR9aOYn+XCbln2swuA/FWaaq1HvCqjYbCwAaecMN5
 lPCGAwAoGRQgI9KnH2oBGHrazF67rR2GAjq3g0fS/VX+DXe/F7DLNKub1C3VSqqhH5pr
 M52Z8WGfrxrdjaAKB2oZ3e57i8B/6SyG/aQtER4OglBpAox546NVfA86cB1c1wpFooyY
 PLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uDmWChPs4lp5UI8b6weWaZXX8zbdz4czXb1drnckGg=;
 b=BmrthV+vXi6AzphKiifXmB/MRVfcr+2w531Yi81Suwjsooc1goMSgttFz9Yr4/MyJ2
 Y0es14Jt7AiCLzP4OscriTzVJCvUrnPb5VE8hSCJBfmN7y4048KTpHIme5uZ/Dtqx8kv
 na5uWOaNE5AlZpNS8krDmlp03val3wYp+D8Fh8nQNUR5qQnyqiHURLl9qR01ruh2R53b
 iPiUIuD8UdhMyXYD5SDcPs/iyB9rDVlS3s5zhfq29mJxd46SJKgKJw/phBRmZpEUa8WP
 0QSoIH37PzlGQW/6z4kbZIpnpzZXrjenrltqZ0vUwkUF6Is2x1a8aDHEUTwn707YuuVr
 G7ww==
X-Gm-Message-State: AOAM530nv0hNQD9yPojd6u5taUT7aMYKja6a/qLwTQoLhI8ycKMa2tiY
 uhwyCqT4kvM4kLXM2l89PK1f/zmzuSFVtg==
X-Google-Smtp-Source: ABdhPJzwiaw74HrofB2zvMP9xnTUNqtE6jUB86h738E3RA+qmr9inFXuJZixaTwiNAGvs86DgYF+2Q==
X-Received: by 2002:a05:6830:101:: with SMTP id
 i1mr3608581otp.107.1632920778787; 
 Wed, 29 Sep 2021 06:06:18 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/26] linux-user/hppa: Document non-use of setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:36 -0400
Message-Id: <20210929130553.121567-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We cannot use a raw sigtramp page for hppa,
but must wait for full vdso support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_signal.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index 7f525362e9..d558119ee7 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -71,4 +71,18 @@ typedef struct target_sigaltstack {
 /* mask for all SS_xxx flags */
 #define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
 
+/*
+ * We cannot use a bare sigtramp page for hppa-linux.
+ *
+ * Unlike other guests where we use the instructions at PC to validate
+ * an offset from SP, the hppa libgcc signal frame fallback unwinding uses
+ * the PC address itself to find the frame.  This is due to the fact that
+ * the hppa grows the stack upward, and the frame is of unknown size.
+ *
+ * TODO: We should be able to use a VDSO to address this, by providing
+ * proper unwind info for the sigtramp code, at which point the fallback
+ * unwinder will not be used.
+ */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* HPPA_TARGET_SIGNAL_H */
-- 
2.25.1


