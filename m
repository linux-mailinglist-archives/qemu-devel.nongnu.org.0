Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6667141C133
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:00:14 +0200 (CEST)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVVRl-0007X3-9J
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVVPp-0005Z1-1y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:58:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mVVPf-0005CF-FE
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 04:58:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id F37161F44064
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/2] virtio-gpu: Shared memory capability
Date: Wed, 29 Sep 2021 10:57:48 +0200
Message-Id: <20210929085750.114507-1-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously part of [0], now a patch series on its own.

This patch series cherry picks two commits from [1] and applies one fix
according to [2], which should answer Gerd's comment [3] on previous
patch.

RFC as I believe it needs a proper review from both authors of first two
commits.

v2: Squash patch #3 into patch #2.

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826897.html
[1] https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next/
[2] https://github.com/torvalds/linux/commit/0dd4ff93f4c8dba016ad79384007da4938cd54a1
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg827306.html

Dr. David Alan Gilbert (1):
  virtio: Add shared memory capability

Gerd Hoffmann (1):
  virtio-gpu: hostmem

 hw/display/virtio-gpu-pci.c    | 14 ++++++++++++++
 hw/display/virtio-gpu.c        |  1 +
 hw/display/virtio-vga.c        | 32 +++++++++++++++++++++++---------
 hw/virtio/virtio-pci.c         | 19 +++++++++++++++++++
 hw/virtio/virtio-pci.h         |  4 ++++
 include/hw/virtio/virtio-gpu.h |  5 +++++
 6 files changed, 66 insertions(+), 9 deletions(-)

-- 
2.30.2


