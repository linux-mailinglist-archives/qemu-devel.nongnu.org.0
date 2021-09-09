Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958CC404DC1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:08:33 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIr2-0003eL-M6
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1mOIo2-0000vp-OS
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:32 -0400
Received: from mail05.asahi-net.or.jp ([202.224.55.45]:47237)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1mOInz-0006mi-4d
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 08:05:25 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail05.asahi-net.or.jp (Postfix) with ESMTPA id 69B7724FD8;
 Thu,  9 Sep 2021 21:05:14 +0900 (JST)
Received: from SIOS1075.flets-east.jp (y243185.dynamic.ppp.asahi-net.or.jp
 [118.243.243.185])
 by sakura.ysato.name (Postfix) with ESMTPSA id A40251C05A8;
 Thu,  9 Sep 2021 21:05:13 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] RX target update
Date: Thu,  9 Sep 2021 21:04:57 +0900
Message-Id: <20210909120459.2199223-1-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.45;
 envelope-from=ysato@users.sourceforge.jp; helo=mail05.asahi-net.or.jp
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found some problem in RX target.
This patches fix it.

Yoshinori Sato (2):
  target/rx: Fix helper definiton.
  target/rx: gdbstub add acc register operation.

 target/rx/helper.h  | 36 ++++++++++++++++++------------------
 target/rx/gdbstub.c |  3 ++-
 2 files changed, 20 insertions(+), 19 deletions(-)

-- 
2.30.2


