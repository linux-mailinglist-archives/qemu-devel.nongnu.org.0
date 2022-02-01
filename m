Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163314A59E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:21:36 +0100 (CET)
Received: from localhost ([::1]:39030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqI3-0003K6-6h
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:21:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEqFy-0000yu-Ux
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEqFw-0003ti-0W
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WDQEEPiML9BozLjEP0e6kOKnUaoDBAdZ35PyQKxNcgo=;
 b=aOE7CBtwkpuZfX+v3PT5sBCboojnNDZ9+hAQcp/wa0udAc/E1KomAQb3WnKawM4Y7KcyF1
 wcsduY9aZznNe4wKtlJDMMRvqldvPYVR4yvJssOZ1vUn7XiLIRzS8vmYqP7tgP314gU27N
 qeQuq4QEr/uB+E6kCCcpgioTrfZN14I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-fUIrtxxRPsa6rahpwFfNvA-1; Tue, 01 Feb 2022 05:19:19 -0500
X-MC-Unique: fUIrtxxRPsa6rahpwFfNvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C6C58144E0;
 Tue,  1 Feb 2022 10:19:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7F854684;
 Tue,  1 Feb 2022 10:19:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Date: Tue,  1 Feb 2022 11:19:11 +0100
Message-Id: <20220201101911.97900-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for CentOS 8 has stopped at the end of 2021, so let's
switch to the Stream variant instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker | 4 ++--
 tests/lcitool/refresh                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index cbb909d02b..cf95cd4b4a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile centos-8 qemu
+#  $ lcitool dockerfile centos-stream-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/centos:8
+FROM quay.io/centos/centos:stream8
 
 RUN dnf update -y && \
     dnf install 'dnf-command(config-manager)' -y && \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 033120e223..30196ef3cd 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
 ]
 
 try:
-   generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("centos8", "centos-stream-8")
    generate_dockerfile("fedora", "fedora-35")
    generate_dockerfile("ubuntu1804", "ubuntu-1804",
                        trailer="".join(ubuntu1804_skipssh))
-- 
2.27.0


