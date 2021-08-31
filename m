Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792C3FC7E4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:09:49 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3WO-00085b-CU
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL322-0006Gr-B7
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL31y-0005IT-6s
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVdFY72iIBkVxdZ7AtGMjN5xqVD2yFwsnpGAo8vVbzU=;
 b=M0YSnSXSSCPOJu1zJEEvONtjdVzMZ7lir2Fl8+ir5QZlkT4TTyryTxQvY6KglBqH8JPNzU
 t5KAtWcIcKb1zfdvbwt74+nx18DBE+rxY5u0FYTJoOGq1bE6R4XXrPaZvjEmsBpUlbGvOS
 eQR1tFtFKTQ7ivDe6G5gr7Ehy1AHb5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-yYAFj-2lNG6FHFcwQTEoww-1; Tue, 31 Aug 2021 08:38:17 -0400
X-MC-Unique: yYAFj-2lNG6FHFcwQTEoww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85FED101C8A5;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B6C18026;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7117411380BC; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] qapi: Use "not COND" instead of "!COND" for generated
 documentation
Date: Tue, 31 Aug 2021 14:38:05 +0200
Message-Id: <20210831123809.1107782-9-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generated documentation uses operators "and", "or", and "!".  Change
the latter to "not".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py         | 2 +-
 tests/qapi-schema/doc-good.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index c7ccc7cec7..5f8f76e5b2 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -233,7 +233,7 @@ def cgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
 
 def docgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:
     # TODO Doc generated for conditions needs polish
-    return gen_ifcond(ifcond, '%s', '!%s', ' and ', ' or ')
+    return gen_ifcond(ifcond, '%s', 'not %s', ' and ', ' or ')
 
 
 def gen_if(cond: str) -> str:
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 75f51a6fc1..0c59d75964 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -174,7 +174,7 @@ Features
 If
 ~~
 
-"!(IFONE or IFTWO)"
+"not (IFONE or IFTWO)"
 
 
 Another subsection
-- 
2.31.1


