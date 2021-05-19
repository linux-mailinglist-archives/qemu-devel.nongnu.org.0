Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8F43895F3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:58:52 +0200 (CEST)
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRP9-0005CW-35
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR7G-00064Z-B4
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR6z-00021o-Lv
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FU4XspzLRiY8Y54MOfT8KSbc5TquWno86xK6eyBoFc4=;
 b=iMP+ztJef4H5t/Ca+m/nCoYRTsYXHb3JBQN8Yf3bFldp2cd1t+pstu8EZq4lK6a5kO1dqm
 AmMgmw3FCLBF7TdICKrowm0UYOVvinNvGmNe7HI+1Tw53XJ5tDTDJeKkkSNsLHZHoEzn/2
 XZ0/TANlP4VzJV9DuRjo2emBt5I33ZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26--ct56z9RMUuEz6UdPvf1CA-1; Wed, 19 May 2021 14:40:02 -0400
X-MC-Unique: -ct56z9RMUuEz6UdPvf1CA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34A9480ED91;
 Wed, 19 May 2021 18:40:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7507E5944C;
 Wed, 19 May 2021 18:40:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/15] qapi/parser: Use @staticmethod where appropriate
Date: Wed, 19 May 2021 14:39:44 -0400
Message-Id: <20210519183951.3946870-9-jsnow@redhat.com>
In-Reply-To: <20210519183951.3946870-1-jsnow@redhat.com>
References: <20210519183951.3946870-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No self, no thank you!

(Quiets pylint warnings.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 4959630ce64..7c718661950 100644
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


