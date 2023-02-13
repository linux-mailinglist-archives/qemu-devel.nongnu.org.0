Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06067694156
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:35:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRV8y-0005Er-IE; Mon, 13 Feb 2023 04:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV8w-0005Ei-4T
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:02 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV8r-0006Fx-Qb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676280537; x=1707816537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atvZGepej5YcLFtx3mYUNr9UNgjfXy1ME0XpKL0DymQ=;
 b=jII4/kqWLI41RnJyTainVYNgyzEBekcK6ksEuwHTVQdHpq6Tckm4wu0X
 aZwYuxiZYZSHcFut08p1G2jy0PkisQ/Q/bZi122RZoiSBTmq5TJohOJxd
 xuyppXy7D566AR0Wwg/WvxKaN4Xce1iALgBejTekokzTU0rMl9VT0u3gK
 JvZ/ifiO89OC3zSq54TXcf0Pi2NBPdSKWkNU6ClKJ9+Ref12r1kDxmd1a
 Ifw8ToQ14Sp40hQkJfYXYmLEttn/yYJ7XMqXOv8x9qmH4tQJunr3pmjMH
 FTFH5b70Da9JDhmWCsRzykguKctAOfzycP63nHqZg1TwH0g3ilAnS0q9s g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318875489"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="318875489"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792659731"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="792659731"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 01:28:45 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH RESEND 01/18] machine: Fix comment of
 machine_parse_smp_config()
Date: Mon, 13 Feb 2023 17:36:08 +0800
Message-Id: <20230213093625.158170-2-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Zhao Liu <zhao1.liu@intel.com>

Now smp supports dies and clusters, so add description about these 2
levels in the comment of machine_parse_smp_config().

Fixes: 864c3b5 (hw/core/machine: Introduce CPU cluster topology support)
Suggested-by: Robert Hoo <robert.hu@linux.intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-smp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index c3dab007dadc..3fd9e641efde 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -51,8 +51,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
  * machine_parse_smp_config: Generic function used to parse the given
  *                           SMP configuration
  *
- * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
- * automatically computed based on the provided ones.
+ * Any missing parameter in "cpus/maxcpus/sockets/dies/clusters/cores/threads"
+ * will be automatically computed based on the provided ones.
  *
  * In the calculation of omitted sockets/cores/threads: we prefer sockets
  * over cores over threads before 6.2, while preferring cores over sockets
@@ -66,7 +66,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
  *
  * For compatibility, apart from the parameters that will be computed, newly
  * introduced topology members which are likely to be target specific should
- * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
+ * be directly set as 1 if they are omitted (e.g. dies for PC since v4.1 and
+ * clusters for arm since v7.0).
  */
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp)
-- 
2.34.1


