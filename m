Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2F3E4D15
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 21:30:18 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDAyX-0001L7-2M
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 15:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mDAxe-0000fz-HC
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:29:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mDAxa-0007WZ-Ui
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 15:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628537357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zkdJhDnh+fP2QycBwUZELXeUQ5g2sq8wOfXNbOT8tW0=;
 b=P5N6Zl1d61NX2pl8tj2e5Ooe6lMwk9audIP+jUMQE4jJoTVyhju58IfyZPYgUG5FRTSQaV
 4cW765sKZKGOZeIAYDsNcEQO/8GaQ1vbwAoSvSfQkaJ2UODIwHB0VOZihGe19gQ0yrslf+
 MsxP9xNJdqUI48vB9zz6hbnS7rdw+o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-7ItqzJLJMa2b1OiRZvga9w-1; Mon, 09 Aug 2021 15:29:14 -0400
X-MC-Unique: 7ItqzJLJMa2b1OiRZvga9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17EAD1006C80
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 19:29:14 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.16.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5700D1B4B8;
 Mon,  9 Aug 2021 19:29:09 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Acceptance tests: add myself as a reviewer for the acceptance
 tests.
Date: Mon,  9 Aug 2021 16:29:07 -0300
Message-Id: <20210809192907.42138-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e442..3f8ad63165 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3422,6 +3422,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
+R: Willian Rampazzo <willianr@redhat.com>
 S: Odd Fixes
 F: tests/acceptance/
 
-- 
2.31.1


