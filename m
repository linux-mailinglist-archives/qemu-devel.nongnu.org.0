Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD1211062
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:16:21 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfPI-0004Jz-G4
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqfL8-0007Ds-5m
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:12:02 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqfL4-0006GM-Fc
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:12:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id s10so24588250wrw.12
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plqX1uLjHS1JRtUyTbOdw9sOOjMvjpQ/src1XYAUVDM=;
 b=qT/4txteqaajJk5C+0hMAnHFYeTIx/JBSqvSnfmpWrKhkPM+MCh0ieWDsBE3riGg5S
 pwaFghfibw4x5VvpkTeBLf9mq7lbr//vb1L6lKK/P05QmrqtyDHtalxFKHI6MMSjcsy3
 of8Wecu4iGPV7kjHnrvB7tMOX7eFtSvwWFRVPVs/Mz+kWAk6lZl3aW9p3EfT6+ZKpLtQ
 W3KWGhl5dy+coKb12u7szq9y2A3Mf6eka05F/hmsRSH+md4i/wCSLYJQY4thgCT7lhZS
 aGpNfZOjYgL4MnIReIqfuVEa6MrldM42YV5rTo60Vcpn+tYl3MteisEICZt7KyQ1Vpyi
 fjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plqX1uLjHS1JRtUyTbOdw9sOOjMvjpQ/src1XYAUVDM=;
 b=LGL7oZerFZhLbGt0oARIYOle/J4gYP9ej7EG/Fd+xHfq50z8jVhQ2Oqv8o6NH0M7Uh
 ReABiCRnzud/K7FCTBSdSYizVFjJVCRFaxhMbU/RRAgoIXMtfF3oRUpRFN7wYRN7Ezmk
 gZD3vNqnNI9tGfu34JcxlLCGcHZ5TmEnFDr6wl3p7DbtUn4Zv+d/gF62SHy+25cbHhnK
 qjiGeT2EuAczZaHa8dHwNTVUySLgesiX4e7leYMsZqqr3VXlsucy34OTftWAf2z2ypuV
 lpURVOL/6BLzEKszCB4isKthYyDoFdYDM5FA4o0Fndjz+Gzoz87QFpq4+ZlpgulNj2Va
 KqNg==
X-Gm-Message-State: AOAM533U9qI1FBu4DNH1c9s5XCiz9rlndc/zZ0wE3ZR3H3hPq9Cs8EOx
 VlpaAr5oZRpkiU+I2u2s3S221Q==
X-Google-Smtp-Source: ABdhPJxhbFM3ysjxh1hMwdGkW6s+aPuVHA0F88oKfI/tGJhhz3nBanOa/ZWjT9l1ZQ54APNIw+L7aQ==
X-Received: by 2002:adf:f60c:: with SMTP id t12mr29586194wrp.198.1593619916565; 
 Wed, 01 Jul 2020 09:11:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z17sm8248687wmc.3.2020.07.01.09.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:11:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EA2E1FF8C;
 Wed,  1 Jul 2020 17:11:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 2/3] docs/devel: convert and update MTTCG design document
