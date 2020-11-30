Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6B2C7CDF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 03:44:55 +0100 (CET)
Received: from localhost ([::1]:41754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjZBO-0004N0-VI
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 21:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2d-00013O-0X
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:35:51 -0500
Received: from mx2.suse.de ([195.135.220.15]:57302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kjZ2Z-0004nN-Kx
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 21:35:50 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F850ACBF;
 Mon, 30 Nov 2020 02:35:44 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v7 05/22] i386: move TCG accel files into tcg/
Date: Mon, 30 Nov 2020 03:35:18 +0100
Message-Id: <20201130023535.16689-6-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201130023535.16689-1-cfontana@suse.de>
References: <20201130023535.16689-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/meson.build             | 14 +-------------
 target/i386/{ => tcg}/bpt_helper.c  |  0
 target/i386/{ => tcg}/cc_helper.c   |  0
 target/i386/{ => tcg}/excp_helper.c |  0
 target/i386/{ => tcg}/fpu_helper.c  |  0
 target/i386/{ => tcg}/int_helper.c  |  0
 target/i386/{ => tcg}/mem_helper.c  |  0
 target/i386/tcg/meson.build         | 13 +++++++++++++
 target/i386/{ => tcg}/misc_helper.c |  0
 target/i386/{ => tcg}/mpx_helper.c  |  0
 target/i386/{ => tcg}/seg_helper.c  |  0
 target/i386/{ => tcg}/smm_helper.c  |  0
 target/i386/{ => tcg}/svm_helper.c  |  0
 target/i386/{ => tcg}/tcg-stub.c    |  0
 target/i386/{ => tcg}/translate.c   |  0
 15 files changed, 14 insertions(+), 13 deletions(-)
 rename target/i386/{ => tcg}/bpt_helper.c (100%)
 rename target/i386/{ => tcg}/cc_helper.c (100%)
 rename target/i386/{ => tcg}/excp_helper.c (100%)
 rename target/i386/{ => tcg}/fpu_helper.c (100%)
 rename target/i386/{ => tcg}/int_helper.c (100%)
 rename target/i386/{ => tcg}/mem_helper.c (100%)
 create mode 100644 target/i386/tcg/meson.build
 rename target/i386/{ => tcg}/misc_helper.c (100%)
 rename target/i386/{ => tcg}/mpx_helper.c (100%)
 rename target/i386/{ => tcg}/seg_helper.c (100%)
 rename target/i386/{ => tcg}/smm_helper.c (100%)
 rename target/i386/{ => tcg}/svm_helper.c (100%)
 rename target/i386/{ => tcg}/tcg-stub.c (100%)
 rename target/i386/{ => tcg}/translate.c (100%)

diff --git a/target/i386/meson.build b/target/i386/meson.build
index 284d52ab81..750471c9f3 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -5,19 +5,6 @@ i386_ss.add(files(
   'helper.c',
   'xsave_helper.c',
 ))
-i386_ss.add(when: 'CONFIG_TCG', if_true: files(
-  'bpt_helper.c',
-  'cc_helper.c',
-  'excp_helper.c',
-  'fpu_helper.c',
-  'int_helper.c',
-  'mem_helper.c',
-  'misc_helper.c',
-  'mpx_helper.c',
-  'seg_helper.c',
-  'smm_helper.c',
-  'svm_helper.c',
-  'translate.c'), if_false: files('tcg-stub.c'))
 i386_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files('sev-stub.c'))
 
 i386_softmmu_ss = ss.source_set()
@@ -32,6 +19,7 @@ subdir('kvm')
 subdir('hax')
 subdir('whpx')
 subdir('hvf')
+subdir('tcg')
 
 target_arch += {'i386': i386_ss}
 target_softmmu_arch += {'i386': i386_softmmu_ss}
diff --git a/target/i386/bpt_helper.c b/target/i386/tcg/bpt_helper.c
similarity index 100%
rename from target/i386/bpt_helper.c
rename to target/i386/tcg/bpt_helper.c
diff --git a/target/i386/cc_helper.c b/target/i386/tcg/cc_helper.c
similarity index 100%
rename from target/i386/cc_helper.c
rename to target/i386/tcg/cc_helper.c
diff --git a/target/i386/excp_helper.c b/target/i386/tcg/excp_helper.c
similarity index 100%
rename from target/i386/excp_helper.c
rename to target/i386/tcg/excp_helper.c
diff --git a/target/i386/fpu_helper.c b/target/i386/tcg/fpu_helper.c
similarity index 100%
rename from target/i386/fpu_helper.c
rename to target/i386/tcg/fpu_helper.c
diff --git a/target/i386/int_helper.c b/target/i386/tcg/int_helper.c
similarity index 100%
rename from target/i386/int_helper.c
rename to target/i386/tcg/int_helper.c
diff --git a/target/i386/mem_helper.c b/target/i386/tcg/mem_helper.c
similarity index 100%
rename from target/i386/mem_helper.c
rename to target/i386/tcg/mem_helper.c
diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
new file mode 100644
index 0000000000..02794226c2
--- /dev/null
+++ b/target/i386/tcg/meson.build
@@ -0,0 +1,13 @@
+i386_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'bpt_helper.c',
+  'cc_helper.c',
+  'excp_helper.c',
+  'fpu_helper.c',
+  'int_helper.c',
+  'mem_helper.c',
+  'misc_helper.c',
+  'mpx_helper.c',
+  'seg_helper.c',
+  'smm_helper.c',
+  'svm_helper.c',
+  'translate.c'), if_false: files('tcg-stub.c'))
diff --git a/target/i386/misc_helper.c b/target/i386/tcg/misc_helper.c
similarity index 100%
rename from target/i386/misc_helper.c
rename to target/i386/tcg/misc_helper.c
diff --git a/target/i386/mpx_helper.c b/target/i386/tcg/mpx_helper.c
similarity index 100%
rename from target/i386/mpx_helper.c
rename to target/i386/tcg/mpx_helper.c
diff --git a/target/i386/seg_helper.c b/target/i386/tcg/seg_helper.c
similarity index 100%
rename from target/i386/seg_helper.c
rename to target/i386/tcg/seg_helper.c
diff --git a/target/i386/smm_helper.c b/target/i386/tcg/smm_helper.c
similarity index 100%
rename from target/i386/smm_helper.c
rename to target/i386/tcg/smm_helper.c
diff --git a/target/i386/svm_helper.c b/target/i386/tcg/svm_helper.c
similarity index 100%
rename from target/i386/svm_helper.c
rename to target/i386/tcg/svm_helper.c
diff --git a/target/i386/tcg-stub.c b/target/i386/tcg/tcg-stub.c
similarity index 100%
rename from target/i386/tcg-stub.c
rename to target/i386/tcg/tcg-stub.c
diff --git a/target/i386/translate.c b/target/i386/tcg/translate.c
similarity index 100%
rename from target/i386/translate.c
rename to target/i386/tcg/translate.c
-- 
2.26.2


