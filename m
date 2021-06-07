Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2539E732
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:06:20 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKZn-0004nE-Us
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRm-00041e-J2; Mon, 07 Jun 2021 14:58:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:45197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRd-0005ty-Cx; Mon, 07 Jun 2021 14:58:02 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MqK6l-1l3mTO112x-00nTmJ; Mon, 07
 Jun 2021 20:57:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] scripts/oss-fuzz: Fix typo in documentation
Date: Mon,  7 Jun 2021 20:57:29 +0200
Message-Id: <20210607185730.346641-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607185730.346641-1-laurent@vivier.eu>
References: <20210607185730.346641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I9xFAEYF+3TsFN2VupcjDmCP9XvMvQpe6BpzprfP7VLNa91dcsO
 59XDXfBb1G0WGvCqKIYyrnhjK/PPyKnIv25MXhNcEaEQd8VqzZxhqbFgTMpAor5JlTQl6rb
 JlB+2VIytq56eXrdOhQAWmCJC3roPyQYGx7L83ugvqvWMaTSry/3f7hLUDFPKFavVIseoRP
 xIpO3gTKBLchtoGMaVqmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L+wD6ylS7i0=:62x8guH/5HMWFHSNZnHB58
 wwyCpORxejsj8Bgio6y+EDZc69Rp2ubnVw1DCS6OGUxDd7ms2heD0AzU4SUUc+E9F4Sbej02U
 kRpGz5AFsnFyZ1wWrYnAYPUzmomvpZX0weviZuiTxyB+/fY4i4mPNLpnv78eOCEs7F68K8BS/
 1hk2XEG+uIhCd9m9v38W88WZG+0NNGL2UgtZhHTtC9aiK4Blpt5ekhc290wGtXtb/c0zUXQb1
 giyVm9ClvB1MopAliXUoeiIPUg+CPedpM6bGm4MevpxcrQkLui5RKi7sWLAm47ahS5o1HA3Rr
 kb4+uqs9FOIKq9zmNgDXTs94YgZg/p0Ms2vJ/Lg5cKmJ0cL1fD5M2fNaGYWkV9fLa04lmBhBH
 3YfUk2/vTNaDqCR3zBlPf58lYzAP3gzBFULOcyvWPNSeXkENHacRdrgXIXMHIvtUGcBqoAfcP
 PjGM6RNCitxOeInzkIwC+diIy2C2y6eGOFPcFgge7Rjb/Zq5CGqzjSXTOnNGtu7bFAQZDSGXP
 WFhO5GrfdeD9kYS39xuPCE=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

While we only use stdin, the chardev is named 'stdio'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210602170759.2500248-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
index 890e1def856b..b154a25508f7 100755
--- a/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
+++ b/scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py
@@ -14,7 +14,7 @@
         /path/to/crash 2> qtest_log_output
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py qtest_log_output > qtest_trace
 ./i386-softmmu/qemu-fuzz-i386 -machine q35,accel=qtest \
-        -qtest stdin < qtest_trace
+        -qtest stdio < qtest_trace
 
 ### Details ###
 
-- 
2.31.1


