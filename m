Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F67052DC0C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:55:50 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkNJ-0007A6-Ot
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0006GH-Qj
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5C-0000qR-Ot
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u27so7379624wru.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VmlaKb2Ytt5XqgBhowvQiubR73WmXJEhGkUqF+2EiqU=;
 b=aGo0BjcXMz3/ZZGiRquf5/2lYBaMtfySVn0KUlZXUblyQBd7NjpHBbNT1X4hJVCUwy
 3VXiEyuJrc8aNI6Z3iODiTyIbGpw4Fsh9JgyFkyrTaFJcmdoCucSPjwXjft0Nv/WBJal
 WXAMXd3L2aavxYm1O/OHQuOGVD6s+S+bWS7R3GhloKOr1EZU8Qrr9QO+KprY+nhFyD5v
 jJviTFp5co1tZL3IqYtHlsRauOBbUlKT6taXVDw+HoM2I6SlsQZ0HtDSlruvk5RJBFYZ
 jMrvL0P5vTbEGuQIBhYuDKq7yVY1WXFvlyz+hW+QhWV9vGDJtpFfL3N7ZGdlpZXqWVmA
 BX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VmlaKb2Ytt5XqgBhowvQiubR73WmXJEhGkUqF+2EiqU=;
 b=VCSEIu8eog/VKTBHPHCkHoqgAg+fKeUw/1o4AiD4oJt1ZWs0SGOShwRR2z2ySCyNkv
 FQw188Y4TfcXqFUrXshmBvWdVARVnXpJW4DwSDNwRi1t0Mlubkz7YuchjlUOYUwncFUL
 tiIiMPMpT1ow7tVMVUwIMAJs+xX+fwIR9tYdy6klHaVGWirG2odRc2C9U7tQqPRX46aR
 G0VQtc+8v97BuVhcz9lcM1yl5f+gCBhOGv4+f5KkQb1UzbE5fYl1b0LiIBquNwPKDJAj
 6FrAD+yzdLYt0IG2vrzhaGOlrKxAKQkMiqN1cFuudYTwW6CZos1UzShqPsqhzo+bwGvc
 vB2w==
X-Gm-Message-State: AOAM533vEsytHHmv22L34v8izdr9CA4sa0OpPV9tEOHyJO56QLza+G7g
 BeEcyN0gcYjcjsGQCF4zT4T/9pSnIuCbng==
X-Google-Smtp-Source: ABdhPJz61qA9PquAicRjS3S4I6NIH2t0qxkEJCEMSVCO6k1Q1PG/5t0ifDcI5oie8gH9B+/QGatHnw==
X-Received: by 2002:a05:6000:154a:b0:20c:7e65:c79e with SMTP id
 10-20020a056000154a00b0020c7e65c79emr5134791wry.582.1652981826102; 
 Thu, 19 May 2022 10:37:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/22] target/arm/helper.c: Delete stray obsolete comment
Date: Thu, 19 May 2022 18:36:44 +0100
Message-Id: <20220519173651.399295-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

In commit 88ce6c6ee85d we switched from directly fishing the number
of breakpoints and watchpoints out of the ID register fields to
abstracting out functions to do this job, but we forgot to delete the
now-obsolete comment in define_debug_regs() about the relation
between the ID field value and the actual number of breakpoints and
watchpoints.  Delete the obsolete comment.

Reported-by: CHRIS HOWARD <cvz185@web.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220513131801.4082712-1-peter.maydell@linaro.org
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 91f78c91cea..d4db21dc92c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6540,7 +6540,6 @@ static void define_debug_regs(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &dbgdidr);
     }
 
-    /* Note that all these register fields hold "number of Xs minus 1". */
     brps = arm_num_brps(cpu);
     wrps = arm_num_wrps(cpu);
     ctx_cmps = arm_num_ctx_cmps(cpu);
-- 
2.25.1


