Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640E408893
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:53:21 +0200 (CEST)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPieO-00030m-Fv
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibz-00007Q-QM
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPibu-00073x-Vx
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:50:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631526646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/c/w4JMkB/UC3DnUfd6qzSk51gfpWLnv30yTdmTG3U=;
 b=iRiu1ifTdhWWynSsr2RplpQvN9BvF0dZwGBl9+At1UDDBjJEMHvjudWsqc11CuNEI79JJL
 RwFyFp7dubvFKzRc1R8Ou7AnKqtKem0p6oF+tNZ2/RBS/hwiyxgS8NbdhcT7vDeh+77tNr
 dIBA2vhXVJKCc3YUFnuAhiORnXmsCTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-AQDaUHSmOOOyyOEEsJ0QGw-1; Mon, 13 Sep 2021 05:50:44 -0400
X-MC-Unique: AQDaUHSmOOOyyOEEsJ0QGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AEBA1923767;
 Mon, 13 Sep 2021 09:50:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D626F10013C1;
 Mon, 13 Sep 2021 09:50:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6EE6911385C1; Mon, 13 Sep 2021 11:50:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] qapi: Drop Indentation.__bool__()
Date: Mon, 13 Sep 2021 11:50:35 +0200
Message-Id: <20210913095038.3040776-3-armbru@redhat.com>
In-Reply-To: <20210913095038.3040776-1-armbru@redhat.com>
References: <20210913095038.3040776-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intentation.__bool__() is not worth its keep: it has just one user,
which can just as well check .__str__() instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210908045428.2689093-3-armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


