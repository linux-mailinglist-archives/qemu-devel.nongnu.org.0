Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8B2DB70A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:16:45 +0100 (CET)
Received: from localhost ([::1]:52746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJYi-0003WH-8E
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJIA-0005UJ-JE
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:38 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJI9-00040l-30
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:59:38 -0500
Received: by mail-ej1-x643.google.com with SMTP id 6so15409695ejz.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 14:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0eQHnWDCrjwoYyD2yN62FwRsv+ZXJP/kwuNsrV3YJo=;
 b=F7NZPZDcUD7tQQF+lbqopiHIMiK0uojWbK5lxme/6/QwRVdisEFjXjK30abUTagZXW
 MAaXJ+db8S92MqrPy5QO3u0hGHbUFtwKXJ6BHpi1jNULSWpvzQ0IhCLIpD/iI5WxRxGM
 c+MlCtM3XmsTpdqXphE/Tj4bPAk90PXAZbGCnhtNHTMxiJ+k05G0I/kW49VCBccTMOLp
 8/H0CXssXcWyuchAPMNZN0cdOujx5+0Kimv/iJ7Y8l78p60InnmSokUwR2aFXnOymFu9
 Twpb+jiUkSxKSbi22WC5cz0yTqIF5KWGan9n9eFhwx6EM9mQPm4coPvCiskhjLIGrYOR
 gnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e0eQHnWDCrjwoYyD2yN62FwRsv+ZXJP/kwuNsrV3YJo=;
 b=PEgdZiiYByMbPZT2ZBRx4BSDdH0NwJA8vRxPQq12B1Lcm5yurrsDDQVCzH4jEovFPj
 4HMmeXpJK6hnrhrCaqhkbOXYXCU2O4+BUcMaybplVFzELFfdk0BDnxHOsN76IG0TXDXY
 dZ1qGtFB4OZHQ6StdLdZjoLpgWslx2dVvSqqiVHSbNWfhyciWQqe93OTy0O+5qDk5DmZ
 kqjcnKwuCqOaDNU+gmgCiP6UAoufUc0wAbk9WIpAXqoxjkPnOdq/TsomIUDqUIwBO6cY
 Lp0Iehktfj3GeKZgtUR4sklHqEpnpscQuyoeVoIvlD0xUjpAfeXlsWAk4O1a5RtMJe4r
 eLDA==
X-Gm-Message-State: AOAM531QeTsxRnWIG9x5/rYAFquz4xwSoDXqaIIfyUshcnn1BgEY55HG
 m5BoU0QaZ0dDryhEXwyvXXw=
X-Google-Smtp-Source: ABdhPJwPcNZNoZhcI0FGmQqk+wdxQUMkkCOBpxFi85HJfy6say6TGZ/z07taAzNCIIXoMUj0zpr8VA==
X-Received: by 2002:a17:906:aeda:: with SMTP id
 me26mr3583681ejb.11.1608073175960; 
 Tue, 15 Dec 2020 14:59:35 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id s12sm19874597edu.28.2020.12.15.14.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 14:59:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] target/mips: Declare gen_msa/_branch() in
 'translate.h'
Date: Tue, 15 Dec 2020 23:57:50 +0100
Message-Id: <20201215225757.764263-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201215225757.764263-1-f4bug@amsat.org>
References: <20201215225757.764263-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make gen_msa() and gen_msa_branch() public declarations
so we can keep calling them once extracted from the big
translate.c in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index f7e7037bab8..77dfec98792 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -163,5 +163,7 @@ extern TCGv bcond;
 
 /* MSA */
 void msa_translate_init(void);
+void gen_msa(DisasContext *ctx);
+void gen_msa_branch(DisasContext *ctx, uint32_t op1);
 
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9be946256b3..20174c4aa57 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28660,7 +28660,7 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
     return true;
 }
 
-static void gen_msa_branch(DisasContext *ctx, uint32_t op1)
+void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -30436,7 +30436,7 @@ static void gen_msa_vec(DisasContext *ctx)
     }
 }
 
-static void gen_msa(DisasContext *ctx)
+void gen_msa(DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
 
-- 
2.26.2


