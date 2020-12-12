Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756B2D894B
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 19:34:23 +0100 (CET)
Received: from localhost ([::1]:51862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ko9io-0002TQ-0W
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 13:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9PO-0004vT-25
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:36602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ko9PD-0000LJ-QH
 for qemu-devel@nongnu.org; Sat, 12 Dec 2020 13:14:17 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37716ACBD;
 Sat, 12 Dec 2020 15:55:35 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 02/23] i386: move whpx accel files into whpx/
Date: Sat, 12 Dec 2020 16:55:09 +0100
Message-Id: <20201212155530.23098-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201212155530.23098-1-cfontana@suse.de>
References: <20201212155530.23098-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/{ => whpx}/whp-dispatch.h | 0
 target/i386/{ => whpx}/whpx-cpus.h    | 0
 target/i386/{ => whpx}/whpx-all.c     | 0
 target/i386/{ => whpx}/whpx-apic.c    | 0
 target/i386/{ => whpx}/whpx-cpus.c    | 0
 MAINTAINERS                           | 6 +-----
 target/i386/meson.build               | 6 +-----
 target/i386/whpx/meson.build          | 5 +++++
 8 files changed, 7 insertions(+), 10 deletions(-)
 rename target/i386/{ => whpx}/whp-dispatch.h (100%)
 rename target/i386/{ => whpx}/whpx-cpus.h (100%)
 rename target/i386/{ => whpx}/whpx-all.c (100%)
 rename target/i386/{ => whpx}/whpx-apic.c (100%)
 rename target/i386/{ => whpx}/whpx-cpus.c (100%)
 create mode 100644 target/i386/whpx/meson.build

diff --git a/target/i386/whp-dispatch.h b/target/i386/whpx/whp-dispatch.h
similarity index 100%
rename from target/i386/whp-dispatch.h
rename to target/i386/whpx/whp-dispatch.h
diff --git a/target/i386/whpx-cpus.h b/target/i386/whpx/whpx-cpus.h
similarity index 100%
rename from target/i386/whpx-cpus.h
rename to target/i386/whpx/whpx-cpus.h
diff --git a/target/i386/whpx-all.c b/target/i386/whpx/whpx-all.c
similarity index 100%
rename from target/i386/whpx-all.c
rename to target/i386/whpx/whpx-all.c
diff --git a/target/i386/whpx-apic.c b/target/i386/whpx/whpx-apic.c
similarity index 100%
rename from target/i386/whpx-apic.c
rename to target/i386/whpx/whpx-apic.c
diff --git a/target/i386/whpx-cpus.c b/target/i386/whpx/whpx-cpus.c
similarity index 100%
rename from target/i386/whpx-cpus.c
rename to target/i386/whpx/whpx-cpus.c
diff --git a/MAINTAINERS b/MAINTAINERS
index cd98510884..0e8dfd7ea6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -451,11 +451,7 @@ F: include/sysemu/hvf.h
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
 S: Supported
-F: target/i386/whpx-all.c
-F: target/i386/whpx-apic.c
-F: target/i386/whpx-cpus.c
-F: target/i386/whp-dispatch.h
-F: accel/stubs/whpx-stub.c
+F: target/i386/whpx/
 F: include/sysemu/whpx.h
 
 Guest CPU Cores (Xen)
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 5363757131..62cd042915 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -27,11 +27,6 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
-  'whpx-all.c',
-  'whpx-cpus.c',
-  'whpx-apic.c',
-))
 i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
   'hax-all.c',
   'hax-mem.c',
@@ -41,6 +36,7 @@ i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-po
 i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
 subdir('kvm')
+subdir('whpx')
 subdir('hvf')
 
 target_arch += {'i386': i386_ss}
diff --git a/target/i386/whpx/meson.build b/target/i386/whpx/meson.build
new file mode 100644
index 0000000000..d8aa683999
--- /dev/null
+++ b/target/i386/whpx/meson.build
@@ -0,0 +1,5 @@
+i386_softmmu_ss.add(when: 'CONFIG_WHPX', if_true: files(
+  'whpx-all.c',
+  'whpx-apic.c',
+  'whpx-cpus.c',
+))
-- 
2.26.2


