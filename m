Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D899C3C2A66
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:34:28 +0200 (CEST)
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xCd-0006FL-S2
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x71-0006GE-Di; Fri, 09 Jul 2021 16:28:40 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6z-0007Vo-MI; Fri, 09 Jul 2021 16:28:39 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIdW7-1lysZ33D0P-00EfKg; Fri, 09
 Jul 2021 22:28:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] migration: fix typo in mig_throttle_guest_down comment
Date: Fri,  9 Jul 2021 22:28:23 +0200
Message-Id: <20210709202824.578187-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oXVPglt6mps3jCSq/Q0dyi0M2/mgnhiADI7+fO2lNJrk05T9kBE
 U3Gpg/uxsPmryPX9L9aOhR/LSbwDSO6MqFJp4Afb/NoeEXnyL/yyxVTSISPU9ElroF5xUPz
 fPy423imEt7d9QEt+zJUg4kyKqEivN/w8xquIAHpH5FAEfmGBXWq4Ra+oR9vjAiqjOXtJuc
 IA2a4+uRz1xq+jFsmJeIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6gBIici6D+w=:HmcmZ9j8zVeMj8EE9Qzapg
 ObkcpCb8rjcWardFwjdmbjIToWzVq7q8dm88LtEYXYKLeIkYrFcI8jIM1ieB7FFnVIxeMRETb
 9QTf2Qi9R+RDOoZ+zpgCvZ7J7E+YwNd7elOP/UxtjDMMu22HykiDdFMyHg/Mpo3ZV3GRD1qGc
 HUe+R3jdNzmjucvi3J0WzISXOD0FpcUSyadDwBxuL8GPIoRat1CUiiMAgdXc0wjGu1biERzFb
 +Ik2M+mb4o1UZp3IMSo8hci+DEMX3mEx0ReaZ2YC2LSxL2jxmSXXTNUCYA1yyjHhfIko3YRO8
 gtaW9h6zAMSWCvaWwVnSU1evCbxhQycS+8cglMqDcFqD7l2GVdaOsNsxuxiti+zooHdrnrqDf
 uQPM5hjaj7nVgBn9WpwcK5U0dKH1/vKaxl9A31YlikpX5OgFACluESKQirE1yAerdNikugF1H
 8PAabOfQGUvfGXvtC8nIOpupPEezIW8lW1+IPA0ZckCFNcqAMehBWW5BlDohNUPaH3zMJ0VJh
 rN3VbIm11ZlKOA3/dDKesBKWjk0i9lEDjEOm1u3RdN9hxPe5Tu88JnRMIYMJt8rwyaOYFVzsr
 JruK4glv+DLJ+NQA7rrt7YMnx2GqwI+LYWEPsTmhrsNM6Z6oyMM+vSbPCFo802ypb1/WDtt5K
 uveEQsiBbxeW3dEzUFrkYbrYvYwsYneBicYH45c91MIGeHQFJSWy7Bo9+G6wbVlG1Q4tq3Qhb
 soe+frNuMp18I/ZYMFMtKdLndhYwxQm4vfLFSAv86kjudggOCUtE7hQm7L8wAqNQOw68vuyMS
 OOlG+bXSh9zmlxrqiqgSWHSu054ioNuRagqdA3YxASq2trdnXLIcZVyhFgCZn2BeM/lpRNV
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olaf Hering <olaf@aepfle.de>

Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
all functions comments")

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210708162159.18045-1-olaf@aepfle.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 723af67c2e91..88ff34f57424 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
 }
 
 /**
- * mig_throttle_guest_down: throotle down the guest
+ * mig_throttle_guest_down: throttle down the guest
  *
  * Reduce amount of guest cpu execution to hopefully slow down memory
  * writes. If guest dirty memory rate is reduced below the rate at
-- 
2.31.1


