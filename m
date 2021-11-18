Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDB45612C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 18:09:32 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnkug-0002oJ-VV
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 12:09:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnkmc-0000Lj-N5
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:01:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mnkmZ-0003sL-FM
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 12:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637254866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kMILvr25vLSZV+eSYACVnkE78wzD2/2zD8PD/ZaEzzQ=;
 b=hkafwr9igyz1Y33zmvossHdSiB9KzGb3E17jWn/htkTPoPquKQJgz05Qj5yqw91CVNTJIo
 hT7/+gAPx6YLihgm+jhqvC0Lh/Lva6WNZ4Sbm0yIYOjqAI7TJLuATWNV7VBp5s5dC9f6Qp
 YByG5lOrGjl5DBcyDKxw0z/A9qGLRqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-mYRqoWFlOTy35s8QefGQXw-1; Thu, 18 Nov 2021 12:01:01 -0500
X-MC-Unique: mYRqoWFlOTy35s8QefGQXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DCF080DDF9
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 17:00:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2195460BF1;
 Thu, 18 Nov 2021 17:00:30 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Update URLs of "SubmitAPatch" wiki doc
Date: Thu, 18 Nov 2021 18:00:28 +0100
Message-Id: <20211118170028.820558-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've recently converted[1] the "SubmitAPatch" page from Wiki to in-tree
docs.  So update the website to reflect this.

[1] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df03 --
    9f73de8df0 (docs: rSTify the "SubmitAPatch" wiki, 2021-11-10)

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 CONTRIBUTING.md            | 2 +-
 contribute.md              | 2 +-
 contribute/report-a-bug.md | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index d5cbf07..b6fc0bd 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -12,7 +12,7 @@ You should also CC the website maintainers:
 
 For further guidance on sending patches consult:
 
-https://wiki.qemu.org/Contribute/SubmitAPatch
+https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html
 
 It is expected that contributors check the rendered website before submitting
 patches. This is possible by either running jekyll locally, or by using the
diff --git a/contribute.md b/contribute.md
index 4802452..77cd5f4 100644
--- a/contribute.md
+++ b/contribute.md
@@ -17,6 +17,6 @@ permalink: /contribute/
   &ldquo;[Contributor FAQ](https://wiki.qemu.org/Contribute/FAQ)&rdquo;,
   &ldquo;[Improve the website](https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/)&rdquo;
 
-Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
+Please do not submit merge requests on GitLab; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html).
 
 Contributing to QEMU is subject to the [QEMU Code of Conduct](https://qemu.org/docs/master/devel/code-of-conduct.html).
diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
index 96b60d8..b24c759 100644
--- a/contribute/report-a-bug.md
+++ b/contribute/report-a-bug.md
@@ -18,7 +18,7 @@ When submitting a bug report, please try to do the following:
 
 * Include information about the host and guest (operating system, version, 32/64-bit).
 
-QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://wiki.qemu.org/Contribute/SubmitAPatch).
+QEMU does not use GitLab merge requests; patches are sent to the mailing list according to QEMU's [patch submissions guidelines](https://qemu-project.gitlab.io/qemu/devel/submitting-a-patch.html).
 
 Do NOT report security issues (or other bugs, too) as "confidential" bugs in the
 bug tracker.  QEMU has a [security process](../security-process) for issues
-- 
2.31.1


