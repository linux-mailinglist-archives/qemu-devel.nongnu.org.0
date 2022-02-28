Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA174C61DB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 04:33:36 +0100 (CET)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOWmz-0004r9-IJ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 22:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nOWlq-0004Ap-CP
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:32:22 -0500
Received: from mga06.intel.com ([134.134.136.31]:35165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nOWln-00007O-1C
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 22:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646019139; x=1677555139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y/NpS48FS5DRwbTSbIBmqppFpIIkSwVxCWjAvWI4xxw=;
 b=XnXJg514e3+UPcf2cFZxOY3/DSPaAmT2dgQBzGGmeiPmCswOgGYVNaYF
 wq14Reqbtwx4FMYmfI/6wwSPJgKsktOxb8+GU8U5p6vWK81zBSASkNiao
 rCuu7U20SC2k/Cq2fTOyxTVUsi25iwhqWYeMrf0k0bW7wLwryh332lmxG
 Aiim5dme2p0Ms1NLOuujrJK0JZ+ysX52J6r92w3odKb2fXz5xPqK/Bd1+
 vVfjyJIbnvh78bMIHMjbHqhDPRsSFkFVgcJlOAumeMZtlS9TlvO/nelRs
 n6AtOQxJY6Uaf1p4YCsOLL6q370k/wkzbK1IKCwJdaa0j6M7b7KvmZ7Cr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="313512854"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="313512854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:32:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="550058867"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:32:10 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/vl: Remove redundant local variable
Date: Mon, 28 Feb 2022 11:27:10 +0800
Message-Id: <20220228032710.184181-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=zhenzhong.duan@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there is already a local variable opts in main function scope,
no need to define another one with same name in smaller scope.

No functional changes.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 softmmu/vl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800fdf..34b24512f8c5 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3273,12 +3273,10 @@ void qemu_init(int argc, char **argv, char **envp)
                      exit(1);
                 }
                 break;
-            case QEMU_OPTION_watchdog_action: {
-                QemuOpts *opts;
+            case QEMU_OPTION_watchdog_action:
                 opts = qemu_opts_create(qemu_find_opts("action"), NULL, 0, &error_abort);
                 qemu_opt_set(opts, "watchdog", optarg, &error_abort);
                 break;
-            }
             case QEMU_OPTION_parallel:
                 add_device_config(DEV_PARALLEL, optarg);
                 default_parallel = 0;
-- 
2.25.1


