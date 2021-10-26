Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78F43B0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 13:13:17 +0200 (CEST)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfKOK-0005qg-UA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 07:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKLi-0003hT-9O
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfKLg-0005Zs-7N
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 07:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635246631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXsWxIM8aVu0WS55lpdZTaHOWr45uIRuZB8adCEFPwc=;
 b=BuVKz2a+MCPu2T9QYIA2+X9A5exQBskFFCPA88/WPIG60D2lovE+B6zddOHqT8g3d3EgP1
 yVZUnLVsNp/XzuP3810oNVG4w/e2G+zEWCsIdonbf8tBbzELDb3Xl6EjSOoDAv0ozbNum2
 aaMGMwul5/nwSXaszsNOlnkc+d5zr7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-C9y2E9FxOJKxnJ9mLbKfIw-1; Tue, 26 Oct 2021 07:10:28 -0400
X-MC-Unique: C9y2E9FxOJKxnJ9mLbKfIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A35CA18414B6;
 Tue, 26 Oct 2021 11:10:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D42C5DD68;
 Tue, 26 Oct 2021 11:10:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E7CE111380AA; Tue, 26 Oct 2021 13:10:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] docs/devel/qapi-code-gen: Drop a duplicate paragraph
Date: Tue, 26 Oct 2021 13:10:22 +0200
Message-Id: <20211026111023.76937-2-armbru@redhat.com>
In-Reply-To: <20211026111023.76937-1-armbru@redhat.com>
References: <20211026111023.76937-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 eblake@redhat.com, mdroth@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 55ec69f8b1 "docs/devel/qapi-code-gen.txt: Update to new rST
backend conventions" accidentally duplicated a paragraph.  Drop it.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index b2569de486..1f6805a705 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -993,12 +993,6 @@ multiline argument descriptions.
 A 'Since: x.y.z' tagged section lists the release that introduced the
 definition.
 
-The text of a section can start on a new line, in
-which case it must not be indented at all.  It can also start
-on the same line as the 'Note:', 'Returns:', etc tag.  In this
-case if it spans multiple lines then second and subsequent
-lines must be indented to match the first.
-
 An 'Example' or 'Examples' section is automatically rendered
 entirely as literal fixed-width text.  In other sections,
 the text is formatted, and rST markup can be used.
-- 
2.31.1


