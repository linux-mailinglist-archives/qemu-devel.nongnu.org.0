Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DCB3713A6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:31:57 +0200 (CEST)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVro-0006jF-2e
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldVqH-0005kF-CY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldVqF-0002gx-1c
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620037818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCtbpOuzxUOZ827rU9xkSBvTmViwhHibIK7I9JCSxT4=;
 b=dvQU+8NHmHeylEe4lak+8qULTou236Y/uM3juYUitFWh5bVURbk5KKtXGzJ9Sf6qmX8uRG
 +vNAZ7GCjX4u1ANiuIqUmoELuVf7DQtWY2klMxS9Z8rq7a2qY7G9Yp9x6EuwBMJ389L9m8
 UGu5/1qlmPymcXaIw5YFerAM8WTqBhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-eQilysavO5S1g7FdIV7LEQ-1; Mon, 03 May 2021 06:30:14 -0400
X-MC-Unique: eQilysavO5S1g7FdIV7LEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45DFB1922023;
 Mon,  3 May 2021 10:30:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62CB119D7D;
 Mon,  3 May 2021 10:30:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH] Update website to point to the new bug tracker at
 GitLab instead of Launchpad
Date: Mon,  3 May 2021 12:30:07 +0200
Message-Id: <20210503103007.1034171-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've started migrating the bug tickets from Launchpad to GitLab, so
it does not make too much sense anymore that users open new tickets
in the old system. Let's direct them now to the GitLab tracker instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 contribute.md              | 3 ++-
 contribute/report-a-bug.md | 5 ++++-
 support.md                 | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/contribute.md b/contribute.md
index d7e295f..cbb476d 100644
--- a/contribute.md
+++ b/contribute.md
@@ -3,7 +3,8 @@ title: Contribute to QEMU!
 permalink: /contribute/
 ---
 
-* Report a bug in our bugtracker: [https://bugs.launchpad.net/qemu/](https://bugs.launchpad.net/qemu/)<br>
+* Report a bug in our bugtracker:
+  <https://gitlab.com/qemu-project/qemu/-/issues><br/>
   See also [How to report a bug](report-a-bug/) or [How to report a security bug](security-process/)
 
 * Clone ([or browse](https://gitlab.com/qemu-project/qemu)) the git repository: <br>`git clone https://gitlab.com/qemu-project/qemu.git`
diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
index 1cc42e7..922f699 100644
--- a/contribute/report-a-bug.md
+++ b/contribute/report-a-bug.md
@@ -3,7 +3,10 @@ title: Reporting a bug
 permalink: /contribute/report-a-bug/
 ---
 
-Bugs can be filed at our [bug tracker](https://bugs.launchpad.net/qemu/), which is hosted on Launchpad. If you've got a problem with how your Linux distribution packages QEMU, use the bug tracker from your distro instead.
+Bugs can be filed at our
+[bug tracker](https://gitlab.com/qemu-project/qemu/-/issues), which is hosted
+on GitLab. Note: If you've got a problem with how your Linux distribution
+packages QEMU, please use the bug tracker from your distro instead.
 
 When submitting a bug report, please try to do the following:
 
diff --git a/support.md b/support.md
index 252351c..b622362 100644
--- a/support.md
+++ b/support.md
@@ -41,5 +41,5 @@ response. If you can't leave IRC open and wait you may be better
 served by a mailing list.
 
 * If you think you have found a bug you can report it on [our bug
-  tracker](https://bugs.launchpad.net/qemu/).<br>
+  tracker](https://gitlab.com/qemu-project/qemu/-/issues).<br/>
 Please see our guide on [how to report a bug](/contribute/report-a-bug/)
-- 
2.27.0


