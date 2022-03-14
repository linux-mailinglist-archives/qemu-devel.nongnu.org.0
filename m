Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEEB4D803D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:54:44 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTiLb-0000u8-M2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:54:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH6-0004cd-Fc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nTiH3-0004OP-J3
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647255000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BArEaYl58nIRfFrk4u1GodafaKu1a057MDoK7aemt/g=;
 b=X0H6y558R3ZoIZb3Gl6Op5TUkVxNi/Y/Qn5h3KhoewQd4OOgjimXWnarKV8AxdqzCBqhIO
 3Jr+djLXoyJMeRWfDfJ5A66oiaSvKG0r28LfEyAL+cyBsmC/Kc+secTY89W15w+ti4KqGk
 vyLOEtmSiG2MBc/wA/shERnZZsHaEYs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-IPZze3ByPI-ybuba2JeLsw-1; Mon, 14 Mar 2022 06:49:58 -0400
X-MC-Unique: IPZze3ByPI-ybuba2JeLsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9D621875067;
 Mon, 14 Mar 2022 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 343B54050C65;
 Mon, 14 Mar 2022 10:49:56 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
Date: Mon, 14 Mar 2022 11:49:42 +0100
Message-Id: <20220314104943.513593-3-kchamart@redhat.com>
In-Reply-To: <20220314104943.513593-1-kchamart@redhat.com>
References: <20220314104943.513593-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 Kashyap Chamarthy <kchamart@redhat.com>, eblake@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This document is referred to from the GettingStartedDevelopers wiki
which will be rSTified in a follow-up commit.

Converted from Mediawiki to rST using:

    $> pandoc -f Mediawiki -t rst MailingLists.wiki
        -o mailing-lists.rst

It's a 1-1 conversion (I double-checked to the best I could).  I've also
checked that the hyperlinks work correctly post-conversion.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/index.rst         |  1 +
 docs/devel/mailing-lists.rst | 53 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 docs/devel/mailing-lists.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 424eff9294..fb9d9f3a80 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -12,6 +12,7 @@ modifying QEMU's source code.
 
    code-of-conduct
    conflict-resolution
+   mailing-lists
    build-system
    style
    kconfig
diff --git a/docs/devel/mailing-lists.rst b/docs/devel/mailing-lists.rst
new file mode 100644
index 0000000000..53dcbfb007
--- /dev/null
+++ b/docs/devel/mailing-lists.rst
@@ -0,0 +1,53 @@
+.. _mailing-lists:
+
+Mailing lists
+=============
+
+-  `QEMU developers mailing
+   list <http://lists.nongnu.org/mailman/listinfo/qemu-devel>`__
+-  `QEMU stable mailing
+   list <http://lists.nongnu.org/mailman/listinfo/qemu-stable>`__
+-  `QEMU trivial patch mailing
+   list <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>`__
+-  `QEMU users mailing
+   list <http://lists.nongnu.org/mailman/listinfo/qemu-discuss>`__
+
+.. _subsystem_specific_lists:
+
+Subsystem Specific Lists
+------------------------
+
+These exist to make it a little easier to follow subsystem specific
+patches. You should however continue to CC qemu-devel so your series
+gets wide visibility.
+
+-  `QEMU ARM mailing
+   list <https://lists.nongnu.org/mailman/listinfo/qemu-arm>`__
+-  `QEMU block devices mailing
+   list <https://lists.nongnu.org/mailman/listinfo/qemu-block>`__
+-  `QEMU PowerPC mailing
+   list <https://lists.nongnu.org/mailman/listinfo/qemu-ppc>`__
+-  `QEMU RISC-V mailing
+   list <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>`__
+-  `QEMU s390x mailing
+   list <https://lists.nongnu.org/mailman/listinfo/qemu-s390x>`__
+
+If a subsystem maintainer thinks that a new mailing list for their
+subsystem would make life easier, we're happy to create one -- mail
+qemu-devel to suggest it (ideally cc'ing the people listed as Savannah
+project admins in our `AdminContacts <AdminContacts>`__ page, as they
+are the ones with the ability to make the change).
+
+If you are a Savannah project admin, you may want the `technical notes
+on how to create and configure a new
+list <Contribute/MailingLists/Creation>`__.
+
+.. _access_via_lore.kernel.org:
+
+Access via lore.kernel.org
+--------------------------
+
+The qemu-devel mailing list is also archived via
+`public-inbox <https://public-inbox.org/>`__ on
+https://lore.kernel.org/qemu-devel/ and accessible via NNTP at
+nntp.lore.kernel.org (newsgroup org.nongnu.qemu-devel).
-- 
2.33.1


