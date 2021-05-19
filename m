Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3B3896F5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:47:11 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljS9u-0000gq-4X
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRhB-0001Of-Cr
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljRh8-0005S7-Kr
 for qemu-devel@nongnu.org; Wed, 19 May 2021 15:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621451846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i+hmM0yc57nREUGRC6gdQr0AqqnEdtHZHWqTtPjb8I=;
 b=bHn/6uOvE35MA9C8ZkmjjcwulhMB56BNbxyFZB8e206nfgsMG5N5gVmWFAhDJp3fAiGJUK
 hkwAbptVKy238JdQRBP/241QAEioxV8SQFRhXUsex4EPYEQK+PIFcftXbtKz/THDm/IqIe
 JZriNSOb6DAiiH1gsYLlHxU5VAXTlFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-5MLLTTBsPb-Pyx475zwCYg-1; Wed, 19 May 2021 15:17:21 -0400
X-MC-Unique: 5MLLTTBsPb-Pyx475zwCYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18B7C801106;
 Wed, 19 May 2021 19:17:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BA845D9CC;
 Wed, 19 May 2021 19:17:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] qapi/parser.py: remove unused check_args_section arguments
Date: Wed, 19 May 2021 15:17:13 -0400
Message-Id: <20210519191718.3950330-2-jsnow@redhat.com>
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

(Addresses a pylint warning.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 06167ed3e0a..b3a468504fc 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -753,7 +753,7 @@ def check_expr(self, expr):
 
     def check(self):
 
-        def check_args_section(args, info, what):
+        def check_args_section(args):
             bogus = [name for name, section in args.items()
                      if not section.member]
             if bogus:
@@ -764,5 +764,5 @@ def check_args_section(args, info, what):
                        "', '".join(bogus),
                        "do" if len(bogus) > 1 else "does"))
 
-        check_args_section(self.args, self.info, 'members')
-        check_args_section(self.features, self.info, 'features')
+        check_args_section(self.args)
+        check_args_section(self.features)
-- 
2.30.2


