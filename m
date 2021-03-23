Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0A2346BB6
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:07:28 +0100 (CET)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpBP-0006mo-C7
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1V-00072F-L9
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1P-0002mZ-6q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSMV/cddIecCl9oEn/r4ZjtLweD2WXgYLMKe655pV0U=;
 b=B5JQpJDAKCvdwFDdKk4ZxT7xrQBbRlIlIgW/8nR4q1rAV0Jz59CtY8gJDpLT/x9p8koqht
 rA51w8xDQthtKBHBlUhMx/z+pZdYsvLkbswP98/X3acWA6Vt3tLSBsbfjWnxvBNgKmSOEj
 sIeT24EanXc+D1AcycceZIhc+rFxDnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-oGgzIcZ0Pq-7IcgaN86VfA-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: oGgzIcZ0Pq-7IcgaN86VfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E50D80006E;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 301D75C1C5;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D4F1411326A9; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/29] tests-qmp-cmds: Drop unused and incorrect qmp_TestIfCmd()
Date: Tue, 23 Mar 2021 22:56:50 +0100
Message-Id: <20210323215658.3840228-22-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 967c885108 "qapi: add 'if' to top-level expressions" added
command TestIfCmd with an 'if' condition.  It also added the
qmp_TestIfCmd() to go with it, guarded by the corresponding #if.
Commit ccadd6bcba "qapi: Add 'if' to implicit struct members" changed
the command, but not the function.  Compiles only because we don't
satisfy the #if.  Instead of fixing the function, simply drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-22-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-qmp-cmds.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 266db074b4..99973dde7c 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -13,13 +13,6 @@
 
 static QmpCommandList qmp_commands;
 
-#if defined(TEST_IF_STRUCT) && defined(TEST_IF_CMD)
-UserDefThree *qmp_TestIfCmd(TestIfStruct *foo, Error **errp)
-{
-    return NULL;
-}
-#endif
-
 UserDefThree *qmp_TestCmdReturnDefThree(Error **errp)
 {
     return NULL;
-- 
2.26.3


