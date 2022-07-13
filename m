Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C152573785
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:36:01 +0200 (CEST)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBcX1-0001Eg-UC
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBcU9-0007Wv-Eh
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 09:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBcU6-0005kZ-5Z
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 09:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657719177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sjrmbFTJhlrtJz7Gda08hiRnxQBS5Or/TvNFUUtC++A=;
 b=X5L68KCnUposcaxxgxc6Paz8gAnaCLWFwDrKNzH8mBeXOx1yNmYjFof49iOqslC+jn62pd
 VfUt7aDuc9PUt4K6u+Zytd6AnEacL16Bk1SWlztgLfG5Zj9s8/3zRONr/TXrO3lGLxrdkG
 3/69iekophfC7bfFP5p3+iJWdieG0Hc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-VeRXwlY4M62MCaIDcGgBKg-1; Wed, 13 Jul 2022 09:32:53 -0400
X-MC-Unique: VeRXwlY4M62MCaIDcGgBKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF333C0218A;
 Wed, 13 Jul 2022 13:32:52 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9667740D2962;
 Wed, 13 Jul 2022 13:32:51 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] MAINTAINERS: Add myself as Guest Agent co-maintainer
Date: Wed, 13 Jul 2022 16:32:49 +0300
Message-Id: <20220713133249.2229623-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 450abd0252..22a4ffe0a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git qapi-next
 
 QEMU Guest Agent
 M: Michael Roth <michael.roth@amd.com>
+M: Konstantin Kostiuk <kkostiuk@redhat.com>
 S: Maintained
 F: qga/
 F: docs/interop/qemu-ga.rst
-- 
2.25.1


