Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72C15BA4E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 08:54:09 +0100 (CET)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j29K4-0003OT-JF
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 02:54:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.hu@linux.intel.com>) id 1j29J8-0002WR-6Y
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:53:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.hu@linux.intel.com>) id 1j29J7-0001vH-Ad
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:53:10 -0500
Received: from mga17.intel.com ([192.55.52.151]:53027)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <robert.hu@linux.intel.com>)
 id 1j29J7-0001tl-2Z
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 02:53:09 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 23:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; d="scan'208";a="381032017"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 12 Feb 2020 23:53:01 -0800
From: Robert Hoo <robert.hu@linux.intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, laurent@vivier.eu,
 philmd@redhat.com, berrange@redhat.com
Subject: [PATCH 0/2] Add AVX512F optimization option and buffer_zero_avx512()
Date: Thu, 13 Feb 2020 15:52:57 +0800
Message-Id: <1581580379-54109-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
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
Cc: robert.hu@intel.com, Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. Add avx512_opt option and enable it when host has the ability

2. Implement new buffer_zero_avx512() with AVX512F instructions

Robert Hoo (2):
  configure: add configure option avx512f_opt
  util: add function buffer_zero_avx512()

 configure            | 39 ++++++++++++++++++++++++++++++++++++
 include/qemu/cpuid.h |  3 +++
 util/bufferiszero.c  | 56 +++++++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 95 insertions(+), 3 deletions(-)

-- 
1.8.3.1


