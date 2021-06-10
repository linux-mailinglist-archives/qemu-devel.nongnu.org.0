Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2D3A296C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:36:46 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI3J-0005DK-9K
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrHtO-0002Bv-0Z
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:26:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrHtL-0007cd-Vy
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:26:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id y7so1655997wrh.7
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p1I43bGwzTU3aT+rnc8XhBBQf3mOaot9WL+pKQx9kxE=;
 b=R6lR4iQ4fVIXoZM9LS8eAUEDkf78v106DXJOgz3hYDC46ehHzwkmY8mTXADBgV3JNQ
 wXP+WWwEbZPOyHwLvtZj9lp3NlNAEkxcJg1zfzFvSdrhxRj4JxN+wheRAIBrOm41nn7/
 n5Bl98HEaXzagofqKq0gHchyvNsiOQsnwn4lgAcQjeLMp5pDrIH3DIOvAd7uDDkOiSNL
 4olKlffNTcUCErs8/4ebJk43ZT6p12s/Y71AQXvbnQTFWbAu4SSJ/iUG436LKT8a6aqm
 tBNsSZh65fiOzWA9SysMNWFte4Ek6FL5zmdsqjZzhiF0QFOs5pEY+1zTXNwVnQNiEAWN
 EHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p1I43bGwzTU3aT+rnc8XhBBQf3mOaot9WL+pKQx9kxE=;
 b=mPMYc5S5xoArvDk5Y6h2Mx7EfwlUZta1lEpO8i6OP1yF4ADCvx/akPUmAYK1W+am1y
 ekz4QtopkbNwgAqKsz5IjurPmWtm2zHpiizKlPe6OO9bYfqJ2dGsERBN67uCKLL8FNUu
 eEDYaGObqBEpcNj5D3MPvnWwcKY69T8f/CQopLr7nE9RvP2PfOax+PM9et4pqTwWmS6i
 TqMRIlEcgaBmgvXbFeJxXVKQhE3eEKy2+Hsfdw/Bl1BH+H61NpBwTxxVYoBsKIuq9LqR
 l4rY2wW1CHq222l8JNms2YVDJj9RaD0nkaf9ae2pVekOXu0G+/7tPAzyoT07tihvZ/2z
 4+jA==
X-Gm-Message-State: AOAM531BTtvY6QeqpCwV1sGaN+mKZ5fJsxXg9Q/aZjni/Tef319I1TDt
 pcFU0/Qrcemui99ENUPbxoV3hg==
X-Google-Smtp-Source: ABdhPJzE4znWk8MnVBfBXXsPRifbEaPdjCFPSTIw1si2WXTfG+iFzSg2sRGM0/R1kJRkks5GC7qHPw==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr4607217wrv.252.1623320786585; 
 Thu, 10 Jun 2021 03:26:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm8645529wmq.23.2021.06.10.03.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 03:26:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1A1A1FF7E;
 Thu, 10 Jun 2021 11:26:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Thu, 10 Jun 2021 11:26:17 +0100
Message-Id: <20210610102617.17281-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrew Strauss <astrauss11@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous numbers were a guess at best. While we could extract the
information from a loaded ELF file via -kernel we could still get
tripped up by self decompressing or relocating code. Besides sane
library code like newlib will fall back to known symbols to determine
of the location of the heap. We can still report the limits though as
we are reasonably confident that busting out of RAM would be a bad
thing for either stack or heap.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Andrew Strauss <astrauss11@gmail.com>
Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

---
v2
  - report some known information (limits)
  - reword the commit message
---
 semihosting/arm-compat-semi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..8873486e8c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[3] = 0; /* Stack limit.  */
 #else
             limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = 0; /* Heap Base */
+            retvals[1] = rambase + limit; /* Heap Limit */
+            retvals[2] = 0; /* Stack base */
             retvals[3] = rambase; /* Stack limit.  */
 #endif
 
-- 
2.20.1


