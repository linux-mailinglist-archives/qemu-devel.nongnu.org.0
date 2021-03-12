Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0F3395F4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:15:04 +0100 (CET)
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmJT-0001hp-4K
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWb-0007sV-7C
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWV-0000nD-6V
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ck0o8u8iaicyjbwugzYY7LiPcPw7lo+wpN33f9Wh8yk=;
 b=DrIHUBSOfimx4a40ksTzJbL2f4+PSwpdcGc7r+HWIwr7tywrx8NX5jsKftsaAS5JeWaEEz
 xhoQlIpg74Y5PBY5gJetK+LfdW/FTlkb83/l0dozvRDXu+FLCd8kWGvxoZia+Fx/KvjTrF
 grS0G5qN2w84yXCvhBpD7zun9R4lYso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-0roMZDtTNjuC2VsqTrS9hg-1; Fri, 12 Mar 2021 12:24:12 -0500
X-MC-Unique: 0roMZDtTNjuC2VsqTrS9hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D5791084C95;
 Fri, 12 Mar 2021 17:24:11 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E93019744;
 Fri, 12 Mar 2021 17:24:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 8/9] MAINTAINERS: Merge the Gitlab-CI section into the generic
 CI section
Date: Fri, 12 Mar 2021 18:23:55 +0100
Message-Id: <20210312172356.968219-9-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The status of the gitlab-CI files is currently somewhat confusing, and
it is often not quite clear whether a patch should go via my tree or
via the testing tree of Alex. That situation has grown historically...
Initially, I was the only one using the gitlab-CI, just for my private
repository there. But in the course of time, the gitlab-CI switched to
use the containers from tests/docker/ (which is not part of the gitlab-CI
section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
completely for the repository and will soon use it as its gating CI, too,
so it makes way more sense if the gitlab-ci.yml files belong to the people
who are owning the qemu-project on gitlab.com and take care of the gitlab
CI there. Thus let's merge the gitlab-ci section into the common "test and
build automation" section.

And while we're at it, I'm also removing the line with Fam there for now,
since he was hardly active during the last years in this area anymore.
If he ever gets more time for this part again in the future, we surely
can add the line back again. I'm also removing the Patchew URL from this
section now since Patchew's files are not tracked in the main QEMU repo
and it is also not maintained by Alex, Philippe and myself.
The maintainers of Patchew are still listed more accurately in the wiki on
https://wiki.qemu.org/AdminContacts & https://wiki.qemu.org/Testing/CI/Patchew
instead.

Now to avoid that Alex is listed here in this section alone, Philippe and
I agreed to help as backup maintainers here, too. And Willian volunteered
to be an additional reviewer.

Message-Id: <20210309112356.737266-1-thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Fam Zheng <fam@euphon.net>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a68f09b25..430872e5d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3282,19 +3282,23 @@ F: include/hw/remote/iohub.h
 
 Build and test automation
 -------------------------
-Build and test automation
+Build and test automation, general continuous integration
 M: Alex Bennée <alex.bennee@linaro.org>
-M: Fam Zheng <fam@euphon.net>
-R: Philippe Mathieu-Daudé <philmd@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Thomas Huth <thuth@redhat.com>
+R: Wainer dos Santos Moschetta <wainersm@redhat.com>
+R: Willian Rampazzo <willianr@redhat.com>
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
-W: http://patchew.org/QEMU/
 
 FreeBSD Hosted Continuous Integration
 M: Ed Maste <emaste@freebsd.org>
@@ -3309,17 +3313,6 @@ S: Maintained
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


