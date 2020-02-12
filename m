Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E399915B3C9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 23:33:25 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j20ZR-0003F7-02
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 17:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j20YP-0002MT-BV
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 17:32:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j20YN-0002pY-TZ
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 17:32:20 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:31078)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1j20YN-0002lH-NF; Wed, 12 Feb 2020 17:32:19 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 73D3674638A;
 Wed, 12 Feb 2020 23:32:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A37574637F; Wed, 12 Feb 2020 23:32:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 12 Feb 2020 23:26:14 +0100
Subject: [PATCH] target/ppc/cpu.h: Remove duplicate includes
To: qemu-devel@nongnu.org
Message-Id: <20200212223207.5A37574637F@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 74433bf083b added some includes but added them twice. Since
these are guarded against multiple inclusion including them once is
enough.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 target/ppc/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 3a1eb76004..07dd2b4da7 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -23,8 +23,6 @@
 #include "qemu/int128.h"
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
-#include "exec/cpu-defs.h"
-#include "cpu-qom.h"
 
 /* #define PPC_EMULATE_32BITS_HYPV */
 
-- 
2.21.1


