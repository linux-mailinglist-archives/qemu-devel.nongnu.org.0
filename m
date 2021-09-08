Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF6F40338F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:59:02 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpfp-00076b-HV
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbf-0007Kt-N1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNpbZ-0003nW-NJ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631076876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npDFODy2eKteeb4JRNZZSD7dOo7nI5cVmBQw3BVDw6o=;
 b=CB1MAwnemOVxJsvH8/olCCbHWYELP2HTu324ZGJ4hujqxZZ/Jn6PToE88Mh7EEwY29PrJe
 i2BFD7MMagbritQ+5G7pdCXsYzLNXpdm0yuBSf5+jUVia1Nmeq3UAS1FDDjtQdlcJuD4ac
 idopv7H6Fuj7EygAjchVZc6P+aOrsxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-MuhgNHVjMX-6vy3ZkVj04g-1; Wed, 08 Sep 2021 00:54:35 -0400
X-MC-Unique: MuhgNHVjMX-6vy3ZkVj04g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 617EC180FD8F;
 Wed,  8 Sep 2021 04:54:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F0CC369A;
 Wed,  8 Sep 2021 04:54:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D1FA511385C7; Wed,  8 Sep 2021 06:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] qapi: Drop Indentation.__bool__()
Date: Wed,  8 Sep 2021 06:54:25 +0200
Message-Id: <20210908045428.2689093-3-armbru@redhat.com>
In-Reply-To: <20210908045428.2689093-1-armbru@redhat.com>
References: <20210908045428.2689093-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Intentation.__bool__() is not worth its keep: it has just one user,
which can just as well check .__str__() instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index c4d11b9637..1d62c27fb7 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -142,10 +142,6 @@ def __str__(self) -> str:
         """Return the current indentation as a string of spaces."""
         return ' ' * self._level
 
-    def __bool__(self) -> bool:
-        """True when there is a non-zero indentation."""
-        return bool(self._level)
-
     def increase(self, amount: int = 4) -> None:
         """Increase the indentation level by ``amount``, default 4."""
         self._level += amount
@@ -169,8 +165,9 @@ def cgen(code: str, **kwds: object) -> str:
     Obey `indent`, and strip `EATSPACE`.
     """
     raw = code % kwds
-    if indent:
-        raw = re.sub(r'^(?!(#|$))', str(indent), raw, flags=re.MULTILINE)
+    pfx = str(indent)
+    if pfx:
+        raw = re.sub(r'^(?!(#|$))', pfx, raw, flags=re.MULTILINE)
     return re.sub(re.escape(EATSPACE) + r' *', '', raw)
 
 
-- 
2.31.1


