Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DF45C2BA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:29:03 +0100 (CET)
Received: from localhost ([::1]:57500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsKc-0004B9-HK
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprvl-0006d9-7t
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprve-0005yQ-QJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637758994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOXvyYQklsNW8z1Epro+zlLmKaY5IaL6qYorb34ulvc=;
 b=gbWHZ97GXJsVRaWYN1bAFV/6thscO70t2sdJYyFZ4LPnIgWLOMt4uCCvwKJW7IPeBNY/YQ
 Q0DvjdxquDWph7XnktrZnhPW0U47NcWUxo0F8bNz34gR9UniX8IfYSjIeakUyMknFSzhpz
 bk/urYwo3rvHoy9iRUdkUtYw351H/fo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-eWsjGdsiPeOWXW6I3YtVZw-1; Wed, 24 Nov 2021 08:03:11 -0500
X-MC-Unique: eWsjGdsiPeOWXW6I3YtVZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3564801983;
 Wed, 24 Nov 2021 13:03:09 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14EC879454;
 Wed, 24 Nov 2021 13:03:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/18] tests/docker: updates to alpine package list
Date: Wed, 24 Nov 2021 13:01:47 +0000
Message-Id: <20211124130150.268230-16-berrange@redhat.com>
In-Reply-To: <20211124130150.268230-1-berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup the package lists by removing some entries that we don't need to
directly reference

  binutils: implied by the compiler toolchain
  coreutils: not required by QEMU build
  mesa-egl mesa-gbm: implied by mesa-dev
  ninja: alias for samurai package
  shadow: not required by QEMU build
  util-linux-dev: not directly required by QEMU build

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..5a1808726e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -8,9 +8,7 @@ RUN apk upgrade
 ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
-	binutils \
 	ccache \
-	coreutils \
 	curl-dev \
 	g++ \
 	gcc \
@@ -33,22 +31,18 @@ ENV PACKAGES \
 	lzo-dev \
 	make \
 	mesa-dev \
-	mesa-egl \
-	mesa-gbm \
 	meson \
 	ncurses-dev \
-	ninja \
 	perl \
 	pulseaudio-dev \
 	python3 \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
-	shadow \
+	samurai \
 	snappy-dev \
 	spice-dev \
 	texinfo \
 	usbredir-dev \
-	util-linux-dev \
 	vde2-dev \
 	virglrenderer-dev \
 	vte3-dev \
-- 
2.33.1


