Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0279A3433AF
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:23:06 +0100 (CET)
Received: from localhost ([::1]:45810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1n6-0001xH-LP
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j2-0007NT-8d
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1is-0005Qt-Pl
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EO6Fw4yK5qsJ1EoHIreQTy0BukXrVQzeo/4y1pbu9YU=;
 b=U3tqw7HbBa2jP97x5hAMIJAm4PVSXXNq7BhFa5HWl1QUkwOm9FjLeibZqqRfwLX39aiZDC
 zA/jl116lXahezQhXNt/Tdu+04+XHB0RYJtbESaTLW/hKW2zfRQYJf6IcGMZ0Jy1MZMcnF
 y4gTCBPwdS0CRCzj0nixJjW0uZxagOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ssBhl1GnPeyBymHc-vw0Vw-1; Sun, 21 Mar 2021 13:18:38 -0400
X-MC-Unique: ssBhl1GnPeyBymHc-vw0Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B11D5190A7A1;
 Sun, 21 Mar 2021 17:18:37 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D99B05D9CD;
 Sun, 21 Mar 2021 17:18:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/5] docs/devel/testing.rst: Fix references to unit tests
Date: Sun, 21 Mar 2021 18:18:29 +0100
Message-Id: <20210321171833.20736-2-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
References: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

With the recent move of the unit tests to tests/unit directory some
instructions under the "Unit tests" section became imprecise, which
are fixed by this change.

Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210318174407.2299930-1-wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1434a50cc4..1da4c4e4c4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -34,17 +34,17 @@ If you are writing new code in QEMU, consider adding a unit test, especially
 for utility modules that are relatively stateless or have few dependencies. To
 add a new unit test:
 
-1. Create a new source file. For example, ``tests/foo-test.c``.
+1. Create a new source file. For example, ``tests/unit/foo-test.c``.
 
 2. Write the test. Normally you would include the header file which exports
    the module API, then verify the interface behaves as expected from your
    test. The test code should be organized with the glib testing framework.
    Copying and modifying an existing test is usually a good idea.
 
-3. Add the test to ``tests/meson.build``. The unit tests are listed in a
+3. Add the test to ``tests/unit/meson.build``. The unit tests are listed in a
    dictionary called ``tests``.  The values are any additional sources and
    dependencies to be linked with the test.  For a simple test whose source
-   is in ``tests/foo-test.c``, it is enough to add an entry like::
+   is in ``tests/unit/foo-test.c``, it is enough to add an entry like::
 
      {
        ...
-- 
2.27.0


