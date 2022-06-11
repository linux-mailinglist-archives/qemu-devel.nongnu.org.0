Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E95473DA
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:40:42 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyXq-0001e7-0u
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQv-0001eE-PO
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:33 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQt-00069s-R9
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id m24so1462912wrb.10
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LUQm1G/YoYYdcDAMpdSCPzpkrH7lQMIOWr/thgjiHhg=;
 b=T6x7iklRF5UEQo0T1o5mZMWyEcL/yDByZ27juKOiXmqCVAqqjt5n/1NRNnvOX/F8hC
 4KEguKQqfC1qpkwXXDzN8f5P/WueIKWj3B3NDW546q05rOLIPK5WlQpiFPurue2/Igc4
 XBMRbqnEv7rkSkK9qNAcX1U2ogHm2RCLe7ApkCo1q5WT9paNt7k3UZOUYzxblBdtbyce
 QxsYDHn4xFzPaYUV9P7ZL6Q2CbNKKX5U/ZrH+fugqu86hVWVRTM7ubQseAIj4I0TvMv8
 exfN6x53hnecN2XJ9SxQjpcY+jZWDIv8vhHY2OMcTQHoxVGdYOTI74GBIUSI1FvHjVjR
 KB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LUQm1G/YoYYdcDAMpdSCPzpkrH7lQMIOWr/thgjiHhg=;
 b=wWcVVcKPraU5PgNel8lzaUOUC/quj7H+HVkJFk6GKHVppWdrVBy8R+cQbHPAfsQ+qp
 BmNVH57h36vzkJbwBvhDXpUsplLlE9RcsI9SyXTmRhbYgUFZ2RdOOtAjK7rIyOzh8Ozk
 G+KCho3wulcsyMQh5Auw/KgO738ulM5bhYClL1a4hP6TXQsbKd9yhEVC7b3WTH21qAs3
 5gZ2Zad6HSR8d2ROq0K3HjCHIObICChOsgYpKsqenqDlSVTtCrrjV9R7bay+xVbZqU+C
 c0IBDqcUXVYHd78sRCkP9gTm1lNdho+kP0j7r3FfqHshffb+7tk4tzKaNm2miYc+Xdho
 UmqA==
X-Gm-Message-State: AOAM530bFPtg2cF8AyQwtCND8wAbFisXNDZzgjv1/2AnOzhBqe1QIL0V
 7Kwmg2rSMJD7DAukyEJE9txDfRRAfsI=
X-Google-Smtp-Source: ABdhPJwKsxTOHLr2vDBA602rrKc4c+ipLXF2RlBtvNVy9rrfPdjAFd0YwccP9SVy08rS/Xjs+qTtJA==
X-Received: by 2002:adf:dd8e:0:b0:213:bbe1:ba56 with SMTP id
 x14-20020adfdd8e000000b00213bbe1ba56mr42076062wrl.559.1654943610331; 
 Sat, 11 Jun 2022 03:33:30 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 b18-20020a5d5512000000b002103a7c5c91sm2189074wrv.43.2022.06.11.03.33.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:29 -0700 (PDT)
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
Subject: [PULL 03/49] target/mips: Fix df_extract_val() and df_extract_df()
 dfe lookup
Date: Sat, 11 Jun 2022 12:32:26 +0200
Message-Id: <20220611103312.67773-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

Actually look into dfe structure data so that df_extract_val() and
df_extract_df() can return immediate and datafield other than BYTE.

Fixes: 4701d23aef ("target/mips: Convert MSA BIT instruction format to decodetree")
Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220503130708.272850-2-shuizhuyuanluo@126.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 76307102f2..aa45bae0aa 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -68,8 +68,8 @@ struct dfe {
 static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
 {
     for (unsigned i = 0; i < 4; i++) {
-        if (extract32(x, s->start, s->length) == s->mask) {
-            return extract32(x, 0, s->start);
+        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
+            return extract32(x, 0, s[i].start);
         }
     }
     return -1;
@@ -82,7 +82,7 @@ static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
 static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
 {
     for (unsigned i = 0; i < 4; i++) {
-        if (extract32(x, s->start, s->length) == s->mask) {
+        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
             return i;
         }
     }
-- 
2.36.1


