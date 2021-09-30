Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FA341E317
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:13:47 +0200 (CEST)
Received: from localhost ([::1]:47404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3NC-0003qm-EI
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37b-0007Gd-63
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37Z-0000D1-LU
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Jmi6+RCv7x9NBewHsdzUAL+Tv6vOijY++oX/h3SQ4Y=;
 b=d08YWU7eXSC1Uci8lIA5eyufpJjT5YQaiEM0s8TaYPixCcBbr2kgJUV0AeZJqTNnAflXWi
 obc0FyfrgL+gsiZP7d9q9DTCwqGJXwSdiYs6h5XN8VTjFfyx0lfI71xL6mxz5zzqi+1Fl5
 PruKyRU3YYfJeLbWKb6x9KVA56M9fbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-syZhYKk-Ml61bYeya4XL0Q-1; Thu, 30 Sep 2021 16:57:35 -0400
X-MC-Unique: syZhYKk-Ml61bYeya4XL0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1FA118D6A30;
 Thu, 30 Sep 2021 20:57:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D11E45BAEB;
 Thu, 30 Sep 2021 20:57:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] qapi/parser: Silence too-few-public-methods warning
Date: Thu, 30 Sep 2021 16:57:15 -0400
Message-Id: <20210930205716.1148693-13-jsnow@redhat.com>
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

Eh. Not worth the fuss today. There are bigger fish to fry.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 0265b47b955..1b006cdc133 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -461,8 +461,10 @@ class QAPIDoc:
     """
 
     class Section:
+        # pylint: disable=too-few-public-methods
         def __init__(self, parser: QAPISchemaParser,
                      name: Optional[str] = None, indent: int = 0):
+
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -498,6 +500,7 @@ class NullSection(Section):
         """
         Immutable dummy section for use at the end of a doc block.
         """
+        # pylint: disable=too-few-public-methods
         def append(self, line: str) -> None:
             assert False, "Text appended after end_comment() called."
 
-- 
2.31.1


