Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DCC5EFBFD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:28:46 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxL3-0000oY-Sa
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQv-0003hZ-Q1
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQt-00036u-If
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GJzCllnxG/DxrGKRWWoxC+uavu4ndvSXFH/Fdt26IG8=;
 b=QmU5DQe0BZAbYVEWG2hl2Ia76VxDMs1esKhdVNdBpsTC0yatTKSKoBR2MRe74XztPji6i5
 YmrNwOv6ewGd0SsMoWdEBQDI2Xicppxt5theKE2oae0H775KN0JZbfRl6JSbNNgqfB3Fyd
 KlMHmhAag9umpWU7EUeqMZJKHRIPkx8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-207-KI0dBMccOM2PWzreFnB1iQ-1; Thu, 29 Sep 2022 12:30:41 -0400
X-MC-Unique: KI0dBMccOM2PWzreFnB1iQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 h13-20020a056402280d00b004581108ba90so1663880ede.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GJzCllnxG/DxrGKRWWoxC+uavu4ndvSXFH/Fdt26IG8=;
 b=Xkmz/6thaqWkIO4JsA4PH9BStQFuVx5JFfyUjdOkx9/Efh/5Nyjg6uVht8fiA07C9e
 pbUVAypT8TUIjECOP0ekNy7VDU/zXGNKy4g5Emy5yEdpzT9mliDzdDBjdlWtSDT5ioq5
 cNBMMVbJteJ7LwMDHaOyej4HPu62AtGSh8lOD2yKqJE4+C0zcpjdMWgccIiGjvmIb6+k
 ThBW/cCfHY5yWogIwMFro/VR8jMiPPPlHzDNAIEgbkQr4QkSBdxLqL7nQHAFAzSLD1cU
 e0vUMeCTCl4GzQJl8Ai9O0XHLcldHVs5EyI695hCnx/DK4dt4kd+STx+ThXeEIfGzW0i
 eG3g==
X-Gm-Message-State: ACrzQf2u0oXIiMfu2Au6zuWWx3ONCimLfsiIA/eknPr5Vx45NoDHXyAT
 prcdfLyf1morvPAZpMquJYHW9Uh4isKL1xTX8IX1qLmuzZ6f8vhBm85PDk3CKrBFETlH6N39hnp
 qFvjsCYPLUpjuPAJtu36rWK8z/so/xejHF6gr56cJa2LscfGjDffj6W0prOD960AG9Pc=
X-Received: by 2002:a17:907:75d4:b0:77a:fcb7:a2cc with SMTP id
 jl20-20020a17090775d400b0077afcb7a2ccmr3431687ejc.480.1664469039511; 
 Thu, 29 Sep 2022 09:30:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Svg/QW8z/8vub/0u8LdJBGGDI3G+Bhr4BxFFcn6HmWISJWhJZsY7Lw8Y1hrQASbMd1Wvruw==
X-Received: by 2002:a17:907:75d4:b0:77a:fcb7:a2cc with SMTP id
 jl20-20020a17090775d400b0077afcb7a2ccmr3431668ejc.480.1664469039239; 
 Thu, 29 Sep 2022 09:30:39 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 kx6-20020a170907774600b007708635be05sm4270475ejc.4.2022.09.29.09.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 08/14] ui: fix path to dbus-display1.h
Date: Thu, 29 Sep 2022 18:30:08 +0200
Message-Id: <20220929163014.16950-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


