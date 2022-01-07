Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D34487B66
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:29:25 +0100 (CET)
Received: from localhost ([::1]:52202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t3M-0005fF-Bp
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw6-00057i-3b
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:55 -0500
Received: from [2a00:1450:4864:20::433] (port=43586
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw4-0007u5-NZ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id o3so12307160wrh.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u3ij0VU4vY4kMQen5OzCseC136vxmVv0PB7jvlGBDEY=;
 b=oK292ymaBd424tZYEzCz6iSNOJBJD3gFM4YAWtuSWThPVDHhuSl8hUfZlgQjjEwD8f
 DVAAGGrF29cYzvunDAtPhXvWCW+Ph/xk60vTrAq+fo4B4jI2NYVbLz1T0IVfco7Ej6yv
 F0zxguK/koS9zeGsPh/NiVVXnXq12v9V78MPZS1+hzDWPuxWlAnfSOC+qJ9x2aCg9b6s
 UdMfgI2s3yf541nC/HhzrrdVBXnIIyGxT8gzMiqHUP4CUNHV/lkyASDXENlCW9ZQsX9Y
 6Sdrb3GwrJepbo3AIEETmexjkMAbnghddNACsuFVvBnv+E+GGXq1qH9EP+FLp0J8kJo5
 8tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3ij0VU4vY4kMQen5OzCseC136vxmVv0PB7jvlGBDEY=;
 b=peyqBw9OR4RDcihyWb7N6zcd8J7opLp265NLfJhX5XMTs4Uv3oi+Xtdz8xSJOHwxAw
 jNVOHNdUzk591lsmUXBGhcsdo8GGbEORIfmJMfM730Ay/yQ+VzXAKcjk2UUT/DQggD0s
 hA/UsynSWKU5DP3wEvb1wwCNQ/bYkwCBdnhEpg9rm0CqtUj223Eciyi5poWHMgAnffLD
 mWAbr+RgdhUm46aneTv+xaPaXSCgt3K7bY/jTh7PLE9oj4wLZOYjvHCcTy6q5e+nY2gX
 G4kmhfr5f53wQJvLVTsOwiQO/BlXj0uwvoqPCKKzLDDxDttqz88YRHySSWupaVvefwEU
 6A/w==
X-Gm-Message-State: AOAM531U1PGvG+sLK9Z91H1GC37laHSKcvDR3n/ZI5aEmhIbHs1Tk9Xz
 Ye0E9Y/CdU0kmmWEV9REYx49QIXxhVa5kA==
X-Google-Smtp-Source: ABdhPJxPDLRdrcaW1ml9Gav9IZdWke+VPs/YQHn9CnQ6y7HbmGX1p3usQ4FCUikYNL8dJk73AlNUUg==
X-Received: by 2002:adf:fb4f:: with SMTP id c15mr9727979wrs.509.1641576111408; 
 Fri, 07 Jan 2022 09:21:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/19] hw/intc/arm_gicv3_its: Correct comment about CTE RDBase
 field size
Date: Fri,  7 Jan 2022 17:21:35 +0000
Message-Id: <20220107172142.2651911-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The comment says that in our CTE format the RDBase field is 36 bits;
in fact for us it is only 16 bits, because we use the RDBase format
where it specifies a 16-bit CPU number. The code already uses
RDBASE_PROCNUM_LENGTH (16) as the field width, so fix the comment
to match it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/gicv3_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6a3b145f377..14e8ef68e02 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -400,7 +400,7 @@ FIELD(DTE, ITTADDR, 6, 44)
 
 /*
  * 8 bytes Collection Table Entry size
- * Valid = 1 bit,RDBase = 36 bits(considering max RDBASE)
+ * Valid = 1 bit, RDBase = 16 bits
  */
 #define GITS_CTE_SIZE                 (0x8ULL)
 #define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_LENGTH)
-- 
2.25.1


