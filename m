Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A54C5058
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:08:55 +0100 (CET)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhpe-0003Jh-FF
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhy-0003Dn-Kc
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhx-0005Bc-1v
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUHyLcEL8PTiTf0/NdX9eymLiCzi7YGdO0ul3Aso6z0=;
 b=hZb++qSZ/7lbtCPGyRcdto/9rZUD+a7GtMkpvRTGwbvbnhIR3vssfVTSWH5C9DdLe2LY33
 uQsf9bcXC/ibOoW1l9diI2aXUbLCfn6afCOlxOKxseOwjfFp2x6rud9X1YYoPJ9JFBjHMR
 mrMLgOErWae9aPyvfU/18dJygcyO7nE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-SY8RoGpRMu6Ltm4Je3CQDw-1; Fri, 25 Feb 2022 16:00:53 -0500
X-MC-Unique: SY8RoGpRMu6Ltm4Je3CQDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06FCF180FD73;
 Fri, 25 Feb 2022 21:00:52 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 235F11081302;
 Fri, 25 Feb 2022 21:00:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] python/aqmp: squelch pylint warning for too many lines
Date: Fri, 25 Feb 2022 15:59:43 -0500
Message-Id: <20220225205948.3693480-6-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I would really like to keep this under 1000 lines, I promise. Doesn't
look like it's gonna happen.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 56f05b9030..631bcdaa55 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -10,6 +10,9 @@
 class.
 """
 
+# It's all the docstrings ... ! It's long for a good reason ^_^;
+# pylint: disable=too-many-lines
+
 import asyncio
 from asyncio import StreamReader, StreamWriter
 from enum import Enum
-- 
2.34.1


