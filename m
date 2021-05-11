Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82B37B190
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:22:33 +0200 (CEST)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgals-0005oi-38
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWL-0008LK-SH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWK-0006aA-4I
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tneFAuEEdfRYrPTC2/pL/p2ptFZFTWRvmzSGabmBn7A=;
 b=atSpsBIAvysKnDWlQM4//h/BECnAibvCLIz054ikbDNWuafmu3deVD0g5pur04L/4serfq
 Y8x6a7qztZ3wwIg34oIBKnyGWDfnWLTtzWnM/X9f7yi4tUVWpARWYG9iCReVdUkVD7qrmX
 JMvDYg0/HGXT15b/Jqqt3i/ejFMK3zE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-JKeWmSpONAaxc7V5k_QWpQ-1; Tue, 11 May 2021 18:06:25 -0400
X-MC-Unique: JKeWmSpONAaxc7V5k_QWpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F06101371B;
 Tue, 11 May 2021 22:06:24 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4228ABA6F;
 Tue, 11 May 2021 22:06:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/21] qapi: [WIP] Import QAPIDoc from qapidoc
 Signed-off-by: John Snow <jsnow@redhat.com>
Date: Tue, 11 May 2021 18:05:59 -0400
Message-Id: <20210511220601.2110055-20-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 2 +-
 scripts/qapi/parser.py | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333e..7616646e43d 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import QAPIDoc
+from .qapidoc import QAPIDoc
 from .source import QAPISourceInfo
 
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 54df1bfd499..940a427b1ae 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -26,6 +26,7 @@
 
 from .common import must_match
 from .error import QAPISemError, QAPISourceError
+from .qapidoc import QAPIDoc
 from .source import QAPISourceInfo
 
 
-- 
2.30.2


