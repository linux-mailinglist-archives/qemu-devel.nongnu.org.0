Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A162173F3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:29:33 +0200 (CEST)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqTM-0001GW-F5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq7e-0003Hy-8h
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:07:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23842
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq7F-0006uY-0m
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594138000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78LjYMMhkKi8U8JJ8fHiimt8hNRhQEQOrO1mIcTcXso=;
 b=H3KV6mmfUhz6nSExtnBRiytkGZ1jWWV4kzRBri8lzEKd1s2ulqoBSamUtaAn5/KhAiLHtJ
 X9RU877i7ByI31p2lZzDTwKRqHLHLyYeg8jR1v7qu70UJPKzK2Wfc4U16bwNnYsfuRbUkF
 ziWDGQQbQHVU8wozVoE3OM458FEeiPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-fwKI-MZbN_yawB5C_FzbAA-1; Tue, 07 Jul 2020 12:06:38 -0400
X-MC-Unique: fwKI-MZbN_yawB5C_FzbAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28C3E8C99E2;
 Tue,  7 Jul 2020 16:06:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E819410013D7;
 Tue,  7 Jul 2020 16:06:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 733F31132922; Tue,  7 Jul 2020 18:06:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/45] error: Improve error.h's big comment
Date: Tue,  7 Jul 2020 18:05:30 +0200
Message-Id: <20200707160613.848843-3-armbru@redhat.com>
In-Reply-To: <20200707160613.848843-1-armbru@redhat.com>
References: <20200707160613.848843-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add headlines to the big comment.

Explain examples for NULL, &error_abort and &error_fatal argument
better.

Tweak rationale for error_propagate_prepend().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/error.h | 51 +++++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index e8960eaad5..6d079c58b7 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -15,6 +15,8 @@
 /*
  * Error reporting system loosely patterned after Glib's GError.
  *
+ * = Creating errors =
+ *
  * Create an error:
  *     error_setg(&err, "situation normal, all fouled up");
  *
@@ -27,6 +29,8 @@
  *     error_setg(&err, "invalid quark\n" // WRONG!
  *                "Valid quarks are up, down, strange, charm, top, bottom.");
  *
+ * = Reporting and destroying errors =
+ *
  * Report an error to the current monitor if we have one, else stderr:
  *     error_report_err(err);
  * This frees the error object.
@@ -40,6 +44,30 @@
  *     error_free(err);
  * Note that this loses hints added with error_append_hint().
  *
+ * Call a function ignoring errors:
+ *     foo(arg, NULL);
+ * This is more concise than
+ *     Error *err = NULL;
+ *     foo(arg, &err);
+ *     error_free(err); // don't do this
+ *
+ * Call a function aborting on errors:
+ *     foo(arg, &error_abort);
+ * This is more concise and fails more nicely than
+ *     Error *err = NULL;
+ *     foo(arg, &err);
+ *     assert(!err); // don't do this
+ *
+ * Call a function treating errors as fatal:
+ *     foo(arg, &error_fatal);
+ * This is more concise than
+ *     Error *err = NULL;
+ *     foo(arg, &err);
+ *     if (err) { // don't do this
+ *         error_report_err(err);
+ *         exit(1);
+ *     }
+ *
  * Handle an error without reporting it (just for completeness):
  *     error_free(err);
  *
@@ -47,6 +75,11 @@
  * reporting it (primarily useful in testsuites):
  *     error_free_or_abort(&err);
  *
+ * = Passing errors around =
+ *
+ * Errors get passed to the caller through the conventional @errp
+ * parameter.
+ *
  * Pass an existing error to the caller:
  *     error_propagate(errp, err);
  * where Error **errp is a parameter, by convention the last one.
@@ -54,11 +87,10 @@
  * Pass an existing error to the caller with the message modified:
  *     error_propagate_prepend(errp, err,
  *                             "Could not frobnicate '%s': ", name);
- *
- * Avoid
- *     error_propagate(errp, err);
+ * This is more concise than
+ *     error_propagate(errp, err); // don't do this
  *     error_prepend(errp, "Could not frobnicate '%s': ", name);
- * because this fails to prepend when @errp is &error_fatal.
+ * and works even when @errp is &error_fatal.
  *
  * Create a new error and pass it to the caller:
  *     error_setg(errp, "situation normal, all fouled up");
@@ -70,15 +102,6 @@
  *         handle the error...
  *     }
  *
- * Call a function ignoring errors:
- *     foo(arg, NULL);
- *
- * Call a function aborting on errors:
- *     foo(arg, &error_abort);
- *
- * Call a function treating errors as fatal:
- *     foo(arg, &error_fatal);
- *
  * Receive an error and pass it on to the caller:
  *     Error *err = NULL;
  *     foo(arg, &err);
@@ -86,8 +109,6 @@
  *         handle the error...
  *         error_propagate(errp, err);
  *     }
- * where Error **errp is a parameter, by convention the last one.
- *
  * Do *not* "optimize" this to
  *     foo(arg, errp);
  *     if (*errp) { // WRONG!
-- 
2.26.2


