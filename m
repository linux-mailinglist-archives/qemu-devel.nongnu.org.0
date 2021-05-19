Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8C3896F2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:45:45 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS8V-00067b-TE
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRhD-0001X5-Gc
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRhB-0005Ub-Tw
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bb7HOwstpcV+VJjAKv1JqV4YALy7uIFV9AvAvZXxkwE=;
 b=ZOkBLi0CMM17MTkoKGCUvnhCmwtumFOIBtuJO20hfQw6zFphR2YxYucWfCubsYY3ZgGkvW
 gVtKBPY/ZG8rIi5VsAu0ghRdXzfEwYDi/MGe9NXPLFWJWYY5aCNkWwxFdvzIa7cucbH8V7
 ceAb22f6CUF6h6s/D4QxijAepJDgH8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-5LdZfULRO6exT0kwlBfR4g-1; Wed, 19 May 2021 15:17:26 -0400
X-MC-Unique: 5LdZfULRO6exT0kwlBfR4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A11106BB2B;
 Wed, 19 May 2021 19:17:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6A235D9DC;
 Wed, 19 May 2021 19:17:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] qapi/parser.py: enable pylint checks
Date: Wed, 19 May 2021 15:17:18 -0400
Message-Id: <20210519191718.3950330-7-jsnow@redhat.com>
In-Reply-To: <20210519191718.3950330-1-jsnow@redhat.com>
References: <20210519191718.3950330-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index c5275d5f59b..1a633b2b88e 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -2,8 +2,7 @@
 
 # Add files or directories matching the regex patterns to the ignore list.
 # The regex matches against base names, not paths.
-ignore-patterns=parser.py,
-                schema.py,
+ignore-patterns=schema.py,
 
 
 [MESSAGES CONTROL]
-- 
2.30.2


