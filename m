Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43728BCDE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:47:54 +0200 (CEST)
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS03F-0006Oy-CL
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqs-0007Pc-0g
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqe-0007Md-H7
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:35:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id z22so14006563wmi.0
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bcorSBZXkBkW1mp/hqFvB6M1vX2DnTHEzjvxS98edmI=;
 b=ZDjU0n6i8Sv1A44uNzJhuxDJVq2BVk4udSxqhvl38awFaZoQFo49xDBI0z8zLTtfQt
 LQ6k1qQTN4JRVdqAgUSWWAfmzbFbyANL2abgbjAtpiy8UVkAq2pOPRtTPRWw4TEFOoEJ
 FkyazT/T0Z2vcrSrdOh0Ti2kMjtWCEwdkt/5mIWxWF+RQWMbS7g6suApGiBJgUYWv4h0
 S+unk0M6QB240smfCTD8tYSKA3KNRycPE9gRzDLErqiAJBaISOEByXo/M0i9bwivwFad
 kDut0U/eQAM70gRgiSH+Abg6eXxs9LM2HhcH80BIvqcBI/i7tm7/3JXeb8wm8kwMxA/0
 PsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bcorSBZXkBkW1mp/hqFvB6M1vX2DnTHEzjvxS98edmI=;
 b=TAPJOwKDyabD/ZeQH4GpjabS05cs0E7SSQ1B0HI2KQ5JNW4F//kVtXxXUseimRLSJD
 hBx3yqklel0heenmQEsD9/DEZi9/TSOGyZ4aVFJIG0LOfZLrM9/X3RbMsM/At8i53qP9
 /NjAyZ72kqMM16FFdCvn6B6KLYYgriAvuIskN/Ho6rOQ7od0THXeXXvBgiDKadB9pMNf
 kSPvO3vCpL8I3vVoIBtpoWN54M+LpiXVgLX3uMCRKHzlTx0SWN6Tw+ymC4va2C7ZOner
 nC1JmVVvvDg3g2FGEGKfQ0avTmX4FxXyNG8CQ96c21bCK97PUPZqEDqLFM+wj/B+VYpW
 TJWg==
X-Gm-Message-State: AOAM531FZ7gcw9lB5KnPWXj8TZn+zD6tsiJQJ7EtkbU0caQRTlWTxd/d
 JVwBW+eWtVrB397gm7syHNJA3Q==
X-Google-Smtp-Source: ABdhPJzf3rOV7uHyZM6nT5NqjjgblvI3Zg+lxN3Na0WG5ggzqEirZo40jt9IqR56Pp0n1yDSdILtWQ==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr10909949wmg.37.1602516881543; 
 Mon, 12 Oct 2020 08:34:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] qapi/machine.json: Fix missing newline in doc comment
Date: Mon, 12 Oct 2020 16:33:50 +0100
Message-Id: <20201012153408.9747-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 176d2cda0dee9f4 we added the @die-id field
to the CpuInstanceProperties struct, but in the process
accidentally removed the newline between the doc-comment
lines for @core-id and @thread-id.

Put the newline back in; this fixes a misformatting in the
generated HTML QMP reference manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not very important but I've suggested for-5.1 as it's a safe
docs fix. You can see the misrendered doc at
https://www.qemu.org/docs/master/interop/qemu-qmp-ref.html#index-CpuInstanceProperties

 qapi/machine.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index f59144023ca..daede5ab149 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -825,7 +825,8 @@
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
 # @die-id: die number within node/board the CPU belongs to (Since 4.1)
-# @core-id: core number within die the CPU belongs to# @thread-id: thread number within core the CPU belongs to
+# @core-id: core number within die the CPU belongs to
+# @thread-id: thread number within core the CPU belongs to
 #
 # Note: currently there are 5 properties that could be present
 #       but management should be prepared to pass through other
-- 
2.20.1


