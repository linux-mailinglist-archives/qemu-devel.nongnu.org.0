Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1891036AAF9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 05:09:50 +0200 (CEST)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lard7-0008KD-1g
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 23:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNn-00083k-VO
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:54:00 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1larNa-0007Zx-94
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 22:53:59 -0400
Received: by mail-pl1-x636.google.com with SMTP id n10so16989544plc.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 19:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zrN3ZTuevcjI//77lMPrhP3wL1+FbaSyRflhGtu0l+U=;
 b=YvJlstfXBa4Wb1pO6T3wjyZivNeLsnJMZPdjojEmObFLXa4NFwjize8d3AIXWM+dCi
 e7V3Xu5mFzN24l34B1rf7C9I17DNAuk9eRqr3aHQWa7vJl/03ev0igkZHVAqSpyIkrby
 zUeKBXICmW/W2qTjJDSXBN3XlNQncvu3vURaPEwjFXlVgrtRKsxWUhkn3kazt3nkTdNW
 8+YIlcVRP2EaL7KaZGWQ73QTtyCPBKHqVHJ4P/BJe+hpYRhCkIQOX3SSKbxwLq1wVn5o
 mDI9FnUou6oG73VJrZuMt6CQ72e7Bilp7FRzsf2B8v4I0qExclRchedimYAD82o9O10s
 59dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrN3ZTuevcjI//77lMPrhP3wL1+FbaSyRflhGtu0l+U=;
 b=Zbfb2l1LiFSf6UOl5hS/2KoTablBL9E0C+mFsCTEozEY9t4tE8Xee/QnZXX4YAmSYB
 huq/ZY3r1FAvabuogOOTsb5UR1tOzDKVD5B7lf/lxevuS15cRTUbWJrQLka21G+4sQwO
 b0MCLhurADhw6LsvCmwTCeDjY/al6CXZ0lpos2rp9mFsmKz6bj0q0TbwgKRyGHb5qwZk
 kLCkRI32pzx/Odr9nlOcyAhcJp2ECpa1OJA08ibJKAtfBqsyDar9ohBeycfiVS04dJqv
 vDtdz4/55EuLXNe4hIZ3bYW9/9p9F08PPQ9qlo1sm+1RzrUCf8ALZymO3KNhe1oHK39E
 0IVw==
X-Gm-Message-State: AOAM5323/166RwiNonCZFkyx5PyFfDi+ptKjdTxcdyswN6a6Pg8F/1DE
 634WswRMI7JNM5X/ffbGzjkqoDNzcq16JQ==
X-Google-Smtp-Source: ABdhPJzAsEvW4JiwUhWcxI+3MYPGs6cubfwcVVUkAQRk1aDqgd4y6ajlSpuL3d7tsiFiv/LiDYFJug==
X-Received: by 2002:a17:90a:7c4b:: with SMTP id
 e11mr19508095pjl.151.1619405624986; 
 Sun, 25 Apr 2021 19:53:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm9805680pgg.76.2021.04.25.19.53.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 19:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/25] linux-user/sparc: Remove target_rt_signal_frame as
 unused
Date: Sun, 25 Apr 2021 19:53:22 -0700
Message-Id: <20210426025334.1168495-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426025334.1168495-1-richard.henderson@linaro.org>
References: <20210426025334.1168495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's wrong anyway.  Remove it for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/signal.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3d068e0955..29c5e3b0c0 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -64,17 +64,6 @@ struct target_signal_frame {
     abi_ulong           extra_size; /* Should be 0 */
     qemu_siginfo_fpu_t fpu_state;
 };
-struct target_rt_signal_frame {
-    struct sparc_stackf ss;
-    siginfo_t           info;
-    abi_ulong           regs[20];
-    sigset_t            mask;
-    abi_ulong           fpu_save;
-    uint32_t            insns[2];
-    stack_t             stack;
-    unsigned int        extra_size; /* Should be 0 */
-    qemu_siginfo_fpu_t  fpu_state;
-};
 
 static inline abi_ulong get_sigframe(struct target_sigaction *sa, 
                                      CPUSPARCState *env,
-- 
2.25.1


