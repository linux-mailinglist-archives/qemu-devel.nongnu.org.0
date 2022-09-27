Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A15EBF65
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:12:36 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Zr-0000Wu-R2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NF-0007cX-6Z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7ND-0008TQ-KU
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzC1vCIIxy/AukG1I7H0YNq/Zfll4aQSjlYfrynWk/U=;
 b=AuPhq0YxlouOifvbiyYGWpy4ohN3X7vloNRqaFkIuvPlnfAXZLCZqHGar/N+ILwwbU9cBU
 qVtcK3k2jJ78ynQx4f9NilN2Yp+6zuUTHYNcLsC72T3YK+VtjhBPMEAjIMiIqzsNpOj6mx
 ULbYqQgRHMRYp2NthS/MDnTGwLPcYWM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-pxsfk4AdPayT0WH0Qj-dAg-1; Tue, 27 Sep 2022 05:59:29 -0400
X-MC-Unique: pxsfk4AdPayT0WH0Qj-dAg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hq17-20020a1709073f1100b00782f9d252f4so2953146ejc.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SzC1vCIIxy/AukG1I7H0YNq/Zfll4aQSjlYfrynWk/U=;
 b=qAysARIncLSpVwf+/7jBmKMmyB3gavt0P6mAj+jb1DokFVAR5wb2aK7QXght7IZLFv
 2Z4z8QvfbfZwazDA9a4RtK4lsiLsbpUtDm2WZ79+IDpEgM9ql+9TVhD1nDTPGFqGbOv3
 4kdPHGWDM/j5mNaLjepsni6hdN87G/Z6t/kvKmN67TIxGvss8iBoy9GkKjR2wkXcd4BY
 zVZ+8puI4XHdYA2F8W2b06mp7YD0SuczUY6wpK2MGejsCc0zg1Mf+Z+EDdqzvPAFH+us
 RjpPFYjMfoJFAM5uYO649HcUmiUYZ3cJ2JPZCBNI8jWj3l2BkqC9KYuAoiTx3tXlGy0S
 +ROw==
X-Gm-Message-State: ACrzQf1/hQXHm9Mymghg3RA25oYJHKGVQ1TIzRfUli8sQALPrOmBi1hB
 eZeMaLSkLlP2dYp7g2yfmrRZr3lLfdqJ6pDvYufFUp9mmGGOidvhDOuQ9X4PXnyaHC6zYx6R9DN
 92qewjDvRGupr7Y3nMwMLNGDWYl2qwmoYN1t+PYjLpz3II11Li7BmEh8+xnf0OSERLuQ=
X-Received: by 2002:a05:6402:b29:b0:456:f2dc:826d with SMTP id
 bo9-20020a0564020b2900b00456f2dc826dmr16370744edb.94.1664272767666; 
 Tue, 27 Sep 2022 02:59:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bm0f2lTSg8Sy3k/O3YJ+1jhH5Wgr4jaHomFW7p3zsTT/92Q2tbUsR6o5it0a8pu5KJXj28w==
X-Received: by 2002:a05:6402:b29:b0:456:f2dc:826d with SMTP id
 bo9-20020a0564020b2900b00456f2dc826dmr16370723edb.94.1664272767313; 
 Tue, 27 Sep 2022 02:59:27 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a50ee94000000b004482dd03fe8sm909202edr.91.2022.09.27.02.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 1/5] ui: fix path to dbus-display1.h
Date: Tue, 27 Sep 2022 11:59:17 +0200
Message-Id: <20220927095921.261760-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927095921.261760-1-pbonzini@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the source directory is always included in the include path,
the corresponding directory in the build tree is not.  Therefore,
custom_targets (e.g. ui/dbus-display1.h) must be referred to using
the full path.

This avoids a build failure when ui/dbus-chardev.c is not built as
a module:

In file included from ../ui/dbus-chardev.c:32:
../ui/dbus.h:34:10: fatal error: dbus-display1.h: No such file or directory
   34 | #include "dbus-display1.h"
      |          ^~~~~~~~~~~~~~~~~

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/dbus-display-test.c | 2 +-
 ui/dbus.h                       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
index 8be5974763..cb1b62d1d1 100644
--- a/tests/qtest/dbus-display-test.c
+++ b/tests/qtest/dbus-display-test.c
@@ -3,7 +3,7 @@
 #include <gio/gio.h>
 #include <gio/gunixfdlist.h>
 #include "libqtest.h"
-#include "dbus-display1.h"
+#include "ui/dbus-display1.h"
 
 static GDBusConnection*
 test_dbus_p2p_from_fd(int fd)
diff --git a/ui/dbus.h b/ui/dbus.h
index c001c11f70..9c149e7b41 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -31,7 +31,7 @@
 #include "ui/console.h"
 #include "ui/clipboard.h"
 
-#include "dbus-display1.h"
+#include "ui/dbus-display1.h"
 
 typedef struct DBusClipboardRequest {
     GDBusMethodInvocation *invocation;
-- 
2.37.3


