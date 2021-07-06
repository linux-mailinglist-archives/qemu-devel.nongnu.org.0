Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D553BE014
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:10:36 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v99-0005kK-RW
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upJ-0001pC-ND
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:06 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up7-0006g7-6x
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:05 -0400
Received: by mail-pg1-x535.google.com with SMTP id a2so403244pgi.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxt2TIMgKbMWBeD96IyYiDNX06PY6klS8vx7ZxbBwqE=;
 b=RuNv7WsPQaWSptcezZn//B/txpbSD+9CfC79wwK65wMPKoGG1byP2+YZHGc4ox8Sap
 aw8cBKoT/j3dezkmgthXh9/nuk7luAgdA6FRILt8fLi9PHjDEEWFVTu5Fs9hvkuX2juN
 fun8qkM6QTdd6UtJri+Uv//pOUtH9i6VnI0Kyc5GYeKW7nFb1qClDacTs0uvRT2rwSqL
 X1R5HkbmY000WsnWAwr24xYeOSlOwOO90iTnTQFoWTgjCQNFtCp2Q37ZYspcp6zD1835
 Asx5/sNxL1FOi814LsFlr651qIC3eyyax36bsdGCRoKr1Qoo+RIvQ3CKD+dV74QKZORj
 bytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxt2TIMgKbMWBeD96IyYiDNX06PY6klS8vx7ZxbBwqE=;
 b=Ik/o+5gffmCg+jva2sg8kix+JuWZ9bsaMoS0yIbfKY8la3IZ7fPdtOnOTan/JTl/mw
 5C3M06J5HjxqzaVZd++Df2KtMcpqnLzm2ela2viFt2nMGroqEw49StjloWAwN0B7pgZr
 MUu0inwYUm8/a4FBUNUlZNgEAqur2UpKS0eJto2+Cxrj2bcCfiIWeECiMGJw3GMlbGSe
 SwQwLkwihtxxS8JcFmRtXWRsUsHcMc/Q2kgZ9h0MNgOD1rcwoKVBX+nNois0+rW38rLy
 TXhHhmtDOwElT8XK2Dl+3RG9p2S8pw6qyThG8ww/qmbTx7LlIEtLcCxk0wsP7brHsSUa
 rxgg==
X-Gm-Message-State: AOAM5339p7ngIdcg2ifqHI3wPV0NS5WmHRhsClLwgAboxwEXgcXlInY5
 mup/yNRytfARhRzGXU2CZZcdqWkbaN5RAg==
X-Google-Smtp-Source: ABdhPJzX0zxn0oILoC8VpXd1mGOp9NNtdToTCQXI/I9meCKWcHUoOXQWo9Y2hoLK4SJU+Bdpi469YQ==
X-Received: by 2002:a05:6a00:15d0:b029:305:1ef:8fbd with SMTP id
 o16-20020a056a0015d0b029030501ef8fbdmr23095625pfu.64.1625615391325; 
 Tue, 06 Jul 2021 16:49:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/36] linux-user/nios2: Document non-use of setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:24 -0700
Message-Id: <20210706234932.356913-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f12..fe266c4c51 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.25.1


