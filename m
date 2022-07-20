Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F557B801
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:59:36 +0200 (CEST)
Received: from localhost ([::1]:34340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEAEh-0000hD-Aw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEACm-0006p0-S7; Wed, 20 Jul 2022 09:57:36 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEACl-0007GR-Ev; Wed, 20 Jul 2022 09:57:36 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 t11-20020a4ad0ab000000b004356ab59d3bso3491021oor.7; 
 Wed, 20 Jul 2022 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/p2k6r1VXhMALlnOhZRObhIjNw1QHNMYkzSVAkcLXy4=;
 b=ZfZNZ+C4iXea4fFmejZq47y+iwkQpZHddQZBprDdYyjHoC1Gg3v4vBPDfT3rcZqNJL
 CsJrEGQUdJaLnRsNIHGA+hhOB+71Oes1fTIfoy0Y1JUh/Gg0ActgWgy0aA2IXvg40oIn
 2mLpqNlC6Zo8L+bvbijM43fZ2/+nA1H1mgYw2cFYk/kNmGedQW16ibYLS/KdBX9Ei2ef
 v+qsRw5DXTWMIA/XBPMzWIqQ/e77bFOGmTyXMEiNpT0P1BYNPDQjzgXz3n7aRbT5VNEk
 8aQAiy7PzPiT5oXLbrq1Zh1mJd6fvjek9KU5smKChD1L0jv7Pzwvm5o92/JaJzGUxtcK
 3aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/p2k6r1VXhMALlnOhZRObhIjNw1QHNMYkzSVAkcLXy4=;
 b=kZE2hsNCqeUysKr6xs6YHxsOF6d3W6NX74fJmweE2YlcET0dqP7fU8xWVe8HsbKx2w
 aml4dNTLoRlu2JWJczp4sBwpNv1b0raImrRuk9coLsrLxIie4tEaFolE3ne2GB5bRIpA
 QmaIdoY8YMDMQKQaxfTD/wB1cWAq78SvzHfN69p2XCy6RG4TWnhzDolXbVAi4gqPqHVI
 zhx9nrfGCYR6oDxpv10ju+i5oltzfF5/gjEYoBDIes1YcAcRNK8pX6yzMvjjmKs0RAKK
 iBlYHGjce33s9XDrEaMxM3fzRH94O+Ia3OBqHdeX4RI45i/Q4kkFk9I6Ezc7ffunG4vL
 r7kg==
X-Gm-Message-State: AJIora9bLcZqAREbs7QG0GA3GQlgQs1kfg04RcwJwqdryyKlE5PltlZ3
 e8Teu/kwdarEvQWbYAHADD2tfXaARCs=
X-Google-Smtp-Source: AGRyM1tpVRPaL6di4gtlaAZ/tH1HwwlM9hv4EsoDovTrYL69FLfG9K8JHdhj8Nm2xPckhx2kZMdQtQ==
X-Received: by 2002:a05:6820:514:b0:435:9b97:b818 with SMTP id
 m20-20020a056820051400b004359b97b818mr5785790ooj.32.1658325453263; 
 Wed, 20 Jul 2022 06:57:33 -0700 (PDT)
Received: from balboa.ibmuc.com (200-232-202-163.dsl.telesp.net.br.
 [200.232.202.163]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056808105500b003263cf0f282sm6504885oih.26.2022.07.20.06.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:57:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH] target/ppc: fix unreachable code in do_ldst_quad()
Date: Wed, 20 Jul 2022 10:57:23 -0300
Message-Id: <20220720135723.1391598-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Coverity reports that commit fc34e81acd51 ("target/ppc: add macros to
check privilege level") turned the following code unreachable:

if (!prefixed && !(ctx->insns_flags2 & PPC2_LSQ_ISA207)) {
    /* lq and stq were privileged prior to V. 2.07 */
    REQUIRE_SV(ctx);

>>>     CID 1490757:  Control flow issues  (UNREACHABLE)
>>>     This code cannot be reached: "if (ctx->le_mode) {
    if (ctx->le_mode) {
        gen_align_no_le(ctx);
        return true;
    }
}

This happens because the macro REQUIRE_SV(), in CONFIG_USER_MODE, will
always result in a 'return true' statement.

Fix it by using "#if !defined(CONFIG_USER_ONLY)" to fold the code that
shouldn't be there if we're running in a non-privileged state. This is
also how the REQUIRE_SV() macro is being used in
storage-ctrl-impl.c.inc.

Fixes: Coverity CID 1490757
Fixes: fc34e81acd51 ("target/ppc: add macros to check privilege level")
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index db14d3bebc..4a32fac4f3 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -82,10 +82,14 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
         /* lq and stq were privileged prior to V. 2.07 */
         REQUIRE_SV(ctx);
 
+#if !defined(CONFIG_USER_ONLY)
         if (ctx->le_mode) {
             gen_align_no_le(ctx);
             return true;
         }
+#else
+    qemu_build_not_reached();
+#endif
     }
 
     if (!store && unlikely(a->ra == a->rt)) {
-- 
2.36.1


