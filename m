Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7AE4D9F6A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 16:56:05 +0100 (CET)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU9Wm-0003ez-8f
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 11:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU9VS-0002zr-T8
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nU9VP-0004yS-PF
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 11:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647359678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=08aGo7GPTXCXNEuIvV8wDRIQoK0tQu1Fhsvn08x9ltM=;
 b=ErikgOqHfzLIw057lN9MoyoK7/fGXhJfb1A8vBECBggVNKmdipqRvyQOEdawGWeqq4CYOh
 DCXVmCk5ypYEZCAx4Jd7egJfJZ9ufa7pWdh8H4xt+DXYB8xcyp9eivFiHxTTCHQhFZ9lZR
 nCtYwQYY/86YU5O7AO6VdjwzoeO6hDU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-R9q5Lz8BNZ--yDZ1sCtQ_A-1; Tue, 15 Mar 2022 11:54:36 -0400
X-MC-Unique: R9q5Lz8BNZ--yDZ1sCtQ_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE7B29AA2F7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 15:54:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C738D4B8D49;
 Tue, 15 Mar 2022 15:54:34 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: Fix broken internal link to mailing lists
Date: Tue, 15 Mar 2022 16:54:26 +0100
Message-Id: <20220315155426.659426-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed this during the initial conversion.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
This patch should be merged on top of this[1].  Otherwise Sphinx will
complain (correctly so).

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03488.html
    -- docs: rSTify MailingLists wiki; move it to QEMU Git

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/submitting-a-patch.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index e51259eb9c..3632b74585 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -18,13 +18,13 @@ one-shot fix, the bare minimum we ask is that:
    <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
    policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
 -  All contributions to QEMU must be **sent as patches** to the
-   qemu-devel `mailing list <MailingLists>`__. Patch contributions
-   should not be posted on the bug tracker, posted on forums, or
-   externally hosted and linked to. (We have other mailing lists too,
-   but all patches must go to qemu-devel, possibly with a Cc: to another
-   list.) ``git send-email`` (`step-by-step setup
-   guide <https://git-send-email.io/>`__ and `hints and
-   tips <https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
+   qemu-devel mailing list (refer to :ref:`mailing-lists`). Patch
+   contributions should not be posted on the bug tracker, posted on
+   forums, or externally hosted and linked to. (We have other mailing
+   lists too, but all patches must go to qemu-devel, possibly with a Cc:
+   to another list.) ``git send-email`` (`step-by-step setup guide
+   <https://git-send-email.io/>`__ and `hints and tips
+   <https://elixir.bootlin.com/linux/latest/source/Documentation/process/email-clients.rst>`__)
    works best for delivering the patch without mangling it, but
    attachments can be used as a last resort on a first-time submission.
 -  You must read replies to your message, and be willing to act on them.
-- 
2.33.1


