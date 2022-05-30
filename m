Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50769538777
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:43:47 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkMk-0007rC-EB
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKZ-0006JN-LL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:41:31 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:45676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKY-0008Ao-4Q
 for qemu-devel@nongnu.org; Mon, 30 May 2022 14:41:31 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1nvkKQ-0006e7-4U; Mon, 30 May 2022 20:41:22 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 1/2] MAINTAINERS: Add myself as the maintainer for Hyper-V VMBus
Date: Mon, 30 May 2022 20:41:10 +0200
Message-Id: <ee344768c1a19417e005bd96c2c6e256986380d5.1653934780.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1653934780.git.mail@maciej.szmigiero.name>
References: <cover.1653934780.git.mail@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This way there is some contact point for incoming patches,
and somebody to review and pick up them.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..00dc4a8ecb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1777,6 +1777,12 @@ F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
 T: git https://gitlab.com/jsnow/qemu.git ide
 
+Hyper-V VMBus
+M: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
+S: Odd Fixes
+F: hw/hyperv/vmbus.c
+F: include/hw/hyperv/vmbus*.h
+
 OMAP
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org

