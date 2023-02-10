Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EAB691589
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 01:33:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQHKY-0001PA-VV; Thu, 09 Feb 2023 19:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQHKW-0001Nx-L0
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pQHKU-0001eH-5J
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 19:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675989113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEMmHVXKwLYZ3+jNDnUUS2kXEpufF4iEYW/w8I6VeHI=;
 b=FVLwRAXpmGiB+M53JoEu/5JXFTQM5NyVZzvD3aqmQGrWIoVJ7OCzKmOOBmxnqBDHKiXSWe
 xxh7glU2dsouoWvxklKlpABOWxHakmciJJ+8R2fvqyCO4KIUmoJkuMzH63Eo3qYFFL/XjU
 xT/3OCawK896j3faBclbuYfYdAeogLs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-sSWcC9C9OOezLCHZyobDrw-1; Thu, 09 Feb 2023 19:31:52 -0500
X-MC-Unique: sSWcC9C9OOezLCHZyobDrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C43C285C1D2;
 Fri, 10 Feb 2023 00:31:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35D7D18EC1;
 Fri, 10 Feb 2023 00:31:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 5/7] DO-NOT-MERGE: testing: Add Python >= 3.7 to Centos,
 OpenSuSE
Date: Thu,  9 Feb 2023 19:31:45 -0500
Message-Id: <20230210003147.1309376-6-jsnow@redhat.com>
In-Reply-To: <20230210003147.1309376-1-jsnow@redhat.com>
References: <20230210003147.1309376-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is just a proof-of-concept patch, as these files are lcitool
generated. The real fix will involve updating the lcitool configuration
and updating these files that way.

This is just to prove that bumping our dependency works.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker       | 1 +
 tests/docker/dockerfiles/opensuse-leap.docker | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index fbc953c6dcc..a3bfddf382d 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -95,6 +95,7 @@ RUN dnf distro-sync -y && \
         pkgconfig \
         pulseaudio-libs-devel \
         python3 \
+        python38 \
         python3-PyYAML \
         python3-numpy \
         python3-pillow \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4b2c02d6abf..9e688c1d441 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -89,6 +89,7 @@ RUN zypper update -y && \
            pam-devel \
            pcre-devel-static \
            pkgconfig \
+           python39 \
            python3-Pillow \
            python3-PyYAML \
            python3-Sphinx \
-- 
2.39.0


