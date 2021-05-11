Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95437B181
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:16:01 +0200 (CEST)
Received: from localhost ([::1]:42328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgafY-0002bX-4P
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWA-0007bN-Qy
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW7-0006Rj-4o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JIoWxNMsAa0ulLHBM/p3bpvL1JlQ8H8BCE1dJY31+o=;
 b=Xeub8yi78ygHpIwO9/rjTphaUD7Lqhum9qMv73da8ffmTHli2Tm0l1R012B9BOvo9bl7ws
 euQG199GO2hW4OUaVTS2VSUaiwRvfMVOas47ttEl7dY5xiMhEFqJU7fLe1Uwzvc6kz5qms
 iXodu/EJHWII9+IO3oKyKnpJfYn9zzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-KTTw9FRRMHOtoR5Jk2y09A-1; Tue, 11 May 2021 18:06:11 -0400
X-MC-Unique: KTTw9FRRMHOtoR5Jk2y09A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50041101371C;
 Tue, 11 May 2021 22:06:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19E32BA6F;
 Tue, 11 May 2021 22:06:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/21] qapi/parser: Use @staticmethod where appropriate
Date: Tue, 11 May 2021 18:05:48 -0400
Message-Id: <20210511220601.2110055-9-jsnow@redhat.com>
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

No self, no thank you!

(Quiets pylint warnings.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 6d774df6d0a..5ef1b8935e6 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -130,7 +130,8 @@ def reject_expr_doc(doc):
                 "documentation for '%s' is not followed by the definition"
                 % doc.symbol)
 
-    def _include(self, include, info, incl_fname, previously_included):
+    @staticmethod
+    def _include(include, info, incl_fname, previously_included):
         incl_abs_fname = os.path.abspath(incl_fname)
         # catch inclusion cycle
         inf = info
@@ -151,7 +152,8 @@ def _include(self, include, info, incl_fname, previously_included):
                 f"can't read include file '{incl_fname}': {err.strerror}"
             ) from err
 
-    def _check_pragma_list_of_str(self, name, value, info):
+    @staticmethod
+    def _check_pragma_list_of_str(name, value, info):
         if (not isinstance(value, list)
                 or any([not isinstance(elt, str) for elt in value])):
             raise QAPISemError(
-- 
2.30.2


