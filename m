Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA65473E2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:44:12 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzybD-0000JG-JD
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRA-0001u1-Uj
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyR9-0006BU-FP
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x17so1480821wrg.6
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GoasRVFb2BlfBxlq+erSiANRPbzQryTPUnnof92UlaM=;
 b=p3jLhGBxIRgGn1aPrI25Qp3/H3CWeZC34gVcb+fGrVJI3Yd6AlhLxJz4GSl6eI/7ck
 Suvuo7Bk8nmEfxqEs64QnzBPxxoojWuDM//NSY1qzHCqUdteWHLqGMXDaCcg6oTAkovw
 oxMn2Kx9AzejsqO0KLWPz/TdAjowARvxAnIu1mrkwcXueHMrrZT0wwkKquepTf+dUao+
 CbLjOwP5SAhkbYcMhFK77ajTBx75bn4iGIPi2EE0SH3E1c3erx4xbQRoUNlFB2bHpnal
 eRb3CmvWbP1bSl6cl6lYhkeXtYVhNR5agZ4hRa58vE5tyOOOyLcceUg136sXGHWXtoba
 xXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GoasRVFb2BlfBxlq+erSiANRPbzQryTPUnnof92UlaM=;
 b=VFlle4gLNSArUP/WBhB2hkVWhQLSmKkzMVOi4V5vuTnPTC30DGYwkesmEmxXSNOtWr
 EgZYtQl9Uu05Omdj0IhYAdAtZKsy7PhNtYSF5SbMa5quYw+u9BcJ2YZ63BVDBrMP7BMo
 pC4NSb8ftnG6sDJm/4ZSfR4GYF9krL37vyBbNiQVeoUTfBCFt5/7HGqVHOGBhrvdxy9x
 WgENi3hH+ey1CebwAbczfjfF5dtI9K/3ApjwsK1Ol9VrEFDTOWDqRwaLSkd6Oqxm9KnE
 9K0t7FqipCJ0t2z+SbtekH0Rf4coeF2OR5pby8GnB7Of3kcWJS796uibTIWhKk0s9BHf
 2CZw==
X-Gm-Message-State: AOAM5310JCImZjxgZfHSdPdS76FZwN+aKf2TBtzlKIQAIpLqk4OODXCt
 B6pJhRuw8p/8Y1RvdTW1Q6m/IGPs5Xc=
X-Google-Smtp-Source: ABdhPJz5zAej6VJX0qqxCsNHSK6iBmv9EHalf8lJhXQzQt/fDlweUwC8C9E4+cY/PX6lYS4b9pmf1Q==
X-Received: by 2002:a5d:47a4:0:b0:218:5829:dced with SMTP id
 4-20020a5d47a4000000b002185829dcedmr21151077wrb.56.1654943625879; 
 Sat, 11 Jun 2022 03:33:45 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c190700b0039c4ba160absm15116177wmq.2.2022.06.11.03.33.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:45 -0700 (PDT)
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
Subject: [PULL 06/49] target/mips: Fix store adress of high 64bit in
 helper_msa_st_b()
Date: Sat, 11 Jun 2022 12:32:29 +0200
Message-Id: <20220611103312.67773-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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

This patch fix the issue that helper_msa_st_b() write high 64bit
data to where the low 64bit resides, leaving high 64bit undefined.

Fixes: 68ad9260e0 ("target/mips: Use 8-byte memory ops for msa load/store")
Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220504023319.12923-1-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 4dde5d639a..736283e2af 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8329,7 +8329,7 @@ void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
 
     /* Store 8 bytes at a time.  Vector element ordering makes this LE.  */
     cpu_stq_le_data_ra(env, addr + 0, pwd->d[0], ra);
-    cpu_stq_le_data_ra(env, addr + 0, pwd->d[1], ra);
+    cpu_stq_le_data_ra(env, addr + 8, pwd->d[1], ra);
 }
 
 void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
-- 
2.36.1


