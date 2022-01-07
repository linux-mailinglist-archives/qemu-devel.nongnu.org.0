Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F6487B5A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:25:29 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5szX-0007oA-Ua
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:25:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw4-00056g-Vx
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:53 -0500
Received: from [2a00:1450:4864:20::331] (port=44640
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw2-0007tL-Ib
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso1248150wmf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q5OaLs830Ox8Bfylb1X2zHy5rJRr7MHpRwjdBpXLrtw=;
 b=m5Yn572xDBOFXtoMV4O40kBs4+7nVZywJ7KHoFoqcLmqtiiWs3Im0hNTEfr7ar3HN9
 8QQeQaHzaQrLi1JrxU3DPUEMu98wgtNLlI+dFZhyqCo21K5SJEEtBU7S+/BFt5aTokDs
 4yK7lqjXiJ3mJ/FuYgwJSLVYzStLJkNW8TikbM+ORGsVnDlrjhIXbDgnt1TF+sm+fOxP
 1kiabEHux0C+fgnZhSDeGa2WM0bQRO7XCgb6/I8EbLprdceCCd7ReDxDrtsvDQC376UO
 iOCzPblz7lQdClElDmJWWJsqYNLeEeDzUPf7fT4MzWedX8J1qhrkqdZzNsYVy7Ok5Yl3
 gzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5OaLs830Ox8Bfylb1X2zHy5rJRr7MHpRwjdBpXLrtw=;
 b=1EMw7yvoVhokvfPqjm7S8D/83uHR+jEQwB/EVLgKQ+fHmCOCbTpujVcY6S1WRwyXRl
 r6/977OERB6fOOglBX1X3sqCTQYgz7BqtSkp/77WuDGch9ifG/W/JXLeqEuyottX54Yr
 YKrwZZNO+N2KUsuAo/RlcV0P+hTkxuAbS31lV9wNCNq52f2Ns6+6GyYzZj+R+pA3ySi5
 IMDLtU36wIPiODUD4lVQEGLhdkSqeV/Ri8JC+GNLl7dFZPALLKamutOf2LZ+WJ5OIJuH
 FAEXh+XzPtGGmV72Q6aHR/ftPBcGL9f6gs3hVYu3PkQLBh0opcjfM2aMZNLcLJWkRhe1
 Zhbg==
X-Gm-Message-State: AOAM533igOSkkBfFkhExfgf3WCAYiSFFvouheW4NC00O0GxG5cWqNzfU
 HeGFG3rs6L8dMgfAgdKg47RMHGeRxI0qMg==
X-Google-Smtp-Source: ABdhPJwyV5GIWZavHC49s5TBaJQU+X9NFwVy87b0YJjT4HICIcuklFnQuUk1u6J98Sv1zWrraKLYxQ==
X-Received: by 2002:a05:600c:4e88:: with SMTP id
 f8mr11938696wmq.45.1641576109361; 
 Fri, 07 Jan 2022 09:21:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] hw/intc/arm_gicv3_its: Correct setting of TableDesc
 entry_sz
Date: Fri,  7 Jan 2022 17:21:31 +0000
Message-Id: <20220107172142.2651911-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

We set the TableDesc entry_sz field from the appropriate
GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
number of bytes per table entry minus one.  However when we use
td->entry_sz we assume it to be the number of bytes per table entry
(for instance we calculate the number of entries in a page by
dividing the page size by the entry size).

The effects of this bug are:
 * we miscalculate the maximum number of entries in the table,
   so our checks on guest index values are wrong (too lax)
 * when looking up an entry in the second level of an indirect
   table, we calculate an incorrect index into the L2 table.
   Because we make the same incorrect calculation on both
   reads and writes of the L2 table, the guest won't notice
   unless it's unlucky enough to use an index value that
   causes us to index off the end of the L2 table page and
   cause guest memory corruption in whatever follows

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84808b1e298..88f4d730999 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -829,7 +829,7 @@ static void extract_table_params(GICv3ITSState *s)
         }
         td->page_sz = page_sz;
         td->indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE) + 1;
         td->base_addr = baser_base_addr(value, page_sz);
         if (!td->indirect) {
             td->max_entries = (num_pages * page_sz) / td->entry_sz;
-- 
2.25.1


