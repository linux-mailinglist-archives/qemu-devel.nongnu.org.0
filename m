Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF2A50A3F5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:23:53 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYeu-0006BI-NS
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXX-0003Ry-9t
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXR-0005nG-5T
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CPS739JKvKXJsU9GXwhxwx+eiw+cl2oRRPtKLAGc8KI=;
 b=Encn3sATJQJBIHobxlBuQNQOpY6PkcKHRUXmpwpbdGF+MRrA/EeVmpr3Sw6eZ2F3L3S1vg
 I4qslWE8nGKM7P8eo2+r5WBjH1rHGLzQpOH6tGCTzfOuAuujlL8ZzIjQ5MHAgQe+P7R0em
 HunJwdz2t5Fl5KeurdB5y+6sCX9A+xE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-LwfaeX1qPc6YHnRxyFuSCg-1; Thu, 21 Apr 2022 11:16:05 -0400
X-MC-Unique: LwfaeX1qPc6YHnRxyFuSCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C367F2808560;
 Thu, 21 Apr 2022 15:16:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A03440D016A;
 Thu, 21 Apr 2022 15:16:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] python/aqmp: relicense as LGPLv2+
Date: Thu, 21 Apr 2022 11:15:49 -0400
Message-Id: <20220421151600.984189-7-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am the sole author of all of the async QMP code (python/qemu/aqmp)
with the following exceptions:

python/qemu/aqmp/qmp_shell.py and python/qemu/aqmp/legacy.py were
written by Luiz Capitulino (et al) and are already licensed separately
as GPLv2 (only).

aqmp_tui.py was written by Niteesh Babu G S and is licensed as GPLv2+.

I wish to relicense as LGPLv2+ in order to provide as much flexibility
as I reasonably can, while retaining a copyleft license. It is my belief
that LGPLv2+ is a suitable license for the Python ecosystem that aligns
with the goals and philosophy of the QEMU project.

The intent is to eventually drop legacy.py, leaving only library code
that is LGPLv2+.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20220325200438.2556381-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 4c22c380790..2b69b264f4f 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -11,15 +11,15 @@
 managing QMP events.
 """
 
-# Copyright (C) 2020, 2021 John Snow for Red Hat, Inc.
+# Copyright (C) 2020-2022 John Snow for Red Hat, Inc.
 #
 # Authors:
 #  John Snow <jsnow@redhat.com>
 #
 # Based on earlier work by Luiz Capitulino <lcapitulino@redhat.com>.
 #
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU LGPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 
 import logging
 
-- 
2.34.1


