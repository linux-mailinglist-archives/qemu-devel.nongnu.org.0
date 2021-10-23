Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135974385A1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:57:55 +0200 (CEST)
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP1W-0001mn-1v
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsY-000485-9X
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsW-0005Fk-Rr
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so8245730wmc.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tM4MJo3sim3ey0DXA4OE2hR4tKFsgTw872VtuFCw7eA=;
 b=bflYF1tF+4PFskwz+8rX8hBFsLGMYy2h0U4QaijKiHYPXjixIYCwSJcvO5vDKrPSip
 oIVPISCsxsFcmskXoF4TM6NVP2K5RXvXvl1tiYfqSESH1rPRoRtaO3cqgrK8cdDhU2a9
 pc3mU8HKygILMJiIXjNvfNSdrMkoP4/MSAo8qx64cDG+h6jUJbX2mPWZZPGvIyr0Eg9o
 qJzwA+ZtqzEXxC+h7w4EzTPyJaVXu3/HRwTZynM+TuGqhVLqnP2bl2Mhg9Jq/cp/UWFD
 TxBrX5HovbNfWlgs5YGgT5KeEftW3rTQABudAguDrzZELIU7bjsmrmj2Zokm/9OSMz0U
 9XKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tM4MJo3sim3ey0DXA4OE2hR4tKFsgTw872VtuFCw7eA=;
 b=w1dO5gVKQ/wb/nWF91sAn3850FAg9W7iDKq/KyG0rrjg0OBum5O3R4wMBaVcm5wfex
 CuBaCQKjiPwd4XdfUdIktHqEZnU8Zgj/C/bVTg62dUbxbPuW1x45mxJ7HNxTIz+yZMlf
 VVYqbKzsB1dbe06rNZ3EA3A/EUub+8pwA8J/whovBem1jom8yZ2dGdVrz57WMUlXq8A5
 LkVFLbDYbAEqD1RtT64gvgWJVjzrnxUXzuLd2mfAFHQZ5wwJGCwKFyOzUE8Cf9iPi20H
 y2h4quxHZvKOHBLXWLfeVLZCW5Rdx/T6vsaAEFOgtRR3pV5YO7/WQmajUJVZGbNo58Td
 ScXA==
X-Gm-Message-State: AOAM5324W+oXdLGQg50grHuvi10kXhw2xtzQu3bdTZ1XFv5tMXo7Hae2
 ohayPEJc94FB+llfs3uiT4xuNUuOqt0=
X-Google-Smtp-Source: ABdhPJxht9QSdJHaeqrhEumTPCfKMXya4qVegwBNU8untG18nmDdOH4a8m0t0ltvRUO3GRKBkXGixw==
X-Received: by 2002:a05:600c:1c21:: with SMTP id
 j33mr38522157wms.163.1635025714920; 
 Sat, 23 Oct 2021 14:48:34 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j7sm15354133wmq.32.2021.10.23.14.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/33] target/mips: Use enum definitions from
 CPUMIPSMSADataFormat enum
Date: Sat, 23 Oct 2021 23:47:36 +0200
Message-Id: <20211023214803.522078-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace magic DataFormat value by the corresponding
enum from CPUMIPSMSADataFormat.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 9e0a08fe335..1c4a802ff55 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1801,10 +1801,10 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_MULR_Q_df:
     case OPC_MADDR_Q_df:
     case OPC_MSUBR_Q_df:
-        tdf = tcg_constant_i32(df + 1);
+        tdf = tcg_constant_i32(DF_HALF + df);
         break;
     default:
-        tdf = tcg_constant_i32(df + 2);
+        tdf = tcg_constant_i32(DF_WORD + df);
         break;
     }
 
@@ -2033,7 +2033,7 @@ static void gen_msa_2rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(df + 2);
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
 
     switch (MASK_MSA_2RF(ctx->opcode)) {
     case OPC_FCLASS_df:
-- 
2.31.1


