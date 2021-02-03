Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA430D8D6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:39:04 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GUx-0007Uh-Gg
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:39:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GPG-0002A2-MD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GPD-0004yb-IN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLdaRt8mrH9RpzaX7ahiAaTtfEwMY8jf0H4kriCFESU=;
 b=PjdTKHgliyM/cwLH8ED3hfK25+9eKHC6DdiCTPE1YD6QQJKZyGzyFJYwxJeSeT8cte+e5S
 zvK2NzjWbE02ylqkwj1gd0ChqQUbiAipu1B7Jg5JIvt3ZeW1X3zznWNVh8SIzd9VzUCbgy
 s+bgbFlerrwPBbySIKMRqKipdbLxBfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-1SyRhlD0OY-QZgXgcDsQuA-1; Wed, 03 Feb 2021 06:33:00 -0500
X-MC-Unique: 1SyRhlD0OY-QZgXgcDsQuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3988100C660;
 Wed,  3 Feb 2021 11:32:59 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72BED60C66;
 Wed,  3 Feb 2021 11:32:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/6] travis.yml: Remove the --enable-debug jobs
Date: Wed,  3 Feb 2021 12:32:41 +0100
Message-Id: <20210203113243.280883-5-thuth@redhat.com>
In-Reply-To: <20210203113243.280883-1-thuth@redhat.com>
References: <20210203113243.280883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have such jobs in the gitlab-CI ("build-some-softmmu" and
"build-user-plugins"), so we can simply drop these from the Travis-CI.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 45dd017420..b3fc72f561 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,18 +119,6 @@ after_script:
 
 jobs:
   include:
-    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
-    - name: "GCC debug (main-softmmu)"
-      env:
-        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-
-
-    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
-    - name: "GCC debug (user)"
-      env:
-        - CONFIG="--enable-debug-tcg --disable-system"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
 
     # Using newer GCC with sanitizers
-- 
2.27.0


