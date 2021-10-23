Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870544384B9
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:38:07 +0200 (CEST)
Received: from localhost ([::1]:54750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLuA-0005Ox-L1
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnq-0005Cx-29; Sat, 23 Oct 2021 14:31:34 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:54297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLno-0006Xr-7y; Sat, 23 Oct 2021 14:31:33 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M8hph-1maD422au1-004oIr; Sat, 23
 Oct 2021 20:31:27 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] softmmu/physmem.c: Fix typo in comment
Date: Sat, 23 Oct 2021 20:31:17 +0200
Message-Id: <20211023183123.813116-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y8oI+oP3VZBJGE7Vh5vENUQtDo2GgcjKJ7Zk2XTisExJFLPOyV+
 R5TI9b4LUtPzIDYDFaKiAvNuOuNAyRgj3jBeEvIYLhZ15WDGEudEzB/z7RTak56vNtbVkFO
 fIRghNvV9hR/QP3wNwJpsg6Ge9+WMQbgg3yNj0Xm8C9tI8dxSilBs3A0napWEYewegEf5tf
 HnIoOcgpp+Qhw5iLXrAhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UMVT3kHt2GE=:1x3C4wPoi7Mf96+2V4dHUH
 vQNURsYVSHsuaSU1nmm3Ss35OaxWFURQnDLh1Fl60deN+v3KHE82UBwFp4oYPUQX9lBeECyII
 d8wQYReEolsNeUk9ReOjwzzd86CPA741Ir6bRreg2lNFOOiaFs0aWw/rqNlQKw+9l3KGvEm79
 39muCwgKfrB8QcN7DZaOmU2dqg1+1aAZ96MyafQyMOB2vQZZfWz5EXKHjSxRSZWkLvYoOWNIC
 uqDZ6x7VmwsYIlRz2bUzj1xe4b/CNvAnVK2JPOTggDd0DygJYRxi4cunBp+ifJX5anEhQDJ8j
 PZUL6M7jGYuy8goGFmr8HsKQdY6u3R8g9zv8u1MMfh8uDfHQTmC3av2zShokSp4TA8h+X0dL9
 ty2RU/imE6dwVXkdWsTH8ZKpA8FryNLy3Qvo+X8RJmBBlw1NUXClrK5of8UYb+wksAbMwsDg1
 PqJDT5vdQxt6rLRhShOahy1XzReUmTbe+FJKimJcm2BlZmvGv+rF2aPkA7QLkdw98CWtmylyY
 z0GGE2/tXfzn+BN8fHlrD6LEDVVgP9iA5RAD4OWPQE6KqENzbiblE8NrIG//RUZFeHmcc/17N
 bd9O6U/IqoWUK7Q3Sr7/+1DbhdQA/TTVX2a1qxze095jIJ7mb2vJKrtOhTgn0/WzXA0QSBpD/
 9iLxaJoRQ7JRipTRbG5lDwQU2Mbv4qN0+o70WIjPrwrvLO9tTn1Mtwm/CZjtx5VB5Q3g=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Greg Kurz <groug@kaod.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Fix the comment to match what the code is doing, as explained in
the changelog of commit 86cf9e154632cb28d749db0ea47946fba8cf3f09
that introduced the change:

    Commit 9458a9a1df1a4c719e24512394d548c1fc7abd22 added synchronization
    of vCPU and migration operations through calling run_on_cpu operation.
    However, in replay mode this synchronization is unneeded, because
    I/O and vCPU threads are already synchronized.
    This patch disables such synchronization for record/replay mode.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <163429018454.1146856.3429437540871060739.stgit@bahia.huguette>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f67ad2998121..555c907f6743 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2633,7 +2633,7 @@ static void tcg_log_global_after_sync(MemoryListener *listener)
          * In record/replay mode this causes a deadlock, because
          * run_on_cpu waits for rr mutex. Therefore no races are possible
          * in this case and no need for making run_on_cpu when
-         * record/replay is not enabled.
+         * record/replay is enabled.
          */
         cpuas = container_of(listener, CPUAddressSpace, tcg_as_listener);
         run_on_cpu(cpuas->cpu, do_nothing, RUN_ON_CPU_NULL);
-- 
2.31.1


