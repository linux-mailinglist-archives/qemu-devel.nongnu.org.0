Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD56A1489
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 02:11:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVMbJ-00014f-Lh; Thu, 23 Feb 2023 20:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVMbH-00013L-00
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 20:10:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVMbE-0000sA-KG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 20:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677201011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=21vRKWVZAom6y0Yt5BDjfs2hIXwJXnh9lE+a0ZeE8GI=;
 b=MaLACzRSZgL3Dr+1dOWwRPv0FxJEkA7I5a7x4vBHLB9XoBIlAEPhzDQMZ2y11xVfzkg1aJ
 519VYh+PjhJX8Kh7MsLj4aTWQluzdd+kHM+qDn9xbccT8hGVOL9CiBHmHQf2Fvw3rOFFkC
 e/5ige+I9lV7teoC202N162t9wptriI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-CJK3o6CSMVaNpGcB399hyg-1; Thu, 23 Feb 2023 20:10:09 -0500
X-MC-Unique: CJK3o6CSMVaNpGcB399hyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A3322806049
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:10:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B454C1121314;
 Fri, 24 Feb 2023 01:10:08 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [qemu-web PATCH] Announce Google Summer of Code and Outreachy 2023
Date: Thu, 23 Feb 2023 20:10:06 -0500
Message-Id: <20230224011006.1574493-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

QEMU is participating in GSoC and Outreachy again. This blog post will
draw people's attention to our open source internships and increase the
number of applicants.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 _posts/2023-02-23-gsoc-outreachy-2023.md | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 _posts/2023-02-23-gsoc-outreachy-2023.md

diff --git a/_posts/2023-02-23-gsoc-outreachy-2023.md b/_posts/2023-02-23-gsoc-outreachy-2023.md
new file mode 100644
index 0000000..e25d756
--- /dev/null
+++ b/_posts/2023-02-23-gsoc-outreachy-2023.md
@@ -0,0 +1,46 @@
+---
+layout: post
+title:  "Announcing QEMU Google Summer of Code and Outreachy 2023 internships"
+date:   2023-02-23 13:30:00 +0000
+categories: [internships, gsoc, outreachy]
+---
+QEMU is participating in [Google Summer of
+Code](https://summerofcode.withgoogle.com/) and
+[Outreachy](https://www.outreachy.org/) again this year! Google Summer of Code
+and Outreachy are open source internship programs that offer paid remote work
+opportunities for contributing to open source. Internships generally run May
+through August, so if you have time and want to experience open source
+development, read on to find out how you can apply.
+
+Each intern is paired with one or more mentors, experienced QEMU contributors
+who support them during the internship. Code developed by the intern is
+submitted through the same open source development process that all QEMU
+contributions follow. This gives interns experience with contributing to open
+source software. Some interns then choose to pursue a career in open source
+software after completing their internship.
+
+## Find out if you are eligible
+Information on who can apply is
+[here](https://developers.google.com/open-source/gsoc/faq#what_are_the_eligibility_requirements_for_participation)
+for Google Summer of Code and [here](https://www.outreachy.org/apply/) for
+Outreachy. Note that Outreachy initial applications ended on February 6th so
+only those who have been accepted into Outreachy can apply for QEMU Outreachy
+internships.
+
+## Select a project idea
+Look through the the [list of QEMU project
+ideas](https://wiki.qemu.org/Google_Summer_of_Code_2023) and see if there is
+something you are interested in working on. Once you have found a project idea
+you want to apply for, email the mentor for that project idea to ask any
+questions you may have and discuss the idea further.
+
+## Submit your application
+You can [apply for Google Summer of Code](https://summerofcode.withgoogle.com/)
+from March 20th to April 4th and [apply for
+Outreachy](https://www.outreachy.org/apply/) from March 6th to April 3rd.
+
+Good luck with your applications!
+
+If you have questions about applying for QEMU GSoC or Outreachy, please email
+[Stefan Hajnoczi](mailto:stefanha@gmail.com) or ask on the [#qemu-gsoc IRC
+channel](https://webchat.oftc.net/?channels=qemu-gsoc).
-- 
2.39.1


