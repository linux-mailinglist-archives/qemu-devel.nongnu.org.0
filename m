Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED627D83A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 22:32:32 +0200 (CEST)
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNMIZ-000195-D0
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 16:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM6F-0001t8-Go
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNM65-0003VD-S1
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 16:19:47 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601410776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8K+DshiWKB+kYIq5FXrQuaN+d5b9nzNbf0RKpx257yo=;
 b=Do2UnsRwys+i7f5rDIytmnUUZ3NdJrEpD58m6WJqjJASUL6iERkRHNNxLFJg4LqIdK7dEE
 r/CNqaXZ+fYwBRBqA3WBEJJ4QiEDlJcM4YJveVk9JruLUs5algVYdWModUZ09cqDX2AelT
 EkeatB3Bqy94yqTs8i8hyrvmSETV3XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-eMEXWI81PkChR_htW9pzoA-1; Tue, 29 Sep 2020 16:19:34 -0400
X-MC-Unique: eMEXWI81PkChR_htW9pzoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D47718BE165;
 Tue, 29 Sep 2020 20:19:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D425A73674;
 Tue, 29 Sep 2020 20:19:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A93E11358DD; Tue, 29 Sep 2020 22:19:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] Remove texinfo dependency from docker and CI configs
Date: Tue, 29 Sep 2020 22:19:26 +0200
Message-Id: <20200929201926.2155622-30-armbru@redhat.com>
In-Reply-To: <20200929201926.2155622-1-armbru@redhat.com>
References: <20200929201926.2155622-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We don't need texinfo to build the docs any more, so we can
drop that dependency from our docker and other CI configs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200925162316.21205-22-peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 .travis.yml                                | 1 -
 scripts/coverity-scan/coverity-scan.docker | 1 -
 tests/docker/dockerfiles/debian10.docker   | 1 -
 tests/docker/dockerfiles/fedora.docker     | 1 -
 tests/docker/dockerfiles/ubuntu.docker     | 1 -
 tests/docker/dockerfiles/ubuntu1804.docker | 1 -
 tests/docker/dockerfiles/ubuntu2004.docker | 1 -
 7 files changed, 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index c75221dca3..bd9a6fc06c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -192,7 +192,6 @@ jobs:
         apt:
           packages:
             - python3-sphinx
-            - texinfo
             - perl
 
 
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index 018c03de6d..501ac67233 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -110,7 +110,6 @@ ENV PACKAGES \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
-    texinfo \
     usbredir-devel \
     virglrenderer-devel \
     vte291-devel \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index e3c11a454e..1e4188ba22 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -31,7 +31,6 @@ RUN apt update && \
         python3 \
         python3-setuptools \
         python3-sphinx \
-        texinfo \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
 ENV FEATURES docs
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 70b6186bd3..71e4b56977 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -96,7 +96,6 @@ ENV PACKAGES \
     tar \
     tesseract \
     tesseract-langpack-eng \
-    texinfo \
     usbredir-devel \
     virglrenderer-devel \
     vte291-devel \
diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 161806e6b8..b556ed17d2 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -63,7 +63,6 @@ ENV PACKAGES \
     python3-yaml \
     python3-sphinx \
     sparse \
-    texinfo \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index a10ea2850b..a6a7617da6 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -49,7 +49,6 @@ ENV PACKAGES \
     python3-yaml \
     python3-sphinx \
     sparse \
-    texinfo \
     xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8d10934a2a..cafe8443fb 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -57,7 +57,6 @@ ENV PACKAGES flex bison \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    texinfo \
     xfslibs-dev\
     vim
 RUN apt-get update && \
-- 
2.26.2


