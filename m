Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6F387198
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:06:18 +0200 (CEST)
Received: from localhost ([::1]:50116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisrx-0004Ja-1b
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKh-0007UO-CE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:53953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKc-00076h-Sr
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:55 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLRI3-1lza6R3iyZ-00ISV5; Tue, 18
 May 2021 07:31:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 32/59] tests/tcg/sparc64: Re-enable linux-test
Date: Tue, 18 May 2021 07:31:04 +0200
Message-Id: <20210518053131.87212-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3olxtEH3pWqzRZ6Tb5mivIm/4g/Wwme/hu55yp1SW4lEVnu9h4r
 /LrbiD40lfW41DXl4gqtVlV3KyhRifYDRALrt7BmmdDLzFdLWkJ609Y82+LBTumFYVAdrQs
 9/tk6gYj8c8c+Vbyo0Leu1LCmiscXCm2GscY9TtVL7xgQNZZaxZbtecP/QwmEmqlwofKaHO
 jvAtowWHtXR1iwB/z6zvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8FTbl/4BTac=:kt36rV2uUr/ld27gbGSUBQ
 Wws2PJ8M25d1AHehu0GBJjJbDSP8V4lsF7dor0v7fHTMZXTWk+6/NndTDOzUYMMEq4vvLhe63
 /qBbLNecWDHNNOlyYlQbHYCdutSl31r912jFHYJgTTn1LPvh2EaiVhGW1VvTuFSdh9tV0M1Ax
 zWTqaBNGFoTayeerA9oRmiKVRNHQkda5GRoV9cO5yrfJCVfC3bFXYeoHHdo2W3A9pOmzok3Ew
 Hb20u493dJq370DDptHNze2G8t4j5kSQ3BLLhnw7jsmfI9ToQIlrV43DVS//19ZpqknT1zTmg
 D+P0K3ljFkP3m+6dbiHNsd/6oxNVJbZFa9UZ0dMLrwqQmMlVEWl2WZURZrNB5M27bTlhPVTF3
 xLBBVE6NrpdyQs2FRVsL+mhjcrkdG2tbeo66s4UbuuQ7gcfuyXRJippG3xEEqXvqMHRcyYNbr
 I0KGqOl8D7cZ+YYVdDJXNHKu0ZpeqpT9FGuJcgLHcTFR48VtDWckT/mMtgSrwMpU9PjOCcQaF
 BcyMSKgOY0BKq6G+vjlc6o=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

It passes now that we support signals properly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-26-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/sparc64/Makefile.target | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tests/tcg/sparc64/Makefile.target b/tests/tcg/sparc64/Makefile.target
index 5bd7f90583d1..408dace78394 100644
--- a/tests/tcg/sparc64/Makefile.target
+++ b/tests/tcg/sparc64/Makefile.target
@@ -1,11 +1,6 @@
 # -*- Mode: makefile -*-
 #
-# sparc specific tweaks and masking out broken tests
-
-# different from the other hangs:
-# tests/tcg/multiarch/linux-test.c:264: Value too large for defined data type (ret=-1, errno=92/Value too large for defined data type)
-run-linux-test: linux-test
-	$(call skip-test, $<, "BROKEN")
+# sparc specific tweaks
 
 # On Sparc64 Linux support 8k pages
 EXTRA_RUNS+=run-test-mmap-8192
-- 
2.31.1


