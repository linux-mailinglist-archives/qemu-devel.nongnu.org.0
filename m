Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7574D6DAA
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 09:43:57 +0100 (CET)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSxLv-0005zf-LN
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 03:43:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linuxmaker@163.com>)
 id 1nSxJy-0004oP-Nh
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 03:41:54 -0500
Received: from mail-m971.mail.163.com ([123.126.97.1]:1506)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <linuxmaker@163.com>) id 1nSxJs-0003vz-4X
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 03:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DdPoi
 7rpSOkcw9KFqqeVrVVDyjQErvN/91Ty/x8kwvM=; b=bPihnuBuaRPkxbEhUcoUq
 5iix0f/nBp4jS49uoQULkZ0KL5kzC58Lmb7rjxqQrbEi4I67dTZF4mvVq53dYGK6
 FrYeM1d8T3T0HO09obQDarkBCNt/bK3s8W6Fg/sr8rYrdPExS9Q+JEjRBJgx6TP+
 UPLV+V6OhvDMmxLtOz8ROU=
Received: from time-machine.lan (unknown [111.192.119.133])
 by smtp1 (Coremail) with SMTP id GdxpCgA3wU8qWSxi8XONDA--.16579S2;
 Sat, 12 Mar 2022 16:26:24 +0800 (CST)
From: zzl <linuxmaker@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Resolves: https://gitlab.com/qemu-project/qemu/-/issues/542
Date: Sat, 12 Mar 2022 16:26:07 +0800
Message-Id: <20220312082607.5974-1-linuxmaker@163.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Signed-off-by: zzl <linuxmaker@163.com>
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgA3wU8qWSxi8XONDA--.16579S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRAgArDUUUU
X-Originating-IP: [111.192.119.133]
X-CM-SenderInfo: polq35ppdnv2i6rwjhhfrp/xtbCbgDB5WBbCF-6JQAAs5
Received-SPF: pass client-ip=123.126.97.1; envelope-from=linuxmaker@163.com;
 helo=mail-m971.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: zzl <linuxmaker@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 hw/audio/intel-hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 5f8a878f20..ff32936cfd 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -328,7 +328,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
             dprint(d, 2, "%s: corb ring empty\n", __func__);
             return;
         }
-        if (d->rirb_count == d->rirb_cnt) {
+        if (d->rirb_count >= d->rirb_cnt) {
             dprint(d, 2, "%s: rirb count reached\n", __func__);
             return;
         }
-- 
2.32.0


