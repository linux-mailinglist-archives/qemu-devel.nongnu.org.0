Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0877726FAC6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 12:41:31 +0200 (CEST)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJDpa-0007bm-4B
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 06:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJDjB-00027h-AQ
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:34:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJDj9-0005Cs-FW
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 06:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600425289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IoJkg+kP5sX6VTlmD7njXXu8i6+0nbOqNOoc2rm+NI=;
 b=cp8Xw6ilHiAnUwj4sEiCjPV6S8LlGf7YoXZ99j5wDxh2BPYXu4NUgyMj/doaEmhsLrqECA
 wQEu8RZxsUxSORGuQZKXpZ4rleI5D7VtgHlk+3/awYQH9xRaUkTOfcfh5a7S/Q/W5HRTS5
 4tzcWe3JYyrz7fUXZAHg4RB/e2jJYnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-i6rMKuARPqCBC3x43gss6Q-1; Fri, 18 Sep 2020 06:34:48 -0400
X-MC-Unique: i6rMKuARPqCBC3x43gss6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCFA84E241;
 Fri, 18 Sep 2020 10:34:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 994EB619C4;
 Fri, 18 Sep 2020 10:34:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 4/6] travis.yml: Drop the default softmmu builds
Date: Fri, 18 Sep 2020 12:34:28 +0200
Message-Id: <20200918103430.297167-5-thuth@redhat.com>
In-Reply-To: <20200918103430.297167-1-thuth@redhat.com>
References: <20200918103430.297167-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 05:23:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The total runtime of all Travis jobs is very long and we are testing
all softmmu targets in the gitlab-CI already - so we can speed up the
Travis testing a little bit by not testing the softmmu targets here
anymore.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index c75221dca3..1fc49b0746 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -123,20 +123,6 @@ jobs:
         - CONFIG="--disable-system --static"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
-
-    # we split the system builds as it takes a while to build them all
-    - name: "GCC (main-softmmu)"
-      env:
-        - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
-    - name: "GCC (other-softmmu)"
-      env:
-       - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
     # Just build tools and run minimal unit and softfloat checks
     - name: "GCC check-unit and check-softfloat"
       env:
-- 
2.18.2


