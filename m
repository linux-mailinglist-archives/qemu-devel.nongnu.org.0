Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54621DEF7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 19:46:05 +0200 (CEST)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv2Wi-0008Qt-Dw
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 13:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jv2VZ-0007XF-L7
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:44:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:22540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1jv2VX-0006H5-2v
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:44:53 -0400
IronPort-SDR: D2Rh77fmTkgE3CkpYQRDvHV3AEamFLKaLIIZslnHj0Nm2MEOcyFZT0tR6aYtSx3UzPOik3KAPz
 5CHhjX8BqV4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="128255218"
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="128255218"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 10:44:40 -0700
IronPort-SDR: 1k+00RDSGK8FP0SqRLDqkBHt0+9Dc0Js+riWNsrE1NVjdop5NnqQbFft5hLa7H0u6fiP+s9uA4
 U3ZxVfGFzP2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; d="scan'208";a="317450481"
Received: from lxy-dell.sh.intel.com ([10.239.159.21])
 by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2020 10:44:38 -0700
From: Xiaoyao Li <xiaoyao.li@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/2] Fixes for env->user_features
Date: Tue, 14 Jul 2020 01:44:34 +0800
Message-Id: <20200713174436.41070-1-xiaoyao.li@intel.com>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=192.55.52.136; envelope-from=xiaoyao.li@intel.com;
 helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 13:44:48
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1 fixes the env->features set by versioned CPU model.

Patch 2 fixed the env->features set by unavailable_features due to
feature_dependencies[] checking.

Xiaoyao Li (2):
  i368/cpu: Clear env->user_features after loading versioned CPU model
  i386/cpu: Don't add unavailable_features to env->user_features

 target/i386/cpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.18.4


