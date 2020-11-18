Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381762B7B5A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:32:04 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKkt-0005ls-4O
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfKim-0003wT-Cu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:29:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:47524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kfKic-0005Ey-CX
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:29:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23C8DAF4D;
 Wed, 18 Nov 2020 10:29:41 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v3 3/9] i386: move hax accel files into hax/
Date: Wed, 18 Nov 2020 11:29:30 +0100
Message-Id: <20201118102936.25569-4-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118102936.25569-1-cfontana@suse.de>
References: <20201118102936.25569-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 05:29:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 MAINTAINERS                           | 2 +-
 target/i386/{ => hax}/hax-all.c       | 0
 target/i386/{ => hax}/hax-cpus.c      | 0
 target/i386/{ => hax}/hax-cpus.h      | 0
 target/i386/{ => hax}/hax-i386.h      | 6 +++---
 target/i386/{ => hax}/hax-interface.h | 0
 target/i386/{ => hax}/hax-mem.c       | 0
 target/i386/{ => hax}/hax-posix.c     | 0
 target/i386/{ => hax}/hax-posix.h     | 0
 target/i386/{ => hax}/hax-windows.c   | 0
 target/i386/{ => hax}/hax-windows.h   | 0
 target/i386/hax/meson.build           | 7 +++++++
 target/i386/meson.build               | 8 +-------
 13 files changed, 12 insertions(+), 11 deletions(-)
 rename target/i386/{ => hax}/hax-all.c (100%)
 rename target/i386/{ => hax}/hax-cpus.c (100%)
 rename target/i386/{ => hax}/hax-cpus.h (100%)
 rename target/i386/{ => hax}/hax-i386.h (95%)
 rename target/i386/{ => hax}/hax-interface.h (100%)
 rename target/i386/{ => hax}/hax-mem.c (100%)
 rename target/i386/{ => hax}/hax-posix.c (100%)
 rename target/i386/{ => hax}/hax-posix.h (100%)
 rename target/i386/{ => hax}/hax-windows.c (100%)
 rename target/i386/{ => hax}/hax-windows.h (100%)
 create mode 100644 target/i386/hax/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 02bc29ea2b..463317784c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -490,7 +490,7 @@ W: https://github.com/intel/haxm/issues
 S: Maintained
 F: accel/stubs/hax-stub.c
 F: include/sysemu/hax.h
-F: target/i386/hax-*
+F: target/i386/hax/
 
 Hosts
 -----
diff --git a/target/i386/hax-all.c b/target/i386/hax/hax-all.c
similarity index 100%
rename from target/i386/hax-all.c
rename to target/i386/hax/hax-all.c
diff --git a/target/i386/hax-cpus.c b/target/i386/hax/hax-cpus.c
similarity index 100%
rename from target/i386/hax-cpus.c
rename to target/i386/hax/hax-cpus.c
diff --git a/target/i386/hax-cpus.h b/target/i386/hax/hax-cpus.h
similarity index 100%
rename from target/i386/hax-cpus.h
rename to target/i386/hax/hax-cpus.h
diff --git a/target/i386/hax-i386.h b/target/i386/hax/hax-i386.h
similarity index 95%
rename from target/i386/hax-i386.h
rename to target/i386/hax/hax-i386.h
index 48c4abe14e..efbb346238 100644
--- a/target/i386/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -84,13 +84,13 @@ void hax_memory_init(void);
 
 
 #ifdef CONFIG_POSIX
-#include "target/i386/hax-posix.h"
+#include "hax-posix.h"
 #endif
 
 #ifdef CONFIG_WIN32
-#include "target/i386/hax-windows.h"
+#include "hax-windows.h"
 #endif
 
-#include "target/i386/hax-interface.h"
+#include "hax-interface.h"
 
 #endif
diff --git a/target/i386/hax-interface.h b/target/i386/hax/hax-interface.h
similarity index 100%
rename from target/i386/hax-interface.h
rename to target/i386/hax/hax-interface.h
diff --git a/target/i386/hax-mem.c b/target/i386/hax/hax-mem.c
similarity index 100%
rename from target/i386/hax-mem.c
rename to target/i386/hax/hax-mem.c
diff --git a/target/i386/hax-posix.c b/target/i386/hax/hax-posix.c
similarity index 100%
rename from target/i386/hax-posix.c
rename to target/i386/hax/hax-posix.c
diff --git a/target/i386/hax-posix.h b/target/i386/hax/hax-posix.h
similarity index 100%
rename from target/i386/hax-posix.h
rename to target/i386/hax/hax-posix.h
diff --git a/target/i386/hax-windows.c b/target/i386/hax/hax-windows.c
similarity index 100%
rename from target/i386/hax-windows.c
rename to target/i386/hax/hax-windows.c
diff --git a/target/i386/hax-windows.h b/target/i386/hax/hax-windows.h
similarity index 100%
rename from target/i386/hax-windows.h
rename to target/i386/hax/hax-windows.h
diff --git a/target/i386/hax/meson.build b/target/i386/hax/meson.build
new file mode 100644
index 0000000000..77ea431b30
--- /dev/null
+++ b/target/i386/hax/meson.build
@@ -0,0 +1,7 @@
+i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
+  'hax-all.c',
+  'hax-mem.c',
+  'hax-cpus.c',
+))
+i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
+i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 62cd042915..284d52ab81 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -27,15 +27,9 @@ i386_softmmu_ss.add(files(
   'machine.c',
   'monitor.c',
 ))
-i386_softmmu_ss.add(when: 'CONFIG_HAX', if_true: files(
-  'hax-all.c',
-  'hax-mem.c',
-  'hax-cpus.c',
-))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_POSIX'], if_true: files('hax-posix.c'))
-i386_softmmu_ss.add(when: ['CONFIG_HAX', 'CONFIG_WIN32'], if_true: files('hax-windows.c'))
 
 subdir('kvm')
+subdir('hax')
 subdir('whpx')
 subdir('hvf')
 
-- 
2.26.2


