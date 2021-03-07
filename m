Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC33005A
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 12:35:23 +0100 (CET)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIrgw-00014y-05
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 06:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lIrfy-00009U-0T
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 06:34:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lIrfu-0005gt-1z
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 06:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615116855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K/WPsCjc8hf5AVKPZV7gykeUnRTIgpE3cjTfT+zLPmY=;
 b=RJSuJtmMw5K+wJlJ/MUMmC3HBzxuYrc2p9JvYIeisOVKtKllD4xlEZrwSOOZuwcwH40VLS
 7+m05aV09w1T2vPLLWRlIRkqkh/3C5cCXLUCDTWgny0ZHb53q+aFlAG9YaJAZxO0ZPPFT4
 BILBTrOiY3V5dSyY9jbF/X1S266wpUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-FgegxhIGMg-_Ex-AWpdxFw-1; Sun, 07 Mar 2021 06:34:11 -0500
X-MC-Unique: FgegxhIGMg-_Ex-AWpdxFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5CE41005D4E;
 Sun,  7 Mar 2021 11:34:09 +0000 (UTC)
Received: from thuth.com (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11AA2100164A;
 Sun,  7 Mar 2021 11:34:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the generic CI
 section
Date: Sun,  7 Mar 2021 12:34:03 +0100
Message-Id: <20210307113403.11028-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The status of the gitlab-CI files is currently somewhat confusing, and
it is often not quite clear whether a patch should go via my tree or
via the testing tree of Alex. That situation has grown historically...
Initially, I was the only one using the gitlab-CI, just for my private
repository there. But in the course of time, the gitlab-CI switched to
use the containers from tests/docker/ (which is not part of the gitlab-CI
section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
completely for the repository and will soon use it as its gating CI, too.
So it makes way more sense if the gitlab-ci.yml files belong to the people
who are owning the qemu-project on gitlab.com and take care of the gitlab
CI there. Thus let's merge the gitlab-ci section into the common "test and
build automation" section, and change the status of myself to a "reviewer"
there instead.
While we're at it, I'm also removing the line with Fam there for now,
since he was hardly active during the last years in this area anymore.
If he ever gets more time for this part again in the future, we surely
can add the line back again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26c9454823..e9cd29ed0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
 
 Build and test automation
 -------------------------
-Build and test automation
+Build and test automation, Linux Continuous Integration
 M: Alex Bennée <alex.bennee@linaro.org>
-M: Fam Zheng <fam@euphon.net>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Thomas Huth <thuth@redhat.com>
+R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
+F: .gitlab-ci.yml
+F: .gitlab-ci.d/
 F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
 F: scripts/archive-source.sh
+W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
 W: http://patchew.org/QEMU/
 
@@ -3289,17 +3293,6 @@ S: Maintained
 F: .cirrus.yml
 W: https://cirrus-ci.com/github/qemu/qemu
 
-GitLab Continuous Integration
-M: Thomas Huth <thuth@redhat.com>
-M: Philippe Mathieu-Daudé <philmd@redhat.com>
-M: Alex Bennée <alex.bennee@linaro.org>
-R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-S: Maintained
-F: .gitlab-ci.yml
-F: .gitlab-ci.d/crossbuilds.yml
-F: .gitlab-ci.d/*py
-F: scripts/ci/gitlab-pipeline-status
-
 Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <f4bug@amsat.org>
-- 
2.27.0


