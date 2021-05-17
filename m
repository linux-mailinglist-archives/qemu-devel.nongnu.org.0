Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B551383521
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:19:32 +0200 (CEST)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lif1m-0000aG-T1
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1liezs-0006GF-Nx
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1liezi-0005k6-6Q
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621264635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRtj/MIFXCXExL9Ta6eUfNBqXs37N+8Kk58C8d0sUJ4=;
 b=NxvUHg138/wiikNTtpckIyKB/UgfaNC4fa7/W+BfEGykaFeCeaSKs4mEkveD9OK53xy7ei
 W3QUfy8XzEHqJD1+Ki93tkOrUNyFUUOQrEdHMpxuAnLCcN9/I4NKFUEZvmEZcmUze1OUxB
 dvMXLQePo/n59GU+h78h4uXEHnrHSs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-caM0Qq3eNIWT3RQnF8OAbQ-1; Mon, 17 May 2021 11:17:13 -0400
X-MC-Unique: caM0Qq3eNIWT3RQnF8OAbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 119368AB380;
 Mon, 17 May 2021 15:17:12 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-84.ams2.redhat.com
 [10.36.115.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 548F95C1D1;
 Mon, 17 May 2021 15:17:10 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] docs: fix references to docs/devel/build-system.rst
Date: Mon, 17 May 2021 17:17:00 +0200
Message-Id: <20210517151702.109066-4-sgarzare@redhat.com>
In-Reply-To: <20210517151702.109066-1-sgarzare@redhat.com>
References: <20210517151702.109066-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a14f0bf165 ("docs: convert build system documentation to rST")
converted docs/devel/build-system.txt to docs/devel/build-system.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/build-system.txt/build-system.rst/ \
      $(git grep -l docs/devel/build-system.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 MAINTAINERS                   | 2 +-
 tests/qapi-schema/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9ab4c0f63..d74b26b8b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3355,7 +3355,7 @@ Documentation
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/devel/build-system.txt
+F: docs/devel/build-system.rst
 
 GIT Data Mining Config
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d7163e6601..d96a300439 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -202,7 +202,7 @@ schemas = [
 
 # Because people may want to use test-qapi.py from the command line, we
 # are not using the "#! /usr/bin/env python3" trick here.  See
-# docs/devel/build-system.txt
+# docs/devel/build-system.rst
 test('QAPI schema regression tests', python, args: files('test-qapi.py', schemas),
      env: test_env, suite: ['qapi-schema', 'qapi-frontend'])
 
-- 
2.31.1


