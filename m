Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194935FC80
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 22:21:10 +0200 (CEST)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWm0b-0006O7-Mw
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 16:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlyu-0005Vp-CD
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:11175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jose.carlos.venegas.munoz@intel.com>)
 id 1lWlys-0005Ll-Qv
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 16:19:24 -0400
IronPort-SDR: trB/+044gGNSYYFO2I/4TlPmxXD0j03JMlYwQMlVK2BTIcIWJ1UEQtPpkX9UlZnR02Rdr86Taa
 LGuo4qK0Ruxw==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174833162"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174833162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:21 -0700
IronPort-SDR: kKNq/4CU2L7eMjCEFsniywittKiS4LkIYoRQCBKkk4cajybYlo0cLPzdWJsHPZBWOPuxDGBFwB
 OHe3HANT02UQ==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="424890274"
Received: from kata-01.gv.intel.com (HELO jcvenega-mobl.gv.intel.com)
 ([10.219.105.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 13:19:20 -0700
From: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
To: virtio-fs@redhat.com
Subject: [PATCH 2/2] virtiofsd: Add help for -o xattr-mapping
Date: Wed, 14 Apr 2021 20:12:07 +0000
Message-Id: <20210414201207.3612432-3-jose.carlos.venegas.munoz@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
References: <20210414201207.3612432-1-jose.carlos.venegas.munoz@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=jose.carlos.venegas.munoz@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The option is not documented in help.

Add small help about the option.

Signed-off-by: Carlos Venegas <jose.carlos.venegas.munoz@intel.com>
---
 tools/virtiofsd/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 28243b51b2..5e98ed702b 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -172,6 +172,9 @@ void fuse_cmdline_help(void)
            "                               default: no_writeback\n"
            "    -o xattr|no_xattr          enable/disable xattr\n"
            "                               default: no_xattr\n"
+           "    -o xattrmap=<mapping>      Enable xattr mapping (enables xattr)\n"
+           "                               <mapping> is a string consists of a series of rules\n"
+           "                               e.g. -o xattrmap=:map::user.virtiofs.:\n"
            "    -o modcaps=CAPLIST         Modify the list of capabilities\n"
            "                               e.g. -o modcaps=+sys_admin:-chown\n"
            "    --rlimit-nofile=<num>      set maximum number of file descriptors\n"
-- 
2.25.1


