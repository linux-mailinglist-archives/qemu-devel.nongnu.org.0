Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD921EBA7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 10:42:10 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvGVt-0002BT-ED
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 04:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jvGU3-0007nH-T5
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:40:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:43778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenyi.qiang@intel.com>)
 id 1jvGU1-0002ZH-K5
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 04:40:15 -0400
IronPort-SDR: TEURLu353O9g1NW+qIcOag0knlVN7n5aaj4Vm1Lsc/97toHS64BgD2DT9cBpyRzqYLsPulp6Qz
 Xig5lUJQrMeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="128407142"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="128407142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 01:40:12 -0700
IronPort-SDR: CGFfTRrSRttfzqVi1U/srNkBdpgz/52MYZbGUIUWAwK4O+XZxqRrpn6GIJsX7seRyh/GXHMrtR
 7kn9I3yIwOjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="299464867"
Received: from chenyi-pc.sh.intel.com ([10.239.159.72])
 by orsmga002.jf.intel.com with ESMTP; 14 Jul 2020 01:40:10 -0700
From: Chenyi Qiang <chenyi.qiang@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v6 3/3] target/i386: add the missing vmx features for
 Skylake-Server and Cascadelake-Server CPU models
Date: Tue, 14 Jul 2020 16:41:48 +0800
Message-Id: <20200714084148.26690-4-chenyi.qiang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714084148.26690-1-chenyi.qiang@intel.com>
References: <20200714084148.26690-1-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=chenyi.qiang@intel.com; helo=mga12.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 04:40:06
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing vmx features in Skylake-Server and Cascadelake-Server
CPU models based on the output of Paolo's script.

Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
---
 target/i386/cpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6afc59d8ff..1dca1713bd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3034,6 +3034,13 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+                .version = 4,
+                .props = (PropValue[]) {
+                    { "vmx-eptp-switching", "on" },
+                    { /* end of list */ }
+                }
+            },
             { /* end of list */ }
         }
     },
@@ -3158,6 +3165,13 @@ static X86CPUDefinition builtin_x86_defs[] = {
                   { /* end of list */ }
               },
             },
+            { .version = 4,
+              .note = "ARCH_CAPABILITIES, no TSX",
+              .props = (PropValue[]) {
+                  { "vmx-eptp-switching", "on" },
+                  { /* end of list */ }
+              },
+            },
             { /* end of list */ }
         }
     },
-- 
2.17.1


