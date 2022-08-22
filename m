Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5459CD1F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:19:05 +0200 (CEST)
Received: from localhost ([::1]:59342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHdI-0001pP-N7
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ6-000425-GS
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:12 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ4-0002iR-VH
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:12 -0400
Received: by mail-pg1-x531.google.com with SMTP id 73so10797232pgb.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=cdyb46ptQFDVL2DDkIXhQffuTR+Q0Q1biN8FGfrRJ442qECibWAOhH/Ft6oIfFkyPy
 xc+V2YStgv2Z/b4ducHOVbGqDCjJdxJVbU+fSR40PE/wOqIvw4be8ivNcle1d9FSKxC/
 PVVP4Cs/GV8vzbZBordMjYdwh+2hgWJt3QCtMBx1xobU1RS6qeRj8r/YNAGpVQV+/mmv
 DX8+g8F2WNoV5uEtvIMEmzlfm4D6xcc9unQpg7lILmX4EBHx0LJlRUUKmG7fu9aJ6pRV
 Oleia1biJmenJ5rbkWzcg0j0+0f09ZrmhsUaeseMljk5wjIEAsIP/VFRrxRvcwqKa8AE
 kuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=jXXZbjUM3Cd2e1ljjKAD3OJlyruv0MTA6TMepdpQcrZOhiGT9g/+8MNlKUQTQWyK4d
 ieNi24r7zExdrw2x0Gx9sJXMdud2PF/slYv0vkfInp6KP+NCwRhtsVtMyjP1Qnmhrw4L
 xH1pU8Erow6cTug8lMNbS7cV2frRAylDezr4sn52GVtnXzCdOoycTagZsbL8ZUNxAY8C
 xLc9mQuKc3A6LJVG+qYnBsV80PK+4TCYzzcQvpna9xWN2Unl9pbqUufnaIza90oMa4JE
 odunpV9bYFjJtS8fsbrk2zpGCoVFZ3XQyynNPowJn3+c7ov5Os4cXaN3U5BgS+q3u0RN
 nriQ==
X-Gm-Message-State: ACgBeo33ApsSsrboxtEybu8SoInJoRhFsCdh7ejQu8qbek6rDlmHuewY
 FqjSl93jXpYM9JVSp94cOMBYSN7WDxijxg==
X-Google-Smtp-Source: AA6agR678fBEKSX11oeLjMBPobYnvskjIjl9LkbuNM3VNXRzGvMnhTroWO5N0JHfpABa+/IryqFmHA==
X-Received: by 2002:a63:90c8:0:b0:41d:f6f6:49cc with SMTP id
 a191-20020a6390c8000000b0041df6f649ccmr14610995pge.223.1661212689775; 
 Mon, 22 Aug 2022 16:58:09 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 06/14] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Mon, 22 Aug 2022 16:57:55 -0700
Message-Id: <20220822235803.1729290-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Allow the target to cache items from the guest page tables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1


