Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761D6B9740
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:06:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc52k-0001Oi-NK; Tue, 14 Mar 2023 09:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52g-0001Nz-L9; Tue, 14 Mar 2023 09:50:19 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pc52d-0002wr-Hz; Tue, 14 Mar 2023 09:50:18 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MtO4E-1qWmxb2b5K-00uoYy; Tue, 14
 Mar 2023 14:49:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/3] MAINTAINERS: Remove CXL maintainer Ben Widawsky
Date: Tue, 14 Mar 2023 14:49:50 +0100
Message-Id: <20230314134950.569342-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314134950.569342-1-laurent@vivier.eu>
References: <20230314134950.569342-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Sk+IoRfLSqzBI+ETs6E5p4hBPTdSB+e29aoH2v0DExEh9bXk9/P
 9KVyvumRRZs0ZFThOzHjGdthHdayvFbVk7yMJUEohIyWhoUVnpgwVB5Fqc1BcTRgBGKzD0T
 6/lfGyLB4QjI1o1X/tsFZro5qQHobAA5NqjxSwJtvzTn9nYmOIA8KSvDrtzf0FxvAXbXjal
 NXW/Lt5pyL6i/SqkCR5vw==
UI-OutboundReport: notjunk:1;M01:P0:KmSDpMowXZk=;CzFrhTEemBIrfM1S7izGkeuy/wh
 taKhJwPjRc1JPjYrspZLbmZXpjv037ujn1ElZuKGvJLckU4BPorHNhxmP/qHLb3liqzMdk8x6
 xC5rkBLKJPvOnHA1FN2Hzu20yrUncWw0GJEaT2fcDQCybj5Ay9t2DQIaxfiXnzM8qIB9nfVeB
 U1TEfL11LrLdI22Ra2Rkkf7oNPyH27aePhVMRfIskk/mMzlsO2iYPU49C68fMLR4bD7gvhTvU
 CRCcn4qSr2/5BIhMQpguygcpSkyF42o1pLjVJSq6Faqm5lLkr9TRUHWuC9WHQuVFj4/8qU412
 dh4fnCk4Rbm2AA/E+CfnnwF5Pqcx6yv4cOjipXCjZpwvI09TbB/V1GiWhI85FT1+Og17FkP37
 a7m4/RzLhR3VarO5KitUGETF40plDk56YFlkX53CpEqBEAAlQFtayhzXAQuzGFfD1Z5/I2JTt
 ZOmRK33bU+3YjcUh8rleeezBRR1go0FWEqA1EtjaWkWgTvcqfggx+klRIxMmc8XHGTlnDyf/L
 FvAy6pf+W4AvG9hsq3kljrJDME1JSXlBqAxDHgYnBUjja2sAmR3qFgrcmlPoSRMXPaYcOkgU1
 XInrhwa7j0MbnUqw0X+Qi4sWjkQ91ImKxXXqnvNanGsOSQaDYk458lTB9DhpSDGG9qTx0uPUe
 I83VPrr5RJv0o1cxDV5FS/+OesE2kF+FPYXJxCNrrQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

Ben is no longer with intel.  He told me he expected to get back to
CXL, but it's not happening as quickly as he'd like, and that it's
best to remove him as maintainer.  So let's do that.

Thank you for serving as maintainer, Ben!

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230220212437.1462314-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 883dc52063bf..7eab1a266fb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2666,7 +2666,6 @@ T: git https://gitlab.com/jsnow/qemu.git jobs
 T: git https://gitlab.com/vsementsov/qemu.git block
 
 Compute Express Link
-M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 R: Fan Ni <fan.ni@samsung.com>
 S: Supported
-- 
2.39.2


