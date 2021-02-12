Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A280D319E93
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 13:39:47 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAXje-00032M-Lp
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 07:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgX-0001Ai-LC
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:48610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lAXgU-0006Kg-QA
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 07:36:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 525E6B914;
 Fri, 12 Feb 2021 12:36:27 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v18 06/15] meson: add target_user_arch
Date: Fri, 12 Feb 2021 13:36:13 +0100
Message-Id: <20210212123622.15834-7-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212123622.15834-1-cfontana@suse.de>
References: <20210212123622.15834-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the lack of target_user_arch makes it hard to fully leverage the
build system in order to separate user code from softmmu code.

Provide it, so that we can avoid the proliferation of #ifdef
in target code.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 meson.build                   | 5 +++++
 target/alpha/meson.build      | 3 +++
 target/arm/meson.build        | 2 ++
 target/cris/meson.build       | 3 +++
 target/hppa/meson.build       | 3 +++
 target/i386/meson.build       | 2 ++
 target/m68k/meson.build       | 3 +++
 target/microblaze/meson.build | 3 +++
 target/mips/meson.build       | 3 +++
 target/nios2/meson.build      | 3 +++
 target/openrisc/meson.build   | 3 +++
 target/ppc/meson.build        | 3 +++
 target/riscv/meson.build      | 3 +++
 target/s390x/meson.build      | 3 +++
 target/sh4/meson.build        | 3 +++
 target/sparc/meson.build      | 3 +++
 target/tilegx/meson.build     | 3 +++
 target/tricore/meson.build    | 3 +++
 target/xtensa/meson.build     | 3 +++
 19 files changed, 57 insertions(+)

diff --git a/meson.build b/meson.build
index a923f249d8..1a355b8c1e 100644
--- a/meson.build
+++ b/meson.build
@@ -1734,6 +1734,7 @@ modules = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
+target_user_arch = {}
 
 ###############
 # Trace files #
