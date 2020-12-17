Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42E32DCAD5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:09:37 +0100 (CET)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpijY-0003eB-Np
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia0-0002DD-TX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiZv-0007Ac-HG
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sm6q2MBGr7KgFIW1CPrq3LBncDHdcO3QbH/R75aARKU=;
 b=NWl8Th/VtAYl+G/Rv1n7fk8BiL+SH+IkIxuiiDa/dlsYCbe4J1cQSjLZwpHhFWbv/Kq3fa
 o9t8vomy5jW9LAUruA0g5WnuL8/Wk+LlVjYizCJnsA9X+soZYwyHpXUf1p/tUb7fx2+bSm
 0g23oPzq+m7UcplutknMUve9MxgZ4HM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-1f9GnetKNjeD2v-seQSPVQ-1; Wed, 16 Dec 2020 20:59:37 -0500
X-MC-Unique: 1f9GnetKNjeD2v-seQSPVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471BA107ACE6;
 Thu, 17 Dec 2020 01:59:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5272F1E5;
 Thu, 17 Dec 2020 01:59:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] qapi/gen: assert that _start_if is not None in
 _wrap_ifcond
Date: Wed, 16 Dec 2020 20:59:19 -0500
Message-Id: <20201217015927.197287-5-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already assert this in end_if, but that's opaque to mypy. Do it in
_wrap_ifcond instead. Same effect at runtime, but mypy can now infer
the type in _wrap_ifcond's body.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b40f18eee3c..a6dc991b1d0 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -130,11 +130,11 @@ def start_if(self, ifcond: List[str]) -> None:
         self._start_if = (ifcond, self._body, self._preamble)
 
     def end_if(self) -> None:
-        assert self._start_if
         self._wrap_ifcond()
         self._start_if = None
 
     def _wrap_ifcond(self) -> None:
+        assert self._start_if
         self._body = _wrap_ifcond(self._start_if[0],
                                   self._start_if[1], self._body)
         self._preamble = _wrap_ifcond(self._start_if[0],
-- 
2.26.2


