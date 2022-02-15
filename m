Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977814B6E22
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:54:59 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyIE-0004Y7-O7
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJyA9-0006QJ-Ht
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nJyA3-0000UP-8N
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644932784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JYDj68KLrieaG2I1N1N/CU2pNk6je4/PvP7zK+5gnKc=;
 b=GajtCiBOAMtoLL4qclJ3+mKZMSyOyQChhcHJAH3CatGup+ODn8rW+gzJiYk0olj/pjr0wa
 lqVdiUgjYBSrAXaaGXtoxDTjL2oSmsdVHWs0k4X/09bCOMUWH4GCMszcEGBLbSNnSq0Cw2
 qfyL/tdv6elOLmCKjDDWTHG+f+9zmfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-Zi5zbIPmNdOtQJ_4qdikog-1; Tue, 15 Feb 2022 08:46:21 -0500
X-MC-Unique: Zi5zbIPmNdOtQJ_4qdikog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 550F1801B0C
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:46:20 +0000 (UTC)
Received: from localhost (unknown [10.39.194.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45F1270D3C;
 Tue, 15 Feb 2022 13:46:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Announce Outreachy 2022 May-August
Date: Tue, 15 Feb 2022 13:46:12 +0000
Message-Id: <20220215134612.41736-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a blog post inviting Outreachy applicants. QEMU has funding to
participate in the Outreachy internship program
(https://www.outreachy.org/) again this summer. We need to let people
know about this so we get applicants!

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 _posts/2022-02-16-outreach-2022.md | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 _posts/2022-02-16-outreach-2022.md

diff --git a/_posts/2022-02-16-outreach-2022.md b/_posts/2022-02-16-outreach-2022.md
new file mode 100644
index 0000000..a6b59e4
--- /dev/null
+++ b/_posts/2022-02-16-outreach-2022.md
@@ -0,0 +1,30 @@
+---
+layout: post
+title:  "QEMU welcomes Outreachy internship applicants"
+date:   2022-02-15 13:30:00 +0000
+categories: [internships, outreachy]
+---
+QEMU is offering open source internships in
+[Outreachy's](https://www.outreachy.org/) May-August 2022 round. You can submit
+your application until February 25th 2022 if you want to contribute to QEMU in
+a remote work internship this summer.
+
+Outreachy internships are extended to people who are subject to systemic bias
+and underrepresentation in the technical industry where they are living. For
+details on applying, please see the [Outreachy
+website](https://www.outreachy.org/apply/). If you are not eligible, don't
+worry, QEMU is also applying to participate in Google Summer of Code again and
+we hope to share news about additional internships later this year.
+
+Outreachy interns work together with their mentors, experienced QEMU
+contributors who support their interns in their projects. Code developed during
+the internship is submitted via the same open source development process that
+all QEMU code follows. This gives interns experience with contributing to open
+source software. Some interns then choose to pursue a career in open source
+software after completing their internship.
+
+Now is the chance to get involved in QEMU development!
+
+If you have questions about applying for QEMU Outreachy, please email [Stefan
+Hajnoczi](mailto:stefanha@gmail.com) or ask on the [#qemu-gsoc IRC
+channel](https://webchat.oftc.net/?channels=qemu-gsoc).
-- 
2.34.1


