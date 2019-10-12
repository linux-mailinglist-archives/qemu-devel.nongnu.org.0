Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF22D4C2C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 04:41:31 +0200 (CEST)
Received: from localhost ([::1]:58354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ7LW-0005KD-Ks
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 22:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJ7K9-00045c-IC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iJ7K8-0001Ho-FQ
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:63668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iJ7K8-0001HK-7v
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 22:40:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 19:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,286,1566889200"; d="scan'208";a="394631432"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2019 19:40:01 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/2] migration/compress: refine the compress case
Date: Sat, 12 Oct 2019 10:39:30 +0800
Message-Id: <20191012023932.1863-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two patches related to compress:

1. simplify the check since compress QEMUFile is not writable
2. handle compress setup failure gracefully

Wei Yang (2):
  migration/compress: compress QEMUFile is not writable
  migration/compress: disable compress if failed to setup

 migration/migration.c |  9 +++++++++
 migration/migration.h |  1 +
 migration/qemu-file.c | 16 +++-------------
 migration/ram.c       | 15 ++++++++-------
 4 files changed, 21 insertions(+), 20 deletions(-)

-- 
2.17.1


