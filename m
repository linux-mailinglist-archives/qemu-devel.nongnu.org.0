Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2DED4FAB
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Oct 2019 14:27:04 +0200 (CEST)
Received: from localhost ([::1]:32926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJGUA-0002DC-K2
	for lists+qemu-devel@lfdr.de; Sat, 12 Oct 2019 08:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cathy.zhang@intel.com>) id 1iJBRt-0001Gv-RK
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cathy.zhang@intel.com>) id 1iJBRs-0001z3-At
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:21 -0400
Received: from mga01.intel.com ([192.55.52.88]:29433)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cathy.zhang@intel.com>)
 id 1iJBRs-0001rE-2w
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 03:04:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Oct 2019 00:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,286,1566889200"; d="scan'208";a="197802825"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.101])
 by orsmga003.jf.intel.com with ESMTP; 12 Oct 2019 00:04:11 -0700
From: Cathy Zhang <cathy.zhang@intel.com>
To: pbonzini@redhat.com,
	rth@twiddle.net,
	ehabkost@redhat.com
Subject: [PATCH 0/3] Add CPU model for intel processor Cooper Lake
Date: Sat, 12 Oct 2019 15:00:35 +0800
Message-Id: <1570863638-22272-1-git-send-email-cathy.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
X-Mailman-Approved-At: Sat, 12 Oct 2019 08:24:54 -0400
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
Cc: qemu-devel@nongnu.org, Cathy Zhang <cathy.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset is to add CPU model for intel processor Cooper Lake. It 
will inherit features from the existing CPU model Cascadelake-Server, 
meanwhile, add the platform associated new instruction and feature
for speculative execution which the host supports. There are associated
feature bit and macro defined here as needed. 

Cathy Zhang (3):
  i386: Add MSR feature bit for MDS-NO
  i386: Add macro for stibp
  i386: Add new CPU model Cooperlake

 target/i386/cpu.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |  2 ++
 2 files changed, 61 insertions(+)

-- 
1.8.3.1