@@ -2131,6 +2132,10 @@ foreach target : target_dirs
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
+    t = target_user_arch[arch].apply(config_target, strict: false)
+    arch_srcs += t.sources()
+    arch_deps += t.dependencies()
+
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index 1aec55abb4..1b0555d3ee 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -14,5 +14,8 @@ alpha_ss.add(files(
 alpha_softmmu_ss = ss.source_set()
 alpha_softmmu_ss.add(files('machine.c'))
 
+alpha_user_ss = ss.source_set()
+
 target_arch += {'alpha': alpha_ss}
 target_softmmu_arch += {'alpha': alpha_softmmu_ss}
+target_user_arch += {'alpha': alpha_user_ss}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 15b936c101..a96af5ee1b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -53,6 +53,8 @@ arm_softmmu_ss.add(files(
   'monitor.c',
   'psci.c',
 ))
+arm_user_ss = ss.source_set()
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
+target_user_arch += {'arm': arm_user_ss}
diff --git a/target/cris/meson.build b/target/cris/meson.build
index 67c3793c85..7fd81e0348 100644
--- a/target/cris/meson.build
+++ b/target/cris/meson.build
@@ -10,5 +10,8 @@ cris_ss.add(files(
 cris_softmmu_ss = ss.source_set()
 cris_softmmu_ss.add(files('mmu.c', 'machine.c'))
 
+cris_user_ss = ss.source_set()
+
 target_arch += {'cris': cris_ss}
 target_softmmu_arch += {'cris': cris_softmmu_ss}
+target_user_arch += {'cris': cris_user_ss}
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 8a7ff82efc..85ad314671 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -15,5 +15,8 @@ hppa_ss.add(files(
 hppa_softmmu_ss = ss.source_set()
 hppa_softmmu_ss.add(files('machine.c'))
 
+hppa_user_ss = ss.source_set()
+
 target_arch += {'hppa': hppa_ss}
 target_softmmu_arch += {'hppa': hppa_softmmu_ss}
+target_user_arch += {'hppa': hppa_user_ss}
diff --git a/target/i386/meson.build b/target/i386/meson.build
index fd24479590..cac26a4581 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -19,6 +19,7 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
+i386_user_ss = ss.source_set()
 
 subdir('kvm')
 subdir('hax')
@@ -28,3 +29,4 @@ subdir('tcg')
 
 target_arch += {'i386': i386_ss}
 target_softmmu_arch += {'i386': i386_softmmu_ss}
+target_user_arch += {'i386': i386_user_ss}
diff --git a/target/m68k/meson.build b/target/m68k/meson.build
index 05cd9fbd1e..b507682684 100644
--- a/target/m68k/meson.build
+++ b/target/m68k/meson.build
@@ -13,5 +13,8 @@ m68k_ss.add(files(
 m68k_softmmu_ss = ss.source_set()
 m68k_softmmu_ss.add(files('monitor.c'))
 
+m68k_user_ss = ss.source_set()
+
 target_arch += {'m68k': m68k_ss}
 target_softmmu_arch += {'m68k': m68k_softmmu_ss}
+target_user_arch += {'m68k': m68k_user_ss}
diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 05ee0ec163..52d8fcb0a3 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -16,5 +16,8 @@ microblaze_softmmu_ss.add(files(
   'machine.c',
 ))
 
+microblaze_user_ss = ss.source_set()
+
 target_arch += {'microblaze': microblaze_ss}
 target_softmmu_arch += {'microblaze': microblaze_softmmu_ss}
+target_user_arch += {'microblaze': microblaze_user_ss}
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 9741545440..30843c1521 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -36,5 +36,8 @@ mips_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cp0_helper.c',
 ))
 
+mips_user_ss = ss.source_set()
+
 target_arch += {'mips': mips_ss}
 target_softmmu_arch += {'mips': mips_softmmu_ss}
+target_user_arch += {'mips': mips_user_ss}
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index e643917db1..00367056fa 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -11,5 +11,8 @@ nios2_ss.add(files(
 nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files('monitor.c'))
 
+nios2_user_ss = ss.source_set()
+
 target_arch += {'nios2': nios2_ss}
 target_softmmu_arch += {'nios2': nios2_softmmu_ss}
+target_user_arch += {'nios2': nios2_user_ss}
diff --git a/target/openrisc/meson.build b/target/openrisc/meson.build
index 9774a58306..794a9e8161 100644
--- a/target/openrisc/meson.build
+++ b/target/openrisc/meson.build
@@ -19,5 +19,8 @@ openrisc_ss.add(files(
 openrisc_softmmu_ss = ss.source_set()
 openrisc_softmmu_ss.add(files('machine.c'))
 
+openrisc_user_ss = ss.source_set()
+
 target_arch += {'openrisc': openrisc_ss}
 target_softmmu_arch += {'openrisc': openrisc_softmmu_ss}
+target_user_arch += {'openrisc': openrisc_user_ss}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..cdd69bf989 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -33,5 +33,8 @@ ppc_softmmu_ss.add(when: 'TARGET_PPC64', if_true: files(
   'mmu-radix64.c',
 ))
 
+ppc_user_ss = ss.source_set()
+
 target_arch += {'ppc': ppc_ss}
 target_softmmu_arch += {'ppc': ppc_softmmu_ss}
+target_user_arch += {'ppc': ppc_user_ss}
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dac..a55851336b 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -31,5 +31,8 @@ riscv_softmmu_ss.add(files(
   'machine.c'
 ))
 
+riscv_user_ss = ss.source_set()
+
 target_arch += {'riscv': riscv_ss}
 target_softmmu_arch += {'riscv': riscv_softmmu_ss}
+target_user_arch += {'riscv': riscv_user_ss}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index c42eadb7d2..1219f64112 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -58,5 +58,8 @@ if host_machine.cpu_family() == 's390x' and cc.has_link_argument('-Wl,--s390-pgs
                        if_true: declare_dependency(link_args: ['-Wl,--s390-pgste']))
 endif
 
+s390x_user_ss = ss.source_set()
+
 target_arch += {'s390x': s390x_ss}
 target_softmmu_arch += {'s390x': s390x_softmmu_ss}
+target_user_arch += {'s390x': s390x_user_ss}
diff --git a/target/sh4/meson.build b/target/sh4/meson.build
index 56a57576da..5a05729bc1 100644
--- a/target/sh4/meson.build
+++ b/target/sh4/meson.build
@@ -10,5 +10,8 @@ sh4_ss.add(files(
 sh4_softmmu_ss = ss.source_set()
 sh4_softmmu_ss.add(files('monitor.c'))
 
+sh4_user_ss = ss.source_set()
+
 target_arch += {'sh4': sh4_ss}
 target_softmmu_arch += {'sh4': sh4_softmmu_ss}
+target_user_arch += {'sh4': sh4_user_ss}
diff --git a/target/sparc/meson.build b/target/sparc/meson.build
index a3638b9503..cc77a77064 100644
--- a/target/sparc/meson.build
+++ b/target/sparc/meson.build
@@ -19,5 +19,8 @@ sparc_softmmu_ss.add(files(
   'monitor.c',
 ))
 
+sparc_user_ss = ss.source_set()
+
 target_arch += {'sparc': sparc_ss}
 target_softmmu_arch += {'sparc': sparc_softmmu_ss}
+target_user_arch += {'sparc': sparc_user_ss}
diff --git a/target/tilegx/meson.build b/target/tilegx/meson.build
index 678590439c..23dab8b9a1 100644
--- a/target/tilegx/meson.build
+++ b/target/tilegx/meson.build
@@ -9,5 +9,8 @@ tilegx_ss.add(zlib)
 
 tilegx_softmmu_ss = ss.source_set()
 
+tilegx_user_ss = ss.source_set()
+
 target_arch += {'tilegx': tilegx_ss}
 target_softmmu_arch += {'tilegx': tilegx_softmmu_ss}
+target_user_arch += {'tilegx': tilegx_user_ss}
diff --git a/target/tricore/meson.build b/target/tricore/meson.build
index 0ccc829517..7086ae1a22 100644
--- a/target/tricore/meson.build
+++ b/target/tricore/meson.build
@@ -11,5 +11,8 @@ tricore_ss.add(zlib)
 
 tricore_softmmu_ss = ss.source_set()
 
+tricore_user_ss = ss.source_set()
+
 target_arch += {'tricore': tricore_ss}
 target_softmmu_arch += {'tricore': tricore_softmmu_ss}
+target_user_arch += {'tricore': tricore_user_ss}
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index dd750a977e..949b2c8334 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -28,5 +28,8 @@ xtensa_softmmu_ss.add(files(
   'xtensa-semi.c',
 ))
 
+xtensa_user_ss = ss.source_set()
+
 target_arch += {'xtensa': xtensa_ss}
 target_softmmu_arch += {'xtensa': xtensa_softmmu_ss}
+target_user_arch += {'xtensa': xtensa_user_ss}
-- 
2.26.2


