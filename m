Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB8380D57
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:37:29 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZsW-0007CD-MW
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW5-00060f-0i
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:17 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVx-00075a-VD
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:16 -0400
Received: by mail-qk1-x72c.google.com with SMTP id l129so29001699qke.8
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qJcCLa/TGkZYVT5SI8s5q1rBnIGUHoLZECCGKcnM1Zg=;
 b=V44+2pmj1ERTQ10UUsFaTLyMfzRf4UoSkFBlmzUSHNFYOI+Wsu2lHS4M8svTlI/9sc
 o6P7YLjU0H9VGREBYxB2+CJjVhtKj7OiPnDbLG2pSElvZ4NjJmATd9sY3lfBfaoucz6c
 q2B4Qq5NsIvp4qW+H3KnILLE0PcIkpv46GPvgQR3j2nu0ebHRVwTGHnC/wNwRQZfB7xR
 jZDcpvb9d4hJzcLTNXIXh14SI7LAl3hDCt6Ko/JNgnDq4pzlrITVV9QJ4K7wukIXQq51
 FmqYDddQAkgkXiU8xBpqJVSrLv83DDNmYafVlT7azavz0SRaK9S/e1Yc152F6Z3ZZBJf
 jN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJcCLa/TGkZYVT5SI8s5q1rBnIGUHoLZECCGKcnM1Zg=;
 b=XioRgmLGzsr5ekBGcyHtzcuYGNvBZ3MAugB9QKHlE4AlIEyKjxb11qSWnO4q+Kf6pv
 Uzk99UgixcHI5ImiBO4Tk0PqqKTLRLR581hcXoj3au0CtL4aktJNKJl3hvB/r7hqZQhw
 ePG7WM2NY1Umh7E3I1IsnbpzF7T+DD7YMAo+gwbsL/GaeLvnOSghqSOhA2KlwS4KTHIg
 RHYHipIKLtZ1B14tqc192xQM9peGb4hKxH+PEKO8hMD0/gpgC0wj7yjN+9OPCcSU8tFW
 bvrf07HbTf+9VvF3YBBsGiqZzC/wpONuVwLddy1ePsAK2HjbZNLBvqr08VwvwqZnKiF2
 R5Aw==
X-Gm-Message-State: AOAM531cNAURxIdCKzzK4kgZmrfNRe3KVu9LI4goke0kD/BXzdhTPjAq
 7ERG+Pls/KKnIsu+8OP6F8WN1MMaui6Q+kAF5iA=
X-Google-Smtp-Source: ABdhPJzts1P+Wb6JkQVpLC8OiA9xAozKW6yHs9N6uw5gDRqzh0W1tvZsyaR+0kxqnYD6wvu+VjKUaQ==
X-Received: by 2002:a37:444d:: with SMTP id r74mr2444027qka.291.1621005249085; 
 Fri, 14 May 2021 08:14:09 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/50] target/i386: Fix the comment for repz_opt
Date: Fri, 14 May 2021 10:13:19 -0500
Message-Id: <20210514151342.384376-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After fixing a typo in the comment, fixup for CODING_STYLE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b9b94f0625..d48c0f82a9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8521,15 +8521,16 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
     dc->jmp_opt = !(dc->base.singlestep_enabled ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
-    /* Do not optimize repz jumps at all in icount mode, because
-       rep movsS instructions are execured with different paths
-       in !repz_opt and repz_opt modes. The first one was used
-       always except single step mode. And this setting
-       disables jumps optimization and control paths become
-       equivalent in run and single step modes.
-       Now there will be no jump optimization for repz in
-       record/replay modes and there will always be an
-       additional step for ecx=0 when icount is enabled.
+    /*
+     * Do not optimize repz jumps at all in icount mode, because
+     * rep movsS instructions are executed with different paths
+     * in !repz_opt and repz_opt modes. The first one was used
+     * always except single step mode. And this setting
+     * disables jumps optimization and control paths become
+     * equivalent in run and single step modes.
+     * Now there will be no jump optimization for repz in
+     * record/replay modes and there will always be an
+     * additional step for ecx=0 when icount is enabled.
      */
     dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
 
-- 
2.25.1


