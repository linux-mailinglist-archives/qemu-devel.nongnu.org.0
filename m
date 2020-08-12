Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF01242E9C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 20:39:08 +0200 (CEST)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5veV-0001lw-Ck
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 14:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYk-0000Mr-JR
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:40782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1k5vYd-0002Du-J5
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 14:33:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85603AF6D;
 Wed, 12 Aug 2020 18:33:20 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Subject: [PATCH v5 09/14] cpus: cleanup now unneeded includes
Date: Wed, 12 Aug 2020 20:32:45 +0200
Message-Id: <20200812183250.9221-10-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200812183250.9221-1-cfontana@suse.de>
References: <20200812183250.9221-1-cfontana@suse.de>
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 23:47:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Colin Xu <colin.xu@intel.com>, Claudio Fontana <cfontana@suse.de>,
 haxm-team@intel.com, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 softmmu/cpus.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index f99942fd9d..1125fb5fc9 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -29,20 +29,13 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qmp/qerror.h"
-#include "sysemu/tcg.h"
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
-#include "sysemu/kvm.h"
 #include "exec/exec-all.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
-#include "qemu/main-loop.h"
-#include "qemu/option.h"
-#include "qemu/bitmap.h"
-#include "qemu/seqlock.h"
 #include "qemu/guest-random.h"
-#include "tcg/tcg.h"
 #include "hw/nmi.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
-- 
2.16.4


