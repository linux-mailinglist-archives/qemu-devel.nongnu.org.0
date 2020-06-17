Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85B1FCEC5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 15:47:07 +0200 (CEST)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlYPC-00076f-Ma
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 09:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlYNV-0005zL-5b; Wed, 17 Jun 2020 09:45:21 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jlYNR-0006w1-RK; Wed, 17 Jun 2020 09:45:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B355D748DCA;
 Wed, 17 Jun 2020 15:45:05 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 979607482CD; Wed, 17 Jun 2020 15:45:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Wed, 17 Jun 2020 15:06:05 +0200
Subject: [PATCH 1/2] .gitignore: Ignore generated srorage-daemon files for
 in-tree builds
To: qemu-devel@nongnu.org
Message-Id: <20200617134505.979607482CD@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 0c5af83aa7..d9ef9f635a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,6 +46,9 @@
 !/qapi/qapi-visit-core.c
 /qapi/qapi-visit.[ch]
 /qapi/qapi-doc.texi
+/storage-daemon/qapi/qapi-doc.texi
+/storage-daemon/qapi/qapi-*.[ch]
+/qemu-storage-daemon
 /qemu-edid
 /qemu-img
 /qemu-nbd
-- 
2.21.3


