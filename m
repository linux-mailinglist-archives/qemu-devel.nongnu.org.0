Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C05453E5C2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFtm-0000NC-Lo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpW-0004LV-Rg
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpT-0005Rf-WD
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654533827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKoespFjBPtSoEZLQVmYXxHPxvSSfSkPGkzQafBAhL0=;
 b=eyg3buGexLJkksHYrQBz9N6HiKphB1902/tf7AzeN/QSGZUYMFcG1oLd6xB44srVwxSha3
 l+0V02nil70x1c8VM7lay4O3tn4z/ggmrejiupiHZSTiRm/OBehp6n7KSKfM3Ez0xaBNyS
 7IlkG/LJ0JKX+ojXF/XbmaDsgi+rLBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-GkOgHUJpO3mdmBxXiyiEFg-1; Mon, 06 Jun 2022 12:43:44 -0400
X-MC-Unique: GkOgHUJpO3mdmBxXiyiEFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3B3885A5B9;
 Mon,  6 Jun 2022 16:43:43 +0000 (UTC)
Received: from pinwheel.redhat.com (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91BF9C27E8F;
 Mon,  6 Jun 2022 16:43:42 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org,
 eblake@redhat.com, Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v3 2/4] docs: rSTify MailingLists wiki; move it to QEMU Git
Date: Mon,  6 Jun 2022 18:43:34 +0200
Message-Id: <20220606164336.245740-3-kchamart@redhat.com>
In-Reply-To: <20220606164336.245740-1-kchamart@redhat.com>
References: <20220606164336.245740-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This document is referred to from the GettingStartedDevelopers wiki
which will be rSTified in a follow-up commit.

Converted from Mediawiki to rST using:

    $> pandoc -f Mediawiki -t rst MailingLists.wiki
        -o mailing-lists.rst

The only change in this coversion is that I have removed the users
mailing list, as it will be referred to from a different document from
the docs/about/ directory.

Besides that, this is almost a 1-1 conversion (I double-checked to the
best I could).  I've also checked that the hyperlinks work correctly
post-conversion.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/index.rst         |  1 +
 docs/devel/mailing-lists.rst | 51 ++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
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
index 0000000000..4533179f1f
--- /dev/null
+++ b/docs/devel/mailing-lists.rst
@@ -0,0 +1,51 @@
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
2.36.1


