Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D19215F99
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 21:44:56 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsX2t-0005ge-GG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 15:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1jsX1v-0004hR-3s; Mon, 06 Jul 2020 15:43:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1jsX1t-0000q0-Ck; Mon, 06 Jul 2020 15:43:54 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6640320675;
 Mon,  6 Jul 2020 19:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594064630;
 bh=Ko1ATtLtC0JW7qB7hi4XMYzfkK5mQG+e30SA5Gi7a/Q=;
 h=From:To:Cc:Subject:Date:From;
 b=xkAYeot9jqlydQWbeBiGFJXIywypzGLRMOO4GBudh3DhIFEh3vjqo2CD1d8XQT/xr
 ZqDnfGJXtunlGmzP9Vv/Xs0SIRhWztJHqhFCuxY7LmcHMwe5MmJ+jKwpBhG9jrtLdS
 s98WVpg3fjGx95+aImA+L8XmKPq0Pp1Ryk0igmb4=
From: Keith Busch <kbusch@kernel.org>
To: qemu-block@nongnu.org, qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] MAINTAINERS: update nvme entry
Date: Mon,  6 Jul 2020 12:43:42 -0700
Message-Id: <20200706194342.1996219-1-kbusch@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 15:43:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The nvme emulated device development pace has increased recently.  Klaus
has offered to co-maintain, and since we have many new contributions
coming through, we're adding a repository to accumulate and test new
features.

Cc: Klaus Jensen <its@irrelevant.dk>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c31c878c63..fbeba04dc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1793,10 +1793,12 @@ F: include/hw/virtio/virtio-crypto.h
 
 nvme
 M: Keith Busch <kbusch@kernel.org>
+M: Klaus Jensen <its@irrelevant.dk>
 L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/nvme*
 F: tests/qtest/nvme-test.c
+T: git git://git.infradead.org/qemu-nvme.git nvme-next
 
 megasas
 M: Hannes Reinecke <hare@suse.com>
-- 
2.24.1


