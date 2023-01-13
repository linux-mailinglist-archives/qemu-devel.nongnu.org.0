Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A7066907F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:18:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFFx-0006na-Hc; Fri, 13 Jan 2023 03:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGFFu-0006nP-J5
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGFFt-0008FV-4V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673597860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KEL/lVGtOgPulRqiz7rTSkyetr8Fny9DU9Z2MY0UaSg=;
 b=X0xym+b0+hHpZ6xweIHzvWMWTTmNauSt6lFIfgkc1cyfyiWokyiqg/UJtX1Pqz1tVkq9Vp
 fX35HBDhO4FVetMj4A8RlwDd+EejHfGIxd/ccams0a2t2i60RIqd4lTSUcjana+vEPcdXb
 Y9jBRsy+voIGDE4DAoFDmy9smIHYAEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-XR5iQ-d1N2asvF9lrpGPvA-1; Fri, 13 Jan 2023 03:17:38 -0500
X-MC-Unique: XR5iQ-d1N2asvF9lrpGPvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FA4085A588;
 Fri, 13 Jan 2023 08:17:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B31B40C2064;
 Fri, 13 Jan 2023 08:17:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>
Subject: [PATCH] MAINTAINERS: Remove bouncing mail address from Kamil
 Rytarowski
Date: Fri, 13 Jan 2023 09:17:35 +0100
Message-Id: <20230113081735.1148057-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

When sending mail to Kamil's address, it's bouncing with a message
that the mailbox is full. This already happens since summer 2022,
and the last message that Kamil sent to the qemu-devel mailing list
is from November 2021 (as far as I can see), so we unfortunately
have to assume that this e-mail address is not valid anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5606e5dbd2..da4944db24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -511,7 +511,6 @@ F: target/i386/hax/
 Guest CPU Cores (NVMM)
 ----------------------
 NetBSD Virtual Machine Monitor (NVMM) CPU support
-M: Kamil Rytarowski <kamil@netbsd.org>
 M: Reinoud Zandijk <reinoud@netbsd.org>
 S: Maintained
 F: include/sysemu/nvmm.h
@@ -536,7 +535,6 @@ F: util/*posix*.c
 F: include/qemu/*posix*.h
 
 NETBSD
-M: Kamil Rytarowski <kamil@netbsd.org>
 M: Reinoud Zandijk <reinoud@netbsd.org>
 M: Ryo ONODERA <ryoon@netbsd.org>
 S: Maintained
-- 
2.31.1


