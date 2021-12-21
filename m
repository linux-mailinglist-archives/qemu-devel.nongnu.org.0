Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B92D47BB17
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:32:30 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZdM-0002nE-VN
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZCU-00074z-0O
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:04:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZCS-0002B0-Cj
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W83hJczpdfh86fBAKy4JOQvlGl9mojfK61ERS47j030=;
 b=i1Ggu14Uq3i2935PZkAVMg9kprCHDTS73h+ewrewdfL/8zYNp/H+M1Zf2DtxZuQPStTvLm
 CBG8p9GhtjqRMdd8w5VYuPepxf2bMugosHGzidkkkn6sKCi9W0Abn7dvOGd3Bn8yJ9Iug8
 mKE0reV9iPjsd59T4y/OgBKoeIZyD+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-mGgpbS_RNyyxq4UCJfAczQ-1; Tue, 21 Dec 2021 02:04:36 -0500
X-MC-Unique: mGgpbS_RNyyxq4UCJfAczQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8CB61006AA6;
 Tue, 21 Dec 2021 07:04:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35B307EFD4;
 Tue, 21 Dec 2021 07:04:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 21/36] backends: move dbus-vmstate1.xml to backends/
Date: Tue, 21 Dec 2021 10:58:40 +0400
Message-Id: <20211221065855.142578-22-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Although not used by the backend itself, use a common location for
documentation and sharing purposes.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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
index ebeac59b3f95..913e987409d5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -98,7 +98,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
   #qtests_i386 += ['dbus-vmstate-test']
   dbus_vmstate1 = custom_target('dbus-vmstate description',
                                 output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
-                                input: files('dbus-vmstate1.xml'),
+                                input: meson.source_root() / 'backends/dbus-vmstate1.xml',
                                 command: [config_host['GDBUS_CODEGEN'],
                                           '@INPUT@',
                                           '--interface-prefix', 'org.qemu',
-- 
2.34.1.8.g35151cf07204


