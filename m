Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484163FFBB3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:19:16 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Pr-0002ev-CL
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L8-0002lH-Sm
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L5-0005T4-3Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630656858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqRowOAlLvcI9I3S78s8bub4g44j538LaJI8aA7Lxng=;
 b=aAY4izr06u73/6AmFmnTxV+leF6Z2MEERGsN1g53OiEp8IZ0K1yD/QJQfnecbuY5gT1STE
 pa6qzXryoFpt9/IA7eIX+1kUigOdqc873x1nOGUJ1sebEq7wyOIJPXqauiB1isv7WpY3nn
 Yc5RGm5XWkPEZjLnhEQZxJlCA5Ot8xk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-vHXVdZ8bO0-qT04SxZJbGQ-1; Fri, 03 Sep 2021 04:14:17 -0400
X-MC-Unique: vHXVdZ8bO0-qT04SxZJbGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD651835DE1
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 08:14:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DDBD5C232;
 Fri,  3 Sep 2021 08:14:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 5/5] meson_options.txt: Document that "configure" reads
 this file, too
Date: Fri,  3 Sep 2021 10:13:58 +0200
Message-Id: <20210903081358.956267-6-thuth@redhat.com>
In-Reply-To: <20210903081358.956267-1-thuth@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a comment that meson_options.txt is also parsed by the configure
script and that the options need a certain layout for this to succeed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson_options.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson_options.txt b/meson_options.txt
index 2c89e79e8b..86b3c03c7d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -1,3 +1,9 @@
+# Note: This file is also parsed by "configure" to automatically handle the
+# 'feature' options for its --enable-* and --disable-* parameters. To be able
+# to use this automation, make sure that the corresponding options() have their
+# "type: 'feature'" in the very first line, and their "description:" in their
+# second line.
+
 option('qemu_suffix', type : 'string', value: 'qemu',
        description: 'Suffix for QEMU data/modules/config directories (can be empty)')
 option('docdir', type : 'string', value : 'doc',
-- 
2.27.0


