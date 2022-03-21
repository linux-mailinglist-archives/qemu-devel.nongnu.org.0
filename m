Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11264E322F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:14:08 +0100 (CET)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPLr-0002rs-Sy
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:14:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGp-0002Ja-MO
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWPGm-0006Oi-Cq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647896931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UAlWaiiO9GDCpJFqS1hhFGf5shB3KchWo7krY0FEKA=;
 b=Zf+fzAEpR95UnwJp08XrTf5hkwXfOyclCnHh6eg2gIH0bK77hEyH1x2+ln8Ay53apGw29p
 RxHkdlDyn68KZVtXfZ5lKTaxDuuo5hyFNyqtpf2I18/bY+AXDQMNOMev4RV0tHbH9aSVPg
 kKM4NRV/OKLrOBQM1tcg/4KSuGTzv28=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-SWeNdj7BOriqWKRe0IQ7Pw-1; Mon, 21 Mar 2022 17:08:50 -0400
X-MC-Unique: SWeNdj7BOriqWKRe0IQ7Pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 281321C05AFF;
 Mon, 21 Mar 2022 21:08:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C549E1121314;
 Mon, 21 Mar 2022 21:08:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] python/aqmp: relicense as GPLv2+
Date: Mon, 21 Mar 2022 17:08:39 -0400
Message-Id: <20220321210847.914787-3-jsnow@redhat.com>
In-Reply-To: <20220321210847.914787-1-jsnow@redhat.com>
References: <20220321210847.914787-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am the sole author of all of the async QMP code (python/qemu/aqmp)
with the following exceptions:

python/qemu/aqmp/qmp_shell.py and python/qemu/aqmp/legacy.py were
written by Luiz Capitulino (et al) and are already licensed separately
as GPLv2 (only).

aqmp_tui.py was written by Niteesh Babu G S and is already licensed as GPLv2+.

I wish to relicense as GPLv2+ in order to provide as much flexibility as
I reasonably can, while retaining a strong copyleft license. It is my
belief that GPLv2+ is a suitable license for the Python ecosystem that
aligns with the goals and philosophy of the QEMU project.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 4c22c38079..2e4478ac05 100644
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
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 
 import logging
 
-- 
2.34.1


