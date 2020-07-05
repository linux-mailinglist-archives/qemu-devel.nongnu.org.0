Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C018821505A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 01:23:42 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsDz3-0004iB-FJ
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 19:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cathy.zhang@intel.com>)
 id 1jsDy6-0003Pi-QI
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 19:22:43 -0400
Received: from mga17.intel.com ([192.55.52.151]:47201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cathy.zhang@intel.com>)
 id 1jsDy4-0008Iy-38
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 19:22:42 -0400
IronPort-SDR: hf3YOkqQhqCRg+yr0bv0wDSUMnzvKfqmlaRppbHOCtMcALxmeuJbgKtkuZyoTvDdHtq+bEJckt
 n/BSsGgjmn3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="127412307"
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; d="scan'208";a="127412307"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2020 16:22:30 -0700
IronPort-SDR: n9tGc8GXrK9SHRXjiBEFklKEqHISA0HsFpgts9vWE0pHNjYHNEfVuXMx9FRmLPlOucOhiIY2c7
 CEVMq95qcg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,317,1589266800"; d="scan'208";a="388044988"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.127])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2020 16:22:31 -0700
From: Cathy Zhang <cathy.zhang@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2]  Add new features for intel processor
Date: Mon,  6 Jul 2020 07:17:14 +0800
Message-Id: <1593991036-12183-1-git-send-email-cathy.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.151; envelope-from=cathy.zhang@intel.com;
 helo=mga17.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 19:22:32
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Cathy Zhang <cathy.zhang@intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset is to add two new features for intel processors
which support them, like Sapphire Rapids. SERIALIZE is a faster
serializing instruction which does not modify registers,
arithmetic flags or memory, will not cause VM exit. TSX suspend
load tracking instruction aims to give a way to choose which
memory accesses do not need to be tracked in the TSX read set.

Cathy Zhang (2):
  target/i386: Add SERIALIZE cpu feature
  target/i386: Enable TSX Suspend Load Address Tracking feature

 target/i386/cpu.c | 4 ++--
 target/i386/cpu.h | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

--
1.8.3.1


