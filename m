Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CE4196CA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:55:56 +0200 (CEST)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUs2t-0007qb-4D
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUrw8-00007C-IF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:48:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1mUrw5-0001Ru-Om
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:48:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 1A9D21F42176
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] virtio-gpu: CONTEXT_INIT feature
Date: Mon, 27 Sep 2021 16:48:39 +0200
Message-Id: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
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

This is a different attempt at upstreaming the work I have been doing to
enable support for the Venus Virtio-GPU Vulkan driver.

I believe the previous one [0] was a bit too much stuff in one place,
therefore with this I would like to try a more fine-grained approach.

I will just start by the CONTEXT_INIT feature as it was the first commit
of the series aforementioned and the virtio-spec has been updated
recently on that regard [1]. Hopefully this would also answer Gerd's
comment on the previous patch [2].

[0] https://www.mail-archive.com/qemu-devel@nongnu.org/msg826897.html
[1] https://github.com/oasis-tcs/virtio-spec/commit/aad2b6f3620ec0c9d16aaf046db8c282c24cce3e
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg827304.html

Antonio Caggiano (1):
  virtio-gpu: CONTEXT_INIT feature

 hw/display/virtio-gpu-base.c                |  2 ++
 hw/display/virtio-gpu-virgl.c               | 10 ++++++++--
 include/hw/virtio/virtio-gpu-bswap.h        |  2 +-
 include/standard-headers/linux/virtio_gpu.h |  9 +++++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.30.2


