Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3C32EEC5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:26:26 +0100 (CET)
Received: from localhost ([::1]:33534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICLQ-0003K4-VW
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwb-0002CR-3w
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:59976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwO-00044K-Fx
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:44 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27C8EAEC3;
 Fri,  5 Mar 2021 14:59:59 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v4 32/33] XXX disable a bunch of tests that seem to use tcg cpus
Date: Fri,  5 Mar 2021 15:59:40 +0100
Message-Id: <20210305145941.32020-33-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305145941.32020-1-cfontana@suse.de>
References: <20210305145941.32020-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/meson.build       | 6 +++---
 tests/qtest/meson.build | 8 +++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/tests/meson.build b/tests/meson.build
index 7d7da6a636..7b4fa2778c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -159,9 +159,9 @@ if have_block
     'test-crypto-afsplit': [io],
     'test-crypto-block': [io],
   }
-  if 'CONFIG_GNUTLS' in config_host and \
-     'CONFIG_TASN1' in config_host and \
-     'CONFIG_POSIX' in config_host
+  if 'CNFIG_GNUTLS' in config_host and \
+     'CNFIG_TASN1' in config_host and \
+     'CNFIG_POSIX' in config_host
     tests += {
       'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
                                    tasn1, crypto, gnutls],
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index ba6ecaed32..6077e0748e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -6,12 +6,12 @@ endif
 
 qtests_generic = [
   'cdrom-test',
-  'device-introspect-test',
+# 'device-introspect-test',
   'machine-none-test',
   'qmp-test',
   'qmp-cmd-test',
-  'qom-test',
-  'test-hmp',
+# 'qom-test',
+# 'test-hmp',
   'qos-test',
 ]
 if config_host.has_key('CONFIG_MODULES')
@@ -158,8 +158,6 @@ qtests_arm = \
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
   (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.26.2


