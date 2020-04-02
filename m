Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E617119C309
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 15:49:33 +0200 (CEST)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jK0Ds-0002ZN-W8
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50685)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ai-0006OY-FR
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jK0Ah-0001sD-Bx
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 09:46:16 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39278)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jK0Ah-0001oj-4e; Thu, 02 Apr 2020 09:46:15 -0400
Received: by mail-lf1-x142.google.com with SMTP id h6so2765409lfp.6;
 Thu, 02 Apr 2020 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4Q7MSpHXVMJ49cK44wbGbgCP5J9MGmDVmW1uuYRWUs=;
 b=Qm+SzTwPSelbgQGrPXZ0eRecqfbd6cMSBxsf+s198QHT+gl8uK1hQQlDnIfTa/OyOY
 yOx6T2K49fZbybzn1i0iDKyxwfaEq4J6/n93gtIO+PerrYZrhvRQaNP4D/Q/tD9MchZ3
 +UO6r94GyrcM0AXr8PHLdeuSldt9NI2bUZ8Y6IBC/EIrSDhRYaKar8EHbAON4zkvQKIB
 VfRpqkMsW11mpwxJ8dZU5B7i6TkbSCPn4CqZ71QGSBO5n4z0Atd/Po2j4XuSeEy8Ixl0
 6NxV3SrMtzoXJaAVahYnp8zTpMyOKnIYkJugOPZJRnmwGRmt+i5kuGHcKvnuJftVd4ma
 ou7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4Q7MSpHXVMJ49cK44wbGbgCP5J9MGmDVmW1uuYRWUs=;
 b=gSEkghOm7G+wwSl6GEA+8Fs0JOBo3WzB0zLrGhwNUmCMif+1JemLKGWTNNLiNSaJKM
 U86B/4sYqJ3fLt/L5c1a7Z9vwcUdBCPwUs+Z7uLAnRYx8XL4zGZZB4YAIixiXUzCpic6
 2EjG2AnzVO2+h62t7YhuYO708loqI0z3IKGkKko4WWLrKS443wlpB9EmtRNFPRXVuhNY
 Pdltd/FYH9yhlXTvtLuvLvWPFuwVNQkZXDeh35WASDAMZHq7JLY1dz1VPqFRr1ZE3ua1
 qnLHDkBDz1K7k6GVzV2t9UnkvXhGTqUGcxRiVLv0ohBZ+2cQVG03ImEaTdG1B0W1BJFA
 R7wg==
X-Gm-Message-State: AGi0PubE3J/cBo8mGPI9kbS0KrPGw2ouqOB1FD3m5A0wDDwS1K9utacT
 Fh7MW0GmeatOF1ZZfP8M8LdyYoJPHhMuSw==
X-Google-Smtp-Source: APiQypJkOFn70kEGDneFetAwp5e+JQMjtiQRNcEuBF0dQhYCga23iQI1oVdZBOdNOyBcWjzAhck2Dg==
X-Received: by 2002:a19:5519:: with SMTP id n25mr2280129lfe.198.1585835173457; 
 Thu, 02 Apr 2020 06:46:13 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id e1sm3202774ljo.16.2020.04.02.06.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:46:12 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/5] dma/xlnx-zdma: Remove comment
Date: Thu,  2 Apr 2020 15:47:17 +0200
Message-Id: <20200402134721.27863-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200402134721.27863-1-edgar.iglesias@gmail.com>
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Remove comment.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xlnx-zdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 2d9c0a0d5e..a6c5b2304a 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -511,7 +511,6 @@ static void zdma_process_descr(XlnxZDMA *s)
         zdma_src_done(s);
     }
 
-    /* Load next descriptor.  */
     if (ptype == PT_REG || src_cmd == CMD_STOP) {
         ARRAY_FIELD_DP32(s->regs, ZDMA_CH_CTRL2, EN, 0);
         zdma_set_state(s, DISABLED);
-- 
2.20.1


