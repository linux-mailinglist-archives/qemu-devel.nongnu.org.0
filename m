Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5553F61C9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:37:19 +0200 (CEST)
Received: from localhost ([::1]:48658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYUI-0008Dz-CX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSt-0005tl-Lw
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIYSr-0004CV-Cz
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629819348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz36D1Kr1yct19Nmze++VflIcjIM8Jz9HkcE/Of2Q7o=;
 b=hOG5oDdl8qzZVyZnPkC5kbkPP1F8ltuwdbj/WyGu6YJscqDJQqay6ZTvOPUpAidgWM3Clq
 x/LOVKOm0fR25sDbOCsnExf8a61m12gqWZlI1bj4rXnq3o80HW6ET7YGE8ELieJ7zmkmAA
 kdP8ovZZRzC6O4+OQI79Faq7jJlSjV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-LAvK8D60OyOpXbVPAaW1cQ-1; Tue, 24 Aug 2021 11:35:47 -0400
X-MC-Unique: LAvK8D60OyOpXbVPAaW1cQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62BAA801E72;
 Tue, 24 Aug 2021 15:35:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CF9E9473;
 Tue, 24 Aug 2021 15:35:45 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: Fix use-{list,dict}-literal warnings
Date: Tue, 24 Aug 2021 17:35:40 +0200
Message-Id: <20210824153540.177128-3-hreitz@redhat.com>
In-Reply-To: <20210824153540.177128-1-hreitz@redhat.com>
References: <20210824153540.177128-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint proposes using `[]` instead of `list()` and `{}` instead of
`dict()`, because it is faster.  That seems simple enough, so heed its
advice.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c05c16494b..8b44e6c437 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -702,7 +702,7 @@ def hmp_qemu_io(self, drive: str, cmd: str,
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-            output = dict()
+            output = {}
         if isinstance(obj, list):
             for i, item in enumerate(obj):
                 self.flatten_qmp_object(item, output, basestr + str(i) + '.')
@@ -715,7 +715,7 @@ def flatten_qmp_object(self, obj, output=None, basestr=''):
 
     def qmp_to_opts(self, obj):
         obj = self.flatten_qmp_object(obj)
-        output_list = list()
+        output_list = []
         for key in obj:
             output_list += [key + '=' + obj[key]]
         return ','.join(output_list)
-- 
2.31.1


