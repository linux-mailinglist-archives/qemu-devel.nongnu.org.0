Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B544384C1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:43:23 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLzH-0004O1-0c
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnx-0005H7-RY; Sat, 23 Oct 2021 14:31:43 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLns-0006Zw-Ap; Sat, 23 Oct 2021 14:31:40 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N2Unv-1mpBUr3Y23-013rKZ; Sat, 23
 Oct 2021 20:31:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] analyze-migration.py: fix a long standing typo
Date: Sat, 23 Oct 2021 20:31:22 +0200
Message-Id: <20211023183123.813116-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023183123.813116-1-laurent@vivier.eu>
References: <20211023183123.813116-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gh06F+74oA6StfovsGBNpmNQWQNQxicljU8ZhpCb/oP1DHJDoK8
 MJfwckMAxCUOI8d071lZlFdpLMp8DyfM3eMjOkp56sl/ZKRSGcLgTnJMC1EVZ7kfuhV8JlJ
 hRLK65hClCdsOsBYGXMjZK2nXicKeqEcQsWt2OLE2SBohDyM8zNU9g/E1sfGh5Gj0wInpEt
 ZmG5y1NuS2KkJ+f3rBS/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/0Jaj9Cwajk=:+3LF5aEWV44siaLIWI8Ky0
 bjRNbcr0yP7+EWA2Lt40Vi8vDpCTn7H7NsIpuOYcWSdJXCtyiaF+zugClcbQaTQiuyOnTdXRM
 w4/Dav0QX7pGFkr8f6IxyFy5bTdB6LTIDB4C90TtPzlJVEfUNb34I/jpYsrmU4ZFf5koeIJeN
 4rNVg1FtXu57c75bLUbZorvDK3/B2dYK80aGIlPVWQn13awL4I92BQ/1FM6qG2dWgNqp+UAqQ
 xE4hV2QgzEOtuI2HPQXm+uMBLO/MoYIYV0HFn9mpEbx6+1S5tIJ/bjJviFPuPLpcL9HZPqSlI
 TmrY0QRu+rQTlPXc0w6feszmf7UKkJInZjJk2E4BWWCXWN/ea8IZMBR1BOW15C2MQ4LTI90bK
 m3xCsfcH6i0Jm02Xa8UfoDp2qv2PeunNWg2r35pTeNtGyCi04bWoakVBO7YHHMJPjyUoiZ9jS
 +p3VGvkuWJgK/2ZmuAhhQwgIUezPzrFR81V5g1kh4rjCmBedbkbNrXYNyxTbAUYXu6fLV+N57
 jP/x8rD6h/SVRGqA58pE5q/v7xIJ3GQgyXymm6ucw2m9/rMn4WA1czUXUVLLmjDWtryvmxVUc
 9EoKmj+7CHLpn4mP+DYxyBRfG9LA+voPQdv7p/DQpTGZ2v2H+bjtdIkvjTqufK/SmMSLM1+yH
 jvXvNr55pz2Z8TAkjP5q+BaB+cKFickbdqljZ/qK1N+qCFd6nPvYaIIU3Q/3Bqc7sIuY=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

The parameters of '-d' can be either 'state' or 'desc', not 'dump'
as it is reported in the error message.

Fixes: b17425701d66 ("Add migration stream analyzation script")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211015131645.501281-2-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/analyze-migration.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index d7177b212c86..9d239d309f33 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -610,4 +610,4 @@ def default(self, o):
     dump.read(desc_only = True)
     print(jsonenc.encode(dump.vmsd_desc))
 else:
-    raise Exception("Please specify either -x, -d state or -d dump")
+    raise Exception("Please specify either -x, -d state or -d desc")
-- 
2.31.1


