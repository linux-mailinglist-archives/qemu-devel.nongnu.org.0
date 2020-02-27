Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783D1713BA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 10:09:16 +0100 (CET)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7FAR-0005mF-FE
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 04:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chenyi.qiang@intel.com>) id 1j7F8b-0002wA-H0
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chenyi.qiang@intel.com>) id 1j7F8a-0005gq-Bs
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:07:21 -0500
Received: from mga12.intel.com ([192.55.52.136]:30314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chenyi.qiang@intel.com>)
 id 1j7F8a-0005cD-3k
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:07:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 01:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,491,1574150400"; d="scan'208";a="261401231"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by fmsmga004.fm.intel.com with ESMTP; 27 Feb 2020 01:07:10 -0800
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/3] Fix Skylake, Cascadelake and Icelake Server CPU models
Date: Thu, 27 Feb 2020 17:08:05 +0800
Message-Id: <20200227090808.17686-1-chenyi.qiang@intel.com>
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current Skylake-Server, Cascadelake-Server and Icelake-Server CPU models
lack several VMX features. Icelake-Server also lacks two features in
FEAT_7_0_EBX. In addition, The model numbers of Icelake-Client and
Icelake-Server need to be fixed.

Chenyi Qiang (3):
  target/i386: add missing vmx features for several CPU models
  target/i386: add two missing features for Icelake-Server CPU model
  target/i386: modify Icelake-Client and Icelake-Server CPU model number

 target/i386/cpu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.17.1


