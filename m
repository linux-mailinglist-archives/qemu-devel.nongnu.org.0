Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE834296A66
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 09:40:09 +0200 (CEST)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVrgG-0006xD-PQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 03:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVraf-0008Lm-1x
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kVrab-0003b4-4q
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 03:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603438456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=w/B4uaEaEVg/93ryOexRbvz178PIMx340kqKaDYTAvo=;
 b=JqVae7fpyUyxzwhVcmn9Rt2ArondAKs+RNc9zBC0LzznncSTYL1Ig8W/BJFuP/2+VKTT7V
 mahIOtBcd96AuuqV/JjYZIB9fP16Ihfm9NWGrir8R2LD2z9m/9O82bQJ/Mvrbp5IQW87c4
 Prbfmxzu/K2N2hWxGa81Ajd5nKVry1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-UvwuBqTHNbWnPyIhBBFuZA-1; Fri, 23 Oct 2020 03:34:14 -0400
X-MC-Unique: UvwuBqTHNbWnPyIhBBFuZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5561009E21;
 Fri, 23 Oct 2020 07:34:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-123.ams2.redhat.com [10.36.112.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28B5255775;
 Fri, 23 Oct 2020 07:34:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 4/4] test/docker/dockerfiles: Add missing packages for
 acceptance tests
Date: Fri, 23 Oct 2020 09:33:51 +0200
Message-Id: <20201023073351.251332-5-thuth@redhat.com>
In-Reply-To: <20201023073351.251332-1-thuth@redhat.com>
References: <20201023073351.251332-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of the "check-acceptance" tests are still skipped in the CI
since the docker images do not provide the necessary packages, e.g.
the netcat binary. Add them to get more test coverage.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker      | 1 +
 tests/docker/dockerfiles/debian-amd64.docker | 3 +++
 tests/docker/dockerfiles/fedora.docker       | 1 +
 tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
 4 files changed, 6 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 585dfad9be..a589142114 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -18,6 +18,7 @@ ENV PACKAGES \
     lzo-devel \
     make \
     mesa-libEGL-devel \
+    nmap-ncat \
     nettle-devel \
     ninja-build \
     perl-Test-Harness \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 314c6bae83..55075d9fce 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -23,6 +23,9 @@ RUN apt update && \
         libsnappy-dev \
         libvte-dev \
         netcat-openbsd \
+        openssh-client \
+        python3-numpy \
+        python3-opencv \
         python3-venv
 
 # virgl
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index ac79d95418..0b5053f2d0 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -73,6 +73,7 @@ ENV PACKAGES \
     mingw64-pixman \
     mingw64-pkg-config \
     mingw64-SDL2 \
+    nmap-ncat \
     ncurses-devel \
     nettle-devel \
     ninja-build \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 17b37cda38..355bbb3c63 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -47,6 +47,7 @@ ENV PACKAGES flex bison \
     libxen-dev \
     libzstd-dev \
     make \
+    netcat-openbsd \
     ninja-build \
     python3-numpy \
     python3-opencv \
-- 
2.18.2


