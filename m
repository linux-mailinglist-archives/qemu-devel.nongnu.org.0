Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29964C570F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:15:48 +0100 (CET)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0fb-0005XD-O3
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xd-0008O1-RR
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:34 -0500
Received: from [2607:f8b0:4864:20::131] (port=36701
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xb-0000Ro-AD
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:33 -0500
Received: by mail-il1-x131.google.com with SMTP id e11so6847644ils.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rjqNkZos8HcanC51tcv3i0kE1ONfZDlQEksCXgwLEAI=;
 b=vwjnhPmML5AvtPYhCC/qU0MSgDlrdAzG+xJ00MPa8m+QpVodMLrMb0WyfMiYjN40bV
 W9t3vUkl5QjXTevBg/HmLHvuhPVH4x2mv/VZykqCS1u9nhzNKgtqGaz08WdfF3XiFTUq
 jDlIU3ox13bg27okWvMjYPRo+F0JaAhI3+IR/DjLjfO9cU2uzxRd069lSBXYVMzyF+RV
 0wdqf/KRnhZ7Hdn4Cv2biWQjcN4x/IEbh8tC9MyCf7qEePDl/bgoM3Old2GI1owGesLu
 ZOzqK1jyR2D+4PxPqW96+zJIIPtIjITSEkVcZAscCyP9tNoSAZ1XRytFX43bzHMrXqA5
 nTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjqNkZos8HcanC51tcv3i0kE1ONfZDlQEksCXgwLEAI=;
 b=gJ01SuRwNvkH5k0IQwMuT5CA1/+nsmP0IOMGa6KphU0PkW8ANxQmuxVc5NqQe7uRx4
 ldbDwzw5xkRxdw8JVkkQGQL/ThihhmCLyOp/XXcTeDKGQOenREH+hFt+E64nJCFJ/cqL
 +G9uMO8ICWxE/kNMIHJ2xuS81s9e7hC3rzSBjlKz7G/jU60gFLhmLQiBYuB6PYAU5xb2
 3v6jdemoUyvt2Hz4S+vZvzpUtUseg+uhyjtxuddCe2kREr1wa9BHYb2zieAx5pjgO7KP
 v9PEAw5705oAyGu8fNCV4wazlV7mtwH4XX/K0i6nyBMzfC0PLDbY9TQ8s8TCR9ikmEtF
 0nnw==
X-Gm-Message-State: AOAM530v/mYdq1EC9K0S4DqWeCXPQRmIbYaxu5ZB78zELTPWyzDP/u4o
 HZ/1fII1spnHB764EwnyP1x0wuUmbhrW0A==
X-Google-Smtp-Source: ABdhPJzmFWTq18UF0VxAfbJytiN6TO1Y7/UpH4/0GjWCci02ZBovTSqgI/zYdK1qPUL8CJB3v8ykDA==
X-Received: by 2002:a05:6e02:15c2:b0:2b8:4642:8e3c with SMTP id
 q2-20020a056e0215c200b002b846428e3cmr10895893ilu.244.1645895248258; 
 Sat, 26 Feb 2022 09:07:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:27 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/16] bsd-user: Add safe system call macros
Date: Sat, 26 Feb 2022 10:07:44 -0700
Message-Id: <20220226170744.76615-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a series of macros to create system call macros that go via the
safe_syscall path.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/syscall_defs.h | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 62b472b990b..c3bf14f38f4 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -179,4 +179,51 @@ struct target_freebsd__wrusage {
     struct target_freebsd_rusage wru_children;
 };
 
+#define safe_syscall0(type, name) \
+type safe_##name(void) \
+{ \
+    return safe_syscall(SYS_##name); \
+}
+
+#define safe_syscall1(type, name, type1, arg1) \
+type safe_##name(type1 arg1) \
+{ \
+    return safe_syscall(SYS_##name, arg1); \
+}
+
+#define safe_syscall2(type, name, type1, arg1, type2, arg2) \
+type safe_##name(type1 arg1, type2 arg2) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2); \
+}
+
+#define safe_syscall3(type, name, type1, arg1, type2, arg2, type3, arg3) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3); \
+}
+
+#define safe_syscall4(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4); \
+}
+
+#define safe_syscall5(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4, type5, arg5) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
+    type5 arg5) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5); \
+}
+
+#define safe_syscall6(type, name, type1, arg1, type2, arg2, type3, arg3, \
+    type4, arg4, type5, arg5, type6, arg6) \
+type safe_##name(type1 arg1, type2 arg2, type3 arg3, type4 arg4, \
+    type5 arg5, type6 arg6) \
+{ \
+    return safe_syscall(SYS_##name, arg1, arg2, arg3, arg4, arg5, arg6); \
+}
+
 #endif /* ! _SYSCALL_DEFS_H_ */
-- 
2.33.1


