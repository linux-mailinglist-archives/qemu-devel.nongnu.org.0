Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB145473DD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:41:37 +0200 (CEST)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyYi-0004Ls-B8
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRZ-0002nP-Kv
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRY-0006BC-7t
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id o16so1489527wra.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gC9YGRG/tq9ye99In2Mn5dKXrLY64Et8KE1X8rj2WB0=;
 b=qb9xBT3fYYcMgrTYqBUC3kkXbcj90PmI005eZRr5/uiOioEkPwzPr7mOnLS2hdP5eN
 QhmlGl5FdcG31/xUgOdTlaHxNoL+4i8y8davtpTtJJSgwmMVxwja9MIzAAJchGOZOzpd
 ZSvz8qYS5rYRLu9iPMs9RHMs5O4et8n3xkOgHmq8uxjjIOackDF/J8TA10w2hBo5/5da
 /vLgE1MP4IzYzhM+DtznBNTdg0wekh7awVJhIpELDk7/BeI1wDdhv/TihuoTov3D2GvP
 kx2nnaIz9PMyngaNoV+rjG5lqNYp6IHfCUx3TeBG//QzjMeVN5mUExMDhMyr4UBGvPNp
 NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gC9YGRG/tq9ye99In2Mn5dKXrLY64Et8KE1X8rj2WB0=;
 b=uJ6w2TdMaZBAonVl3WaBfp7rYqRRDCsFWNUe6o/hilsUKY7zvNKQf0TLL3DwD1RYAm
 Og25vkOQjf/xbUotEMZpKI5BeLGCjek2XvFElGaL6LCFXSfIAqInmbZAXay5Gr88oiq1
 rHk3q3YetHjFnENpZlg5yQI1bm/ApdTT6H/uu0aBIAy9hMTWgZo7WlKeegeSJmMA6vCa
 lK+loktyCdsWUQVJfkflM0GZGRkHgCqb7a7IqaYY0BhCpy4k+KFHk2g3I3u7kSavtXK8
 m5sG9EMc6/lpFjn+RfbrUl4zBwA0STkt9bLZBh71PhOH5AiqercnqtFF4YP3JllfCmd8
 5HoA==
X-Gm-Message-State: AOAM53348WwAtgw15LhuiAnT4okF6SfQL5uXjA3jss1J1Y7GmEhiynPX
 3G5Y1JivOXnaB1OndQ8LedIz0qRrdsc=
X-Google-Smtp-Source: ABdhPJxtPv/dti940qyu6CQ1iVdYgbBI0PRlCYsU2CAhuwsnI3oegFIWOSAtOO2T/gujIfgbjin24A==
X-Received: by 2002:a05:6000:1e04:b0:217:88ff:eb86 with SMTP id
 bj4-20020a0560001e0400b0021788ffeb86mr34392980wrb.351.1654943651332; 
 Sat, 11 Jun 2022 03:34:11 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 l12-20020adff48c000000b0020e615bab7bsm2166636wro.7.2022.06.11.03.34.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 11/49] target/mips: Fix emulation of nanoMIPS BNEC[32]
 instruction
Date: Sat, 11 Jun 2022 12:32:34 +0200
Message-Id: <20220611103312.67773-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

If both rs and rt are the same register, the nanoMIPS instruction
BNEC[32] rs, rt, address is equivalent to NOP (branch is not taken and
there is no delay slot). This commit provides such behavior. Without
this commit, this scenario results in an incorrect behavior.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504110403.613168-5-stefan.pejic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 941cfaa6bb..1ee5c8c8d4 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4528,7 +4528,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             switch (extract32(ctx->opcode, 14, 2)) {
             case NM_BNEC:
                 check_nms(ctx);
-                gen_compute_branch_nm(ctx, OPC_BNE, 4, rs, rt, s);
+                if (rs == rt) {
+                    /* NOP */
+                    ctx->hflags |= MIPS_HFLAG_FBNSLOT;
+                } else {
+                    gen_compute_branch_nm(ctx, OPC_BNE, 4, rs, rt, s);
+                }
                 break;
             case NM_BLTC:
                 if (rs != 0 && rt != 0 && rs == rt) {
-- 
2.36.1


