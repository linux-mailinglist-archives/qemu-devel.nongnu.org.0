Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B01E9F9E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 09:55:08 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jffHn-0005NG-1z
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 03:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jffGp-0004UW-CM
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 03:54:07 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jffGo-0003mL-Oo
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 03:54:07 -0400
Received: by mail-wm1-x343.google.com with SMTP id q25so1429857wmj.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aNsRer/kYC1fawEy8NzmKq+WnkCAU0GUMh/gEOJ18CU=;
 b=ROrdV0lvUtUAXilbzUC776JGtjGT7a5TIbC01OalC5M0VADAzdr6/TGB3hcUUV7j+0
 qJIypGxGVbGd2Sx50vxhMB0V5Bd9VsAC+QxR4qb1tuUxoJQgupgkapQm13A/ddmrlV4E
 QTyc4BDi3ZZzihVdh9VBcgio+PDEy4J/QvWUeLIXFapIpclxSNpVmdq8xu8GM6nQR4+L
 XxhjWbT6KrGovfxRruGuJQDcVFeTxZqA2/opHFUPtvhX5xyN/5H4WOZJaGElCo/9/fpE
 +BHWJjTqLs9HRVMRAmtLMaQIDZMn14umUV31pt5qoM/5H6/7ikS4AgkohhawwGZW1vl5
 UKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aNsRer/kYC1fawEy8NzmKq+WnkCAU0GUMh/gEOJ18CU=;
 b=P3ydA4IjvyQ5A6WS/fZQLJ09L4fZDauod3qxEOnkhIL7PBU6Q3enZy2Lb1qBhkeyYu
 OZm1JCaNT2jQaLbkj90qMz9IJXiAaP4aeEFz4N7zr2pIGEG/JrsVde9q0cmrbjXEadYJ
 JQjf+F1cwtmHQPQg75BkUagiKG8TPMPSyshCFoOjHtFHU3/vCqPDr2AYg1bQo3JLDuwh
 FJYEjWfyCgWDHA27E8Bbh20QBGXgG17Cg1UxmO7DQaeWiv6h5HCDUQbkNeub6+jnyvnE
 9wBUDXeLQFeObNMqi6W/0EDSRgwGBtxUK/M71B7nh7xjVUZt4iKYuiRMd8XKyDJQotHc
 HMbQ==
X-Gm-Message-State: AOAM533vzcU3VJLTgRJiNWDbEqW1VMHTAqA6U6k7WpdRG9D1vNUrtGRg
 X8wNH3KfolHwzh6Zszpk4Pi7m/F3
X-Google-Smtp-Source: ABdhPJzGJQlAmkJANopSv3mxMxKHXaW8GTbHp3IJEK4xVBjvoI51rGaA/TtRqKu1CUfo8a/i1W2lWA==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr19229682wma.87.1590998045049; 
 Mon, 01 Jun 2020 00:54:05 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id b18sm19294949wrn.88.2020.06.01.00.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 00:54:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] exec/memory: Remove unused MemoryRegionMmio type
Date: Mon,  1 Jun 2020 09:53:58 +0200
Message-Id: <20200601075400.2043-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601075400.2043-1-f4bug@amsat.org>
References: <20200601075400.2043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <rth@twiddle.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 62a0db942dec ('memory: Remove old_mmio accessors')
this structure is unused. Remove it.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/memory.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e000bd2f97..3cdc171583 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -50,12 +50,6 @@
 extern bool global_dirty_log;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
-typedef struct MemoryRegionMmio MemoryRegionMmio;
-
-struct MemoryRegionMmio {
-    CPUReadMemoryFunc *read[3];
-    CPUWriteMemoryFunc *write[3];
-};
 
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
 
-- 
2.21.3


