Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7944084B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 11:53:38 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgl3R-00014D-5w
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 05:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgl2P-0000Cm-2Y
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:52:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgl2M-0000Up-JA
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 05:52:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6ED42755FE6;
 Sat, 30 Oct 2021 11:52:25 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 513D4748F48; Sat, 30 Oct 2021 11:52:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2] hmp: Add shortcut to stop command to match cont
Date: Sat, 30 Oct 2021 11:49:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20211030095225.513D4748F48@zero.eik.bme.hu>
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
c2: Fixed typo in commit title

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


