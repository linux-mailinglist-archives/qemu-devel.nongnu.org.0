Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16844BB9A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 07:21:28 +0100 (CET)
Received: from localhost ([::1]:32940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkgz9-0007nc-4K
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 01:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgwx-0006MJ-QH
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkgwu-0004M3-BN
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 01:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636525146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5X+Mpne95TTddnRxsg0+eoO0Q/YrS/JJ+Drx31oVPI=;
 b=Zd5yvQ5R2pAoYm9n7vLbhWAiuzPbndFTnfj4NYgIZqpn39SPedeJuX8yYWJIV8vIp4kyZK
 e6xSTaTYMoVESEagQ2OaQuNop2Lf28CD8yw2VGkUDXPy0NcBkk3fnfixqv55RRxWXtc0DV
 Qz/+12bYibCu/euZbBEnAwq6SfDjw7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-UHBKLYMeP2SnRLRrpxhV8g-1; Wed, 10 Nov 2021 01:19:05 -0500
X-MC-Unique: UHBKLYMeP2SnRLRrpxhV8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DEE480A5C8;
 Wed, 10 Nov 2021 06:19:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 085B85C1D5;
 Wed, 10 Nov 2021 06:19:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FA7E11380AA; Wed, 10 Nov 2021 07:19:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] docs/devel/qapi-code-gen: Drop a duplicate paragraph
Date: Wed, 10 Nov 2021 07:19:00 +0100
Message-Id: <20211110061902.2483109-2-armbru@redhat.com>
In-Reply-To: <20211110061902.2483109-1-armbru@redhat.com>
References: <20211110061902.2483109-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 55ec69f8b1 "docs/devel/qapi-code-gen.txt: Update to new rST
backend conventions" accidentally duplicated a paragraph.  Drop it.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211026111023.76937-2-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 38f2d7aad3..b5761f60cd 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1000,12 +1000,6 @@ multiline argument descriptions.
 A 'Since: x.y.z' tagged section lists the release that introduced the
 definition.
 
-The text of a section can start on a new line, in
-which case it must not be indented at all.  It can also start
-on the same line as the 'Note:', 'Returns:', etc tag.  In this
-case if it spans multiple lines then second and subsequent
-lines must be indented to match the first.
-
 An 'Example' or 'Examples' section is automatically rendered
 entirely as literal fixed-width text.  In other sections,
 the text is formatted, and rST markup can be used.
-- 
2.31.1


