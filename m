Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908042A157
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 11:44:32 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maEKk-0004tP-TN
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 05:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maE8K-00081h-Vg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:41 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maE8J-0006s2-6w
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 05:31:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id o20so64742413wro.3
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D31p4w+XxPf7qh2R9A9ZV5R3vW3dq1sdIgNLtk3IWtU=;
 b=x6Fy9Tmg+q1iwwM95nLM0SON06W6MBheO2iDyKoa5ew3uiCk8Cb8i9any9uK7hmpDi
 WtdLMv8ae0Us9uZivPpGRZrpg8GWaCSrqG8gcmj3BOPCa91ehImN+SRt+kLG3IlTDV06
 UAMPgCxsv1DCx13U8pEAFHHgJvpWaPJjcSleQ3KjG4sIidR5zFIqmJx33WPpkqebSmBE
 l3STYVXAj3zBci3w0srapiPIFmZA0oMfgWSXCdaXbcK573ik3bdCLKvxRhtmiC7V7q5m
 ZYLqVMrIqcJuctrU6yf4IoqeYtf9qLpMCILHagU7Fvf/icO41jcjbcDpPB8HuvWMHHvk
 J48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D31p4w+XxPf7qh2R9A9ZV5R3vW3dq1sdIgNLtk3IWtU=;
 b=PTtKom1UBVVjhBXY0EgUvufvxru2rAD2EJTOcFWGozEHJHefbDND5rEW7ws0kFR0LP
 CQXGBr8AFpgnBYStnjQmddLZMR5fHLL8ixXCDKYL241vrg95FU6lVpO+j1HIFpmOoRpa
 nUc1YdCriMwO9xpmhcjMcTHeLEbMdBWOSg4U6h3wf+WCstm4fX/xsvzU4qThzXG+cpUH
 kbzBcZIbNb8mblZQHBpcFr6aFBnv8vOuus1yRBAG90D2sc+0W6L7hzYzVyXCUyiZa/VO
 2iNCWqHy8xufPMlDODCIxedSZAcrxcGHd3dPpWc0zJNwzK3L646ONCEVzZpxS1kMCP42
 br5w==
X-Gm-Message-State: AOAM531ieki56v7kmSagsIOmMl6Qis4/F9thCqBa/nnTn+tfR4ELAlGL
 HnKcBef66IvSAVhXLyGyqm5KyD2S4dDxZA==
X-Google-Smtp-Source: ABdhPJyYYaSVHV3kWA90tfbafMkNa2kpQ8CSlW40OaU4XLuV49Cb7gjQj9BRl06kHljrW/LzL6shbw==
X-Received: by 2002:a1c:1b89:: with SMTP id b131mr4262321wmb.71.1634031097492; 
 Tue, 12 Oct 2021 02:31:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x24sm2114032wmk.31.2021.10.12.02.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 02:31:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC5541FF96;
 Tue, 12 Oct 2021 10:31:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/s390x: don't double ld_code() when reading
 instructions
Date: Tue, 12 Oct 2021 10:31:28 +0100
Message-Id: <20211012093128.3909859-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the 4 byte instruction case we started doing an ld_code2 and then
reloaded the data with ld_code4 once it was identified as a 4 byte op.
This is confusing for the plugin hooks which are expecting to see
simple sequential loading so end up reporting a malformed 6 byte
instruction buffer. While we are at it lets clean up some of the
shifts with nice deposit/extrac calls.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/s390x/tcg/translate.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index a2d6fa5cca..7fc870bbb9 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6273,21 +6273,20 @@ static const DisasInsn *extract_insn(CPUS390XState *env, DisasContext *s)
 
         /* Extract the values saved by EXECUTE.  */
         insn = s->ex_value & 0xffffffffffff0000ull;
-        ilen = s->ex_value & 0xf;
-        op = insn >> 56;
+        ilen = extract64(s->ex_value, 0, 8);
+        op = extract64(insn, 56, 8);
     } else {
-        insn = ld_code2(env, s, pc);
-        op = (insn >> 8) & 0xff;
+        insn = deposit64(0, 48, 16, ld_code2(env, s, pc));
+        op = extract64(insn, 56, 8);
         ilen = get_ilen(op);
         switch (ilen) {
         case 2:
-            insn = insn << 48;
             break;
         case 4:
-            insn = ld_code4(env, s, pc) << 32;
+            insn = deposit64(insn, 32, 16, ld_code2(env, s, pc + 2));
             break;
-        case 6:
-            insn = (insn << 48) | (ld_code4(env, s, pc + 2) << 16);
+         case 6:
+             insn = deposit64(insn, 16, 32, ld_code4(env, s, pc + 2));
             break;
         default:
             g_assert_not_reached();
-- 
2.30.2


