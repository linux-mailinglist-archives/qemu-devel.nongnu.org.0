Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A3418304
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:03:47 +0200 (CEST)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9DO-00017N-B8
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU930-0001Mu-Jh
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:02 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92z-0006GL-0m
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id r23so11144204wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ZgxjKAzE6UdfxxfzQvSE8AG7aSTa5UtgwXRgJWAVhA=;
 b=Xv+ym7tFfUBtgVA+01md7SX15qw7/TVE7TjaHK21gsp2KKRGntBjyGOLGxPGPkrdK2
 uxme/6nVrD8Sp9NGxnGmC6dNVSl3ov35WUpHIwrE4QTUKbF1SID3UCNgRwrslwW2yKAH
 XNt5yXhaEdepuGTJQp6o8JpbTtzj+p3PU7TTRHTz0b5r4qsGVRyrW4gj1yq9C1wgvEMS
 YdCAoVbBM9kSAd9hEcQ4YwomxHhs7obAFsVIn5MpSFQLsfL6lv0xVEVWe5DycAM7bpfZ
 d58T0KK8RtEiIQ8uGmbF7Pzo0UoH/DjlTCb5+sKkeEfgrOO6uMuvaeQeCs8Pth+ucaJi
 0H4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ZgxjKAzE6UdfxxfzQvSE8AG7aSTa5UtgwXRgJWAVhA=;
 b=4UNKt828ynSi+F5W/g6gFpHqOfWmwm2fGL6xd4tlKFLwi2465UBNMedcdjcP03aG+Y
 Fkr87VZszv0qCzliHzlXJdNCnV201+ltf9+ZTHxnXbfgT2Kdakp8Cb/ym+/uP+OBdZYU
 rFhppUbN02RVUnjqlnIsj1J2u9HviXxqp/paOKZjgytpwpMEQoAbFdbSivYSjUYgrWK/
 lVPFAgGe8kGX6uGh+6dUx7VtLycC+TfTgAXN0J/+uaj+LIIY08iCqujj0T3vCHZFZ1ZJ
 0ZwyrzsoQRMZf9zeqlpUZzSVec9ZZFqgQicNTItT39Yh5j2wF2j7uOs/T0jqAvt2JDlf
 wPBQ==
X-Gm-Message-State: AOAM533A1uk/l0Ngg7PU6r/5uIDH0jdVJChQCQLcnGycWXr9gNFpKLAK
 DsuD6i0RquTGr+qVzJxjfe/+DZHIEjQ=
X-Google-Smtp-Source: ABdhPJz2f5tvfPyLDrCk7fzOlQAPXv0QRy4UqWF+B/SQYSlVQEZ0UtpAi9sdsGmNhq6dHGQe1I3ysA==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr7337102wmq.123.1632581579296; 
 Sat, 25 Sep 2021 07:52:59 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i203sm15757710wma.7.2021.09.25.07.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/40] target/hexagon: Remove unused has_work() handler
Date: Sat, 25 Sep 2021 16:50:59 +0200
Message-Id: <20210925145118.1361230-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


