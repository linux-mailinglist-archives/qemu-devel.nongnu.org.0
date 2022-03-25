Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C944E7A9C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:07:18 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqDN-0005ii-Tw
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:07:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAy-0003Qq-1V
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAv-0001j7-1W
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648238684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tuq6Y1tbpQx/E1lepGGYj7CjHaqCD+5we/R1Uwt8rHM=;
 b=ZpBDN1TW6nhML34QYZ3LKHvr+7vWO4peBmiabD8YM45d7c7Z8P/2eDeR2rKkGHHzXuMSt+
 tATq16HnakyvJlKCshyStR3KWKq6lnizODIlCCzOGOEi7ruk1QiHY3koiIKrEwY/6HYYRp
 FWqAlSMgUnXWNi2w0J7+kA0pFdRpHDc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-LxomyRBIOH6DEfM18MX65w-1; Fri, 25 Mar 2022 16:04:41 -0400
X-MC-Unique: LxomyRBIOH6DEfM18MX65w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF80485A5BC;
 Fri, 25 Mar 2022 20:04:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 129CE63BB20;
 Fri, 25 Mar 2022 20:04:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] python/qmp-shell: relicense as LGPLv2+
Date: Fri, 25 Mar 2022 16:04:37 -0400
Message-Id: <20220325200438.2556381-4-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-1-jsnow@redhat.com>
References: <20220325200438.2556381-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <mlureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@habkost.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp-shell is presently licensed as GPLv2 (only). I intend to include
this tool as an add-on to an LGPLv2+ library package hosted on
PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
licenses while retaining a copyleft license.

To keep licensing matters simple, I'd like to relicense this tool as
LGPLv2+ as well in order to keep the resultant license of the hosted
release files simple -- even if library users won't "link against" this
command line tool.

Therefore, I am asking permission from the current authors of this
tool to loosen the license. At present, those people are:

- John Snow (me!), 411/609
- Luiz Capitulino, Author, 97/609
- Daniel Berrangé, 81/609
- Eduardo Habkost, 10/609
- Marc-André Lureau, 6/609
- Fam Zheng, 3/609
- Cleber Rosa, 1/609

(All of which appear to have been written under redhat.com addresses.)

Eduardo's fixes are largely automated from 2to3 conversion tools and may
not necessarily constitute authorship, but his signature would put to
rest any questions.

Cleber's changes concern a single import statement change. Also won't
hurt to ask.

CC: Luiz Capitulino <lcapitulino@redhat.com>
CC: Daniel Berrange <berrange@redhat.com>
CC: Eduardo Habkost <ehabkost@habkost.com>
CC: Marc-André Lureau <mlureau@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Cleber Rosa <crosa@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_shell.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index 35691494d0..c23f1b1928 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -1,11 +1,12 @@
 #
-# Copyright (C) 2009, 2010 Red Hat Inc.
+# Copyright (C) 2009-2022 Red Hat Inc.
 #
 # Authors:
 #  Luiz Capitulino <lcapitulino@redhat.com>
+#  John Snow <jsnow@redhat.com>
 #
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU LGPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 #
 
 """
-- 
2.34.1