Date: Wed,  1 Jul 2020 17:11:52 +0100
Message-Id: <20200701161153.30988-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701161153.30988-1-alex.bennee@linaro.org>
References: <20200701161153.30988-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do a light conversion to .rst and clean-up some of the language at the
start now MTTCG has been merged for a while.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/index.rst                          |  1 +
 ...ti-thread-tcg.txt => multi-thread-tcg.rst} | 52 ++++++++++++-------
 2 files changed, 34 insertions(+), 19 deletions(-)
 rename docs/devel/{multi-thread-tcg.txt => multi-thread-tcg.rst} (90%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index bb8238c5d6d..4ecaea3643f 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -23,6 +23,7 @@ Contents:
    decodetree
    secure-coding-practices
    tcg
+   multi-thread-tcg
    tcg-plugins
    bitops
    reset
diff --git a/docs/devel/multi-thread-tcg.txt b/docs/devel/multi-thread-tcg.rst
similarity index 90%
rename from docs/devel/multi-thread-tcg.txt
rename to docs/devel/multi-thread-tcg.rst
index 3c85ac0eab9..42158b77c70 100644
--- a/docs/devel/multi-thread-tcg.txt
+++ b/docs/devel/multi-thread-tcg.rst
@@ -1,15 +1,17 @@
-Copyright (c) 2015-2016 Linaro Ltd.
+..
+  Copyright (c) 2015-2020 Linaro Ltd.
 
-This work is licensed under the terms of the GNU GPL, version 2 or
-later. See the COPYING file in the top-level directory.
+  This work is licensed under the terms of the GNU GPL, version 2 or
+  later. See the COPYING file in the top-level directory.
 
 Introduction
 ============
 
-This document outlines the design for multi-threaded TCG system-mode
-emulation. The current user-mode emulation mirrors the thread
-structure of the translated executable. Some of the work will be
-applicable to both system and linux-user emulation.
+This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
+system-mode emulation. user-mode emulation has always mirrored the
+thread structure of the translated executable although some of the
+changes done for MTTCG system emulation have improved the stability of
+linux-user emulation.
 
 The original system-mode TCG implementation was single threaded and
 dealt with multiple CPUs with simple round-robin scheduling. This
@@ -21,9 +23,18 @@ vCPU Scheduling
 ===============
 
 We introduce a new running mode where each vCPU will run on its own
-user-space thread. This will be enabled by default for all FE/BE
-combinations that have had the required work done to support this
-safely.
+user-space thread. This is enabled by default for all FE/BE
+combinations where the host memory model is able to accommodate the
+guest (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO is zero) and the
+guest has had the required work done to support this safely
+(TARGET_SUPPORTS_MTTCG).
+
+System emulation will fall back to the original round robin approach
+if:
+
+* forced by --accel tcg,thread=single
+* enabling --icount mode
+* 64 bit guests on 32 bit hosts (TCG_OVERSIZED_GUEST)
 
 In the general case of running translated code there should be no
 inter-vCPU dependencies and all vCPUs should be able to run at full
@@ -61,7 +72,9 @@ have their block-to-block jumps patched.
 Global TCG State
 ----------------
 
-### User-mode emulation
+User-mode emulation
+~~~~~~~~~~~~~~~~~~~
+
 We need to protect the entire code generation cycle including any post
 generation patching of the translated code. This also implies a shared
 translation buffer which contains code running on all cores. Any
@@ -78,9 +91,11 @@ patching.
 
 Code generation is serialised with mmap_lock().
 
-### !User-mode emulation
+!User-mode emulation
+~~~~~~~~~~~~~~~~~~~~
+
 Each vCPU has its own TCG context and associated TCG region, thereby
-requiring no locking.
+requiring no locking during translation.
 
 Translation Blocks
 ------------------
@@ -92,6 +107,7 @@ including:
 
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
+  - linux-user spawning it's first thread
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
@@ -250,8 +266,10 @@ to enforce a particular ordering of memory operations from the point
 of view of external observers (e.g. another processor core). They can
 apply to any memory operations as well as just loads or stores.
 
-The Linux kernel has an excellent write-up on the various forms of
-memory barrier and the guarantees they can provide [1].
+The Linux kernel has an excellent `write-up
+<https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/memory-barriers.txt>`
+on the various forms of memory barrier and the guarantees they can
+provide.
 
 Barriers are often wrapped around synchronisation primitives to
 provide explicit memory ordering semantics. However they can be used
@@ -352,7 +370,3 @@ an exclusive lock which ensures all emulation is serialised.
 While the atomic helpers look good enough for now there may be a need
 to look at solutions that can more closely model the guest
 architectures semantics.
-
-==========
-
-[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/memory-barriers.txt
-- 
2.20.1


