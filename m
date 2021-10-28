Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823043F390
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 01:45:05 +0200 (CEST)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgF4w-0002ya-2i
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 19:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgF0j-0001Wi-3b
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 19:40:42 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgF0e-0001M2-9v
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 19:40:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 293AF748F53;
 Fri, 29 Oct 2021 01:40:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0CDD4748F4B; Fri, 29 Oct 2021 01:40:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] gmp: Add shortcut to stop command to match cont
Date: Fri, 29 Oct 2021 01:38:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20211028234031.0CDD4748F4B@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some commands such as quit or cont have one letter alternatives but
stop is missing that. Add stop|s to match cont|c for consistency and
convenience.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hmp-commands.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index cf723c69ac..07a738a8e2 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -382,7 +382,7 @@ SRST
 ERST
 
     {
-        .name       = "stop",
+        .name       = "stop|s",
         .args_type  = "",
         .params     = "",
         .help       = "stop emulation",
@@ -390,7 +390,7 @@ ERST
     },
 
 SRST
-``stop``
+``stop`` or ``s``
   Stop emulation.
 ERST
 
-- 
2.21.4


