Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD5624FCFC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 13:51:59 +0200 (CEST)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAB14-0007fz-8K
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 07:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAAyh-00031J-Pz
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:49:31 -0400
Received: from gate-2.cri.epita.net ([163.5.55.20]:54842
 helo=mail-2.srv.cri.epita.fr)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr>)
 id 1kAAyf-0003dm-Ug
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 07:49:31 -0400
Received: from MattGorko-Laptop.home
 (lfbn-idf1-1-1395-83.w90-79.abo.wanadoo.fr [90.79.87.83])
 (Authenticated sender: cesar.belley)
 by mail-2.srv.cri.epita.fr (Postfix) with ESMTPSA id A21863FB60;
 Mon, 24 Aug 2020 13:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lse.epita.fr; s=cri;
 t=1598269758; bh=/33EairxGlE32NvdntSN+rcwZBT7otF2vHwM46qIMbY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fc1Mc566/ohzDsk+X6Wu5wtB5TPdKtMu8WY4BvslmRnAgxKLS+uonxRACpPvQOSy4
 iNyCfNdg8GyUNuemaC8K30X4FzXBv0VByEKBRdCHkaFi5Rw3aOHj5v3LCFWP9O7Nbb
 e8tszNC207QIo7uCq/ckJJT8mq0ZOwer+VbLdPFg=
From: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/13] docs/qdev-device-use.txt: Add USB U2F key to the
 QDEV devices examples
Date: Mon, 24 Aug 2020 13:48:24 +0200
Message-Id: <20200824114827.81623-11-cesar.belley@lse.epita.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824114827.81623-1-cesar.belley@lse.epita.fr>
References: <20200824114827.81623-1-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=163.5.55.20;
 envelope-from=srs0=45nv=cc=lse.epita.fr=cesar.belley@cri.epita.fr;
 helo=mail-2.srv.cri.epita.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 07:49:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: César Belley <cesar.belley@lse.epita.fr>
---
 docs/qdev-device-use.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/qdev-device-use.txt b/docs/qdev-device-use.txt
index f8d0d2fe29..9889521e3c 100644
--- a/docs/qdev-device-use.txt
+++ b/docs/qdev-device-use.txt
@@ -325,6 +325,7 @@ The new way is -device DEVNAME,DEV-OPTS...  Details depend on DRIVER:
 * mouse           -device usb-mouse
 * tablet          -device usb-tablet
 * wacom-tablet    -device usb-wacom-tablet
+* u2f             -device u2f-{emulated,passthru}
 * braille         See "Character Devices"
 
 === Watchdog Devices ===
-- 
2.28.0


