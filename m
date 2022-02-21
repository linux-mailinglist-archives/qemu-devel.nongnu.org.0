Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBB4BEA5F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:34:02 +0100 (CET)
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMERd-0000ZR-FQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFo-0007j5-Cp
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:48 -0500
Received: from [2a00:1450:4864:20::335] (port=39673
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002dM-4L
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:21:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso53800wmq.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jqn0Eq5OamN94rTvkdU2cs5J2LDtszOeBtkgps6SOt0=;
 b=nst600r9RjZ4URbxu2yxmyWpDU18SN1XtJKR7g1fOeDy/l2dYTazCwCShARi5G5e8u
 CaauuwcTYtc+WBf1TIBRNitgIGIsU7Mu3AmzVsdydouAADB54fTwO92cNVxCg7Ktt8ee
 Bk8lW4smPw3UZeg96qV6r4fA+HMP3PWky4A1n0ubjtnGgR0GAeUyWXW2LVBcJnd0bWBb
 ZhU9IydmqwA+Sw413oVdAgq+7uGerjMwfxnnbYlKjHlXpjfC/1EmQ17xvoNz2OX68su2
 qv56v9Ij0mCmhYrnYdcyHBWpROwLKwvm4EOSqAMO/GtjAlw4BpSa4FHwb74ET63VVpNX
 5yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jqn0Eq5OamN94rTvkdU2cs5J2LDtszOeBtkgps6SOt0=;
 b=zNj5rTpu2wKxEKoGBv8CnX8X35GlW4ZVQoNbNR70x+Mxf6X0TfMt/6DP3QXIzL21Zj
 P7wStB4rlz9wU7uZTLtNG0XQfmv35dwN62PPs/rWeDUxBFx10GsQ4RZB2gSIQJAsj3ci
 VcdnGCoeuW8VUVWZF67yVUbnTSj59h4cp9rl/eX8h8U7YvND88FO/1rnetOdTuz9B7vX
 N2qmX3ni2x6Fk0IWSW0tfiocX+I/P+dsfqfXBnYBBYWROUzejzVK0Pg5SFDiIpRxJ+ep
 dd6cHVcuvR9d+HT4EqkfoUDbut2YHnBSd3gQ2FAZObbC6j+ME1kLnIqPb146HO3BoPqw
 u6vQ==
X-Gm-Message-State: AOAM531c3iKrmhg5S0K33MrzUcfQqvrwRGwEu6mTITvOWb2hbKl3y0ch
 2QOzKDCVuhyzBibQ1jP3bez/hA==
X-Google-Smtp-Source: ABdhPJyiMZLajiBoOx6cdXd76ZM7XzJB9FjCIM7T8tN5IVow8gKfmH7lQ8kvBu/BmZfBUAhi7Pw37w==
X-Received: by 2002:a7b:c8c2:0:b0:37b:b742:a9de with SMTP id
 f2-20020a7bc8c2000000b0037bb742a9demr386010wml.37.1645471286546; 
 Mon, 21 Feb 2022 11:21:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] qapi: Move RTC_CHANGE back out of target schema
Date: Mon, 21 Feb 2022 19:21:21 +0000
Message-Id: <20220221192123.749970-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221192123.749970-1-peter.maydell@linaro.org>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit effectively reverts commit 183e4281a30962, which moved
the RTC_CHANGE event to the target schema.  That change was an
attempt to make the event target-specific to improve introspection,
but the event isn't really target-specific: it's machine or device
specific.  Putting RTC_CHANGE in the target schema with an ifdef list
reduces maintainability (by adding an if: list with a long list of
targets that needs to be manually updated as architectures are added
or removed or as new devices gain the RTC_CHANGE functionality) and
increases compile time (by preventing RTC devices which emit the
event from being "compile once" rather than "compile once per
target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
which are poisoned in "compile once" files.)

Move RTC_CHANGE back to misc.json.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
---
 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 22 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 hw/rtc/pl031.c        |  2 +-
 5 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 4bc45d24741..036c5e4a914 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -2,39 +2,6 @@
 # vim: filetype=python
 #
 
-##
-# @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
-#
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
-#
-# Note: This event is rate-limited.
-#
-# Since: 0.13
-#
-# Example:
-#
-# <-   { "event": "RTC_CHANGE",
-#        "data": { "offset": 78 },
-#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
-##
-{ 'event': 'RTC_CHANGE',
-  'data': { 'offset': 'int' },
-  'if': { 'any': [ 'TARGET_ALPHA',
-                   'TARGET_ARM',
-                   'TARGET_HPPA',
-                   'TARGET_I386',
-                   'TARGET_MIPS',
-                   'TARGET_MIPS64',
-                   'TARGET_PPC',
-                   'TARGET_PPC64',
-                   'TARGET_S390X',
-                   'TARGET_SH4',
-                   'TARGET_SPARC' ] } }
-
 ##
 # @rtc-reset-reinjection:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index e8054f415b2..7a70eaa3ffc 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -527,3 +527,25 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @RTC_CHANGE:
+#
+# Emitted when the guest changes the RTC time.
+#
+# @offset: offset between base RTC clock (as specified by -rtc base), and
+#          new RTC clock value
+#
+# Note: This event is rate-limited.
+#
+# Since: 0.13
+#
+# Example:
+#
+# <-   { "event": "RTC_CHANGE",
+#        "data": { "offset": 78 },
+#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
+#
+##
+{ 'event': 'RTC_CHANGE',
+  'data': { 'offset': 'int' } }
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index 94a5510e4eb..79677cf5503 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -32,7 +32,7 @@
 #include "hw/ppc/spapr.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index e61a0cced4c..57c514e15c5 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -40,7 +40,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
index 38d9d3c2f38..60167c778f2 100644
--- a/hw/rtc/pl031.c
+++ b/hw/rtc/pl031.c
@@ -24,7 +24,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 
 #define RTC_DR      0x00    /* Data read register */
 #define RTC_MR      0x04    /* Match register */
-- 
2.25.1


