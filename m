Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FEC427DA0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:25:03 +0200 (CEST)
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJq2-0000YY-40
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJfd-0006b4-FP
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJfc-0000OV-0g
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UR8QiP1/NLjRtRQBWTVjsQftNf9uQPBYQoCwT5y5Ki8=;
 b=es42jiCZTeqnZIKYcGo8YPqYb2P3keaY7WdJM82Rq2XROaYDlx9zwlnnURri+CCxNNvK3a
 OubjIMA0xJDTaMtckYdYYoJ7cINxQ7s92K+nmV8uphoo8yi/PiCk47gZVP4yIfRndUoSVk
 SDapYy2yaawu8EQGtn+uF7wB3sUD2NY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-GMFGvpCWOjKvMTO45kEq1g-1; Sat, 09 Oct 2021 17:14:14 -0400
X-MC-Unique: GMFGvpCWOjKvMTO45kEq1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62948801AA7
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:14:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA821A7E9;
 Sat,  9 Oct 2021 21:14:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/37] backends: move dbus-vmstate1.xml to backends/
Date: Sun, 10 Oct 2021 01:08:23 +0400
Message-Id: <20211009210838.2219430-23-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Although not used by the backend itself, use a common location for
documentation and sharing purposes.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 {tests/qtest => backends}/dbus-vmstate1.xml | 0
 tests/qtest/meson.build                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {tests/qtest => backends}/dbus-vmstate1.xml (100%)

diff --git a/tests/qtest/dbus-vmstate1.xml b/backends/dbus-vmstate1.xml
similarity index 100%
rename from tests/qtest/dbus-vmstate1.xml
rename to backends/dbus-vmstate1.xml
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062..b6016aee48 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -93,7 +93,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
   #qtests_i386 += ['dbus-vmstate-test']
   dbus_vmstate1 = custom_target('dbus-vmstate description',
                                 output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
-                                input: files('dbus-vmstate1.xml'),
+                                input: meson.source_root() / 'backends/dbus-vmstate1.xml',
                                 command: [config_host['GDBUS_CODEGEN'],
                                           '@INPUT@',
                                           '--interface-prefix', 'org.qemu',
-- 
2.33.0.721.g106298f7f9


