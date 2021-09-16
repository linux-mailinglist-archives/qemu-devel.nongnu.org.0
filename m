Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBA40DC94
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:19:08 +0200 (CEST)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsEF-0002PM-34
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6B-0000bU-LU; Thu, 16 Sep 2021 10:10:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs69-0005wQ-6H; Thu, 16 Sep 2021 10:10:47 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mnqfc-1nF5I43YcM-00pNzv; Thu, 16
 Sep 2021 16:10:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] util: Remove redundant checks in the openpty()
Date: Thu, 16 Sep 2021 16:10:17 +0200
Message-Id: <20210916141026.1174822-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qoiRJHOUX7QGvRdFzYCsWoV5JSgbkFmd1uvlhYZ4uobbg8F61AC
 wT/fqPpp7eQHf0LdVAJzfZ2s8WlM0+kmCuOQFpTBLE6IjutgrtPVpICawEbX5KGbsPzERSj
 7x8aapFGuLzyU1OVvA52gP+72NNCo6U1IWrAOnnm+4k5q7NEg57u5p6RwlgLxdBYT6wtzAd
 e4yJLxl58RZXmZqHAGj0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ij9S7WU/4ks=:Y1REnu62Ht9HBlwJ2+Q8SK
 iUu5qg7GmPzPUrKWKVuV5U5nw/W9+TUAZv3f1ck29Hhc/SjLSuUIJCh2fpRtUxRMF1CEiWAu2
 /PtcqryapPHcWdOpCxZ5FXGLnZWQEzU6yRDFFyF/CS5x//hPlAdxkzu/B20dVFVZuHHICWopm
 yx3YO+NvVCGkbtvjR0ldDBat8Kfv+VhHMuyXFoBIDw+80prJkwXpULifogfuwbOPuduYblKtR
 LHmsyrhDeu3iOdaJDzvhOt2D61UnzmGehA01X6NB00LO0UCyA/ydalpZ/ImbGm2wxJh9awtIK
 fTjaSVCao/3Z7a4RxhDWkM15+3yfmk/vAzrS5vztoCS/gkHEMmkbGpAc6NAY9Elf3EbuTv7tS
 RMLivOq8kdNIA6n3tsCaHMEzkWt9bAHY9qXd+RabDBwhxUGpiGNad1hPxZsu3xIcf8Dj8dbsn
 wFrRWzosuW53rQ3DBX2/s9JSAK1lkAjrUrLxUOHZI1iHyK+O/3YMfcYvy86t4fSbwnGRyPVXW
 VqtiScncoC3SNJm7xtldUmI4Afk1cRMTnsqdYPRhjdNqYs++VCPEr5DwzMljf2+RdEuRhcI4o
 DkIxTN8tdPkCxG1RiMuw7B2wZV5ORF5VfErme0Y0NWkHE+rR1jitP1WMucOKHAXRtsG+XRx3q
 K9YWqDtdE9rctTeYajzElyVLfR11uq3Bgg2ycc2NXt7UfO0U3Zrzq8aiyHabsS5o/hTHWg+sa
 Q1VvYK64JIBYmov7kE1GiHTcIS7QCPWDaqeFKg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 AlexChen <alex.chen@huawei.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

As we can see from the following function call stack, amaster and aslave
can not be NULL: char_pty_open() -> qemu_openpty_raw() -> openpty().
In addition, according to the API specification for openpty():
https://www.gnu.org/software/libc/manual/html_node/Pseudo_002dTerminal-Pairs.html,
the arguments name, termp and winp can all be NULL, but arguments amaster or aslave
can not be NULL.
Finally, amaster and aslave has been dereferenced at the beginning of the openpty().
So the checks on amaster and aslave in the openpty() are redundant. Remove them.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <5F9FE5B8.1030803@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/qemu-openpty.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index eb17f5b0bcec..427f43a76973 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -80,10 +80,9 @@ static int openpty(int *amaster, int *aslave, char *name,
             (termp != NULL && tcgetattr(sfd, termp) < 0))
                 goto err;
 
-        if (amaster)
-                *amaster = mfd;
-        if (aslave)
-                *aslave = sfd;
+        *amaster = mfd;
+        *aslave = sfd;
+
         if (winp)
                 ioctl(sfd, TIOCSWINSZ, winp);
 
-- 
2.31.1


