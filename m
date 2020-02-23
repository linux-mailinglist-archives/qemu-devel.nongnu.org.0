Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68788169A27
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Feb 2020 22:08:10 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5yTw-000544-Vq
	for lists+qemu-devel@lfdr.de; Sun, 23 Feb 2020 16:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1j5ySv-0004Ef-JF
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1j5ySu-0001g5-3O
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:59518)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1j5ySt-0001eg-Rw
 for qemu-devel@nongnu.org; Sun, 23 Feb 2020 16:07:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Feb 2020 13:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,477,1574150400"; d="scan'208";a="230945804"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2020 13:06:57 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] net/colo-compare.c: Expose more COLO internal
Date: Mon, 24 Feb 2020 04:58:03 +0800
Message-Id: <20200223205805.26412-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
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
Cc: Daniel Cho <danielcho@qnap.com>, Zhang Chen <chen.zhang@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Make a way to config COLO parameter detailed according to user cases
and environment.

Zhang Chen (2):
  net/colo-compare.c: Expose "compare_timeout" to user
  net/colo-compare.c: Expose "expired_scan_cycle" to user

 net/colo-compare.c | 95 +++++++++++++++++++++++++++++++++++++++++++---
 qemu-options.hx    |  6 ++-
 2 files changed, 94 insertions(+), 7 deletions(-)

-- 
2.17.1


