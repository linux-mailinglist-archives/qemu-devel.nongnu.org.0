Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E941741E307
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 23:07:55 +0200 (CEST)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW3HW-0003Qf-Uf
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 17:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37Z-0007BW-Hc
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mW37W-00009g-7O
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 16:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633035453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVw3YUIVL0AjNH5KmB6MOM66HR2FeG7OGEMMKcDp76U=;
 b=BZYbNgc6AQ92rJXdEpHYiExcvtcqZsmP+NHeKTTusLB6mQk58nU4RMge1vbm7poy62ex8p
 kU7tUSXuGAOVXjWjIeAXRA5XazArm7SKC43OawEAfQnQqACha7MQ2kd99wzEccJoCplqg8
 HkMXXsv3dyqZSeTqQ0MwfE2QezkkhOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-5VQOdkZrN26WjGeXesqnUw-1; Thu, 30 Sep 2021 16:57:32 -0400
X-MC-Unique: 5VQOdkZrN26WjGeXesqnUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CD418A0760;
 Thu, 30 Sep 2021 20:57:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2DEB60936;
 Thu, 30 Sep 2021 20:57:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] qapi/parser: Add FIXME for consolidating
 JSON-related types
Date: Thu, 30 Sep 2021 16:57:13 -0400
Message-Id: <20210930205716.1148693-11-jsnow@redhat.com>
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

The fix for this comment is forthcoming in a future commit, but this
will keep me honest. The linting configuration in ./python/setup.cfg
prohibits 'FIXME' comments. A goal of this long-running series is to
move ./scripts/qapi to ./python/qemu/qapi so that the QAPI generator is
regularly type-checked by GitLab CI.

This comment is a time-bomb to force me to address this issue prior to
that step.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 73c1c4ef599..0265b47b955 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -43,6 +43,10 @@
 # Return value alias for get_expr().
 _ExprValue = Union[List[object], Dict[str, object], str, bool]
 
+# FIXME: Consolidate and centralize definitions for TopLevelExpr,
+# _ExprValue, _JSONValue, and _JSONObject; currently scattered across
+# several modules.
+
 
 class QAPIParseError(QAPISourceError):
     """Error class for all QAPI schema parsing errors."""
-- 
2.31.1


