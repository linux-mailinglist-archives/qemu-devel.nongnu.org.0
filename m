Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CAD23BE88
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 19:06:02 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k30O1-0003gW-PA
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 13:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30Jz-0007JM-3f
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:01:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55263
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k30Jx-0005Uc-86
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 13:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596560508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=c3ezaShaxxZkE+7RjTgmNbZcq3vheU1/lTb21lxDjE4=;
 b=jUduSGYDYxzazXRcJAotmW3hQGYj+g9k4N/9eBBdR2lcl6BuEanm9Zosvk5YIMratkvWx8
 8k6E+w00Aa9VEOfjP0Lx6UiPmcZMyQpV/6MOjJ/0scmmmeHoClRlIkaQ7p53gYg+qzyh2e
 45ST45xOrt1cREJSkwkMVsdTuBMGuV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-lxK0fOj0PTeKGNQLPmZNcg-1; Tue, 04 Aug 2020 13:01:44 -0400
X-MC-Unique: lxK0fOj0PTeKGNQLPmZNcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7BB800469;
 Tue,  4 Aug 2020 17:01:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0BBC10013D0;
 Tue,  4 Aug 2020 17:01:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/11] stubs/notify-event: Mark qemu_notify_event() stub as
 "weak"
Date: Tue,  4 Aug 2020 19:00:52 +0200
Message-Id: <20200804170055.2851-9-thuth@redhat.com>
In-Reply-To: <20200804170055.2851-1-thuth@redhat.com>
References: <20200804170055.2851-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:28:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise there is a linker error with MinGW while compiling the tests:

  LINK    tests/test-timed-average.exe
 libqemuutil.a(main-loop.o): In function `qemu_notify_event':
 /builds/huth/qemu/util/main-loop.c:139: multiple definition of
  `qemu_notify_event'
 tests/test-timed-average.o:/builds/huth/qemu/tests/../stubs/notify-event.c:5:
  first defined here
 collect2: error: ld returned 1 exit status
 /builds/huth/qemu/rules.mak:124: recipe for target
  'tests/test-timed-average.exe' failed

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 stubs/notify-event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/notify-event.c b/stubs/notify-event.c
index 827bb52d1a..75d98f4a79 100644
--- a/stubs/notify-event.c
+++ b/stubs/notify-event.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 
-void qemu_notify_event(void)
+void __attribute__((weak)) qemu_notify_event(void)
 {
 }
-- 
2.18.1


