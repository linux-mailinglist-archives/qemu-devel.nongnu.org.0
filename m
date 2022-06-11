Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9925473CC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:36:17 +0200 (CEST)
Received: from localhost ([::1]:39704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyTY-0003qv-Qc
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQq-0001Vi-M5
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQp-00069b-7T
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id p10so1446475wrg.12
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SACkiBjVkJuP+3/mIjXwPAlOEqhF3Us8szON11U9anU=;
 b=iAioCFDEQhinfcPgPy8G8aFAALkgGPuQcs63e8K33ZfA5vo40n9p8MtJxDIpwsqeAD
 uyjaR4v1BUi4dj0hi2ThRf7NJMyXyI9ACD/qvONabwgh9gP+GfEfGnr1pRDt9QGx8JIK
 494rOXfvUL9NfG7VN0yMEBv5jk/wGePcI/jZMsTJRvIDNFQUarVzNWI61Ri3S01F0Svy
 9zmvGF0UgkJfFnzB+vfgycmt5fULR/cF2IWYwPfzCnTrAo266Fwcz03CZP3JZ8t88kDw
 6WkaiK20Lk3iNdRb46e30E4t3yjqJBbuukuKntSSrVD0zKy3oXeWZ405sn7sllbHEFpJ
 tnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SACkiBjVkJuP+3/mIjXwPAlOEqhF3Us8szON11U9anU=;
 b=xBQrciOSMWolvMx3WhMsswKFd0Hevj5HfT1wqt8fu8hZSkvUwbXWkgfzPfm94A0aZM
 TdW1kLem+Zu2PYYQ4aa7et81tpNXnaG36w7kkOiZ6/Vum5PffTpIv2ioua9QquIk49IU
 RLybNZCUcWj7mge+/R+jh51M1XEYQfPg6k8SKIE/Lex7riAo/iYimaxUQCpPh2y9YCIF
 xaJlUSPn5MbLb2fsRv2aMiQcMaNfMtqVBuDuTwOwglSzsOKRQB467eXJtNhfZxg2zNWJ
 rdu1QwwelptHe/itRiPkpQ2eLWq4F3k4OEaObOmRpnHHDErqqCkdn4+fUK3CqDeU8tPq
 kezg==
X-Gm-Message-State: AOAM532bK3q/Phits0xC26aZbSfmwyBUjFMOerLAghxPDWBvyONPh6tE
 z/90OseLSkjLFbk+FHkLXpffw4v1EVw=
X-Google-Smtp-Source: ABdhPJzJoRavryDW2x2cFaxYOLGGJAraAWaZWukTB/nSCeIKo9daAeUO31aL9kNqLlWuvuZ2P3uS0Q==
X-Received: by 2002:adf:ea82:0:b0:213:bbe1:ba4e with SMTP id
 s2-20020adfea82000000b00213bbe1ba4emr41560480wrm.387.1654943605310; 
 Sat, 11 Jun 2022 03:33:25 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b00394708a3d7dsm6269458wmq.15.2022.06.11.03.33.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:24 -0700 (PDT)
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
Subject: [PULL 02/49] target/mips: Fix SAT_S trans helper
Date: Sat, 11 Jun 2022 12:32:25 +0200
Message-Id: <20220611103312.67773-3-philippe.mathieu.daude@gmail.com>
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

From: Ni Hui <shuizhuyuanluo@126.com>

Fix the SAT_S and SAT_U trans helper confusion.

Fixes: 4701d23aef ("target/mips: Convert MSA BIT instruction format to decodetree")
Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220503130708.272850-1-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 7576b3ed86..76307102f2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -399,7 +399,7 @@ TRANS(BSETI,    trans_msa_bit, gen_helper_msa_bseti_df);
 TRANS(BNEGI,    trans_msa_bit, gen_helper_msa_bnegi_df);
 TRANS(BINSLI,   trans_msa_bit, gen_helper_msa_binsli_df);
 TRANS(BINSRI,   trans_msa_bit, gen_helper_msa_binsri_df);
-TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_u_df);
+TRANS(SAT_S,    trans_msa_bit, gen_helper_msa_sat_s_df);
 TRANS(SAT_U,    trans_msa_bit, gen_helper_msa_sat_u_df);
 TRANS(SRARI,    trans_msa_bit, gen_helper_msa_srari_df);
 TRANS(SRLRI,    trans_msa_bit, gen_helper_msa_srlri_df);
-- 
2.36.1


