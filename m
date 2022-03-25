Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB84E7A9B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:07:18 +0100 (CET)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqDN-0005gu-GJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:07:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAw-0003QB-I4
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAs-0001j0-Qd
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648238682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tv2TDvYGGsap93k3oMAYwdA2BzMXec3CIs3VJVL+Pr0=;
 b=hsGfl8JieXqWa3frChzYrrf/3zuDudiIQR4FVntZMMMyUiVi5ilkB5ANoWA3wqS1kyS6/3
 jdzQrDcY4qrXJjYKVssDykCl6h+INxywRJ33tUeAl/DlkPJOcsHCpQGM9G8ymQFQBoALPC
 +0YpJg/V141uKUzskpuYUcm8+A1EaDo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-BwPtoel4NQO3I461NIhiLg-1; Fri, 25 Mar 2022 16:04:40 -0400
X-MC-Unique: BwPtoel4NQO3I461NIhiLg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6F88185A7A4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:04:39 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA885ED81A;
 Fri, 25 Mar 2022 20:04:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] python/aqmp: add explicit GPLv2 license to legacy.py
Date: Fri, 25 Mar 2022 16:04:35 -0400
Message-Id: <20220325200438.2556381-2-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-1-jsnow@redhat.com>
References: <20220325200438.2556381-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Daniel Berrange <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The legacy.py module is heavily based on the QMP module by Luiz
Capitulino (et al) which is licensed as explicit GPLv2-only. The async
QMP package is currently licensed similarly, but I intend to relicense
the async package to the more flexible LGPLv2+.

In preparation for that change, make the license on legacy.py explicit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 46026e9fdc..f86cb29804 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -4,6 +4,17 @@
 This class pretends to be qemu.qmp.QEMUMonitorProtocol.
 """
 
+#
+# Copyright (C) 2009-2022 Red Hat Inc.
+#
+# Authors:
+#  Luiz Capitulino <lcapitulino@redhat.com>
+#  John Snow <jsnow@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
 import asyncio
 from typing import (
     Any,
-- 
2.34.1


