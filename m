Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9332EEAF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:24:00 +0100 (CET)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICJ5-0008G8-Es
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwX-0002Bm-A0
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:59978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwL-00044V-O7
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A5F6AFF6;
 Fri,  5 Mar 2021 14:59:59 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v4 33/33] XXX disable arm-cpu-features
Date: Fri,  5 Mar 2021 15:59:41 +0100
Message-Id: <20210305145941.32020-34-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/qtest/meson.build | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6077e0748e..9feca57d2c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -148,8 +148,7 @@ qtests_arm = \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
   (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
-  ['arm-cpu-features',
-   'microbit-test',
+  ['microbit-test',
    'm25p80-test',
    'test-arm-mptimer',
    'boot-serial-test',
@@ -158,8 +157,7 @@ qtests_arm = \
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
   (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
-  ['arm-cpu-features',
-   'numa-test',
+  ['numa-test',
    'boot-serial-test',
    'xlnx-can-test',
    'migration-test']
-- 
2.26.2


