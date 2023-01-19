Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345746734E1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR1V-0002MV-7I; Thu, 19 Jan 2023 04:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIR1S-0002Lc-LZ
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIR1R-0004uC-48
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674119748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDmT8K2YJ+0IKG72RlHydpIesyvfCZ8sWoZZP5kAFig=;
 b=aWvei5C/y66o3p9cHJUiVkmc+1znw4pzpDbdwVrBqY2lUSAZXsSlsd2Q6UgMSPF4bTvzPV
 TO/jGlp3GnrklPXlouXewol9l792C3F9pHS+Z8XsaXoTHkeQkOngZ0nF6rVNtnSE9i24Vt
 tMfEsS1RUlbAy9qG92wUXXl1zdlI/ms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-5qpw14gaOsekgihCxPEgqw-1; Thu, 19 Jan 2023 04:15:46 -0500
X-MC-Unique: 5qpw14gaOsekgihCxPEgqw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A15EA101A52E;
 Thu, 19 Jan 2023 09:15:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C4C492C14;
 Thu, 19 Jan 2023 09:15:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5399B21E6806; Thu, 19 Jan 2023 10:15:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH 1/2] MAINTAINERS: Cover userfaultfd
Date: Thu, 19 Jan 2023 10:15:44 +0100
Message-Id: <20230119091545.3116376-2-armbru@redhat.com>
In-Reply-To: <20230119091545.3116376-1-armbru@redhat.com>
References: <20230119091545.3116376-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Commit 0e9b5cd6b2 "migration: introduce UFFD-WP low-level interface
helpers" added util/userfaultfd.c without covering it in MAINTAINERS.
Add it to section "Migration".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fe50d01e3..0dfdf71d48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3089,6 +3089,7 @@ S: Maintained
 F: hw/core/vmstate-if.c
 F: include/hw/vmstate-if.h
 F: include/migration/
+F: include/qemu/userfaultfd.h
 F: migration/
 F: scripts/vmstate-static-checker.py
 F: tests/vmstate-static-checker-data/
@@ -3096,6 +3097,7 @@ F: tests/qtest/migration-test.c
 F: docs/devel/migration.rst
 F: qapi/migration.json
 F: tests/migration/
+F: util/userfaultfd.c
 
 D-Bus
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
-- 
2.39.0


