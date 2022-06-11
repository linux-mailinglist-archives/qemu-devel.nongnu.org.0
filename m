Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955465473DB
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:40:44 +0200 (CEST)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyXr-0001k3-LH
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRF-0001xd-Th
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:53 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRE-0006Cm-Dx
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:53 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso759667wmc.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DGNhLhGMFXQBby0dxvCxSCWiyVyDO+c5E5Fgg3cWQxI=;
 b=JRnDMAAcBqpXBJ71U/rOU59tZ3Cj55v4d8/mRkoA3Ojra5KF9vfOg5E7M7IsvhIE/6
 CZeNBoPgJjmpW6bqJe5j3DQBgl2k4hon+CuINkUAmu1oqA1lH7ISqyP8okMzD7N6kbC3
 rB/06cMLO60iyWs015v8PP2SO1r/4hqW43QE18ski3blKAVmdew+UJaQoLavZDHW7m4t
 R8T4XjvyveKZJhsRCHr/0PzyXHJxkDbeMUOiNQ6mmvujyB9Y1Vj6YEsNWIxfAiOYXjs1
 nF0HWBUf7RuKfFrNK14QdMF0UlPtCvHCb4Qq55AY45Kqiy09iuOBHVaNd9di0X3Hu4A1
 TwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DGNhLhGMFXQBby0dxvCxSCWiyVyDO+c5E5Fgg3cWQxI=;
 b=wYDnQDq2krxfSXNfWHYdlFpC+cZ2u5QuM6ZIZPosK9ve3PADc7PlCdPptA+kumnwnZ
 7CSJnAAZU7Ilg6fHFUsjN/G+6rTi3Cn3kaf/0N04pnC3q38tlzdplBKIocFSQJy6B80w
 BvHqnDzDrE3NyHKX/sh5n/C9YX/KaGAHqizhy4dBsSxgpFSdcQWpHELeiKHWUCVa2S0m
 LM8aIRrn2zv0EpFF6+drAQAY0PbxiEZw97KalZuKoPFfn1zIAEiKzPjaIhGSUASeucWM
 URXpza1C5IcXlcSYlR3Ol9NMzMG98hRPHVRJr0mi9Pmt2Oz6h9quD6pSYBn/uqBXWHD8
 C6Gw==
X-Gm-Message-State: AOAM53348Q4R/g6vBJlXM0YYu0QOnUgSMq42UzKRvOFVvYS4h4qOzB9S
 1lO/bk/17xfTjBiofq0OAtJuqpIa5Wc=
X-Google-Smtp-Source: ABdhPJyhk3IG6upFrHunpm74c5wFfzT5H+o7wyyc5SnoxTr9QDPKhvj05FvUSIvJn360WpgYORQ2VA==
X-Received: by 2002:a7b:ce87:0:b0:39c:5509:660c with SMTP id
 q7-20020a7bce87000000b0039c5509660cmr4105375wmj.163.1654943630999; 
 Sat, 11 Jun 2022 03:33:50 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 n10-20020a056000170a00b00219fb3a275csm354824wrc.16.2022.06.11.03.33.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ni Hui <shuizhuyuanluo@126.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 07/49] target/mips: Fix FTRUNC_S and FTRUNC_U trans helper
Date: Sat, 11 Jun 2022 12:32:30 +0200
Message-Id: <20220611103312.67773-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

From: Ni Hui <shuizhuyuanluo@126.com>

Fix the FTRUNC_S and FTRUNC_U trans helper problem.

Fixes: 5c5b64000c ("target/mips: Convert MSA 2RF instruction format to decodetree")
Signed-off-by: nihui <shuizhuyuanluo@126.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220503144241.289239-1-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 0b3dd0957c..1bcdbb1121 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -752,8 +752,8 @@ static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
 }
 
 TRANS(FCLASS,   trans_msa_2rf, gen_helper_msa_fclass_df);
-TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_fclass_df);
-TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS(FTRUNC_S, trans_msa_2rf, gen_helper_msa_ftrunc_s_df);
+TRANS(FTRUNC_U, trans_msa_2rf, gen_helper_msa_ftrunc_u_df);
 TRANS(FSQRT,    trans_msa_2rf, gen_helper_msa_fsqrt_df);
 TRANS(FRSQRT,   trans_msa_2rf, gen_helper_msa_frsqrt_df);
 TRANS(FRCP,     trans_msa_2rf, gen_helper_msa_frcp_df);
-- 
2.36.1


