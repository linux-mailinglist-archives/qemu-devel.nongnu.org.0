Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DDC3F947F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 08:46:42 +0200 (CEST)
Received: from localhost ([::1]:48720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJVdH-0001AA-I6
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 02:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mJVau-0007Y6-F1
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:44:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:32024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1mJVan-0001fP-WE
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 02:44:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197471991"
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="197471991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:43:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,355,1620716400"; d="scan'208";a="528205127"
Received: from chenyi-pc.sh.intel.com ([10.239.159.88])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 23:43:50 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/2] Remove unsupported features in SNR CPU model
Date: Fri, 27 Aug 2021 14:48:16 +0800
Message-Id: <20210827064818.4698-1-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 1: https://lore.kernel.org/qemu-devel/20210825195438.914387-2-ehabkost@redhat.com/

Patch 2 removes one more feature (core-capability) in Snowridge-v4 CPU
model based on previous patch.

Chenyi Qiang (2):
  target/i386: Remove split lock detect in Snowridge CPU model
  target/i386: Remove core-capability in Snowridge CPU model

 target/i386/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.17.1


