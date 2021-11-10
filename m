Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F344C129
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:21:53 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmbw-00019p-98
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmaT-0008Fh-5E
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:20:21 -0500
Received: from [2a00:1450:4864:20::436] (port=45581
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkmaR-0006tE-JN
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:20:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id w29so3638250wra.12
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 04:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Db50HGAJVXsj/d9L3hu2IPZej1W3xub0fCEt1yVjEU=;
 b=CrbpSfJqCKMHAYrEwgNVvjcy2MGCprrg2hfmNPo34W8u+8WcUK7IH1unawdnMzdBUE
 1uC+44iQDhXP8FloB84/T5S9e1tF2g/i+pPbwOE48YjP+KIRexIPDBxIJLz+j7Lw5jtz
 GNvbgoH71iQXMXZ2SP/1sr605tXSpJT+PS0sG4MrXz6aLkc+JWZyEFvJVs+WepWr1HpE
 Xivpr5aZ459iRAOIXCbtRgKasEE30E3FI5BQWPMucr56PldhKqNZGK4P1mplDb999k4b
 8xlPCsqABUccxy9Bk0JRyK2BVQDzWd/fZvWbxpIUoVzCQG+I8CWQy6Jmt9/w2++kii6t
 L7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Db50HGAJVXsj/d9L3hu2IPZej1W3xub0fCEt1yVjEU=;
 b=T1hPQJEF14+8kwUnKKq5DoJhQhpfv+ytL4liP4WDmsRp/sf/eDCGr9EdqP//O9hoe9
 DpmbFT/OT5naNftmg9m/bV+J2IhFwy3m5Cmf+tj3OcmVgHxbk46jCMP9ovqgshSAAtvY
 t1zFbimckPXzkAfIKxrC96vs3Aq0Bbp+MX+xHKJXJihUZ8MCSJf2bIiuj5OnRoMzXaFF
 5uUbNa6jjhaxKoOYv281ceZqgjJIFZObYfEatWBih3nEseolL3Umizl7soFr/jQVcMUB
 CuzEuTIuq7GDuTOS/6EU1Q8wTE4X1mZCjUUyYdc9sEzSEhHyngvMihhp5nrT5NYDafAz
 tNuQ==
X-Gm-Message-State: AOAM533X5v0os0K4ik0DeeuXeyGtTDutIMYocqHZyFCRtcuatN020d51
 6acnMwJJ2pOHf1qubfSFzTZnJZGmqO+keSYj
X-Google-Smtp-Source: ABdhPJxCTNJjidNOGKktrARTNG5bdw9cVdBphVAm3LQwApuCs1MvHu9upqQeQ1DQBB9g2KJ3VJvErg==
X-Received: by 2002:adf:8293:: with SMTP id 19mr19898036wrc.167.1636546817769; 
 Wed, 10 Nov 2021 04:20:17 -0800 (PST)
Received: from localhost.localdomain
 (104.red-2-142-241.dynamicip.rima-tde.net. [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id o4sm27644292wry.80.2021.11.10.04.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 04:20:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Document ctpop opcodes
Date: Wed, 10 Nov 2021 13:20:15 +0100
Message-Id: <20211110122015.189655-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: a768e4e99247
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/658
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/README | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/README b/tcg/README
index c2e7762a37..391f4d1e80 100644
--- a/tcg/README
+++ b/tcg/README
@@ -254,6 +254,12 @@ t0 = t1 ? clz(t1) : t2
 
 t0 = t1 ? ctz(t1) : t2
 
+* ctpop_i32/i64 t0, t1
+
+t0 = number of bits set in t1
+With "ctpop" short for "count popultation", matching
+the function name used in include/qemu/host-utils.h.
+
 ********* Shifts/Rotates
 
 * shl_i32/i64 t0, t1, t2
-- 
2.25.1


