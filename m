Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3220D09B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 20:28:45 +0200 (CEST)
Received: from localhost ([::1]:54010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpyWK-0001fn-EP
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 14:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUc-0008Gh-Rc; Mon, 29 Jun 2020 14:26:58 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jpyUa-0000Ze-MF; Mon, 29 Jun 2020 14:26:58 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id AB3B6BF450;
 Mon, 29 Jun 2020 18:26:52 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 00/17] hw/block/nvme: bump to v1.3
Date: Mon, 29 Jun 2020 20:26:25 +0200
Message-Id: <20200629182642.1170387-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This adds mandatory features of NVM Express v1.3 to the emulated NVMe
device.

Klaus Jensen (17):
  hw/block/nvme: bump spec data structures to v1.3
  hw/block/nvme: additional tracing
  hw/block/nvme: add support for the abort command
  hw/block/nvme: add temperature threshold feature
  hw/block/nvme: mark fw slot 1 as read-only
  hw/block/nvme: add support for the get log page command
  hw/block/nvme: add support for the asynchronous event request command
  hw/block/nvme: move NvmeFeatureVal into hw/block/nvme.h
  hw/block/nvme: flush write cache when disabled
  hw/block/nvme: fix missing endian conversion
  hw/block/nvme: add remaining mandatory controller parameters
  hw/block/nvme: support the get/set features select and save fields
  hw/block/nvme: make sure ncqr and nsqr is valid
  hw/block/nvme: support identify namespace descriptor list
  hw/block/nvme: enforce valid queue creation sequence
  hw/block/nvme: provide the mandatory subnqn field
  hw/block/nvme: bump supported version to v1.3

 block/nvme.c          |  18 +-
 hw/block/nvme.c       | 608 ++++++++++++++++++++++++++++++++++++++++--
 hw/block/nvme.h       |  65 ++++-
 hw/block/trace-events |  27 +-
 include/block/nvme.h  | 216 ++++++++++++---
 5 files changed, 870 insertions(+), 64 deletions(-)

-- 
2.27.0


