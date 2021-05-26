Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51D390DC4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:07:59 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lli1e-0001xj-8w
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@telegraphics.com.au>)
 id 1llhzv-0001Du-Rt
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:06:11 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51318)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1llhzm-0005HN-T4
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:06:11 -0400
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id E4F472AB83; Tue, 25 May 2021 21:00:36 -0400 (EDT)
To: Laurent Vivier <laurent@vivier.eu>
Message-Id: <b3213a5df74ad7ca8880c2965ae56dbef8831807.1621989669.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] .mailmap: Update my email address
Date: Wed, 26 May 2021 10:41:09 +1000
Received-SPF: none client-ip=98.124.60.144;
 envelope-from=fthain@telegraphics.com.au; helo=kvm5.telegraphics.com.au
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PP_MIME_FAKE_ASCII_TEXT=0.998,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index a1bd659817..772f3e16cf 100644
--- a/.mailmap
+++ b/.mailmap
@@ -91,6 +91,7 @@ Erik Smit <erik.lucas.smit@gmail.com>
 Fabrice Desclaux <fabrice.desclaux@cea.fr>
 Fernando Luis Vázquez Cao <fernando_b1@lab.ntt.co.jp>
 Fernando Luis Vázquez Cao <fernando@oss.ntt.co.jp>
+Finn Thain <fthain@linux-m68k.org> <fthain@telegraphics.com.au>
 Gautham R. Shenoy <ego@in.ibm.com>
 Gautham R. Shenoy <ego@linux.vnet.ibm.com>
 Gonglei (Arei) <arei.gonglei@huawei.com>
-- 
2.26.3


