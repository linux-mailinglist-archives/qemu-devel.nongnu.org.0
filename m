Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7C5459560
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 20:13:27 +0100 (CET)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpEkn-0001a9-OG
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 14:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mpEjR-0000qL-38
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mpEjO-0004jB-A3
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:12:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637608308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Owv5Dkmf3dGyltmdm/fa1dNGUzpqhA3v2bqiJDsfb20=;
 b=X+yreTj85Q0BJVyNmq4KyhHuIQwGbX9ZYP8xSIBdgYGR/yB7dTmRvyIHda0azj3gFb96NR
 KmaiHj7xfpk2cDs+eDs5Phsu3+kDM5/UOGNIcm5O4wlpwswSf6fHAmIv4d1NNhakBbvzpx
 keMLShlSqyCn1SxU3+jWClGQsYmSCqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-BMPHYU9jMHKGwQUv31L9jA-1; Mon, 22 Nov 2021 14:11:45 -0500
X-MC-Unique: BMPHYU9jMHKGwQUv31L9jA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D4B101AFA7;
 Mon, 22 Nov 2021 19:11:43 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 459CA79446;
 Mon, 22 Nov 2021 19:11:25 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Mon, 22 Nov 2021 16:11:24 -0300
Message-Id: <20211122191124.31620-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove me as a reviewer for the Build and test automation and the
Integration Testing with the Avocado Framework and add Beraldo
Leal.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8f5156bfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .gitlab-ci.yml
@@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.33.1


