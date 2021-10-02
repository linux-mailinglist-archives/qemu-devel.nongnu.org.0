Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E103041FAC7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:06:20 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbuN-0000gZ-U5
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblY-00019d-KZ
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblQ-0004SC-MI
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQbKQBZrFbkbxLwMArF7uiik853Y4FbAwNCHn6ru5t0=;
 b=CsuwZRuMKZWesgoPZbx7+yZWUjO0wRDRsfQ+U2kT6A+Oax5Q+f8ruhrx/btyFfkNERHI8/
 Y4ql024dP2IrGiU6d57bh0QqOPoCSa//LgI2BmdzbYY7oyZVX6chKMb9iqgiB05dIIgyUP
 bNRA5wS9JjgM9oXYpwAb29ZwFQuihoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-HlL55dmiNgeDZHCPT36jpw-1; Sat, 02 Oct 2021 05:56:59 -0400
X-MC-Unique: HlL55dmiNgeDZHCPT36jpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BC9D800053;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40D2260C81;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DCAD1138467; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] qapi/parser: Add FIXME for consolidating JSON-related
 types
Date: Sat,  2 Oct 2021 11:56:52 +0200
Message-Id: <20211002095655.1944970-11-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

The fix for this comment is forthcoming in a future commit, but this
will keep me honest. The linting configuration in ./python/setup.cfg
prohibits 'FIXME' comments. A goal of this long-running series is to
move ./scripts/qapi to ./python/qemu/qapi so that the QAPI generator is
regularly type-checked by GitLab CI.

This comment is a time-bomb to force me to address this issue prior to
that step.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210930205716.1148693-11-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 73c1c4ef59..0265b47b95 100644
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


