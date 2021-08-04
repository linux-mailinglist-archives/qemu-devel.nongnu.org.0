Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E233DF915
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 02:58:10 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB5EX-0002eQ-QJ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 20:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5Cw-0000Ty-Oa
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5Ct-0006iR-JW
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628038586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bUliIYPptmdoWbIjjqTnA9dyMbDEUVKrNE9j8OFIuG0=;
 b=TtqfTDSrdhvHpv3VjdXWuu3syrpt1vNrYKudj30jWU3l24YYGA8sO+I5FGCBpwctibQcDw
 McuCB0F5ueVUDE+7gGFz49miKDub3PiRdBAPCJROtkzhokechfTcyM93wAQfBqRzSP3N5y
 OvYPTJqWR0nbizCnI/sewh85Xl1xTkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-bZVz6nqnMZayCVRjc-5q3A-1; Tue, 03 Aug 2021 20:56:25 -0400
X-MC-Unique: bZVz6nqnMZayCVRjc-5q3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B6D760C1;
 Wed,  4 Aug 2021 00:56:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA905D9DC;
 Wed,  4 Aug 2021 00:56:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] docs/devel: create "Developing QEMU" subsection
Date: Tue,  3 Aug 2021 20:56:17 -0400
Message-Id: <20210804005621.1577302-3-jsnow@redhat.com>
In-Reply-To: <20210804005621.1577302-1-jsnow@redhat.com>
References: <20210804005621.1577302-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/index.rst               |  6 +-----
 docs/devel/section-development.rst | 12 ++++++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)
 create mode 100644 docs/devel/section-development.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f32883da8ed..3cdfb786f1a 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -10,9 +10,7 @@ modifying QEMU's source code.
    :includehidden:
 
    section-community-governance
-   build-system
-   style
-   kconfig
+   section-development
    testing
    fuzzing
    control-flow-integrity
@@ -20,11 +18,9 @@ modifying QEMU's source code.
    memory
    migration
    atomics
-   stable-process
    ci
    qtest
    decodetree
-   secure-coding-practices
    tcg
    tcg-icount
    tracing
diff --git a/docs/devel/section-development.rst b/docs/devel/section-development.rst
new file mode 100644
index 00000000000..bba4fea30cb
--- /dev/null
+++ b/docs/devel/section-development.rst
@@ -0,0 +1,12 @@
+Developing QEMU
+===============
+
+.. toctree::
+   :maxdepth: 2
+   :includehidden:
+
+   build-system
+   kconfig
+   style
+   secure-coding-practices
+   stable-process
-- 
2.31.1


