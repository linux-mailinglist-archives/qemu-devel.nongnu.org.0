Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF2D4BBB85
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 15:58:44 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4iY-0006px-O8
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 09:58:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4fy-0004my-1Y
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4ft-00082B-6m
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 09:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645196155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVAr/S2vowz8GZOmZbaCIzVFWqc0mbHt6mk9TWa5Q0k=;
 b=A3c4tCput8PuKQ6pGKYKEj8CH+dRrZ56OSuSP9rZysHQmlwjCG0mWa4PH3soQ2KkgzUVyq
 KxE5QbF/kFunPzJm/Ftarxpmg7Snm8J0c/xD9lFuJUmkoTrIDIq2VKlN2BJ965bisX+Z24
 njfD2PxXMTuMlo5KqD9BR994pEwYxM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-YP2g5qN1P6O_ES7K-Qo-0w-1; Fri, 18 Feb 2022 09:55:54 -0500
X-MC-Unique: YP2g5qN1P6O_ES7K-Qo-0w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58312814246;
 Fri, 18 Feb 2022 14:55:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF5753494B;
 Fri, 18 Feb 2022 14:55:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F5F121608C3; Fri, 18 Feb 2022 15:55:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qapi: Fix stale reference to scripts/qapi.py in a comment
Date: Fri, 18 Feb 2022 15:55:51 +0100
Message-Id: <20220218145551.892787-3-armbru@redhat.com>
In-Reply-To: <20220218145551.892787-1-armbru@redhat.com>
References: <20220218145551.892787-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: michael.roth@amd.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qapi-util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index fda7044539..63596e11c5 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -113,7 +113,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj, Error **err
  * may contain only letters, digits, hyphen and period.
  * The special exception for enumeration names is not implemented.
  * See docs/devel/qapi-code-gen.txt for more on QAPI naming rules.
- * Keep this consistent with scripts/qapi.py!
+ * Keep this consistent with scripts/qapi-gen.py!
  * If @complete, the parse fails unless it consumes @str completely.
  * Return its length on success, -1 on failure.
  */
-- 
2.35.1


