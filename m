Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C25383C97
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:44:23 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiE1-0004d9-Jj
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihla-0006NS-CH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:58 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlM-0004SF-UO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:58 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mjjvp-1l2T4D2c4h-00lDzh; Mon, 17
 May 2021 20:14:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 32/59] tests/tcg/sparc64: Re-enable linux-test
Date: Mon, 17 May 2021 20:13:57 +0200
Message-Id: <20210517181424.8093-33-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rfgSqyEnbY/DA7yR1B1wh95ffksCs7v5/tQs1O5cTeB5Y8ngeFr
 yRzNwa2JyklmRbeqx3ItJfD/0I2l4okbwgOL1GvQUEuO6pJztfZe58kBVBbR9D1z4p2Ib4Y
 lrHf6eizSdGt4L9caQfsyhJ0fn3h2NEdl5n5sYko+jQBVtURVpMpBQ8RlKcrY+w3UGq1WBj
 5oNbmWDc/RIMpmd3s8sjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FVrNKecjWYY=:58U54jAbDB4ujs7jxPou2v
 G4h2M+wE858Xpo35kSOT0s6fMdgW3uKXFniAY+CMFl0xARHstb36LP0LxscaLLT/CWta5Pm1i
 ouzG5hH7fvs/qnmX7A6KCpUaSB7iI3KwuYnVs0Ea+Bp60OIPF9e9ADhz1ksM8zGxjH43/8v0U
 bqbE4TW3EDkFDL1A13ynOBWDYT66TykqZJ/h4iEf5wcrUH2nIBiOloLgvOi0C0mnAQzo5SMcq
 yxNHO/AWGQU7fyrQQhJiJF8S2cohgyYGNyGlFjF49oTu13U/tbN2zPd9yBeHjVAMOqVvZ5m9N
 OG/KuqyrcZI44dUMOitdnwntmVsaiHBlFVoUzz5++bbOwgTC1pbPd/L3n/VBjCXE/kWTa9QFy
 QqSy5bt5ZZfMGBwah0I8P9uzyG5jWvW/x/WIU/f8hr8qnNfIlBxxafZEiD1wjdW+5UlAF5UIK
 mHi7KLb+4OJEnhATuKHKTjRtuh+XVNd6apYCecr+lwptK6FNxZswu7fB8c61BWVYxiiXPYPaR
 Tol6JIkMi4gQUKmyLmUAbE=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


