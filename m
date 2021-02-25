Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77D325556
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 19:19:03 +0100 (CET)
Received: from localhost ([::1]:44198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFLE6-0005Xu-2A
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 13:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFLAQ-0003kY-SC; Thu, 25 Feb 2021 13:15:14 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFLAP-0006O9-17; Thu, 25 Feb 2021 13:15:14 -0500
Received: by mail-ed1-x529.google.com with SMTP id w21so8102172edc.7;
 Thu, 25 Feb 2021 10:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dl0mZd6ygProVAlJgebF4l0L1V53QkSvCL3swFpdz08=;
 b=QBgHrquIG1xd3uPWP1pioJbh31ygbBt0OnEBSLrW9CFcqlNnnSJP8kY+M4/I9rZKbQ
 ydXgKJL/z5GiaBydemlXXjCFsfXejSOP1m9Mn2yhTVraBs5KGZ49YNG3OQs97EN5DgCi
 MA0NOwArUnpXE23fdNEpDilJY63WY5QH9lNtk9Awa5mOLaoHxVVMds7G12nTRVZYcVVE
 XMRjBRghC5bULgTgjjbriWG+oYoSrCXer1KigrF1+cAbeEP7yHDV3jHWRF0VwYgN+yDi
 qqWZTfwrxjC4Pgp4HY6753BucAJTSNy0i0YiB4nIuokCfBVwHoM/X/Ru/IR2VNtrXi/n
 nP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dl0mZd6ygProVAlJgebF4l0L1V53QkSvCL3swFpdz08=;
 b=QylNYyqkiUkBUSgknJtBzStPXOrwzLuaQmwTHTb2/H0zbsSyhYppHSpA4JNVE4dfL4
 +qrNrWY8beNyjnF3USJu+FmQQR7Ebb5LlNeEbJjImPfFuu2ee1Yv5KnipeQepuXtq3A4
 MiM/F9+cbxg86Qd63m/SKA6fiNh/hrKgHPQerzRdGJZS/LEJGisadEqkZypTDsA5zslS
 hn3k68UhM9NQYJUZcYmJ5Aq+sZHNYx92f45sQJqvtS5NorTmQRnLn3HbUkalv5/jkkbY
 D8LXF0dMIxthbp1MhbrfCHMqKeBBJ6LzfJrrLhiTXlziztJY7oneb0g8L87ZM4LlavHp
 x/Og==
X-Gm-Message-State: AOAM530B5HELhTv5EkkfHU14KKOfcJ67rFcjC4QlQ9UF/iT/2Kamn4qo
 S0Tydd4zJTzjzUkotVojVSnjZlgD0bo=
X-Google-Smtp-Source: ABdhPJzD0UgHUzyVckvu4lU+lTwrwHmiKmYkXJqLQ4/kAqpVvv4zw28tKUmssjzCWYw77igo3VAyVQ==
X-Received: by 2002:aa7:d315:: with SMTP id p21mr4290616edq.300.1614276910360; 
 Thu, 25 Feb 2021 10:15:10 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ec18sm3414916ejb.24.2021.02.25.10.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 10:15:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/hexagon/gen_tcg_funcs: Fix a typo
Date: Thu, 25 Feb 2021 19:15:07 +0100
Message-Id: <20210225181507.3624509-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-trivial@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/gen_tcg_funcs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index fe4d8e57303..db9f663a778 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -35,7 +35,7 @@ def gen_decl_ea_tcg(f, tag):
 def gen_free_ea_tcg(f):
     f.write("    tcg_temp_free(EA);\n")
 
-def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
+def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
     f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
         (regtype, regid))
@@ -54,7 +54,7 @@ def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
                              (regN, regN))
         f.write("    }\n")
 
-def genptr_decl_writeble(f, tag, regtype, regid, regno):
+def genptr_decl_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
     f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
         (regtype, regid))
@@ -78,12 +78,12 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    const int %s = insn->regno[%d];\n" % \
                 (regN, regno))
         elif (regid in {"dd", "ee", "xx", "yy"}):
-            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid in {"s", "t", "u", "v"}):
             f.write("    TCGv %s%sV = hex_gpr[insn->regno[%d]];\n" % \
                 (regtype, regid, regno))
         elif (regid in {"d", "e", "x", "y"}):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
@@ -91,7 +91,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    TCGv %s%sV = hex_pred[insn->regno[%d]];\n" % \
                 (regtype, regid, regno))
         elif (regid in {"d", "e", "x"}):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
@@ -101,14 +101,14 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regN, regno))
         elif (regid == "dd"):
-            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid == "s"):
             f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
                 (regtype, regid))
             f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regtype, regid, regno))
         elif (regid == "d"):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "M"):
-- 
2.26.2


