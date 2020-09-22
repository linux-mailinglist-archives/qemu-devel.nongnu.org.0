Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D9273EC2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 11:44:32 +0200 (CEST)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKeqd-00015W-7p
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 05:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kKeod-00082X-Dr
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:42:27 -0400
Received: from mga11.intel.com ([192.55.52.93]:64257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kKeoa-0008Q8-Jk
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 05:42:26 -0400
IronPort-SDR: W5M+T3i2/v9rZemJNtgobiclICOnjRJ3T8go47dvnqyukzcmUh3BcYAZxxgjdW60fdlqI6tyFt
 YLpDpx9Pn7ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="157947003"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="157947003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 02:42:19 -0700
IronPort-SDR: 2vCjwGbx9QD9KYf/GDdCauDxfhsypbusi6PkgHHEzgSLTnFTDuPvmZINqm4Zz++77wtzcQrl4J
 7tbzT9IZiyXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="348424016"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by orsmga007.jf.intel.com with ESMTP; 22 Sep 2020 02:42:17 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 0/3] Optimized some code for COLO
Date: Tue, 22 Sep 2020 05:24:47 -0400
Message-Id: <1600766690-94980-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 05:42:20
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leirao <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimized some code for COLO and fixed a qemu crash when guest
shutdown in COLO mode.

leirao (3):
  Optimize seq_sorter function for colo-compare
  Reduce the time of checkpoint for COLO
  Fix the qemu crash when guest shutdown in COLO mode

 migration/ram.c    | 14 +++++++++++++-
 net/colo-compare.c |  6 +-----
 softmmu/vl.c       |  1 +
 3 files changed, 15 insertions(+), 6 deletions(-)

--
1.8.3.1


