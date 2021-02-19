Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02F31F593
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:03:20 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD0kx-0008Rc-Ax
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:03:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0ft-0003a0-NL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:58:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD0fq-0002fO-9h
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 02:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613721481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=olfqQqLKFFR1PUJ0LzTVa0H2O2upFCA3cPXP2RBTFSk=;
 b=IfqJxe3R5UAABLuqZUfr7NvECVuqvzWrEpCq8LRqwzQ/+e9r0DKw2UQKicV+xeqq6l7tBy
 byfSB9D90qvIjJjXfF8aQ00nw89uiF7Zx/u8MuQ+BC5Fs9TBGwSTvSdCxiXnKn4Duv7a93
 OxO7Ut4Cagvji4Ybb2unUJv4LVt6I4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-F8ZKNeOoMACjq3NAF5oh_w-1; Fri, 19 Feb 2021 02:57:57 -0500
X-MC-Unique: F8ZKNeOoMACjq3NAF5oh_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9F44107ACF8;
 Fri, 19 Feb 2021 07:57:56 +0000 (UTC)
Received: from thuth.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15C7F5D9C2;
 Fri, 19 Feb 2021 07:57:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/10] gitlab-ci: Display Avocado log content when tests timeout
Date: Fri, 19 Feb 2021 08:57:33 +0100
Message-Id: <20210219075738.2261103-6-thuth@redhat.com>
In-Reply-To: <20210219075738.2261103-1-thuth@redhat.com>
References: <20210219075738.2261103-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
of failed acceptances") we display the log content of failing tests
(Avocado "FAIL" event).

Since we are also interested in tests timeouting, update our global
Avocado config to display log content for the "INTERRUPT" event,
"possible when the timeout is reached" (See [*]).

[*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#test-statuses

Suggested-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210215171438.935665-1-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 870d5f83f5..fcbec77a91 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,7 +64,7 @@ include:
     - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
     - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
            >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL"]'
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
            >> ~/.config/avocado/avocado.conf
     - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
         du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-- 
2.27.0


