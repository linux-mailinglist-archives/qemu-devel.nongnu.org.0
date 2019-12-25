Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84812A678
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Dec 2019 07:48:28 +0100 (CET)
Received: from localhost ([::1]:44328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ik0T5-0005XF-LW
	for lists+qemu-devel@lfdr.de; Wed, 25 Dec 2019 01:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiaoyao.li@intel.com>) id 1ik0S1-0004jM-Uw
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xiaoyao.li@intel.com>) id 1ik0S0-0007xv-9p
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:64729)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xiaoyao.li@intel.com>)
 id 1ik0S0-0007pn-2F
 for qemu-devel@nongnu.org; Wed, 25 Dec 2019 01:47:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Dec 2019 22:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,353,1571727600"; d="scan'208";a="219965374"
Received: from lxy-clx-4s.sh.intel.com ([10.239.43.57])
 by orsmga003.jf.intel.com with ESMTP; 24 Dec 2019 22:47:10 -0800
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/2] Fix Cooperlake CPU model
Date: Wed, 25 Dec 2019 14:30:16 +0800
Message-Id: <20191225063018.20038-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Cathy Zhang <cathy.zhang@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current Cooperlake CPU model lacks VMX features which are introduced by Paolo
several months ago, and it also lacks 2 security features in
MSR_IA32_ARCH_CAPABILITIES disclosed recently.

Xiaoyao Li (2):
  target/i386: Add new bit definitions of MSR_IA32_ARCH_CAPABILITIES
  target/i386: Add missed features to Cooperlake CPU model

 target/i386/cpu.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.h | 13 +++++++-----
 2 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.19.1


