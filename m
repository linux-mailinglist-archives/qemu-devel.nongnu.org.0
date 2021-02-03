Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7A930D8BE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:36:23 +0100 (CET)
Received: from localhost ([::1]:39284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GSM-0003v7-Oc
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GP8-00028i-Qo
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GP7-0004x7-9K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5PqkrUYgWCNpCUhNyeniJvYeG5+YBw0RxAOY6uRLjQo=;
 b=fAJSuHhpEzroDDXS5YG9Hr9FI1UKOksfwtKDEkfVTRJU3UFCDvdYavLfq26/QkunOVlt6+
 KdHx6vea2UI5Qh9Or/PGfUb+36i/NFmjQWuFqdKpHYZ6XBo5cvpAosAR5BCSgelVlZD7Ob
 cflZTEJDp/MUfPe9JXg+Pxm/RtzOYr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-80hp57PHMVmplmOiRMPo3Q-1; Wed, 03 Feb 2021 06:32:59 -0500
X-MC-Unique: 80hp57PHMVmplmOiRMPo3Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15CDF107ACE6;
 Wed,  3 Feb 2021 11:32:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9951460C66;
 Wed,  3 Feb 2021 11:32:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/6] travis.yml: Move the --enable-modules test to the
 gitlab-CI
Date: Wed,  3 Feb 2021 12:32:40 +0100
Message-Id: <20210203113243.280883-4-thuth@redhat.com>
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

Simply add the flag to an existing job, no need for yet another
job here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 1 +
 .travis.yml    | 6 ------
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 41e11b41e4..4654798523 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -223,6 +223,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
+                    --enable-modules
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/.travis.yml b/.travis.yml
index d1e9016da5..45dd017420 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -132,12 +132,6 @@ jobs:
         - CONFIG="--enable-debug-tcg --disable-system"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
 
-    # Module builds are mostly of interest to major distros
-    - name: "GCC modules (main-softmmu)"
-      env:
-        - CONFIG="--enable-modules --target-list=${MAIN_SOFTMMU_TARGETS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
 
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
-- 
2.27.0


