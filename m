Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE0B48DBBD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:28:31 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82xi-0004re-CX
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n82tt-00023r-Hh
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:24:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1n82tr-0008C7-TC
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642091033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LDsTXUDYZHT5XEjwGuAtNe1lILVsyG3Zu9sEElh4SU0=;
 b=iGphtRVPhrXtW/qYNZHF9wo72tyUC03AVOyuTA46DtXb87RpH3VrZAbEJUD6XSXU2IHbXP
 0a1DS6lIhQ4jVndgxTPgoRkF3AIwLc5gB8eoPAQOk17jzHEeNKePkgw67iJMbhjjdczQbr
 bb8Fqn35ERhkGdyS+XnUcR8HU+IrEOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-w0OMlJO_NnGggppytGCMzw-1; Thu, 13 Jan 2022 11:22:03 -0500
X-MC-Unique: w0OMlJO_NnGggppytGCMzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC6CE83DD21;
 Thu, 13 Jan 2022 16:21:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE0984FFD;
 Thu, 13 Jan 2022 16:21:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: fix a meson deprecation warning
Date: Thu, 13 Jan 2022 20:21:48 +0400
Message-Id: <20220113162148.3621818-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

WARNING: Deprecated features used:
 * 0.56.0: {'meson.source_root'}

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa4498e..2f6687576757 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -103,7 +103,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
   #qtests_i386 += ['dbus-vmstate-test']
   dbus_vmstate1 = custom_target('dbus-vmstate description',
                                 output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
-                                input: meson.source_root() / 'backends/dbus-vmstate1.xml',
+                                input: meson.project_source_root() / 'backends/dbus-vmstate1.xml',
                                 command: [config_host['GDBUS_CODEGEN'],
                                           '@INPUT@',
                                           '--interface-prefix', 'org.qemu',
-- 
2.34.1.428.gdcc0cd074f0c


