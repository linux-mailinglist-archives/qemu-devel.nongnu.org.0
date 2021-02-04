Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161BF30F47A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:03:39 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fEP-0005Qt-Qa
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCc-0003dS-Dp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7fCa-00006z-1T
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612447303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYkx+KWuTRBrdNwxsyutSYflX87Swhop9kFSdxEK3WY=;
 b=JEkf/YbJexjpQL7e240ghY+Udy8j314vtHqPdDv0aK4F5JoHEp45WZ6D8iBFfBBBPEIqju
 6alsbJzL3CfbHz3uQDDdmWRwTHCk98oYiDk5vj1c+UXaR2O+OFo+ebpcokBnYnLzKVNA/p
 dbmckZUWVkkLod+jf0EWMko5n19I6d4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-9MY6X7ucPme3Bp8U0IV3Ww-1; Thu, 04 Feb 2021 09:01:40 -0500
X-MC-Unique: 9MY6X7ucPme3Bp8U0IV3Ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCB49107ACE3;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D75E6F992;
 Thu,  4 Feb 2021 14:01:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 78B971132E9A; Thu,  4 Feb 2021 15:01:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] qobject: braces {} are necessary for all arms of this
 statement
Date: Thu,  4 Feb 2021 15:01:32 +0100
Message-Id: <20210204140136.2769065-6-armbru@redhat.com>
In-Reply-To: <20210204140136.2769065-1-armbru@redhat.com>
References: <20210204140136.2769065-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Zhang Han <zhanghan64@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Han <zhanghan64@huawei.com>

Add braces {} for arms of if/for statement

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
Message-Id: <20201228071129.24563-5-zhanghan64@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qobject/qdict.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qobject/qdict.c b/qobject/qdict.c
index 6c15ed14c1..0216ca7ac1 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -43,8 +43,9 @@ static unsigned int tdb_hash(const char *name)
     unsigned   i;      /* Used to cycle through random values. */
 
     /* Set the initial value from the key size. */
-    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
+    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++) {
         value = (value + (((const unsigned char *)name)[i] << (i * 5 % 24)));
+    }
 
     return (1103515243 * value + 12345);
 }
@@ -93,8 +94,9 @@ static QDictEntry *qdict_find(const QDict *qdict,
     QDictEntry *entry;
 
     QLIST_FOREACH(entry, &qdict->table[bucket], next)
-        if (!strcmp(entry->key, key))
+        if (!strcmp(entry->key, key)) {
             return entry;
+        }
 
     return NULL;
 }
-- 
2.26.2


