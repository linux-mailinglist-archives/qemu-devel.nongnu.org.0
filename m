Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF05741E31C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:14:52 +0200 (CEST)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3OF-0005Ih-OW
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37c-0007L9-L3
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37b-0000E3-0Z
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UDYbapQxshJAqowJIOeSLVyA+LsWk2oGYns7Zw7QZJM=;
 b=im+Xb+B36r8hZ9Q7L0NTkJ30xC7FImdZ/dJpk1jKX3ljpsdAXv+RGIl1tLb29W2NAf+XZ7
 aT1v2L7+RlNOwYaZeVfS8GlxcK6ewT0BlIsCNqP5mtdyPjymcFbpB5s5ipPhqZVS0UzlGn
 B2EBEefC8Tlk39nRAzl6LgM8VkvL5xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-6A2GXiXtPqiWmFFSupVxrA-1; Thu, 30 Sep 2021 16:57:37 -0400
X-MC-Unique: 6A2GXiXtPqiWmFFSupVxrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F05C8015C7;
 Thu, 30 Sep 2021 20:57:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CFCF5BAE1;
 Thu, 30 Sep 2021 20:57:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/13] qapi/parser: enable pylint checks
Date: Thu, 30 Sep 2021 16:57:16 -0400
Message-Id: <20210930205716.1148693-14-jsnow@redhat.com>
In-Reply-To: <20210930205716.1148693-1-jsnow@redhat.com>
References: <20210930205716.1148693-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>

---

This can be merged with the previous commit, if desired.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 5b7dbc58ad8..b259531a726 100644
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
2.31.1


