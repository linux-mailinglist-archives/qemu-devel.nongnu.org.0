Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4365044AED
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 20:43:08 +0200 (CEST)
Received: from localhost ([::1]:43600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbUgl-0005il-BM
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 14:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlI-00042v-Hd
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlF-0003JL-6R
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:40 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37697)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlD-0002Tk-6Q
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 12:39:36 -0400
Received: by mail-wr1-x441.google.com with SMTP id v14so21495436wrr.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 09:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m4A8CkEbvWMmQVuN+nzRQmfo8pG9vjNNLIpgsnrjjCE=;
 b=Rze6OFIpxfV9Ip+R9pQrienaQuKkDljMUJrRsyXJdxi5paKGRxOQ6m1gxUOPuD7vgG
 V6Lhs/eJjYMwGNyq/jeJ+n+6704S9IshlaZFdy077cc0fAmzwEhJiBXDjVU5git2AeIL
 rNpjc4Bg5WWBPl+PEYHvAWn5YyO3JUylapDrytHxuFlweT6dzybXloOB19W+WP87rHy3
 QNgwXxF1wKLlAMv3QiBbtZqDTNTqkxSS5xagkHZsI8g6CsSMGACoawYVr9w9zLInqXLj
 nR4hMI4ZZt7/9HInJxMTP95rUIflNk9iV5ZeW1HRICVLM1BLTrIV654ZfovF9F921SYR
 vgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m4A8CkEbvWMmQVuN+nzRQmfo8pG9vjNNLIpgsnrjjCE=;
 b=S1RQjM87hYnem+WOT6IWOsmADTXlLMq31HOysBrbLJV1OTJEieQfXL9csX/jPLE23y
 HnDjFDJnij/BWIR35yfkWlM0I+8gVmPRYiZiFlTNOpwuI2ScjQXlx8YQF+53ek+WylMq
 EbTCb3CT6QrTQSq96/y54S+qMbmDvKAYopfk7dcqnX27aIIzkszrGfOHSK/ohPnq05Eg
 pu10Ow5TVD3wda8RMBi/4o1LlpnAqQ+rK5CkijM23bSIZu+qaG8v7M0C2b1GtrW0n9Hj
 gMdMbnjr1fXwqiuQM6zOfgeImQmVDKofmBcRq/jL/FR2PvBqxU//6S7OampYyZ+8tUE/
 eYWQ==
X-Gm-Message-State: APjAAAVe86oXKjO53HCOThmIlF0nelawdTOPjitQP4PH1VsNoiaMum3U
 e5mU+d5LlP9lFYlLyzmw19GaIf8YteOouQ==
X-Google-Smtp-Source: APXvYqwYsTTXcVlDcisz0zFCsGXj1XIKEmRHnwwDQ86bg8jZmpVu7XVgmGkxKhVbu73Zwi9B2Qgb6g==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr16095740wrm.100.1560443966690; 
 Thu, 13 Jun 2019 09:39:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:12 +0100
Message-Id: <20190613163917.28589-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH 07/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VRECPE_F and NEON_2RM_VRSQRTE_F
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stop using cpu_F0s for NEON_2RM_VRECPE_F and NEON_2RM_VRSQRTE_F.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 124045a9ef6..75ed7cc7cb0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4181,7 +4181,7 @@ static int neon_2rm_is_float_op(int op)
      * what we are asking here is "does the code for this case in
      * the Neon for-each-pass loop use cpu_F0s?".
      */
-    return op >= NEON_2RM_VRECPE_F;
+    return op >= NEON_2RM_VCVT_FS;
 }
 
 static bool neon_2rm_is_v8_op(int op)
@@ -6848,14 +6848,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         case NEON_2RM_VRECPE_F:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-                            gen_helper_recpe_f32(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_recpe_f32(tmp, tmp, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
                             break;
                         }
                         case NEON_2RM_VRSQRTE_F:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-                            gen_helper_rsqrte_f32(cpu_F0s, cpu_F0s, fpstatus);
+                            gen_helper_rsqrte_f32(tmp, tmp, fpstatus);
                             tcg_temp_free_ptr(fpstatus);
                             break;
                         }
-- 
2.20.1


