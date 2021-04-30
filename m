Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC336FAD8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:46:18 +0200 (CEST)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSXB-0006Mc-U4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdh-00037u-M4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcRdX-0007cW-SI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619783326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUrr7xlM4q9cZFthCQUZLMCa2hMQaEW2oGNCSJDPoLU=;
 b=KSFK6Yn7zD6z8dOUxkgFavq+0b5/sD5hF5iCCioZPEXi+rBnJy66JwHo8mDusZLJkjsqSK
 SGIx8ylnqZfX+PRs5hOMqnooUWEFa9LZkXccTJHS3gIbOvs0g1AlQ075pl5NUHXcMAds+2
 Dm2oF6odrCuxRqAzA28XRiFPdDRY910=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-33bMOSaTP1agqPfRfrp6HA-1; Fri, 30 Apr 2021 07:48:44 -0400
X-MC-Unique: 33bMOSaTP1agqPfRfrp6HA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CB8C18B9EA1;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B275D9D7;
 Fri, 30 Apr 2021 11:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ADBF911268B3; Fri, 30 Apr 2021 13:48:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] qapi/expr: Update authorship and copyright information
Date: Fri, 30 Apr 2021 13:48:30 +0200
Message-Id: <20210430114838.2912740-18-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
References: <20210430114838.2912740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210421182032.3521476-18-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/expr.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 225a82e20d..496f7e0333 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -1,13 +1,14 @@
 # -*- coding: utf-8 -*-
 #
 # Copyright IBM, Corp. 2011
-# Copyright (c) 2013-2019 Red Hat Inc.
+# Copyright (c) 2013-2021 Red Hat Inc.
 #
 # Authors:
 #  Anthony Liguori <aliguori@us.ibm.com>
 #  Markus Armbruster <armbru@redhat.com>
 #  Eric Blake <eblake@redhat.com>
 #  Marc-André Lureau <marcandre.lureau@redhat.com>
+#  John Snow <jsnow@redhat.com>
 #
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
-- 
2.26.3


