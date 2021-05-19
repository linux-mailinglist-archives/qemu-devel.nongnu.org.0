Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5710138968F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:23:50 +0200 (CEST)
Received: from localhost ([::1]:52886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRnJ-0004Ax-BF
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR7O-0006CL-3C
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljR78-00025O-HO
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621449613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QEcYwPpiAdzGnQtGtm+YvWw/XHUAr6+X1gfe0OtI4w=;
 b=BUDpdAKQZpRP02PXJZOmpg/Ml8XEN4FXUPCZg32nWDBl4UdhaiG6mcdE2htIqr8wSoqv7r
 iniSZ8bhsGNlRkIbJ6rxrrfgfQdq3xj/X98pPWVizdjhckqWwjqv2PHCdx37fnvmjlU6EZ
 Ruz7U45c/9YfU5QtZ+KRUDuJ7m0WQQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-w66oqIL3Muu5B1qwVnkNMQ-1; Wed, 19 May 2021 14:40:12 -0400
X-MC-Unique: w66oqIL3Muu5B1qwVnkNMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3613480ED96;
 Wed, 19 May 2021 18:40:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DD0350FA2;
 Wed, 19 May 2021 18:40:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] qapi/parser: allow 'ch' variable name
Date: Wed, 19 May 2021 14:39:50 -0400
Message-Id: <20210519183951.3946870-15-jsnow@redhat.com>
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

We can have a two-letter variable name, as a treat.

Signed-off-by: John Snow <jsnow@redhat.com>

--

I don't want to use 'chr' or 'char', and in context 'ch' works well
enough. I will assume that any possible future uses will also be obvious
enough.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 88efbf71cb2..c5275d5f59b 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -43,6 +43,7 @@ good-names=i,
            _,
            fp,  # fp = open(...)
            fd,  # fd = os.open(...)
+           ch,
 
 [VARIABLES]
 
-- 
2.30.2


