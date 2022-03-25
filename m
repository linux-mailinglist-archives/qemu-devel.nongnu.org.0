Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1C4E7AFD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:18:01 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsFs-0002zt-GP
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:18:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXsEB-0000aO-Ju
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXsE9-0003tR-No
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 18:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648246572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XRNxmbUhJWKN1jF+uq5vWOy7aaQR4MdOVnjAV21+9e8=;
 b=dLm9vIf+2TSA50CdjeyEpkemonpKO4VdUUPWzDYguhpdZYdJLBXK4ZmOj8RGfsjthR7am+
 9oOhGfG6Hb1gtp7hGIqJ3daXPZmNHe865PY3wuIaxYwXlTb9ZCc8qAVhPkfTdWyFGPF1IL
 haEHR4DjgOuWMBtKnBszPTW305jSVao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-RSjxJHpBMTKySmuOgdYXgw-1; Fri, 25 Mar 2022 18:16:11 -0400
X-MC-Unique: RSjxJHpBMTKySmuOgdYXgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB6999219A4
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 22:16:10 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5232A40CF8EC;
 Fri, 25 Mar 2022 22:16:07 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] schemas: add missing vim modeline
Date: Fri, 25 Mar 2022 23:16:05 +0100
Message-Id: <20220325221605.53995-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the last qapi schema that is missing the modeline.
Fixes 7e7237cd2b "schemas: add missing vim modeline"

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/pragma.json | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index 3bc0335d1f..e6a021c19c 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -1,3 +1,6 @@
+# -*- Mode: Python -*-
+# vim: filetype=python
+
 { 'pragma': { 'doc-required': true } }
 
 # Whitelists to permit QAPI rule violations; think twice before you
-- 
2.35.1


