Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B43567234
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:13:06 +0200 (CEST)
Received: from localhost ([::1]:45760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8kEZ-0007kS-Nn
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8kD7-0006en-1M
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8kD3-0003L4-Jq
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657033888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MV97jy6Fysz1l2Lol+kVEpvk+zUq70h13q73QqQVPV8=;
 b=UJpo61VplBcHwq02dBbHBeEqhcrdbACQEB1XYULbUCl3uQDQmfnCjTKLTeL3hbs6OQLyR2
 6GS1osxLaDQwiCA1pGOx1nnN8gKgXI9X4wWtarwJvTz8AOW3oGee2I8DFwenYalG3sUMv9
 v5EIKgd/caIQUjIYsSL5QBkfMig5DD8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-q4uE6SJMOQ20J1wOuyaK1g-1; Tue, 05 Jul 2022 11:10:57 -0400
X-MC-Unique: q4uE6SJMOQ20J1wOuyaK1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A538E3C11E60;
 Tue,  5 Jul 2022 15:10:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2BAF140EBE4;
 Tue,  5 Jul 2022 15:10:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc/cpu-models: Remove the "default" CPU alias
Date: Tue,  5 Jul 2022 17:10:30 +0200
Message-Id: <20220705151030.662140-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU emulates a *lot* of PowerPC-based machines - having a CPU
that is named "default" and cannot be used with most of those
machines sounds just wrong. Thus let's remove this old and confusing
alias now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/ppc/cpu-models.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.c b/target/ppc/cpu-models.c
index 976be5e0d1..2667440f73 100644
--- a/target/ppc/cpu-models.c
+++ b/target/ppc/cpu-models.c
@@ -918,6 +918,6 @@ PowerPCCPUAlias ppc_cpu_aliases[] = {
 #endif
     { "ppc32", "604" },
     { "ppc", "604" },
-    { "default", "604" },
+
     { NULL, NULL }
 };
-- 
2.31.1


