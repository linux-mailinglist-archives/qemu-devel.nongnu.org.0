Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE10C41DAFC
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:28:11 +0200 (CEST)
Received: from localhost ([::1]:48636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVw6c-0001NI-TG
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw2f-0007kz-7H
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:24:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVw2c-0006Av-7C
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633008241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lGhYz/PP30eqX3Eqj0SHD1eVWfklz38zYEhdkcz+V4=;
 b=IC0uhpP1ZAZjCmxXm/RIIEI1u084VSfMAflVcFMno20BxmUHWdiJp9SV9ipQRvURH7VrLC
 JmEqeFzYbBspFpe1SByMdvt/6ARkKdmsyT+lYbBPgCx8ocTDh4/5hivHMcaH6EtEkQIP/u
 B/QtFFkB1I+uQ6Z2/mLnVIWhyXCx6fE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-y_6jW03KOAOi9yNCozkZ7w-1; Thu, 30 Sep 2021 09:24:00 -0400
X-MC-Unique: y_6jW03KOAOi9yNCozkZ7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF38C1084683;
 Thu, 30 Sep 2021 13:23:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA8E5D9C6;
 Thu, 30 Sep 2021 13:23:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] docs/devel: rename file for writing monitor commands
Date: Thu, 30 Sep 2021 14:23:31 +0100
Message-Id: <20210930132349.3601823-2-berrange@redhat.com>
In-Reply-To: <20210930132349.3601823-1-berrange@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file already covers writing HMP commands, in addition to
the QMP commands, so it deserves a more general name.

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


