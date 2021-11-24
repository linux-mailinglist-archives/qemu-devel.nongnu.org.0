Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75745C767
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:31:59 +0100 (CET)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptJX-0002Ff-0e
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mptFc-0004Jj-Uh
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mptFa-000654-MB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637764074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ynQhD3fPExjXoX0JCZSQX4qi2EqAa+ehZFYV5RduCA=;
 b=Dl6LPTs+GCpV6ee0amkU/6PrZKQ/dgX+k8Iz9XUjnDG8f+R3d8WOiLZTa7RejMlZmhGWRW
 ooERBSfIMB0gQAglp4jMfAUhkvZuuriRI73fyhTOtUVAnW2QhWxOwxSU/zLaWg0pCZkM0m
 Bj72v24twT+vU2z9NBAnnwFuabp7SPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-qSa_g6VRO2OP1LoTS9l0pQ-1; Wed, 24 Nov 2021 09:27:49 -0500
X-MC-Unique: qSa_g6VRO2OP1LoTS9l0pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27D284B9A1;
 Wed, 24 Nov 2021 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BAB760843;
 Wed, 24 Nov 2021 14:27:39 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs: rSTify "report-a-bug" page; move it to QEMU Git
Date: Wed, 24 Nov 2021 15:27:28 +0100
Message-Id: <20211124142728.1221817-3-kchamart@redhat.com>
In-Reply-To: <20211124142728.1221817-1-kchamart@redhat.com>
References: <20211124142728.1221817-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, eblake@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is also based on Paolo's suggestion[1] of "report-a-bug" page[2]
from the QEMU website being a candidate for docs/devel.

Converted from Markdown to rST using:

    $> pandoc -f markdown -t rst report-a-bug.md \
            -o reporting-a-bug.rst

Modifications:

- Rename this from "report-a-bug" page to "reporting-a-bug" to be
  consistent with existing in-tree docs.

- Use internal rST reference to "submitting-a-patch.rst"; and slightly
  tweak the sentence where this is referenced.

- Also tweak the description at the top of the 'index.rst' to to reflect
  that the manual also documents some of QEMU's development processes.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
[2] https://www.qemu.org/contribute/report-a-bug/

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/index.rst           |  8 +++++---
 docs/devel/reporting-a-bug.rst | 37 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 docs/devel/reporting-a-bug.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 424eff9294..39797679de 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -2,9 +2,10 @@
 Developer Information
 ---------------------
 
-This section of the manual documents various parts of the internals of QEMU.
-You only need to read it if you are interested in reading or
-modifying QEMU's source code.
+This section of the manual documents some of QEMU's development
+practises, and various internals of QEMU.  These documents are
+particularly useful for those interested in reading or modifying QEMU's
+source code.
 
 .. toctree::
    :maxdepth: 2
@@ -49,3 +50,4 @@ modifying QEMU's source code.
    submitting-a-patch
    submitting-a-pull-request
    security-process
+   reporting-a-bug
diff --git a/docs/devel/reporting-a-bug.rst b/docs/devel/reporting-a-bug.rst
new file mode 100644
index 0000000000..a72f91caf4
--- /dev/null
+++ b/docs/devel/reporting-a-bug.rst
@@ -0,0 +1,37 @@
+.. _reporting-a-bug:
+
+Reporting a bug
+===============
+
+Bugs can be filed at our `bug
+tracker <https://gitlab.com/qemu-project/qemu/-/issues>`__, which is
+hosted on GitLab. Note: If you’ve got a problem with how your Linux
+distribution packages QEMU, please use the bug tracker from your distro
+instead.
+
+When submitting a bug report, please try to do the following:
+
+-  Include the QEMU release version or the git commit hash into the
+   description, so that it is later still clear in which version you
+   have found the bug. Reports against the `latest
+   release </download/#source>`__ or even the latest development tree
+   are usually acted upon faster.
+
+-  Include the full command line used to launch the QEMU guest.
+
+-  Reproduce the problem directly with a QEMU command-line. Avoid
+   frontends and management stacks, to ensure that the bug is in QEMU
+   itself and not in a frontend.
+
+-  Include information about the host and guest (operating system,
+   version, 32/64-bit).
+
+QEMU does not use GitLab merge requests; patches are sent to the mailing
+list according to the guidelines mentioned here: :ref:`submitting-a-patch`.
+
+Do **NOT** report security issues (or other bugs, too) as “confidential”
+bugs in the bug tracker. QEMU has a :ref:`security-process` for issues
+that should be reported in a non-public way instead.
+
+For problems with KVM in the kernel, use the kernel bug tracker instead;
+the `KVM wiki <https://www.linux-kvm.org/page/Bugs>`__ has the details.
-- 
2.31.1


