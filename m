Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75D38B9ED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 01:02:31 +0200 (CEST)
Received: from localhost ([::1]:33014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrgV-0006py-1u
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 19:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbe-0006lV-Ng
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrbW-0005sr-Uj
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621551442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e27B2dBE6Gg2lFvyql/xMKdibU0QfvtEdFIdL5p02YM=;
 b=LEICjAUmQDyb8j+lJ4FWhByYPdJdJ3JFnUKDwMDSpx1181315xwKXKjR+NmS46PFGGexLm
 +P2cUjFe7in0EhKarrkOPR/Nqa+uyKd2ZtxvMwnAoqj5IDphRDjGPYM+2Bj9x2kmT/Yzny
 gkED7JwnNtDnD7ziZFl7p7fYH1g6Nmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-QvkswVqRN_G9afxrJmRXPQ-1; Thu, 20 May 2021 18:57:20 -0400
X-MC-Unique: QvkswVqRN_G9afxrJmRXPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D27F1854E26;
 Thu, 20 May 2021 22:57:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EB52100EBAD;
 Thu, 20 May 2021 22:57:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] qapi/parser: enable pylint checks
Date: Thu, 20 May 2021 18:57:10 -0400
Message-Id: <20210520225710.168356-7-jsnow@redhat.com>
In-Reply-To: <20210520225710.168356-1-jsnow@redhat.com>
References: <20210520225710.168356-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>

---

This can be merged with the previous commit, if desired.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index c5275d5f59b..1a633b2b88e 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -2,8 +2,7 @@
 
 # Add files or directories matching the regex patterns to the ignore list.
 # The regex matches against base names, not paths.
-ignore-patterns=parser.py,
-                schema.py,
+ignore-patterns=schema.py,
 
 
 [MESSAGES CONTROL]
-- 
2.30.2


