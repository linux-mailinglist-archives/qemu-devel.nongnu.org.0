Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8363F75D4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:24:30 +0200 (CEST)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIstJ-00062p-RB
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZ3-0000oq-Vh
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYz-0002aw-Dx
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id z4so20702142wrr.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyNFAVFOZhMCCrZfvor1HjHIh8GYH8Avp+4JewVXcSk=;
 b=b6UUL23sv2TK1gWdoJJGdWI010o35x0lfIRoERGiF6f10HalfySe0I752s/qYZhvs1
 OGzS+/6xvcKiom9rWcjKowfk7zDgXQqWl+FJbJA+5D8MNwCm7wMIRt4uqBwzDnbkuhA/
 BigBXefkehv2MeTGfzTXA4VexgI0oLN/DORfreTeKZIYijXTwQIGl5QB1lt+ChrEmXAy
 8ZHJsHb+71FQjQaTs59Tvl+Lawd3p4Csb/f4JtRuj4SzOnIE8t0JwoKYkv0n66pN12se
 n1oe+G97VI2918kHf4tCb+rIvh8qSkUxggFsh5lJndM328vaTLLIJ+xN9gKmFe4VS7YB
 wp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lyNFAVFOZhMCCrZfvor1HjHIh8GYH8Avp+4JewVXcSk=;
 b=d5Y1BWd8vc6YIgQSWQ8vxkxstpNKsr7cg7rSx34OMVn4I5nhNeJKuOgj1jgvXSNrgu
 5DKFBN+s30Ejo4zWanwftD/9Vrb+xTi8sJSyL1UN+EGrCXeVMem0vzvKAM0GEOmB6zKl
 2wp2cdH/czC+VGjfpNrrpsyssFXjtIJgO+XEbjwibHB+mzYyQpFgTPQD5F71EHxm3e1q
 fsM4TL4UnFq8NiXsbhkO7mkQuhX4Ex7XaWBvqv2w51htmerjf3vxQWWCIvURbqM9DQTp
 VrN4tX0Cz0Xcg7NSBZKixt2ucCzzl6f8jituxszcnRtvSVT/eKc6oPXZXXs2qrJohLtz
 9z3A==
X-Gm-Message-State: AOAM533x/nMd9oG0NDKyrrpc9pCFLDnCbNlqTYIdphkoxw7MbVRq+Lmq
 GgwDyxDL3PE+fH7IALt8OdlsD9zYtdE=
X-Google-Smtp-Source: ABdhPJzMqtO0MhVrVFxDN3/7CvW+BZ+ydEc2MWUozxVVbOEd0YKFmkmdh8m4sYnh9ad2elMlkLGm8g==
X-Received: by 2002:adf:b318:: with SMTP id j24mr22030039wrd.84.1629896607889; 
 Wed, 25 Aug 2021 06:03:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g6sm5897562wmq.14.2021.08.25.06.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] target/mips: Remove gen_helper_0e3i()
Date: Wed, 25 Aug 2021 15:01:59 +0200
Message-Id: <20210825130211.1542338-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_0e3i() is unused since commit 895c2d04359
("target-mips: switch to AREG0 free mode"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-2-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index a58d50e40e2..c0f8a04b472 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1249,12 +1249,6 @@ TCGv_i64 fpu_f64[32];
     tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
-#define gen_helper_0e3i(name, arg1, arg2, arg3, arg4) do {        \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg4);                    \
-    gen_helper_##name(cpu_env, arg1, arg2, arg3, helper_tmp);     \
-    tcg_temp_free_i32(helper_tmp);                                \
-    } while (0)
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


