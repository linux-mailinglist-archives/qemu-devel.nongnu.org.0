Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25BC64C6D8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:11:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5OiE-0007kE-5r; Wed, 14 Dec 2022 05:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Oi1-0007eP-Hg
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohz-0001EX-MT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mJ4tAjlesJSAXrMTYi1FsNFxUG9gwH9T6d1DHJIqb64=;
 b=YTtlAri/f/sfuNh5sgKrFC3sP80zy+OV8CM26HXjFBYdNJqx7APl2xk6mXxH/8a6bf3Wog
 hqST3MeXP3Ua810Oh+FCD2/aUCN4O6qFLVYxNgx3kGUIN9TANR4Cdn3MMKgQ6HdLkH8qiV
 gIJ69of353wGPj3eDTNIHkEgmYG1XFc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-IAQ39WYXP2iwZBd2U73VKA-1; Wed, 14 Dec 2022 05:09:47 -0500
X-MC-Unique: IAQ39WYXP2iwZBd2U73VKA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E5BB29AA2C0;
 Wed, 14 Dec 2022 10:09:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2C4492C14;
 Wed, 14 Dec 2022 10:09:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/23] .gitlab/issue_templates: Move suggestions into comments
Date: Wed, 14 Dec 2022 11:09:10 +0100
Message-Id: <20221214100911.165291-23-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Many users forget to remove the suggestions from the bug template
when creating a new issue. So when searching for strings like "s390x"
or "Windows", you get a lot of unrelated issues in the results.
Thus let's move the suggestions into HTML comments - so they will
still show up in the markdown when editing the bug, while being
hidden/ignored in the final text or in the search queries.

Message-Id: <20221201133756.77216-1-thuth@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab/issue_templates/bug.md | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
index e910f7b1c2..53a79f5828 100644
--- a/.gitlab/issue_templates/bug.md
+++ b/.gitlab/issue_templates/bug.md
@@ -18,11 +18,11 @@ https://www.qemu.org/contribute/security-process/
 -->
 
 ## Host environment
- - Operating system: (Windows 10 21H1, Fedora 34, etc.)
- - OS/kernel version: (For POSIX hosts, use `uname -a`)
- - Architecture: (x86, ARM, s390x, etc.)
- - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
- - QEMU version: (e.g. `qemu-system-x86_64 --version`)
+ - Operating system:            <!-- Windows 10 21H1, Fedora 37, etc. -->
+ - OS/kernel version:           <!-- For POSIX hosts, use `uname -a` -->
+ - Architecture:                <!-- x86, ARM, s390x, etc. -->
+ - QEMU flavor:                 <!-- qemu-system-x86_64, qemu-aarch64, qemu-img, etc. -->
+ - QEMU version:                <!-- e.g. `qemu-system-x86_64 --version` -->
  - QEMU command line:
    <!--
    Give the smallest, complete command line that exhibits the problem.
@@ -35,9 +35,9 @@ https://www.qemu.org/contribute/security-process/
    ```
 
 ## Emulated/Virtualized environment
- - Operating system: (Windows 10 21H1, Fedora 34, etc.)
- - OS/kernel version: (For POSIX guests, use `uname -a`.)
- - Architecture: (x86, ARM, s390x, etc.)
+ - Operating system:            <!-- Windows 10 21H1, Fedora 37, etc. -->
+ - OS/kernel version:           <!-- For POSIX guests, use `uname -a`. -->
+ - Architecture:                <!-- x86, ARM, s390x, etc. -->
 
 
 ## Description of problem
-- 
2.31.1


