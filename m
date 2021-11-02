Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719824434FC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:00:22 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy57-0002nY-AL
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2f-000054-S9
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2d-0006pe-VK
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCwf820CQrgls4czSXlYbRhYggK/jwWM+sJcCr6rceQ=;
 b=Iss6uWcXxV0YnNX2ekYxoWkES+k2A/REDFAk0gWfkFJ4tDHCPuJZ1nXK16L3fESXfODn8G
 a/5BNuv5rr1DoFX/PQrJhQVJYiRadFCae8vFx1QY2/byLDDVrT3CFIbADmBcPdYfNBhnp6
 184Uomg5AnjjlggWCJKOP2WCuIqUDgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Rat1l6nDNnCrMN3ngua5Hw-1; Tue, 02 Nov 2021 13:57:44 -0400
X-MC-Unique: Rat1l6nDNnCrMN3ngua5Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A1F8A40C0;
 Tue,  2 Nov 2021 17:57:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13E5119C59;
 Tue,  2 Nov 2021 17:57:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/18] docs/devel: rename file for writing monitor commands
Date: Tue,  2 Nov 2021 17:56:45 +0000
Message-Id: <20211102175700.1175996-4-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file already covers writing HMP commands, in addition to
the QMP commands, so it deserves a more general name.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/index.rst                                        | 2 +-
 ...riting-qmp-commands.rst => writing-monitor-commands.rst} | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename docs/devel/{writing-qmp-commands.rst => writing-monitor-commands.rst} (99%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3e..7c25177c5d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -44,4 +44,4 @@ modifying QEMU's source code.
    ebpf_rss
    vfio-migration
    qapi-code-gen
-   writing-qmp-commands
+   writing-monitor-commands
diff --git a/docs/devel/writing-qmp-commands.rst b/docs/devel/writing-monitor-commands.rst
similarity index 99%
rename from docs/devel/writing-qmp-commands.rst
rename to docs/devel/writing-monitor-commands.rst
index 6a10a06c48..4a4c051624 100644
--- a/docs/devel/writing-qmp-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -1,8 +1,8 @@
-How to write QMP commands using the QAPI framework
-==================================================
+How to write monitor commands
+=============================
 
 This document is a step-by-step guide on how to write new QMP commands using
-the QAPI framework. It also shows how to implement new style HMP commands.
+the QAPI framework and HMP commands.
 
 This document doesn't discuss QMP protocol level details, nor does it dive
 into the QAPI framework implementation.
-- 
2.31.1


