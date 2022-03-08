Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC44D1CFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:16:59 +0100 (CET)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRcWA-0004rr-22
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:16:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRcVH-0004DD-4c
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRcVD-0006fK-1q
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646756156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sR+UaKK3bq96/PgQ3DhwQ5acSJ7rTgNf0U+hv/LTI3g=;
 b=NWK6RxJQAxIjXTXR73gfge/4VW+lCjbseJKmFDkw6HYQsek1qVpMN4XbTKm5Aek/49+uoK
 7EvmlEvgwJnFRyX2VM2iGVT8rxjs8jSUFzQEeoBZc+WTpfIPDq4HOEL78fBcnUtp35wtPm
 4dRIhj7rBF5LmgBvVo7Xn3HmBMUPSoQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-ExApSORXNhCFKlMOKWJ0qA-1; Tue, 08 Mar 2022 11:15:51 -0500
X-MC-Unique: ExApSORXNhCFKlMOKWJ0qA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9B5051E0
 for <qemu-devel@nongnu.org>; Tue,  8 Mar 2022 16:15:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C05A8753A;
 Tue,  8 Mar 2022 16:15:50 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] Announce Google Summer of Code 2022
Date: Tue,  8 Mar 2022 16:15:49 +0000
Message-Id: <20220308161549.73105-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

QEMU has been accepted into Google Summer of Code 2022. Let people know
so they can apply!

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 _posts/2022-03-07-gsoc-2022.md | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 _posts/2022-03-07-gsoc-2022.md

diff --git a/_posts/2022-03-07-gsoc-2022.md b/_posts/2022-03-07-gsoc-2022.md
new file mode 100644
index 0000000..5db720a
--- /dev/null
+++ b/_posts/2022-03-07-gsoc-2022.md
@@ -0,0 +1,35 @@
+---
+layout: post
+title:  "Apply for a QEMU Google Summer of Code internship"
+date:   2022-03-07 13:30:00 +0000
+categories: [internships, gsoc]
+---
+We have great news to share: QEMU has been accepted as a [Google Summer of
+Code](https://summerofcode.withgoogle.com/) 2022 organization! Google Summer of
+Code is an open source internship program offering paid remote work
+opportunities for contributing to open source. The internship runs from June
+13th to September 12th.
+
+Now is the chance to get involved in QEMU development! The QEMU community has
+put together a list of project ideas
+[here](https://wiki.qemu.org/Google_Summer_of_Code_2022).
+
+Google has dropped the requirement that you need to be enrolled in a higher
+education course. We're excited to work with a wider range of contributors this
+year! For details on the new eligibility requirements, see
+[here](https://developers.google.com/open-source/gsoc/faq#what_are_the_eligibility_requirements_for_participation).
+
+You can [submit your
+application](https://wiki.qemu.org/Google_Summer_of_Code_2022#2._Fill_out_the_application_form)
+from April 4th to 19th.
+
+GSoC interns work together with their mentors, experienced QEMU contributors
+who support their interns in their projects. Code developed during the
+internship is submitted through the same open source development process that
+all QEMU contributions follow. This gives interns experience with contributing
+to open source software. Some interns then choose to pursue a career in open
+source software after completing their internship.
+
+If you have questions about applying for QEMU GSoC, please email [Stefan
+Hajnoczi](mailto:stefanha@gmail.com) or ask on the [#qemu-gsoc IRC
+channel](https://webchat.oftc.net/?channels=qemu-gsoc).
-- 
2.35.1


