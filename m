Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51C346C028
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 17:02:29 +0100 (CET)
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucvD-0005Ij-Ik
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 11:02:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mucu6-00049E-VL
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muctu-00026a-JM
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 11:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638892865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K+yZ2Hytt28Fb76xOQZ0orOKc4ZzXpKrjDHozZXOMLY=;
 b=Wim3nTTOTQ3nbFGcj3kYWqPnag3H6DomIO3utwIShxlKhze6mR62B25eYla4E+52XJjId+
 B6dZPu6vqweh0/XNSqFvDxWzn711LGHm9Lchkg2+M2GMKjUBr27GGB7sOKpzrA083xIkCn
 iDSSzC5VWRhUhpKzmDNSTjnidxo/jp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585-x56-vWFpMBGqFRXidFyhjA-1; Tue, 07 Dec 2021 11:01:01 -0500
X-MC-Unique: x56-vWFpMBGqFRXidFyhjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90AE81CCB8;
 Tue,  7 Dec 2021 16:01:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5977819741;
 Tue,  7 Dec 2021 16:00:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: add libfuse3 development headers
Date: Tue,  7 Dec 2021 16:00:25 +0000
Message-Id: <20211207160025.52466-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FUSE exports feature is not built because most container images do
not have libfuse3 development headers installed. Add the necessary
packages to the Dockerfiles.

Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/docker/dockerfiles/alpine.docker        | 1 +
 tests/docker/dockerfiles/centos8.docker       | 1 +
 tests/docker/dockerfiles/fedora.docker        | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 1 +
 tests/docker/dockerfiles/ubuntu.docker        | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker    | 1 +
 6 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..9ddb3c2ebc 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -12,6 +12,7 @@ ENV PACKAGES \
 	ccache \
 	coreutils \
 	curl-dev \
+	fuse3-dev \
 	g++ \
 	gcc \
 	git \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 7f135f8e8c..a2dae4be29 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -19,6 +19,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    fuse3-devel \
     gcc \
     gcc-c++ \
     genisoimage \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index c6fd7e1113..a3a712c87b 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -20,6 +20,7 @@ ENV PACKAGES \
     device-mapper-multipath-devel \
     diffutils \
     findutils \
+    fuse3-devel \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 3bbdb67f4f..2beb61bd7e 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -15,6 +15,7 @@ ENV PACKAGES \
     dbus-1 \
     diffutils \
     findutils \
+    fuse3-devel \
     gcc \
     gcc-c++ \
     gcovr \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index f0e0180d21..0c694a2bf0 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -29,6 +29,7 @@ ENV PACKAGES \
     libepoxy-dev \
     libfdt-dev \
     libffi-dev \
+    libfuse3-dev \
     libgbm-dev \
     libgnutls28-dev \
     libgtk-3-dev \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 15a026be09..a46feaecdd 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -34,6 +34,7 @@ ENV PACKAGES \
     libepoxy-dev \
     libfdt-dev \
     libffi-dev \
+    libfuse3-dev \
     libgbm-dev \
     libgcrypt20-dev \
     libglib2.0-dev \
-- 
2.33.1


