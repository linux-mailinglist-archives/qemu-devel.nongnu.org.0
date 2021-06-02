Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F763398344
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:40:46 +0200 (CEST)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLUb-00081l-Mt
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQM-0008Am-WC
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQL-0003ki-7o
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuFlccu0v/yUWf6WGgPevU062bNLnchwqjsz98nP6No=;
 b=hgA68V0OIjTJul6eXrgPDNhufP17lo0U1x7FW3FG43u8iVVnaJtyZeVkslHgK/PJwIHeD3
 NnJ5kMz92FZQ1BB2/5bT0o5mM8rD3LZEjRWHJ7aV4ypFamzTy+PbV8xkreyBCClXKh8svg
 6ITBRrKvjeh8pYvopFgZthcSzalLXQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-XUuI37-8OQWGmZEvaai0eQ-1; Wed, 02 Jun 2021 03:36:18 -0400
X-MC-Unique: XUuI37-8OQWGmZEvaai0eQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 307E21854E27;
 Wed,  2 Jun 2021 07:36:17 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E1F5C737;
 Wed,  2 Jun 2021 07:36:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/17] docs: fix references to docs/devel/build-system.rst
Date: Wed,  2 Jun 2021 09:35:52 +0200
Message-Id: <20210602073606.338994-4-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit a14f0bf165 ("docs: convert build system documentation to rST")
converted docs/devel/build-system.txt to docs/devel/build-system.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/build-system.txt/build-system.rst/ \
      $(git grep -l docs/devel/build-system.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210517151702.109066-4-sgarzare@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS                   | 2 +-
 tests/qapi-schema/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d195a9d95..96a4eeb5a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3361,7 +3361,7 @@ Documentation
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/devel/build-system.txt
+F: docs/devel/build-system.rst
 
 GIT Data Mining Config
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 9e8f658ce3..b8de58116a 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -208,7 +208,7 @@ schemas += [meson.current_source_dir() / 'missing-schema.json']
 
 # Because people may want to use test-qapi.py from the command line, we
 # are not using the "#! /usr/bin/env python3" trick here.  See
-# docs/devel/build-system.txt
+# docs/devel/build-system.rst
 test('QAPI schema regression tests', python,
      args: files('test-qapi.py') + schemas,
      env: test_env, suite: ['qapi-schema', 'qapi-frontend'])
-- 
2.27.0


