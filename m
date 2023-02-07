Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB968D1DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJm0-0000OQ-Lt; Tue, 07 Feb 2023 03:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPJly-0000Ng-GC
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pPJlw-0006GU-Ox
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675760175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HII/mtLpoKfGoz7O6wmTDz3dczLmlHx/WthvDDojFMU=;
 b=d3jSoRVnkP4jIp7yI+FUS8avtA7I/7aYB85gOZNfAM0xFQnQ8LL58iAScDw9S8w7XDEIj1
 Q5z6mvUmPNejVdRgi1XsCAwYlhydGhZw3oc+gUXQ/CIgGBMUngSO3yh5C4OyHT4WgDkzoh
 o/eG+QfXTGywu5wNh6ysstTbJsXgYT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-JCr4uHdhM42chHJQe35Vvw-1; Tue, 07 Feb 2023 03:56:14 -0500
X-MC-Unique: JCr4uHdhM42chHJQe35Vvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F32A5877CA1
 for <qemu-devel@nongnu.org>; Tue,  7 Feb 2023 08:56:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3362D40398A0;
 Tue,  7 Feb 2023 08:56:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] MAINTAINERS: add myself to ui/ and audio/
Date: Tue,  7 Feb 2023 12:56:10 +0400
Message-Id: <20230207085610.1033536-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Helping out with patch review & queue handling.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..337a7d8857 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2478,6 +2478,7 @@ Subsystems
 ----------
 Overall Audio backends
 M: Gerd Hoffmann <kraxel@redhat.com>
+M: Marc-André Lureau <marcandre.lureau@redhat.com>
 S: Odd Fixes
 F: audio/
 X: audio/alsaaudio.c
@@ -2772,6 +2773,7 @@ F: docs/spice-port-fqdn.txt
 
 Graphics
 M: Gerd Hoffmann <kraxel@redhat.com>
+M: Marc-André Lureau <marcandre.lureau@redhat.com>
 S: Odd Fixes
 F: ui/
 F: include/ui/
-- 
2.39.1


