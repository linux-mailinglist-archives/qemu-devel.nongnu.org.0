Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525B60EDC4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 04:07:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onsCv-0001cp-S6; Wed, 26 Oct 2022 22:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCW-0001Sr-Ve
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:00:59 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1onsCT-0004sz-8G
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 22:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666836053; x=1698372053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vxkqjjwLdwCGpRuWSBGiQ/GuSBzZlQCMUwt+8NDqmvs=;
 b=UmIPd63qfTZmeGxbiYP5OZd0mX6VwxjtVgIp9hBsFbavcvaZi08IcwMR
 S8maIfQrbHibcMfk5HEbiro2rjAbO5LPGzv0f5DG4jal6UjFh8lozol5l
 PDKbarUpMqzjVemRxjECn36q+6DiSwHhSWBZqO99hkPpGM/Y/jk7wyhEI
 pofyTZeUtUMspULvKA1NJ9KLe9c3oYygCtEv+ufYzeEyH4WCo42Pj+Zy+
 9CyQh0gEK+4wWXFj3SV1u1yA0i9Miix98BYUDMPQPCZgid83nWw86JzM1
 9smnWLiAYvPycBdxXtIBcZjvyN9c/AG7IeS77c+ieXU2wltpWpa+L1AXy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="370174868"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="370174868"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:37 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877407925"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="877407925"
Received: from b49691a74b20.jf.intel.com ([10.45.76.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 19:00:37 -0700
From: "Wang, Lei" <lei4.wang@intel.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, berrange@redhat.com,
 xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: [PATCH 0/6] Support for new CPU model SapphireRapids
Date: Wed, 26 Oct 2022 19:00:30 -0700
Message-Id: <20221027020036.373140-1-lei4.wang@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei4.wang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series aims to add a new CPU model SapphireRapids, and tries to
address the problem stated in
https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
so that named CPU model can define its own AMX values, and QEMU won't
pass the wrong AMX values to KVM in future platforms if they have
different values supported.

The original patch is
https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.

Wang, Lei (6):
  i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
  i386: Remove unused parameter "uint32_t bit" in
    feature_word_description()
  i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
    features
  i386: Mask and report unavailable multi-bit feature values
  i386: Initialize AMX CPUID leaves with corresponding env->features[]
    leaves
  i386: Add new CPU model SapphireRapids

 target/i386/cpu-internal.h |  11 ++
 target/i386/cpu.c          | 314 ++++++++++++++++++++++++++++++++++---
 target/i386/cpu.h          |  18 +++
 3 files changed, 323 insertions(+), 20 deletions(-)

-- 
2.34.1


