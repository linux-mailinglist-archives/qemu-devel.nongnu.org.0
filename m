Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC12EE94F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:54:16 +0100 (CET)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeAZ-0000iv-R7
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkO-0003xC-0S
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:12 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdkM-0006Jk-Cz
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:27:11 -0500
Received: by mail-wm1-x32d.google.com with SMTP id q75so6843149wme.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwE+1tMMYcVefJ6sciUgu2/141uGXgmmBukddjUxPuE=;
 b=FtydMcjdMGQKD9mG0EnX1OWM2EX73q9GzjKg3RG0R955kQxCTbIk2jnYwfq3tkg1KY
 iQeU/c9FlM8f2hweexU4h7MP6f0Z5l1m2jvYzzjGnn0AC+ALR6Iil2m3kFjbrJ8mjRPW
 elIveV+tX7+NYvVSd7v4nPoviMAGE/u6VkPLwpj4iW4EBZ1m77N1FLAd+2xYwqXeZ0zP
 2gt3+jwjBxqUklzYYeaxaKpufeh1vlVKJurg0IcrfkLmBf1UgghMQ2d8tCYLvKYkkYbi
 c2hMVmE505gcVsakevWMK6VQme7rLc+yJGXHU2omR6yJDtwUTN/v1is69qPHK+be8nH3
 ouug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lwE+1tMMYcVefJ6sciUgu2/141uGXgmmBukddjUxPuE=;
 b=h6PmHkksO3JR7hpPer7PmifJr4ln/GV3bOcamg0HAALHVCveBzspODJPcJ3/f/UiZD
 3QYkP28yr85e8j/vYTsFwiJcuyFw1jaC/ob3Iv6RRcItoe58apUzQ+n+jivSn0yg/6At
 TFTML3kobC2cqH0qcMaewWyOglZxdoeNnBI5VpBqUSo5roGHQpZjIOIArhreLmo2AXz8
 FgQLOMe1+Bcxytss0naBvCp7gzvtpqiIVygOLGzZa8QYtcIlx4JNopCu8n64bi3Ke4l0
 rF8UVsFoV7rQHRrDX3jxa5OFA2gFysw8IrViDWY+1Mekl7bazDJ8gbbn2F3uvrD0PLrK
 /0rA==
X-Gm-Message-State: AOAM533zozqvsfYUQnyD4Ou8s2NwURKBUZKS2P432tGWhBN0qxAe8kAz
 SHdnchc8Ni56bTK0k2AFo2FkwIE+s7s=
X-Google-Smtp-Source: ABdhPJyuhUKSjnxmzTAuIU1deebNQKXXaS14b97GAjx9A7kMfekrdrz6IK3CUxsMt03XGVdSqoRC8g==
X-Received: by 2002:a05:600c:cc:: with SMTP id u12mr547735wmm.42.1610058428920; 
 Thu, 07 Jan 2021 14:27:08 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j7sm9627579wmb.40.2021.01.07.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/66] target/mips: Declare gen_msa/_branch() in 'translate.h'
Date: Thu,  7 Jan 2021 23:22:36 +0100
Message-Id: <20210107222253.20382-50-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make gen_msa() and gen_msa_branch() public declarations
so we can keep calling them once extracted from the big
translate.c in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201215225757.764263-18-f4bug@amsat.org>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index b9cd315c7f4..c61c11978c2 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -164,5 +164,7 @@ extern TCGv bcond;
 
 /* MSA */
 void msa_translate_init(void);
+void gen_msa(DisasContext *ctx);
+void gen_msa_branch(DisasContext *ctx, uint32_t op1);
 
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0e7b2abe8bb..e1763e5bcec 100644
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


