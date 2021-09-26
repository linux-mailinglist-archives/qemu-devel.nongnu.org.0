Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870B9418CE1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:48:50 +0200 (CEST)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcwz-0007yq-J7
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdn-0003VT-SC
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdm-0006LS-C2
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id d21so46372687wra.12
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ZgxjKAzE6UdfxxfzQvSE8AG7aSTa5UtgwXRgJWAVhA=;
 b=hKTY54pQUf9p8sCU+LT0l/n9Nuvnz8Dnxeq+61FnvOvhyqmRpiovoOQ3XfEa00vsue
 Dy9HsjL9vABcH22zmlSaChPAWaV3TfE712ZcfwlAKSwBF3cMRy0GAKlyvbEQmmGJxMXM
 cdZyF4GnRIOWZQj+rsW/hN9kqZNYnu8Tag1lLqqk+A/ig/5EwAUPS0t5PwF8QwdulKVa
 p9Wfuj/3wqB6rvD9YNTgqXWAX1l6FZazZykDSr7UvJwy5RlftAh9+i+pR8lne24Vm8UJ
 3FjVI0LkAIEmtE3n+7oOGdmPXiHkjtLBICGpectl6Q5Pup406Z/GesgbyfcTaTCYWO+B
 kEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0ZgxjKAzE6UdfxxfzQvSE8AG7aSTa5UtgwXRgJWAVhA=;
 b=HVqLU4PH0xOilx28rTy8ooN+uirw1kBzSMc/vSFuQsf/f4ILm7zV8WEaILSUMlBNfJ
 Yif0KryX50z100FejefE4u816EtjaAuR1X1qHeBeeITPCREDhSDjQbQc/lQIptiMcqH0
 BN3pWSbnIPMnl3Kj6wYUHKa0tvfNa6vn9kJ+6tH0JfIQA0qWhqF5y4VPwTuUzifTmDih
 PjhMAeRQQlF9aePOtJDSdJrsVCuJRuArRY1sd5ylejAPXQEVvi1rO6nZsKOOHC+pPE1I
 aPrPFt1MfqRID/dExaKzLBub7w94Cd8fV4nUyIDjrqZuQgGUl4boe42BelXswq2lNmA0
 NctA==
X-Gm-Message-State: AOAM533+B5dbPC24kPKa79gjwgyQ5jisDp8ROmGuU+ZrNloW8bSVMQpb
 BLaTP466ZN768yuRfH5KqhDov4PWJ7Q=
X-Google-Smtp-Source: ABdhPJxvhv9a7IWS+6OFo336SnZ1uq7uHzXnggWgqDSwenhzeAqcGZyPc4JE03TUsPJ8YifSiSy4eA==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr12523678wmc.152.1632695336892; 
 Sun, 26 Sep 2021 15:28:56 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x9sm6164154wrv.82.2021.09.26.15.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 21/40] target/hexagon: Remove unused has_work() handler
Date: Mon, 27 Sep 2021 00:26:57 +0200
Message-Id: <20210926222716.1732932-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
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


