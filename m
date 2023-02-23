Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E022D6A0886
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:24:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdT-0002zA-1m; Thu, 23 Feb 2023 07:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdL-0002xP-DW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdJ-0003y5-Dr
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyu6YRyEOUXaV4fK7gqaAe9zNh4cqpHxZJP8Pogb7yk=;
 b=OkrGC2dP6OsG+/7uPh8chh/9k6fJtV6YXuUVpUuQZMrrtSXGhblswm1/ZidVBTCAisuG/z
 GmbW1hOTgWfWogKXtL9/7Vj1fhG/39dwUwPBnD+3ahmjxEQo9RVg5AdKTykLwqQiQmPe2D
 ZhSIt8pOcSwWGKtwbgQ7VYyFbW+q+UU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-kP8mQkiROVOLVknnlp94ig-1; Thu, 23 Feb 2023 07:23:29 -0500
X-MC-Unique: kP8mQkiROVOLVknnlp94ig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5DBE2A59544;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A16E22166B2B;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8569421E6A20; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 1/8] docs/devel/qapi-code-gen: Belatedly update features
 documentation
Date: Thu, 23 Feb 2023 13:23:20 +0100
Message-Id: <20230223122327.1920247-2-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 013b4efc9be "qapi: Add feature flags to remaining
definitions" (v5.0.0), commit 84ab0086879 "qapi: Add feature flags to
struct members" (v5.0.0), and commit b6c18755e41 "qapi: Add feature
flags to enum members" (v6.2.0) neglected to update section
"Features".  Make up for that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230213132009.918801-2-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 5edc49aa74..566640edf8 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -685,9 +685,10 @@ change in the QMP syntax (usually by allowing values or operations
 that previously resulted in an error).  QMP clients may still need to
 know whether the extension is available.
 
-For this purpose, a list of features can be specified for a command or
-struct type.  Each list member can either be ``{ 'name': STRING, '*if':
-COND }``, or STRING, which is shorthand for ``{ 'name': STRING }``.
+For this purpose, a list of features can be specified for definitions,
+enumeration values, and struct members.  Each feature list member can
+either be ``{ 'name': STRING, '*if': COND }``, or STRING, which is
+shorthand for ``{ 'name': STRING }``.
 
 The optional 'if' member specifies a conditional.  See `Configuring
 the schema`_ below for more on this.
-- 
2.39.0


