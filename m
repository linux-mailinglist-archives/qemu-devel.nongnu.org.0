Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA363B85
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 20:58:31 +0200 (CEST)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkvJu-0001iz-Qk
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 14:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hkvBL-00034j-Ej
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hkvBI-0005pE-W6
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:49:39 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:36868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hkvBI-0005C3-JP
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 14:49:36 -0400
Received: by mail-io1-xd43.google.com with SMTP id q22so23588712iog.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 11:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=gDlgVI25OoW0xspyfr2L2TQqUz8qHKNkpsVTkhApndA=;
 b=Y2i3TnB1Z88m+7WBQYUSSmoBQKpq4tx3IJGeyRurWMDYA4y+WgB2t3IDuv7Pq2IG0y
 KxZW2/nJX/+LuXcCNOlVkT5a9eOfBpCyoSe7XGIozo3ACR+OONl0B/k4jYFdPK0+6Y5B
 vJYx6txXBBFPRr0a6vbkd+o4y75yEd6WKM5H3hO6/XPIlkHcny4l14Fdrn06kqDV1U/I
 DcOGyPSiXa0w3hg2jd7wtXcQN62GxpB5A2nauQSb/GGYbulZ7CPLzHJRACVS9WiVGUlQ
 UFepSwssX3i1Uejbhd1xvqr7Z6SktrmrLv0njyod8kQPRQVknoqQit8VA9EWY5fKeaav
 a3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gDlgVI25OoW0xspyfr2L2TQqUz8qHKNkpsVTkhApndA=;
 b=M3e7/8Kri8y/mpw2n3TFxU5LvH/GLQ3hQ2QF73bG90U/nrDfdBmOAYkcec2wL/BFIX
 M7Re7begoWPMnugLo3jlR2cvTo6wwZz9IE7bxZI/rA5ReSUfOpxqgHr4yk3wvD2QxtIZ
 JgH3JQKbagxrI8ycEcFcOLlUyiH6qtyhEZvCgMds9KFjLu2r6Y0gLcvUrtB05P74g6bG
 OIC8GtfWdzsMWVnI9thE6Z6eGu1d50ZFem6ptSCQo+6dBXzU20pYGl1IVT1PmjpDRNWP
 VfirK0XIOhjblN7wMp1LFtyAPdPTxPmFIshWjNayYQHOCzl7L3jzuFPuv49vch2A+zWc
 RH6w==
X-Gm-Message-State: APjAAAXQiIb16+Cy6Hf0YKW566BXaeQIpdgrf6VCswdlIrqeDlEsB7il
 Mbkdy5j4UBDvF0tVy7UbuHoEwtA3+vw=
X-Google-Smtp-Source: APXvYqwz/d8R2vE5eKZxFJ19ldV/TXzbivYe47bdmG0s8c1U6KkxI0h6lR4vjVwMPCvn/Y33vhiPkA==
X-Received: by 2002:a5e:8209:: with SMTP id l9mr8516508iom.303.1562698112477; 
 Tue, 09 Jul 2019 11:48:32 -0700 (PDT)
Received: from localhost.localdomain ([172.56.12.212])
 by smtp.gmail.com with ESMTPSA id s15sm19083349ioe.88.2019.07.09.11.48.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 11:48:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 20:48:23 +0200
Message-Id: <20190709184823.4135-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: [Qemu-devel] [PATCH] tcg/aarch64: Fix output of extract2 opcodes
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
Cc: peter.maydell@linaro.org, beata.michalska@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The aarch64 argument ordering for the operands is big-endian,
whereas the tcg argument ordering is little-endian.  Use REG0
so that we honor the rZ constraints.

Fixes: 464c2969d5d
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
index b0f8106642..0713448bf5 100644
--- a/tcg/aarch64/tcg-target.inc.c
+++ b/tcg/aarch64/tcg-target.inc.c
@@ -2226,7 +2226,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_extract2_i64:
     case INDEX_op_extract2_i32:
-        tcg_out_extr(s, ext, a0, a1, a2, args[3]);
+        tcg_out_extr(s, ext, a0, REG0(2), REG0(1), args[3]);
         break;
 
     case INDEX_op_add2_i32:
-- 
2.17.1


